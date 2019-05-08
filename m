Return-Path: <paul@betafive.co.uk>
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
	[66.111.4.26])
	by mail.openembedded.org (Postfix) with ESMTP id 2CAC77DE62
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 May 2019 11:58:44 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.nyi.internal (Postfix) with ESMTP id 3697623C0B;
	Wed,  8 May 2019 07:58:46 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
	by compute1.internal (MEProxy); Wed, 08 May 2019 07:58:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=betafive.co.uk;
	h=from:to:cc:subject:date:message-id:in-reply-to:references; s=
	fm1; bh=eQ40WO7Xnk+FkrObnCXkp2u6T1NbCWPam4uNlyygo2E=; b=wQkSm0AR
	n18nZQX/o47khzFpndy4LO7B7JBUb2Lk0gttXY7eFpG/ijJaYWdF3YN9F34MBymW
	8T3AzCDRMmnQN5H2dmFJYnkcBoLMIeBngwwsG4NLbGfV7I9v6/Jp1oY+f1bl2lti
	Ij9JTC83neRRA+H5Oe6/SPakyvSJJxAA2lt26WpLuMYifIq1UI79w20OWAdLxZel
	vmlTSgaXf/6yr4KsO7z4bLkHGltFUYdmwSziAdZk+0SdS4t1Ew65XiohOVteeGDi
	agWDWjn/B2LFoe2c2TAy0M986PMdFEkFgrcFvndfniXK9TuqPmd2LWNpRH7YGQoS
	l/zlWeznnNV8Tw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:date:from:in-reply-to:message-id
	:references:subject:to:x-me-proxy:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; bh=eQ40WO7Xnk+FkrObnCXkp2u6T1NbC
	WPam4uNlyygo2E=; b=l3L1TA88cDCOCQ9OGLMey6i7KX71Rd2/7Y0xT6nWPeBlM
	EJgc4XPNPtw/JHWfu4qaSy8/h8UVKhQ1PShkvaMqf675RPO+r39Dq9M/yhwFzTyX
	hqfOd7YPM+n4Ikn5xTiRGSPsWaOnolIBtRQ8pOB8h5LWq6E3ejz/x9JNGs7YHZHt
	DTIHdQEiHDdeiRQbCIwYe0id309b0vST6xKnH9QQQkU5YC5g8rzU33lB9zk81cMg
	jUgognBbMkj/x1y9kVicaUcBEGkKODL/buuWUQ2ePIsefHcNsP+g3ZYi/hOZxGzZ
	FPop0fbJT9fps73zpU6Af4dR2LJNJd5d7t7qeR99g==
X-ME-Sender: <xms:dcTSXDV6fLYSM55zUfkWQfptR9bsjeuTSObksnQDmRFGU_4giDv00A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrkeefgdeghecutefuodetggdotefrodftvf
	curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
	uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
	fjughrpefhvffufffkofgjfhestddtredtredttdenucfhrhhomhepphgruhhlsegsvght
	rghfihhvvgdrtghordhukhenucffohhmrghinhepghhnuhdrohhrghenucfkphepkedurd
	dukeejrdefvddrudefkeenucfrrghrrghmpehmrghilhhfrhhomhepphgruhhlsegsvght
	rghfihhvvgdrtghordhukhenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:dsTSXJ3WG_-PIYh5MydTbV22pRb2aZ65xs5WUyhY6vau1fpTVnxhUw>
	<xmx:dsTSXIhmMD94v8Mqe6KIba3Pv1KOw0fKYVjbFlGUG_IADljsiBqiuA>
	<xmx:dsTSXPgBr2afCcN3Th5Fvu2p42MjbAAb-vMcj62SuQEhtDQ5XOtvVA>
	<xmx:dsTSXB6Cfh9JoC8V2-miNHYxOs66FnX5nIyTrgklO3EsH8A04bKANw>
Received: from alpha.home.b5net.uk (138.32.187.81.in-addr.arpa [81.187.32.138])
	by mail.messagingengine.com (Postfix) with ESMTPA id 77446103CB;
	Wed,  8 May 2019 07:58:45 -0400 (EDT)
From: paul@betafive.co.uk
To: openembedded-core@lists.openembedded.org
Date: Wed,  8 May 2019 11:58:35 +0000
Message-Id: <20190508115836.15758-2-paul@betafive.co.uk>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190508115836.15758-1-paul@betafive.co.uk>
References: <20190508115836.15758-1-paul@betafive.co.uk>
Subject: [PATCH 1/2] gdb: Fix aarch64 build with musl
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 08 May 2019 11:58:45 -0000

