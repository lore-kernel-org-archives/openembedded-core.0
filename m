Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SPlQW-0006gj-ES
	for openembedded-core@lists.openembedded.org;
	Thu, 03 May 2012 04:05:52 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 02 May 2012 18:56:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="95772189"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.179])
	by AZSMGA002.ch.intel.com with ESMTP; 02 May 2012 18:56:03 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  2 May 2012 18:55:31 -0700
Message-Id: <b52f808dd3e5afa1c33c86c4a00d48e398b1a4e6.1336008687.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1336008687.git.sgw@linux.intel.com>
References: <cover.1336008687.git.sgw@linux.intel.com>
In-Reply-To: <cover.1336008687.git.sgw@linux.intel.com>
References: <cover.1336008687.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 12/36] external-csl-toolchain: split out a libstdc++-staticdev package
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 03 May 2012 02:05:52 -0000

From: Christopher Larson <kergoth@gmail.com>

This silences one of the QA warnings.

Signed-off-by: Christopher Larson <kergoth@gmail.com>
---
 meta/recipes-core/meta/external-csl-toolchain.bb |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-core/meta/external-csl-toolchain.bb b/meta/recipes-core/meta/external-csl-toolchain.bb
index 3e820ff..bafa331 100644
--- a/meta/recipes-core/meta/external-csl-toolchain.bb
+++ b/meta/recipes-core/meta/external-csl-toolchain.bb
@@ -88,7 +88,7 @@ external_toolchain_sysroot_adjust() {
        fi
 }
 
-PACKAGES =+ "libgcc libgcc-dev libstdc++ libstdc++-dev linux-libc-headers linux-libc-headers-dev gdbserver gdbserver-dbg"
+PACKAGES =+ "libgcc libgcc-dev libstdc++ libstdc++-dev libstdc++-staticdev linux-libc-headers linux-libc-headers-dev gdbserver gdbserver-dbg"
 
 INSANE_SKIP_libgcc = "1"
 INSANE_SKIP_libstdc++ = "1"
@@ -111,6 +111,7 @@ PKGV_libgcc = "${CSL_VER_GCC}"
 PKGV_libgcc-dev = "${CSL_VER_GCC}"
 PKGV_libstdc++ = "${CSL_VER_GCC}"
 PKGV_libstdc++-dev = "${CSL_VER_GCC}"
+PKGV_libstdc++-staticdev = "${CSL_VER_GCC}"
 PKGV_linux-libc-headers = "${CSL_VER_KERNEL}"
 PKGV_linux-libc-headers-dev = "${CSL_VER_KERNEL}"
 PKGV_gdbserver = "${CSL_VER_GDB}"
@@ -122,9 +123,8 @@ FILES_libstdc++ = "${libdir}/libstdc++.so.*"
 FILES_libstdc++-dev = "${includedir}/c++/${PV} \
 	${libdir}/libstdc++.so \
 	${libdir}/libstdc++.la \
-	${libdir}/libstdc++.a \
-	${libdir}/libsupc++.la \
-	${libdir}/libsupc++.a"
+	${libdir}/libsupc++.la"
+FILES_libstdc++-staticdev = "${libdir}/libstdc++.a ${libdir}/libsupc++.a"
 FILES_linux-libc-headers = "${includedir}/asm* \
 	${includedir}/linux \
 	${includedir}/mtd \
-- 
1.7.7.6



