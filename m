Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A157EC43458
	for <webhook@archiver.kernel.org>; Tue,  7 Jul 2026 14:24:28 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.175600.1783434260092719403
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Jul 2026 07:24:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=vOHIva7R;
 spf=pass (domain: smile.fr, ip: 209.85.128.48, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-493b61b52b6so30994825e9.1
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Jul 2026 07:24:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1783434258; x=1784039058; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wXG/Bqo54lfRzFn97lav/WK9ifamLjBD1S0Ylf4nv1I=;
        b=vOHIva7RMc63jqiI2WkyZocbs6piHhKsa8ZjSLfF4Lovy0BW05Z9aZsgOB/JVr3MQ3
         TiWtEUtYcJC0WjMBmmQNb3gnTQfZS7B7o/btT5pbrSS3iqYWJZhfoxjyvgrTDt8zmdbB
         4Bmu1fIvUX5yUXiMH80hHG2maRwhk+DyOMebI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783434258; x=1784039058;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wXG/Bqo54lfRzFn97lav/WK9ifamLjBD1S0Ylf4nv1I=;
        b=atFoTVejRv9siFJQK023OsxpX/Leg4zyorQAcdl9b7Wpy8erWWtGdsbZUBu0yY/EWi
         Fvr7y85UGXdajVmw0PgncfiPtKGJVNv5SjbAYk2EUviNULoju/LbfmqFnAE7E2+HMyLa
         ugVAbF4AzUIhRtriHwpJTakGgqc2QtamIsHW6luohey2om7/WPka+/NE0q+g2m778QPD
         upc0DHscEyaHzycJ4qLSJrmNlEXF5+2c4T8K5EBiDExIxv+hmDQMIGgMVveg1pA4zqKi
         csUXPgcu7WlPZiynKe9OulPeyDvmss9NTB6X18/Qr1MRckzUBouqOfUsGBRtzBMAMSHM
         6oFA==
X-Forwarded-Encrypted: i=1; AHgh+RpxwzbPv021+BLRWLHt+Ypx77W6xtb556NVS0N2TamJiZZCUNz5Crf4/3tFdi0s2Wtpk5ATKYHb3UdDViYarD5BRA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxZOvXfcmHFzUN6r3Tuy4JIvfN8+2whjBlVg3sfeDzicAOrECui
	2n/N2zzDZAbdpxEZI4tOMo9zBpqlzHq0MoALPqDxMKyj6sLB6uvqgH5YONb9AJFPhx0=
X-Gm-Gg: AfdE7ckXD0eK4g88/aVIfjK7u1CR9YmqZ34VZ4egfD0MjE+Jw3I8P4Qwg3j/QIxU8tx
	uz/pxdz0gBM6Fyk+S2I+2iueJ8RXwIFXRpq+Do5zYJJWFgtp2m4iqv5m+J6uFljoEvsQzkj1xn2
	+2tAo+klWYHtPvFdXURZsJ4Nq2SID/AHj0cf00DOJSFWICA61Qhbo+Xja24yxXdl+DdhpzMqmeQ
	oz7jMcaroGlrfVNNJCOOFbpok0KzJ79jAXsO6mU4vjU9BoBFOgWM8jxONZnPqqkmAmNo/WRTdoy
	tpvkVy2ZFmTqqOXJw8AUzrDTygB30kHtppEQUhgbSG14ojk/98GdJJO+V4ct+x1I0A0YDgjeucr
	N8suPpRHA66LL9DOVSe4li3Np9pjCCdi8AAgAH/oMsS9a8BL0h3k14zg9rYdatthxs4kdSqAbIU
	PD4E+1wPIWRcli8vUZIOIM351oQHKpj4RLIVgMWuhknov/cJKqWJn8AVxJT6Mcf0rCA5MESRoL
X-Received: by 2002:a05:600c:3514:b0:493:b7cb:c5f with SMTP id 5b1f17b1804b1-493df05f8d4mr55834975e9.11.1783434258138;
        Tue, 07 Jul 2026 07:24:18 -0700 (PDT)
Received: from localhost (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47a9de1e6ccsm34660301f8f.5.2026.07.07.07.24.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jul 2026 07:24:17 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 07 Jul 2026 16:24:17 +0200
Message-Id: <DJSEOJECWK9X.ANVISE5T9476@smile.fr>
Subject: Re: [OE-core][scarthgap][PATCH v2] bind: Upgrade 9.18.44 -> 9.18.49
From: "Yoann Congal" <yoann.congal@smile.fr>
To: "Ashishkumar Parmar -X (asparmar - E INFOCHIPS PRIVATE LIMITED at
 Cisco)" <asparmar@cisco.com>, "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260630060410.1203985-1-asparmar@cisco.com>
 <DJS9H2DLIVVC.2DDDZVKTEK2TS@smile.fr>
 <PH0PR11MB5902116D97221B6725047B50CFF02@PH0PR11MB5902.namprd11.prod.outlook.com>
In-Reply-To: <PH0PR11MB5902116D97221B6725047B50CFF02@PH0PR11MB5902.namprd11.prod.outlook.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Jul 2026 14:24:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240391

Hello,

On Tue Jul 7, 2026 at 3:24 PM CEST, Ashishkumar Parmar -X (asparmar - E INF=
OCHIPS PRIVATE LIMITED at Cisco) wrote:
> Thanks, Yoann.
>
> Yes, feature changes are usually not something we should take in stable.
>
> For this BIND work, I first submitted the individual CVE backport patches=
 for scarthgap:
>
> - CVE-2026-1519:
>   https://patchwork.yoctoproject.org/project/oe-core/patch/20260610100404=
.2993940-1-asparmar@cisco.com/
> - CVE-2026-5950:
>   https://patchwork.yoctoproject.org/project/oe-core/patch/20260610100404=
.2993940-2-asparmar@cisco.com/
> - CVE-2026-3592:
>   https://patchwork.yoctoproject.org/project/oe-core/patch/20260610100404=
.2993940-3-asparmar@cisco.com/
> - CVE-2026-3039:
>   https://patchwork.yoctoproject.org/project/oe-core/patch/20260610100404=
.2993940-4-asparmar@cisco.com/
> - CVE-2026-5946:
>   https://patchwork.yoctoproject.org/project/oe-core/patch/20260610100404=
.2993940-5-asparmar@cisco.com/
>
> During review, the feedback was that BIND is one of the rare projects
> where the upstream stable branch matches OE stable policy, and that
> upgrading along the 9.18 branch would be preferable to carrying a
> large CVE backport patch stack. That is why I superseded the backport
> series and sent the 9.18.44 -> 9.18.49
> upgrade instead:
>
> https://patchwork.yoctoproject.org/project/oe-core/patch/20260630060410.1=
203985-1-asparmar@cisco.com/

Sorry, I totally forgot that I was the one suggesting the upgrade.

> For the specific 9.18.45 changelog item you pointed out, the change is
> limited to ISC's upstream system test suite. It raises the Python
> requirement for running `bin/tests/system` and tracks those test-suite
> Python dependencies in `bin/tests/system/requirements.txt`.
>
> OE-Core's `bind` recipe does not enable or package that upstream
> system test suite and does not inherit `ptest`, so this change is not
> part of the target build, installed packages, runtime dependencies, or
> runtime behavior.
>
> So the reason for the upgrade is that it follows the earlier review
> direction to use the BIND 9.18 stable branch, while this particular
> feature change is test-suite-only and not target-visible in OE-Core.

I agree with proceeding with the upgrade.
Can you put a shorter explanation of the above in your commit message to
help future reviewer?

Thanks!

>
> Regards,
> Ashish
> ________________________________
> From: Yoann Congal <yoann.congal@smile.fr>
> Sent: 07 July 2026 15:49
> To: Ashishkumar Parmar -X (asparmar - E INFOCHIPS PRIVATE LIMITED at Cisc=
o) <asparmar@cisco.com>; openembedded-core@lists.openembedded.org <openembe=
dded-core@lists.openembedded.org>
> Cc: xe-linux-external (Internal Group) <xe-linux-external@cisco.com>
> Subject: Re: [OE-core][scarthgap][PATCH v2] bind: Upgrade 9.18.44 -> 9.18=
.49
>
> On Tue Jun 30, 2026 at 8:04 AM CEST, Ashishkumar Parmar X (asparmar - E I=
NFOCHIPS PRIVATE LIMITED at Cisco) via lists.openembedded.org wrote:
>> From: Ashishkumar Parmar <asparmar@cisco.com>
>>
>> This upgrade fixes CVE-2026-1519, CVE-2026-3039, CVE-2026-3592, CVE-2026=
-5946 and CVE-2026-5950.
>>
>> Changelog
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D
>> https://downloads.isc.org/isc/bind9/9.18.49/doc/arm/html/notes.html
>
> That changelog contains:
> | Notes for BIND 9.18.45
> |   Feature Changes
> |    Update requirements for system test suite.
> |      Python 3.10 or newer is now required for running the system test
> |      suite. The required Python packages and their version requirements
> |      are now tracked in the file bin/tests/system/requirements.txt. [GL
> |      #5690] [GL #5614]
>
> Feature changes are not usually acceptable for stable. Can you justify
> why this is the case here?
>
> Thanks!
>
>>
>> Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>
>> ---
>>  .../bind/{bind_9.18.44.bb =3D> bind_9.18.49.bb}                   | 2 +=
-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>  rename meta/recipes-connectivity/bind/{bind_9.18.44.bb =3D> bind_9.18.4=
9.bb} (97%)
>>
>> diff --git a/meta/recipes-connectivity/bind/bind_9.18.44.bb b/meta/recip=
es-connectivity/bind/bind_9.18.49.bb
>> similarity index 97%
>> rename from meta/recipes-connectivity/bind/bind_9.18.44.bb
>> rename to meta/recipes-connectivity/bind/bind_9.18.49.bb
>> index d424edcb4e..723a09e739 100644
>> --- a/meta/recipes-connectivity/bind/bind_9.18.44.bb
>> +++ b/meta/recipes-connectivity/bind/bind_9.18.49.bb
>> @@ -20,7 +20,7 @@ SRC_URI =3D "https://ftp.isc.org/isc/bind9/${PV}/${BPN=
}-${PV}.tar.xz \
>>             file://0001-avoid-start-failure-with-bind-user.patch \
>>             "
>>
>> -SRC_URI[sha256sum] =3D "81f5035a25c576af1a93f0061cf70bde6d00a0c7bd1274a=
bf73f5b5389a6f82d"
>> +SRC_URI[sha256sum] =3D "c43ce4548ebed788cd9df63658a7de105ceafba43fcd63f=
a352b1093e525cd24"
>>
>>  UPSTREAM_CHECK_URI =3D "https://ftp.isc.org/isc/bind9/"
>>  # follow the ESV versions divisible by 2
>
>
> --
> Yoann Congal
> Smile ECS


--=20
Yoann Congal
Smile ECS


