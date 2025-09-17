Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BA15CAC598
	for <webhook@archiver.kernel.org>; Wed, 17 Sep 2025 11:06:32 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.web10.19912.1758107180828079062
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Sep 2025 04:06:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=K54FRz8O;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id D81BE4E40CA1
	for <openembedded-core@lists.openembedded.org>; Wed, 17 Sep 2025 11:06:18 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 955CE6063E;
	Wed, 17 Sep 2025 11:06:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 07416102F1A2B;
	Wed, 17 Sep 2025 13:06:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1758107177; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=NbUwOFmB58KFSwe/ZPP5gGh9aGm3jSk1N7ipxLFA8Q0=;
	b=K54FRz8O72ok9UBVralE0hcb3buYrs/H8+2VrpzO3IgG3RJ9J1iRtbk94GnPgv390Or9sm
	6cuP2Ls8KamprN3c0CUXahtEdeKaYxOYTQAS51pXi8C2SgAWJcbRgyAsa4yfpCUgIitcCd
	eGMpLf5BTbhUN8vt2PNOqCIqDfwThW81hFRd2rrQpo6es0N6vkN4BgxAgYk6lBSgW6/Rbi
	fh75pFYMdT5PHWEYqnD5uNlTB6YuFHs1T4zHBLKBtB2PuRQ/tZ4PVqXWv7VmUjxf4jPTsE
	uKqYzUD54MogubEE9QR/rQoAc4Dfk9lvXQohtE0FGijvSnbr4mOo1vJh+fu03A==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 17 Sep 2025 13:06:15 +0200
Message-Id: <DCV0ZAHF908J.1UVS55MZ1J8G3@bootlin.com>
To: <ross.burton@arm.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v3 1/8] clang: improve opt-viewer
 PACKAGECONFIG
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20250915191109.1117663-1-ross.burton@arm.com>
In-Reply-To: <20250915191109.1117663-1-ross.burton@arm.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Sep 2025 11:06:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223591

On Mon Sep 15, 2025 at 9:11 PM CEST, Ross Burton via lists.openembedded.org=
 wrote:
> Instead of patching the python module detection, we can use the hidden
> option LLVM_TOOL_OPT_VIEWER_BUILD.
>
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---

Hi Ross,

Sorry, but it looks like one of these patches is breaking tc tests:

ERROR: clang-native-21.1.1-r0 do_compile: Execution of '/srv/pokybuild/yoct=
o-worker/qemuarm64-tc/build/build-st-3689262/tmp/work/x86_64-linux/clang-na=
tive/21.1.1/temp/run.do_compile.1114131' failed with exit code 1
...
/clang-tblgen.dir/ClangCommentHTMLNamedCharacterReferenceEmitter.cpp.o util=
s/TableGen/CMakeFiles/clang-tblgen.dir/ClangCommentHTMLTagsEmitter.cpp.o ut=
ils/TableGen/CMakeFiles/clang-tblgen.dir/ClangDataCollectorsEmitter.cpp.o u=
tils/TableGen/CMakeFiles/clang-tblgen.dir/ClangDiagnosticsEmitter.cpp.o uti=
ls/TableGen/CMakeFiles/clang-tblgen.dir/ClangOpcodesEmitter.cpp.o utils/Tab=
leGen/CMakeFiles/clang-tblgen.dir/ClangOpenCLBuiltinEmitter.cpp.o utils/Tab=
leGen/CMakeFiles/clang-tblgen.dir/ClangOptionDocEmitter.cpp.o utils/TableGe=
n/CMakeFiles/clang-tblgen.dir/ClangSACheckersEmitter.cpp.o utils/TableGen/C=
MakeFiles/clang-tblgen.dir/ClangSyntaxEmitter.cpp.o utils/TableGen/CMakeFil=
es/clang-tblgen.dir/ClangTypeNodesEmitter.cpp.o utils/TableGen/CMakeFiles/c=
lang-tblgen.dir/MveEmitter.cpp.o utils/TableGen/CMakeFiles/clang-tblgen.dir=
/NeonEmitter.cpp.o utils/TableGen/CMakeFiles/clang-tblgen.dir/RISCVVEmitter=
.cpp.o utils/TableGen/CMakeFiles/clang-tblgen.dir/SveEmitter.cpp.o utils/Ta=
bleGen/CMakeFiles/clang-tblgen.dir/TableGen.cpp.o -o bin/clang-tblgen  /srv=
/pokybuild/yocto-worker/qemuarm64-tc/build/build-st-3689262/tmp/work/x86_64=
-linux/clang-native/21.1.1/recipe-sysroot-native/usr/lib/libLLVMSupport.a  =
/srv/pokybuild/yocto-worker/qemuarm64-tc/build/build-st-3689262/tmp/work/x8=
6_64-linux/clang-native/21.1.1/recipe-sysroot-native/usr/lib/libLLVMTableGe=
n.a  /srv/pokybuild/yocto-worker/qemuarm64-tc/build/build-st-3689262/tmp/wo=
rk/x86_64-linux/clang-native/21.1.1/recipe-sysroot-native/usr/lib/libLLVMSu=
pport.a  -lrt  -ldl  -lm  -lz  -lzstd  /srv/pokybuild/yocto-worker/qemuarm6=
4-tc/build/build-st-3689262/tmp/work/x86_64-linux/clang-native/21.1.1/recip=
e-sysroot-native/usr/lib/libLLVMDemangle.a && :
| /srv/pokybuild/yocto-worker/qemuarm64-tc/build/build-st-3689262/tmp/hostt=
ools/ld: /srv/pokybuild/yocto-worker/qemuarm64-tc/build/build-st-3689262/tm=
p/work/x86_64-linux/clang-native/21.1.1/recipe-sysroot-native/usr/lib/libLL=
VMTableGen.a(TGLexer.cpp.o): in function `llvm::TGLexer::LexNumber() [clone=
 .localalias]':
| TGLexer.cpp:(.text._ZN4llvm7TGLexer9LexNumberEv+0xea): undefined referenc=
e to `__isoc23_strtoll'
| /srv/pokybuild/yocto-worker/qemuarm64-tc/build/build-st-3689262/tmp/hostt=
ools/ld: TGLexer.cpp:(.text._ZN4llvm7TGLexer9LexNumberEv+0xf1): undefined r=
eference to `__isoc23_strtoull'

https://autobuilder.yoctoproject.org/valkyrie/#/builders/5/builds/2313
https://autobuilder.yoctoproject.org/valkyrie/#/builders/28/builds/2308

On the good news, reproducibility issues seem to be gone.

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


