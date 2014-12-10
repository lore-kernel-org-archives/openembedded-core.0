Return-Path: <sgw@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id EC4F672391
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Dec 2014 05:44:54 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 09 Dec 2014 21:44:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.07,550,1413270000"; d="scan'208";a="645258204"
Received: from unknown (HELO swold-linux.amr.corp.intel.com) ([10.255.13.161])
	by fmsmga002.fm.intel.com with ESMTP; 09 Dec 2014 21:44:53 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  9 Dec 2014 21:44:47 -0800
Message-Id: <478f6a14868d0b3f1e79228255a098f944b9ae14.1418190099.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1418190099.git.sgw@linux.intel.com>
References: <cover.1418190099.git.sgw@linux.intel.com>
In-Reply-To: <cover.1418190099.git.sgw@linux.intel.com>
References: <cover.1418190099.git.sgw@linux.intel.com>
Subject: [PATCH 2/4] python-wsgiref: Add new Version 0.1.2
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

Imported from meta-openstack

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../python/python-wsgiref_0.1.2.bb                 | 25 ++++++++++++++++++++++
 1 file changed, 25 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python-wsgiref_0.1.2.bb

diff --git a/meta/recipes-devtools/python/python-wsgiref_0.1.2.bb b/meta/recipes-devtools/python/python-wsgiref_0.1.2.bb
new file mode 100644
index 0000000..6e0a448
--- /dev/null
+++ b/meta/recipes-devtools/python/python-wsgiref_0.1.2.bb
@@ -0,0 +1,25 @@
+DESCRIPTION = "WSGI (PEP 333) Reference Library"
+HOMEPAGE = "http://cheeseshop.python.org/pypi/wsgiref"
+SECTION = "devel/python"
+LICENSE = "PSF"
+LIC_FILES_CHKSUM = "file://PKG-INFO;md5=fe761dfec1d54629c6b9a3bbc7b1baf5"
+
+SRCNAME = "wsgiref"
+SRC_URI = "http://pypi.python.org/packages/source/w/${SRCNAME}/${SRCNAME}-${PV}.zip"
+
+SRC_URI[md5sum] = "29b146e6ebd0f9fb119fe321f7bcf6cb"
+SRC_URI[sha256sum] = "c7e610c800957046c04c8014aab8cce8f0b9f0495c8cd349e57c1f7cabf40e79"
+
+S = "${WORKDIR}/${SRCNAME}-${PV}"
+
+inherit setuptools
+
+# DEPENDS_default: python-pip
+
+DEPENDS += " \
+        python-pip \
+        "
+
+# RDEPENDS_default: 
+RDEPENDS_${PN} += " \
+        "
-- 
1.8.3.1


