Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9532.1795191647541645067
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Nov 2026 08:20:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=MBm1A84S;
 spf=pass (domain: smile.fr, ip: 209.85.221.41, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48dfc0421d9so1008504f8f.1
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Nov 2026 08:20:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1795191645; x=1795796445; darn=lists.openembedded.org;
        h=in-reply-to:references:from:subject:to:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=15Mo5xCVN77VEUZ/tCkWJg7hwTu0RKMuYMS0kj0mSH8=;
        b=MBm1A84SSUJsA7ADw2K+HGBxf+ufdL/oGHu0hBLDann6Cs8tDgtSSeDkyr7i7v5BIg
         EEvPLB79dYqHBlEIEXVYZX+sdcMy6JT8co4Atd1l/s2gFhjRyaWJlIchuB6KgUVOAHys
         YST3wpPndeCbGGqhiDuz5t07t8qDO/+Ml2hwT5uB7ElswnwSt3oWTX/GbD2rZ9P2yibU
         9XDlcpiax8VZciVbZk+BsfBZi9b25BLYMO29pi4mMnQnBBP6mhVllzX9zXbuGgCHKOca
         dyAbR8kB/CsTUEU7T6vz98PdQYjEZAOQ7rDAYlvja6ggqkJOrid6L8UzDzphASzoqcrW
         FaSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795191645; x=1795796445;
        h=in-reply-to:references:from:subject:to:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=15Mo5xCVN77VEUZ/tCkWJg7hwTu0RKMuYMS0kj0mSH8=;
        b=KCi8IB6PLRXfV2Z90Znoj2rRV8xGTO2XZDPK6ZDi72J+VhHdBeCWJqMEJhX49+zIjs
         tbUShLOAm/uV781OMNp2Va8jT3AtL64v7/+Lzwbcx2PcFM1NDVbXYvt8cridGqhDxnF+
         3YHttM1xz0cR2AHWzrlif2fficygCwoq9/cgLsGWAq5UOAT5MWh24Janl3BVkz0JGG+J
         QHJH/3AyPpCQn2Ckd+T1g952ZS8dNyywVXV79qaDYh2vZ9SXjhgsYPj4FEKcNf+mwtVQ
         qgYw09qYNLrcLf/Kz7FPhBug/67Pani4jdi6cCF0RUthowkf7xOMp5CbXe+W2qw4EIqc
         O3Jw==
X-Forwarded-Encrypted: i=1; AL+hErGaeVgxeBH6GVGqlfg3/sQzKSr5H+UXU/WvxoykupJZC+SIGSuh1Y/LYhPQYNXgDmZSvgUD2Nyr/rBy6f5Ds9p9Vw==@lists.openembedded.org
X-Gm-Message-State: APuU4Z/fi1ybIoPHz/1Jns3nIS6FJYaIje08oeyRQ9FdbxR+DHnh+ch4
	9wfZkKMvvAvRUVtgNqpxowSm2PkoJvr2s1FEaaLIzMjJn6CMZO2sBGGKmUHnPP4VRPo=
X-Gm-Gg: AYBFou3NTBQAmrmsTvlfNOBhCSHLj9gANZmqxn5TjJ8c8QG+aMem3qT3qNEGpBJS0jB
	U35YIgZbjnEs7QH9XiXuS9ZSBf++kfrQFC287R87/9FZtMB1FjzFWXvL6NWazlR+7eRUgmUnXgQ
	V+66AcrP2YI5zt8rbu6ons+I3lI9G08pW2/DzAfhl4rxwkhBUU9/3x4+kRSHxeUqze3LkFoJYWY
	byG48+1OzenUxu2rXvIpL0Q99Aa9QAzksvaWFbUMNeeOb0zkF4Ju1YP9CHtzQifF5YbQvPVVrOU
	L+h8MhyfK8Kt+WUdlwpFJEX022O7QlVjkoZYBzwCaB6dI030fEHMevOBdh1UZuktoeEYvAuR9dI
	pqudJDwW40WAnjPuKcP1whcqdzTxUb/tpIr0mA/EqTMaDXYFdvdQZ5sRP5DaE2dRnuupnzb61Oy
	XS9fnc65a2YPj0kkqNoLEBOy+lD54yTxVwKSPFvw8YyKECnaaD9YSUK1zjG0z9cqgDwYPMHbXdL
	yc6RqzJy9KHC0TDGuqDRpFfB36az0AIl6nYswH0/WtAwtwzn02zAt0UZstT4baC8ZuwXVVbu5Dz
	y/9HyUbS2aRSznNiG+aOJpe+dFFGZZAN+35I1fJrKoYYBOIV0V64rTu3muDLlHmigLolklYYy7K
	g4JubWMA7EZDwVh/1
X-Received: by 2002:a05:600c:3b8c:b0:4b7:6c16:7b43 with SMTP id 5b1f17b1804b1-4bb8881d019mr78898415e9.10.1795191645432;
        Fri, 20 Nov 2026 08:20:45 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from localhost (2a01cb001331aa00b03901bd7f693780.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:b039:1bd:7f69:3780])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb85399e2esm142270135e9.7.2026.11.20.08.20.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Nov 2026 08:20:44 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 20 Nov 2026 17:20:44 +0100
