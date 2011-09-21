Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dbaryshkov@gmail.com>) id 1R6Rny-0001GK-DN
	for openembedded-core@lists.openembedded.org;
	Wed, 21 Sep 2011 20:45:58 +0200
Received: by mail-bw0-f47.google.com with SMTP id 11so2123691bke.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Sep 2011 11:40:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=w0pdiCZ8UjQOCFDbcX0P2iaU7aCdx2s5eymAGBB6o/Q=;
	b=iSzgwAxGsPRdxmy8Km6JNeDqRHguSZggb54/hrj7dJ4woR/OGKgC8T82fsaEc+Rrzy
	oTXruGHHdS/YRZ4cBL3v224YC89nKGCmltVUadznr/MGx62okIgGiEJE7A64kutXAcQm
	8IZBee2jsBoBIxQ0mOPoVVNwwuPuiP7/UIJKA=
Received: by 10.204.135.216 with SMTP id o24mr884141bkt.194.1316630441978;
	Wed, 21 Sep 2011 11:40:41 -0700 (PDT)
Received: from localhost.localdomain ([194.85.238.22])
	by mx.google.com with ESMTPS id t16sm5806554bkv.11.2011.09.21.11.40.40
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 21 Sep 2011 11:40:41 -0700 (PDT)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 21 Sep 2011 22:40:02 +0400
Message-Id: <1316630404-10336-15-git-send-email-dbaryshkov@gmail.com>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1316630404-10336-1-git-send-email-dbaryshkov@gmail.com>
References: <1316630404-10336-1-git-send-email-dbaryshkov@gmail.com>
Cc: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Subject: [PATCH 15/17] gcc: include plugin-related headers into packaged SDK
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
X-List-Received-Date: Wed, 21 Sep 2011 18:45:58 -0000

Include headers necessary to compile gcc plugins into cross-canadian gcc
packages.

Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
---
 meta/recipes-devtools/gcc/gcc-4.5.1.inc       |    2 +-
 meta/recipes-devtools/gcc/gcc-4.6.inc         |    2 +-
 meta/recipes-devtools/gcc/gcc-package-sdk.inc |    1 +
 3 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc-4.5.1.inc b/meta/recipes-devtools/gcc/gcc-4.5.1.inc
index f2991f2..90824bd 100644
--- a/meta/recipes-devtools/gcc/gcc-4.5.1.inc
+++ b/meta/recipes-devtools/gcc/gcc-4.5.1.inc
@@ -1,6 +1,6 @@
 require gcc-common.inc
 
-PR = "r9"
+PR = "r10"
 
 DEPENDS =+ "mpfr gmp libmpc elfutils"
 NATIVEDEPS = "mpfr-native gmp-native gettext-native libmpc-native elfutils-native"
diff --git a/meta/recipes-devtools/gcc/gcc-4.6.inc b/meta/recipes-devtools/gcc/gcc-4.6.inc
index f7bcf30..ee42fa7 100644
--- a/meta/recipes-devtools/gcc/gcc-4.6.inc
+++ b/meta/recipes-devtools/gcc/gcc-4.6.inc
@@ -1,6 +1,6 @@
 require gcc-common.inc
 
-PR = "r10"
+PR = "r11"
 
 # Third digit in PV should be incremented after a minor release
 # happens from this branch on gcc e.g. currently its 4.6.0
diff --git a/meta/recipes-devtools/gcc/gcc-package-sdk.inc b/meta/recipes-devtools/gcc/gcc-package-sdk.inc
index 7db7c52..8dd4ef7 100644
--- a/meta/recipes-devtools/gcc/gcc-package-sdk.inc
+++ b/meta/recipes-devtools/gcc/gcc-package-sdk.inc
@@ -13,6 +13,7 @@ FILES_${PN} = "\
     ${gcclibdir}/${TARGET_SYS}/${BINV}/lib* \
     ${gcclibdir}/${TARGET_SYS}/${BINV}/include \
     ${gcclibdir}/${TARGET_SYS}/${BINV}/include-fixed \
+    ${gcclibdir}/${TARGET_SYS}/${BINV}/plugin/include/ \
     ${includedir}/c++/${BINV} \
     ${prefix}/${TARGET_SYS}/bin/* \
     ${prefix}/${TARGET_SYS}/lib/* \
-- 
1.7.2.5



