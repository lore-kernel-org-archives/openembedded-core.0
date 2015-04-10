Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5824573D1B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Apr 2015 08:31:31 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.9) with ESMTP id t3A8VWUv016195
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Apr 2015 01:31:33 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 10 Apr 2015 01:31:32 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 10 Apr 2015 01:31:27 -0700
Message-ID: <46d77cd7d53234eb58f4756d4e0d8e0e87e742f0.1428654657.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1428654657.git.liezhi.yang@windriver.com>
References: <cover.1428654657.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/3] groff: 1.22.2 -> 1.22.3
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
X-List-Received-Date: Fri, 10 Apr 2015 08:31:32 -0000
Content-Type: text/plain

* Updated groff-1.22.2-correct-man.local-install-path.patch

* Add perl to RDEPENDS_groff since there are a few perl scripts:
  groff/usr/bin/roff2pdf:#! /usr/bin/env perl
  groff/usr/bin/afmtodit:#! /usr/bin/env perl -w
  groff/usr/bin/roff2dvi:#! /usr/bin/env perl
  groff/usr/bin/roff2text:#! /usr/bin/env perl
  groff/usr/bin/glilypond:#! /usr/bin/env perl
  groff/usr/bin/roff2ps:#! /usr/bin/env perl
  groff/usr/bin/gperl:#! /usr/bin/env perl
  groff/usr/bin/mmroff:#! /usr/bin/env perl
  groff/usr/bin/gpinyin:#! /usr/bin/env perl
  groff/usr/bin/roff2html:#! /usr/bin/env perl
  groff/usr/bin/grog:#! /usr/bin/env perl
  groff/usr/bin/gropdf:#! /usr/bin/env perl -w
  groff/usr/bin/pdfmom:#! /usr/bin/env perl -w
  groff/usr/bin/chem:#! /usr/bin/env perl
  groff/usr/bin/roff2x:#! /usr/bin/env perl
  groff/usr/bin/groffer:#! /usr/bin/env perl
  groff/usr/lib64/groff/gpinyin/subs.pl:#! /usr/bin/env perl
  groff/usr/lib64/groff/grog/subs.pl:#! /usr/bin/env perl
  groff/usr/lib64/groff/groffer/subs.pl:#! /usr/bin/env perl
  groff/usr/lib64/groff/groffer/man.pl:#! /usr/bin/env perl
  groff/usr/lib64/groff/groffer/main_subs.pl:#! /usr/bin/env perl

* Fix the dangling /usr/bin/perl or /bin/perl for grog.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 ...off-1.22.2-correct-man.local-install-path.patch |   36 +++++++++++---------
 .../groff/{groff_1.22.2.bb => groff_1.22.3.bb}     |    9 ++---
 2 files changed, 24 insertions(+), 21 deletions(-)
 rename meta/recipes-extended/groff/{groff-1.22.2 => groff-1.22.3}/groff-1.22.2-correct-man.local-install-path.patch (40%)
 rename meta/recipes-extended/groff/{groff_1.22.2.bb => groff_1.22.3.bb} (89%)

diff --git a/meta/recipes-extended/groff/groff-1.22.2/groff-1.22.2-correct-man.local-install-path.patch b/meta/recipes-extended/groff/groff-1.22.3/groff-1.22.2-correct-man.local-install-path.patch
similarity index 40%
rename from meta/recipes-extended/groff/groff-1.22.2/groff-1.22.2-correct-man.local-install-path.patch
rename to meta/recipes-extended/groff/groff-1.22.3/groff-1.22.2-correct-man.local-install-path.patch
index f7e9a74..c73328a 100644
--- a/meta/recipes-extended/groff/groff-1.22.2/groff-1.22.2-correct-man.local-install-path.patch
+++ b/meta/recipes-extended/groff/groff-1.22.3/groff-1.22.2-correct-man.local-install-path.patch
@@ -4,29 +4,31 @@ Correct the install path of man.local to fix following error:
 Signed-off-by: Zhenhua Luo <zhenhua.luo@freescale.com>
 Upstream-Status: Pending
 
---- groff-1.22.2/tmac/Makefile.sub.orig	2013-02-07 20:06:08.000000000 +0800
-+++ groff-1.22.2/tmac/Makefile.sub	2013-06-26 19:11:23.572259001 +0800
-@@ -114,9 +114,9 @@
- 	  rm -f $(DESTDIR)$(mdocdir)/$$f; \
+diff --git a/tmac/Makefile.sub b/tmac/Makefile.sub
+index 1506232..f1468c5 100644
+--- a/tmac/Makefile.sub
++++ b/tmac/Makefile.sub
+@@ -121,9 +121,9 @@ install_data: $(NORMALFILES) $(SPECIALFILES) man.local \
+ 	  $(RM) $(DESTDIR)$(mdocdir)/$$f; \
  	  $(INSTALL_DATA) $$f-s $(DESTDIR)$(mdocdir)/$$f; \
  	done