Message-Id: <DN06BSGKBBP7.PDKIUIVFH976@smile.fr>
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
 <PH7PR11MB8598B39DBADCDF5C628594DDAD672@PH7PR11MB8598.namprd11.prod.outlook.com> <DMGCPPR45G7N.2FMNA6HS4W3G6@smile.fr> <PH7PR11MB85983BF338795A95B47297DEAD6F2@PH7PR11MB8598.namprd11.prod.outlook.com> <DMGF1CY7LWZQ.3N9SFE4FLRK56@smile.fr> <PH7PR11MB859851658A7D586768D2A604AD692@PH7PR11MB8598.namprd11.prod.outlook.com> <DMLGS7DZ86PF.3RG2UJSCTM4TV@smile.fr> <PH7PR11MB85988863CA88E4CA045D62EDAD682@PH7PR11MB8598.namprd11.prod.outlook.com>
In-Reply-To: <PH7PR11MB85988863CA88E4CA045D62EDAD682@PH7PR11MB8598.namprd11.prod.outlook.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 20 Nov 2026 16:20:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250814

On Wed Nov 4, 2026 at 1:11 PM CET, Hetvi Thakar -X (hthakar - E INFOCHIPS P=
RIVATE LIMITED at Cisco) wrote:
> Hi Yoann,

Hi Hetvi,

Sorry I took so much time to anwser this.

> I will prepare and submit the updated patch as discussed.

Thanks!

> Could you also please confirm whether we need to revert all the earlier p=
atches proposed by Paul, as discussed in the thread below?
> https://lists.openembedded.org/g/openembedded-core/topic/121397520
I think you meant "Peter" (not Paul).

"Revert" does not really apply since this commit was not merged. So, no?

Regards,

> Regards,
> Hetvi
>
> ________________________________
> From: Yoann Congal via openembedded-core <yoann.congal=3Dsmile.fr@lists.o=
penembedded.org>
> Sent: Tuesday, November 03, 2026 14:52
> To: Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco) <hth=
akar@cisco.com>; peter.marko@siemens.com <peter.marko@siemens.com>; openemb=
edded-core@lists.openembedded.org <openembedded-core@lists.openembedded.org=
>
> Subject: Re: [OE-core] [scarthgap][PATCH] u-boot-tools: use all patches f=
rom u-boot
>
> On Tue Nov 3, 2026 at 6:33 AM CET, Hetvi Thakar -X (hthakar - E INFOCHIPS=
 PRIVATE LIMITED at Cisco) wrote:
