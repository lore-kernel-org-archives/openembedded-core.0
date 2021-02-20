Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com [64.147.123.25])
 by mx.groups.io with SMTP id smtpd.web10.1358.1613783587546438373
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Feb 2021 17:13:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gherzan.com header.s=fm1 header.b=DB/Qs/7j;
 spf=pass (domain: gherzan.com, ip: 64.147.123.25, mailfrom: andrei@gherzan.com)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.west.internal (Postfix) with ESMTP id 04D1F2DE;
	Fri, 19 Feb 2021 20:13:06 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Fri, 19 Feb 2021 20:13:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gherzan.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding; s=fm1; bh=upv1sumMG36Bc
	NqT43oOCNYbdH2hf/Yvu7/8uNsk19k=; b=DB/Qs/7jXAKSSh6pibmSifKC5No74
	qFJR7tMLRgVT15l6gthO1AosvxgWEm9hs1sp1aI9XdbBfoWmDe8Ynya1pP3+WQ/G
	S8l0mwHxaAyAczlUWmPmEkQDSJ2DcGPfXZ2PvWuIPptkWIxuP/pTr9pEnfTcFJH7
	MFdluHPmJ4shU08nb518coESQVxE0zNpwDya2bn0fhDdHCmsNxE+uQ5wTA+lvgKr
	wmPr4ECX5noRalGuaAyDxPdIyhrVmrr+8sWgJr/kCTa+FgZhXIab+1XdintUrVsk
	toHgp+Z+0Ugo993yLpZ5WmKFmgIPg/f0/W9zZbAEHJFFVOf31N5a2Q+xQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:date:from
	:in-reply-to:message-id:mime-version:references:subject:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; bh=upv1sumMG36BcNqT43oOCNYbdH2hf/Yvu7/8uNsk19k=; b=MprirRcZ
	WzmjIw0ZPLgXFpDzGGyVPcZM7rp9zjy2x9P+XVTp3Ad8/WHXQZ25tfphyi6oC5vo
	PZg7fSaSgLY+k0BNdkdd96nfCMmQ5ioxn8ogGOvLJytfYjX69A8vlOanO/oapa88
	+masp6YOu/zqEOmVXuz1HEQp0iWnlM29nEXrpZSdqpxJyVTwznjtIpguEo/UVejN
	bCExEnmvB+WOjcM1v5RNwl6W6fc9fSitN4aEtK76V5fqujo2IjpFAxQ1XNdekhbm
	hxD2fVEnYVjMZDZVeQiu+q5S+77jujTbk2hEJa237oS+EzSksdk+SgC3G5u8f0qd
	xNgcGv9yJyOzDg==
X-ME-Sender: <xms:ImIwYEUuo-51nUI2v-vXlbsutDeYAurlu4dMolFp8sDC5pmn4oKhsA>
    <xme:ImIwYInNnvxkZqTvX2oaRUdImIrc1pTt9O2g8gswIqNCKZCsCP3a9nGiIT4H-zr5Z
    kqJq3ha4Z99Eq-s_Uo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrjeejgdeftdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtkeertd
    ertddtnecuhfhrohhmpeetnhgurhgvihcuifhhvghriigrnhcuoegrnhgurhgvihesghhh
    vghriigrnhdrtghomheqnecuggftrfgrthhtvghrnhepvdeufedvueefudffteeffeeihf
    efhfeuuedtudekhfekgfffvdeghedukeffgffgnecuffhomhgrihhnpehqvghmuhdrohhr
    ghenucfkphepkeeirddufedtrddugeeirdduvddvnecuvehluhhsthgvrhfuihiivgeptd
    enucfrrghrrghmpehmrghilhhfrhhomheprghnughrvghisehghhgvrhiirghnrdgtohhm
X-ME-Proxy: <xmx:ImIwYIbx8nuUA5F0_KSXPWGWRdVaWuhIbygCJZw-RO0gRf2CmkoJMA>
    <xmx:ImIwYDWm2ivtBE4aYQY8jtQJDLxglAdt4_QpAF_lajaXWuqiRlghxw>
    <xmx:ImIwYOkmjIgcYSl7wJvJHdVc1jm19J-_gJTZ0L-nYZ8DAez9OhknZQ>
    <xmx:ImIwYITIsW3x4V2txBfV6aBw0gl3pnaGFR1MBrMV6emqSHE_7hWPYw>
Received: from qwirkle.internal (host86-130-146-122.range86-130.btcentralplus.com [86.130.146.122])
	by mail.messagingengine.com (Postfix) with ESMTPA id DF8E724005B;
	Fri, 19 Feb 2021 20:13:05 -0500 (EST)
