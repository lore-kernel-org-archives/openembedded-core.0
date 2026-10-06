Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72AB0CA5FFC
	for <webhook@archiver.kernel.org>; Tue,  6 Oct 2026 20:31:43 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4761.1791318696162428588
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Oct 2026 13:31:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=uFYdZoaX;
 spf=pass (domain: smile.fr, ip: 209.85.128.45, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a16aaf2067so37795895e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 06 Oct 2026 13:31:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1791318694; x=1791923494; darn=lists.openembedded.org;
        h=in-reply-to:references:subject:to:cc:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=hjgrw1MMMzOAdBqijv3ui1oodlV9mcHHv3GVwifr/do=;
        b=uFYdZoaXkRgd9a6nNH5ILZgBzfhU2yz6AhF5My8URE92+RTFg/1dbUIeIM6mUvOdho
         A7KK7rWXuQQN+DKMP6oOIvAinE6MRFnopdrKWQW3FiyPr0fRyDvyg0OYE+4zoSMvR17z
         q2LnKI9XoBrPQb7y+tPPicaNxQIxhs16KxsOA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791318694; x=1791923494;
        h=in-reply-to:references:subject:to:cc:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hjgrw1MMMzOAdBqijv3ui1oodlV9mcHHv3GVwifr/do=;
        b=Hive0G21MKobIhJtw5ZTp8pep7Nt8JQnQbTHHhkiaMtPz5QLsyvoG+s3DEWeWNYqtK
         WTjijL8XRzKJhh0lr7oQ2hYJGuYYEfbpoeaU7CO2ERlARbodjc8B+LVsXlo7ZnjPJXzP
         cYf6IGflooutfgpYoDjxSXsvweymc7aUClyG7e9xxcXqcDcx+Dfgr7ekJAvZiFUVTU6r
         oAculMVeJOL+FNPQ6axGbBZdQYTwdtn5yna/6XggCccF1R7/EfblA62nK/146ZtFlN1g
         OMn4pyk4k40/eksPWRwLYx5sjkhk0zaUCGISMlauomjcRQ+Jqw5J+qYkeNVkXC4ste8j
         MIxg==
X-Gm-Message-State: AFuF++mbUObbNkJMQcJ2oQxeMlQwgNcrXUlE4knarxwUcfhJFAdqJHY5
	W4Jh6DktqduMNZN/JO2e5CsFzjBaNX4Sg/UKbvOn0C6a/kopfh491XWYOk4VYjyovkdgw2CICrG
	4y01j93o=
X-Gm-Gg: AYBFou3UZqHqpPYmDs1ePskmZU9KMRHiamaccZFI9X+I1wQHaHGJBEPqDzYgIbQsyuG
	iAkM3UEjOhOLyt90QVU/KJH+a48QALPsxzvT1iaEO+kleS3W8Yi5UKlnPiVnG/twoMBNtf4EY/E
	xoABPofGb8Zk5oLGE8g0hzeHHJe0K+TtMLMVYSpqK3K5OE1Vtk7uBDDvFy5X2fCJJzIFUc7DzHg
	JFsSkGxcQhKb4yGGsGNi2Lf9UFcbgxDzu8E33V54uAV3+MnYENAT2IQFcAGMRWgQzVnJeSb7aeV
	7f1fwAozvJMX/jl7PaENlXAZl7Z699uxlRw6aYVcGOLcuxCkT4/P18bpGmEneYr+XjsEy2+D6Db
	0LpNq1eTAWaqWTt1bZdHN822bGhR1Spcs/f6SGvzRE2lRrVf4mOcyLOs5y5Naa1F6qaVAHSkIsD
	2RW8oGOpu4gLtxShg/vRzjezDk+t8Dm9K8ntRswJeg8NaV3wYtlr7+FHpz+c0IchSI8K7n38iD4
	kCnO8vl3FcvnB4iMec1/nF2af+luOe7TNFM7ulhMlCXBoLj6tqL8nMT9ucQoQ==
X-Received: by 2002:a05:600c:8b64:b0:4a1:6dc3:f5e2 with SMTP id 5b1f17b1804b1-4a180650499mr220505e9.33.1791318694422;
        Tue, 06 Oct 2026 13:31:34 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18041edd9sm545685e9.5.2026.10.06.13.31.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Oct 2026 13:31:33 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 06 Oct 2026 22:31:30 +0200
Message-Id: <DLY1HA0PQGXN.3511IDD9TO3BL@smile.fr>
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: <openembedded-core@lists.openembedded.org>
To: "Denys Dmytriyenko" <denis@denix.org>
Subject: Re: [OE-core][blacksail 04/19] tclibc-baremetal.inc: fix gcc-cross
 EXTRA_OECONF
X-Mailer: aerc 0.20.0
References: <cover.1791299195.git.yoann.congal@smile.fr>
 <c7176cfee9859ced362f8efea0eff6d830b0b5d5.1791299195.git.yoann.congal@smile.fr> <20261006173626.GL4190@denix.org>
In-Reply-To: <20261006173626.GL4190@denix.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Oct 2026 20:31:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247336

On Tue Oct 6, 2026 at 7:36 PM CEST, Denys Dmytriyenko wrote:
> Please don't backport this - there are issues with the change even in mas=
ter,=20
> see the original thread.

Ok, I'll send a new series without this one.

Thanks!

> On Tue, Oct 06, 2026 at 05:45:50PM +0200, Yoann Congal via lists.openembe=
dded.org wrote:
>> From: Joerg Vehlow <joerg.vehlow@emlix.com>
>>=20
>> Using EXTRA_OECONF:pn-gcc-cross-${TARGET_ARCH}:append created a new over=
ride
>> for EXTRA_OECONF, which led to almost all EXTRA_OECONF switches to be ig=
nored.
>> Furthermore, setting --without-headers here is not required,
>> because it is set in gcc-cross.inc.
>>=20
>> Signed-off-by: Joerg Vehlow <joerg.vehlow@emlix.com>
>> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>> (cherry picked from commit 020d5f018616bc48eae3a23d5498dec3c78a1386)
>> Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
>> ---
>>  meta/conf/distro/include/tclibc-baremetal.inc | 1 -
>>  1 file changed, 1 deletion(-)
>>=20
>> diff --git a/meta/conf/distro/include/tclibc-baremetal.inc b/meta/conf/d=
istro/include/tclibc-baremetal.inc
>> index abea5a71629..6043cb6654e 100644
>> --- a/meta/conf/distro/include/tclibc-baremetal.inc
>> +++ b/meta/conf/distro/include/tclibc-baremetal.inc
>> @@ -18,7 +18,6 @@ USE_NLS ?=3D "no"
>>  IMAGE_LINGUAS =3D ""
>>  LIBC_DEPENDENCIES =3D ""
>> =20
>> -EXTRA_OECONF:pn-gcc-cross-${TARGET_ARCH}:append =3D " --without-headers=
"
>>  DEPENDS:remove:pn-meta-toolchain =3D "virtual/libc virtual/compilerlibs=
"
>> =20
>>  # certain compiler libs cannot be used without libc, avoid the dependen=
ce on compilerlibs


--=20
Yoann Congal
Smile ECS


