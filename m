Return-Path: <mark.yang@lge.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C1AFF54AD6
	for <webhook@archiver.kernel.org>; Tue, 24 Mar 2026 23:57:46 +0000 (UTC)
Subject: Re: [PATCH] llvm: add binutils-plugin PACKAGECONFIG for LLVMgold.so
To: openembedded-core@lists.openembedded.org
From: "mark.yang" <mark.yang@lge.com>
X-Originating-Location: Nowon-gu, Seoul, KR (27.122.242.71)
X-Originating-Platform: Windows Chrome 146
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Tue, 24 Mar 2026 16:57:37 -0700
References: <20260324232734.2081279-1-mark.yang@lge.com>
In-Reply-To: <20260324232734.2081279-1-mark.yang@lge.com>
Message-ID: <564384.1774396657215756194@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="it0fdsR5wPq5cZaGogDo"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Mar 2026 23:57:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233835

--it0fdsR5wPq5cZaGogDo
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

This patch is an update to following patches.
https://lists.openembedded.org/g/openembedded-core/topic/117252728 [PATCH] =
llvm: enable LLVMgold.so build by adding binutils dependency
https://lists.openembedded.org/g/openembedded-core/topic/patch_v2_llvm_enab=
le/117274480 [PATCH v2] llvm: enable LLVMgold.so build by adding binutils d=
ependency

When build component using clang that utilize lto, and when the LLD linker =
connot be used (Use bfd), the LLVMgold.so plugin is required in the native =
sysroot.
LLVMgold.so plugin is generated when binutils-plugin is enabled.
libLTO.so.21.1 is generated on the target even if it is not enabled.

The reason they were bundled in to the same package is to distribute them v=
ia the nativesdk package.

As Deepesh suggested, I mae it possible to enable this via the binutils-plu=
gin rather than having it always built into LLVM.
The name "binutils-plugin" was inspired by gentoo's name convention. https:=
//packages.gentoo.org/useflags/binutils-plugin

--it0fdsR5wPq5cZaGogDo
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>This patch is an update to following patches.<br /><a href=3D"https://=
lists.openembedded.org/g/openembedded-core/topic/117252728">https://lists.o=
penembedded.org/g/openembedded-core/topic/117252728</a> [PATCH] llvm: enabl=
e LLVMgold.so build by adding binutils dependency<br /><a href=3D"https://l=
ists.openembedded.org/g/openembedded-core/topic/patch_v2_llvm_enable/117274=
480">https://lists.openembedded.org/g/openembedded-core/topic/patch_v2_llvm=
_enable/117274480</a> [PATCH v2] llvm: enable LLVMgold.so build by adding b=
inutils dependency<br /><br />When build component using clang that utilize=
 lto, and when the LLD linker connot be used (Use bfd), the LLVMgold.so plu=
gin is required in the native sysroot.<br />LLVMgold.so plugin is generated=
 when binutils-plugin is enabled.<br />libLTO.so.21.1 is generated on the t=
arget even if it is not enabled.<br /><br />The reason they were bundled in=
 to the same package is to distribute them via the nativesdk package.<br />=
<br />As Deepesh suggested, I mae it possible to enable this via the binuti=
ls-plugin rather than having it always built into LLVM.<br />The name "binu=
tils-plugin" was inspired by gentoo's name convention. https://packages.gen=
too.org/useflags/binutils-plugin</div>

--it0fdsR5wPq5cZaGogDo--

