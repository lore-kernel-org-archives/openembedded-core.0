Return-Path: <petter@technux.se>
Received: from vsp-authed-03-02.binero.net (vsp-authed02.binero.net
	[195.74.38.226])
	by mail.openembedded.org (Postfix) with ESMTP id 0950F61FE4
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 May 2014 21:20:26 +0000 (UTC)
Received: from smtp01.binero.se (unknown [195.74.38.28])
	by vsp-authed-03-02.binero.net (Halon Mail Gateway) with ESMTPS;
	Wed,  7 May 2014 23:20:40 +0200 (CEST)
Received: from eldbvzzwp1-7x.lan (81-229-90-163-no67.tbcn.telia.com
	[81.229.90.163]) (Authenticated sender: petter@technux.se)
	by smtp-10-01.atm.binero.net (Postfix) with ESMTPSA id 05F923A15A;
	Wed,  7 May 2014 23:20:15 +0200 (CEST)
From: =?UTF-8?q?Petter=20Mab=C3=A4cker?= <petter@technux.se>
To: openembedded-core@lists.openembedded.org
Date: Wed,  7 May 2014 23:19:58 +0200
Message-Id: <d99d79edfdd8bfe3940aea651f0d31cc0cf36c26.1399497346.git.petter@technux.se>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <b481b46603ad2ee97a9cc55890293e24db85b8e7.1399497346.git.petter@technux.se>
References: <b481b46603ad2ee97a9cc55890293e24db85b8e7.1399497346.git.petter@technux.se>
In-Reply-To: <cover.1399497346.git.petter@technux.se>
References: <cover.1399497346.git.petter@technux.se>
MIME-Version: 1.0
Subject: [PATCH 12/13] uclibc: remove usage of FILESPATH
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
X-List-Received-Date: Wed, 07 May 2014 21:20:28 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Fixes [YOCTO #4497]

Usage of FILESPATH is discouraged, since it can make recipes harder to
bbappend. Current patchdir in uclibc are shared, rename them to
files instead, since it's included in base FILESPATH.

Signed-off-by: Petter Mabäcker <petter@technux.se>
---
 .../0001-Add-eventfd_read-and-eventfd_write.patch  |    0
 ...nt.c-wtent.c-move-functions-from-utxent.c.patch |    0
 ...1-atexit_old-Do-not-add-it-to-shared-libc.patch |    0
 ...brt-Use-nodefaultlibs-instead-of-nostdlib.patch |    0
 ...-Move-aeabi_read_tp-to-uclibc_nonshared.a.patch |    0
 ...rk-Hide-pthread_atfork-in-shared-versions.patch |    0
 .../0002-wire-setns-syscall.patch                  |    0
 ...tl.h-Define-F_SETPIPE_SZ-and-F_GETPIPE_SZ.patch |    0
 .../0004-Add-clock_adjtime-syscall.patch           |    0
 .../{uclibc-git => files}/argp-headers.patch       |    0
 .../{uclibc-git => files}/argp-support.patch       |    0
 .../compile-arm-fork-with-O2.patch                 |    0
 .../uclibc/{uclibc-git => files}/locale.cfg        |    0
 .../uclibc/{uclibc-git => files}/obstack.cfg       |    0
 .../uclibc/{uclibc-git => files}/orign_path.patch  |    0
 .../{uclibc-git => files}/powerpc_copysignl.patch  |    0
 .../remove_attribute_optimize_Os.patch             |    0
 .../uclibc/{uclibc-git => files}/uClibc.distro     |    0
 .../uclibc/{uclibc-git => files}/uClibc.machine    |    0
 .../uclibc_enable_log2_test.patch                  |    0
 meta/recipes-core/uclibc/uclibc-git.inc            |    4 +---
 21 files changed, 1 insertion(+), 3 deletions(-)
 rename meta/recipes-core/uclibc/{uclibc-git => files}/0001-Add-eventfd_read-and-eventfd_write.patch (100%)
 rename meta/recipes-core/uclibc/{uclibc-git => files}/0001-Revert-utent.c-wtent.c-move-functions-from-utxent.c.patch (100%)
 rename meta/recipes-core/uclibc/{uclibc-git => files}/0001-atexit_old-Do-not-add-it-to-shared-libc.patch (100%)
 rename meta/recipes-core/uclibc/{uclibc-git => files}/0001-librt-Use-nodefaultlibs-instead-of-nostdlib.patch (100%)
 rename meta/recipes-core/uclibc/{uclibc-git => files}/0001-nptl-arm-Move-aeabi_read_tp-to-uclibc_nonshared.a.patch (100%)
 rename meta/recipes-core/uclibc/{uclibc-git => files}/0001-nptl-atfork-Hide-pthread_atfork-in-shared-versions.patch (100%)
 rename meta/recipes-core/uclibc/{uclibc-git => files}/0002-wire-setns-syscall.patch (100%)
 rename meta/recipes-core/uclibc/{uclibc-git => files}/0003-fcntl.h-Define-F_SETPIPE_SZ-and-F_GETPIPE_SZ.patch (100%)
 rename meta/recipes-core/uclibc/{uclibc-git => files}/0004-Add-clock_adjtime-syscall.patch (100%)
 rename meta/recipes-core/uclibc/{uclibc-git => files}/argp-headers.patch (100%)
 rename meta/recipes-core/uclibc/{uclibc-git => files}/argp-support.patch (100%)
 rename meta/recipes-core/uclibc/{uclibc-git => files}/compile-arm-fork-with-O2.patch (100%)
 rename meta/recipes-core/uclibc/{uclibc-git => files}/locale.cfg (100%)
 rename meta/recipes-core/uclibc/{uclibc-git => files}/obstack.cfg (100%)
 rename meta/recipes-core/uclibc/{uclibc-git => files}/orign_path.patch (100%)
 rename meta/recipes-core/uclibc/{uclibc-git => files}/powerpc_copysignl.patch (100%)
 rename meta/recipes-core/uclibc/{uclibc-git => files}/remove_attribute_optimize_Os.patch (100%)
 rename meta/recipes-core/uclibc/{uclibc-git => files}/uClibc.distro (100%)
 rename meta/recipes-core/uclibc/{uclibc-git => files}/uClibc.machine (100%)
 rename meta/recipes-core/uclibc/{uclibc-git => files}/uclibc_enable_log2_test.patch (100%)

diff --git a/meta/recipes-core/uclibc/uclibc-git/0001-Add-eventfd_read-and-eventfd_write.patch b/meta/recipes-core/uclibc/files/0001-Add-eventfd_read-and-eventfd_write.patch
similarity index 100%
rename from meta/recipes-core/uclibc/uclibc-git/0001-Add-eventfd_read-and-eventfd_write.patch
rename to meta/recipes-core/uclibc/files/0001-Add-eventfd_read-and-eventfd_write.patch
diff --git a/meta/recipes-core/uclibc/uclibc-git/0001-Revert-utent.c-wtent.c-move-functions-from-utxent.c.patch b/meta/recipes-core/uclibc/files/0001-Revert-utent.c-wtent.c-move-functions-from-utxent.c.patch
similarity index 100%
rename from meta/recipes-core/uclibc/uclibc-git/0001-Revert-utent.c-wtent.c-move-functions-from-utxent.c.patch
rename to meta/recipes-core/uclibc/files/0001-Revert-utent.c-wtent.c-move-functions-from-utxent.c.patch
diff --git a/meta/recipes-core/uclibc/uclibc-git/0001-atexit_old-Do-not-add-it-to-shared-libc.patch b/meta/recipes-core/uclibc/files/0001-atexit_old-Do-not-add-it-to-shared-libc.patch
similarity index 100%
rename from meta/recipes-core/uclibc/uclibc-git/0001-atexit_old-Do-not-add-it-to-shared-libc.patch
rename to meta/recipes-core/uclibc/files/0001-atexit_old-Do-not-add-it-to-shared-libc.patch
diff --git a/meta/recipes-core/uclibc/uclibc-git/0001-librt-Use-nodefaultlibs-instead-of-nostdlib.patch b/meta/recipes-core/uclibc/files/0001-librt-Use-nodefaultlibs-instead-of-nostdlib.patch
similarity index 100%
rename from meta/recipes-core/uclibc/uclibc-git/0001-librt-Use-nodefaultlibs-instead-of-nostdlib.patch
rename to meta/recipes-core/uclibc/files/0001-librt-Use-nodefaultlibs-instead-of-nostdlib.patch
diff --git a/meta/recipes-core/uclibc/uclibc-git/0001-nptl-arm-Move-aeabi_read_tp-to-uclibc_nonshared.a.patch b/meta/recipes-core/uclibc/files/0001-nptl-arm-Move-aeabi_read_tp-to-uclibc_nonshared.a.patch
similarity index 100%
rename from meta/recipes-core/uclibc/uclibc-git/0001-nptl-arm-Move-aeabi_read_tp-to-uclibc_nonshared.a.patch
rename to meta/recipes-core/uclibc/files/0001-nptl-arm-Move-aeabi_read_tp-to-uclibc_nonshared.a.patch
diff --git a/meta/recipes-core/uclibc/uclibc-git/0001-nptl-atfork-Hide-pthread_atfork-in-shared-versions.patch b/meta/recipes-core/uclibc/files/0001-nptl-atfork-Hide-pthread_atfork-in-shared-versions.patch
similarity index 100%
rename from meta/recipes-core/uclibc/uclibc-git/0001-nptl-atfork-Hide-pthread_atfork-in-shared-versions.patch
rename to meta/recipes-core/uclibc/files/0001-nptl-atfork-Hide-pthread_atfork-in-shared-versions.patch
diff --git a/meta/recipes-core/uclibc/uclibc-git/0002-wire-setns-syscall.patch b/meta/recipes-core/uclibc/files/0002-wire-setns-syscall.patch
similarity index 100%
rename from meta/recipes-core/uclibc/uclibc-git/0002-wire-setns-syscall.patch
rename to meta/recipes-core/uclibc/files/0002-wire-setns-syscall.patch
diff --git a/meta/recipes-core/uclibc/uclibc-git/0003-fcntl.h-Define-F_SETPIPE_SZ-and-F_GETPIPE_SZ.patch b/meta/recipes-core/uclibc/files/0003-fcntl.h-Define-F_SETPIPE_SZ-and-F_GETPIPE_SZ.patch
similarity index 100%
rename from meta/recipes-core/uclibc/uclibc-git/0003-fcntl.h-Define-F_SETPIPE_SZ-and-F_GETPIPE_SZ.patch
rename to meta/recipes-core/uclibc/files/0003-fcntl.h-Define-F_SETPIPE_SZ-and-F_GETPIPE_SZ.patch
diff --git a/meta/recipes-core/uclibc/uclibc-git/0004-Add-clock_adjtime-syscall.patch b/meta/recipes-core/uclibc/files/0004-Add-clock_adjtime-syscall.patch
similarity index 100%
rename from meta/recipes-core/uclibc/uclibc-git/0004-Add-clock_adjtime-syscall.patch
rename to meta/recipes-core/uclibc/files/0004-Add-clock_adjtime-syscall.patch
diff --git a/meta/recipes-core/uclibc/uclibc-git/argp-headers.patch b/meta/recipes-core/uclibc/files/argp-headers.patch
similarity index 100%
rename from meta/recipes-core/uclibc/uclibc-git/argp-headers.patch
rename to meta/recipes-core/uclibc/files/argp-headers.patch
diff --git a/meta/recipes-core/uclibc/uclibc-git/argp-support.patch b/meta/recipes-core/uclibc/files/argp-support.patch
similarity index 100%
rename from meta/recipes-core/uclibc/uclibc-git/argp-support.patch
rename to meta/recipes-core/uclibc/files/argp-support.patch
diff --git a/meta/recipes-core/uclibc/uclibc-git/compile-arm-fork-with-O2.patch b/meta/recipes-core/uclibc/files/compile-arm-fork-with-O2.patch
similarity index 100%
rename from meta/recipes-core/uclibc/uclibc-git/compile-arm-fork-with-O2.patch
rename to meta/recipes-core/uclibc/files/compile-arm-fork-with-O2.patch
diff --git a/meta/recipes-core/uclibc/uclibc-git/locale.cfg b/meta/recipes-core/uclibc/files/locale.cfg
similarity index 100%
rename from meta/recipes-core/uclibc/uclibc-git/locale.cfg
rename to meta/recipes-core/uclibc/files/locale.cfg
diff --git a/meta/recipes-core/uclibc/uclibc-git/obstack.cfg b/meta/recipes-core/uclibc/files/obstack.cfg
similarity index 100%
rename from meta/recipes-core/uclibc/uclibc-git/obstack.cfg
rename to meta/recipes-core/uclibc/files/obstack.cfg
diff --git a/meta/recipes-core/uclibc/uclibc-git/orign_path.patch b/meta/recipes-core/uclibc/files/orign_path.patch
similarity index 100%
rename from meta/recipes-core/uclibc/uclibc-git/orign_path.patch
rename to meta/recipes-core/uclibc/files/orign_path.patch
diff --git a/meta/recipes-core/uclibc/uclibc-git/powerpc_copysignl.patch b/meta/recipes-core/uclibc/files/powerpc_copysignl.patch
similarity index 100%
rename from meta/recipes-core/uclibc/uclibc-git/powerpc_copysignl.patch
rename to meta/recipes-core/uclibc/files/powerpc_copysignl.patch
diff --git a/meta/recipes-core/uclibc/uclibc-git/remove_attribute_optimize_Os.patch b/meta/recipes-core/uclibc/files/remove_attribute_optimize_Os.patch
similarity index 100%
rename from meta/recipes-core/uclibc/uclibc-git/remove_attribute_optimize_Os.patch
rename to meta/recipes-core/uclibc/files/remove_attribute_optimize_Os.patch
diff --git a/meta/recipes-core/uclibc/uclibc-git/uClibc.distro b/meta/recipes-core/uclibc/files/uClibc.distro
similarity index 100%
rename from meta/recipes-core/uclibc/uclibc-git/uClibc.distro
rename to meta/recipes-core/uclibc/files/uClibc.distro
diff --git a/meta/recipes-core/uclibc/uclibc-git/uClibc.machine b/meta/recipes-core/uclibc/files/uClibc.machine
similarity index 100%
rename from meta/recipes-core/uclibc/uclibc-git/uClibc.machine
rename to meta/recipes-core/uclibc/files/uClibc.machine
diff --git a/meta/recipes-core/uclibc/uclibc-git/uclibc_enable_log2_test.patch b/meta/recipes-core/uclibc/files/uclibc_enable_log2_test.patch
similarity index 100%
rename from meta/recipes-core/uclibc/uclibc-git/uclibc_enable_log2_test.patch
rename to meta/recipes-core/uclibc/files/uclibc_enable_log2_test.patch
diff --git a/meta/recipes-core/uclibc/uclibc-git.inc b/meta/recipes-core/uclibc/uclibc-git.inc
index 0649aca..8442269 100644
--- a/meta/recipes-core/uclibc/uclibc-git.inc
+++ b/meta/recipes-core/uclibc/uclibc-git.inc
@@ -2,8 +2,6 @@ SRCREV="5eddde8f094ef52dca06695cc598e3b2556dcccb"
 
 PV = "0.9.33+git${SRCPV}"
 
-FILESPATH = "${@base_set_filespath([ '${FILE_DIRNAME}/uclibc-git' ], d)}"
-
 SRC_URI = "git://uclibc.org/uClibc.git;branch=master \
 	file://uClibc.machine \
 	file://uClibc.distro \
@@ -24,6 +22,6 @@ SRC_URI = "git://uclibc.org/uClibc.git;branch=master \
 	file://0001-Add-eventfd_read-and-eventfd_write.patch \
 	file://0002-wire-setns-syscall.patch \
 	file://0003-fcntl.h-Define-F_SETPIPE_SZ-and-F_GETPIPE_SZ.patch \
-        file://0004-Add-clock_adjtime-syscall.patch \ 
+	file://0004-Add-clock_adjtime-syscall.patch \ 
 	"
 S = "${WORKDIR}/git"
-- 
1.7.9.5


