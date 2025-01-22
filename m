Return-Path: <mark.hatle@kernel.crashing.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58F11C02182
	for <webhook@archiver.kernel.org>; Wed, 22 Jan 2025 02:39:17 +0000 (UTC)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by mx.groups.io with SMTP id smtpd.web11.33794.1737513549036221062
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jan 2025 18:39:09 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: kernel.crashing.org, ip: 63.228.1.57, mailfrom: mark.hatle@kernel.crashing.org)
Received: from kernel.crashing.org (70-99-78-136.nuveramail.net [70.99.78.136] (may be forged))
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 50M2d79O013574;
	Tue, 21 Jan 2025 20:39:07 -0600
Received: from [192.168.2.133] ([192.168.2.133])
	by kernel.crashing.org (8.14.7/8.14.7) with ESMTP id 50M2d6YA010424;
	Tue, 21 Jan 2025 20:39:06 -0600
Message-ID: <06416985-d1d5-45f1-a9fa-69d0d2092381@kernel.crashing.org>
Date: Tue, 21 Jan 2025 20:39:05 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [scarthgap] TUNE_ARCH error #scarthgap
Content-Language: en-US
To: ganesh.manoj.mahajan@signify.com, openembedded-core@lists.openembedded.org
References: <iFfK.1737461187659479212.JCdb@lists.openembedded.org>
From: Mark Hatle <mark.hatle@kernel.crashing.org>
In-Reply-To: <iFfK.1737461187659479212.JCdb@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by gate.crashing.org id 50M2d79O013574
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Jan 2025 02:39:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210112



On 1/21/25 6:06 AM, Ganesh Mahajan via lists.openembedded.org wrote:
> when tried to build image using command bitbake -k wac-core-image below=
 error=20
> poped up.
> ERROR: =C2=A0OE-core's config sanity checker detected a potential misco=
nfiguration.
>  =C2=A0 =C2=A0 Either fix the cause of this error or at your own risk d=
isable the checker=20
> (see sanity.conf).
>  =C2=A0 =C2=A0 Following is the list of potential problems / advisories=
:
>  =C2=A0 =C2=A0 TUNE_ARCH is unset. Please ensure your MACHINE configura=
tion includes a=20
> valid tune configuration file which will set this correctly.
> Error, the PACKAGE_ARCHS variable (all any noarch=20
> ${PACKAGE_EXTRA_ARCHS:tune-${DEFAULTTUNE}} wacin) for DEFAULTTUNE (None=
) does=20
> not contain TUNE_PKGARCH ().Toolchain tunings invalid:
> No tuning found for default multilib.
> I am upgrading from dunfell to scarthgap-5.0.5 (LTS), were dunfell had =
no=20
> TUNE_ARCH (tune-coretexA72.inc) but scarthgap has it.
> or is it a good practice to disable the checker? Location for=20
> tune-coretexA72.inc should be /conf/machine/ ?

https://git.yoctoproject.org/poky/tree/meta/conf/machine/include/arm/armv=
8a?h=3Dscarthgap

There is already a cortex a72 tune defined, use the files in that directo=
ry.

And yes, the filenames are case specific, 'a' is lowercase.

--Mark

>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#210096): https://lists.openembedded.org/g/openembed=
ded-core/message/210096
> Mute This Topic: https://lists.openembedded.org/mt/110734005/3616948
> Mute #scarthgap:https://lists.openembedded.org/g/openembedded-core/mute=
hashtag/scarthgap
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
mark.hatle@kernel.crashing.org]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20

