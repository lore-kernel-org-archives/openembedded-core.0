Return-Path: <Peter.Seebach@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 6FFAE7318C
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Feb 2016 19:57:59 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u19Jw0f5016854
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 9 Feb 2016 11:58:00 -0800 (PST)
Received: from msp-lpggp2.wrs.com (172.25.34.109) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Tue, 9 Feb 2016 11:57:59 -0800
From: Peter Seebach <peter.seebach@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 9 Feb 2016 13:57:58 -0600
Message-ID: <cc80da8c5df9570348d5318b783197759f5deed3.1455047631.git.peter.seebach@windriver.com>
X-Mailer: git-send-email 2.3.1
In-Reply-To: <cover.1455047631.git.peter.seebach@windriver.com>
References: <cover.1455047631.git.peter.seebach@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] pseudo: uprev to 1.7.5
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
X-List-Received-Date: Tue, 09 Feb 2016 19:58:01 -0000
Content-Type: text/plain

This uprev adds various improvements with regards to the server
spawn logic, and also sorts xattrs to work around a bug in one of
the mkfs utilities.

Signed-off-by: Peter Seebach <peter.seebach@windriver.com>
---
 meta/recipes-devtools/pseudo/{pseudo_1.7.4.bb => pseudo_1.7.5.bb} | 4 ++--
 meta/recipes-devtools/pseudo/pseudo_git.bb                        | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/pseudo/{pseudo_1.7.4.bb => pseudo_1.7.5.bb} (77%)

diff --git a/meta/recipes-devtools/pseudo/pseudo_1.7.4.bb b/meta/recipes-devtools/pseudo/pseudo_1.7.5.bb
similarity index 77%
rename from meta/recipes-devtools/pseudo/pseudo_1.7.4.bb
rename to meta/recipes-devtools/pseudo/pseudo_1.7.5.bb
index d68e0af..195a508 100644
--- a/meta/recipes-devtools/pseudo/pseudo_1.7.4.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_1.7.5.bb
@@ -6,8 +6,8 @@ SRC_URI = " \
     file://fallback-group \
 "
 
-SRC_URI[md5sum] = "6e4b59a346d08d4a29133c335ea12052"
-SRC_URI[sha256sum] = "f33ff84da328f943155f22cfd49030ef4ad85ad35fc2d9419a203521b65c384c"
+SRC_URI[md5sum] = "c10209938f03128d0c193f041ff3596d"
+SRC_URI[sha256sum] = "fd89cadec984d3b8202aca465898b1bb4350e0d63ba9aa9ac899f6f50270e688"
 
 PSEUDO_EXTRA_OPTS ?= "--enable-force-async --without-passwd-fallback"
 
diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
index eb666c0..abff1cf 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -1,7 +1,7 @@
 require pseudo.inc
 
-SRCREV = "3bc3909fa70535c2ef876009dc58e577b10a7e0e"
-PV = "1.7.4+git${SRCPV}"
+SRCREV = "786c6d3813622d18e12d36c4aa722af6a417c8fa"
+PV = "1.7.5+git${SRCPV}"
 
 DEFAULT_PREFERENCE = "-1"
 
-- 
2.3.1