--	-test -f $(DESTDIR)$(localtmacdir)/man.local || \
-+	-test -f $(DESTDIR)$(tmacdir)/man.local || \
- 	  $(INSTALL_DATA) $(srcdir)/man.local \
--	    $(DESTDIR)$(localtmacdir)/man.local
-+	    $(DESTDIR)$(tmacdir)/man.local
- 	-test -f $(DESTDIR)$(localtmacdir)/mdoc.local || \
- 	  $(INSTALL_DATA) mdoc.local-s $(DESTDIR)$(localtmacdir)/mdoc.local
+-	-test -f $(DESTDIR)$(localtmacdir)/man.local \
++	-test -f $(DESTDIR)$(tmacdir)/man.local \
+ 	  || $(INSTALL_DATA) $(srcdir)/man.local \
+-	       $(DESTDIR)$(localtmacdir)/man.local
++	       $(DESTDIR)$(tmacdir)/man.local
+ 	-test -f $(DESTDIR)$(localtmacdir)/mdoc.local \
+ 	  || $(INSTALL_DATA) mdoc.local-s $(DESTDIR)$(localtmacdir)/mdoc.local
  
-@@ -158,9 +158,9 @@
- 	-rm -f $(DESTDIR)$(tmacdir)/$(tmac_s_prefix)s.tmac
- 	-rm -f $(DESTDIR)$(tmacdir)/$(tmac_an_prefix)an.tmac
- 	-rm -f $(DESTDIR)$(tmacdir)/www.tmac
+@@ -164,9 +164,9 @@ uninstall_sub:
+ 	$(RM) $(DESTDIR)$(tmacdir)/$(tmac_s_prefix)s.tmac
+ 	$(RM) $(DESTDIR)$(tmacdir)/$(tmac_an_prefix)an.tmac
+ 	$(RM) $(DESTDIR)$(tmacdir)/www.tmac
 -	-if cmp -s $(DESTDIR)$(localtmacdir)/man.local \
 +	-if cmp -s $(DESTDIR)$(tmacdir)/man.local \
  	           $(srcdir)/man.local; then \
--	  rm -f $(DESTDIR)$(localtmacdir)/man.local; \
-+	  rm -f $(DESTDIR)$(tmacdir)/man.local; \
+-	  $(RM) $(DESTDIR)$(localtmacdir)/man.local; \
++	  $(RM) $(DESTDIR)$(tmacdir)/man.local; \
  	fi
  	-if cmp -s $(DESTDIR)$(localtmacdir)/mdoc.local \
  	           $(srcdir)/mdoc.local; then \
diff --git a/meta/recipes-extended/groff/groff_1.22.2.bb b/meta/recipes-extended/groff/groff_1.22.3.bb
similarity index 89%
rename from meta/recipes-extended/groff/groff_1.22.2.bb
rename to meta/recipes-extended/groff/groff_1.22.3.bb
index 6e84587..36b221a 100644
--- a/meta/recipes-extended/groff/groff_1.22.2.bb
+++ b/meta/recipes-extended/groff/groff_1.22.3.bb
@@ -4,7 +4,6 @@ formatting commands and produces formatted output."
 SECTION = "base"
 HOMEPAGE = "http://www.gnu.org/software/groff/"
 LICENSE = "GPLv3"
-PR = "r1"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
@@ -12,12 +11,14 @@ SRC_URI = "${GNU_MIRROR}/groff/groff-${PV}.tar.gz \
 	file://groff-1.22.2-correct-man.local-install-path.patch \
 "
 
-SRC_URI[md5sum] = "9f4cd592a5efc7e36481d8d8d8af6d16"
-SRC_URI[sha256sum] = "380864dac4772e0c0d7b1282d25d0c5fd7f63baf45c87c4657afed22a13d2076"
+SRC_URI[md5sum] = "cc825fa64bc7306a885f2fb2268d3ec5"
+SRC_URI[sha256sum] = "3a48a9d6c97750bfbd535feeb5be0111db6406ddb7bb79fc680809cda6d828a5"
 
 DEPENDS = "groff-native"
 DEPENDS_class-native = ""
 
+RDEPENDS_${PN} = "perl"
+
 inherit autotools texinfo
 
 EXTRA_OECONF = "--without-x"
@@ -47,7 +48,7 @@ do_configure_append() {
 do_install_append() {
 	# Some distros have both /bin/perl and /usr/bin/perl, but we set perl location
 	# for target as /usr/bin/perl, so fix it to /usr/bin/perl.
-	for i in afmtodit mmroff gropdf pdfmom; do
+	for i in afmtodit mmroff gropdf pdfmom grog; do
 		if [ -f ${D}${bindir}/$i ]; then
 			sed -i -e '1s,#!.*perl,#! ${USRBINPATH}/env perl,' ${D}${bindir}/$i
 		fi
-- 
1.7.9.5


