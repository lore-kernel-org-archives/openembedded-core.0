Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RnoKW-0004Cz-Jz
	for openembedded-core@lists.openembedded.org;
	Thu, 19 Jan 2012 10:30:48 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 19 Jan 2012 01:22:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="97472103"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.14.6])
	by azsmga001.ch.intel.com with ESMTP; 19 Jan 2012 01:22:59 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Jan 2012 01:22:33 -0800
Message-Id: <07e6db4cffae944800892d934c11be3876eeaa92.1326964778.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <cover.1326964778.git.sgw@linux.intel.com>
References: <cover.1326964778.git.sgw@linux.intel.com>
In-Reply-To: <cover.1326964778.git.sgw@linux.intel.com>
References: <cover.1326964778.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 12/33] pkgconfig: Move pkg.m4 from -dev to package
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
X-List-Received-Date: Thu, 19 Jan 2012 09:30:48 -0000

[YOCTO #1908]

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-devtools/pkgconfig/pkgconfig.inc     |    2 ++
 meta/recipes-devtools/pkgconfig/pkgconfig_0.25.bb |    2 +-
 2 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-devtools/pkgconfig/pkgconfig.inc b/meta/recipes-devtools/pkgconfig/pkgconfig.inc
index 641bfae..00c23d7 100644
--- a/meta/recipes-devtools/pkgconfig/pkgconfig.inc
+++ b/meta/recipes-devtools/pkgconfig/pkgconfig.inc
@@ -31,3 +31,5 @@ do_configure_prepend () {
 }
 
 BBCLASSEXTEND = "native nativesdk"
+
+FILES_${PN} += "${datadir}/aclocal/pkg.m4"
diff --git a/meta/recipes-devtools/pkgconfig/pkgconfig_0.25.bb b/meta/recipes-devtools/pkgconfig/pkgconfig_0.25.bb
index 76c0df9..1d7ba49 100644
--- a/meta/recipes-devtools/pkgconfig/pkgconfig_0.25.bb
+++ b/meta/recipes-devtools/pkgconfig/pkgconfig_0.25.bb
@@ -1,6 +1,6 @@
 require pkgconfig.inc
 
-PR = "r2"
+PR = "r3"
 
 SRC_URI[md5sum] = "a3270bab3f4b69b7dc6dbdacbcae9745"
 SRC_URI[sha256sum] = "3ba691ee2431f32ccb8efa131e59bf23e37f122dc66791309023ca6dcefcd10e"
-- 
1.7.6.5



