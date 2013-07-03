Return-Path: <sgw@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 1FE3E6B00B
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Jul 2013 22:26:31 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 03 Jul 2013 15:24:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,991,1363158000"; d="scan'208";a="340154934"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.13.183])
	by orsmga001.jf.intel.com with ESMTP; 03 Jul 2013 15:26:30 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  3 Jul 2013 15:26:25 -0700
Message-Id: <c07480fee89e9a8e1e450702711826c676a75ba3.1372890071.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.1.4
In-Reply-To: <cover.1372890071.git.sgw@linux.intel.com>
References: <cover.1372890071.git.sgw@linux.intel.com>
In-Reply-To: <cover.1372890071.git.sgw@linux.intel.com>
References: <cover.1372890071.git.sgw@linux.intel.com>
Subject: [PATCH 4/8] boost: Update to 1.54
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
X-List-Received-Date: Wed, 03 Jul 2013 22:26:31 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../boost/{bjam-native_1.53.0.bb => bjam-native_1.54.0.bb}          | 0
 meta/recipes-support/boost/{boost-1.53.0.inc => boost-1.54.0.inc}   | 6 +++---
 meta/recipes-support/boost/{boost_1.53.0.bb => boost_1.54.0.bb}     | 2 --
 3 files changed, 3 insertions(+), 5 deletions(-)
 rename meta/recipes-support/boost/{bjam-native_1.53.0.bb => bjam-native_1.54.0.bb} (100%)
 rename meta/recipes-support/boost/{boost-1.53.0.inc => boost-1.54.0.inc} (76%)
 rename meta/recipes-support/boost/{boost_1.53.0.bb => boost_1.54.0.bb} (89%)

diff --git a/meta/recipes-support/boost/bjam-native_1.53.0.bb b/meta/recipes-support/boost/bjam-native_1.54.0.bb
similarity index 100%
rename from meta/recipes-support/boost/bjam-native_1.53.0.bb
rename to meta/recipes-support/boost/bjam-native_1.54.0.bb
diff --git a/meta/recipes-support/boost/boost-1.53.0.inc b/meta/recipes-support/boost/boost-1.54.0.inc
similarity index 76%
rename from meta/recipes-support/boost/boost-1.53.0.inc
rename to meta/recipes-support/boost/boost-1.54.0.inc
index dbcaabc..9113c82 100644
--- a/meta/recipes-support/boost/boost-1.53.0.inc
+++ b/meta/recipes-support/boost/boost-1.54.0.inc
@@ -11,9 +11,9 @@ BOOST_VER = "${@"_".join(d.getVar("PV",1).split("."))}"
 BOOST_MAJ = "${@"_".join(d.getVar("PV",1).split(".")[0:2])}"
 BOOST_P = "boost_${BOOST_VER}"
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BOOST_P}.tar.bz2"
+SRC_URI = "${SOURCEFORGE_MIRROR}/boost/${BOOST_P}.tar.bz2"
 
-SRC_URI[md5sum] = "a00d22605d5dbcfb4c9936a9b35bc4c2"
-SRC_URI[sha256sum] = "f88a041b01882b0c9c5c05b39603ec8383fb881f772f6f9e6e6fd0e0cddb9196"
+SRC_URI[md5sum] = "15cb8c0803064faef0c4ddf5bc5ca279"
+SRC_URI[sha256sum] = "047e927de336af106a24bceba30069980c191529fd76b8dff8eb9a328b48ae1d"
 
 S = "${WORKDIR}/${BOOST_P}"
diff --git a/meta/recipes-support/boost/boost_1.53.0.bb b/meta/recipes-support/boost/boost_1.54.0.bb
similarity index 89%
rename from meta/recipes-support/boost/boost_1.53.0.bb
rename to meta/recipes-support/boost/boost_1.54.0.bb
index 3a5a6cc..68f483c 100644
--- a/meta/recipes-support/boost/boost_1.53.0.bb
+++ b/meta/recipes-support/boost/boost_1.54.0.bb
@@ -1,7 +1,5 @@
 include boost-${PV}.inc
 include boost.inc
 
-PR = "r1"
-
 SRC_URI += "file://arm-intrinsics.patch \
            "
-- 
1.8.1.4


