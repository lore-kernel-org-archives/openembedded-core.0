Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 3EAB778466
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Jun 2017 12:28:54 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	16 Jun 2017 05:28:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,347,1493708400"; d="scan'208";a="1161279519"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga001.fm.intel.com with ESMTP; 16 Jun 2017 05:28:55 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 16 Jun 2017 15:28:29 +0300
Message-Id: <21e13a89719ff1a57d7dcfdba72ac5b91f14aa20.1497615866.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1497615866.git.alexander.kanavin@linux.intel.com>
References: <cover.1497615866.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 06/32] recipes-lsb4/perl: remove the recipes
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
X-List-Received-Date: Fri, 16 Jun 2017 12:28:54 -0000

These were required by LSB 4.1 tests; there's no other reason to continue
carrying them in oe-core.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 .../packagegroups/packagegroup-core-lsb.bb         |  6 ----
 meta/recipes-lsb4/perl/libclass-isa-perl_0.36.bb   | 31 ---------------------
 meta/recipes-lsb4/perl/libdumpvalue-perl_1.17.bb   | 18 ------------
 meta/recipes-lsb4/perl/libenv-perl_1.04.bb         | 21 --------------
 .../perl/libfile-checktree-perl_4.41.bb            | 32 ----------------------
 .../recipes-lsb4/perl/libi18n-collate-perl_1.02.bb | 21 --------------
 meta/recipes-lsb4/perl/libpod-plainer-perl_1.04.bb | 23 ----------------
 7 files changed, 152 deletions(-)
 delete mode 100644 meta/recipes-lsb4/perl/libclass-isa-perl_0.36.bb
 delete mode 100644 meta/recipes-lsb4/perl/libdumpvalue-perl_1.17.bb
 delete mode 100644 meta/recipes-lsb4/perl/libenv-perl_1.04.bb
 delete mode 100644 meta/recipes-lsb4/perl/libfile-checktree-perl_4.41.bb
 delete mode 100644 meta/recipes-lsb4/perl/libi18n-collate-perl_1.02.bb
 delete mode 100644 meta/recipes-lsb4/perl/libpod-plainer-perl_1.04.bb

diff --git a/meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb b/meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb
index a6fb3023052..112fe7bf11d 100644
--- a/meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb
+++ b/meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb
@@ -239,10 +239,4 @@ RDEPENDS_packagegroup-core-lsb-runtime-add = "\
     glibc-localedata-posix \
     glibc-extra-nss \
     glibc-pcprofile \
-    libclass-isa-perl \
-    libenv-perl \
-    libdumpvalue-perl \
-    libfile-checktree-perl \
-    libi18n-collate-perl \
-    libpod-plainer-perl \
 "
