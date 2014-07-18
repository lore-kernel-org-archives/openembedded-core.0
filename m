Return-Path: <Peter.Seebach@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 0BAF87068F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Jul 2014 18:44:08 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s6IIi9pK025774
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Jul 2014 11:44:09 -0700 (PDT)
Received: from msp-lpggp2.wrs.com (172.25.34.109) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.169.1;
	Fri, 18 Jul 2014 11:44:09 -0700
From: Peter Seebach <peter.seebach@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 18 Jul 2014 13:49:25 -0500
Message-ID: <864bb33221017a0543a802d3c09e11841c753871.1405709256.git.peter.seebach@windriver.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1405709256.git.peter.seebach@windriver.com>
References: <cover.1405709256.git.peter.seebach@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] pseudo: uprev to 1.6.1
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
X-List-Received-Date: Fri, 18 Jul 2014 18:44:15 -0000
Content-Type: text/plain

Pseudo now automatically tries to shut down the server after running
single commands under pseudo ("pseudo <cmd>"), which means it can
print a useless "server already offline" message in some cases. The
message has been changed to a debugging message only.

The glibc symbol versions for memcpy were being applied to non-x86
targets, unintentionally, which broke builds for at least some targets.
(But pseudo doesn't usually get built for targets so it didn't
get noticed right away.)

Signed-off-by: Peter Seebach <peter.seebach@windriver.com>
---
 .../pseudo/{pseudo_1.6.0.bb => pseudo_1.6.1.bb}    |    4 ++--
 meta/recipes-devtools/pseudo/pseudo_git.bb         |    4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/pseudo/{pseudo_1.6.0.bb => pseudo_1.6.1.bb} (52%)

diff --git a/meta/recipes-devtools/pseudo/pseudo_1.6.0.bb b/meta/recipes-devtools/pseudo/pseudo_1.6.1.bb
similarity index 52%
rename from meta/recipes-devtools/pseudo/pseudo_1.6.0.bb
rename to meta/recipes-devtools/pseudo/pseudo_1.6.1.bb
index e92c4d7..2dff823 100644
--- a/meta/recipes-devtools/pseudo/pseudo_1.6.0.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_1.6.1.bb
@@ -4,7 +4,7 @@ SRC_URI = " \
     http://www.yoctoproject.org/downloads/${BPN}/${BPN}-${PV}.tar.bz2 \
 "
 
-SRC_URI[md5sum] = "78c3f8aa8efe8cf15a2b21261174e3b6"
-SRC_URI[sha256sum] = "e24f526443b31c3292ec5ba04950d230b5388e8983c7e192e9e489c007f3dba3"
+SRC_URI[md5sum] = "c19e4811635d12f2a923e47061c7d336"
+SRC_URI[sha256sum] = "de9cc755b786bfbe2d416d35fab340f2b8ef9904cb2801be3092eeb7446a7c37"
 
 PSEUDO_EXTRA_OPTS ?= "--enable-force-async"
diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
index ef258fa..d599cfb 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -1,7 +1,7 @@
 require pseudo.inc
 
-SRCREV = "512b84fb539c970464a93107995edf0e775d13fa"
-PV = "1.6.0+git${SRCPV}"
+SRCREV = "2765805641f09109029b88b38f27256dc1b52ba3"
+PV = "1.6.1+git${SRCPV}"
 
 DEFAULT_PREFERENCE = "-1"
 
-- 
1.7.1


