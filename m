Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C0B6C4332F
	for <webhook@archiver.kernel.org>; Fri, 18 Nov 2022 17:52:40 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web11.68.1668793960182848885
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Nov 2022 09:52:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ilXof8O/;
 spf=pass (domain: gmail.com, ip: 209.85.214.172, mailfrom: ticotimo@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id y10so4013607plp.3
        for <openembedded-core@lists.openembedded.org>; Fri, 18 Nov 2022 09:52:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vrFobkdI/lA5c/QDgZr78nL3CRUZqhPM6Z09CegKhjo=;
        b=ilXof8O/BbAXtmIi75Qp3/+nSx+3HojjrsNTzNy0IJa/2VuqPCeUQf2NXf06HpamiD
         x7EYXkUx6nLy5hOl2IgyZpGRNhurJCL0iu8hC/kKQiH+akveke5VBb1ptyCdbAil4umu
         b1IZ/XtPV5yrzEpkQ9uyz5aqOLrSJK+VkVRKyHUG0ZIomeaNgSN3heXIiVQmVMr7onn+
         SkqUH3RN4akAv6oWhjpkOkTaGoxE9UPCNBCeZHbDWOVIkvd0LJd2rzhlfep4XQXwBYKk
         isrz1CU4BOCEVvBNps5kSs33WqdwxsTkuvSxbT7SlvxJkIKTgmri/XejxojXj7JHb2Si
         xlpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vrFobkdI/lA5c/QDgZr78nL3CRUZqhPM6Z09CegKhjo=;
        b=0iiPFHXyDe8lb9iu2uug+RaSMlCdFKssuys9fn03Qkpdev/A3h0AuwGd2JHy9A44ud
         GFrcpVFMS2nNXANfkZ6Ep2oIK2a42J1GOR/3NfrOqv1Ha7hLVYYOsSXw05FJNKET15FD
         3NRWzVXPmCLlvR3Dp84t1XCnUiVX3V/BWoCeW8r9ml+pGO6GPpN5tgFZcqzA6TCBGUT3
         N9Q27l5WELFGiEk3eZZ6781EsalZObaoQ3kQkTEyUBxiyEOl9b5sOiEvY8XKxW1GraY9
         k8qmOv2m1ie22MTu/LPiFaAyP9DBzAv2uvDAIzUNMajyTdCPgFD11lGWNcYiXx+zxFgO
         4W/g==
X-Gm-Message-State: ANoB5pksZ6w1BL691C3Ct+hSIEw+CIBaPh1g1EltsM0pSSbHIVFSc3Wh
	JpKOwbxDD8/7E/AcxfaJmxtUkhAPP1xXdQ==
X-Google-Smtp-Source: AA0mqf5I3U6WzkE8txrZAui3w1Z4wbXQ2AvL3tHJykrgBA0HFuGeumqrSGdevKHpcGsvv0mNKWvozg==
X-Received: by 2002:a17:902:e04b:b0:186:94b8:5980 with SMTP id x11-20020a170902e04b00b0018694b85980mr562159plx.113.1668793958977;
        Fri, 18 Nov 2022 09:52:38 -0800 (PST)
Received: from nereus.hsd1.or.comcast.net ([2601:1c0:ca00:cea0:6693:e191:c3fe:39ff])
        by smtp.gmail.com with ESMTPSA id k28-20020aa79d1c000000b0056c702a370dsm3443173pfp.117.2022.11.18.09.52.38
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Nov 2022 09:52:38 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 5/5] liburi-perl: upgrade 5.08 -> 5.17
Date: Fri, 18 Nov 2022 09:52:07 -0800
Message-Id: <28ed7318cfe4c40768995e201360a87f2309f248.1668793524.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1668793524.git.tim.orling@konsulko.com>
References: <cover.1668793524.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Nov 2022 17:52:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173487

* Author changed back from ETHER to OALDERS
* Use CPAN_MIRROR for SRC_URI
* Update HOMEPAGE
* Update RPEPENDS for -ptest
* Patch to skip TODO test cases

For changes, see:
https://metacpan.org/release/OALDERS/URI-5.17/changes

License-Update: whitespace changes

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 .../0001-Skip-TODO-test-cases-that-fail.patch | 110 ++++++++++++++++++
 ...iburi-perl_5.08.bb => liburi-perl_5.17.bb} |  34 +++---
 2 files changed, 130 insertions(+), 14 deletions(-)
 create mode 100644 meta/recipes-devtools/perl/liburi-perl/0001-Skip-TODO-test-cases-that-fail.patch
 rename meta/recipes-devtools/perl/{liburi-perl_5.08.bb => liburi-perl_5.17.bb} (65%)

