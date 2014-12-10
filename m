Return-Path: <sgw@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 9FBDA7241D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Dec 2014 05:44:55 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 09 Dec 2014 21:44:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.07,550,1413270000"; d="scan'208";a="645258215"
Received: from unknown (HELO swold-linux.amr.corp.intel.com) ([10.255.13.161])
	by fmsmga002.fm.intel.com with ESMTP; 09 Dec 2014 21:44:54 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  9 Dec 2014 21:44:49 -0800
Message-Id: <08d2bfd915857673ec4de94bcc3ed1d87177ded1.1418190099.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1418190099.git.sgw@linux.intel.com>
References: <cover.1418190099.git.sgw@linux.intel.com>
In-Reply-To: <cover.1418190099.git.sgw@linux.intel.com>
References: <cover.1418190099.git.sgw@linux.intel.com>
Subject: [PATCH 4/4] python-django: Add new version 1.7.1
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
 meta/recipes-devtools/python/python-django_1.7.1.bb | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python-django_1.7.1.bb

diff --git a/meta/recipes-devtools/python/python-django_1.7.1.bb b/meta/recipes-devtools/python/python-django_1.7.1.bb
new file mode 100644
index 0000000..d7998a0
--- /dev/null
+++ b/meta/recipes-devtools/python/python-django_1.7.1.bb
@@ -0,0 +1,21 @@
+DESCRIPTION = "A high-level Python Web framework"
+HOMEPAGE = "http://www.djangoproject.com/"
+SECTION = "devel/python"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=f09eb47206614a4954c51db8a94840fa"
+
+PR = "r1"
+SRCNAME = "Django"
+
+SRC_URI = "https://pypi.python.org/packages/source/D/${SRCNAME}/${SRCNAME}-${PV}.tar.gz \
+"
+
+SRC_URI[md5sum] = "81dae89f21647b9aa5c46c6b7dbfa349"
+SRC_URI[sha256sum] = "3de62e71ce2cfbcdecb6e344cad04948506c8410ea5c6eab15c8f3b31b8ac1c0"
+
+S = "${WORKDIR}/${SRCNAME}-${PV}"
+
+inherit distutils
+
+FILES_${PN} += "${datadir}/django/*"
+
-- 
1.8.3.1


