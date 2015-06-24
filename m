Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 0E10E75ACF
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Jun 2015 06:26:36 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t5O6QbvP004246
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Jun 2015 23:26:37 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 23 Jun 2015 23:26:36 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 23 Jun 2015 23:26:31 -0700
Message-ID: <b56f65c0a08d95dd9472e8e5003d62849f9de5a7.1435126503.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1435126503.git.liezhi.yang@windriver.com>
References: <cover.1435126503.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 6/8] perl: odbm.t: fix the path of dbmt_common.pl
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
X-List-Received-Date: Wed, 24 Jun 2015 06:26:36 -0000
Content-Type: text/plain

It should be ../t/lib/dbmt_common.pl.

Fixed:
Can't locate ../../t/lib/dbmt_common.pl in @INC

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 ...le-t-odbm.t-fix-the-path-of-dbmt_common.p.patch |   31 ++++++++++++++++++++
 meta/recipes-devtools/perl/perl_5.22.0.bb          |    1 +
 2 files changed, 32 insertions(+)
 create mode 100644 meta/recipes-devtools/perl/perl/ext-ODBM_File-t-odbm.t-fix-the-path-of-dbmt_common.p.patch

diff --git a/meta/recipes-devtools/perl/perl/ext-ODBM_File-t-odbm.t-fix-the-path-of-dbmt_common.p.patch b/meta/recipes-devtools/perl/perl/ext-ODBM_File-t-odbm.t-fix-the-path-of-dbmt_common.p.patch
new file mode 100644
index 0000000..6b05b87
--- /dev/null
+++ b/meta/recipes-devtools/perl/perl/ext-ODBM_File-t-odbm.t-fix-the-path-of-dbmt_common.p.patch
@@ -0,0 +1,31 @@
+From b842e1de7798a1f7df770bb3f185ad3356e490e6 Mon Sep 17 00:00:00 2001
+From: Robert Yang <liezhi.yang@windriver.com>
+Date: Mon, 22 Jun 2015 20:06:56 -0700
+Subject: [PATCH] ext/ODBM_File/t/odbm.t: fix the  path of dbmt_common.pl
+
+It should be lib/dbmt_common.pl when run by run-ptest.
+
+Fixed:
+Can't locate ../../t/lib/dbmt_common.pl in @INC
+
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+---
+ ext/ODBM_File/t/odbm.t |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/ext/ODBM_File/t/odbm.t b/ext/ODBM_File/t/odbm.t
+index 079b9f1..250b991 100644
+--- a/ext/ODBM_File/t/odbm.t
++++ b/ext/ODBM_File/t/odbm.t
+@@ -2,7 +2,7 @@
+ 
+ our $DBM_Class = 'ODBM_File';
+ 
+-require '../../t/lib/dbmt_common.pl';
++require 'lib/dbmt_common.pl';
+ 
+ if ($^O eq 'hpux') {
+     print <<EOM;
+-- 
+1.7.9.5
+
diff --git a/meta/recipes-devtools/perl/perl_5.22.0.bb b/meta/recipes-devtools/perl/perl_5.22.0.bb
index 7c70414..1aa9737 100644
--- a/meta/recipes-devtools/perl/perl_5.22.0.bb
+++ b/meta/recipes-devtools/perl/perl_5.22.0.bb
@@ -60,6 +60,7 @@ SRC_URI += " \
         file://make_ext.pl-fix-regenerate-makefile-failed-while-cc-.patch \
         file://t-run-switches.t-perl5-perl.patch \
         file://ext-ODBM_File-hints-linux.pl-link-libgdbm_compat.patch \
+        file://ext-ODBM_File-t-odbm.t-fix-the-path-of-dbmt_common.p.patch \
 "
 
 # Fix test case issues
-- 
1.7.9.5


