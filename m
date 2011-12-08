Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Xiaofeng.Yan@windriver.com>) id 1RYaY9-0001ME-W7
	for openembedded-core@lists.openembedded.org;
	Thu, 08 Dec 2011 10:45:58 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id pB89d8rx025056
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 8 Dec 2011 01:39:08 -0800 (PST)
Received: from localhost (128.224.162.28) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Thu, 8 Dec 2011 01:39:07 -0800
Message-ID: <28261d8c27a9a5fd03135ce95e10073bb3dadd9a.1323327959.git.xiaofeng.yan@windriver.com>
In-Reply-To: <cover.1323327959.git.xiaofeng.yan@windriver.com>
References: <cover.1323327959.git.xiaofeng.yan@windriver.com>
Old-Date: Mon, 5 Dec 2011 15:09:15 +0800
Date: Thu, 8 Dec 2011 17:34:16 +0800
To: <openembedded-core@lists.openembedded.org>
From: Xiaofeng Yan <xiaofeng.yan@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 08/10] directfb-examples: add package directfb-examples to OE-core
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
X-List-Received-Date: Thu, 08 Dec 2011 09:45:58 -0000
Content-Type: text/plain

From: Xiaofeng Yan <xiaofeng.yan@windriver.com>

Add this package for checking whether directfb run rightly or not.
It also is an useful tool to test directfb.

[YOCTO #1674]

Signed-off-by: Xiaofeng Yan <xiaofeng.yan@windriver.com>
---
 .../directfb/directfb-examples_1.2.0.bb            |   20 ++++++++++++++++++++
 1 files changed, 20 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-graphics/directfb/directfb-examples_1.2.0.bb

diff --git a/meta/recipes-graphics/directfb/directfb-examples_1.2.0.bb b/meta/recipes-graphics/directfb/directfb-examples_1.2.0.bb
new file mode 100644
index 0000000..215426e
--- /dev/null
+++ b/meta/recipes-graphics/directfb/directfb-examples_1.2.0.bb
@@ -0,0 +1,20 @@
+DESCRIPTION = "The DirectFB-examples package contains a set of simple DirectFB \
+      applications that can be used to test and demonstrate various DirectFB \
+      features"
+DEPENDS = "directfb"
+SECTION = "libs"
+LICENSE = "MIT"
+PR = "r0"
+
+SRC_URI = " \
+           http://www.directfb.org/downloads/Extras/DirectFB-examples-${PV}.tar.gz \
+          "
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=ecf6fd2b19915afc4da56043926ca18f"
+
+S = "${WORKDIR}/DirectFB-examples-${PV}"
+
+inherit autotools
+
+SRC_URI[md5sum] = "ce018f681b469a1d72ffc32650304b98"
+SRC_URI[sha256sum] = "830a1bd6775d8680523596a88a72fd8e4c6a74bf886d3e169b06d234a5cf7e3e"
-- 
1.7.0.4



