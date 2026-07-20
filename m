Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67E58C44520
	for <webhook@archiver.kernel.org>; Mon, 20 Jul 2026 11:35:38 +0000 (UTC)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6896.1784547335057805676
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Jul 2026 04:35:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=CcCVKVx5;
 spf=pass (domain: smile.fr, ip: 209.85.208.53, mailfrom: yoann.congal@smile.fr)
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-69e54d9c8c6so1792651a12.0
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Jul 2026 04:35:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1784547333; x=1785152133; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yNcK1qP70kbrFRZckxVOwGn3CWvWCwU5kaeF2MpWKQo=;
        b=CcCVKVx5CFO3R07Xbb+I26xGijc/5zaku+uZL5V6lXpjK1Zd9OB5oHd/hdABAfXQlG
         nKoTvihya4MZF8V+w5fxjOi4p0NCm6YXLWemRyXy/4CKuofiZPL6emUdIhSn07rEC0pl
         NmYO0xSyuS2Emcsy/VH2uttfLSzJtsGQF1ETk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784547333; x=1785152133;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yNcK1qP70kbrFRZckxVOwGn3CWvWCwU5kaeF2MpWKQo=;
        b=EQd9WmCN56R49ZUk8/pl/apoC26VfxBL1UQCNKuWKk3ZVMAiVkKuFrHW4D7bMJkeFD
         rl0bXDA1e6lyNL2ngo/FqTaMcy40Ive2ThxcDMisbRkW6bcPh5HNMf8Ue8fxSlZltJzG
         9NrSCV2j2nHtVRHPHYknoo+0f72TfpSDCNWt4eJv/KIu13ZW3PQRozCzosh7yeVyaNR1
         holR9Sj3OMgISpEGUZvHzN3AXhvy7MHQtQzTVuO6EXYGU52r2XrpfXOnmhiXGQ1dNyPX
         p7I+kDy4qpLwgPrEgxbPbwsGoqw7flCOMcQwVcWenqxNaFh0OEgcuwHclONn3iNEXJui
         6EJg==
X-Forwarded-Encrypted: i=1; AHgh+RpoHrF2kYC9VEGUnMzHTK5AFzEy5iE0SJDXtlXJsGxkZJJYE28EZ5R/8vGMDcYV7P0itK8rkicfxn4w8hZ0VfSFvQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzeS+/Co0UhCG2mWAjGBlFGDFCEy1OeAzn0Sc6RAfYCyqLOlLZ6
	RK9QimHMe3/Qv/JdlJlCyKMKbMUKUkqhSk3nOD/hYPwcOglSrxrwrc3XleaaWsaSy0s=
X-Gm-Gg: AfdE7cluqw7atnv8VwCiaKcIAIKuUnyG7bQHR/1T5t/77JhzS0cIVyCWEVe/biyllqU
	XLgpV9Pi/zRya3YsXWTCpHui8zhcNmZWEadsH0K/DNbfZeKwj1vjNNZQBXbeEL3fbE+2kEjQwAd
	Iiai/RbFYgQuiGzt31OEOfR3EEC3hU2LiGmHy1f8IrnA0XoKqcjCkHQkveXZ3FNxt49+Z4Rj8y5
	CUg18+ZoJFJrS20YGU6XXzyN7sbGDGPtDV6tcRaovoycJwhPguTBhjc2Xv4O/MvItcR54P3MmSt
	zbg5QFiIKgTnCouH6EJ6sv0hdt9A11InQrwVJHuu2iYqh7eJr4EB1oped3UjLVX/HbfhwtpPJf9
	V83ZcOggkfUag4lFzqtXjC9JigoGSW1+af4oGNu7Sg6O6FrTAw1gMfB6AVCdGUVEw+rgLlKmL6Z
	Jsb9AXicIn82xEWCWyPV/FJZYQKSCHbB9dqwOFfAyX61kbBwpnnNxjhM4SDjThMw==
