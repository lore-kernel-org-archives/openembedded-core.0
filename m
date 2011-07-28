Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QmNYv-000449-A0
	for openembedded-core@lists.openembedded.org;
	Thu, 28 Jul 2011 12:11:29 +0200
Received: by wwi18 with SMTP id 18so1946465wwi.24
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Jul 2011 03:07:14 -0700 (PDT)
Received: by 10.227.61.17 with SMTP id r17mr4239721wbh.69.1311847633896;
	Thu, 28 Jul 2011 03:07:13 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id gg16sm690917wbb.51.2011.07.28.03.07.12
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 28 Jul 2011 03:07:13 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Thu, 28 Jul 2011 12:07:09 +0200
Message-Id: <1311847629-4047-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.6.6.1
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH] bitbake.conf: attemp to fix PACKAGE_EXTRA_ARCHS problems
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
X-List-Received-Date: Thu, 28 Jul 2011 10:11:29 -0000

See http://lists.linuxtogo.org/pipermail/openembedded-core/2011-July/007075.html for more background

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta/conf/bitbake.conf |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 6e109ec..1a6969b 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -84,7 +84,8 @@ HOST_EXEEXT = ""
 TUNE_ARCH ??= "INVALID"
 TUNE_CCARGS ??= ""
 TUNE_FEATURES ??= "${TUNE_FEATURES_tune-${DEFAULTTUNE}}"
-PACKAGE_EXTRA_ARCHS_tune-${DEFAULTTUNE} ??= "${TARGET_ARCH}"
+# Uncommenting the below line leads to all kinds of problems: http://lists.linuxtogo.org/pipermail/openembedded-core/2011-July/007075.html
+#PACKAGE_EXTRA_ARCHS_tune-${DEFAULTTUNE} ?= "${TARGET_ARCH}"
 LIBCEXTENSION ??= ""
 ABIEXTENSION ??= ""
 
-- 
1.6.6.1



