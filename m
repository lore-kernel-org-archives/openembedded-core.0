Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Wenzong.Fan@windriver.com>) id 1RGRtZ-0001yv-1R
	for openembedded-core@lists.openembedded.org;
	Wed, 19 Oct 2011 10:53:05 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p9J8lDr1013288
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Oct 2011 01:47:13 -0700 (PDT)
Received: from localhost.localdomain (128.224.162.28) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.1.255.0; Wed, 19 Oct 2011 01:47:13 -0700
From: <wenzong.fan@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 19 Oct 2011 16:53:09 +0800
Message-ID: <06482898051d99c6a0fe4aefe2e1b279ccde77b8.1319012299.git.wenzong.fan@windriver.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1319012299.git.wenzong.fan@windriver.com>
References: <cover.1319012299.git.wenzong.fan@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] chkconfig: Update to 1.3.55
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
X-List-Received-Date: Wed, 19 Oct 2011 08:53:05 -0000
Content-Type: text/plain

From: Wenzong Fan <wenzong.fan@windriver.com>

Update chkconfig to 1.3.55 from 1.3.52.

Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
---
 .../{chkconfig_1.3.52.bb => chkconfig_1.3.55.bb}   |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-extended/chkconfig/{chkconfig_1.3.52.bb => chkconfig_1.3.55.bb} (83%)

diff --git a/meta/recipes-extended/chkconfig/chkconfig_1.3.52.bb b/meta/recipes-extended/chkconfig/chkconfig_1.3.55.bb
similarity index 83%
rename from meta/recipes-extended/chkconfig/chkconfig_1.3.52.bb
rename to meta/recipes-extended/chkconfig/chkconfig_1.3.55.bb
index 6dc8a0e..0e50936 100644
--- a/meta/recipes-extended/chkconfig/chkconfig_1.3.52.bb
+++ b/meta/recipes-extended/chkconfig/chkconfig_1.3.55.bb
@@ -12,12 +12,12 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=5574c6965ae5f583e55880e397fbb018"
 
 DEPENDS = "libnewt popt"
 
-PR = "r1"
+PR = "r0"
 
 SRC_URI = "http://fedorahosted.org/releases/c/h/chkconfig/${BPN}-${PV}.tar.bz2"
 
-SRC_URI[md5sum] = "a576808a6d66763606d750ec451bab6d"
-SRC_URI[sha256sum] = "aa36bf7fd3f7c6e3371eddd8a7846b83435c48f132cc5919d83a830504b797d6"
+SRC_URI[md5sum] = "de562d5bff5116d1acf2d3191603096b"
+SRC_URI[sha256sum] = "ac5e8f6c5ed83f5b65a3dd9187f8c534f167193446082e6a6576a0d9f72ba968"
 
 inherit autotools gettext
 
-- 
1.7.0.4



