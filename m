Return-Path: <paul@betafive.co.uk>
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
	[66.111.4.26])
	by mail.openembedded.org (Postfix) with ESMTP id 799EA7DE62
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 May 2019 11:58:45 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.nyi.internal (Postfix) with ESMTP id B44822204E;
	Wed,  8 May 2019 07:58:46 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
	by compute1.internal (MEProxy); Wed, 08 May 2019 07:58:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=betafive.co.uk;
	h=from:to:cc:subject:date:message-id:in-reply-to:references; s=
	fm1; bh=iDIzqVVb2TPfq4s5MNSNFNofMICyngK4gmsLZxHcYEM=; b=lhw1cy5d
	iH1BxewbasvPGCMDKoavZtFvDXLJYms9+NSiidOpxf9SpJf3iYmWzZ2EhcKjTxPt
	uri8df3W1fd1ZipHOv3oE7qXzrr0+bebtvlVArTKhgl55HgYB5vhLKRnfwsB2zcl
	+8du16gnzkLSP6u5pKtPsVrjTSG0k5ZXemHvvCmzGwBkZi4q1VITDFjMQExfotuO
	4DOC56+zU9BTt0idhDZUGuD9mYtzQ2zOA8bev0qauQGe2BHOc8PEsy7zmBA/Wft1
	DWWF3MvWwfYZhPhrmfCnJKtOjuoj3SW+XjNajUA2dgC4y37NSvR9jhCAlt+DoPMz
	kfJbsvEoIQXhSw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:date:from:in-reply-to:message-id
	:references:subject:to:x-me-proxy:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; bh=iDIzqVVb2TPfq4s5MNSNFNofMICyn
	gK4gmsLZxHcYEM=; b=wXH/PkizvYM1zNGXk9ZlbTfeXGm5UJGvpV+/bkoF8z/Wi
	pSmkL0dkqD9CYWbWu3YMGjQOt070qF7LH4M1thzMNEBlLnZVU5dPuuDnY0PpN9U3
	QeTb3zbeUwy+rF0ozVaoyeZ3O3M5pgBXY8xL75fZ/2Niozhe9S02Oy1O7hTqnOd+
	/FADU9y7Uyv1LNcKe+q8VUHb07+BZKTrqOPwmHnXHPdC+UyVdRGuaetwn1vTSQH5
	qy485KhWPUeBtYe+b+j8B/bYRt1Du0GdOye+86E5/T++uuPS/512HWOEKX9tcERO
	t0zljuZ8V1sN1GcU13I+x7qUS4FVmf7wNpeRrIkLg==
X-ME-Sender: <xms:dsTSXGkSXDLTAKv1-bmyOum57ijRBK5FIoX5EJ3Lbb35H3T1d4qY3Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrkeefgdeghecutefuodetggdotefrodftvf
	curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
	uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
	fjughrpefhvffufffkofgjfhestddtredtredttdenucfhrhhomhepphgruhhlsegsvght
	rghfihhvvgdrtghordhukhenucffohhmrghinhepghhithhhuhgsrdgtohhmpdhsthhrrg
	gtvgdrihhonecukfhppeekuddrudekjedrfedvrddufeeknecurfgrrhgrmhepmhgrihhl
	fhhrohhmpehprghulhessggvthgrfhhivhgvrdgtohdruhhknecuvehluhhsthgvrhfuih
	iivgeptd
X-ME-Proxy: <xmx:dsTSXCLOPY7IM_NCAsHsT-oxWA-3r3xPbPY7hh5w_AIf3HYmpL4zdw>
	<xmx:dsTSXPDfTU5hFYrQPj7KEnRor6qYD0o_r9xngQnjZa07dmm6NX1QYg>
	<xmx:dsTSXImPQ1-D-5Cldx7rHE-4Q1GKAmatL00mvhXtqDiL-u9QUaGziw>
	<xmx:dsTSXKFYuGrBfmKAtNE1br5mNTCX-BxSeRncbRotmvMYpFhXoCuJ2g>
