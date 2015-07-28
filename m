Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5E2F6763BF
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jul 2015 02:12:34 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t6S2CYKi025331
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Jul 2015 19:12:34 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.235.1;
	Mon, 27 Jul 2015 19:12:19 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 27 Jul 2015 19:12:27 -0700
Message-ID: <969c2a8ce74f7985a0e1a5d91f5b635ac83772d4.1438049511.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1438049511.git.liezhi.yang@windriver.com>
References: <cover.1438049511.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 4/9] less: 478 -> 479
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
X-List-Received-Date: Tue, 28 Jul 2015 02:12:34 -0000
Content-Type: text/plain

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../less/{less_478.bb => less_479.bb}              |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/less/{less_478.bb => less_479.bb} (88%)

diff --git a/meta/recipes-extended/less/less_478.bb b/meta/recipes-extended/less/less_479.bb
similarity index 88%
rename from meta/recipes-extended/less/less_478.bb
rename to meta/recipes-extended/less/less_479.bb
index fc63774d..618954b 100644
--- a/meta/recipes-extended/less/less_478.bb
+++ b/meta/recipes-extended/less/less_479.bb
@@ -27,8 +27,8 @@ DEPENDS = "ncurses"
 SRC_URI = "http://www.greenwoodsoftware.com/${BPN}/${BPN}-${PV}.tar.gz \
 	  "
 
-SRC_URI[md5sum] = "934fcc9f137b9ef66a943c224f413d39"
-SRC_URI[sha256sum] = "495c7df52199a0c7e6bfbbe7697b2b54f4bf197c8b10b43957762d74483574ce"
+SRC_URI[md5sum] = "049f51ccfe2686009c6ce943eeb4bbaf"
+SRC_URI[sha256sum] = "5bf06cb30ee2a2bd1f79f39aa91e46444e7cb19b48c95c4992fa63cfe4527a80"
 
 inherit autotools update-alternatives
 
-- 
1.7.9.5


