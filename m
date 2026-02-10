Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8F8EEA3F3A
	for <webhook@archiver.kernel.org>; Tue, 10 Feb 2026 10:45:13 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17054.1770720310992863108
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Feb 2026 02:45:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=Z1kM70Ya;
 spf=pass (domain: smile.fr, ip: 209.85.221.48, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-43626796202so542963f8f.3
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Feb 2026 02:45:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1770720309; x=1771325109; darn=lists.openembedded.org;
        h=in-reply-to:references:subject:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L7iLTIECETeV17LK1xTeEux7GvFmo2um+GHPs5ERiLY=;
        b=Z1kM70Ya7Xd+ncx+jgdYSZzsTUefndp0iLhdQW7wfOwOV5RRQ23D4OZnvPX+pm68Q6
         yBsWTtiOI4aTi8PgZhdNlIdvmhFU8xSdW2GpxhkeLsU2PI5Qm9rw/v730A7Sl29eu0ov
         hj2M22gFDEG8cXYo2he5GgZuH/ze2SJ7lVcLs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770720309; x=1771325109;
        h=in-reply-to:references:subject:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=L7iLTIECETeV17LK1xTeEux7GvFmo2um+GHPs5ERiLY=;
        b=oaUMPCmL0sMiBvdbt+jpw+brUiXQ/jFZ+Ze2+J3rICs1R6JxexJARbaid6WimNj4Q1
         HfRsnMKxkRzXRzJUkYB0Q9Exz0bwWusIJkfxoO25iY3goK+Vh4u13LgcicBTUmGEIfZp
         avFDT5mkTAzDHqGl6XOYcRMgmdPTy3YEEyQ+5Wh2VvXYdJb1OTo7j/Jg81dXmH2zWYTA
         HewbKpqk0CFpoFppsSsn+f67mp1iddk+N5UaqChDnfo/jaZsYoep2GAbR9LTRyfg1PXE
         rM18kFXrVqM7rQiZa1fTiR4n5FaHdbnkWriy43Y+sxTC4dE+h82H050IHvc9hfFTyMkR
         ewwA==
X-Forwarded-Encrypted: i=1; AJvYcCW5kJgrgU0LqMfqGPvmrx6gsAum8tlDpFCtHyYWJvazkAT7T9qnr9PXlaQIYQSq6j4BzzlbGWGdj8KXB/XyFw0R5Q==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yz9GO3Np4pPMYoZ/sL8tfMxVxzA92CTrFpzoUwn5N4HJu1HxF3s
	jMFFuOqzELqAuYT/stLiDrM1JRNKb1CNt7EkeY2drn5o/jKevoxFBQeXoWg7V8qUVZw=
X-Gm-Gg: AZuq6aJr/1eoK/57OUdnlSkOn/TtlvrA9iFVuPRDk21gBo7PT1YsXbSBAuRb0FymF82
	KILX0HZLwA2TKIly4bI1flxLYBwZJrAwI6B1NwZDqRv03BUVOdRMlS4csHTHPGRWOwHGwR4wtDe
	AlZ9kDP1ZLF3UERWet6feb7C6BhxDOVTD9+unV4WbFXCGfAvrB3oLiWQWl4QxNYkV+3ff7h/LCd
	Hc3nVk6ud1eInDeXiIB3FzWP6WP3OXdYswinyMRGUfIvns0MsPo4TKY1NmDGdzw3sgUGmhDyjvt
	HhNbd96asG14f+yN3YjlfLRihNpvxXkflEhQyMSmjBz67WJGzP3ECdPsUyj6th5oGm7srr3jt9P
	qdpWmVAzWJ8ox+HNQvoOJeHl1oPMo3L6ywLNVgIYndymNFEPqVfgELviOIe4YX48lGiG8pLs6lY
	WVy88yPta7TRZfbgUNOTrtcMCOVzEOxWoPsRvy+z5oAs/+M7v/ipzWdXfddDjdc3mnF2YUoSTQw
	oCQ/5v6COLWxqtN
X-Received: by 2002:a5d:5887:0:b0:437:6ec2:b110 with SMTP id ffacd0b85a97d-4376ec2b331mr9943391f8f.52.1770720308998;
        Tue, 10 Feb 2026 02:45:08 -0800 (PST)
Received: from localhost (2a01cb001331aa00c483744cb4924df7.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:c483:744c:b492:4df7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4376bd5a074sm15806549f8f.11.2026.02.10.02.45.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Feb 2026 02:45:08 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 10 Feb 2026 11:45:08 +0100
Message-Id: <DGB7YNPSKQW0.1YC6ZWGI866YV@smile.fr>
From: "Yoann Congal" <yoann.congal@smile.fr>
To: "Paul Barker" <paul@pbarker.dev>,
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][scarthgap 16/25] zlib: ignore CVE-2026-22184
X-Mailer: aerc 0.20.0
References: <cover.1770626074.git.yoann.congal@smile.fr>
 <52cbace519c5d490a83550d7baa1c0fa200eafcb.1770626074.git.yoann.congal@smile.fr> <296efb168208e46298830f4af5f37b7cfb3ecfa3.camel@pbarker.dev>
In-Reply-To: <296efb168208e46298830f4af5f37b7cfb3ecfa3.camel@pbarker.dev>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Feb 2026 10:45:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230882

On Mon Feb 9, 2026 at 11:49 AM CET, Paul Barker wrote:
> On Mon, 2026-02-09 at 10:28 +0100, Yoann Congal via
> lists.openembedded.org wrote:
>> From: Peter Marko <peter.marko@siemens.com>
>>=20
>> This is CVE for example tool contrib/untgz.
>> This is not compiled in Yocto zlib recipe.
>>=20
>> This CVE has controversial CVSS3 score of 9.8.
>>=20
>> Signed-off-by: Peter Marko <peter.marko@siemens.com>
>> Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
>> ---
>>  meta/recipes-core/zlib/zlib_1.3.1.bb | 1 +
>>  1 file changed, 1 insertion(+)
>>=20
>> diff --git a/meta/recipes-core/zlib/zlib_1.3.1.bb b/meta/recipes-core/zl=
ib/zlib_1.3.1.bb
>> index e6a81ef7898..8ebc6befc2b 100644
>> --- a/meta/recipes-core/zlib/zlib_1.3.1.bb
>> +++ b/meta/recipes-core/zlib/zlib_1.3.1.bb
>> @@ -48,3 +48,4 @@ BBCLASSEXTEND =3D "native nativesdk"
>> =20
>>  CVE_STATUS[CVE-2023-45853] =3D "not-applicable-config: we don't build m=
inizip"
>>  CVE_STATUS[CVE-2023-6992] =3D "cpe-incorrect: this CVE is for cloudflar=
e zlib"
>> +CVE_STATUS[CVE-2026-22184] =3D "not-applicable-config: vulnerable file =
is not compiled"
>
> I think we should consider backporting 119b775b36df ("zlib: Add
> CVE_PRODUCT to exclude false positives") and the relevant bits of
> 73ee9789183a ("recipes: cleanup CVE_STATUS which are resolved now"),
> then we can cherry-pick b0592c51b6ad from master.

Since everything is in whinlatter, I've done that: 3 commits at
https://git.openembedded.org/openembedded-core-contrib/commit/?h=3Dstable/s=
carthgap-nut&id=3Dee55482f572f13b7194baa0eabc771ceef275a4b

>
> Best regards,

--=20
Yoann Congal
Smile ECS


