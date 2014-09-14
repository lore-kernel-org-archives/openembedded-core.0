Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5A84070A88
	for <openembedded-core@lists.openembedded.org>;
	Sun, 14 Sep 2014 06:48:24 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s8E6mPlG006352
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sat, 13 Sep 2014 23:48:26 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.187) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Sat, 13 Sep 2014 23:48:25 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 14 Sep 2014 14:48:51 +0800
Message-ID: <d39086462e686eb99b330bca883d1c187f38a02b.1410677291.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1410677291.git.Qi.Chen@windriver.com>
References: <cover.1410677291.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/2] portmap: fix INITSCRIPT_PARAMS
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
X-List-Received-Date: Sun, 14 Sep 2014 06:48:29 -0000
Content-Type: text/plain

Fix portmap init to make it run at runlevel 2,3,4,5.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-connectivity/portmap/portmap.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/portmap/portmap.inc b/meta/recipes-connectivity/portmap/portmap.inc
index 7588341..9b42859 100644
--- a/meta/recipes-connectivity/portmap/portmap.inc
+++ b/meta/recipes-connectivity/portmap/portmap.inc
@@ -13,7 +13,7 @@ SRC_URI = "${DEBIAN_MIRROR}/main/p/portmap/portmap_5.orig.tar.gz \
 S = "${WORKDIR}/portmap_5beta"
 
 INITSCRIPT_NAME = "portmap"
-INITSCRIPT_PARAMS = "start 43 S . start 32 0 6 . stop 81 1 ."
+INITSCRIPT_PARAMS = "start 10 2 3 4 5 . stop 32 0 1 6 ."
 
 inherit update-rc.d
 
-- 
1.9.1


