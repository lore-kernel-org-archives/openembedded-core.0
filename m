Return-Path: <flowergom@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCDF0C433EF
	for <webhook@archiver.kernel.org>; Mon, 30 May 2022 07:47:48 +0000 (UTC)
Subject: Re: [dunfell][PATCHv2] libdrm: add libdrm-{nouveau,radeon,intel} to
 RPROVIDES
To: openembedded-core@lists.openembedded.org
From: "Minjae Kim" <flowergom@gmail.com>
X-Originating-Location: =?utf-8?b?U3R1dHRnYXJ0LCBCYWRlbi1Xw7xydHRlbWJlcmcs?=
 =?utf-8?b?IERFICgxNDEuMTEzLjMuMTYp?=
X-Originating-Platform: Mac Chrome 101
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Mon, 30 May 2022 00:47:38 -0700
References: <20220529095251.11410-1-flowergom@gmail.com>
In-Reply-To: <20220529095251.11410-1-flowergom@gmail.com>
Message-ID: <953.1653896858036338969@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="doG4Vtr6ViAQWhzmrS22"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 May 2022 07:47:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166271

--doG4Vtr6ViAQWhzmrS22
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

@Martin,
I don't know why you think I'm hiding something.
I will use this when installing the rpm package using the dnf tool on the t=
arget image such as qemu or raspberrypi.

For example,
There is component A.
It needs libdrm-{nouveau,radeon,intel} packages to work properly.
When this A component rpm package is installed using dnf tool on the actual=
 target image,
the libdrm-{nouveau,radeon,intel} packages cannot install at once if the co=
mponent A had a libdrm as rdepends.

However, If component A has libdrm-{nouveau,radeon,intel} as rdepends,
When these A component packages are installed using dnf, these packages can=
 also be installed at the same time.

Because libdrm-{nouveau,radeon,intel} is not provided as RPROVIDES, these p=
ackages cannot be used as rdepends directly.

--doG4Vtr6ViAQWhzmrS22
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>@Martin,</div>
<div>I don't know why you think I'm hiding something.</div>
<div>I will use this when installing the rpm package using the dnf tool on =
the target image such as qemu or raspberrypi.<br /><br />For example,</div>
<div>There is component A. <br />It needs libdrm-{nouveau,radeon,intel} pac=
kages to work properly.</div>
<div>When this A component rpm package is installed using dnf tool on the a=
ctual target image,&nbsp;</div>
<div>the libdrm-{nouveau,radeon,intel} packages cannot install at once if t=
he component A had a libdrm as rdepends.</div>
<div>&nbsp;</div>
<div>However, If component A has libdrm-{nouveau,radeon,intel} as rdepends,=
</div>
<div>When these A component packages are installed using dnf, these package=
s can also be installed at the same time.<br /><br />Because libdrm-{nouvea=
u,radeon,intel} is not provided as RPROVIDES, these packages cannot be used=
 as rdepends directly.</div>

--doG4Vtr6ViAQWhzmrS22--

