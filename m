Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0D78E7F31E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Aug 2019 08:20:27 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x7N8JgTV013436
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Aug 2019 01:20:19 -0700
Received: from msp-lpggp1.wrs.com (172.25.34.110) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.468.0;
	Fri, 23 Aug 2019 01:19:48 -0700
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 23 Aug 2019 04:19:45 -0400
Message-ID: <20190823081945.49883-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.20.0
MIME-Version: 1.0
Subject: [PATCH] libwacom: add recipe
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
X-List-Received-Date: Fri, 23 Aug 2019 08:20:28 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Package libinput has a package config 'libwacom'. When it is set,
package libwacom is required. So add the recipe of libwacom.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/recipes-graphics/libwacom/libwacom_0.33.bb | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 meta/recipes-graphics/libwacom/libwacom_0.33.bb

diff --git a/meta/recipes-graphics/libwacom/libwacom_0.33.bb b/meta/recipes-graphics/libwacom/libwacom_0.33.bb
new file mode 100644
index 0000000000..deb2922216
--- /dev/null
+++ b/meta/recipes-graphics/libwacom/libwacom_0.33.bb
@@ -0,0 +1,15 @@
+DESCRIPTION = "libwacom is a library to identify wacom tablets and their model-specific features."
+HOMEPAGE = "https://github.com/linuxwacom/libwacom/wiki"
+SECTION = "libs"
+
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://COPYING;md5=40a21fffb367c82f39fd91a3b137c36e"
+
+DEPENDS = "libgudev"
+
+SRC_URI = "git://github.com/linuxwacom/libwacom.git;protocol=https"
+SRCREV = "87cc710e21a6220e267dd08936bbec2932aa3658"
+
+S = "${WORKDIR}/git"
+
+inherit autotools pkgconfig
-- 
2.20.0