diff --git a/meta/recipes-lsb4/perl/libclass-isa-perl_0.36.bb b/meta/recipes-lsb4/perl/libclass-isa-perl_0.36.bb
deleted file mode 100644
index f93841dc7f1..00000000000
--- a/meta/recipes-lsb4/perl/libclass-isa-perl_0.36.bb
+++ /dev/null
@@ -1,31 +0,0 @@
-SUMMARY = "Perl module for reporting the search path for a class's ISA tree"
-DESCRIPTION = "Suppose you have a class (like Food::Fish::Fishstick) that is derived, \
-via its @ISA, from one or more superclasses (as Food::Fish::Fishstick is from Food::Fish,\
-Life::Fungus, and Chemicals), and some of those superclasses may themselves each be\
-derived, via its @ISA, from one or more superclasses (as above).\
-\
-When, then, you call a method in that class ($fishstick->calories), Perl first searches\
-there for that method, but if it's not there, it goes searching in its superclasses, and\
-so on, in a depth-first (or maybe "height-first" is the word) search. In the above example,\
-it'd first look in Food::Fish, then Food, then Matter, then Life::Fungus, then Life, then\
-Chemicals.\
-\
-This library, Class::ISA, provides functions that return that list -- the list\
-(in order) of names of classes Perl would search to find a method, with no duplicates."
-
-HOMEPAGE = "http://search.cpan.org/dist/Class-ISA/"
-SECTION = "libs"
-LICENSE = "Artistic-1.0 | GPL-1.0+"
-
-LIC_FILES_CHKSUM = "file://README;beginline=107;endline=111;md5=6a5c6842a63cfe4dab1f66e2350e4d25"
-
-SRC_URI = "http://search.cpan.org/CPAN/authors/id/S/SM/SMUELLER/Class-ISA-${PV}.tar.gz"
-
-SRC_URI[md5sum] = "3a2ad203c8dc87d6c9de16215d00af47"
-SRC_URI[sha256sum] = "8816f34e9a38e849a10df756030dccf9fe061a196c11ac3faafd7113c929b964"
-
-S = "${WORKDIR}/Class-ISA-${PV}"
-
-inherit cpan
-
-BBCLASSEXTEND = "native"
diff --git a/meta/recipes-lsb4/perl/libdumpvalue-perl_1.17.bb b/meta/recipes-lsb4/perl/libdumpvalue-perl_1.17.bb
deleted file mode 100644
index 9a7461463a8..00000000000
--- a/meta/recipes-lsb4/perl/libdumpvalue-perl_1.17.bb
+++ /dev/null
@@ -1,18 +0,0 @@
-SUMMARY = "Perl module for provides screen dump of Perl data"
-
-HOMEPAGE = "http://search.cpan.org/~flora/Dumpvalue/"
-SECTION = "libs"
-LICENSE = "Artistic-1.0 | GPL-1.0+"
-
-LIC_FILES_CHKSUM = "file://LICENSE;md5=f736bec5ada1fc5e39b2a8e7e06bbcbb"
-
-SRC_URI = "http://search.cpan.org/CPAN/authors/id/F/FL/FLORA/Dumpvalue-${PV}.tar.gz"
-
-SRC_URI[md5sum] = "6ede9f693d4a9c4555541cb1a1cc2006"
-SRC_URI[sha256sum] = "9ea74606b545f769a787ec2ae229549a2ad0a8e3cd4b14eff2ce3841836b3bdb"
-
-S = "${WORKDIR}/Dumpvalue-${PV}"
-
-inherit cpan
-
-BBCLASSEXTEND = "native"
diff --git a/meta/recipes-lsb4/perl/libenv-perl_1.04.bb b/meta/recipes-lsb4/perl/libenv-perl_1.04.bb
deleted file mode 100644
index dd8e1159ee5..00000000000
--- a/meta/recipes-lsb4/perl/libenv-perl_1.04.bb
+++ /dev/null
@@ -1,21 +0,0 @@
-SUMMARY = "Perl module that imports environment variables as scalars or arrays"
-DESCRIPTION = "Perl maintains environment variables in a special hash named %ENV. \
-For when this access method is inconvenient, the Perl module Env allows environment \
-variables to be treated as scalar or array variables."
-
-HOMEPAGE = "http://search.cpan.org/~flora/Env/"
-SECTION = "libs"
-LICENSE = "Artistic-1.0 | GPL-1.0+"
-
-LIC_FILES_CHKSUM = "file://LICENSE;md5=76c1cbf18db56b3340d91cb947943bd3"
-
-SRC_URI = "http://search.cpan.org/CPAN/authors/id/F/FL/FLORA/Env-${PV}.tar.gz"
-
-SRC_URI[md5sum] = "fdba5c0690e66972c96fee112cf5f25c"
-SRC_URI[sha256sum] = "d94a3d412df246afdc31a2199cbd8ae915167a3f4684f7b7014ce1200251ebb0"
-
-S = "${WORKDIR}/Env-${PV}"
-
-inherit cpan
-
-BBCLASSEXTEND = "native"
diff --git a/meta/recipes-lsb4/perl/libfile-checktree-perl_4.41.bb b/meta/recipes-lsb4/perl/libfile-checktree-perl_4.41.bb
deleted file mode 100644
index ce37c72ca87..00000000000
--- a/meta/recipes-lsb4/perl/libfile-checktree-perl_4.41.bb
+++ /dev/null
@@ -1,32 +0,0 @@
-SUMMARY = "Perl module that run many filetest checks on a tree"
-DESCRIPTION = "The validate() routine takes a single multiline string consisting \
-of directives, each containing a filename plus a file test to try on it. (The file \
-test may also be a "cd", causing subsequent relative filenames to be interpreted \
-relative to that directory.) After the file test you may put || die to make it a \
-fatal error if the file test fails. The default is || warn. The file test may \
-optionally have a "!' prepended to test for the opposite condition. If you do a \
-cd and then list some relative filenames, you may want to indent them slightly for \
-readability. If you supply your own die() or warn() message, you can use $file to \
-interpolate the filename. \
-\
-Filetests may be bunched: "-rwx" tests for all of -r, -w, and -x. Only the first failed \
-test of the bunch will produce a warning. \
-\
-The routine returns the number of warnings issued."
-
-HOMEPAGE = "http://search.cpan.org/~flora/File-CheckTree/"
-SECTION = "libs"
-LICENSE = "Artistic-1.0 | GPL-1.0+"
-
-LIC_FILES_CHKSUM = "file://LICENSE;md5=c6fcacc5df80e037060300a7f4b93bf9"
-
-SRC_URI = "http://search.cpan.org/CPAN/authors/id/F/FL/FLORA/File-CheckTree-${PV}.tar.gz"
-
-SRC_URI[md5sum] = "519c82aa7e5b7f752b4da14a6c8ad740"
-SRC_URI[sha256sum] = "fc99ab6bb5af4664832715974b5a19e328071dc9202ab72e5d5a594ebd46a729"
-
-S = "${WORKDIR}/File-CheckTree-${PV}"
-
-inherit cpan
-
-BBCLASSEXTEND = "native"
diff --git a/meta/recipes-lsb4/perl/libi18n-collate-perl_1.02.bb b/meta/recipes-lsb4/perl/libi18n-collate-perl_1.02.bb
deleted file mode 100644
index f1839e0cf97..00000000000
--- a/meta/recipes-lsb4/perl/libi18n-collate-perl_1.02.bb
+++ /dev/null
@@ -1,21 +0,0 @@
-SUMMARY = "Perl module that compare 8-bit scalar data according to the current locale"
-DESCRIPTION = "This module provides you with objects that will collate according to \
-your national character set, provided that the POSIX setlocale() function is supported \
-on your system."
-
-HOMEPAGE = "http://search.cpan.org/~flora/I18N-Collate/"
-SECTION = "libs"
-LICENSE = "Artistic-1.0 | GPL-1.0+"
-
-LIC_FILES_CHKSUM = "file://LICENSE;md5=ff6d629144a6ec1ea8c300f75760184f"
-
-SRC_URI = "http://search.cpan.org/CPAN/authors/id/F/FL/FLORA/I18N-Collate-${PV}.tar.gz"
-
-SRC_URI[md5sum] = "72ddb6d1c59cfdf31aa3b04799b86af0"
-SRC_URI[sha256sum] = "9174506bc903eda89690394e3f45558ab7e013114227896d8569d6164648fe37"
-
-S = "${WORKDIR}/I18N-Collate-${PV}"
-
-inherit cpan
-
-BBCLASSEXTEND = "native"
diff --git a/meta/recipes-lsb4/perl/libpod-plainer-perl_1.04.bb b/meta/recipes-lsb4/perl/libpod-plainer-perl_1.04.bb
deleted file mode 100644
index a3e58f031ec..00000000000
--- a/meta/recipes-lsb4/perl/libpod-plainer-perl_1.04.bb
+++ /dev/null
@@ -1,23 +0,0 @@
-SUMMARY = "Perl extension for converting Pod to old-style Pod"
-DESCRIPTION = "Pod::Plainer uses Pod::Parser which takes Pod with the (new) 'C<< .. >>' \
-constructs and returns the old(er) style with just 'C<>'; '<' and '>' are replaced by \
-'E<lt>' and 'E<gt>'. \
-\
-This can be used to pre-process Pod before using tools which do not recognise the new style Pods."
-
-HOMEPAGE = "http://search.cpan.org/dist/Pod-Plainer/"
-SECTION = "libs"
-LICENSE = "Artistic-1.0 | GPL-1.0+"
-
-LIC_FILES_CHKSUM = "file://README;beginline=27;md5=227cf83970fc61264845825d9d2bf6f8"
-
-SRC_URI = "http://search.cpan.org/CPAN/authors/id/R/RM/RMBARKER/Pod-Plainer-${PV}.tar.gz"
-
-SRC_URI[md5sum] = "f502eacd1a40894b9dfea55fc2cd5e7d"
-SRC_URI[sha256sum] = "1bbfbf7d1d4871e5a83bab2137e22d089078206815190eb1d5c1260a3499456f"
-
-S = "${WORKDIR}/Pod-Plainer-${PV}"
-
-inherit cpan
-
-BBCLASSEXTEND = "native"
-- 
2.11.0


