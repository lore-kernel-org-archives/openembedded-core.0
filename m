Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6203D78CC3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jul 2018 08:51:04 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w6R8p5t2020590
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jul 2018 01:51:05 -0700 (PDT)
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.399.0; Fri, 27 Jul 2018 01:51:04 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 27 Jul 2018 17:01:15 +0800
Message-ID: <34cc8d051e5126e628f1d3e4eebb0d623c4ae0c0.1532682009.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1532682009.git.liezhi.yang@windriver.com>
References: <cover.1532682009.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/5] python3-extras: add it for python3-testtools
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
X-List-Received-Date: Fri, 27 Jul 2018 08:51:04 -0000
Content-Type: text/plain

- The python3-testtools RDEPENDS on it.
- The original one is python-extras_1.0.0.bb which is from meta-openstack
  layer, I divided it into python-extras.inc and python3-extras_1.0.0.bb, and
  extended to nativesdk.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-devtools/python/python-extras.inc       | 12 ++++++++++++
 meta/recipes-devtools/python/python3-extras_1.0.0.bb |  2 ++
 2 files changed, 14 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python-extras.inc
 create mode 100644 meta/recipes-devtools/python/python3-extras_1.0.0.bb

diff --git a/meta/recipes-devtools/python/python-extras.inc b/meta/recipes-devtools/python/python-extras.inc
new file mode 100644
index 0000000..8660997
--- /dev/null
+++ b/meta/recipes-devtools/python/python-extras.inc
@@ -0,0 +1,12 @@
+DESCRIPTION = "Useful extra bits for Python - things that should be in the standard library"
+HOMEPAGE = "https://pypi.python.org/pypi/extras/"
+SECTION = "devel/python"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=6d108f338b2f68fe48ac366c4650bd8b"
+
+inherit pypi
+
+SRC_URI[md5sum] = "3a63ad60cf8f0186c9e3a02f55ec5b14"
+SRC_URI[sha256sum] = "132e36de10b9c91d5d4cc620160a476e0468a88f16c9431817a6729611a81b4e"
+
+BBCLASSEXTEND = "nativesdk"
diff --git a/meta/recipes-devtools/python/python3-extras_1.0.0.bb b/meta/recipes-devtools/python/python3-extras_1.0.0.bb
new file mode 100644
index 0000000..76f87f2
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-extras_1.0.0.bb
@@ -0,0 +1,2 @@
+inherit setuptools3
+require python-extras.inc
-- 
2.7.4


