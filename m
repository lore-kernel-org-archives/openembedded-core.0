Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Xiaofeng.Yan@windriver.com>) id 1RT6ku-000666-2t
	for openembedded-core@lists.openembedded.org;
	Wed, 23 Nov 2011 07:56:28 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id pAN6ntAl013643
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Nov 2011 22:49:56 -0800 (PST)
Received: from localhost (128.224.162.28) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Tue, 22 Nov 2011 22:49:55 -0800
Message-ID: <55c010c4a80f08a97654dadacdcca3fce4474292.1322028165.git.xiaofeng.yan@windriver.com>
In-Reply-To: <cover.1322028165.git.xiaofeng.yan@windriver.com>
References: <cover.1322028165.git.xiaofeng.yan@windriver.com>
Old-Date: Wed, 23 Nov 2011 13:32:36 +0800
Date: Wed, 23 Nov 2011 14:48:04 +0800
To: <openembedded-core@lists.openembedded.org>
From: Xiaofeng Yan <xiaofeng.yan@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 7/9] directfb-examples: add package directfb-examples to OE-core
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
X-List-Received-Date: Wed, 23 Nov 2011 06:56:28 -0000
Content-Type: text/plain

From: Xiaofeng Yan <xiaofeng.yan@windriver.com>

Add this package for checking whether directfb run rightly or not.
It also is an useful tool to test directfb.

[YOCTO #1674]

Signed-off-by: Xiaofeng Yan <xiaofeng.yan@windriver.com>
---
 .../directfb/directfb-examples_1.2.0.bb            |   18 ++++++++++++++++++
 1 files changed, 18 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-graphics/directfb/directfb-examples_1.2.0.bb

diff --git a/meta/recipes-graphics/directfb/directfb-examples_1.2.0.bb b/meta/recipes-graphics/directfb/directfb-examples_1.2.0.bb
new file mode 100644
index 0000000..08cdc8f
--- /dev/null
+++ b/meta/recipes-graphics/directfb/directfb-examples_1.2.0.bb
@@ -0,0 +1,18 @@
+DESCRIPTION = "DirectFB extra providers"
+DEPENDS = "directfb"
+SECTION = "libs"
+LICENSE = "GPL"
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



