Return-Path: <sgw@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id F0EBE723D9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Dec 2014 05:44:54 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 09 Dec 2014 21:44:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.07,550,1413270000"; d="scan'208";a="645258209"
Received: from unknown (HELO swold-linux.amr.corp.intel.com) ([10.255.13.161])
	by fmsmga002.fm.intel.com with ESMTP; 09 Dec 2014 21:44:53 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  9 Dec 2014 21:44:48 -0800
Message-Id: <67618668d1ac0d4d1becf428cde812a6775dd896.1418190099.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1418190099.git.sgw@linux.intel.com>
References: <cover.1418190099.git.sgw@linux.intel.com>
In-Reply-To: <cover.1418190099.git.sgw@linux.intel.com>
References: <cover.1418190099.git.sgw@linux.intel.com>
Subject: [PATCH 3/4] python-south: Add new version 1.0.1
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
X-List-Received-Date: Wed, 10 Dec 2014 05:44:57 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-devtools/python/python-south_1.0.1.bb | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python-south_1.0.1.bb

diff --git a/meta/recipes-devtools/python/python-south_1.0.1.bb b/meta/recipes-devtools/python/python-south_1.0.1.bb
new file mode 100644
index 0000000..57f8045
--- /dev/null
+++ b/meta/recipes-devtools/python/python-south_1.0.1.bb
@@ -0,0 +1,19 @@
+
+SUMMARY = "Migrations for Django"
+DESCRIPTION = "South is an intelligent database migrations library for the Django web framework. It is database-independent and DVCS-friendly, as well as a whole host of other features."
+HOMEPAGE = "http://south.aeracode.org/"
+SECTION = "devel/python"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=17;endline=18;md5=2155d8ae21e7c23101d5febac696b27e"
+
+SRCNAME = "South"
+
+SRC_URI = "https://pypi.python.org/packages/source/S/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "9977423e4c4f7ca9345f1428a0a57505"
+SRC_URI[sha256sum] = "1ce97c634107df324eb2fd53cd904d7c04fc8cc6a8fe0800e5f85345b0c75ad3"
+
+S = "${WORKDIR}/${SRCNAME}-${PV}"
+
+inherit distutils
+
-- 
1.8.3.1


