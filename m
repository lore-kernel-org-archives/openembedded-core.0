Return-Path: <vince@underview.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31494C7EE23
	for <webhook@archiver.kernel.org>; Sun, 11 Jun 2023 17:53:08 +0000 (UTC)
Subject: Re: [PATCH v3 2/2] vulkan-validation-layers: add new recipe v1.3.243.0
To: openembedded-core@lists.openembedded.org
From: "Vincent Davis Jr" <vince@underview.tech>
X-Originating-Location: Richmond, Texas, US (99.113.4.128)
X-Originating-Platform: Linux Firefox 113
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Sun, 11 Jun 2023 10:53:05 -0700
References: <CAMKF1spFJsRHEWp8PxANdNveD9eu=-4xRFJVhmxjajEPt2_bKA@mail.gmail.com>
In-Reply-To: <CAMKF1spFJsRHEWp8PxANdNveD9eu=-4xRFJVhmxjajEPt2_bKA@mail.gmail.com>
Message-ID: <2689.1686505985369486141@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="shfxpd5zXphs3mF95Qc3"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 11 Jun 2023 17:53:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182635

--shfxpd5zXphs3mF95Qc3
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Yeah, it's related to this issue here

https://lists.openembedded.org/g/openembedded-core/message/173249

And yeah vulkan-validation-layers cmake pulls in the properties set in
SPIRV-ToolsTarget.cmake during the configure stage. The key cmake
property being INTERFACE_LINK_LIBRARIES.

Commit message here should explain more
https://lists.openembedded.org/g/openembedded-core/message/182445

What's BASE_LIB set to on qemu machines? Thought process is that it's
set to "usr/lib" and not "lib".

--shfxpd5zXphs3mF95Qc3
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Yeah, it's related to this issue here<br /><br /><a href=3D"https://lists.o=
penembedded.org/g/openembedded-core/message/173249" target=3D"_blank" rel=
=3D"noopener">https://lists.openembedded.org/g/openembedded-core/message/17=
3249</a><br /><br />And yeah vulkan-validation-layers cmake pulls in the pr=
operties set in<br />SPIRV-ToolsTarget.cmake during the configure stage. Th=
e key cmake<br />property being INTERFACE_LINK_LIBRARIES.<br /><br />Commit=
 message here should explain more<br /><a href=3D"https://lists.openembedde=
d.org/g/openembedded-core/message/182445" target=3D"_blank" rel=3D"noopener=
">https://lists.openembedded.org/g/openembedded-core/message/182445</a><br =
/><br />What's BASE_LIB set to on qemu machines? Thought process is that it=
's<br />set to "usr/lib" and not "lib".

--shfxpd5zXphs3mF95Qc3--

