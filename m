Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4E5BA60248
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 May 2016 03:25:44 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u4O3PjQr000992
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 May 2016 20:25:45 -0700
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Mon, 23 May 2016 20:25:44 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 23 May 2016 20:25:38 -0700
Message-ID: <218b829f66b957ec59cd6c7d897040650adbd5d2.1464060246.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.8.0
In-Reply-To: <cover.1464060246.git.liezhi.yang@windriver.com>
References: <cover.1464060246.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/6] python-pexpect: remove it
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
X-List-Received-Date: Tue, 24 May 2016 03:25:45 -0000
Content-Type: text/plain

It was needed by buildtools-tarball, no one requires it any more now.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../python/python-pexpect_4.0.1.bb                 | 25 ----------------------
 1 file changed, 25 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python-pexpect_4.0.1.bb

diff --git a/meta/recipes-devtools/python/python-pexpect_4.0.1.bb b/meta/recipes-devtools/python/python-pexpect_4.0.1.bb
deleted file mode 100644
index 7f142a3..0000000
--- a/meta/recipes-devtools/python/python-pexpect_4.0.1.bb
+++ /dev/null
@@ -1,25 +0,0 @@
-SUMMARY = "A Pure Python Expect like Module for Python"
-HOMEPAGE = "http://pexpect.readthedocs.org/"
-SECTION = "devel/python"
-LICENSE = "ISC"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=66c2378a96b307d56bfb3a9e58edafa8"
-
-SRC_URI = "https://pypi.python.org/packages/source/p/pexpect/pexpect-${PV}.tar.gz"
-SRC_URI[md5sum] = "056df81e6ca7081f1015b4b147b977b7"
-SRC_URI[sha256sum] = "232795ebcaaf2e120396dbbaa3a129eda51757eeaae1911558f4ef8ee414fc6c"
-
-UPSTREAM_CHECK_URI = "https://pypi.python.org/pypi/pexpect"
-
-S = "${WORKDIR}/pexpect-${PV}"
-
-inherit distutils
-
-RDEPENDS_${PN} = "\
-    python-core \
-    python-io \
-    python-terminal \
-    python-resource \
-    python-fcntl \
-"
-
-BBCLASSEXTEND = "nativesdk"
-- 
2.8.0


