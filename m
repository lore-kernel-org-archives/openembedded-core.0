Return-Path: <vince@underview.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF1B1C7EE25
	for <webhook@archiver.kernel.org>; Fri,  9 Jun 2023 18:41:54 +0000 (UTC)
Subject: Re: [PATCH v3 2/2] vulkan-validation-layers: add new recipe v1.3.243.0
To: openembedded-core@lists.openembedded.org
From: "Vincent Davis Jr" <vince@underview.tech>
X-Originating-Location: Richmond, Texas, US (99.113.4.128)
X-Originating-Platform: Linux Firefox 113
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Fri, 09 Jun 2023 11:41:46 -0700
References: <CAMKF1spKzj9R03fBynUcusTphe34d8HxJyjOPcf95ndx+RDh9g@mail.gmail.com>
In-Reply-To: <CAMKF1spKzj9R03fBynUcusTphe34d8HxJyjOPcf95ndx+RDh9g@mail.gmail.com>
Message-ID: <14338.1686336106059476225@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="iU1nrlyc9kTLnZW3H6o1"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Jun 2023 18:41:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182597

--iU1nrlyc9kTLnZW3H6o1
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Out of curiosity why does meta-freescale downgrade vulkan version to v1.2.1=
82.0?

Either way adding vulkan-validation-layers_1.2.182.0.bb to
https://git.yoctoproject.org/meta-freescale/tree/recipes-downgrade/vulkan (=
 https://git.yoctoproject.org/meta-freescale/tree/recipes-downgrade/vulkan =
)
and
PREFERRED_VERSION_vulkan-validation-layers:imxvulkan ??=3D "1.2.182.0" to
https://git.yoctoproject.org/meta-freescale/tree/conf/machine/include/imx-b=
ase.inc
in meta-freescale. Fixes above error for me, but leads to.

vulkan-validation-layers/1.2.182.0-r0/git/layers/generated/chassis.cpp:383:=
10: error: variable 'skip' set but not used [-Werror,-Wunused-but-set-varia=
ble]
|=C2=A0=C2=A0=C2=A0=C2=A0 bool skip =3D false;

--iU1nrlyc9kTLnZW3H6o1
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Out of curiosity why does meta-freescale downgrade vulkan version to v1.2.1=
82.0?<br /><br />Either way adding vulkan-validation-layers_1.2.182.0.bb to=
<br /><a href=3D"https://git.yoctoproject.org/meta-freescale/tree/recipes-d=
owngrade/vulkan" target=3D"_blank" rel=3D"noopener">https://git.yoctoprojec=
t.org/meta-freescale/tree/recipes-downgrade/vulkan </a><br />and<br />PREFE=
RRED_VERSION_vulkan-validation-layers:imxvulkan ??=3D "1.2.182.0" to<br /><=
a href=3D"https://git.yoctoproject.org/meta-freescale/tree/conf/machine/inc=
lude/imx-base.inc" target=3D"_blank" rel=3D"noopener">https://git.yoctoproj=
ect.org/meta-freescale/tree/conf/machine/include/imx-base.inc</a><br />in m=
eta-freescale. Fixes above error for me, but leads to.<br /><br />vulkan-va=
lidation-layers/1.2.182.0-r0/git/layers/generated/chassis.cpp:383:10: error=
: variable 'skip' set but not used [-Werror,-Wunused-but-set-variable]<br /=
>|&nbsp;&nbsp;&nbsp;&nbsp; bool skip =3D false;

--iU1nrlyc9kTLnZW3H6o1--

