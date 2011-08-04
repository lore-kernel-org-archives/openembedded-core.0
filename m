Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lianhao.lu@intel.com>) id 1QovKC-0004M4-Sw
	for openembedded-core@lists.openembedded.org;
	Thu, 04 Aug 2011 12:38:49 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 04 Aug 2011 03:34:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,315,1309762800"; d="scan'208";a="35726871"
Received: from llu-piketon.sh.intel.com (HELO localhost) ([10.239.36.146])
	by fmsmga002.fm.intel.com with ESMTP; 04 Aug 2011 03:34:23 -0700
From: Lianhao Lu <lianhao.lu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  4 Aug 2011 18:36:23 +0800
Message-Id: <bc89b720712af0813e1e85285ee1dcbbd260fcfd.1312454023.git.lianhao.lu@intel.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1312454023.git.lianhao.lu@intel.com>
References: <cover.1312454023.git.lianhao.lu@intel.com>
Subject: [PATCH 1/1] eglibc-package.inc: Fixed error in referencing PKGSUFFIX
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
X-List-Received-Date: Thu, 04 Aug 2011 10:38:49 -0000

[YOCTO #1329] Added the missing $ when referencing PKGSUFFIX in FILES_*
variables set.

Signed-off-by: Lianhao Lu <lianhao.lu@intel.com>
---
 meta/recipes-core/eglibc/eglibc-package.inc |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-core/eglibc/eglibc-package.inc b/meta/recipes-core/eglibc/eglibc-package.inc
index 77519d2..5308bb9 100644
--- a/meta/recipes-core/eglibc/eglibc-package.inc
+++ b/meta/recipes-core/eglibc/eglibc-package.inc
@@ -56,10 +56,10 @@ libc_baselibs = "${base_libdir}/libcrypt*.so.* ${base_libdir}/libcrypt-*.so ${ba
 FILES_${PN} = "${libc_baselibs} ${libexecdir}/* ${@base_conditional('USE_LDCONFIG', '1', '${base_sbindir}/ldconfig ${sysconfdir}/ld.so.conf', '', d)}"
 FILES_ldd${PKGSUFFIX} = "${bindir}/ldd"
 FILES_libsegfault${PKGSUFFIX} = "${base_libdir}/libSegFault*"
-FILES_libcidn{PKGSUFFIX} = "${base_libdir}/libcidn-*.so ${base_libdir}/libcidn.so.*"
-FILES_libmemusage{PKGSUFFIX} = "${base_libdir}/libmemusage.so"
-FILES_eglibc-extra-nss{PKGSUFFIX} = "${base_libdir}/libnss_*-*.so ${base_libdir}/libnss_*.so.*"
-FILES_sln{PKGSUFFIX} = "/sbin/sln"
+FILES_libcidn${PKGSUFFIX} = "${base_libdir}/libcidn-*.so ${base_libdir}/libcidn.so.*"
+FILES_libmemusage${PKGSUFFIX} = "${base_libdir}/libmemusage.so"
+FILES_eglibc-extra-nss${PKGSUFFIX} = "${base_libdir}/libnss_*-*.so ${base_libdir}/libnss_*.so.*"
+FILES_sln${PKGSUFFIX} = "/sbin/sln"
 FILES_${PN}-pic = "${libdir}/*_pic.a ${libdir}/*_pic.map ${libdir}/libc_pic/"
 FILES_libsotruss${PKGSUFFIX} = "${libdir}/audit/sotruss-lib.so"
 FILES_${PN}-dev_append += "${bindir}/rpcgen ${libdir}/*.a \
-- 
1.7.0.4