>> Hi Yoann,
>>
>> My reason for adding CVE_STATUS for is that u-boot-tools uses
>> tools-only_defconfig, which disables networking. The affected TCP and
>> NFS code is therefore not compiled into the tools.
>> not-applicable-config accurately describes this configuration.
>>
>> I understand the preference for sharing source patches between u-boot
>> and u-boot-tools. However, the tools remain unaffected by these CVEs
>> regardless of whether the source fixes are applied, so I believe the
>> configuration exclusions are technically valid.
>>
>> The same approach is already used in the wrynose branch [1], which
>> excludes all three CVEs. The fix for CVE-2026-29009 was also applied
>> separately to u-boot on wrynose [2].
>> Additionally, For CVE-2026-29007 and CVE-2026-29008, I have not
>> located a merged upstream fix or a formal patch submission for either
>> CVE in the U-Boot community.
>>
>> For these reasons, I believe retaining the CVE_STATUS entries is
>> appropriate for u-boot-tools on Scarthgap. They accurately reflect the
>> configuration being built and keep the CVE assessment consistent with
>> the approach already accepted for Wrynose.
>
> The new proposed approach would have to be deployed on wrynose as well
> (if applicable, I have not checked).
>
> I think that having the precise reason for a non-applicable CVE is not
> worth doing the CVE work twice (once with a patch, once with the
> CVE_STATUS). If we can fix both u-boot/u-boot-tools with a single patch
> it's more efficient.
>
> I still think we should merge the sources (upstream+patches) between
> u-boot/u-boot-tools and fix the CVEs only once if possible.
>
>>
>> [1] https://github.com/openembedded/openembedded-core/blob/wrynose/meta/=
recipes-bsp/u-boot/u-boot-tools_2026.01.bb
>> [2] https://git.openembedded.org/openembedded-core/commit/?h=3Dwrynose&i=
d=3Ddff41dcd5e54cad46ba91ecc45faefb0c8db9089
>>
>> Regards,
>> Hetvi
>> ________________________________
>> From: Yoann Congal <yoann.congal@smile.fr>
>> Sent: 28 October 2026 16:26
>> To: Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco) <ht=
hakar@cisco.com>; peter.marko@siemens.com <peter.marko@siemens.com>; openem=
bedded-core@lists.openembedded.org <openembedded-core@lists.openembedded.or=
g>
>> Subject: Re: [OE-core] [scarthgap][PATCH] u-boot-tools: use all patches =
from u-boot
>>
>> On Wed Oct 28, 2026 at 11:04 AM CET, Hetvi Thakar -X (hthakar - E INFOCH=
IPS PRIVATE LIMITED at Cisco) wrote:
>>> Hi Yoann,
>>>
>>> Thanks for clarifying. For patches 9=E2=80=9311, I understand that sour=
ce
>>> fixes are preferred. However, networking is disabled in u-boot-tools,
>>> so building it would not compile or exercise the affected code. How
>>> should these fixes be verified?
>>
>> By sharing the sources with u-boot which will compile those parts.
>>
>>>
>>> Regards,
>>> Hetvi
>>>
>>> ________________________________
>>> From: openembedded-core@lists.openembedded.org <openembedded-core@lists=
.openembedded.org> on behalf of Yoann Congal via lists.openembedded.org <yo=
ann.congal=3Dsmile.fr@lists.openembedded.org>
>>> Sent: 28 October 2026 14:37
>>> To: Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco) <h=
thakar@cisco.com>; peter.marko@siemens.com <peter.marko@siemens.com>; opene=
mbedded-core@lists.openembedded.org <openembedded-core@lists.openembedded.o=
rg>
>>> Subject: Re: [OE-core] [scarthgap][PATCH] u-boot-tools: use all patches=
 from u-boot
