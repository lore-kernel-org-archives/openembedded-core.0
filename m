Return-Path: <mleonhardt@arri.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4529FE7717F
	for <webhook@archiver.kernel.org>; Fri, 13 Dec 2024 20:46:19 +0000 (UTC)
Subject: Re: [PATCH v4 0/4] cmake.bbclass improvements
To: openembedded-core@lists.openembedded.org
From: "Manuel Leonhardt" <mleonhardt@arri.de>
X-Originating-Location: DE (93.104.153.32)
X-Originating-Platform: Mac Safari 18.2
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Fri, 13 Dec 2024 12:46:09 -0800
References: <953e09ed-9f74-a048-e8e7-c26b19be3eb2@siemens.com>
In-Reply-To: <953e09ed-9f74-a048-e8e7-c26b19be3eb2@siemens.com>
Message-ID: <4730.1734122769306392060@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="wBK8N2ZuJ03xnBHkzQoc"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Dec 2024 20:46:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208695

--wBK8N2ZuJ03xnBHkzQoc
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

I would like to understand why this patch series was never merged. Specific=
ally, the patch that moves CMAKE_NO_SYSTEM_FROM_IMPORTED to toolchain.cmake=
 seems to fix a common issue when building with OE: By default, CMake adds =
the SYSTEM property to all imported libraries, which lets consuming targets=
 use stricter compiler warnings and treat warnings as errors without trigge=
ring errors from dependent targets' headers. Setting CMAKE_NO_SYSTEM_FROM_I=
MPORTED disables this default behaviour, oddly forcing consuming targets to=
 fix issues that were created by the build system itself as CMAKE_NO_SYSTEM=
_FROM_IMPORTED applies uniformly to all imported targets the consumer links=
 to. I've successfully built core-image-sato with CMAKE_NO_SYSTEM_FROM_IMPO=
RTED=3D1 completely removed on current master. Looking at the commit histor=
y, this setting seems to have been added to address an issue that may no lo=
nger exist. Is there a rationale for keeping this setting?

--wBK8N2ZuJ03xnBHkzQoc
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>I would like to understand why this patch series was never merged. Spe=
cifically, the patch that moves CMAKE_NO_SYSTEM_FROM_IMPORTED to toolchain.=
cmake seems to fix a common issue when building with OE: By default, CMake =
adds the SYSTEM property to all imported libraries, which lets consuming ta=
rgets use stricter compiler warnings and treat warnings as errors without t=
riggering errors from dependent targets' headers. Setting CMAKE_NO_SYSTEM_F=
ROM_IMPORTED disables this default behaviour, oddly forcing consuming targe=
ts to fix issues that were created by the build system itself as CMAKE_NO_S=
YSTEM_FROM_IMPORTED applies uniformly to all imported targets the consumer =
links to. I've successfully built core-image-sato with CMAKE_NO_SYSTEM_FROM=
_IMPORTED=3D1 completely removed on current master. Looking at the commit h=
istory, this setting seems to have been added to address an issue that may =
no longer exist. Is there a rationale for keeping this setting?</div>

--wBK8N2ZuJ03xnBHkzQoc--