From: Paul Barker <paul@betafive.co.uk>

Signed-off-by: Paul Barker <paul@betafive.co.uk>
---
 meta/recipes-devtools/gdb/gdb-8.2.1.inc       |  1 +
 ...h64-Fix-the-gdb-build-with-musl-libc.patch | 52 +++++++++++++++++++
 2 files changed, 53 insertions(+)
 create mode 100644 meta/recipes-devtools/gdb/gdb/0012-AArch64-Fix-the-gdb-build-with-musl-libc.patch

diff --git a/meta/recipes-devtools/gdb/gdb-8.2.1.inc b/meta/recipes-devtools/gdb/gdb-8.2.1.inc
index cb8d189f2a..f28b57439c 100644
--- a/meta/recipes-devtools/gdb/gdb-8.2.1.inc
+++ b/meta/recipes-devtools/gdb/gdb-8.2.1.inc
@@ -18,6 +18,7 @@ SRC_URI = "http://ftp.gnu.org/gnu/gdb/gdb-${PV}.tar.xz \
            file://gdbserver-ctrl-c-handling.patch \
            file://0001-Fix-build-with-latest-GCC-9.0-tree.patch \
            file://CVE-2017-9778.patch \
+           file://0012-AArch64-Fix-the-gdb-build-with-musl-libc.patch \
 "
 SRC_URI[md5sum] = "f8b2562e830a4098dd5b5ea9e9296c70"
 SRC_URI[sha256sum] = "0a6a432907a03c5c8eaad3c3cffd50c00a40c3a5e3c4039440624bae703f2202"
diff --git a/meta/recipes-devtools/gdb/gdb/0012-AArch64-Fix-the-gdb-build-with-musl-libc.patch b/meta/recipes-devtools/gdb/gdb/0012-AArch64-Fix-the-gdb-build-with-musl-libc.patch
new file mode 100644
index 0000000000..cafc4a871c
--- /dev/null
+++ b/meta/recipes-devtools/gdb/gdb/0012-AArch64-Fix-the-gdb-build-with-musl-libc.patch
@@ -0,0 +1,52 @@
+From cbbf1a8ba7f037ba3b83f090829edcbab542c285 Mon Sep 17 00:00:00 2001
+From: Szabolcs Nagy <szabolcs.nagy@arm.com>
+Date: Thu, 13 Dec 2018 17:47:17 +0000
+Subject: [PATCH] AArch64: Fix the gdb build with musl libc
+
+Including asm/sigcontext.h together with libc headers is not valid. In
+general linux headers may not work with libc headers, so mixing them
+should be avoided, especially when the linux header defines types that
+are also exposed in libc headers.
+
+In case of asm/sigcontext.h glibc happens to work because glibc signal.h
+directly includes it, but e.g. in musl libc signal.h replicates the
+sigcontext.h definitions in an abi compatible way which are in conflict
+with the linux definitions when both headers are included.
+
+Since old linux headers or old libc headers may not have the necessary
+definitions, gdb has to replicate the definitions it relies on anyway.
+Which is fine since all definitions must be ABI stable. For linux apis
+that are not available via libc headers, replicating the definitions in
+gdb is the most reliable way to use them.
+
+Note: asm/ptrace.h includes asm/sigcontext.h in some versions of linux
+headers, which is just as problematic and should be fixed in linux.
+
+gdb/ChangeLog:
+
+	* nat/aarch64-sve-linux-ptrace.h: Include signal.h instead of
+	asm/sigcontext.h.
+
+[ChangeLog entry stripped so that patch applies cleanly]
+Upstream-status: Backport
+Signed-off-by: Paul Barker <paul@betafive.co.uk>
+---
+ gdb/nat/aarch64-sve-linux-ptrace.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/gdb/nat/aarch64-sve-linux-ptrace.h b/gdb/nat/aarch64-sve-linux-ptrace.h
+index 029e753ffe..172ae39432 100644
+--- a/gdb/nat/aarch64-sve-linux-ptrace.h
++++ b/gdb/nat/aarch64-sve-linux-ptrace.h
+@@ -20,7 +20,7 @@
+ #ifndef AARCH64_SVE_LINUX_PTRACE_H
+ #define AARCH64_SVE_LINUX_PTRACE_H
+ 
+-#include <asm/sigcontext.h>
++#include <signal.h>
+ #include <sys/utsname.h>
+ #include <sys/ptrace.h>
+ #include <asm/ptrace.h>
+-- 
+2.17.1
+
-- 
2.17.1


