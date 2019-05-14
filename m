Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
	[209.85.214.194])
	by mail.openembedded.org (Postfix) with ESMTP id AD6697DEAB
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 May 2019 04:54:27 +0000 (UTC)
Received: by mail-pl1-f194.google.com with SMTP id d3so7584106plj.11
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 May 2019 21:54:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=Vbyk+vrq6ZXQUR8D7icUmB6YmffMuv0E12wjr2BLX4Y=;
	b=uhNLanSTsl/7baLj2w7suGs7kDYbSQxupV3WfQIKDMZfoKU+pybYjyKSwirUtfu0OB
	NALPSVuqNvfSUw/3GGARS/yi/CvCZbJHG2XL3Zg71sHKB9fL8MRnPXDZGAFEU8QGQR4z
	UJ7fHPFsxDex5ttZYNDz48wvOGGYDH21TxD85ZHfHSNXGhdDu7QIOkJUi+wsCzT9daF/
	6bDflrSyJ5dEQHCZ2PbxtIk5XD7Nv05rysCbc4IEiTvWpUBTFSZULYq/iZcputsn0826
	h6Uf+a3moebszNH0THmRyvL9JCcoqSgYgNdxDqlY8H6v/3B06/Ue6QPoln/AmfHV8mp0
	YU2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=Vbyk+vrq6ZXQUR8D7icUmB6YmffMuv0E12wjr2BLX4Y=;
	b=n1+iCv229WWLajv1wYLyZojLpSkNqytx466z2p80Di+PaSov2N1Q6/SVrFKJxnxzkD
	Oa/rFUEDeOcS5HkwjlvpBNMtJlubl5OJvg/n9BzhS0RJqPbZBLw36Z4QGeg4Irz8yVzJ
	pzJxeDCkah6U3eaocAbWrkUPWMRmBYTZ7CBFuXBqcEHGwhvl1LOIYXRaWbW+IKRwLsd9
	mg0Ez0aU2orGPl7aQyupiM3A9aHZknI78hVbFELcBFt5I1WBb0XJ1iPQqcLdgC/iejfM
	1jA8/kDecCe6n6UxKI1Xn0+TQI8ymZ9hh86qqVesrebgqU5u3qR83zGYz94PQbXra2jf
	lETQ==
X-Gm-Message-State: APjAAAXIpchIs5VAEV1INa9FpBFxTCkM9v0GISNjeAFPq82l6F25FUCu
	Rb1ZZNuodqB8/J8ixfXwiYvMbdcd
X-Google-Smtp-Source: APXvYqwHFidZl3ok3BVQHWrlHYs/jbtA7DYBb7sPYQRU1QY+CKF8T7Kd+ObHuY7zqfalInWjzAThpQ==
X-Received: by 2002:a17:902:e183:: with SMTP id
	cd3mr35548534plb.233.1557809668956; 
	Mon, 13 May 2019 21:54:28 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:c33:d909:eb3d:d2ab:fd1d])
	by smtp.gmail.com with ESMTPSA id
	q75sm5698451pfa.175.2019.05.13.21.54.28
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 13 May 2019 21:54:28 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 13 May 2019 21:54:05 -0700
Message-Id: <334fb1db7bcf7456c9db263080cd281571c512dd.1557809500.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1557809500.git.akuster808@gmail.com>
References: <cover.1557809500.git.akuster808@gmail.com>
Subject: [PATCH 23/23] gdb: Fix aarch64 build with musl
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
X-List-Received-Date: Tue, 14 May 2019 04:54:28 -0000

From: Paul Barker <paul@betafive.co.uk>

Signed-off-by: Paul Barker <paul@betafive.co.uk>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-devtools/gdb/gdb-8.2.1.inc            |  1 +
 ...-AArch64-Fix-the-gdb-build-with-musl-libc.patch | 52 ++++++++++++++++++++++
 2 files changed, 53 insertions(+)
 create mode 100644 meta/recipes-devtools/gdb/gdb/0012-AArch64-Fix-the-gdb-build-with-musl-libc.patch

diff --git a/meta/recipes-devtools/gdb/gdb-8.2.1.inc b/meta/recipes-devtools/gdb/gdb-8.2.1.inc
index cb8d189..f28b574 100644
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
index 0000000..f35033c
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
+Upstream-Status: Backport
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
2.7.4


