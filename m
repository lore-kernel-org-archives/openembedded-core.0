Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 8F5E5600B3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 12 Jun 2016 14:31:46 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u5CEVl4j014013
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 12 Jun 2016 07:31:47 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Sun, 12 Jun 2016 07:31:46 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 12 Jun 2016 07:31:44 -0700
Message-ID: <0651a435b151129a2d7a6732561a6d47d52e5cca.1465741803.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.8.0
In-Reply-To: <cover.1465741803.git.liezhi.yang@windriver.com>
References: <cover.1465741803.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/2] bluez5: move btmgmt to common READLINE section
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
X-List-Received-Date: Sun, 12 Jun 2016 14:31:47 -0000
Content-Type: text/plain

From: Nicolas Dechesne <nicolas.dechesne@linaro.org>

Upstream in 5.33 btmgmt was moved from experimental to common READLINE section,
in commit e4f0c5582f1fe3451d5588243adba9de1ed68b80, but this was never updated
in the recipe.

This is a backport from master branch, commit
28777e593d3dd3a5d0ee2effcdca6a971e2887f9.

Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
---
 meta/recipes-connectivity/bluez5/bluez5_5.33.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/bluez5/bluez5_5.33.bb b/meta/recipes-connectivity/bluez5/bluez5_5.33.bb
index 23c7397..3084a64 100644
--- a/meta/recipes-connectivity/bluez5/bluez5_5.33.bb
+++ b/meta/recipes-connectivity/bluez5/bluez5_5.33.bb
@@ -10,6 +10,7 @@ NOINST_TOOLS_READLINE ?= " \
     tools/obex-server-tool \
     tools/bluetooth-player \
     tools/obexctl \
+    tools/btmgmt \
 "
 
 # noinst programs in Makefile.tools that are conditional on EXPERIMENTAL
@@ -34,7 +35,6 @@ NOINST_TOOLS_EXPERIMENTAL ?= " \
     tools/hwdb \
     tools/hcieventmask \
     tools/hcisecfilter \
-    tools/btmgmt \
     tools/btinfo \
     tools/btattach \
     tools/btsnoop \
-- 
2.8.0