From: "Andrei Gherzan" <andrei@gherzan.com>
To: openembedded-core@lists.openembedded.org
Cc: Andrei Gherzan <andrei.gherzan@huawei.com>
Subject: [dunfell][PATCH 4/4] qemu: Backport patch to avoid assertion fails on icache line size
Date: Sat, 20 Feb 2021 01:12:55 +0000
Message-Id: <20210220011255.823050-4-andrei@gherzan.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210220011255.823050-1-andrei@gherzan.com>
References: <20210220011255.823050-1-andrei@gherzan.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Andrei Gherzan <andrei.gherzan@huawei.com>

Due to a bug in glibc 2.33, the value of the icache line size is now
reported as unsupported option. This breaks qemu at runtime with:

cacheinfo.c:182: init_cache_info: Assertion `(isize & (isize - 1)) == 0'
failed.
Aborted (core dumped)

We haven't caught this one yet because we were already on qemu 5.2.0
when we started to play with glibc 2.33 so it was only reproducible on
dunfell.

Signed-off-by: Andrei Gherzan <andrei.gherzan@huawei.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |  1 +
 ...fix-crash-when-compiling-with-uClibc.patch | 48 +++++++++++++++++++
 2 files changed, 49 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/0012-util-cacheinfo-fix-crash-when-compiling-with-uClibc.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 7a963ad57c..a1a418374f 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -28,6 +28,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://0009-Fix-webkitgtk-builds.patch \
            file://0010-configure-Add-pkg-config-handling-for-libgcrypt.patch \
            file://0011-hw-i386-pc-fix-regression-in-parsing-vga-cmdline-par.patch \
+           file://0012-util-cacheinfo-fix-crash-when-compiling-with-uClibc.patch \
            file://CVE-2019-15890.patch \
            file://CVE-2020-1711.patch \
            file://CVE-2020-7039-1.patch \
diff --git a/meta/recipes-devtools/qemu/qemu/0012-util-cacheinfo-fix-crash-when-compiling-with-uClibc.patch b/meta/recipes-devtools/qemu/qemu/0012-util-cacheinfo-fix-crash-when-compiling-with-uClibc.patch
new file mode 100644
index 0000000000..741a4fce0e
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/0012-util-cacheinfo-fix-crash-when-compiling-with-uClibc.patch
@@ -0,0 +1,48 @@
+From 00b5032eaddb7193f03f0a28b10286244d2e2a7b Mon Sep 17 00:00:00 2001
+From: Carlos Santos <casantos@redhat.com>
+Date: Thu, 17 Oct 2019 09:37:13 -0300
+Subject: [PATCH 1/1] util/cacheinfo: fix crash when compiling with uClibc
+
+uClibc defines _SC_LEVEL1_ICACHE_LINESIZE and _SC_LEVEL1_DCACHE_LINESIZE
+but the corresponding sysconf calls returns -1, which is a valid result,
+meaning that the limit is indeterminate.
+
+Handle this situation using the fallback values instead of crashing due
+to an assertion failure.
+
+Signed-off-by: Carlos Santos <casantos@redhat.com>
+Message-Id: <20191017123713.30192-1-casantos@redhat.com>
+Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
+
+Upstream-status: Backport
+Signed-off-by: Andrei Gherzan <andrei.gherzan@huawei.com>
+---
+ util/cacheinfo.c | 10 ++++++++--
+ 1 file changed, 8 insertions(+), 2 deletions(-)
+
+diff --git a/util/cacheinfo.c b/util/cacheinfo.c
+index ea6f3e99bf..d94dc6adc8 100644
+--- a/util/cacheinfo.c
++++ b/util/cacheinfo.c
+@@ -93,10 +93,16 @@ static void sys_cache_info(int *isize, int *dsize)
+ static void sys_cache_info(int *isize, int *dsize)
+ {
+ # ifdef _SC_LEVEL1_ICACHE_LINESIZE
+-    *isize = sysconf(_SC_LEVEL1_ICACHE_LINESIZE);
++    int tmp_isize = (int) sysconf(_SC_LEVEL1_ICACHE_LINESIZE);
++    if (tmp_isize > 0) {
++        *isize = tmp_isize;
++    }
+ # endif
+ # ifdef _SC_LEVEL1_DCACHE_LINESIZE
+-    *dsize = sysconf(_SC_LEVEL1_DCACHE_LINESIZE);
++    int tmp_dsize = (int) sysconf(_SC_LEVEL1_DCACHE_LINESIZE);
++    if (tmp_dsize > 0) {
++        *dsize = tmp_dsize;
++    }
+ # endif
+ }
+ #endif /* sys_cache_info */
+-- 
+2.30.1
+
-- 
2.30.1

