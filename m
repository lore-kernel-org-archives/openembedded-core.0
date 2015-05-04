Return-Path: <Peter.Seebach@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id B351765D00
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 May 2015 20:55:51 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.9) with ESMTP id t44KtqCS008482
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 4 May 2015 13:55:52 -0700 (PDT)
Received: from msp-lpggp2.wrs.com (172.25.34.109) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 4 May 2015 13:55:51 -0700
From: Peter Seebach <peter.seebach@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 4 May 2015 15:55:49 -0500
Message-ID: <3a91a1b4561c60a05e43d44bcf042666545932d6.1430767796.git.peter.seebach@windriver.com>
X-Mailer: git-send-email 2.3.1
In-Reply-To: <cover.1430767796.git.peter.seebach@windriver.com>
References: <cover.1430767796.git.peter.seebach@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] pseudo 1.6.5: less pointlessly chatty
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
X-List-Received-Date: Mon, 04 May 2015 20:55:51 -0000
Content-Type: text/plain

There was a stupid logic error controlling the diagnostic for
a "possible" mismatch involving trailing slashes and whether or
not a node was believed to be a directory. Specifically, a diagnostic
got printed any time a lookup for a directory *didn't* have a
trailing slash, as well as in the (actually intended) case where
a non-directory lookup *did*.

No other changes, but that one is probably significant.
---
 meta/recipes-devtools/pseudo/{pseudo_1.6.4.bb => pseudo_1.6.5.bb} | 4 ++--
 meta/recipes-devtools/pseudo/pseudo_git.bb                        | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/pseudo/{pseudo_1.6.4.bb => pseudo_1.6.5.bb} (77%)

diff --git a/meta/recipes-devtools/pseudo/pseudo_1.6.4.bb b/meta/recipes-devtools/pseudo/pseudo_1.6.5.bb
similarity index 77%
rename from meta/recipes-devtools/pseudo/pseudo_1.6.4.bb
rename to meta/recipes-devtools/pseudo/pseudo_1.6.5.bb
index 3d5b1fb..2a9dc63 100644
--- a/meta/recipes-devtools/pseudo/pseudo_1.6.4.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_1.6.5.bb
@@ -6,8 +6,8 @@ SRC_URI = " \
     file://fallback-group \
 "
 
-SRC_URI[md5sum] = "2fb800c90d643bfce55e1ce5ca67f3b3"
-SRC_URI[sha256sum] = "25a7528f9191f74cceccc08a90c00086f2b3a9f6b900ea419a4f092de9a06775"
+SRC_URI[md5sum] = "a5545ff365e243193c81981df98e870b"
+SRC_URI[sha256sum] = "f5a0af976c958915503f516dd02097ab6a64c98a3c0cb4ceb0ce8b1ef8e38b3c"
 
 PSEUDO_EXTRA_OPTS ?= "--enable-force-async --without-passwd-fallback"
 
diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
index b505910..aa315d3 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -1,7 +1,7 @@
 require pseudo.inc
 
-SRCREV = "41389d4279d6a5f694615906217f481605b183b7"
-PV = "1.6.4+git${SRCPV}"
+SRCREV = "db758fb11167c79d9682a17d359568e2a3c4acd5"
+PV = "1.6.5+git${SRCPV}"
 
 DEFAULT_PREFERENCE = "-1"
 
-- 
2.3.1


