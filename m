Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Xiaofeng.Yan@windriver.com>) id 1RT7HL-0008EA-3q
	for openembedded-core@lists.openembedded.org;
	Wed, 23 Nov 2011 08:29:59 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id pAN7NRRM019814
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Nov 2011 23:23:27 -0800 (PST)
Received: from localhost (128.224.162.28) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Tue, 22 Nov 2011 23:23:27 -0800
Message-ID: <5a1109761eb7eba8ddd028bea09ec12c63bc6bbb.1322032702.git.xiaofeng.yan@windriver.com>
In-Reply-To: <cover.1322032702.git.xiaofeng.yan@windriver.com>
References: <cover.1322032702.git.xiaofeng.yan@windriver.com>
Old-Date: Wed, 23 Nov 2011 15:05:24 +0800
Date: Wed, 23 Nov 2011 15:21:35 +0800
To: <openembedded-core@lists.openembedded.org>
From: Xiaofeng Yan <xiaofeng.yan@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] directfb: change check sum
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
X-List-Received-Date: Wed, 23 Nov 2011 07:29:59 -0000
Content-Type: text/plain

From: Xiaofeng Yan <xiaofeng.yan@windriver.com>

Change check sum of directfb. The previous check sum is wrong.

Signed-off-by: Xiaofeng Yan <xiaofeng.yan@windriver.com>

Signed-off-by: Xiaofeng Yan <xiaofeng.yan@windriver.com>
---
 meta/recipes-graphics/directfb/directfb_1.4.15.bb |    8 +++-----
 1 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-graphics/directfb/directfb_1.4.15.bb b/meta/recipes-graphics/directfb/directfb_1.4.15.bb
index 71c0876..c322dec 100644
--- a/meta/recipes-graphics/directfb/directfb_1.4.15.bb
+++ b/meta/recipes-graphics/directfb/directfb_1.4.15.bb
@@ -1,7 +1,7 @@
 require directfb.inc
 
 RV = "1.4-6"
-PR = "r0"
+PR = "r1"
 
 DEPENDS += "sysfsutils"
 
@@ -21,7 +21,5 @@ EXTRA_OECONF = "\
 
 LEAD_SONAME = "libdirectfb-1.4.so.6"
 
-SRC_URI[md5sum] = "2c779c9a8456790c6c29ad85459b2600"
-SRC_URI[sha256sum] = "b119ab9c5c0c505c23e32d41ae54bd04cb474c5e58900ec0f1cf9482f892f9b2"
-
-
+SRC_URI[md5sum] = "9b2b90b81d7ded2a4a5caa22daeb81ef"
+SRC_URI[sha256sum] = "a40e640b53da9b2b155d98bf8cb1d173b01418c04b176768307adebefa0b78a8"
-- 
1.7.0.4