Received: from alpha.home.b5net.uk (138.32.187.81.in-addr.arpa [81.187.32.138])
	by mail.messagingengine.com (Postfix) with ESMTPA id 03394103CC;
	Wed,  8 May 2019 07:58:45 -0400 (EDT)
From: paul@betafive.co.uk
To: openembedded-core@lists.openembedded.org
Date: Wed,  8 May 2019 11:58:36 +0000
Message-Id: <20190508115836.15758-3-paul@betafive.co.uk>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190508115836.15758-1-paul@betafive.co.uk>
References: <20190508115836.15758-1-paul@betafive.co.uk>
Subject: [PATCH 2/2] strace: Fix aarch64 build with musl
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
 .../strace/strace/musl-fixes-armv8.patch      | 29 +++++++++++++++++++
 meta/recipes-devtools/strace/strace_4.26.bb   |  1 +
 2 files changed, 30 insertions(+)
 create mode 100644 meta/recipes-devtools/strace/strace/musl-fixes-armv8.patch

diff --git a/meta/recipes-devtools/strace/strace/musl-fixes-armv8.patch b/meta/recipes-devtools/strace/strace/musl-fixes-armv8.patch
new file mode 100644
index 0000000000..185d1bef56
--- /dev/null
+++ b/meta/recipes-devtools/strace/strace/musl-fixes-armv8.patch
@@ -0,0 +1,29 @@
+Fixes on musl + armv8:
+
+error: redefinition of 'struct prctl_mm_map'
+ struct prctl_mm_map {
+        ^~~~~~~~~~~~
+In file included from work/aarch64-lmp-linux-musl/strace/4.26-r0/recipe-sysroot/usr/include/asm/ptrace.h:67,
+                 from work/aarch64-lmp-linux-musl/strace/4.26-r0/recipe-sysroot/usr/include/linux/ptrace.h:107,
+                 from ../strace-4.26/ptrace.h:36,
+                 from ../strace-4.26/strace.c:16:
+work/aarch64-lmp-linux-musl/strace/4.26-r0/recipe-sysroot/usr/include/linux/prctl.h:134:8: note: originally defined here
+ struct prctl_mm_map {
+        ^~~~~~~~~~~~
+
+[From: https://github.com/foundriesio/meta-lmp, thanks to Ricardo Salveti]
+Upstream-status: Pending
+Signed-off-by: Paul Barker <paul@betafive.co.uk>
+
+Index: strace-4.26/strace.c
+===================================================================
+--- strace-4.26.orig/strace.c
++++ strace-4.26/strace.c
+@@ -26,7 +26,7 @@
+ #include <locale.h>
+ #include <sys/utsname.h>
+ #ifdef HAVE_PRCTL
+-# include <sys/prctl.h>
++# include <linux/prctl.h>
+ #endif
+ #include <asm/unistd.h>
diff --git a/meta/recipes-devtools/strace/strace_4.26.bb b/meta/recipes-devtools/strace/strace_4.26.bb
index 24f92c99e5..b71122babf 100644
--- a/meta/recipes-devtools/strace/strace_4.26.bb
+++ b/meta/recipes-devtools/strace/strace_4.26.bb
@@ -15,6 +15,7 @@ SRC_URI = "https://strace.io/files/${PV}/strace-${PV}.tar.xz \
            file://0001-caps-abbrev.awk-fix-gawk-s-path.patch \
            file://0001-tests-sigaction-Check-for-mips-and-alpha-before-usin.patch \
            file://0001-mips-o32-fix-build.patch \
+           file://musl-fixes-armv8.patch \
            "
 SRC_URI[md5sum] = "daa51acc0c7c696221ec03cf0b30a7af"
 SRC_URI[sha256sum] = "7c4d2ffeef4f7d1cdc71062ca78d1130eb52f947c2fca82f59f6a1183bfa1e1c"
-- 
2.17.1


