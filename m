Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id C67C272A0E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Jan 2015 12:23:14 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 13 Jan 2015 04:23:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.07,749,1413270000"; d="scan'208";a="650376246"
Received: from ikatz2-mobl.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.18.193])
	by fmsmga001.fm.intel.com with ESMTP; 13 Jan 2015 04:23:13 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 13 Jan 2015 12:23:04 +0000
Message-Id: <64594f09c7f1dd41ea19105930a515916536dd2c.1421151750.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <cover.1421151750.git.paul.eggleton@linux.intel.com>
References: <cover.1421151750.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1421151750.git.paul.eggleton@linux.intel.com>
References: <cover.1421151750.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 2/4] perl: fix LICENSE to be more accurate
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
X-List-Received-Date: Tue, 13 Jan 2015 12:23:19 -0000

The Perl license is the Artistic License, or GPL version 1 or (at your
option) any later version:

  http://dev.perl.org/licenses/

Update LICENSE accordingly. Thanks to Clemens Lang for reporting this.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/recipes-devtools/perl/perl-native_5.20.0.bb | 2 +-
 meta/recipes-devtools/perl/perl_5.20.0.bb        | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/perl/perl-native_5.20.0.bb b/meta/recipes-devtools/perl/perl-native_5.20.0.bb
index 01d40fc..586a347 100644
--- a/meta/recipes-devtools/perl/perl-native_5.20.0.bb
+++ b/meta/recipes-devtools/perl/perl-native_5.20.0.bb
@@ -1,7 +1,7 @@
 SUMMARY = "Perl scripting language"
 HOMEPAGE = "http://www.perl.org/"
 SECTION = "libs"
-LICENSE = "Artistic-1.0 | GPL-1.0"
+LICENSE = "Artistic-1.0 | GPL-1.0+"
 
 LIC_FILES_CHKSUM = "file://Copying;md5=5b122a36d0f6dc55279a0ebc69f3c60b \
                     file://Artistic;md5=2e6fd2475335af892494fe1f7327baf3"
diff --git a/meta/recipes-devtools/perl/perl_5.20.0.bb b/meta/recipes-devtools/perl/perl_5.20.0.bb
index 3ca0f53..c1766fc 100644
--- a/meta/recipes-devtools/perl/perl_5.20.0.bb
+++ b/meta/recipes-devtools/perl/perl_5.20.0.bb
@@ -1,7 +1,7 @@
 SUMMARY = "Perl scripting language"
 HOMEPAGE = "http://www.perl.org/"
 SECTION = "devel"
-LICENSE = "Artistic-1.0 | GPL-1.0"
+LICENSE = "Artistic-1.0 | GPL-1.0+"
 LIC_FILES_CHKSUM = "file://Copying;md5=5b122a36d0f6dc55279a0ebc69f3c60b \
 		    file://Artistic;md5=2e6fd2475335af892494fe1f7327baf3"
 # We need gnugrep (for -I)
-- 
1.9.3


