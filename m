Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7186.1793697745918077048
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Nov 2026 01:22:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=ChOK8Ffw;
 spf=pass (domain: smile.fr, ip: 209.85.128.52, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a5087a5348so31387955e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 03 Nov 2026 01:22:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1793697744; x=1794302544; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7wuu5CsrOFvuJ48IYEeP0f+cCcRUddRHDOAb15l/Omg=;
        b=ChOK8FfwmHDUewexkGk9A89VR8p49Uo7mtpszzD+k8FjQfCIGmhAxsBsBP9cvbKfr2
         hJwqMPXUUVcmueYgOUldw790OJWXCfCTVUbzcmk449TglpCeysqffEsJgefzrbYY+COb
         51HgLkNTDgWVRNnd11tpX47rSlE9D3EFZJBxbGjjTaQGnDPwGfh64kTlbjiXhDv1WQxL
         2RWeLEAn5eizWKOu+1gtrT6egHdeGZ/bM1dynAXjd0mjpqt6gYyWaE8O1hJT3RKNHkuC
         i6xu9EzwIb2bIxIzal+PZiaJgLxVEEl+3/7DGdkXebDNFlHJsfmiCUlu5LjtKqQO9Lr9
         yqpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793697744; x=1794302544;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7wuu5CsrOFvuJ48IYEeP0f+cCcRUddRHDOAb15l/Omg=;
        b=idbVgnPMVLKkGLB9Ya6wkiwwZiJhXhcONj7imAbCZbhkp0ozt5Gnip3uvhLTwjHIWd
         6xymop/mFspoPilFm9UVxJ0F+sSB7YEbo5rX/sr30Idx57GypoIxEb5nzJfmorOEoxPb
         4f0DpqlKJG2t4VXt6T1fYDVa7LUWGAtBhxiN0FfunvsgV6Ud9GqNCAr1Q9ihJymc3jgD
         Ppm88tzlcjnYM1V5uKCUsjO76ucyFcqKkadkFueH/5jVf/3UoTSRm4jl0wkJ7eGTdqsM
         Keq9nJTlfX/DW6JJfNvVyzmcPx1DVBaZGVZgU+B16q8r/1OmgmDwrVaFEdr2ARESA8Rm
         MN9Q==
X-Forwarded-Encrypted: i=1; AKwUvBwFTy0aNqwnvN1ej9caiS3owVk8Ky/ekRp5vCH2stZ5/k272r+bF/KX/zHO0kxZMnUlCp6KAEm5eLrMR1B2eGo3jA==@lists.openembedded.org
X-Gm-Message-State: APuU4Z9SlsrocnEsTkzg9VFMR4zyrN23qBM01lTE/cVnJvxGQ3EFXfcO
	rzm38TN7sNupvOzri0+xTjzH6x3zTTiDXkkekpTMMGcOW7aQYMONEWH9J/ZKE5hiRFE=
X-Gm-Gg: AYBFou1R0B7S7zEfoczA7xc+jEE5AnVVUD5u/h5imZGJKLrywbd5NZEPYDYGCDsYeZi
	bQf9ER2RYdoXpkWTYuqMXorh2eeAisvVCUJ8u7hEKQ/RPG8qXaU3d9jLdhPnDkZLQpaMI9pLJVI
	+amx/CMZTo6YtaLm9o3CSKcnD90iTDCZBrAWWHAR1tOinNMRcCC8CwST/mpmm02U/vLL2FsKAOX
	YvKpPzK21JRs6wZclGw66W0wDH85Hk/ZiYlFS0vAML4OPcOMSqufGrD6px7kqm5/rCAtxM9i9bg
	s16NZqE509VA5qcm2dX7qTP5EyEEB2QkjcRc4QD/Apx24NbUAhuREYx51yF68vweb1yaRxxeuNR
	CC1NeRfp+CmVJiAd7svJ0A1SVjGf9NGC59+r0gxQ3sYufMtQ3eCmxIvUwB+99iu3GUOy7dAvq9W
	x2DkNdybgHf+l97DT2KlymZHGfBpQH2Mh3PZ7CGY7vMz3vUKu3E4fWJrGDhXmk5PGbTSYfWRp9c
	OO+eKG4VjfTZlc0deja7mVBCPG1sby3dhda7Djs7BSLyv86im69k+3g9SDB1WVquxjXPi930Nja
	t9B9BfLz7cKUkdaailmopqCMDVnTn8LPzD7VzJU6RNioxMkUVGaNTgKBNhsVX4LEQZq5batHcxe
	mlrEev3hQfC/glw==
X-Received: by 2002:a05:600c:4ece:b0:4a3:5a42:b2a4 with SMTP id 5b1f17b1804b1-4ac185bca52mr278807725e9.12.1793697744046;
        Tue, 03 Nov 2026 01:22:24 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from localhost (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ac09cc3e9asm139980925e9.3.2026.11.03.01.22.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 01:22:23 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 03 Nov 2026 10:22:22 +0100
Message-Id: <DMLGS7DZ86PF.3RG2UJSCTM4TV@smile.fr>
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
 <PH7PR11MB8598B39DBADCDF5C628594DDAD672@PH7PR11MB8598.namprd11.prod.outlook.com> <DMGCPPR45G7N.2FMNA6HS4W3G6@smile.fr> <PH7PR11MB85983BF338795A95B47297DEAD6F2@PH7PR11MB8598.namprd11.prod.outlook.com> <DMGF1CY7LWZQ.3N9SFE4FLRK56@smile.fr> <PH7PR11MB859851658A7D586768D2A604AD692@PH7PR11MB8598.namprd11.prod.outlook.com>
In-Reply-To: <PH7PR11MB859851658A7D586768D2A604AD692@PH7PR11MB8598.namprd11.prod.outlook.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 03 Nov 2026 09:22:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249252

On Tue Nov 3, 2026 at 6:33 AM CET, Hetvi Thakar -X (hthakar - E INFOCHIPS P=
RIVATE LIMITED at Cisco) wrote:
> Hi Yoann,
>
> My reason for adding CVE_STATUS for is that u-boot-tools uses
> tools-only_defconfig, which disables networking. The affected TCP and
> NFS code is therefore not compiled into the tools.
> not-applicable-config accurately describes this configuration.
>
> I understand the preference for sharing source patches between u-boot
> and u-boot-tools. However, the tools remain unaffected by these CVEs
> regardless of whether the source fixes are applied, so I believe the
> configuration exclusions are technically valid.
>
> The same approach is already used in the wrynose branch [1], which
> excludes all three CVEs. The fix for CVE-2026-29009 was also applied
> separately to u-boot on wrynose [2].
> Additionally, For CVE-2026-29007 and CVE-2026-29008, I have not
> located a merged upstream fix or a formal patch submission for either
> CVE in the U-Boot community.
>
> For these reasons, I believe retaining the CVE_STATUS entries is
> appropriate for u-boot-tools on Scarthgap. They accurately reflect the
> configuration being built and keep the CVE assessment consistent with
> the approach already accepted for Wrynose.

The new proposed approach would have to be deployed on wrynose as well
(if applicable, I have not checked).

I think that having the precise reason for a non-applicable CVE is not
worth doing the CVE work twice (once with a patch, once with the
CVE_STATUS). If we can fix both u-boot/u-boot-tools with a single patch
it's more efficient.

I still think we should merge the sources (upstream+patches) between
u-boot/u-boot-tools and fix the CVEs only once if possible.

>
> [1] https://github.com/openembedded/openembedded-core/blob/wrynose/meta/r=
ecipes-bsp/u-boot/u-boot-tools_2026.01.bb
> [2] https://git.openembedded.org/openembedded-core/commit/?h=3Dwrynose&id=
=3Ddff41dcd5e54cad46ba91ecc45faefb0c8db9089
>
> Regards,
> Hetvi
> ________________________________
> From: Yoann Congal <yoann.congal@smile.fr>
> Sent: 28 October 2026 16:26
> To: Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco) <hth=
akar@cisco.com>; peter.marko@siemens.com <peter.marko@siemens.com>; openemb=
edded-core@lists.openembedded.org <openembedded-core@lists.openembedded.org=
>
> Subject: Re: [OE-core] [scarthgap][PATCH] u-boot-tools: use all patches f=
rom u-boot
>
> On Wed Oct 28, 2026 at 11:04 AM CET, Hetvi Thakar -X (hthakar - E INFOCHI=
PS PRIVATE LIMITED at Cisco) wrote:
>> Hi Yoann,
>>
>> Thanks for clarifying. For patches 9=E2=80=9311, I understand that sourc=
e
>> fixes are preferred. However, networking is disabled in u-boot-tools,
>> so building it would not compile or exercise the affected code. How
>> should these fixes be verified?
>
> By sharing the sources with u-boot which will compile those parts.
>
>>
>> Regards,
>> Hetvi
>>
>> ________________________________
>> From: openembedded-core@lists.openembedded.org <openembedded-core@lists.=
openembedded.org> on behalf of Yoann Congal via lists.openembedded.org <yoa=
nn.congal=3Dsmile.fr@lists.openembedded.org>
>> Sent: 28 October 2026 14:37
>> To: Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco) <ht=
hakar@cisco.com>; peter.marko@siemens.com <peter.marko@siemens.com>; openem=
bedded-core@lists.openembedded.org <openembedded-core@lists.openembedded.or=
g>
>> Subject: Re: [OE-core] [scarthgap][PATCH] u-boot-tools: use all patches =
from u-boot
>>
>> On Tue Oct 20, 2026 at 7:16 AM CEST, Hetvi Thakar -X (hthakar - E INFOCH=
IPS PRIVATE LIMITED at Cisco) wrote:
>>> Hi Yoann, Peter,
>>>
>>> Thanks, Yoann. Continuing the discussion here as suggested.
>>>
>>> As i explained in the other thread [1], the existing u-boot fixes are
>>> not currently applied to u-boot-tools. My CVE_STATUS changes address
>>> cases where the affected code is not compiled into the tools build.
>>>
>>> I understand that the proposed separate include would allow both
>>> recipes to share the CVE patches without adding them to
>>> u-boot-common.inc and affecting downstream users.
>>>
>>> My concern is whether we need this additional include and shared patch
>>> list for cases that can be handled through recipe-specific CVE_STATUS
>>> entries. Could we consider the held exclusions on that basis?
>>>
>>> If maintaining one shared source patch set is the preferred approach,
>>> could you clarify how we should handle patches 2=E2=80=9311 of my serie=
s?
>>> Should we revisit them after the shared include is settled and retain
>>> only the exclusions still needed?
>>
>> The general idea is that by sharing CVE patches with the main u-boot
>> recipe, CVE would be also "fixed" in u-boot-tools (even if said patch is
>> not compiled).
>>
>> For 2-8, patches are in u-boot so no need to ignore them:
>> * [Patch 02/11] u-boot-tools: Ignore CVE-2024-42040
>> * [Patch 03/11] u-boot-tools: Ignore CVE-2024-57254
>> * [Patch 04/11] u-boot-tools: Ignore CVE-2024-57255
>> * [Patch 05/11] u-boot-tools: Ignore CVE-2024-57256
>> * [Patch 06/11] u-boot-tools: Ignore CVE-2024-57257
>> * [Patch 07/11] u-boot-tools: Ignore CVE-2024-57258
>> * [Patch 08/11] u-boot-tools: Ignore CVE-2024-57259
>>
>> For 9-11, there are no u-boot patches so ignoring them in the
>> u-boot-tools recipe, would be fair (but patching them would be
>> preferable):
>> * [Patch 09/11] u-boot-tools: Ignore CVE-2026-29007
>> * [Patch 10/11] u-boot-tools: Ignore CVE-2026-29008
>> * [Patch 11/11] u-boot-tools: Ignore CVE-2026-29009
>>
>> Regards,
>>
>>>
>>> [1] https://lists.openembedded.org/g/openembedded-core/message/247868
>>>
>>> Regards,
>>> Hetvi
>>> ________________________________
>>> From: openembedded-core@lists.openembedded.org <openembedded-core@lists=
.openembedded.org> on behalf of Yoann Congal via lists.openembedded.org <yo=
ann.congal=3Dsmile.fr@lists.openembedded.org>
>>> Sent: 16 October 2026 03:44
>>> To: peter.marko@siemens.com <peter.marko@siemens.com>; openembedded-cor=
e@lists.openembedded.org <openembedded-core@lists.openembedded.org>
>>> Cc: Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco) <h=
thakar@cisco.com>
>>> Subject: Re: [OE-core] [scarthgap][PATCH] u-boot-tools: use all patches=
 from u-boot