diff --git a/meta/recipes-devtools/perl/liburi-perl/0001-Skip-TODO-test-cases-that-fail.patch b/meta/recipes-devtools/perl/liburi-perl/0001-Skip-TODO-test-cases-that-fail.patch
new file mode 100644
index 00000000000..68ccd061202
--- /dev/null
+++ b/meta/recipes-devtools/perl/liburi-perl/0001-Skip-TODO-test-cases-that-fail.patch
@@ -0,0 +1,110 @@
+From 858daa5047b00e7d5aa795302a9fad5504c8f0b9 Mon Sep 17 00:00:00 2001
+From: Tim Orling <tim.orling@konsulko.com>
+Date: Thu, 17 Nov 2022 16:33:20 -0800
+Subject: [PATCH] Skip TODO test cases that fail
+
+TODO cases report as "not ok" with ptest-runner
+
+Upstream-Status: Inappropriate [ptest-runner specific]
+
+Signed-off-by: Tim Orling <tim.orling@konsulko.com>
+
+---
+ t/escape-char.t | 20 ++++++++++----------
+ t/iri.t         | 18 +++++++++---------
+ t/mailto.t      | 12 ++++++------
+ 3 files changed, 25 insertions(+), 25 deletions(-)
+
+diff --git a/t/escape-char.t b/t/escape-char.t
+index c6ce79c..5e62ad5 100644
+--- a/t/escape-char.t
++++ b/t/escape-char.t
+@@ -6,16 +6,16 @@ use warnings;
+ use Test::More;
+ use URI ();
+ 
+-TODO: {
+-    my $str = "http://foo/\xE9";
+-    utf8::upgrade($str);
+-    my $uri = URI->new($str);
+-
+-    local $TODO = 'URI::Escape::escape_char misunderstands utf8';
+-
+-    # http://foo/%C3%A9
+-    is("$uri", 'http://foo/%E9', 'correctly created a URI from a utf8-upgraded string');
+-}
++#TODO: {
++#    my $str = "http://foo/\xE9";
++#    utf8::upgrade($str);
++#    my $uri = URI->new($str);
++#
++#    local $TODO = 'URI::Escape::escape_char misunderstands utf8';
++#
++#    # http://foo/%C3%A9
++#    is("$uri", 'http://foo/%E9', 'correctly created a URI from a utf8-upgraded string');
++#}
+ 
+ {
+     my $str = "http://foo/\xE9";
+diff --git a/t/iri.t b/t/iri.t
+index 2eb64b2..9c663c9 100644
+--- a/t/iri.t
++++ b/t/iri.t
+@@ -6,7 +6,7 @@ use Test::More;
+ use Config qw( %Config );
+ 
+ if (defined $Config{useperlio}) {
+-    plan tests=>26;
++    plan tests=>24;
+ } else {
+     plan skip_all=>'this perl doesn\'t support PerlIO layers';
+ }
+@@ -60,17 +60,17 @@ is $u->as_iri, "http://➡.ws/";
+ # draft-duerst-iri-bis.txt examples (section 3.7.1):
+ is(URI->new("http://www.example.org/D%C3%BCrst")->as_iri, "http://www.example.org/D\xFCrst");
+ is(URI->new("http://www.example.org/D%FCrst")->as_iri, "http://www.example.org/D%FCrst");
+-TODO: {
+-    local $TODO = "some chars (like U+202E, RIGHT-TO-LEFT OVERRIDE) need to stay escaped";
+-is(URI->new("http://xn--99zt52a.example.org/%e2%80%ae")->as_iri, "http://\x{7D0D}\x{8C46}.example.org/%e2%80%ae");
+-}
++#TODO: {
++#    local $TODO = "some chars (like U+202E, RIGHT-TO-LEFT OVERRIDE) need to stay escaped";
++#is(URI->new("http://xn--99zt52a.example.org/%e2%80%ae")->as_iri, "http://\x{7D0D}\x{8C46}.example.org/%e2%80%ae");
++#}
+ 
+ # try some URLs that can't be IDNA encoded (fallback to encoded UTF8 bytes)
+ $u = URI->new("http://" . ("ü" x 128));
+ is $u, "http://" . ("%C3%BC" x 128);
+ is $u->host, ("\xC3\xBC" x 128);
+-TODO: {
+-    local $TODO = "should ihost decode UTF8 bytes?";
+-    is $u->ihost, ("ü" x 128);
+-}
++#TODO: {
++#    local $TODO = "should ihost decode UTF8 bytes?";
++#    is $u->ihost, ("ü" x 128);
++#}
+ is $u->as_iri, "http://" . ("ü" x 128);
+diff --git a/t/mailto.t b/t/mailto.t
+index 79e9a13..c68cfb2 100644
+--- a/t/mailto.t
++++ b/t/mailto.t
+@@ -48,12 +48,12 @@ $u = URI->new('mailto:user+detail@example.com');
+ is $u->to, 'user+detail@example.com', 'subaddress with `+` parsed correctly';
+ is $u, 'mailto:user+detail@example.com', '... and stringification works';
+ 
+-TODO: {
+-    local $TODO = "We can't handle quoted local parts without properly parsing the email addresses";
+-    $u = URI->new('mailto:"foo bar+baz"@example.com');
+-    is $u->to, '"foo bar+baz"@example.com', 'address with quoted local part containing spaces is parsed correctly';
+-    is $u, 'mailto:%22foo%20bar+baz%22@example.com', '... and stringification works';
+-}
++#TODO: {
++#    local $TODO = "We can't handle quoted local parts without properly parsing the email addresses";
++#    $u = URI->new('mailto:"foo bar+baz"@example.com');
++#    is $u->to, '"foo bar+baz"@example.com', 'address with quoted local part containing spaces is parsed correctly';
++#    is $u, 'mailto:%22foo%20bar+baz%22@example.com', '... and stringification works';
++#}
+ 
+ # RFC 5321 (4.1.3) - Address Literals
+ 
diff --git a/meta/recipes-devtools/perl/liburi-perl_5.08.bb b/meta/recipes-devtools/perl/liburi-perl_5.17.bb
similarity index 65%
rename from meta/recipes-devtools/perl/liburi-perl_5.08.bb
rename to meta/recipes-devtools/perl/liburi-perl_5.17.bb
index 5428c9ddf9f..5e15004dd0f 100644
--- a/meta/recipes-devtools/perl/liburi-perl_5.08.bb
+++ b/meta/recipes-devtools/perl/liburi-perl_5.17.bb
@@ -2,19 +2,17 @@ SUMMARY = "Perl module to manipulate and access URI strings"
 DESCRIPTION = "This package contains the URI.pm module with friends. \
 The module implements the URI class. URI objects can be used to access \
 and manipulate the various components that make up these strings."
-
-HOMEPAGE = "http://search.cpan.org/dist/URI/"
+HOMEPAGE = "https://metacpan.org/dist/URI"
 SECTION = "libs"
 LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
 
-LIC_FILES_CHKSUM = "file://LICENSE;md5=c453e94fae672800f83bc1bd7a38b53f"
-
-DEPENDS += "perl"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=d8ca5f628bf2cd180bc4fa044cb8ef41"
 
-SRC_URI = "http://www.cpan.org/authors/id/E/ET/ETHER/URI-${PV}.tar.gz"
+SRC_URI = "${CPAN_MIRROR}/authors/id/O/OA/OALDERS/URI-${PV}.tar.gz \
+           file://0001-Skip-TODO-test-cases-that-fail.patch \
+           "
 
-SRC_URI[md5sum] = "cdbbf8f8ccdec5c162c8505077a35c2c"
-SRC_URI[sha256sum] = "7e2c6fe3b1d5947da334fa558a96e748aaa619213b85bcdce5b5347d4d26c46e"
+SRC_URI[sha256sum] = "5f7e42b769cb27499113cfae4b786c37d49e7c7d32dbb469602cd808308568f8"
 
 S = "${WORKDIR}/URI-${PV}"
 
@@ -33,18 +31,26 @@ do_install:prepend() {
 	rm -rf ${B}/t/file.t
 }
 
-RDEPENDS:${PN} += "perl-module-integer perl-module-mime-base64"
+RDEPENDS:${PN} += "\
+    perl-module-integer \
+    perl-module-mime-base64 \
+"
+
 RDEPENDS:${PN}-ptest += " \
+    libtest-fatal-perl \
     libtest-needs-perl \
-    perl-module-test-more \
-    perl-module-test \
-    perl-module-utf8 \
-    perl-module-extutils-makemaker \
-    perl-module-net-domain \
+    libtest-warnings-perl \
     perl-module-encode \
+    perl-module-encode-encoding \
+    perl-module-extutils-makemaker \
     perl-module-extutils-mm-unix \
     perl-module-file-spec-functions \
+    perl-module-net-domain \
     perl-module-perlio \
+    perl-module-perlio-encoding \
+    perl-module-test \
+    perl-module-test-more \
+    perl-module-utf8 \
 "
 
 BBCLASSEXTEND = "native"
-- 
2.30.2


