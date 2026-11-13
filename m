Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1634.1794530004520394778
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Nov 2026 16:33:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=zWz3yA0M;
 spf=pass (domain: gmail.com, ip: 209.85.210.181, mailfrom: ticotimo@gmail.com)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-886e61fa30fso146887b3a.1
        for <openembedded-core@lists.openembedded.org>; Thu, 12 Nov 2026 16:33:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794530004; x=1795134804; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rE59nRDZUJfYeqn69Fzn3suz7rkRURhpTtX2yAXkvYw=;
        b=zWz3yA0MXVE2pnaPhp6D71EIWR4OoN9quGQIPSRkzn+0CDNdPr9OLquIEj6GUjNppl
         PwRIsxBehWV8rosPe2pGmjDQEXdC/yTmWAL3ApZ405dqZd0VVYFEbXQasuRQ3Ap7f+xB
         zfEP94M9lymBTu5oaQlhv674MNsTcmwlqV5pUbfwAgWkKQwAkzVBwT7FO5tjjjnEfNEA
         MFcimIaWULjFVnApej0cAeAAAl31Ss7TIhj2GkCMPmhvqnLvtz0xYalAR51I/JN7k/YW
         ecQd3mdyOReRUJPDGvXegW4aOdPVbdrSn12qwvWUtW9V6Vb00ZXgYw/mg6iJEtySsLwR
         kT8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794530004; x=1795134804;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rE59nRDZUJfYeqn69Fzn3suz7rkRURhpTtX2yAXkvYw=;
        b=v1IhgMG2CxPj2hyE9ei7EG2z0d8RgmN7D2mk3/LvGQQOJHzUI+NL+EKsPdx3R4vFYb
         hOkJcQrm6nBvRPrGQAtUGM15/VkRFNe7ytgDx4CKbxLvtFs3W8W8k+fgxkJceBzdxmH9
         px5FI/00GQMggYYEDnydTpEOkE/anZ1yAZqDxlQNpavk3uCHv/20EqiCJKliHfMGmleM
         ObReGakimIFaKU6RmjUIC5gdndZG+BQ76gvhOQb8DxxwYlKsmeZV1XCw82dbSQA0q9Cu
         OaY3JTa9JlH1ve+hxOuARoMnsWdTAYUIoP3hj2tfZxYaoZOSPkQEroi/hoFPinyxib0f
         5gPg==
X-Gm-Message-State: APuU4Z9Ap7X/ijP9vfJ+p3ZIiEQX1RIehhAlFmWs1fUfG/yTym/wR2yV
	jIzhszNDqNy5XKQhASOWLJK9Rw/kCrKZNYa2W3sX19mN5N2RTMfKngfe7+x85hez
X-Gm-Gg: AYBFou1+XjVCvMGDxdg+1K0CmMDzzHbJSppuO4QNTcMVPlOhtb/1mUub1KTe/USOdXQ
	9C4g3PJxoXr0+iKEfBeI4pm/82nK3E0hLo3fX+xVtGruvmiGkCZzpTxdqF1o7l17iQsX5b60Luc
	Kpewo6I0Vq77d4nfTmf5nXazS97v779exlga6Bz7gnRt5UGG14Z8Oa5xic80LZA+felSNfcqmw8
	UakW+4KdFxsiuG9dtufg6HcH/2e8zP2yHxumktIwLeNmjNEliu+YvrzG2afFtdLcdQDDIHvUeir
	H22NOQAtp/8OcHh/eqWoO9kPaalt0hUvfVgkJlzS0Rie+aA3GLMARs7lazKsooBA/+9xj0byFa/
	1ih/75JOo+i3fBqTAIM5PXHhAbGTqj7Cpz9RrRg+kCpOnsf7vXs3W56RcIsjnDFklWbnaeuq+Di
	+8oagJ1zuz3OB26RzBfNYHFs52Nha0FQoB+O7fwqbAC+HfrH7zRDYRuGxyB981x0TsCjFuW4OeC
	qqbzK/CbPOrgH8P1uGSRtPwIECzLgeL3tKDt/ZGSXWdTIJ0D6uMq+u6kXyvXheKptv6x0cS7XJo
	5EVRXKZaq8xc8LYuJufQq1wwEdeYTjTiXmlW7RrFzdKjZwCAsv/4qihc6hfUOgm9SYxXBl5Pkbu
	TeA==
X-Received: by 2002:a05:6a21:e0a2:b0:3cd:9f0b:f7a2 with SMTP id adf61e73a8af0-3f7a4dbee41mr761263637.11.1794530003734;
        Thu, 12 Nov 2026 16:33:23 -0800 (PST)
Return-Path: <ticotimo@gmail.com>
Received: from localhost.localdomain ([69.9.132.159])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cddc186fc81sm388932a12.8.2026.11.12.16.33.22
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 12 Nov 2026 16:33:22 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH 4/5] libxml-parser-perl: upgrade 2.47 -> 2.59
Date: Thu, 12 Nov 2026 16:33:01 -0800
Message-ID: <20261113003302.20809-5-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261113003302.20809-1-tim.orling@konsulko.com>
References: <20261113003302.20809-1-tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 13 Nov 2026 00:33:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250136
Content-Type: text/plain; charset="utf-8"

