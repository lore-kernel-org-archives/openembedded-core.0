Return-Path: <william.c.randle@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 0CE3D77197
	for <openembedded-core@lists.openembedded.org>;
	Sat,  4 Jun 2016 22:45:34 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga101.jf.intel.com with ESMTP; 04 Jun 2016 15:45:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,419,1459839600"; d="scan'208";a="116139545"
Received: from wcrandle-mobl.amr.corp.intel.com ([10.254.180.184])
	by fmsmga004.fm.intel.com with ESMTP; 04 Jun 2016 15:45:34 -0700
From: Bill Randle <william.c.randle@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  4 Jun 2016 15:45:01 -0700
Message-Id: <1465080303-5506-2-git-send-email-william.c.randle@intel.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <1465080303-5506-1-git-send-email-william.c.randle@intel.com>
References: <1465080303-5506-1-git-send-email-william.c.randle@intel.com>
Subject: [PATCH 1/3] perl: set proper perl subversion number in config files
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
X-List-Received-Date: Sat, 04 Jun 2016 22:45:35 -0000

During the upgrade from Perl 5.22.0 to 5.22.1 in commit
f4c9908eae1ae3dcc38877abe2d5fbeb46851dd4 the config.sh file was hand edited
to change the subversion numbers. However, the edit was not entirely
correct. As a result the Perl version test failed. Set the correct
version strings.

[YOCTO #8656]

Signed-off-by: Bill Randle <william.c.randle@intel.com>
---
 meta/recipes-devtools/perl/perl/config.sh         | 10 +++++-----
 meta/recipes-devtools/perl/perl/perl-configure.sh |  2 +-
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-devtools/perl/perl/config.sh b/meta/recipes-devtools/perl/perl/config.sh
index 59e016e..b2a7f2c 100644
--- a/meta/recipes-devtools/perl/perl/config.sh
+++ b/meta/recipes-devtools/perl/perl/config.sh
@@ -8,7 +8,7 @@
 
 # Package name      : perl5
 # Source directory  : .
-# Configuration time: Thu Jun 18 05:37:27 UTC 2015
+# Configuration time: Fri May  6 20:13:46 PDT 2016
 # Configured by     : Open Embedded
 # Target system     : linux qemux86-64 3.19.5-yocto-standard #1 smp preempt tue jun 16 00:28:17 pdt 2015 x86_64 gnulinux
 
@@ -66,7 +66,7 @@ aphostname=''
 api_revision='5'
 api_subversion='0'
 api_version='22'
-api_versionstring='5.22.1'
+api_versionstring='5.22.0'
 ar='ar'
 archlib='@LIBDIR@/perl/5.22.1/@ARCH@-thread-multi'
 archlibexp='@STAGINGDIR@@LIBDIR@/perl/5.22.1/@ARCH@-thread-multi'
@@ -96,7 +96,7 @@ ccsymbols=''
 ccversion=''
 cf_by='Open Embedded'
 cf_email='Open Embedded@localhost.localdomain'
-cf_time='Thu Jun 18 05:37:27 UTC 2015'
+cf_time='Fri May  6 20:13:46 PDT 2016'
 charbits='8'
 charsize='1'
 chgrp=''
@@ -1194,7 +1194,7 @@ vendorprefixexp='@EXECPREFIX@'
 vendorscript='@USRBIN@'
 vendorscriptexp='@USRBIN@'
 version='5.22.1'
-version_patchlevel_string='version 22 subversion 0'
+version_patchlevel_string='version 22 subversion 1'
 versiononly='undef'
 vi=''
 xlibpth='@LIBDIR@/386 @BASELIBDIR@386'
@@ -1204,7 +1204,7 @@ zcat=''
 zip='zip'
 PERL_REVISION=5
 PERL_VERSION=22
-PERL_SUBVERSION=0
+PERL_SUBVERSION=1
 PERL_API_REVISION=5
 PERL_API_VERSION=22
 PERL_API_SUBVERSION=0
diff --git a/meta/recipes-devtools/perl/perl/perl-configure.sh b/meta/recipes-devtools/perl/perl/perl-configure.sh
index e72ce49..25e7f8b 100755
--- a/meta/recipes-devtools/perl/perl/perl-configure.sh
+++ b/meta/recipes-devtools/perl/perl/perl-configure.sh
@@ -15,7 +15,7 @@ echo sh Configure -des \
         -Dprefix=/usr \
         -Dvendorprefix=/usr \
         -Dsiteprefix=/usr \
-        -Dotherlibdirs=/usr/lib/perl5/5.12.3 \
+        -Dotherlibdirs=/usr/lib/perl5/5.22.1 \
         -Duseshrplib \
         -Dusethreads \
         -Duseithreads \
-- 
2.5.5


