Return-Path: <ismo.puustinen@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 2F2537378D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 May 2015 08:22:12 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga101.jf.intel.com with ESMTP; 21 May 2015 01:22:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,467,1427785200"; d="scan'208";a="729483738"
Received: from ipuustin-mobl.ger.corp.intel.com (HELO
	ipuustin-mobl.fi.intel.com) ([10.237.68.151])
	by fmsmga002.fm.intel.com with ESMTP; 21 May 2015 01:22:14 -0700
From: Ismo Puustinen <ismo.puustinen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 21 May 2015 11:21:34 +0300
Message-Id: <1432196500-13462-6-git-send-email-ismo.puustinen@intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1432196500-13462-1-git-send-email-ismo.puustinen@intel.com>
References: <1432196500-13462-1-git-send-email-ismo.puustinen@intel.com>
Subject: [PATCH 05/11] libfile-checktree-perl: escape quotes inside variable values.
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
X-List-Received-Date: Thu, 21 May 2015 08:22:12 -0000

---
 meta/recipes-lsb4/perl/libfile-checktree-perl_4.41.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-lsb4/perl/libfile-checktree-perl_4.41.bb b/meta/recipes-lsb4/perl/libfile-checktree-perl_4.41.bb
index ce37c72..28d726e 100644
--- a/meta/recipes-lsb4/perl/libfile-checktree-perl_4.41.bb
+++ b/meta/recipes-lsb4/perl/libfile-checktree-perl_4.41.bb
@@ -1,15 +1,15 @@
 SUMMARY = "Perl module that run many filetest checks on a tree"
 DESCRIPTION = "The validate() routine takes a single multiline string consisting \
 of directives, each containing a filename plus a file test to try on it. (The file \
-test may also be a "cd", causing subsequent relative filenames to be interpreted \
+test may also be a \"cd\", causing subsequent relative filenames to be interpreted \
 relative to that directory.) After the file test you may put || die to make it a \
 fatal error if the file test fails. The default is || warn. The file test may \
-optionally have a "!' prepended to test for the opposite condition. If you do a \
+optionally have a \"!' prepended to test for the opposite condition. If you do a \
 cd and then list some relative filenames, you may want to indent them slightly for \
 readability. If you supply your own die() or warn() message, you can use $file to \
 interpolate the filename. \
 \
-Filetests may be bunched: "-rwx" tests for all of -r, -w, and -x. Only the first failed \
+Filetests may be bunched: \"-rwx\" tests for all of -r, -w, and -x. Only the first failed \
 test of the bunch will produce a warning. \
 \
 The routine returns the number of warnings issued."
-- 
2.1.0