AUH missed this upgrade because www.cpan.org/modules/by-module/XML/
stops at 2.47; fetch from the maintainer's author directory instead.

2.48 moved the encoding maps to File::ShareDir, so add
libfile-sharedir-install-perl-native to DEPENDS and libfile-sharedir-perl
to RDEPENDS. It also includes the CVE-2006-10003 fix, so drop that
backport, and fixes CVE-2006-10002. The LICENSE file was corrected from
Artistic-2.0 to the Perl dual license (GH #150), so update LICENSE to
match.

Refresh the cross-compile Makefile.PL patch. Install inc/ for ptest,
since t/checklib_*.t inspect the bundled Devel::CheckLib.

Set CVE_PRODUCT to toddr:xml::parser, the CPE that NVD uses for
XML::Parser, so that its CVEs are matched; the recipe name matches
none. Add DESCRIPTION, from the module's documentation, and
BUGTRACKER, and point HOMEPAGE at metacpan instead of expat's site.

Changes: https://metacpan.org/dist/XML-Parser/changes

Tested by building target, native and nativesdk and intltool-native,
and running ptest on qemux86-64.

AI-Generated: Uses Claude Code (Claude Opus 5.5)
Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 ...ile.PL-make-check_lib-cross-friendly.patch |  4 +-
 .../libxml-parser-perl/CVE-2006-10003.patch   | 75 -------------------
 ...erl_2.47.bb => libxml-parser-perl_2.59.bb} | 43 ++++++++---
 3 files changed, 35 insertions(+), 87 deletions(-)
 delete mode 100644 meta/recipes-devtools/perl/libxml-parser-perl/CVE-2006-10003.patch
 rename meta/recipes-devtools/perl/{libxml-parser-perl_2.47.bb => libxml-parser-perl_2.59.bb} (43%)

diff --git a/meta/recipes-devtools/perl/libxml-parser-perl/0001-Makefile.PL-make-check_lib-cross-friendly.patch b/meta/recipes-devtools/perl/libxml-parser-perl/0001-Makefile.PL-make-check_lib-cross-friendly.patch
index 457fb77384..196596f8c6 100644
--- a/meta/recipes-devtools/perl/libxml-parser-perl/0001-Makefile.PL-make-check_lib-cross-friendly.patch
+++ b/meta/recipes-devtools/perl/libxml-parser-perl/0001-Makefile.PL-make-check_lib-cross-friendly.patch
@@ -14,10 +14,10 @@ Signed-off-by: Tim Orling <tim.orling@konsulko.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/Makefile.PL b/Makefile.PL
-index 505d1df..19f428b 100644
+index 1344fe9..748a7d1 100644
 --- a/Makefile.PL
 +++ b/Makefile.PL
