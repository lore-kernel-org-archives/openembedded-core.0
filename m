Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 85E837586F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Jun 2015 07:34:21 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t5A7YM31019553
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Jun 2015 00:34:22 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 10 Jun 2015 00:34:22 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 10 Jun 2015 00:34:20 -0700
Message-ID: <1a26f30aac797bea6fd90819ae6046437a365ecc.1433921605.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1433921605.git.liezhi.yang@windriver.com>
References: <cover.1433921605.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] mtools: add PACKAGECONFIG for libbsd
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
X-List-Received-Date: Wed, 10 Jun 2015 07:34:21 -0000
Content-Type: text/plain

Fixed:
ld: cannot find -lbsd
collect2: error: ld returned 1 exit status

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-devtools/mtools/mtools_3.9.9.bb  |    3 +++
 meta/recipes-devtools/mtools/mtools_4.0.18.bb |    3 +++
 2 files changed, 6 insertions(+)

diff --git a/meta/recipes-devtools/mtools/mtools_3.9.9.bb b/meta/recipes-devtools/mtools/mtools_3.9.9.bb
index 9cd1c57..c284a71 100644
--- a/meta/recipes-devtools/mtools/mtools_3.9.9.bb
+++ b/meta/recipes-devtools/mtools/mtools_3.9.9.bb
@@ -46,6 +46,9 @@ EXTRA_OECONF = "--without-x"
 
 BBCLASSEXTEND = "native nativesdk"
 
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[libbsd] = "ac_cv_lib_bsd_main=yes,ac_cv_lib_bsd_main=no,libbsd"
+
 do_install_prepend () {
     # Create bindir to fix parallel installation issues
     mkdir -p ${D}/${bindir}
diff --git a/meta/recipes-devtools/mtools/mtools_4.0.18.bb b/meta/recipes-devtools/mtools/mtools_4.0.18.bb
index b2cfe9a..52decfd 100644
--- a/meta/recipes-devtools/mtools/mtools_4.0.18.bb
+++ b/meta/recipes-devtools/mtools/mtools_4.0.18.bb
@@ -37,6 +37,9 @@ EXTRA_OECONF = "--without-x"
 
 BBCLASSEXTEND = "native nativesdk"
 
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[libbsd] = "ac_cv_lib_bsd_main=yes,ac_cv_lib_bsd_main=no,libbsd"
+
 do_install_prepend () {
     # Create bindir to fix parallel installation issues
     mkdir -p ${D}/${bindir}
-- 
1.7.9.5