>>>
>>> On Tue Oct 20, 2026 at 7:16 AM CEST, Hetvi Thakar -X (hthakar - E INFOC=
HIPS PRIVATE LIMITED at Cisco) wrote:
>>>> Hi Yoann, Peter,
>>>>
>>>> Thanks, Yoann. Continuing the discussion here as suggested.
>>>>
>>>> As i explained in the other thread [1], the existing u-boot fixes are
>>>> not currently applied to u-boot-tools. My CVE_STATUS changes address
>>>> cases where the affected code is not compiled into the tools build.
>>>>
>>>> I understand that the proposed separate include would allow both
>>>> recipes to share the CVE patches without adding them to
>>>> u-boot-common.inc and affecting downstream users.
>>>>
>>>> My concern is whether we need this additional include and shared patch
>>>> list for cases that can be handled through recipe-specific CVE_STATUS
>>>> entries. Could we consider the held exclusions on that basis?
>>>>
>>>> If maintaining one shared source patch set is the preferred approach,
>>>> could you clarify how we should handle patches 2=E2=80=9311 of my seri=
es?
>>>> Should we revisit them after the shared include is settled and retain
>>>> only the exclusions still needed?
>>>
>>> The general idea is that by sharing CVE patches with the main u-boot
>>> recipe, CVE would be also "fixed" in u-boot-tools (even if said patch i=
s
>>> not compiled).
>>>
>>> For 2-8, patches are in u-boot so no need to ignore them:
>>> * [Patch 02/11] u-boot-tools: Ignore CVE-2024-42040
>>> * [Patch 03/11] u-boot-tools: Ignore CVE-2024-57254
>>> * [Patch 04/11] u-boot-tools: Ignore CVE-2024-57255
>>> * [Patch 05/11] u-boot-tools: Ignore CVE-2024-57256
>>> * [Patch 06/11] u-boot-tools: Ignore CVE-2024-57257
>>> * [Patch 07/11] u-boot-tools: Ignore CVE-2024-57258
>>> * [Patch 08/11] u-boot-tools: Ignore CVE-2024-57259
>>>
>>> For 9-11, there are no u-boot patches so ignoring them in the
>>> u-boot-tools recipe, would be fair (but patching them would be
>>> preferable):
>>> * [Patch 09/11] u-boot-tools: Ignore CVE-2026-29007
>>> * [Patch 10/11] u-boot-tools: Ignore CVE-2026-29008
>>> * [Patch 11/11] u-boot-tools: Ignore CVE-2026-29009
>>>
>>> Regards,
>>>
>>>>
>>>> [1] https://lists.openembedded.org/g/openembedded-core/message/247868
>>>>
>>>> Regards,
>>>> Hetvi
>>>> ________________________________
>>>> From: openembedded-core@lists.openembedded.org <openembedded-core@list=
s.openembedded.org> on behalf of Yoann Congal via lists.openembedded.org <y=
oann.congal=3Dsmile.fr@lists.openembedded.org>
>>>> Sent: 16 October 2026 03:44
>>>> To: peter.marko@siemens.com <peter.marko@siemens.com>; openembedded-co=
re@lists.openembedded.org <openembedded-core@lists.openembedded.org>
>>>> Cc: Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco) <=
hthakar@cisco.com>
>>>> Subject: Re: [OE-core] [scarthgap][PATCH] u-boot-tools: use all patche=
s from u-boot
>>>>
>>>> On Wed Sep 23, 2026 at 7:38 PM CEST, Peter Marko via lists.openembedde=
d.org wrote:
>>>>> From: Peter Marko <peter.marko@siemens.com>
>>>>>
>>>>> After sharing CVE_PRODUCT between u-boot and u-boot-tools CVEs
>>>>> patched in u-boot showed-up in CVE reports for u-boot-tools.
>>>>>
>>>>> It does not make much sense to share git repository but not share all
>>>>> patches on top of it, so move adding all patches from u-boot recipe t=
o a
>>>>> common include file where also the git repository is defined.
>>>>>
>>>>> Signed-off-by: Peter Marko <peter.marko@siemens.com>
>>>>> ---
>>>>>  meta/recipes-bsp/u-boot/u-boot-common.inc       | 10 ++++++++++
>>>>>  meta/recipes-bsp/u-boot/u-boot-tools_2024.01.bb |  2 --
>>>>>  meta/recipes-bsp/u-boot/u-boot_2024.01.bb       | 12 ------------
>>>>>  3 files changed, 10 insertions(+), 14 deletions(-)
>>>>
>>>> Hello Peter, Hetvi,
>>>>
>>>> There is a bit of back-and-forth around u-boot-common.inc. So I though=
t I
>>>> would give my vision and get your thoughts.
>>>>
>>>> Fundamentally, there is confusion about the usage of this .inc file:
>>>> * This is the common part of u-boot and u-boot-tools recipes (what the
>>>>   above patch uses)
>>>> * But, also, this may be used by downstream layers to reuse u-boot
>>>>   recipe parts. We basically did the revert of Peter's patch a few mon=
th
>>>>   ago for this reason[0].
>>>>
>>>> With Paul, we would like to have a single set of patches common for bo=
th
>>>> u-boot and u-boot-tools, but that can't be in u-boot-common.inc as the=
re
>>>> is a risk of breaking downstream layers.
>>>>
>>>> Our idea is to create a new inc file "u-boot-common-patches.inc" (I'm
>>>> not attached to the name) that contains only SRC_URI +=3D "CVE_*.patch=
"
>>>> and a big warning explaining that is file is only supposed to be
>>>> included from layer-local recipes (namely u-boot and u-boot-tools).
>>>>
>>>> This whole situation is not ideal but think the above would solve our
>>>> issues and still be acceptable under stable policy.
>>>>
>>>> What do you think?
>>>>
>>>> Regards,
>>>>
>>>> [0]: u-boot: move CVE patches out of the common .inc file - openembedd=
ed-core - OpenEmbedded Core layer
>>>>      https://git.openembedded.org/openembedded-core/commit/?id=3Df4ced=
8ff03147dd532a88cf3ce08d61fab057522
>>>> --
>>>> Yoann Congal
>>>> Smile ECS
>>>
>>>
>>> --
>>> Yoann Congal
>>> Smile ECS
>>
>>
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

