Return-Path: <andrey.popov@yadro.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 495C7C4167B
	for <webhook@archiver.kernel.org>; Tue, 28 Nov 2023 19:07:48 +0000 (UTC)
Subject: Re: [PATCH v2] image-live: Add support for building EFI-bootable ISO images for non-x86-based archs
To: openembedded-core@lists.openembedded.org
From: "Andrey Popov" <andrey.popov@yadro.com>
X-Originating-Location: Uzlovaya, Tula Oblast, RU (94.28.228.107)
X-Originating-Platform: Linux Chrome 113
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Tue, 28 Nov 2023 11:07:45 -0800
References: <53356C03-3699-43FC-B8A5-70609982F612@arm.com>
In-Reply-To: <53356C03-3699-43FC-B8A5-70609982F612@arm.com>
Message-ID: <5820.1701198465891150571@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="svLsrhgtpkhUXy7lGAHQ"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Nov 2023 19:07:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191385

--svLsrhgtpkhUXy7lGAHQ
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hello, Ross!

Currently, we are using a Yocto-based network equipment software distributi=
on called TanoWRT (https://tano-systems.gitlab.io/meta-tanowrt/).
This distribution provides a way to create images that can be used to facil=
itate network boot process using PXE. Those images are actually ISO images,=
 and they work well for x86-based platforms, since they use already availab=
le syslinux stubs that were used for that purpose for a very long time. Unf=
ortunately, syslinux does not support platforms that use CPU of different a=
rchitectures, which, however, still support network boot process as per the=
 UEFI spec. For those platforms, the image that is used for network boot is=
 still the very same ISO image, the only difference is that it has the 2nd =
stage bootloader in a standard EFI PE format prepended to it.
I hope that my explanation answers you question.

Best regards, Andrey.

--svLsrhgtpkhUXy7lGAHQ
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hello, Ross!<br /><br />Currently, we are using a Yocto-based network equip=
ment software distribution called TanoWRT (https://tano-systems.gitlab.io/m=
eta-tanowrt/).<br />This distribution provides a way to create images that =
can be used to facilitate network boot process using PXE. Those images are =
actually ISO images, and they work well for x86-based platforms, since they=
 use already available syslinux stubs that were used for that purpose for a=
 very long time. Unfortunately, syslinux does not support platforms that us=
e CPU of different architectures, which, however, still support network boo=
t process as per the UEFI spec. For those platforms, the image that is used=
 for network boot is still the very same ISO image, the only difference is =
that it has the 2nd stage bootloader in a standard EFI PE format prepended =
to it.<br />I hope that my explanation answers you question.<br /><br />Bes=
t regards, Andrey.

--svLsrhgtpkhUXy7lGAHQ--

