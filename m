Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F1EEEFCBDA
	for <webhook@archiver.kernel.org>; Sun, 15 Mar 2026 13:41:58 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.28970.1773582115481695032
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Mar 2026 06:41:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=0xQlnSNi;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=uevTqHKD;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101019cf1bb67a9-6e75955d-e914-41ab-9118-b3e1602f6b67-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1773582116;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=0XSrrEEi6Ey0vb57xJr09nPHD8bDQXGXgk0x0zll6QA=;
	b=0xQlnSNiBfla4/ZuoCPPNODkrht9J0946Qyn37yxTEuBSYsi0yQA6gRVdKkX2uPB
	KAsaLnK2fV5Ui5UA+BG3aL8isfd7U3A7Vk+biVUGCNcWHxH7Zr1mrYv8b4DGUSe5hQs
	gfZp6WYhQWxHboKMhSM3ZFRnhQ2onl1uBOKDSbVg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1773582116;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=0XSrrEEi6Ey0vb57xJr09nPHD8bDQXGXgk0x0zll6QA=;
	b=uevTqHKDR61a4VggepVylCTFRSpIabAIS358MTCAjZdCJ04Bx4Q4m4/k8Deqvpz3
	HtBHB9tRZdBdVVtXGfSQI3pbKbaFE0KgalCmqnJHntJlRMQ6weXHR13RKx1ZOOcKZgp
	a/DgEsCyAJH0PcfVBkvz0CHqZE8BCIeMlztsxxJ8=
Content-Type: multipart/mixed; boundary="===============4367363576179474343=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] perl: upgrading to 5.42.1 FAILED
Message-ID: <0101019cf1bb67a9-6e75955d-e914-41ab-9118-b3e1602f6b67-000000@us-west-2.amazonses.com>
Date: Sun, 15 Mar 2026 13:41:56 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.03.15-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Mar 2026 13:41:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233140

--===============4367363576179474343==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *perl* to *5.42.1* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-perl-upgrade-5.42.0-5.42.1.patch
    - check the changes to upstream patches and summarize them in the commit message,
    - compile an image that contains the package
    - perform some basic sanity tests
    - amend the patch and sign it off: git commit -s --reset-author --amend
    - send it to the appropriate mailing list

Alternatively, if you believe the recipe should not be upgraded at this time,
you can fill RECIPE_NO_UPDATE_REASON in respective recipe file so that
automatic upgrades would no longer be attempted.

Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper

-- >8 --
From de07db8d6644f8d1fa4ffe7c48a3e491c4126430 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 15 Mar 2026 07:37:10 +0000
Subject: [PATCH] perl: upgrade 5.42.0 -> 5.42.1

---
 ...his-module-breaks-through-the-perl-wrapper-.patch |  8 ++++----
 ...Syslog-Makefile.PL-Fix-_PATH_LOG-for-determ.patch |  2 +-
 .../perl/files/0002-Constant-Fix-up-shebang.patch    |  2 +-
 meta/recipes-devtools/perl/files/determinism.patch   |  2 +-
 meta/recipes-devtools/perl/files/encodefix.patch     |  2 +-
 meta/recipes-devtools/perl/files/errno_ver.diff      |  2 +-
 .../recipes-devtools/perl/files/native-perlinc.patch |  6 +++---
 .../perl/files/perl-configpm-switch.patch            |  4 ++--
 .../recipes-devtools/perl/files/perl-dynloader.patch |  2 +-
 meta/recipes-devtools/perl/perl-ptest.inc            | 12 +++++++++++-
 .../perl/{perl_5.42.0.bb => perl_5.42.1.bb}          |  2 +-
 11 files changed, 27 insertions(+), 17 deletions(-)
 rename meta/recipes-devtools/perl/{perl_5.42.0.bb => perl_5.42.1.bb} (99%)

diff --git a/meta/recipes-devtools/perl/files/0001-Somehow-this-module-breaks-through-the-perl-wrapper-.patch b/meta/recipes-devtools/perl/files/0001-Somehow-this-module-breaks-through-the-perl-wrapper-.patch
index 2076c61ee0..5980f5f02f 100644
--- a/meta/recipes-devtools/perl/files/0001-Somehow-this-module-breaks-through-the-perl-wrapper-.patch
+++ b/meta/recipes-devtools/perl/files/0001-Somehow-this-module-breaks-through-the-perl-wrapper-.patch
@@ -1,4 +1,4 @@
-From 47cd22cd213d2c5f28e674b12c264dc731682560 Mon Sep 17 00:00:00 2001
+From 1421d1836f6e728fb872d44aa04bc19a11c22f1b Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Tue, 5 Jun 2018 14:58:42 +0300
 Subject: [PATCH] Somehow this module breaks through the perl wrapper and
@@ -11,10 +11,10 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 4 insertions(+)
 
 diff --git a/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm b/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm
-index fe38598..0828f52 100644
+index 570fe52..46fad15 100644
 --- a/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm
 +++ b/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm
