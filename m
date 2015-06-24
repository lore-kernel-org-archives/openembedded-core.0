Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id C5D8575A36
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Jun 2015 06:26:34 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t5O6QatW004243
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Jun 2015 23:26:36 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 23 Jun 2015 23:26:36 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 23 Jun 2015 23:26:29 -0700
Message-ID: <056158746e825d1be62740c8b627f050072737e4.1435126503.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1435126503.git.liezhi.yang@windriver.com>
References: <cover.1435126503.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 4/8] perl: fix test case switches.t
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
X-List-Received-Date: Wed, 24 Jun 2015 06:26:35 -0000
Content-Type: text/plain

We call it perl rather than perl5 in oe-core.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../perl/perl/t-run-switches.t-perl5-perl.patch    |   30 ++++++++++++++++++++
 meta/recipes-devtools/perl/perl_5.22.0.bb          |    1 +
 2 files changed, 31 insertions(+)
 create mode 100644 meta/recipes-devtools/perl/perl/t-run-switches.t-perl5-perl.patch

diff --git a/meta/recipes-devtools/perl/perl/t-run-switches.t-perl5-perl.patch b/meta/recipes-devtools/perl/perl/t-run-switches.t-perl5-perl.patch
new file mode 100644
index 0000000..03fdf4a
--- /dev/null
+++ b/meta/recipes-devtools/perl/perl/t-run-switches.t-perl5-perl.patch
@@ -0,0 +1,30 @@
+From 1561549ea36e37cc25706f094a195de4928f4211 Mon Sep 17 00:00:00 2001
+From: Robert Yang <liezhi.yang@windriver.com>
+Date: Fri, 19 Jun 2015 01:23:46 -0700
+Subject: [PATCH] t/run/switches.t: perl5 -> perl
+
+We call it perl rather than perl5 in oe.
+
+Upstream-Status: Inappropriate [oe specific]
+
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+---
+ t/run/switches.t |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/t/run/switches.t b/t/run/switches.t
+index 78915e0..e9e4b45 100644
+--- a/t/run/switches.t
++++ b/t/run/switches.t
+@@ -269,7 +269,7 @@ is runperl(stderr => 1, prog => '#!perl -M'),
+           '-V generates 20+ lines' );
+ 
+     like( runperl( switches => ['-V'] ),
+-	  qr/\ASummary of my perl5 .*configuration:/,
++	  qr/\ASummary of my perl .*configuration:/,
+           '-V looks okay' );
+ 
+     # lookup a known config var
+-- 
+1.7.9.5
+
diff --git a/meta/recipes-devtools/perl/perl_5.22.0.bb b/meta/recipes-devtools/perl/perl_5.22.0.bb
index e749078..da3dba6 100644
--- a/meta/recipes-devtools/perl/perl_5.22.0.bb
+++ b/meta/recipes-devtools/perl/perl_5.22.0.bb
@@ -58,6 +58,7 @@ SRC_URI += " \
         file://config.sh-64-le \
         file://config.sh-64-be \
         file://make_ext.pl-fix-regenerate-makefile-failed-while-cc-.patch \
+        file://t-run-switches.t-perl5-perl.patch \
 "
 
 # Fix test case issues
-- 
1.7.9.5


