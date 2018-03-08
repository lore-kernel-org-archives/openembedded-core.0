Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id CB1807899E
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Mar 2018 18:25:30 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	08 Mar 2018 10:25:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.47,441,1515484800"; d="scan'208";a="24054027"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga006.jf.intel.com with ESMTP; 08 Mar 2018 10:25:31 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  8 Mar 2018 20:17:54 +0200
Message-Id: <20180308181804.31261-32-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.16.1
In-Reply-To: <20180308181804.31261-1-alexander.kanavin@linux.intel.com>
References: <20180308181804.31261-1-alexander.kanavin@linux.intel.com>
Subject: [PATCH 32/42] intltool: refresh patches
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
X-List-Received-Date: Thu, 08 Mar 2018 18:25:31 -0000

From: Ross Burton <ross.burton@intel.com>

The patch tool will apply patches by default with "fuzz", which is where if the
hunk context isn't present but what is there is close enough, it will force the
patch in.

Whilst this is useful when there's just whitespace changes, when applied to
source it is possible for a patch applied with fuzz to produce broken code which
still compiles (see #10450).  This is obviously bad.

We'd like to eventually have do_patch() rejecting any fuzz on these grounds. For
that to be realistic the existing patches with fuzz need to be rebased and
reviewed.

Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 .../intltool/intltool/perl-522-deprecations.patch          | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-devtools/intltool/intltool/perl-522-deprecations.patch b/meta/recipes-devtools/intltool/intltool/perl-522-deprecations.patch
index eb52172e10b..f1049e433e2 100644
--- a/meta/recipes-devtools/intltool/intltool/perl-522-deprecations.patch
+++ b/meta/recipes-devtools/intltool/intltool/perl-522-deprecations.patch
@@ -10,9 +10,11 @@ Take a patch from Debian to solve this.
 Upstream-Status: Submitted (https://bugs.launchpad.net/intltool/+bug/1465010)
 Signed-off-by: Ross Burton <ross.burton@intel.com>
 
---- intltool-0.51.0-ORIG/intltool-update.in	2015-05-27 00:20:43.038379963 +0200
-+++ intltool-0.51.0/intltool-update.in	2015-05-27 00:23:53.309078052 +0200
-@@ -1062,7 +1062,7 @@
+Index: intltool-0.51.0/intltool-update.in
+===================================================================
+--- intltool-0.51.0.orig/intltool-update.in
++++ intltool-0.51.0/intltool-update.in
+@@ -1062,7 +1062,7 @@ sub SubstituteVariable
  	}
      }
  
@@ -21,7 +23,7 @@ Signed-off-by: Ross Burton <ross.burton@intel.com>
      {
  	my $rest = $3;
  	my $untouched = $1;
-@@ -1190,10 +1190,10 @@
+@@ -1190,10 +1190,10 @@ sub FindPackageName
  	$name    =~ s/\(+$//g;
  	$version =~ s/\(+$//g;
  
@@ -36,7 +38,7 @@ Signed-off-by: Ross Burton <ross.burton@intel.com>
      }
  
      if ($conf_source =~ /^AC_INIT\(([^,\)]+),([^,\)]+)[,]?([^,\)]+)?/m)
-@@ -1219,11 +1219,11 @@
+@@ -1219,11 +1219,11 @@ sub FindPackageName
  	$version =~ s/\(+$//g;
          $bugurl  =~ s/\(+$//g if (defined $bugurl);
  
@@ -52,4 +54,4 @@ Signed-off-by: Ross Burton <ross.burton@intel.com>
 +        $varhash{"PACKAGE_BUGREPORT"} = $bugurl if (defined $bugurl and not $bugurl =~ /\$\{?\w+\}?/);
      }
  
-     # \s makes this not work, why?
\ No newline at end of file
+     # \s makes this not work, why?
-- 
2.16.1