-@@ -30,7 +30,7 @@ foreach (@ARGV) {
+@@ -85,7 +85,7 @@ if ( !$expat_libpath && !$expat_incpath ) {
  
  unless (
      check_lib(    # fill in what you prompted the user for here
diff --git a/meta/recipes-devtools/perl/libxml-parser-perl/CVE-2006-10003.patch b/meta/recipes-devtools/perl/libxml-parser-perl/CVE-2006-10003.patch
deleted file mode 100644
index 7953ed4548..0000000000
--- a/meta/recipes-devtools/perl/libxml-parser-perl/CVE-2006-10003.patch
+++ /dev/null
@@ -1,75 +0,0 @@
-From e494a2c3a76b752f6008486fbb36a59f833666c0 Mon Sep 17 00:00:00 2001
-From: Toddr Bot <toddbot@rinaldo.us>
-Date: Mon, 16 Mar 2026 22:16:11 +0000
-Subject: [PATCH] fix: off-by-one heap buffer overflow in st_serial_stack
- growth check
-
-When st_serial_stackptr == st_serial_stacksize - 1, the old check
-(stackptr >= stacksize) would not trigger reallocation. The subsequent
-++stackptr then writes at index stacksize, one element past the
-allocated buffer.
-
-Fix by checking stackptr + 1 >= stacksize so the buffer is grown
-before the pre-increment write.
-
-Add a deep nesting test (600 levels) to exercise this code path.
-
-Fixes #39
-
-Co-Authored-By: Claude Opus 4.6 <noreply@anthropic.com>
-
-CVE: CVE-2006-10003
-
-Upstream-Status: Backport [https://github.com/cpan-authors/XML-Parser/commit/3eb9cc95420fa0c3f76947c4708962546bf27cfd.patch]
-
-Signed-off-by: Bai, Haiqing <Haiqing.Bai@windriver.com>
----
- Expat/Expat.xs   |  2 +-
- t/deep_nesting.t | 22 ++++++++++++++++++++++
- 2 files changed, 23 insertions(+), 1 deletion(-)
- create mode 100644 t/deep_nesting.t
-
-diff --git a/Expat/Expat.xs b/Expat/Expat.xs
-index dbad380..f04a0cf 100644
---- a/Expat/Expat.xs
-+++ b/Expat/Expat.xs
-@@ -499,7 +499,7 @@ startElement(void *userData, const char *name, const char **atts)
-     }
-   }
- 
--  if (cbv->st_serial_stackptr >= cbv->st_serial_stacksize) {
-+  if (cbv->st_serial_stackptr + 1 >= cbv->st_serial_stacksize) {
-     unsigned int newsize = cbv->st_serial_stacksize + 512;
- 
-     Renew(cbv->st_serial_stack, newsize, unsigned int);
-diff --git a/t/deep_nesting.t b/t/deep_nesting.t
-new file mode 100644
-index 0000000..8237b5f
---- /dev/null
-+++ b/t/deep_nesting.t
-@@ -0,0 +1,22 @@
-+BEGIN { print "1..1\n"; }
-+
-+# Test for deeply nested elements to exercise st_serial_stack reallocation.
-+# This catches off-by-one errors in the stack growth check (GH #39).
-+
-+use XML::Parser;
-+
-+my $depth = 600;
-+
-+my $xml = '';
-+for my $i (1 .. $depth) {
-+    $xml .= "<e$i>";
-+}
-+for my $i (reverse 1 .. $depth) {
-+    $xml .= "</e$i>";
-+}
-+
-+my $p = XML::Parser->new;
-+eval { $p->parse($xml) };
-+
-+print "not " if $@;
-+print "ok 1\n";
--- 
-2.49.1
-
diff --git a/meta/recipes-devtools/perl/libxml-parser-perl_2.47.bb b/meta/recipes-devtools/perl/libxml-parser-perl_2.59.bb
similarity index 43%
rename from meta/recipes-devtools/perl/libxml-parser-perl_2.47.bb
rename to meta/recipes-devtools/perl/libxml-parser-perl_2.59.bb
index 68854c5b20..480276d1fd 100644
--- a/meta/recipes-devtools/perl/libxml-parser-perl_2.47.bb
+++ b/meta/recipes-devtools/perl/libxml-parser-perl_2.59.bb
@@ -1,17 +1,22 @@
 SUMMARY = "XML::Parser - A perl module for parsing XML documents"
-HOMEPAGE = "https://libexpat.github.io/"
+DESCRIPTION = "This module provides ways to parse XML documents. \
+               It is built on top of XML::Parser::Expat, which is \
+               a lower level interface to James Clark's expat \
+               library."
+HOMEPAGE = "https://metacpan.org/release/XML-Parser"
+BUGTRACKER = "https://github.com/cpan-authors/XML-Parser/issues"
 SECTION = "libs"
-LICENSE = "Artistic-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=4342f85bf14a1fdd6a751573f1e61c03"
+LICENSE = "Artistic-1.0 OR GPL-1.0-or-later"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=71d8bc02b6854eabd7589eb667758414"
 
-DEPENDS += "expat"
+CVE_PRODUCT = "toddr:xml::parser"
 
-SRC_URI = "http://www.cpan.org/modules/by-module/XML/XML-Parser-${PV}.tar.gz \
+DEPENDS += "expat libfile-sharedir-install-perl-native"
+
+SRC_URI = "${CPAN_MIRROR}/authors/id/T/TO/TODDR/XML-Parser-${PV}.tar.gz \
            file://0001-Makefile.PL-make-check_lib-cross-friendly.patch \
-           file://CVE-2006-10003.patch \
            "
-
-SRC_URI[sha256sum] = "ad4aae643ec784f489b956abe952432871a622d4e2b5c619e8855accbfc4d1d8"
+SRC_URI[sha256sum] = "a358fd7c49f5e27717a644a9102bd21dc7fc25a415983279c59b1580e2b62a58"
 
 S = "${UNPACKDIR}/XML-Parser-${PV}"
 
@@ -35,9 +40,27 @@ do_install_ptest() {
 	sed -i -e "s:/usr/local/bin/perl:/usr/bin/perl:g" ${B}/samples/canonical
 	cp -r ${B}/samples ${D}${PTEST_PATH}
 	chown -R root:root ${D}${PTEST_PATH}/samples
+	# t/checklib_*.t inspect the bundled Devel::CheckLib under ./inc
+	cp -r ${B}/inc ${D}${PTEST_PATH}
+	chown -R root:root ${D}${PTEST_PATH}/inc
 }
 
-RDEPENDS:${PN} += "perl-module-carp perl-module-file-spec"
-RDEPENDS:${PN}-ptest += "perl-module-filehandle perl-module-if perl-module-test perl-module-test-more"
+RDEPENDS:${PN} += "\
+    libfile-sharedir-perl \
+    perl-module-carp \
+    perl-module-file-spec \
+    perl-module-scalar-util \
+    perl-module-warnings \
+"
+RDEPENDS:${PN}-ptest += "\
+    perl-module-config \
+    perl-module-file-temp \
+    perl-module-filehandle \
+    perl-module-if \
+    perl-module-lib \
+    perl-module-test-more \
+    perl-module-text-parsewords \
+    perl-module-vars \
+"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.56.0

