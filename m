Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.39979.1793185026148038255
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Oct 2026 03:57:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=VZAvzYBs;
 spf=pass (domain: smile.fr, ip: 209.85.128.45, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso8323705e9.3
        for <openembedded-core@lists.openembedded.org>; Wed, 28 Oct 2026 03:57:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1793185024; x=1793789824; darn=lists.openembedded.org;
        h=in-reply-to:references:from:subject:to:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Qltz3Sfh8XTSALSgsz0U7aCaqRsqpW3djcinpm/+bmY=;
        b=VZAvzYBsYI1utcLZb7V+UNmIMF7fp68twdFfXdlufqz3WB2IBOcuL/DblztyUNdv0F
         rHpSQqMe/AeaSInKowOpV8ThGbtpSN4XNVd+AXSjmgWhyeuhdVe2aekJRdY2ncPwXLlR
         XlzOe2AUx3Aef0qoHt2lJ8G52NuNpv23DkBNpCqsgLaiqhz4RfRG7zOlBdB02I6jAwun
         hrk1y4oeo34YFIZLa/gMM1Hw3bKNtViYhVIOPCZBJ8cA/cfD6ArWqz1qG87SKpvdUoWt
         ODLxxA6/Ccej6Zn0f5FvbRbwzMVxLzPbnmOvW1rHdZwZF7r6+zCvMXKYpd0BR2nQrsWw
         uIQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793185024; x=1793789824;
        h=in-reply-to:references:from:subject:to:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Qltz3Sfh8XTSALSgsz0U7aCaqRsqpW3djcinpm/+bmY=;
        b=ALnb5Vx1MyLBxey9Y28oqeyVm10LD3A3yByd5s4ammhCYN1vUk0q4MzBskBhzSNR93
         LGzy4/TVBb4pt6BNzhfolC2nnYHYI8THykxZk4xFxg4tzTaT31D6qq6tI7nixP7Le/NV
         ip6T3F2rPqfB5/0oe6X+yquO/CYEXetOaoZtRbgGUi82nGb/SOJYyzi3C8ugzHBo7cAY
         2Gz9elaih0z2MauzlZigysJRV3vz+yMhePNw/eOs1iIRVKHe+uu4AorIhlUOdRUHQde7
         nfcGsKK9GO6Oiv5LbWyKsNQdnXhQQc0LImU8n/cQC2h7ycyxnjpfvDaidOpCOHdRFM+U
         AGFA==
X-Forwarded-Encrypted: i=1; AKwUvByPTneLQ6HYOVLSCnchSA8Ku7pOUe+cljnfG3DMv0MFyL6KaPd3hOAceob8GP9KFMY/DrIzkBW/aW+QF/JvoKaQxA==@lists.openembedded.org
X-Gm-Message-State: AFq9FYJSdCgM0GEUJNvJxDFmvryT6GGf93X6wDguuotKyaulcWI8W1Iz
	h5zfTTkuW2Agu4UZK2tb1L1BKNYT2R79JrKO1GVoPuqJhXxNQh0B8/jWlnwmThDSDz0=
X-Gm-Gg: AYBFou2lnLEBWkVElc20JzemDz2gQ9V2I5tBRK8PGBN6nr2XXG5NsMlz1bYWJbI/hGB
	yVf1Jbgbbh4bRNirRf2llTKbbIC6FyYJdpd7oEO3Wus9juQp7GzAJYQv++7yLkXMJCX4YuaCO2u
	U7EgJ5//6NTrdeujPuqtnQMiSlqe5itmkWXECnI6JsUjCouUgwpsc5HznKXYRs4pBOwIchl8YLq
	1P0gDcLGE68IASL5rry115W1Vi6zXo+lmjNG6WLNKilVpmKjZ/Q7caC24lv3o2EhaXyc+ab875n
	gBzXexKo1BktjOzeE9UgqztV4F/2sV4zH3T30iueyuge0wiQWM4QrLxDouiA+drbMNtPBF4iyiI
	tLceTQBU+jzPqE9oIrDpUH8oTmhOa7Q3c7wwezqcfemrhSO9EueSMrbba8z7Ip3+IYMPbS1BDQW
	3hhpemgx7eQOD8aPxJl5ZtVV7D94RW2hU5ADB6/S/N6wOhyVWUwewQdlb6D7OLAg5qQCrSJaDWx
	5ytNlPnP1KhXhSK1cex+yYyCxpue27PyaWjZoiXDpmuZbhW9HiysxGaTgdJN/HDjtEG9OGetDZ3
	ZEpxbEfgNkpQDsriPiWcy15t17mpS+EDG8UgH8sl+1klDONPhMB/171TK4IRlOmPu/p0rKU0zsM
	Ed15EI7VJ029r9Q==
X-Received: by 2002:a05:600c:c166:b0:4a0:eae0:769a with SMTP id 5b1f17b1804b1-4a9677ca8bfmr37979535e9.28.1793185024345;
        Wed, 28 Oct 2026 03:57:04 -0700 (PDT)
Return-Path: <yoann.congal@smile.fr>
Received: from localhost (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecd35c2sm27303755f8f.39.2026.10.28.03.57.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 03:57:03 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 28 Oct 2026 11:56:58 +0100
Message-Id: <DMGF1CY7LWZQ.3N9SFE4FLRK56@smile.fr>
To: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)"
 <hthakar@cisco.com>, "peter.marko@siemens.com" <peter.marko@siemens.com>,
 "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [scarthgap][PATCH] u-boot-tools: use all patches from
 u-boot
From: "Yoann Congal" <yoann.congal@smile.fr>
X-Mailer: aerc 0.20.0
References: <20260923173850.21338-1-peter.marko@siemens.com>
 <DM5RBD9MJT2O.2M12R8AMW5OLY@smile.fr>
 <PH7PR11MB8598B39DBADCDF5C628594DDAD672@PH7PR11MB8598.namprd11.prod.outlook.com> <DMGCPPR45G7N.2FMNA6HS4W3G6@smile.fr> <PH7PR11MB85983BF338795A95B47297DEAD6F2@PH7PR11MB8598.namprd11.prod.outlook.com>
In-Reply-To: <PH7PR11MB85983BF338795A95B47297DEAD6F2@PH7PR11MB8598.namprd11.prod.outlook.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 28 Oct 2026 10:57:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248809

On Wed Oct 28, 2026 at 11:04 AM CET, Hetvi Thakar -X (hthakar - E INFOCHIPS=
 PRIVATE LIMITED at Cisco) wrote:
> Hi Yoann,
>
> Thanks for clarifying. For patches 9=E2=80=9311, I understand that source
> fixes are preferred. However, networking is disabled in u-boot-tools,
> so building it would not compile or exercise the affected code. How
> should these fixes be verified?

By sharing the sources with u-boot which will compile those parts.

>
> Regards,
> Hetvi
>
> ________________________________
> From: openembedded-core@lists.openembedded.org <openembedded-core@lists.o=
penembedded.org> on behalf of Yoann Congal via lists.openembedded.org <yoan=
n.congal=3Dsmile.fr@lists.openembedded.org>
> Sent: 28 October 2026 14:37
> To: Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco) <hth=
akar@cisco.com>; peter.marko@siemens.com <peter.marko@siemens.com>; openemb=
edded-core@lists.openembedded.org <openembedded-core@lists.openembedded.org=
>
> Subject: Re: [OE-core] [scarthgap][PATCH] u-boot-tools: use all patches f=
rom u-boot
>
> On Tue Oct 20, 2026 at 7:16 AM CEST, Hetvi Thakar -X (hthakar - E INFOCHI=
PS PRIVATE LIMITED at Cisco) wrote:
>> Hi Yoann, Peter,
>>
>> Thanks, Yoann. Continuing the discussion here as suggested.
>>
>> As i explained in the other thread [1], the existing u-boot fixes are
>> not currently applied to u-boot-tools. My CVE_STATUS changes address
>> cases where the affected code is not compiled into the tools build.
>>
>> I understand that the proposed separate include would allow both
>> recipes to share the CVE patches without adding them to
>> u-boot-common.inc and affecting downstream users.
>>
>> My concern is whether we need this additional include and shared patch
>> list for cases that can be handled through recipe-specific CVE_STATUS
>> entries. Could we consider the held exclusions on that basis?
>>
>> If maintaining one shared source patch set is the preferred approach,
>> could you clarify how we should handle patches 2=E2=80=9311 of my series=
?
>> Should we revisit them after the shared include is settled and retain
>> only the exclusions still needed?
>
> The general idea is that by sharing CVE patches with the main u-boot
> recipe, CVE would be also "fixed" in u-boot-tools (even if said patch is
> not compiled).
>
> For 2-8, patches are in u-boot so no need to ignore them:
> * [Patch 02/11] u-boot-tools: Ignore CVE-2024-42040
> * [Patch 03/11] u-boot-tools: Ignore CVE-2024-57254
> * [Patch 04/11] u-boot-tools: Ignore CVE-2024-57255
> * [Patch 05/11] u-boot-tools: Ignore CVE-2024-57256
> * [Patch 06/11] u-boot-tools: Ignore CVE-2024-57257
> * [Patch 07/11] u-boot-tools: Ignore CVE-2024-57258
> * [Patch 08/11] u-boot-tools: Ignore CVE-2024-57259
>
> For 9-11, there are no u-boot patches so ignoring them in the
> u-boot-tools recipe, would be fair (but patching them would be
> preferable):
> * [Patch 09/11] u-boot-tools: Ignore CVE-2026-29007
> * [Patch 10/11] u-boot-tools: Ignore CVE-2026-29008
> * [Patch 11/11] u-boot-tools: Ignore CVE-2026-29009
>
> Regards,
>
>>
>> [1] https://lists.openembedded.org/g/openembedded-core/message/247868
>>
>> Regards,
>> Hetvi
>> ________________________________
>> From: openembedded-core@lists.openembedded.org <openembedded-core@lists.=
openembedded.org> on behalf of Yoann Congal via lists.openembedded.org <yoa=
nn.congal=3Dsmile.fr@lists.openembedded.org>
>> Sent: 16 October 2026 03:44
>> To: peter.marko@siemens.com <peter.marko@siemens.com>; openembedded-core=
@lists.openembedded.org <openembedded-core@lists.openembedded.org>
>> Cc: Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco) <ht=
hakar@cisco.com>
>> Subject: Re: [OE-core] [scarthgap][PATCH] u-boot-tools: use all patches =
from u-boot
>>
>> On Wed Sep 23, 2026 at 7:38 PM CEST, Peter Marko via lists.openembedded.=
org wrote:
>>> From: Peter Marko <peter.marko@siemens.com>
>>>
>>> After sharing CVE_PRODUCT between u-boot and u-boot-tools CVEs
>>> patched in u-boot showed-up in CVE reports for u-boot-tools.
>>>
>>> It does not make much sense to share git repository but not share all
>>> patches on top of it, so move adding all patches from u-boot recipe to =
a
>>> common include file where also the git repository is defined.
>>>
>>> Signed-off-by: Peter Marko <peter.marko@siemens.com>
>>> ---
>>>  meta/recipes-bsp/u-boot/u-boot-common.inc       | 10 ++++++++++
>>>  meta/recipes-bsp/u-boot/u-boot-tools_2024.01.bb |  2 --
>>>  meta/recipes-bsp/u-boot/u-boot_2024.01.bb       | 12 ------------
>>>  3 files changed, 10 insertions(+), 14 deletions(-)
>>
>> Hello Peter, Hetvi,
>>
>> There is a bit of back-and-forth around u-boot-common.inc. So I thought =
I
>> would give my vision and get your thoughts.
>>
>> Fundamentally, there is confusion about the usage of this .inc file:
>> * This is the common part of u-boot and u-boot-tools recipes (what the
>>   above patch uses)
>> * But, also, this may be used by downstream layers to reuse u-boot
>>   recipe parts. We basically did the revert of Peter's patch a few month
>>   ago for this reason[0].
>>
>> With Paul, we would like to have a single set of patches common for both
>> u-boot and u-boot-tools, but that can't be in u-boot-common.inc as there
>> is a risk of breaking downstream layers.
>>
>> Our idea is to create a new inc file "u-boot-common-patches.inc" (I'm
>> not attached to the name) that contains only SRC_URI +=3D "CVE_*.patch"
>> and a big warning explaining that is file is only supposed to be
>> included from layer-local recipes (namely u-boot and u-boot-tools).
>>
>> This whole situation is not ideal but think the above would solve our
>> issues and still be acceptable under stable policy.
>>
>> What do you think?
>>
>> Regards,
>>
>> [0]: u-boot: move CVE patches out of the common .inc file - openembedded=
-core - OpenEmbedded Core layer
>>      https://git.openembedded.org/openembedded-core/commit/?id=3Df4ced8f=
f03147dd532a88cf3ce08d61fab057522
>> --
>> Yoann Congal
>> Smile ECS
>
>
> --
> Yoann Congal
> Smile ECS


--=20
Yoann Congal
Smile ECS