-@@ -1161,6 +1161,9 @@ WARNING
+@@ -1188,6 +1188,9 @@ WARNING
      }
  
      foreach my $name (@$names){
@@ -24,7 +24,7 @@ index fe38598..0828f52 100644
          my ($abs, $use_dir);
          if ($self->file_name_is_absolute($name)) {     # /foo/bar
              $abs = $name;
-@@ -2097,6 +2100,7 @@ sub init_PERL {
+@@ -2120,6 +2123,7 @@ sub init_PERL {
  
      $self->{PERL} ||=
          $self->find_perl(5.0, \@perls, \@defpath, $Verbose );
diff --git a/meta/recipes-devtools/perl/files/0001-cpan-Sys-Syslog-Makefile.PL-Fix-_PATH_LOG-for-determ.patch b/meta/recipes-devtools/perl/files/0001-cpan-Sys-Syslog-Makefile.PL-Fix-_PATH_LOG-for-determ.patch
index 7e5d08d8db..938e6db7f1 100644
--- a/meta/recipes-devtools/perl/files/0001-cpan-Sys-Syslog-Makefile.PL-Fix-_PATH_LOG-for-determ.patch
+++ b/meta/recipes-devtools/perl/files/0001-cpan-Sys-Syslog-Makefile.PL-Fix-_PATH_LOG-for-determ.patch
@@ -1,4 +1,4 @@
-From 322972384e0795be339252f7cf9a318dc759b51e Mon Sep 17 00:00:00 2001
+From e1c0fcfe47072988683290d87e6106ddce412b86 Mon Sep 17 00:00:00 2001
 From: Robert Yang <liezhi.yang@windriver.com>
 Date: Fri, 18 Feb 2022 09:44:26 +0000
 Subject: [PATCH] cpan/Sys-Syslog/Makefile.PL: Fix _PATH_LOG for deterministic
diff --git a/meta/recipes-devtools/perl/files/0002-Constant-Fix-up-shebang.patch b/meta/recipes-devtools/perl/files/0002-Constant-Fix-up-shebang.patch
index 80986e66da..a7df23fb0b 100644
--- a/meta/recipes-devtools/perl/files/0002-Constant-Fix-up-shebang.patch
+++ b/meta/recipes-devtools/perl/files/0002-Constant-Fix-up-shebang.patch
@@ -1,4 +1,4 @@
-From a02355bdc8cde1115daf101675cdfb707d337bf1 Mon Sep 17 00:00:00 2001
+From c1f8aab9b4a8a3fd946f774b6e4da67ada3ddde9 Mon Sep 17 00:00:00 2001
 From: Joshua Watt <JPEWhacker@gmail.com>
 Date: Mon, 17 Jun 2019 10:47:23 -0500
 Subject: [PATCH] Constant: Fix up shebang
diff --git a/meta/recipes-devtools/perl/files/determinism.patch b/meta/recipes-devtools/perl/files/determinism.patch
index bdb9a928bb..6dd281effc 100644
--- a/meta/recipes-devtools/perl/files/determinism.patch
+++ b/meta/recipes-devtools/perl/files/determinism.patch
@@ -1,4 +1,4 @@
-From 5c4fd57daf125357262aa796057d7be8e78d378e Mon Sep 17 00:00:00 2001
+From eaef9860cc0134d369b7ab366dd8cb3515456ee8 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Wed, 5 Feb 2020 23:54:02 +0000
 Subject: [PATCH] Fixes to make the perl build reproducible:
diff --git a/meta/recipes-devtools/perl/files/encodefix.patch b/meta/recipes-devtools/perl/files/encodefix.patch
index 665699d12d..a4c2f9f1b3 100644
--- a/meta/recipes-devtools/perl/files/encodefix.patch
+++ b/meta/recipes-devtools/perl/files/encodefix.patch
@@ -1,4 +1,4 @@
-From a4e22c7f2a519f24bc8aa89c6677017c0fe13679 Mon Sep 17 00:00:00 2001
+From e79e902fed782dab865f7c5d2226d529cf20ce55 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Tue, 18 Feb 2020 17:27:26 +0000
 Subject: [PATCH] perl: Fix encode module reproducibility issues
diff --git a/meta/recipes-devtools/perl/files/errno_ver.diff b/meta/recipes-devtools/perl/files/errno_ver.diff
index 477642f457..781c9cb061 100644
--- a/meta/recipes-devtools/perl/files/errno_ver.diff
+++ b/meta/recipes-devtools/perl/files/errno_ver.diff
@@ -1,4 +1,4 @@
-From 9c404d4b1c3607e827fb56b5ae4f8fbbdb52cd0b Mon Sep 17 00:00:00 2001
+From 16abe79cfb69de102da9a1fd62a38c01e18ae0f7 Mon Sep 17 00:00:00 2001
 From: Brendan O'Dea <bod@debian.org>
 Date: Fri, 16 Dec 2005 01:32:14 +1100
 Subject: [PATCH] Remove Errno version check due to upgrade problems with
diff --git a/meta/recipes-devtools/perl/files/native-perlinc.patch b/meta/recipes-devtools/perl/files/native-perlinc.patch
index 7e3e5f6652..8413dc4d18 100644
--- a/meta/recipes-devtools/perl/files/native-perlinc.patch
+++ b/meta/recipes-devtools/perl/files/native-perlinc.patch
@@ -1,4 +1,4 @@
-From 9fec62b19a49d1451fd1120c5dc38baf59f73856 Mon Sep 17 00:00:00 2001
+From 1a7b01eb2ca681623a20eab28c73a4b4ca003c1a Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Wed, 30 May 2007 09:33:32 +0000
 Subject: [PATCH] perl: sync with OE
@@ -10,10 +10,10 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 13 insertions(+)
 
 diff --git a/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm b/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm
-index 0828f52..b8abff4 100644
+index 46fad15..e543178 100644
 --- a/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm
 +++ b/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm
-@@ -1862,6 +1862,19 @@ from the perl source tree.
+@@ -1892,6 +1892,19 @@ from the perl source tree.
  	$self->{PERL_LIB}     ||= $Config{privlibexp};
  	$self->{PERL_ARCHLIB} ||= $Config{archlibexp};
  	$self->{PERL_INC}     = $self->catdir("$self->{PERL_ARCHLIB}","CORE"); # wild guess for now
diff --git a/meta/recipes-devtools/perl/files/perl-configpm-switch.patch b/meta/recipes-devtools/perl/files/perl-configpm-switch.patch
index 3721277933..332caf6b4f 100644
--- a/meta/recipes-devtools/perl/files/perl-configpm-switch.patch
+++ b/meta/recipes-devtools/perl/files/perl-configpm-switch.patch
@@ -1,4 +1,4 @@
-From 7a48538a7e8614a3342151b646d2105c0cb0cdd9 Mon Sep 17 00:00:00 2001
+From bbfe49f72ed9577b0eff1c289c5487928eed9c6f Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Sun, 27 May 2007 21:04:11 +0000
 Subject: [PATCH] perl: 5.8.7 -> 5.8.8 (from OE)
@@ -19,7 +19,7 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 16 insertions(+), 2 deletions(-)
 
 diff --git a/configpm b/configpm
-index 07219d8..01a23fa 100755
+index 0c46b9e..1daebef 100755
 --- a/configpm
 +++ b/configpm
 @@ -718,7 +718,7 @@ $config_txt .= uncomment <<'ENDOFEND';
diff --git a/meta/recipes-devtools/perl/files/perl-dynloader.patch b/meta/recipes-devtools/perl/files/perl-dynloader.patch
index 5472602d3a..03cb3b3e46 100644
--- a/meta/recipes-devtools/perl/files/perl-dynloader.patch
+++ b/meta/recipes-devtools/perl/files/perl-dynloader.patch
@@ -1,4 +1,4 @@
-From 25a26c52c320e699b37a7ad1f4f045bc8aa4cb00 Mon Sep 17 00:00:00 2001
+From 945d6d889292545e27409eea955bc2c40b497e31 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard@openedhand.com>
 Date: Sun, 27 May 2007 21:04:11 +0000
 Subject: [PATCH] perl: 5.8.7 -> 5.8.8 (from OE)
diff --git a/meta/recipes-devtools/perl/perl-ptest.inc b/meta/recipes-devtools/perl/perl-ptest.inc
index 4b4756118c..0830ff5b2a 100644
--- a/meta/recipes-devtools/perl/perl-ptest.inc
+++ b/meta/recipes-devtools/perl/perl-ptest.inc
@@ -1,6 +1,16 @@
 inherit ptest
 
-SRC_URI += "file://run-ptest \
+SRC_URI = "https://www.cpan.org/src/5.0/perl-${PV}.tar.gz;name=perl \
+           file://perl-rdepends.txt \
+           file://0001-Somehow-this-module-breaks-through-the-perl-wrapper-.patch \
+           file://errno_ver.diff \
+           file://native-perlinc.patch \
+           file://perl-dynloader.patch \
+           file://0002-Constant-Fix-up-shebang.patch \
+           file://determinism.patch \
+           file://0001-cpan-Sys-Syslog-Makefile.PL-Fix-_PATH_LOG-for-determ.patch \
+           file://run-ptest \
+           file://perl-configpm-switch.patch \
            "
 
 DEBUG_PREFIX_MAP_REGEX = "${@'\\|'.join(d.getVar('DEBUG_PREFIX_MAP').split())}"
diff --git a/meta/recipes-devtools/perl/perl_5.42.0.bb b/meta/recipes-devtools/perl/perl_5.42.1.bb
similarity index 99%
rename from meta/recipes-devtools/perl/perl_5.42.0.bb
rename to meta/recipes-devtools/perl/perl_5.42.1.bb
index a154bbc0a9..6a35e23809 100644
--- a/meta/recipes-devtools/perl/perl_5.42.0.bb
+++ b/meta/recipes-devtools/perl/perl_5.42.1.bb
@@ -24,7 +24,7 @@ SRC_URI:append:class-target = " \
            file://encodefix.patch \
 "
 
-SRC_URI[perl.sha256sum] = "e093ef184d7f9a1b9797e2465296f55510adb6dab8842b0c3ed53329663096dc"
+SRC_URI[perl.sha256sum] = "6f84e6dc8cce97181d1c6aeeb552c13775c91ded3c6c73743c9211af87b16bf8"
 
 B = "${WORKDIR}/perl-${PV}-build"
 
-- 
2.47.1


--===============4367363576179474343==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-perl-upgrade-5.42.0-5.42.1.patch"

RnJvbSBkZTA3ZGI4ZDY2NDRmOGQxZmE0ZmZlN2M0OGEzZTQ5MWM0MTI2NDMwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMTUgTWFyIDIwMjYgMDc6Mzc6MTAgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
ZXJsOiB1cGdyYWRlIDUuNDIuMCAtPiA1LjQyLjEKCi0tLQogLi4uaGlzLW1vZHVsZS1icmVha3Mt
dGhyb3VnaC10aGUtcGVybC13cmFwcGVyLS5wYXRjaCB8ICA4ICsrKystLS0tCiAuLi5TeXNsb2ct
TWFrZWZpbGUuUEwtRml4LV9QQVRIX0xPRy1mb3ItZGV0ZXJtLnBhdGNoIHwgIDIgKy0KIC4uLi9w
ZXJsL2ZpbGVzLzAwMDItQ29uc3RhbnQtRml4LXVwLXNoZWJhbmcucGF0Y2ggICAgfCAgMiArLQog
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3BlcmwvZmlsZXMvZGV0ZXJtaW5pc20ucGF0Y2ggICB8ICAy
ICstCiBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcGVybC9maWxlcy9lbmNvZGVmaXgucGF0Y2ggICAg
IHwgIDIgKy0KIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9wZXJsL2ZpbGVzL2Vycm5vX3Zlci5kaWZm
ICAgICAgfCAgMiArLQogLi4uL3JlY2lwZXMtZGV2dG9vbHMvcGVybC9maWxlcy9uYXRpdmUtcGVy
bGluYy5wYXRjaCB8ICA2ICsrKy0tLQogLi4uL3BlcmwvZmlsZXMvcGVybC1jb25maWdwbS1zd2l0
Y2gucGF0Y2ggICAgICAgICAgICB8ICA0ICsrLS0KIC4uLi9yZWNpcGVzLWRldnRvb2xzL3Blcmwv
ZmlsZXMvcGVybC1keW5sb2FkZXIucGF0Y2ggfCAgMiArLQogbWV0YS9yZWNpcGVzLWRldnRvb2xz
L3BlcmwvcGVybC1wdGVzdC5pbmMgICAgICAgICAgICB8IDEyICsrKysrKysrKysrLQogLi4uL3Bl
cmwve3BlcmxfNS40Mi4wLmJiID0+IHBlcmxfNS40Mi4xLmJifSAgICAgICAgICB8ICAyICstCiAx
MSBmaWxlcyBjaGFuZ2VkLCAyNyBpbnNlcnRpb25zKCspLCAxNyBkZWxldGlvbnMoLSkKIHJlbmFt
ZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcGVybC97cGVybF81LjQyLjAuYmIgPT4gcGVybF81LjQy
LjEuYmJ9ICg5OSUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3BlcmwvZmls
ZXMvMDAwMS1Tb21laG93LXRoaXMtbW9kdWxlLWJyZWFrcy10aHJvdWdoLXRoZS1wZXJsLXdyYXBw
ZXItLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3BlcmwvZmlsZXMvMDAwMS1Tb21laG93
LXRoaXMtbW9kdWxlLWJyZWFrcy10aHJvdWdoLXRoZS1wZXJsLXdyYXBwZXItLnBhdGNoCmluZGV4
IDIwNzZjNjFlZTAuLjU5ODBmNWYwMmYgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29s
cy9wZXJsL2ZpbGVzLzAwMDEtU29tZWhvdy10aGlzLW1vZHVsZS1icmVha3MtdGhyb3VnaC10aGUt
cGVybC13cmFwcGVyLS5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcGVybC9maWxl
cy8wMDAxLVNvbWVob3ctdGhpcy1tb2R1bGUtYnJlYWtzLXRocm91Z2gtdGhlLXBlcmwtd3JhcHBl
ci0ucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDQ3Y2QyMmNkMjEzZDJjNWYyOGU2NzRiMTJj
MjY0ZGM3MzE2ODI1NjAgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDE0MjFkMTgzNmY2
ZTcyOGZiODcyZDQ0YWEwNGJjMTlhMTFjMjJmMWIgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBG
cm9tOiBBbGV4YW5kZXIgS2FuYXZpbiA8YWxleC5rYW5hdmluQGdtYWlsLmNvbT4KIERhdGU6IFR1
ZSwgNSBKdW4gMjAxOCAxNDo1ODo0MiArMDMwMAogU3ViamVjdDogW1BBVENIXSBTb21laG93IHRo
aXMgbW9kdWxlIGJyZWFrcyB0aHJvdWdoIHRoZSBwZXJsIHdyYXBwZXIgYW5kCkBAIC0xMSwxMCAr
MTEsMTAgQEAgU2lnbmVkLW9mZi1ieTogQWxleGFuZGVyIEthbmF2aW4gPGFsZXgua2FuYXZpbkBn
bWFpbC5jb20+CiAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKQogCiBkaWZmIC0tZ2l0
IGEvY3Bhbi9FeHRVdGlscy1NYWtlTWFrZXIvbGliL0V4dFV0aWxzL01NX1VuaXgucG0gYi9jcGFu
L0V4dFV0aWxzLU1ha2VNYWtlci9saWIvRXh0VXRpbHMvTU1fVW5peC5wbQotaW5kZXggZmUzODU5
OC4uMDgyOGY1MiAxMDA2NDQKK2luZGV4IDU3MGZlNTIuLjQ2ZmFkMTUgMTAwNjQ0CiAtLS0gYS9j
cGFuL0V4dFV0aWxzLU1ha2VNYWtlci9saWIvRXh0VXRpbHMvTU1fVW5peC5wbQogKysrIGIvY3Bh
bi9FeHRVdGlscy1NYWtlTWFrZXIvbGliL0V4dFV0aWxzL01NX1VuaXgucG0KLUBAIC0xMTYxLDYg
KzExNjEsOSBAQCBXQVJOSU5HCitAQCAtMTE4OCw2ICsxMTg4LDkgQEAgV0FSTklORwogICAgICB9
CiAgCiAgICAgIGZvcmVhY2ggbXkgJG5hbWUgKEAkbmFtZXMpewpAQCAtMjQsNyArMjQsNyBAQCBp
bmRleCBmZTM4NTk4Li4wODI4ZjUyIDEwMDY0NAogICAgICAgICAgbXkgKCRhYnMsICR1c2VfZGly
KTsKICAgICAgICAgIGlmICgkc2VsZi0+ZmlsZV9uYW1lX2lzX2Fic29sdXRlKCRuYW1lKSkgeyAg
ICAgIyAvZm9vL2JhcgogICAgICAgICAgICAgICRhYnMgPSAkbmFtZTsKLUBAIC0yMDk3LDYgKzIx
MDAsNyBAQCBzdWIgaW5pdF9QRVJMIHsKK0BAIC0yMTIwLDYgKzIxMjMsNyBAQCBzdWIgaW5pdF9Q
RVJMIHsKICAKICAgICAgJHNlbGYtPntQRVJMfSB8fD0KICAgICAgICAgICRzZWxmLT5maW5kX3Bl
cmwoNS4wLCBcQHBlcmxzLCBcQGRlZnBhdGgsICRWZXJib3NlICk7CmRpZmYgLS1naXQgYS9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcGVybC9maWxlcy8wMDAxLWNwYW4tU3lzLVN5c2xvZy1NYWtlZmls
ZS5QTC1GaXgtX1BBVEhfTE9HLWZvci1kZXRlcm0ucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcGVybC9maWxlcy8wMDAxLWNwYW4tU3lzLVN5c2xvZy1NYWtlZmlsZS5QTC1GaXgtX1BBVEhf
TE9HLWZvci1kZXRlcm0ucGF0Y2gKaW5kZXggN2U1ZDA4ZDhkYi4uOTM4ZTZkYjdmMSAxMDA2NDQK
LS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3BlcmwvZmlsZXMvMDAwMS1jcGFuLVN5cy1TeXNs
b2ctTWFrZWZpbGUuUEwtRml4LV9QQVRIX0xPRy1mb3ItZGV0ZXJtLnBhdGNoCisrKyBiL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9wZXJsL2ZpbGVzLzAwMDEtY3Bhbi1TeXMtU3lzbG9nLU1ha2VmaWxl
LlBMLUZpeC1fUEFUSF9MT0ctZm9yLWRldGVybS5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20g
MzIyOTcyMzg0ZTA3OTViZTMzOTI1MmY3Y2Y5YTMxOGRjNzU5YjUxZSBNb24gU2VwIDE3IDAwOjAw
OjAwIDIwMDEKK0Zyb20gZTFjMGZjZmU0NzA3Mjk4ODY4MzI5MGQ4N2U2MTA2ZGRjZTQxMmI4NiBN
b24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IFJvYmVydCBZYW5nIDxsaWV6aGkueWFuZ0B3
aW5kcml2ZXIuY29tPgogRGF0ZTogRnJpLCAxOCBGZWIgMjAyMiAwOTo0NDoyNiArMDAwMAogU3Vi
amVjdDogW1BBVENIXSBjcGFuL1N5cy1TeXNsb2cvTWFrZWZpbGUuUEw6IEZpeCBfUEFUSF9MT0cg
Zm9yIGRldGVybWluaXN0aWMKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9wZXJs
L2ZpbGVzLzAwMDItQ29uc3RhbnQtRml4LXVwLXNoZWJhbmcucGF0Y2ggYi9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcGVybC9maWxlcy8wMDAyLUNvbnN0YW50LUZpeC11cC1zaGViYW5nLnBhdGNoCmlu
ZGV4IDgwOTg2ZTY2ZGEuLmE3ZGYyM2ZiMGIgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0
b29scy9wZXJsL2ZpbGVzLzAwMDItQ29uc3RhbnQtRml4LXVwLXNoZWJhbmcucGF0Y2gKKysrIGIv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3BlcmwvZmlsZXMvMDAwMi1Db25zdGFudC1GaXgtdXAtc2hl
YmFuZy5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gYTAyMzU1YmRjOGNkZTExMTVkYWYxMDE2
NzVjZGZiNzA3ZDMzN2JmMSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gYzFmOGFhYjli
NGE4YTNmZDk0NmY3NzRiNmU0ZGE2N2FkYTNkZGRlOSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEK
IEZyb206IEpvc2h1YSBXYXR0IDxKUEVXaGFja2VyQGdtYWlsLmNvbT4KIERhdGU6IE1vbiwgMTcg
SnVuIDIwMTkgMTA6NDc6MjMgLTA1MDAKIFN1YmplY3Q6IFtQQVRDSF0gQ29uc3RhbnQ6IEZpeCB1
cCBzaGViYW5nCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcGVybC9maWxlcy9k
ZXRlcm1pbmlzbS5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9wZXJsL2ZpbGVzL2RldGVy
bWluaXNtLnBhdGNoCmluZGV4IGJkYjlhOTI4YmIuLjZkZDI4MWVmZmMgMTAwNjQ0Ci0tLSBhL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9wZXJsL2ZpbGVzL2RldGVybWluaXNtLnBhdGNoCisrKyBiL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9wZXJsL2ZpbGVzL2RldGVybWluaXNtLnBhdGNoCkBAIC0xLDQg
KzEsNCBAQAotRnJvbSA1YzRmZDU3ZGFmMTI1MzU3MjYyYWE3OTYwNTdkN2JlOGU3OGQzNzhlIE1v
biBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBlYWVmOTg2MGNjMDEzNGQzNjliN2FiMzY2ZGQ4
Y2IzNTE1NDU2ZWU4IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogUmljaGFyZCBQdXJk
aWUgPHJpY2hhcmQucHVyZGllQGxpbnV4Zm91bmRhdGlvbi5vcmc+CiBEYXRlOiBXZWQsIDUgRmVi
IDIwMjAgMjM6NTQ6MDIgKzAwMDAKIFN1YmplY3Q6IFtQQVRDSF0gRml4ZXMgdG8gbWFrZSB0aGUg
cGVybCBidWlsZCByZXByb2R1Y2libGU6CmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcGVybC9maWxlcy9lbmNvZGVmaXgucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcGVy
bC9maWxlcy9lbmNvZGVmaXgucGF0Y2gKaW5kZXggNjY1Njk5ZDEyZC4uYTRjMmY5ZjFiMyAxMDA2
NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3BlcmwvZmlsZXMvZW5jb2RlZml4LnBhdGNo
CisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9wZXJsL2ZpbGVzL2VuY29kZWZpeC5wYXRjaApA
QCAtMSw0ICsxLDQgQEAKLUZyb20gYTRlMjJjN2YyYTUxOWYyNGJjOGFhODljNjY3NzAxN2MwZmUx
MzY3OSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gZTc5ZTkwMmZlZDc4MmRhYjg2NWY3
YzVkMjIyNmQ1MjljZjIwY2U1NSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IFJpY2hh
cmQgUHVyZGllIDxyaWNoYXJkLnB1cmRpZUBsaW51eGZvdW5kYXRpb24ub3JnPgogRGF0ZTogVHVl
LCAxOCBGZWIgMjAyMCAxNzoyNzoyNiArMDAwMAogU3ViamVjdDogW1BBVENIXSBwZXJsOiBGaXgg
ZW5jb2RlIG1vZHVsZSByZXByb2R1Y2liaWxpdHkgaXNzdWVzCmRpZmYgLS1naXQgYS9tZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvcGVybC9maWxlcy9lcnJub192ZXIuZGlmZiBiL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9wZXJsL2ZpbGVzL2Vycm5vX3Zlci5kaWZmCmluZGV4IDQ3NzY0MmY0NTcuLjc4MWM5
Y2IwNjEgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9wZXJsL2ZpbGVzL2Vycm5v
X3Zlci5kaWZmCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9wZXJsL2ZpbGVzL2Vycm5vX3Zl
ci5kaWZmCkBAIC0xLDQgKzEsNCBAQAotRnJvbSA5YzQwNGQ0YjFjMzYwN2U4MjdmYjU2YjVhZTRm
OGZiYmRiNTJjZDBiIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSAxNmFiZTc5Y2ZiNjlk
ZTEwMmRhOWExZmQ2MmEzOGMwMWUxOGFlMGY3IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJv
bTogQnJlbmRhbiBPJ0RlYSA8Ym9kQGRlYmlhbi5vcmc+CiBEYXRlOiBGcmksIDE2IERlYyAyMDA1
IDAxOjMyOjE0ICsxMTAwCiBTdWJqZWN0OiBbUEFUQ0hdIFJlbW92ZSBFcnJubyB2ZXJzaW9uIGNo
ZWNrIGR1ZSB0byB1cGdyYWRlIHByb2JsZW1zIHdpdGgKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBl
cy1kZXZ0b29scy9wZXJsL2ZpbGVzL25hdGl2ZS1wZXJsaW5jLnBhdGNoIGIvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3BlcmwvZmlsZXMvbmF0aXZlLXBlcmxpbmMucGF0Y2gKaW5kZXggN2UzZTVmNjY1
Mi4uODQxM2RjNGQxOCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3BlcmwvZmls
ZXMvbmF0aXZlLXBlcmxpbmMucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3Blcmwv
ZmlsZXMvbmF0aXZlLXBlcmxpbmMucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDlmZWM2MmIx
OWE0OWQxNDUxZmQxMTIwYzVkYzM4YmFmNTlmNzM4NTYgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAx
CitGcm9tIDFhN2IwMWViMmNhNjgxNjIzYTIwZWFiMjhjNzNhNGI0Y2EwMDNjMWEgTW9uIFNlcCAx
NyAwMDowMDowMCAyMDAxCiBGcm9tOiBBbGV4YW5kZXIgS2FuYXZpbiA8YWxleC5rYW5hdmluQGdt
YWlsLmNvbT4KIERhdGU6IFdlZCwgMzAgTWF5IDIwMDcgMDk6MzM6MzIgKzAwMDAKIFN1YmplY3Q6
IFtQQVRDSF0gcGVybDogc3luYyB3aXRoIE9FCkBAIC0xMCwxMCArMTAsMTAgQEAgU2lnbmVkLW9m
Zi1ieTogQWxleGFuZGVyIEthbmF2aW4gPGFsZXgua2FuYXZpbkBnbWFpbC5jb20+CiAgMSBmaWxl
IGNoYW5nZWQsIDEzIGluc2VydGlvbnMoKykKIAogZGlmZiAtLWdpdCBhL2NwYW4vRXh0VXRpbHMt
TWFrZU1ha2VyL2xpYi9FeHRVdGlscy9NTV9Vbml4LnBtIGIvY3Bhbi9FeHRVdGlscy1NYWtlTWFr
ZXIvbGliL0V4dFV0aWxzL01NX1VuaXgucG0KLWluZGV4IDA4MjhmNTIuLmI4YWJmZjQgMTAwNjQ0
CitpbmRleCA0NmZhZDE1Li5lNTQzMTc4IDEwMDY0NAogLS0tIGEvY3Bhbi9FeHRVdGlscy1NYWtl
TWFrZXIvbGliL0V4dFV0aWxzL01NX1VuaXgucG0KICsrKyBiL2NwYW4vRXh0VXRpbHMtTWFrZU1h
a2VyL2xpYi9FeHRVdGlscy9NTV9Vbml4LnBtCi1AQCAtMTg2Miw2ICsxODYyLDE5IEBAIGZyb20g
dGhlIHBlcmwgc291cmNlIHRyZWUuCitAQCAtMTg5Miw2ICsxODkyLDE5IEBAIGZyb20gdGhlIHBl
cmwgc291cmNlIHRyZWUuCiAgCSRzZWxmLT57UEVSTF9MSUJ9ICAgICB8fD0gJENvbmZpZ3twcml2
bGliZXhwfTsKICAJJHNlbGYtPntQRVJMX0FSQ0hMSUJ9IHx8PSAkQ29uZmlne2FyY2hsaWJleHB9
OwogIAkkc2VsZi0+e1BFUkxfSU5DfSAgICAgPSAkc2VsZi0+Y2F0ZGlyKCIkc2VsZi0+e1BFUkxf
QVJDSExJQn0iLCJDT1JFIik7ICMgd2lsZCBndWVzcyBmb3Igbm93CmRpZmYgLS1naXQgYS9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcGVybC9maWxlcy9wZXJsLWNvbmZpZ3BtLXN3aXRjaC5wYXRjaCBi
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9wZXJsL2ZpbGVzL3BlcmwtY29uZmlncG0tc3dpdGNoLnBh
dGNoCmluZGV4IDM3MjEyNzc5MzMuLjMzMmNhZjZiNGYgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBl
cy1kZXZ0b29scy9wZXJsL2ZpbGVzL3BlcmwtY29uZmlncG0tc3dpdGNoLnBhdGNoCisrKyBiL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9wZXJsL2ZpbGVzL3BlcmwtY29uZmlncG0tc3dpdGNoLnBhdGNo
CkBAIC0xLDQgKzEsNCBAQAotRnJvbSA3YTQ4NTM4YTdlODYxNGEzMzQyMTUxYjY0NmQyMTA1YzBj
YjBjZGQ5IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBiYmZlNDlmNzJlZDk1NzdiMGVm
ZjFjMjg5YzU0ODc5MjhlZWQ5YzZmIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogQWxl
eGFuZGVyIEthbmF2aW4gPGFsZXgua2FuYXZpbkBnbWFpbC5jb20+CiBEYXRlOiBTdW4sIDI3IE1h
eSAyMDA3IDIxOjA0OjExICswMDAwCiBTdWJqZWN0OiBbUEFUQ0hdIHBlcmw6IDUuOC43IC0+IDUu
OC44IChmcm9tIE9FKQpAQCAtMTksNyArMTksNyBAQCBTaWduZWQtb2ZmLWJ5OiBBbGV4YW5kZXIg
S2FuYXZpbiA8YWxleC5rYW5hdmluQGdtYWlsLmNvbT4KICAxIGZpbGUgY2hhbmdlZCwgMTYgaW5z
ZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKIAogZGlmZiAtLWdpdCBhL2NvbmZpZ3BtIGIvY29u
ZmlncG0KLWluZGV4IDA3MjE5ZDguLjAxYTIzZmEgMTAwNzU1CitpbmRleCAwYzQ2YjllLi4xZGFl
YmVmIDEwMDc1NQogLS0tIGEvY29uZmlncG0KICsrKyBiL2NvbmZpZ3BtCiBAQCAtNzE4LDcgKzcx
OCw3IEBAICRjb25maWdfdHh0IC49IHVuY29tbWVudCA8PCdFTkRPRkVORCc7CmRpZmYgLS1naXQg
YS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcGVybC9maWxlcy9wZXJsLWR5bmxvYWRlci5wYXRjaCBi
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9wZXJsL2ZpbGVzL3BlcmwtZHlubG9hZGVyLnBhdGNoCmlu
ZGV4IDU0NzI2MDJkM2EuLjAzY2IzYjNlNDYgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0
b29scy9wZXJsL2ZpbGVzL3BlcmwtZHlubG9hZGVyLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9wZXJsL2ZpbGVzL3BlcmwtZHlubG9hZGVyLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAot
RnJvbSAyNWEyNmM1MmMzMjBlNjk5YjM3YTdhZDFmNGYwNDViYzhhYTRjYjAwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQorRnJvbSA5NDVkNmQ4ODkyOTI1NDVlMjc0MDllZWE5NTViYzJjNDBiNDk3
ZTMxIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogUmljaGFyZCBQdXJkaWUgPHJpY2hh
cmRAb3BlbmVkaGFuZC5jb20+CiBEYXRlOiBTdW4sIDI3IE1heSAyMDA3IDIxOjA0OjExICswMDAw
CiBTdWJqZWN0OiBbUEFUQ0hdIHBlcmw6IDUuOC43IC0+IDUuOC44IChmcm9tIE9FKQpkaWZmIC0t
Z2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3BlcmwvcGVybC1wdGVzdC5pbmMgYi9tZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvcGVybC9wZXJsLXB0ZXN0LmluYwppbmRleCA0YjQ3NTYxMThjLi4wODMw
ZmY1YjJhIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcGVybC9wZXJsLXB0ZXN0
LmluYworKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcGVybC9wZXJsLXB0ZXN0LmluYwpAQCAt
MSw2ICsxLDE2IEBACiBpbmhlcml0IHB0ZXN0CiAKLVNSQ19VUkkgKz0gImZpbGU6Ly9ydW4tcHRl
c3QgXAorU1JDX1VSSSA9ICJodHRwczovL3d3dy5jcGFuLm9yZy9zcmMvNS4wL3BlcmwtJHtQVn0u
dGFyLmd6O25hbWU9cGVybCBcCisgICAgICAgICAgIGZpbGU6Ly9wZXJsLXJkZXBlbmRzLnR4dCBc
CisgICAgICAgICAgIGZpbGU6Ly8wMDAxLVNvbWVob3ctdGhpcy1tb2R1bGUtYnJlYWtzLXRocm91
Z2gtdGhlLXBlcmwtd3JhcHBlci0ucGF0Y2ggXAorICAgICAgICAgICBmaWxlOi8vZXJybm9fdmVy
LmRpZmYgXAorICAgICAgICAgICBmaWxlOi8vbmF0aXZlLXBlcmxpbmMucGF0Y2ggXAorICAgICAg
ICAgICBmaWxlOi8vcGVybC1keW5sb2FkZXIucGF0Y2ggXAorICAgICAgICAgICBmaWxlOi8vMDAw
Mi1Db25zdGFudC1GaXgtdXAtc2hlYmFuZy5wYXRjaCBcCisgICAgICAgICAgIGZpbGU6Ly9kZXRl
cm1pbmlzbS5wYXRjaCBcCisgICAgICAgICAgIGZpbGU6Ly8wMDAxLWNwYW4tU3lzLVN5c2xvZy1N
YWtlZmlsZS5QTC1GaXgtX1BBVEhfTE9HLWZvci1kZXRlcm0ucGF0Y2ggXAorICAgICAgICAgICBm
aWxlOi8vcnVuLXB0ZXN0IFwKKyAgICAgICAgICAgZmlsZTovL3BlcmwtY29uZmlncG0tc3dpdGNo
LnBhdGNoIFwKICAgICAgICAgICAgIgogCiBERUJVR19QUkVGSVhfTUFQX1JFR0VYID0gIiR7QCdc
XHwnLmpvaW4oZC5nZXRWYXIoJ0RFQlVHX1BSRUZJWF9NQVAnKS5zcGxpdCgpKX0iCmRpZmYgLS1n
aXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcGVybC9wZXJsXzUuNDIuMC5iYiBiL21ldGEvcmVj
aXBlcy1kZXZ0b29scy9wZXJsL3BlcmxfNS40Mi4xLmJiCnNpbWlsYXJpdHkgaW5kZXggOTklCnJl
bmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9wZXJsL3BlcmxfNS40Mi4wLmJiCnJlbmFt
ZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcGVybC9wZXJsXzUuNDIuMS5iYgppbmRleCBhMTU0
YmJjMGE5Li42YTM1ZTIzODA5IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcGVy
bC9wZXJsXzUuNDIuMC5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcGVybC9wZXJsXzUu
NDIuMS5iYgpAQCAtMjQsNyArMjQsNyBAQCBTUkNfVVJJOmFwcGVuZDpjbGFzcy10YXJnZXQgPSAi
IFwKICAgICAgICAgICAgZmlsZTovL2VuY29kZWZpeC5wYXRjaCBcCiAiCiAKLVNSQ19VUklbcGVy
bC5zaGEyNTZzdW1dID0gImUwOTNlZjE4NGQ3ZjlhMWI5Nzk3ZTI0NjUyOTZmNTU1MTBhZGI2ZGFi
ODg0MmIwYzNlZDUzMzI5NjYzMDk2ZGMiCitTUkNfVVJJW3Blcmwuc2hhMjU2c3VtXSA9ICI2Zjg0
ZTZkYzhjY2U5NzE4MWQxYzZhZWViNTUyYzEzNzc1YzkxZGVkM2M2YzczNzQzYzkyMTFhZjg3YjE2
YmY4IgogCiBCID0gIiR7V09SS0RJUn0vcGVybC0ke1BWfS1idWlsZCIKIAotLSAKMi40Ny4xCgo=

--===============4367363576179474343==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 950 .bb files complete (0 cached, 950 parsed). 1971 targets, 42 skipped, 0 masked, 0 errors.
Removing 1 recipes from the qemux86_64 sysroot...done.
Removing 1 recipes from the x86-64-v3 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.16.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.3.99+snapshot-0df0f961e1171a48fcc2c17b8ed2d8516df2df52"
TUNE_FEATURES        = "m64 x86-64-v3"
TARGET_FPU           = ""
meta                 = "tmp-auh-upgrades:0df0f961e1171a48fcc2c17b8ed2d8516df2df52"
meta-yocto-bsp       
meta-poky            = "master:31e68c7cf6a3686bedbcbdd99056bbd23dda2551"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 397 Local 80 Mirrors 0 Missed 317 Current 364 (20% match, 58% complete)
done.
Removing 3 stale sstate objects for arch allarch...done.
Removing 61 stale sstate objects for arch qemux86_64...done.
Removing 51 stale sstate objects for arch x86_64...done.
Removing 179 stale sstate objects for arch x86-64-v3...done.
NOTE: Executing Tasks
NOTE: Running setscene task 475 of 761 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 489 of 761 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/dpkg/dpkg_1.23.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 563 of 761 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/docbook-xml/docbook-xml-dtd4_4.5.bb:do_create_spdx_setscene)
NOTE: Running setscene task 609 of 761 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/docbook-xml/docbook-xsl-stylesheets_1.79.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 738 of 761 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 758 of 761 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 99 of 2124 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/perl/perl_5.42.1.bb:do_recipe_qa)
NOTE: Running task 1047 of 2124 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/perl/perl_5.42.1.bb:do_recipe_qa)
NOTE: recipe opkg-utils-native-0.7.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe docbook-xml-dtd4-native-4.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe docbook-xsl-stylesheets-native-1.79.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe dpkg-native-1.23.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe perl-native-5.42.1-r0: task do_recipe_qa: Started
NOTE: recipe e2fsprogs-native-1.47.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe openssl-native-3.5.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe perl-5.42.1-r0: task do_recipe_qa: Started
NOTE: recipe opkg-utils-native-0.7.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 1233 of 2124 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_fetch)
NOTE: recipe docbook-xsl-stylesheets-native-1.79.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 1234 of 2124 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/docbook-xml/docbook-xsl-stylesheets_1.79.1.bb:do_fetch)
NOTE: recipe docbook-xml-dtd4-native-4.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe dpkg-native-1.23.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 1246 of 2124 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/dpkg/dpkg_1.23.5.bb:do_fetch)
NOTE: recipe e2fsprogs-native-1.47.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe openssl-native-3.5.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 761 of 761 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.3.bb:do_recipe_qa_setscene)
NOTE: Running task 1247 of 2124 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.5.bb:do_fetch)
NOTE: recipe docbook-xsl-stylesheets-native-1.79.1-r0: task do_fetch: Started
NOTE: recipe opkg-utils-native-0.7.0-r0: task do_fetch: Started
NOTE: recipe dpkg-native-1.23.5-r0: task do_fetch: Started
NOTE: recipe perl-native-5.42.1-r0: task do_recipe_qa: Succeeded
NOTE: recipe openssl-native-3.5.5-r0: task do_fetch: Started
NOTE: recipe e2fsprogs-native-1.47.3-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1248 of 2124 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/perl/perl_5.42.1.bb:do_fetch)
NOTE: recipe openssl-native-3.5.5-r0: task do_fetch: Succeeded
NOTE: Running task 1249 of 2124 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.5.bb:do_unpack)
NOTE: recipe e2fsprogs-native-1.47.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1251 of 2124 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.3.bb:do_fetch)
NOTE: recipe opkg-utils-native-0.7.0-r0: task do_fetch: Succeeded
NOTE: Running task 1252 of 2124 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_unpack)
NOTE: recipe perl-native-5.42.1-r0: task do_fetch: Started
NOTE: recipe perl-native-5.42.1-r0: task do_fetch: Succeeded
NOTE: recipe openssl-native-3.5.5-r0: task do_unpack: Started
NOTE: Running task 1253 of 2124 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/perl/perl_5.42.1.bb:do_unpack)
NOTE: Running task 1254 of 2124 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/perl/perl_5.42.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe perl-5.42.1-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1255 of 2124 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/perl/perl_5.42.1.bb:do_fetch)
NOTE: recipe e2fsprogs-native-1.47.3-r0: task do_fetch: Started
NOTE: recipe opkg-utils-native-0.7.0-r0: task do_unpack: Started
NOTE: recipe dpkg-native-1.23.5-r0: task do_fetch: Succeeded
NOTE: Running task 1256 of 2124 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/dpkg/dpkg_1.23.5.bb:do_unpack)
NOTE: recipe perl-native-5.42.1-r0: task do_unpack: Started
NOTE: recipe perl-native-5.42.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe perl-5.42.1-r0: task do_fetch: Started
NOTE: recipe e2fsprogs-native-1.47.3-r0: task do_fetch: Succeeded
NOTE: Running task 1257 of 2124 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.3.bb:do_unpack)
NOTE: recipe perl-native-5.42.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe dpkg-native-1.23.5-r0: task do_unpack: Started
NOTE: recipe e2fsprogs-native-1.47.3-r0: task do_unpack: Started
NOTE: recipe opkg-utils-native-0.7.0-r0: task do_unpack: Succeeded
NOTE: Running task 1258 of 2124 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_patch)
NOTE: recipe opkg-utils-native-0.7.0-r0: task do_patch: Started
NOTE: recipe opkg-utils-native-0.7.0-r0: task do_patch: Succeeded
NOTE: recipe perl-5.42.1-r0: task do_fetch: Succeeded
NOTE: Running task 1260 of 2124 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/perl/perl_5.42.1.bb:do_unpack)
NOTE: recipe perl-5.42.1-r0: task do_unpack: Started
NOTE: recipe perl-native-5.42.1-r0: task do_unpack: Succeeded
NOTE: Running task 1261 of 2124 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/perl/perl_5.42.1.bb:do_patch)
NOTE: Running task 1262 of 2124 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/perl/perl_5.42.1.bb:do_collect_spdx_deps)
NOTE: recipe perl-native-5.42.1-r0: task do_patch: Started
NOTE: recipe perl-native-5.42.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe perl-native-5.42.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe openssl-native-3.5.5-r0: task do_unpack: Succeeded
NOTE: Running task 1263 of 2124 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.5.bb:do_patch)
NOTE: recipe e2fsprogs-native-1.47.3-r0: task do_unpack: Succeeded
NOTE: Running task 1264 of 2124 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.3.bb:do_patch)
NOTE: recipe dpkg-native-1.23.5-r0: task do_unpack: Succeeded
NOTE: Running task 1265 of 2124 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/dpkg/dpkg_1.23.5.bb:do_patch)
NOTE: recipe openssl-native-3.5.5-r0: task do_patch: Started
NOTE: recipe e2fsprogs-native-1.47.3-r0: task do_patch: Started
NOTE: recipe dpkg-native-1.23.5-r0: task do_patch: Started
NOTE: recipe openssl-native-3.5.5-r0: task do_patch: Succeeded
NOTE: recipe e2fsprogs-native-1.47.3-r0: task do_patch: Succeeded
NOTE: recipe perl-5.42.1-r0: task do_unpack: Succeeded
NOTE: Running task 1268 of 2124 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/perl/perl_5.42.1.bb:do_patch)
NOTE: recipe perl-5.42.1-r0: task do_patch: Started
NOTE: recipe docbook-xsl-stylesheets-native-1.79.1-r0: task do_fetch: Succeeded
NOTE: Running task 1269 of 2124 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/docbook-xml/docbook-xsl-stylesheets_1.79.1.bb:do_unpack)
NOTE: Running task 1270 of 2124 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/docbook-xml/docbook-xsl-stylesheets_1.79.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe docbook-xsl-stylesheets-native-1.79.1-r0: task do_unpack: Started
NOTE: recipe docbook-xsl-stylesheets-native-1.79.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe docbook-xsl-stylesheets-native-1.79.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe dpkg-native-1.23.5-r0: task do_patch: Succeeded
NOTE: recipe perl-5.42.1-r0: task do_patch: Succeeded
NOTE: Running task 1272 of 2124 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/perl/perl_5.42.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1273 of 2124 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/perl/perl_5.42.1.bb:do_populate_lic)
NOTE: recipe perl-5.42.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe perl-5.42.1-r0: task do_populate_lic: Started
NOTE: recipe perl-5.42.1-r0: task do_populate_lic: Succeeded
NOTE: recipe perl-5.42.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe docbook-xsl-stylesheets-native-1.79.1-r0: task do_unpack: Succeeded
NOTE: Running task 1274 of 2124 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/docbook-xml/docbook-xsl-stylesheets_1.79.1.bb:do_patch)
NOTE: Running task 1275 of 2124 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/docbook-xml/docbook-xsl-stylesheets_1.79.1.bb:do_collect_spdx_deps)
NOTE: recipe docbook-xsl-stylesheets-native-1.79.1-r0: task do_patch: Started
NOTE: recipe docbook-xsl-stylesheets-native-1.79.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe docbook-xsl-stylesheets-native-1.79.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe docbook-xsl-stylesheets-native-1.79.1-r0: task do_patch: Succeeded
NOTE: Running task 1277 of 2124 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/docbook-xml/docbook-xsl-stylesheets_1.79.1.bb:do_configure)
NOTE: recipe docbook-xsl-stylesheets-native-1.79.1-r0: task do_configure: Started
NOTE: recipe docbook-xsl-stylesheets-native-1.79.1-r0: task do_configure: Succeeded
NOTE: Running task 1278 of 2124 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/docbook-xml/docbook-xsl-stylesheets_1.79.1.bb:do_compile)
NOTE: recipe docbook-xsl-stylesheets-native-1.79.1-r0: task do_compile: Started
NOTE: recipe docbook-xsl-stylesheets-native-1.79.1-r0: task do_compile: Succeeded
NOTE: Running task 1279 of 2124 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/docbook-xml/docbook-xsl-stylesheets_1.79.1.bb:do_install)
NOTE: recipe docbook-xsl-stylesheets-native-1.79.1-r0: task do_install: Started
NOTE: recipe docbook-xsl-stylesheets-native-1.79.1-r0: task do_install: Succeeded
NOTE: recipe perl-native-5.42.1-r0: task do_patch: Failed
NOTE: Tasks Summary: Attempted 1279 tasks of which 1247 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260315073656.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260315073656.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/perl/perl_5.42.1.bb:do_patch
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/perl-native/5.42.1/temp/log.do_patch.1398290
Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: perl-native-5.42.1-r0 do_patch: Applying patch '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/perl/files/perl-configpm-switch.patch' on target directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/perl-native/5.42.1/sources/perl-5.42.1'
CmdError('quilt --quiltrc /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/perl-native/5.42.1/recipe-sysroot-native/etc/quiltrc push', 0, 'stdout: Patch perl-configpm-switch.patch is already applied; check your series file

stderr: ')
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/perl-native/5.42.1/temp/log.do_patch.1398290
ERROR: Task (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/perl/perl_5.42.1.bb:do_patch) failed with exit code '1'

--===============4367363576179474343==--

