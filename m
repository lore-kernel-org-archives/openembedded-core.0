Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.38488.1793178471060761965
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Oct 2026 02:07:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=QYlVuJQG;
 spf=pass (domain: smile.fr, ip: 209.85.221.54, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48e10a70540so416567f8f.1
        for <openembedded-core@lists.openembedded.org>; Wed, 28 Oct 2026 02:07:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1793178469; x=1793783269; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SSkkrye3KzOdPdMzbOxOJtihkT17Q4iD7l5B2XuPdEY=;
        b=QYlVuJQG/jxWcY4+xOUGuUZ+ViVVqA7BNnoJ30dNBthiCmo558veLvEdNthAjgyKXI
         ofI4iMlhRGZQg9LZbXYVcm065gyfDuEog1S0LcISvx5o/yZ9b1dkqADDJ5PfDw7rktkc
         R39kbUPBFrwIozN7GrR/3mnHiE6sSTKx2usrK1XeSEnb+ctBAKMPeD1e90X12vRdN0aH
         D6HpXUQ0kj0U1Xz4PAvKtF/LKfCj07LX0pFMTq3eg5abICZc4ajYO0tMdlTTnMo3zuV2
         DOn/8nEfkBugTdU+cjPj0GFZtzNNCoDGHcImJOUx9pojKPSunCu8/UBg9PxSBbSUDK66
         hXQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793178469; x=1793783269;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=SSkkrye3KzOdPdMzbOxOJtihkT17Q4iD7l5B2XuPdEY=;
        b=F7fH1jWQk79udsEo/+OdOMqHJxCuK/K/9++depDLFyD4Aqx+RXi+OVntExbePHy5Vk
         ktZtRARMqMGmlKzycwIzAQqC8X4V2KZ91uMRhTrdx7Iz0zGzKJP6Bw1uzdqlOOogZPr8
         CYc2KBP+00BiPqMQItZowv3KqQh1o6U4gpPCT6s6PqYy0d79F/rFYxPKiNR8nOC8y9P1
         xsAXVpbmWq6c4Dy7I5mSzSWRsQwChOkNC7tGv46b3s9DbpMqxEWGKgm903sLwk8hB0Pk
         5qfHufTHSOE0Mvna7s2F4LdyA21X3v7tIlyfjp3l4qud9Pur+zQ8QYHEPnstHItsd5MY
         83JA==
X-Forwarded-Encrypted: i=1; AKwUvBwb9xg7UuN+iSfo7kbZTrzyFQkrq5XCLjWkNBpGFyuOj6lxFSpQdZb4mCXQpEHl2tHrAnOYD2n3c1H6u7gKAggp+A==@lists.openembedded.org
X-Gm-Message-State: AFq9FYLluiQ0/yn9CKQQMAvs/LkeyhGv8tjlvI1anXxE+gmChYxkg8uM
	Cv/eGJAS6uSLPUmXVe1FvxEaTziYuy4wVUEE69AmnMYD5MowhfFabuFtfUu7U51Vtng=
X-Gm-Gg: AYBFou10NF6nSoGq2FqLGBZOiN7/Vllkmzs5YmHRe938qpR6XGQeSOHUk3XdgNDi/lv
	6zBP4e+2P372MudD34T8hifJjljdyLe6f7mFWhOI8GAcSOr3FRFrfExNJTieC2X0TLDSS6Zvwn6
	fKa+rsk+k/wpfYOwlyLdINTW2k2V0QbWo22SPJe/2KbmmDygmrYFHBosC5KeL3BYh6M14IZT6y5
	WojDkHmQXKXRsTxx6y/1igVOP3st5cXn2y0bEezokUuLcsFUemyjByUUfHHSvykLQHACaC7h0pU
	0rGA7elhbh6Y6ER0X2rXE5CU+9nzC3P+XnMHcttNjXMgDiJ/+kzaRmL2z8/cTkDLznUH3gOojcI
	51m/38koYj2kagkqzLSOMzDD7/p8WPtvUzap6vV/Y1dUbZrdNPVhkchvZqZUxxAGMlcc0zUHttJ
	VoDnJY0OOWORbDEhFYm5HVZLDJMA25zbBD+wOLuQUYqDBrrPq8huLlji1TviWh4eBh1Ra/NJp+J
	eoknvbny5kld38EKY1vlkGk3dAjKQRYK0LF+T/3jf/KGJrNBvFs/6VnVIHk7g3TzLHcCidI7aY5
	Wu30Y6sxThdSfUvZlTSbdJqVmnw3Q+VC+RMa5E3+ezZh+9F6pDKu2jvwzVTRdJXidJk4ZT8k1SC
	TP5QFZlCekWc5SyU=
X-Received: by 2002:a05:600c:a48:b0:4a6:42cc:bf66 with SMTP id 5b1f17b1804b1-4a9661ab4e9mr32319075e9.11.1793178468348;
        Wed, 28 Oct 2026 02:07:48 -0700 (PDT)
Return-Path: <yoann.congal@smile.fr>
Received: from localhost (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a92e104d8csm22003525e9.0.2026.10.28.02.07.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 02:07:44 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 28 Oct 2026 10:07:43 +0100
Message-Id: <DMGCPPR45G7N.2FMNA6HS4W3G6@smile.fr>
Subject: Re: [OE-core] [scarthgap][PATCH] u-boot-tools: use all patches from
 u-boot
From: "Yoann Congal" <yoann.congal@smile.fr>
To: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)"
 <hthakar@cisco.com>, "peter.marko@siemens.com" <peter.marko@siemens.com>,
 "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260923173850.21338-1-peter.marko@siemens.com>
 <DM5RBD9MJT2O.2M12R8AMW5OLY@smile.fr>
 <PH7PR11MB8598B39DBADCDF5C628594DDAD672@PH7PR11MB8598.namprd11.prod.outlook.com>
In-Reply-To: <PH7PR11MB8598B39DBADCDF5C628594DDAD672@PH7PR11MB8598.namprd11.prod.outlook.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 28 Oct 2026 09:07:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248799

On Tue Oct 20, 2026 at 7:16 AM CEST, Hetvi Thakar -X (hthakar - E INFOCHIPS=
 PRIVATE LIMITED at Cisco) wrote:
> Hi Yoann, Peter,
>
> Thanks, Yoann. Continuing the discussion here as suggested.
>
> As i explained in the other thread [1], the existing u-boot fixes are
> not currently applied to u-boot-tools. My CVE_STATUS changes address
> cases where the affected code is not compiled into the tools build.
>
> I understand that the proposed separate include would allow both
> recipes to share the CVE patches without adding them to
> u-boot-common.inc and affecting downstream users.
>
> My concern is whether we need this additional include and shared patch
> list for cases that can be handled through recipe-specific CVE_STATUS
> entries. Could we consider the held exclusions on that basis?
>
> If maintaining one shared source patch set is the preferred approach,
> could you clarify how we should handle patches 2=E2=80=9311 of my series?
> Should we revisit them after the shared include is settled and retain
> only the exclusions still needed?

The general idea is that by sharing CVE patches with the main u-boot
recipe, CVE would be also "fixed" in u-boot-tools (even if said patch is
not compiled).

For 2-8, patches are in u-boot so no need to ignore them:
* [Patch 02/11] u-boot-tools: Ignore CVE-2024-42040
* [Patch 03/11] u-boot-tools: Ignore CVE-2024-57254
* [Patch 04/11] u-boot-tools: Ignore CVE-2024-57255
* [Patch 05/11] u-boot-tools: Ignore CVE-2024-57256
* [Patch 06/11] u-boot-tools: Ignore CVE-2024-57257
* [Patch 07/11] u-boot-tools: Ignore CVE-2024-57258
* [Patch 08/11] u-boot-tools: Ignore CVE-2024-57259

For 9-11, there are no u-boot patches so ignoring them in the
u-boot-tools recipe, would be fair (but patching them would be
preferable):
* [Patch 09/11] u-boot-tools: Ignore CVE-2026-29007
* [Patch 10/11] u-boot-tools: Ignore CVE-2026-29008
* [Patch 11/11] u-boot-tools: Ignore CVE-2026-29009

Regards,

>
> [1] https://lists.openembedded.org/g/openembedded-core/message/247868
>
> Regards,
> Hetvi
> ________________________________
> From: openembedded-core@lists.openembedded.org <openembedded-core@lists.o=
penembedded.org> on behalf of Yoann Congal via lists.openembedded.org <yoan=
n.congal=3Dsmile.fr@lists.openembedded.org>
> Sent: 16 October 2026 03:44
> To: peter.marko@siemens.com <peter.marko@siemens.com>; openembedded-core@=
lists.openembedded.org <openembedded-core@lists.openembedded.org>
> Cc: Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco) <hth=
akar@cisco.com>
> Subject: Re: [OE-core] [scarthgap][PATCH] u-boot-tools: use all patches f=
rom u-boot
>
> On Wed Sep 23, 2026 at 7:38 PM CEST, Peter Marko via lists.openembedded.o=
rg wrote:
>> From: Peter Marko <peter.marko@siemens.com>
>>
>> After sharing CVE_PRODUCT between u-boot and u-boot-tools CVEs
>> patched in u-boot showed-up in CVE reports for u-boot-tools.
>>
>> It does not make much sense to share git repository but not share all
>> patches on top of it, so move adding all patches from u-boot recipe to a
>> common include file where also the git repository is defined.
>>
>> Signed-off-by: Peter Marko <peter.marko@siemens.com>
>> ---
>>  meta/recipes-bsp/u-boot/u-boot-common.inc       | 10 ++++++++++
>>  meta/recipes-bsp/u-boot/u-boot-tools_2024.01.bb |  2 --
>>  meta/recipes-bsp/u-boot/u-boot_2024.01.bb       | 12 ------------
>>  3 files changed, 10 insertions(+), 14 deletions(-)
>
> Hello Peter, Hetvi,
>
> There is a bit of back-and-forth around u-boot-common.inc. So I thought I
> would give my vision and get your thoughts.
>
> Fundamentally, there is confusion about the usage of this .inc file:
> * This is the common part of u-boot and u-boot-tools recipes (what the
>   above patch uses)
> * But, also, this may be used by downstream layers to reuse u-boot
>   recipe parts. We basically did the revert of Peter's patch a few month
>   ago for this reason[0].
>
> With Paul, we would like to have a single set of patches common for both
> u-boot and u-boot-tools, but that can't be in u-boot-common.inc as there
> is a risk of breaking downstream layers.
>
> Our idea is to create a new inc file "u-boot-common-patches.inc" (I'm
> not attached to the name) that contains only SRC_URI +=3D "CVE_*.patch"
> and a big warning explaining that is file is only supposed to be
> included from layer-local recipes (namely u-boot and u-boot-tools).
>
> This whole situation is not ideal but think the above would solve our
> issues and still be acceptable under stable policy.
>
> What do you think?
>
> Regards,
>
> [0]: u-boot: move CVE patches out of the common .inc file - openembedded-=
core - OpenEmbedded Core layer
>      https://git.openembedded.org/openembedded-core/commit/?id=3Df4ced8ff=
03147dd532a88cf3ce08d61fab057522
> --
> Yoann Congal
> Smile ECS


--=20
Yoann Congal
Smile ECS