>>>
>>> On Wed Sep 23, 2026 at 7:38 PM CEST, Peter Marko via lists.openembedded=
.org wrote:
>>>> From: Peter Marko <peter.marko@siemens.com>
>>>>
>>>> After sharing CVE_PRODUCT between u-boot and u-boot-tools CVEs
>>>> patched in u-boot showed-up in CVE reports for u-boot-tools.
>>>>
>>>> It does not make much sense to share git repository but not share all
>>>> patches on top of it, so move adding all patches from u-boot recipe to=
 a
>>>> common include file where also the git repository is defined.
>>>>
>>>> Signed-off-by: Peter Marko <peter.marko@siemens.com>
>>>> ---
>>>>  meta/recipes-bsp/u-boot/u-boot-common.inc       | 10 ++++++++++
>>>>  meta/recipes-bsp/u-boot/u-boot-tools_2024.01.bb |  2 --
>>>>  meta/recipes-bsp/u-boot/u-boot_2024.01.bb       | 12 ------------
>>>>  3 files changed, 10 insertions(+), 14 deletions(-)
>>>
>>> Hello Peter, Hetvi,
>>>
>>> There is a bit of back-and-forth around u-boot-common.inc. So I thought=
 I
>>> would give my vision and get your thoughts.
>>>
>>> Fundamentally, there is confusion about the usage of this .inc file:
>>> * This is the common part of u-boot and u-boot-tools recipes (what the
>>>   above patch uses)
>>> * But, also, this may be used by downstream layers to reuse u-boot
>>>   recipe parts. We basically did the revert of Peter's patch a few mont=
h
>>>   ago for this reason[0].
>>>
>>> With Paul, we would like to have a single set of patches common for bot=
h
>>> u-boot and u-boot-tools, but that can't be in u-boot-common.inc as ther=
e
>>> is a risk of breaking downstream layers.
>>>
>>> Our idea is to create a new inc file "u-boot-common-patches.inc" (I'm
>>> not attached to the name) that contains only SRC_URI +=3D "CVE_*.patch"
>>> and a big warning explaining that is file is only supposed to be
>>> included from layer-local recipes (namely u-boot and u-boot-tools).
>>>
>>> This whole situation is not ideal but think the above would solve our
>>> issues and still be acceptable under stable policy.
>>>
>>> What do you think?
>>>
>>> Regards,
>>>
>>> [0]: u-boot: move CVE patches out of the common .inc file - openembedde=
d-core - OpenEmbedded Core layer
>>>      https://git.openembedded.org/openembedded-core/commit/?id=3Df4ced8=
ff03147dd532a88cf3ce08d61fab057522
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

