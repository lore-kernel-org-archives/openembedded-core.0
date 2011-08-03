Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QoivY-0002CA-PX
	for openembedded-core@lists.openembedded.org;
	Wed, 03 Aug 2011 23:24:33 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 03 Aug 2011 14:20:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,312,1309762800"; d="scan'208";a="34056920"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.14.76])
	by orsmga002.jf.intel.com with ESMTP; 03 Aug 2011 14:19:52 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  3 Aug 2011 14:19:27 -0700
Message-Id: <656df13333f16e988e9e323b4327b928972f0175.1312394851.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1312394851.git.sgw@linux.intel.com>
References: <cover.1312394851.git.sgw@linux.intel.com>
In-Reply-To: <cover.1312394851.git.sgw@linux.intel.com>
References: <cover.1312394851.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 14/33] gpgme: Upgrade to 1.3.1
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
X-List-Received-Date: Wed, 03 Aug 2011 21:24:33 -0000

From: Zhai Edwin <edwin.zhai@intel.com>

Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
---
 .../disable_gpgconf_check.patch                    |    0
 .../gpgme/{gpgme_1.3.0.bb => gpgme_1.3.1.bb}       |   10 +++++-----
 2 files changed, 5 insertions(+), 5 deletions(-)
 rename meta/recipes-support/gpgme/{gpgme-1.3.0 => gpgme-1.3.1}/disable_gpgconf_check.patch (100%)
 rename meta/recipes-support/gpgme/{gpgme_1.3.0.bb => gpgme_1.3.1.bb} (74%)

diff --git a/meta/recipes-support/gpgme/gpgme-1.3.0/disable_gpgconf_check.patch b/meta/recipes-support/gpgme/gpgme-1.3.1/disable_gpgconf_check.patch
similarity index 100%
rename from meta/recipes-support/gpgme/gpgme-1.3.0/disable_gpgconf_check.patch
rename to meta/recipes-support/gpgme/gpgme-1.3.1/disable_gpgconf_check.patch
diff --git a/meta/recipes-support/gpgme/gpgme_1.3.0.bb b/meta/recipes-support/gpgme/gpgme_1.3.1.bb
similarity index 74%
rename from meta/recipes-support/gpgme/gpgme_1.3.0.bb
rename to meta/recipes-support/gpgme/gpgme_1.3.1.bb
index 4c45a44..9ffedba 100644
--- a/meta/recipes-support/gpgme/gpgme_1.3.0.bb
+++ b/meta/recipes-support/gpgme/gpgme_1.3.1.bb
@@ -5,14 +5,14 @@ BUGTRACKER = "https://bugs.g10code.com/gnupg/index"
 LICENSE = "GPLv2+ & LGPLv2.1+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
                     file://COPYING.LESSER;md5=bbb461211a33b134d42ed5ee802b37ff \
-                    file://src/gpgme.h;endline=23;md5=2775a99d3dd524c4f848ff1c59093038 \
+                    file://src/gpgme.h.in;endline=23;md5=942b47052c0674c6a3b9b9e6127628a4 \
                     file://src/engine.h;endline=22;md5=e96acfaab1cff82dd8fbefddd2f5c436"
 
 SRC_URI = "ftp://ftp.gnupg.org/gcrypt/gpgme/gpgme-${PV}.tar.bz2 \
-           file://disable_gpgconf_check.patch;patch=1;pnum=1"
+           file://disable_gpgconf_check.patch"
 
-SRC_URI[md5sum] = "4784e3c6086c9c25e9a1b4d9f7c5aa96"
-SRC_URI[sha256sum] = "74e040fcd46061f6b0d8b621a2a2a48100a7ba5c9f69e7cf207259a6e2e3e6a1"
+SRC_URI[md5sum] = "90afa8436ce2b2683c001c824bd22601"
+SRC_URI[sha256sum] = "15ef27a875ae0d79d7446fd931deda11438e724ffbeac74449ed19cba23df4d4"
 DEPENDS = "libgpg-error libassuan pth"
 PR = "r0"
 
@@ -25,4 +25,4 @@ PACKAGES =+ "${PN}-pth ${PN}-pthread"
 FILES_${PN}-pth = "${libdir}/libgpgme-pth.so.*"
 FILES_${PN}-pthread = "${libdir}/libgpgme-pthread.so.*"
 FILES_${PN} = "${libdir}/libgpgme.so.*"
-FILES_${PN}-dev += "${bindir}/gpgme-config"
+FILES_${PN}-dev += "${bindir}/gpgme-config ${datadir}/common-lisp/source/gpgme/*"
-- 
1.7.3.4



