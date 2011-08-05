Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lianhao.lu@intel.com>) id 1QpHoh-0001bE-9n
	for openembedded-core@lists.openembedded.org;
	Fri, 05 Aug 2011 12:39:47 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 05 Aug 2011 03:35:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,322,1309762800"; d="scan'208";a="38181884"
Received: from llu-piketon.sh.intel.com (HELO localhost) ([10.239.36.146])
	by fmsmga001.fm.intel.com with ESMTP; 05 Aug 2011 03:35:21 -0700
From: Lianhao Lu <lianhao.lu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  5 Aug 2011 18:37:12 +0800
Message-Id: <70399181518329ce158a37400198c5f4dcb92e0f.1312540193.git.lianhao.lu@intel.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <8f296f721bbda3e9df8a80422cd876b9d52712f8.1312540193.git.lianhao.lu@intel.com>
References: <8f296f721bbda3e9df8a80422cd876b9d52712f8.1312540193.git.lianhao.lu@intel.com>
In-Reply-To: <cover.1312540193.git.lianhao.lu@intel.com>
References: <cover.1312540193.git.lianhao.lu@intel.com>
Subject: [PATCH 2/6] tcp-wrappers: Using ${PN} in PACKAGES.
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
X-List-Received-Date: Fri, 05 Aug 2011 10:39:47 -0000

[YOCTO #1334]
Using ${PN} instead of tcp-wrappers in PACKAGES and FILES_*, since the
FILES_tcp-wrappers would be overwritten by FILES_${PN} when the variable
name gets expansioned.

Signed-off-by: Lianhao Lu <lianhao.lu@intel.com>
---
 .../tcp-wrappers/tcp-wrappers_7.6.bb               |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb b/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb
index 1aeb9ff..3eecd4d 100644
--- a/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb
+++ b/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb
@@ -8,12 +8,12 @@ LIC_FILES_CHKSUM = "file://DISCLAIMER;md5=071bd69cb78b18888ea5e3da5c3127fa"
 PR ="r0"
 
 
-PACKAGES = "${PN}-dbg libwrap libwrap-doc libwrap-dev tcp-wrappers tcp-wrappers-doc"
+PACKAGES = "${PN}-dbg libwrap libwrap-doc libwrap-dev ${PN} ${PN}-doc"
 FILES_libwrap = "${base_libdir}/lib*.so.*"
 FILES_libwrap-doc = "${mandir}/man3 ${mandir}/man5"
 FILES_libwrap-dev = "${libdir}/lib*.so ${libdir}/lib*.a ${includedir}"
-FILES_tcp-wrappers = "${bindir}"
-FILES_tcp-wrappers-doc = "${mandir}/man8"
+FILES_${PN} = "${sbindir}"
+FILES_${PN}-doc = "${mandir}/man8"
 
 SRC_URI = "ftp://ftp.porcupine.org/pub/security/tcp_wrappers_${PV}.tar.gz \
            file://00_man_quoting.diff \
-- 
1.7.0.4



