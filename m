Return-Path: <Peter.Seebach@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1E30C6AC6B
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Oct 2014 22:52:00 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s93Mq2px000622
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 3 Oct 2014 15:52:02 -0700 (PDT)
Received: from msp-lpggp2.wrs.com (172.25.34.109) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.174.1;
	Fri, 3 Oct 2014 15:52:01 -0700
From: Peter Seebach <peter.seebach@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 3 Oct 2014 17:58:31 -0500
Message-ID: <19a695d43829a77948809158d8e63a5f56d2901b.1412376807.git.peter.seebach@windriver.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1412376807.git.peter.seebach@windriver.com>
References: <cover.1412376807.git.peter.seebach@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] pseudo*.bb: update to pseudo 1.6.2
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
X-List-Received-Date: Fri, 03 Oct 2014 22:52:03 -0000
Content-Type: text/plain

pseudo 1.6.2 fixes problems with 64-bit inodes and some underlying issues
involving file renames that could occasionally cause very strange behaviors
files being deleted, linked, or renamed, mostly observed as strange
recovery if an inode got reused.
---
 .../pseudo/{pseudo_1.6.1.bb => pseudo_1.6.2.bb}    |    4 ++--
 meta/recipes-devtools/pseudo/pseudo_git.bb         |    4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/pseudo/{pseudo_1.6.1.bb => pseudo_1.6.2.bb} (52%)

diff --git a/meta/recipes-devtools/pseudo/pseudo_1.6.1.bb b/meta/recipes-devtools/pseudo/pseudo_1.6.2.bb
similarity index 52%
rename from meta/recipes-devtools/pseudo/pseudo_1.6.1.bb
rename to meta/recipes-devtools/pseudo/pseudo_1.6.2.bb
index 2dff823..ece50bf 100644
--- a/meta/recipes-devtools/pseudo/pseudo_1.6.1.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_1.6.2.bb
@@ -4,7 +4,7 @@ SRC_URI = " \
     http://www.yoctoproject.org/downloads/${BPN}/${BPN}-${PV}.tar.bz2 \
 "
 
-SRC_URI[md5sum] = "c19e4811635d12f2a923e47061c7d336"
-SRC_URI[sha256sum] = "de9cc755b786bfbe2d416d35fab340f2b8ef9904cb2801be3092eeb7446a7c37"
+SRC_URI[md5sum] = "4d7b4f9d1b4aafa680ce94a5a9a52f1f"
+SRC_URI[sha256sum] = "c72be92689511ced7c419149c6aaa1b1a9e4dfc6409d1f16ab72cc35bc1e376a"
 
 PSEUDO_EXTRA_OPTS ?= "--enable-force-async"
diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
index d599cfb..8c6f06a 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -1,7 +1,7 @@
 require pseudo.inc
 
-SRCREV = "2765805641f09109029b88b38f27256dc1b52ba3"
-PV = "1.6.1+git${SRCPV}"
+SRCREV = "0dc29e7c67f25d0978a7da5cd8965514912c5b36"
+PV = "1.6.2+git${SRCPV}"
 
 DEFAULT_PREFERENCE = "-1"
 
-- 
1.7.1


