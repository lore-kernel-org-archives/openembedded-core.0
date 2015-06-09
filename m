Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 9AEAC7568E
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Jun 2015 14:51:57 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t59EpxgE015176
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 9 Jun 2015 07:51:59 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 9 Jun 2015 07:51:59 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 9 Jun 2015 07:51:49 -0700
Message-ID: <e09fed70372ff02b13173763618b830a51f8b4ad.1433842738.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1433842738.git.liezhi.yang@windriver.com>
References: <cover.1433842738.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 04/12] dropbear: 2014.66 -> 2015.67
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
X-List-Received-Date: Tue, 09 Jun 2015 14:52:03 -0000
Content-Type: text/plain

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-core/dropbear/dropbear_2014.66.bb |    4 ----
 meta/recipes-core/dropbear/dropbear_2015.67.bb |    4 ++++
 2 files changed, 4 insertions(+), 4 deletions(-)
 delete mode 100644 meta/recipes-core/dropbear/dropbear_2014.66.bb
 create mode 100644 meta/recipes-core/dropbear/dropbear_2015.67.bb

diff --git a/meta/recipes-core/dropbear/dropbear_2014.66.bb b/meta/recipes-core/dropbear/dropbear_2014.66.bb
deleted file mode 100644
index 8931eb7..0000000
--- a/meta/recipes-core/dropbear/dropbear_2014.66.bb
+++ /dev/null
@@ -1,4 +0,0 @@
-require dropbear.inc
-
-SRC_URI[md5sum] = "c21a01111aa5015db038c6efdb85717d"
-SRC_URI[sha256sum] = "ab3fe2670a517cc0bbe398ff5d15e9ca12cd14f2fc18930a8111ae2baa64ab76"
diff --git a/meta/recipes-core/dropbear/dropbear_2015.67.bb b/meta/recipes-core/dropbear/dropbear_2015.67.bb
new file mode 100644
index 0000000..5f7fe7b
--- /dev/null
+++ b/meta/recipes-core/dropbear/dropbear_2015.67.bb
@@ -0,0 +1,4 @@
+require dropbear.inc
+
+SRC_URI[md5sum] = "e967e320344cd4bfebe321e3ab8514d6"
+SRC_URI[sha256sum] = "7e690594645dfde5787065c78a5d2e4d15e288babfa06e140197ce05f698c8e5"
-- 
1.7.9.5