X-Received: by 2002:a05:6402:2549:b0:697:8d48:7fa7 with SMTP id 4fb4d7f45d1cf-69e652aec82mr4770951a12.22.1784547333253;
        Mon, 20 Jul 2026 04:35:33 -0700 (PDT)
Received: from localhost (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69e6fef2640sm4547792a12.8.2026.07.20.04.35.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Jul 2026 04:35:32 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 20 Jul 2026 13:35:32 +0200
Message-Id: <DK3D8EWXGUS9.2YA6ZJEITFKBN@smile.fr>
Subject: Re: [OE-core][wrynose][PATCH 1/5] curl: ignore CVE-2026-4873
From: "Yoann Congal" <yoann.congal@smile.fr>
To: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)"
 <deeratho@cisco.com>, "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260720105647.2451180-1-deeratho@cisco.com>
 <DK3CUBQXME2E.3GE5VN0QYZB4J@smile.fr>
 <DM4PR11MB61893CF41B1EA33238B839A6C4C32@DM4PR11MB6189.namprd11.prod.outlook.com>
In-Reply-To: <DM4PR11MB61893CF41B1EA33238B839A6C4C32@DM4PR11MB6189.namprd11.prod.outlook.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Jul 2026 11:35:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241370

On Mon Jul 20, 2026 at 1:34 PM CEST, Deepak Rathore -X (deeratho - E INFOCH=
IPS PRIVATE LIMITED at Cisco) wrote:
> Hi Yoann,
>
> I have sent the v2 of this curl patch series as below:
>
>   1.
> https://lists.openembedded.org/g/openembedded-core/topic/120357095
>   2.
> https://lists.openembedded.org/g/openembedded-core/topic/120357098
>   3.
> https://lists.openembedded.org/g/openembedded-core/topic/120357102
>   4.
> https://lists.openembedded.org/g/openembedded-core/topic/120357099
>   5.
> https://lists.openembedded.org/g/openembedded-core/topic/120357100
>
> Thanks for your review.

Thanks for the followup :)


>
> Regards,
> Deepak
>
> ________________________________
> From: openembedded-core@lists.openembedded.org <openembedded-core@lists.o=
penembedded.org> on behalf of Yoann Congal via lists.openembedded.org <yoan=
n.congal=3Dsmile.fr@lists.openembedded.org>
> Sent: Monday, July 20, 2026 4:47 PM
> To: Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco) <=
deeratho@cisco.com>; openembedded-core@lists.openembedded.org <openembedded=
-core@lists.openembedded.org>
> Subject: Re: [OE-core][wrynose][PATCH 1/5] curl: ignore CVE-2026-4873
>
> On Mon Jul 20, 2026 at 12:56 PM CEST, Deepak Rathore via lists.openembedd=
ed.org wrote:
>> From: Deepak Rathore <deeratho@cisco.com>
>>
>> - CVE-2026-4873 affects curl before 8.20.0 when a connection negotiated =
with
>>   clear-text IMAP, POP3, or SMTP can later be reused for a TLS-required
>>   transfer.
>> - In wrynose, these protocols are optional PACKAGECONFIG entries and are=
 not
>>   enabled by default in curl_8.19.0.bb, so record this CVE as configurat=
ion-not-applicable
>>   for the default recipe configuration.
>>
>> Reference:
>> - https://curl.se/docs/CVE-2026-4873.html
>> - https://nvd.nist.gov/vuln/detail/CVE-2026-4873
>>
>> Signed-off-by: Deepak Rathore <deeratho@cisco.com>
>
> Hello,
>
> All that series should be tagged v2 with a changelog where appropriate:
> https://docs.yoctoproject.org/dev/contributor-guide/submit-changes.html#t=
aking-patch-review-into-account
>
> Can you resend it with the v2 tag? You can use -v2 if you use git-send-em=
ail.
>
> Adding these tags/changelog helps me a lot when tracking patch status.
>
> Thanks!
> --
> Yoann Congal
> Smile ECS


--=20
Yoann Congal
Smile ECS


