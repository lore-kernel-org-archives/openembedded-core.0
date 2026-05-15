Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6269CD4F4F
	for <webhook@archiver.kernel.org>; Fri, 15 May 2026 13:20:33 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.34761.1778851229494506621
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 May 2026 06:20:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=Lj7IAtXL;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=soBRENQl;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101019e2bcbad0c-77bc6be6-6d24-4e48-84a9-81ef027cdb54-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1778851229;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=oR7Vya0U1YsiJa5PdcjpkiFaz9W8dfao5VpcxDR/c78=;
	b=Lj7IAtXLdMfMRyP7pKEyiiqPFWgWq2ceSGJnVSHHOLFx4X1Zs+7XdniFxK1RToX5
	NxOTyd0yEsdZGKkzGAjRL46juRTX49tjJnyh/r/ewYJIiK1TemhMkPmZwAvyAhe/mIa
	L2iuTp6YouMB2l0V8EwjYvXBHo1yAxdy1EazvHlk=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1778851229;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=oR7Vya0U1YsiJa5PdcjpkiFaz9W8dfao5VpcxDR/c78=;
	b=soBRENQl/fOFRZgC2qKsXUafpRPUbPMEqQurym5iwx+lYFlbfNh125XoQzZsbV+E
	6P+bcKLZUeQhIpC5xane9tkAkIFibw+wKn2q/Ewwi/FL0ls5Z9xBeq4QNKUCAS96n7F
	1/9QjZhHwkwaOKFQkI5HJmFk7inn8MqXDvcvLIEw=
Content-Type: multipart/mixed; boundary="===============4153732413477387271=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] perl: upgrading to 5.42.2 FAILED
Message-ID: <0101019e2bcbad0c-77bc6be6-6d24-4e48-84a9-81ef027cdb54-000000@us-west-2.amazonses.com>
Date: Fri, 15 May 2026 13:20:28 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.05.15-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 May 2026 13:20:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237110

--===============4153732413477387271==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *perl* to *5.42.2* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-perl-upgrade-5.42.0-5.42.2.patch
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
From f54b88dc28f73e23c481cf595c704c5c1b3a93df Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 15 May 2026 07:33:42 +0000
Subject: [PATCH] perl: upgrade 5.42.0 -> 5.42.2

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
 .../perl/{perl_5.42.0.bb => perl_5.42.2.bb}          |  2 +-
 11 files changed, 27 insertions(+), 17 deletions(-)
 rename meta/recipes-devtools/perl/{perl_5.42.0.bb => perl_5.42.2.bb} (99%)

diff --git a/meta/recipes-devtools/perl/files/0001-Somehow-this-module-breaks-through-the-perl-wrapper-.patch b/meta/recipes-devtools/perl/files/0001-Somehow-this-module-breaks-through-the-perl-wrapper-.patch
index 2076c61ee0..893209c560 100644
--- a/meta/recipes-devtools/perl/files/0001-Somehow-this-module-breaks-through-the-perl-wrapper-.patch
+++ b/meta/recipes-devtools/perl/files/0001-Somehow-this-module-breaks-through-the-perl-wrapper-.patch
@@ -1,4 +1,4 @@
-From 47cd22cd213d2c5f28e674b12c264dc731682560 Mon Sep 17 00:00:00 2001
+From 2ab74f7aff16c8674d663b6d2cb0f11bc8391812 Mon Sep 17 00:00:00 2001
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
index 7e5d08d8db..db6bf369c5 100644
--- a/meta/recipes-devtools/perl/files/0001-cpan-Sys-Syslog-Makefile.PL-Fix-_PATH_LOG-for-determ.patch
+++ b/meta/recipes-devtools/perl/files/0001-cpan-Sys-Syslog-Makefile.PL-Fix-_PATH_LOG-for-determ.patch
@@ -1,4 +1,4 @@
-From 322972384e0795be339252f7cf9a318dc759b51e Mon Sep 17 00:00:00 2001
+From 725df74a9708d3b808d40d975617148e14bbc3e7 Mon Sep 17 00:00:00 2001
 From: Robert Yang <liezhi.yang@windriver.com>
 Date: Fri, 18 Feb 2022 09:44:26 +0000
 Subject: [PATCH] cpan/Sys-Syslog/Makefile.PL: Fix _PATH_LOG for deterministic
diff --git a/meta/recipes-devtools/perl/files/0002-Constant-Fix-up-shebang.patch b/meta/recipes-devtools/perl/files/0002-Constant-Fix-up-shebang.patch
index 80986e66da..9e9d000886 100644
--- a/meta/recipes-devtools/perl/files/0002-Constant-Fix-up-shebang.patch
+++ b/meta/recipes-devtools/perl/files/0002-Constant-Fix-up-shebang.patch
@@ -1,4 +1,4 @@
-From a02355bdc8cde1115daf101675cdfb707d337bf1 Mon Sep 17 00:00:00 2001
+From 568c20e724a7a85a1edba2db2cc49e6c48f18150 Mon Sep 17 00:00:00 2001
 From: Joshua Watt <JPEWhacker@gmail.com>
 Date: Mon, 17 Jun 2019 10:47:23 -0500
 Subject: [PATCH] Constant: Fix up shebang
diff --git a/meta/recipes-devtools/perl/files/determinism.patch b/meta/recipes-devtools/perl/files/determinism.patch
index bdb9a928bb..bc8344237d 100644
--- a/meta/recipes-devtools/perl/files/determinism.patch
+++ b/meta/recipes-devtools/perl/files/determinism.patch
@@ -1,4 +1,4 @@
-From 5c4fd57daf125357262aa796057d7be8e78d378e Mon Sep 17 00:00:00 2001
+From 7c6674cd5c9d92efa126a403412b29044e143b06 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Wed, 5 Feb 2020 23:54:02 +0000
 Subject: [PATCH] Fixes to make the perl build reproducible:
diff --git a/meta/recipes-devtools/perl/files/encodefix.patch b/meta/recipes-devtools/perl/files/encodefix.patch
index 665699d12d..2306d06699 100644
--- a/meta/recipes-devtools/perl/files/encodefix.patch
+++ b/meta/recipes-devtools/perl/files/encodefix.patch
@@ -1,4 +1,4 @@
-From a4e22c7f2a519f24bc8aa89c6677017c0fe13679 Mon Sep 17 00:00:00 2001
+From 74d3a89a9d30827159c05f26cba44cbc658be93b Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Tue, 18 Feb 2020 17:27:26 +0000
 Subject: [PATCH] perl: Fix encode module reproducibility issues
diff --git a/meta/recipes-devtools/perl/files/errno_ver.diff b/meta/recipes-devtools/perl/files/errno_ver.diff
index 477642f457..4b5f575891 100644
--- a/meta/recipes-devtools/perl/files/errno_ver.diff
+++ b/meta/recipes-devtools/perl/files/errno_ver.diff
@@ -1,4 +1,4 @@
-From 9c404d4b1c3607e827fb56b5ae4f8fbbdb52cd0b Mon Sep 17 00:00:00 2001
+From 6bbb06d760b628fbf395554f5981e571736c9fde Mon Sep 17 00:00:00 2001
 From: Brendan O'Dea <bod@debian.org>
 Date: Fri, 16 Dec 2005 01:32:14 +1100
 Subject: [PATCH] Remove Errno version check due to upgrade problems with
diff --git a/meta/recipes-devtools/perl/files/native-perlinc.patch b/meta/recipes-devtools/perl/files/native-perlinc.patch
index 7e3e5f6652..a73b251f1f 100644
--- a/meta/recipes-devtools/perl/files/native-perlinc.patch
+++ b/meta/recipes-devtools/perl/files/native-perlinc.patch
@@ -1,4 +1,4 @@
-From 9fec62b19a49d1451fd1120c5dc38baf59f73856 Mon Sep 17 00:00:00 2001
+From aab7aa6414e6ee123559989a37d080af2290b8fd Mon Sep 17 00:00:00 2001
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
index 3721277933..60b786e6b2 100644
--- a/meta/recipes-devtools/perl/files/perl-configpm-switch.patch
+++ b/meta/recipes-devtools/perl/files/perl-configpm-switch.patch
@@ -1,4 +1,4 @@
-From 7a48538a7e8614a3342151b646d2105c0cb0cdd9 Mon Sep 17 00:00:00 2001
+From 89fd446597c30b539dd69078b11c94647ebe530c Mon Sep 17 00:00:00 2001
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
index 5472602d3a..12deb26ba9 100644
--- a/meta/recipes-devtools/perl/files/perl-dynloader.patch
+++ b/meta/recipes-devtools/perl/files/perl-dynloader.patch
@@ -1,4 +1,4 @@
-From 25a26c52c320e699b37a7ad1f4f045bc8aa4cb00 Mon Sep 17 00:00:00 2001
+From 7be9a844c3b7a0096a2658b19b8407a73eace296 Mon Sep 17 00:00:00 2001
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
diff --git a/meta/recipes-devtools/perl/perl_5.42.0.bb b/meta/recipes-devtools/perl/perl_5.42.2.bb
similarity index 99%
rename from meta/recipes-devtools/perl/perl_5.42.0.bb
rename to meta/recipes-devtools/perl/perl_5.42.2.bb
index cf28067bab..ac02c7c75b 100644
--- a/meta/recipes-devtools/perl/perl_5.42.0.bb
+++ b/meta/recipes-devtools/perl/perl_5.42.2.bb
@@ -24,7 +24,7 @@ SRC_URI:append:class-target = " \
            file://encodefix.patch \
 "
 
-SRC_URI[perl.sha256sum] = "e093ef184d7f9a1b9797e2465296f55510adb6dab8842b0c3ed53329663096dc"
+SRC_URI[perl.sha256sum] = "9384e8deb75b7b1695e5637971b752281aaecd025a3d5d4734d33c1d0adfee47"
 
 B = "${WORKDIR}/perl-${PV}-build"
 
-- 
2.47.1


--===============4153732413477387271==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-perl-upgrade-5.42.0-5.42.2.patch"

RnJvbSBmNTRiODhkYzI4ZjczZTIzYzQ4MWNmNTk1YzcwNGM1YzFiM2E5M2RmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMTUgTWF5IDIwMjYgMDc6MzM6NDIgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
ZXJsOiB1cGdyYWRlIDUuNDIuMCAtPiA1LjQyLjIKCi0tLQogLi4uaGlzLW1vZHVsZS1icmVha3Mt
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
cmwve3BlcmxfNS40Mi4wLmJiID0+IHBlcmxfNS40Mi4yLmJifSAgICAgICAgICB8ICAyICstCiAx
MSBmaWxlcyBjaGFuZ2VkLCAyNyBpbnNlcnRpb25zKCspLCAxNyBkZWxldGlvbnMoLSkKIHJlbmFt
ZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcGVybC97cGVybF81LjQyLjAuYmIgPT4gcGVybF81LjQy
LjIuYmJ9ICg5OSUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3BlcmwvZmls
ZXMvMDAwMS1Tb21laG93LXRoaXMtbW9kdWxlLWJyZWFrcy10aHJvdWdoLXRoZS1wZXJsLXdyYXBw
ZXItLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3BlcmwvZmlsZXMvMDAwMS1Tb21laG93
LXRoaXMtbW9kdWxlLWJyZWFrcy10aHJvdWdoLXRoZS1wZXJsLXdyYXBwZXItLnBhdGNoCmluZGV4
IDIwNzZjNjFlZTAuLjg5MzIwOWM1NjAgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29s
cy9wZXJsL2ZpbGVzLzAwMDEtU29tZWhvdy10aGlzLW1vZHVsZS1icmVha3MtdGhyb3VnaC10aGUt
cGVybC13cmFwcGVyLS5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcGVybC9maWxl
cy8wMDAxLVNvbWVob3ctdGhpcy1tb2R1bGUtYnJlYWtzLXRocm91Z2gtdGhlLXBlcmwtd3JhcHBl
ci0ucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDQ3Y2QyMmNkMjEzZDJjNWYyOGU2NzRiMTJj
MjY0ZGM3MzE2ODI1NjAgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDJhYjc0ZjdhZmYx
NmM4Njc0ZDY2M2I2ZDJjYjBmMTFiYzgzOTE4MTIgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBG
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
TE9HLWZvci1kZXRlcm0ucGF0Y2gKaW5kZXggN2U1ZDA4ZDhkYi4uZGI2YmYzNjljNSAxMDA2NDQK
LS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3BlcmwvZmlsZXMvMDAwMS1jcGFuLVN5cy1TeXNs
b2ctTWFrZWZpbGUuUEwtRml4LV9QQVRIX0xPRy1mb3ItZGV0ZXJtLnBhdGNoCisrKyBiL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9wZXJsL2ZpbGVzLzAwMDEtY3Bhbi1TeXMtU3lzbG9nLU1ha2VmaWxl
LlBMLUZpeC1fUEFUSF9MT0ctZm9yLWRldGVybS5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20g
MzIyOTcyMzg0ZTA3OTViZTMzOTI1MmY3Y2Y5YTMxOGRjNzU5YjUxZSBNb24gU2VwIDE3IDAwOjAw
OjAwIDIwMDEKK0Zyb20gNzI1ZGY3NGE5NzA4ZDNiODA4ZDQwZDk3NTYxNzE0OGUxNGJiYzNlNyBN
b24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IFJvYmVydCBZYW5nIDxsaWV6aGkueWFuZ0B3
aW5kcml2ZXIuY29tPgogRGF0ZTogRnJpLCAxOCBGZWIgMjAyMiAwOTo0NDoyNiArMDAwMAogU3Vi
amVjdDogW1BBVENIXSBjcGFuL1N5cy1TeXNsb2cvTWFrZWZpbGUuUEw6IEZpeCBfUEFUSF9MT0cg
Zm9yIGRldGVybWluaXN0aWMKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9wZXJs
L2ZpbGVzLzAwMDItQ29uc3RhbnQtRml4LXVwLXNoZWJhbmcucGF0Y2ggYi9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcGVybC9maWxlcy8wMDAyLUNvbnN0YW50LUZpeC11cC1zaGViYW5nLnBhdGNoCmlu
ZGV4IDgwOTg2ZTY2ZGEuLjllOWQwMDA4ODYgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0
b29scy9wZXJsL2ZpbGVzLzAwMDItQ29uc3RhbnQtRml4LXVwLXNoZWJhbmcucGF0Y2gKKysrIGIv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3BlcmwvZmlsZXMvMDAwMi1Db25zdGFudC1GaXgtdXAtc2hl
YmFuZy5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gYTAyMzU1YmRjOGNkZTExMTVkYWYxMDE2
NzVjZGZiNzA3ZDMzN2JmMSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gNTY4YzIwZTcy
NGE3YTg1YTFlZGJhMmRiMmNjNDllNmM0OGYxODE1MCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEK
IEZyb206IEpvc2h1YSBXYXR0IDxKUEVXaGFja2VyQGdtYWlsLmNvbT4KIERhdGU6IE1vbiwgMTcg
SnVuIDIwMTkgMTA6NDc6MjMgLTA1MDAKIFN1YmplY3Q6IFtQQVRDSF0gQ29uc3RhbnQ6IEZpeCB1
cCBzaGViYW5nCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcGVybC9maWxlcy9k
ZXRlcm1pbmlzbS5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9wZXJsL2ZpbGVzL2RldGVy
bWluaXNtLnBhdGNoCmluZGV4IGJkYjlhOTI4YmIuLmJjODM0NDIzN2QgMTAwNjQ0Ci0tLSBhL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9wZXJsL2ZpbGVzL2RldGVybWluaXNtLnBhdGNoCisrKyBiL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9wZXJsL2ZpbGVzL2RldGVybWluaXNtLnBhdGNoCkBAIC0xLDQg
KzEsNCBAQAotRnJvbSA1YzRmZDU3ZGFmMTI1MzU3MjYyYWE3OTYwNTdkN2JlOGU3OGQzNzhlIE1v
biBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSA3YzY2NzRjZDVjOWQ5MmVmYTEyNmE0MDM0MTJi
MjkwNDRlMTQzYjA2IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogUmljaGFyZCBQdXJk
aWUgPHJpY2hhcmQucHVyZGllQGxpbnV4Zm91bmRhdGlvbi5vcmc+CiBEYXRlOiBXZWQsIDUgRmVi
IDIwMjAgMjM6NTQ6MDIgKzAwMDAKIFN1YmplY3Q6IFtQQVRDSF0gRml4ZXMgdG8gbWFrZSB0aGUg
cGVybCBidWlsZCByZXByb2R1Y2libGU6CmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcGVybC9maWxlcy9lbmNvZGVmaXgucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcGVy
bC9maWxlcy9lbmNvZGVmaXgucGF0Y2gKaW5kZXggNjY1Njk5ZDEyZC4uMjMwNmQwNjY5OSAxMDA2
NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3BlcmwvZmlsZXMvZW5jb2RlZml4LnBhdGNo
CisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9wZXJsL2ZpbGVzL2VuY29kZWZpeC5wYXRjaApA
QCAtMSw0ICsxLDQgQEAKLUZyb20gYTRlMjJjN2YyYTUxOWYyNGJjOGFhODljNjY3NzAxN2MwZmUx
MzY3OSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gNzRkM2E4OWE5ZDMwODI3MTU5YzA1
ZjI2Y2JhNDRjYmM2NThiZTkzYiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IFJpY2hh
cmQgUHVyZGllIDxyaWNoYXJkLnB1cmRpZUBsaW51eGZvdW5kYXRpb24ub3JnPgogRGF0ZTogVHVl
LCAxOCBGZWIgMjAyMCAxNzoyNzoyNiArMDAwMAogU3ViamVjdDogW1BBVENIXSBwZXJsOiBGaXgg
ZW5jb2RlIG1vZHVsZSByZXByb2R1Y2liaWxpdHkgaXNzdWVzCmRpZmYgLS1naXQgYS9tZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvcGVybC9maWxlcy9lcnJub192ZXIuZGlmZiBiL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9wZXJsL2ZpbGVzL2Vycm5vX3Zlci5kaWZmCmluZGV4IDQ3NzY0MmY0NTcuLjRiNWY1
NzU4OTEgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9wZXJsL2ZpbGVzL2Vycm5v
X3Zlci5kaWZmCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9wZXJsL2ZpbGVzL2Vycm5vX3Zl
ci5kaWZmCkBAIC0xLDQgKzEsNCBAQAotRnJvbSA5YzQwNGQ0YjFjMzYwN2U4MjdmYjU2YjVhZTRm
OGZiYmRiNTJjZDBiIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSA2YmJiMDZkNzYwYjYy
OGZiZjM5NTU1NGY1OTgxZTU3MTczNmM5ZmRlIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJv
bTogQnJlbmRhbiBPJ0RlYSA8Ym9kQGRlYmlhbi5vcmc+CiBEYXRlOiBGcmksIDE2IERlYyAyMDA1
IDAxOjMyOjE0ICsxMTAwCiBTdWJqZWN0OiBbUEFUQ0hdIFJlbW92ZSBFcnJubyB2ZXJzaW9uIGNo
ZWNrIGR1ZSB0byB1cGdyYWRlIHByb2JsZW1zIHdpdGgKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBl
cy1kZXZ0b29scy9wZXJsL2ZpbGVzL25hdGl2ZS1wZXJsaW5jLnBhdGNoIGIvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3BlcmwvZmlsZXMvbmF0aXZlLXBlcmxpbmMucGF0Y2gKaW5kZXggN2UzZTVmNjY1
Mi4uYTczYjI1MWYxZiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3BlcmwvZmls
ZXMvbmF0aXZlLXBlcmxpbmMucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3Blcmwv
ZmlsZXMvbmF0aXZlLXBlcmxpbmMucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDlmZWM2MmIx
OWE0OWQxNDUxZmQxMTIwYzVkYzM4YmFmNTlmNzM4NTYgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAx
CitGcm9tIGFhYjdhYTY0MTRlNmVlMTIzNTU5OTg5YTM3ZDA4MGFmMjI5MGI4ZmQgTW9uIFNlcCAx
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
dGNoCmluZGV4IDM3MjEyNzc5MzMuLjYwYjc4NmU2YjIgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBl
cy1kZXZ0b29scy9wZXJsL2ZpbGVzL3BlcmwtY29uZmlncG0tc3dpdGNoLnBhdGNoCisrKyBiL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9wZXJsL2ZpbGVzL3BlcmwtY29uZmlncG0tc3dpdGNoLnBhdGNo
CkBAIC0xLDQgKzEsNCBAQAotRnJvbSA3YTQ4NTM4YTdlODYxNGEzMzQyMTUxYjY0NmQyMTA1YzBj
YjBjZGQ5IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSA4OWZkNDQ2NTk3YzMwYjUzOWRk
NjkwNzhiMTFjOTQ2NDdlYmU1MzBjIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogQWxl
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
ZGV4IDU0NzI2MDJkM2EuLjEyZGViMjZiYTkgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0
b29scy9wZXJsL2ZpbGVzL3BlcmwtZHlubG9hZGVyLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9wZXJsL2ZpbGVzL3BlcmwtZHlubG9hZGVyLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAot
RnJvbSAyNWEyNmM1MmMzMjBlNjk5YjM3YTdhZDFmNGYwNDViYzhhYTRjYjAwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQorRnJvbSA3YmU5YTg0NGMzYjdhMDA5NmEyNjU4YjE5Yjg0MDdhNzNlYWNl
Mjk2IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogUmljaGFyZCBQdXJkaWUgPHJpY2hh
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
aXBlcy1kZXZ0b29scy9wZXJsL3BlcmxfNS40Mi4yLmJiCnNpbWlsYXJpdHkgaW5kZXggOTklCnJl
bmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9wZXJsL3BlcmxfNS40Mi4wLmJiCnJlbmFt
ZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcGVybC9wZXJsXzUuNDIuMi5iYgppbmRleCBjZjI4
MDY3YmFiLi5hYzAyYzdjNzViIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcGVy
bC9wZXJsXzUuNDIuMC5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcGVybC9wZXJsXzUu
NDIuMi5iYgpAQCAtMjQsNyArMjQsNyBAQCBTUkNfVVJJOmFwcGVuZDpjbGFzcy10YXJnZXQgPSAi
IFwKICAgICAgICAgICAgZmlsZTovL2VuY29kZWZpeC5wYXRjaCBcCiAiCiAKLVNSQ19VUklbcGVy
bC5zaGEyNTZzdW1dID0gImUwOTNlZjE4NGQ3ZjlhMWI5Nzk3ZTI0NjUyOTZmNTU1MTBhZGI2ZGFi
ODg0MmIwYzNlZDUzMzI5NjYzMDk2ZGMiCitTUkNfVVJJW3Blcmwuc2hhMjU2c3VtXSA9ICI5Mzg0
ZThkZWI3NWI3YjE2OTVlNTYzNzk3MWI3NTIyODFhYWVjZDAyNWEzZDVkNDczNGQzM2MxZDBhZGZl
ZTQ3IgogCiBCID0gIiR7V09SS0RJUn0vcGVybC0ke1BWfS1idWlsZCIKIAotLSAKMi40Ny4xCgo=

--===============4153732413477387271==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 949 .bb files complete (0 cached, 949 parsed). 1974 targets, 40 skipped, 0 masked, 0 errors.
Removing 1 recipes from the qemux86_64 sysroot...done.
Removing 1 recipes from the x86-64-v3 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.19.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.0.99+snapshot-a20b729ae4f37179ba1b4dc1706a9fc97ac21257"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:a20b729ae4f37179ba1b4dc1706a9fc97ac21257"
meta-yocto-bsp       
meta-poky            = "master:0247a9ac12ffbb645d84c671ef34858c3307f01e"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 530 Local 143 Mirrors 0 Missed 387 Current 355 (26% match, 56% complete)
done.
Removing 47 stale sstate objects for arch x86_64...done.
Removing 3 stale sstate objects for arch allarch...done.
Removing 60 stale sstate objects for arch qemux86_64...done.
Removing 144 stale sstate objects for arch x86-64-v3...done.
NOTE: Executing Tasks
NOTE: Running setscene task 431 of 885 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/dpkg/dpkg_1.23.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 468 of 885 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/cross-localedef-native_2.43.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 482 of 885 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/make/make_4.4.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 495 of 885 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/gawk/gawk_5.4.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 500 of 885 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/sed/sed_4.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 503 of 885 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc-locale_2.43.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 514 of 885 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/dejagnu/dejagnu_1.6.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 526 of 885 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 532 of 885 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 533 of 885 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 542 of 885 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 543 of 885 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/readline/readline_8.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 548 of 885 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/expect/expect_5.45.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 553 of 885 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 558 of 885 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.3.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 563 of 885 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe cross-localedef-native-2.43+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe make-4.4.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe glibc-locale-2.43+git-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ptest-runner-2.5.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe dejagnu-1.6.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gawk-5.4.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe sed-4.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe readline-8.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe mpfr-4.2.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe psmisc-23.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe opkg-utils-native-0.7.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe dpkg-native-1.23.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe expect-native-5.45.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glibc-locale-2.43+git-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe make-4.4.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 627 of 885 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe ptest-runner-2.5.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 630 of 885 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 638 of 885 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe dejagnu-1.6.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gawk-5.4.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 643 of 885 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe sed-4.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 653 of 885 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/docbook-xml/docbook-xml-dtd4_4.5.bb:do_create_spdx_setscene)
NOTE: recipe libseccomp-2.6.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe readline-8.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 656 of 885 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.88.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 666 of 885 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/docbook-xml/docbook-xsl-stylesheets_1.79.1.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 667 of 885 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/xmlto/xmlto_0.0.29.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 669 of 885 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.5.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe opkg-utils-native-0.7.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe mpfr-4.2.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe dpkg-native-1.23.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe psmisc-23.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 673 of 885 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/dejagnu/dejagnu_1.6.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 676 of 885 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 681 of 885 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland-protocols_1.48.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 707 of 885 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/docbook-xml/docbook-xsl-stylesheets_1.79.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 716 of 885 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_recipe_qa_setscene)
NOTE: recipe cross-localedef-native-2.43+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 721 of 885 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.25.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xcb-proto-1.17.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-passwd-3.6.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe glib-2.0-initial-1_2.88.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe expect-native-5.45.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe docbook-xml-dtd4-native-4.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe dejagnu-1.6.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe wayland-protocols-1.48-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe docbook-xsl-stylesheets-native-1.79.1-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 737 of 885 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/tcltk8/tcl8_8.6.17.bb:do_populate_sysroot_setscene)
NOTE: recipe attr-2.5.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe psmisc-23.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xmlto-native-0.0.29-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe docbook-xsl-stylesheets-native-1.79.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe base-passwd-3.6.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 740 of 885 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/cross-localedef-native_2.43.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 746 of 885 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.47.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 752 of 885 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe wayland-native-1.25.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe glib-2.0-initial-1_2.88.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 754 of 885 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.17.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe wayland-protocols-1.48-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe dejagnu-1.6.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 755 of 885 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.88.0.bb:do_recipe_qa_setscene)
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe docbook-xml-dtd4-native-4.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 758 of 885 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 760 of 885 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe docbook-xsl-stylesheets-native-1.79.1-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe xmlto-native-0.0.29-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe psmisc-23.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 766 of 885 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/expect/expect_5.45.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 768 of 885 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20251016-3.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 808 of 885 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe docbook-xsl-stylesheets-native-1.79.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 827 of 885 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20251016-3.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 847 of 885 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/perl-cross/perlcross_1.6.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 848 of 885 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.18.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 853 of 885 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/make/make_4.4.1.bb:do_create_spdx_setscene)
NOTE: recipe cross-localedef-native-2.43+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe wayland-native-1.25.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 858 of 885 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.19.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe tcl8-native-8.6.17-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpcre2-10.47-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bash-completion-2.17.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libcap-ng-0.9.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe glib-2.0-initial-1_2.88.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libedit-20251016-3.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxml2-2.15.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe cross-localedef-native-2.43+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 871 of 885 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe perlcross-native-1.6.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe libedit-native-20251016-3.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe expect-native-5.45.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe make-native-4.4.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libpcre2-10.47-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 874 of 885 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/cmake/cmake-native_4.3.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 875 of 885 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bash-completion-2.17.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe json-c-native-0.18-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libcap-ng-0.9.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe glib-2.0-initial-1_2.88.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe glib-2.0-native-1_2.88.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libedit-20251016-3.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxml2-2.15.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe curl-native-8.19.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe perlcross-native-1.6.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe expect-native-5.45.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 879 of 885 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/perl-cross/perlcross_1.6.4.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libedit-native-20251016-3.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 881 of 885 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20251016-3.1.bb:do_create_recipe_spdx_setscene)
NOTE: recipe json-c-native-0.18-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe cmake-native-4.3.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe make-native-4.4.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 882 of 885 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/make/make_4.4.1.bb:do_create_recipe_spdx_setscene)
NOTE: recipe glib-2.0-native-1_2.88.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe expat-native-2.8.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe curl-native-8.19.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 107 of 2124 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/perl/perl_5.42.2.bb:do_recipe_qa)
NOTE: recipe tcl8-native-8.6.17-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe cmake-native-4.3.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 885 of 885 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/tcltk8/tcl8_8.6.17.bb:do_recipe_qa_setscene)
NOTE: recipe openssl-native-3.5.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 177 of 2124 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/cmake/cmake-native_4.3.2.bb:do_fetch)
NOTE: recipe expat-native-2.8.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe perlcross-native-1.6.4-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running task 214 of 2124 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.1.bb:do_fetch)
NOTE: recipe libedit-native-20251016-3.1-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe make-native-4.4.1-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe openssl-native-3.5.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 295 of 2124 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.6.bb:do_fetch)
NOTE: recipe cmake-native-4.3.2-r0: task do_fetch: Started
NOTE: recipe perl-native-5.42.2-r0: task do_recipe_qa: Started
NOTE: recipe perlcross-native-1.6.4-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe tcl8-native-8.6.17-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libedit-native-20251016-3.1-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe make-native-4.4.1-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe expat-native-2.8.1-r0: task do_fetch: Started
NOTE: recipe expat-native-2.8.1-r0: task do_fetch: Succeeded
NOTE: Running task 529 of 2124 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.1.bb:do_unpack)
NOTE: recipe tcl8-native-8.6.17-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe openssl-native-3.5.6-r0: task do_fetch: Started
NOTE: Running task 600 of 2124 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/perl/perl_5.42.2.bb:do_create_recipe_spdx)
NOTE: Running task 617 of 2124 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.47.bb:do_fetch)
NOTE: Running task 623 of 2124 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.19.0.bb:do_fetch)
NOTE: Running task 631 of 2124 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.0.bb:do_fetch)
NOTE: recipe openssl-native-3.5.6-r0: task do_fetch: Succeeded
NOTE: Running task 652 of 2124 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.18.bb:do_fetch)
NOTE: Running task 663 of 2124 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.6.bb:do_unpack)
NOTE: Running task 730 of 2124 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.0.bb:do_write_config)
NOTE: Running task 765 of 2124 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.17.0.bb:do_fetch)
NOTE: Running task 819 of 2124 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.88.0.bb:do_fetch)
NOTE: Running task 854 of 2124 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.3.bb:do_fetch)
NOTE: Running task 857 of 2124 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.1.bb:do_fetch)
NOTE: Running task 866 of 2124 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.5.2.bb:do_fetch)
NOTE: Running task 868 of 2124 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20251016-3.1.bb:do_fetch)
NOTE: recipe libpcre2-10.47-r0: task do_fetch: Started
NOTE: recipe expat-native-2.8.1-r0: task do_unpack: Started
NOTE: recipe libpcre2-10.47-r0: task do_fetch: Succeeded
NOTE: recipe perl-native-5.42.2-r0: task do_create_recipe_spdx: Started
NOTE: Running task 869 of 2124 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.47.bb:do_unpack)
NOTE: recipe curl-native-8.19.0-r0: task do_fetch: Started
NOTE: recipe bash-completion-2.17.0-r0: task do_fetch: Started
NOTE: recipe json-c-native-0.18-r0: task do_fetch: Started
NOTE: recipe openssl-native-3.5.6-r0: task do_unpack: Started
NOTE: recipe glib-2.0-native-1_2.88.0-r0: task do_fetch: Started
NOTE: recipe bash-completion-2.17.0-r0: task do_fetch: Succeeded
NOTE: recipe curl-native-8.19.0-r0: task do_fetch: Succeeded
NOTE: recipe json-c-native-0.18-r0: task do_fetch: Succeeded
NOTE: recipe glib-2.0-initial-1_2.88.0-r0: task do_fetch: Started
NOTE: Running task 870 of 2124 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.17.0.bb:do_unpack)
NOTE: Running task 871 of 2124 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.19.0.bb:do_unpack)
NOTE: recipe libedit-20251016-3.1-r0: task do_fetch: Started
NOTE: Running task 872 of 2124 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.18.bb:do_unpack)
NOTE: recipe libxml2-2.15.3-r0: task do_fetch: Started
NOTE: recipe libcap-ng-0.9.1-r0: task do_fetch: Started
NOTE: recipe glib-2.0-native-1_2.88.0-r0: task do_fetch: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_fetch: Started
NOTE: Running task 873 of 2124 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.0.bb:do_unpack)
NOTE: recipe glib-2.0-native-1_2.88.0-r0: task do_write_config: Started
NOTE: recipe glib-2.0-initial-1_2.88.0-r0: task do_fetch: Succeeded
NOTE: recipe libedit-20251016-3.1-r0: task do_fetch: Succeeded
NOTE: recipe libxml2-2.15.3-r0: task do_fetch: Succeeded
NOTE: Running task 876 of 2124 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.88.0.bb:do_unpack)
NOTE: recipe attr-2.5.2-r0: task do_fetch: Succeeded
NOTE: Running task 888 of 2124 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20251016-3.1.bb:do_unpack)
NOTE: Running task 889 of 2124 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.3.bb:do_unpack)
NOTE: Running task 890 of 2124 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.5.2.bb:do_unpack)
NOTE: recipe libpcre2-10.47-r0: task do_unpack: Started
NOTE: recipe glib-2.0-native-1_2.88.0-r0: task do_write_config: Succeeded
NOTE: recipe expat-native-2.8.1-r0: task do_unpack: Succeeded
NOTE: Running task 895 of 2124 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.88.0.bb:do_write_config)
NOTE: recipe bash-completion-2.17.0-r0: task do_unpack: Started
NOTE: Running task 896 of 2124 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.1.bb:do_patch)
NOTE: recipe perl-native-5.42.2-r0: task do_recipe_qa: Succeeded
NOTE: Task virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/perl/perl_5.42.2.bb:do_recipe_qa unihash changed to ef3b8a816baa6b2a7811a97fe2757690fb689087182fee859331424884df5ae7
NOTE: recipe libedit-20251016-3.1-r0: task do_unpack: Started
NOTE: recipe glib-2.0-initial-1_2.88.0-r0: task do_unpack: Started
NOTE: recipe json-c-native-0.18-r0: task do_unpack: Started
NOTE: recipe curl-native-8.19.0-r0: task do_unpack: Started
NOTE: recipe libxml2-2.15.3-r0: task do_unpack: Started
NOTE: recipe attr-2.5.2-r0: task do_unpack: Started
NOTE: recipe libedit-20251016-3.1-r0: task do_unpack: Succeeded
NOTE: recipe glib-2.0-native-1_2.88.0-r0: task do_unpack: Started
NOTE: recipe json-c-native-0.18-r0: task do_unpack: Succeeded
NOTE: recipe glib-2.0-initial-1_2.88.0-r0: task do_write_config: Started
NOTE: recipe attr-2.5.2-r0: task do_unpack: Succeeded
NOTE: recipe expat-native-2.8.1-r0: task do_patch: Started
NOTE: recipe glib-2.0-initial-1_2.88.0-r0: task do_write_config: Succeeded
NOTE: recipe expat-native-2.8.1-r0: task do_patch: Succeeded
NOTE: recipe bash-completion-2.17.0-r0: task do_unpack: Succeeded
NOTE: recipe libcap-ng-0.9.1-r0: task do_fetch: Succeeded
NOTE: recipe perl-native-5.42.2-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe libpcre2-10.47-r0: task do_unpack: Succeeded
NOTE: recipe curl-native-8.19.0-r0: task do_unpack: Succeeded
NOTE: recipe glib-2.0-initial-1_2.88.0-r0: task do_unpack: Succeeded
NOTE: recipe libxml2-2.15.3-r0: task do_unpack: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 897 of 2124 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/perl/perl_5.42.2.bb:do_fetch)
NOTE: Running task 899 of 2124 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.1.bb:do_generate_toolchain_file)
NOTE: Running task 900 of 2124 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.6.bb:do_create_recipe_spdx)
NOTE: Running task 901 of 2124 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.47.bb:do_patch)
NOTE: Running task 902 of 2124 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.19.0.bb:do_patch)
NOTE: Running task 903 of 2124 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.18.bb:do_patch)
NOTE: Running task 904 of 2124 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.17.0.bb:do_patch)
NOTE: Running task 905 of 2124 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.88.0.bb:do_patch)
NOTE: Running task 906 of 2124 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.3.bb:do_patch)
NOTE: Running task 907 of 2124 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.1.bb:do_unpack)
NOTE: Running task 908 of 2124 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.5.2.bb:do_patch)
NOTE: Running task 909 of 2124 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20251016-3.1.bb:do_patch)
NOTE: Running task 929 of 2124 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.25.0.bb:do_fetch)
NOTE: recipe glib-2.0-native-1_2.88.0-r0: task do_unpack: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 930 of 2124 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.0.bb:do_patch)
NOTE: recipe bash-completion-2.17.0-r0: task do_patch: Started
NOTE: recipe libpcre2-10.47-r0: task do_patch: Started
NOTE: recipe libcap-ng-0.9.1-r0: task do_unpack: Started
NOTE: recipe glib-2.0-initial-1_2.88.0-r0: task do_patch: Started
NOTE: recipe libedit-20251016-3.1-r0: task do_patch: Started
NOTE: recipe libxml2-2.15.3-r0: task do_patch: Started
NOTE: recipe attr-2.5.2-r0: task do_patch: Started
NOTE: recipe perl-native-5.42.2-r0: task do_fetch: Started
NOTE: recipe expat-native-2.8.1-r0: task do_generate_toolchain_file: Started
NOTE: recipe openssl-native-3.5.6-r0: task do_create_recipe_spdx: Started
NOTE: recipe json-c-native-0.18-r0: task do_patch: Started
NOTE: recipe curl-native-8.19.0-r0: task do_patch: Started
NOTE: recipe bash-completion-2.17.0-r0: task do_patch: Succeeded
NOTE: recipe perl-native-5.42.2-r0: task do_fetch: Succeeded
NOTE: recipe wayland-native-1.25.0-r0: task do_fetch: Started
NOTE: Running task 938 of 2124 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.0.bb:do_fetch)
NOTE: Running task 939 of 2124 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/perl/perl_5.42.2.bb:do_unpack)
NOTE: recipe wayland-native-1.25.0-r0: task do_fetch: Succeeded
NOTE: recipe json-c-native-0.18-r0: task do_patch: Succeeded
NOTE: recipe expat-native-2.8.1-r0: task do_generate_toolchain_file: Succeeded
NOTE: Running task 940 of 2124 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/perl/perl_5.42.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 941 of 2124 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.18.bb:do_generate_toolchain_file)
NOTE: recipe glib-2.0-native-1_2.88.0-r0: task do_patch: Started
NOTE: Running task 945 of 2124 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_fetch)
NOTE: recipe libpcre2-10.47-r0: task do_patch: Succeeded
NOTE: Running task 947 of 2124 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.3.2.bb:do_fetch)
NOTE: recipe curl-native-8.19.0-r0: task do_patch: Succeeded
NOTE: Running task 949 of 2124 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.25.0.bb:do_unpack)
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_fetch: Started
NOTE: recipe perl-native-5.42.2-r0: task do_unpack: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_fetch: Started
NOTE: recipe libedit-20251016-3.1-r0: task do_patch: Succeeded
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_fetch: Succeeded
NOTE: recipe libxml2-2.15.3-r0: task do_patch: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_patch: Succeeded
NOTE: Running task 963 of 2124 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.0.bb:do_unpack)
NOTE: Running task 971 of 2124 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_fetch)
NOTE: Running task 975 of 2124 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/docbook-xml/docbook-xsl-stylesheets_1.79.1.bb:do_fetch)
NOTE: Running task 977 of 2124 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.25.0.bb:do_write_config)
NOTE: recipe openssl-native-3.5.6-r0: task do_unpack: Succeeded
NOTE: recipe perl-native-5.42.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe acl-2.3.2-r0: task do_fetch: Started
NOTE: recipe json-c-native-0.18-r0: task do_generate_toolchain_file: Started
NOTE: Setscene tasks completed
NOTE: Running task 978 of 2124 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.6.bb:do_patch)
NOTE: recipe acl-2.3.2-r0: task do_fetch: Succeeded
NOTE: Running task 979 of 2124 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.3.2.bb:do_unpack)
NOTE: recipe openssl-native-3.5.6-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 980 of 2124 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/cmake/cmake-native_4.3.2.bb:do_create_recipe_spdx)
NOTE: recipe json-c-native-0.18-r0: task do_generate_toolchain_file: Succeeded
NOTE: Running task 987 of 2124 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.0.bb:do_write_config)
NOTE: recipe wayland-native-1.25.0-r0: task do_unpack: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_fetch: Started
NOTE: recipe cmake-native-4.3.2-r0: task do_create_recipe_spdx: Started
NOTE: recipe docbook-xsl-stylesheets-native-1.79.1-r0: task do_fetch: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_fetch: Succeeded
NOTE: recipe perl-native-5.42.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_unpack: Started
NOTE: Running task 988 of 2124 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_unpack)
NOTE: Running task 994 of 2124 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_fetch)
NOTE: recipe acl-2.3.2-r0: task do_unpack: Started
NOTE: recipe wayland-native-1.25.0-r0: task do_write_config: Started
NOTE: recipe openssl-native-3.5.6-r0: task do_patch: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_fetch: Succeeded
NOTE: Running task 995 of 2124 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_unpack)
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_write_config: Started
NOTE: recipe wayland-native-1.25.0-r0: task do_write_config: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_unpack: Succeeded
NOTE: Running task 997 of 2124 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.3.2.bb:do_patch)
NOTE: Running task 998 of 2124 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/xmlto/xmlto_0.0.29.bb:do_fetch)
NOTE: recipe util-macros-1_1.20.2-r0: task do_unpack: Started
NOTE: recipe base-passwd-3.6.8-r0: task do_fetch: Started
NOTE: recipe base-passwd-3.6.8-r0: task do_fetch: Succeeded
NOTE: recipe util-macros-1_1.20.2-r0: task do_unpack: Succeeded
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_write_config: Succeeded
NOTE: recipe wayland-native-1.25.0-r0: task do_unpack: Succeeded
NOTE: Running task 1004 of 2124 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_unpack)
NOTE: Running task 1005 of 2124 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.25.0.bb:do_patch)
NOTE: Running task 1006 of 2124 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_patch)
NOTE: recipe libseccomp-2.6.0-r0: task do_unpack: Started
NOTE: Running task 1025 of 2124 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_fetch)
NOTE: recipe acl-2.3.2-r0: task do_patch: Started
NOTE: recipe xmlto-native-0.0.29-r0: task do_fetch: Started
NOTE: recipe cmake-native-4.3.2-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe base-passwd-3.6.8-r0: task do_unpack: Started
NOTE: Running task 1026 of 2124 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.1.bb:do_create_recipe_spdx)
NOTE: recipe util-macros-1_1.20.2-r0: task do_patch: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_fetch: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_fetch: Succeeded
NOTE: Running task 1027 of 2124 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_fetch)
NOTE: recipe glib-2.0-initial-1_2.88.0-r0: task do_patch: Succeeded
NOTE: recipe wayland-native-1.25.0-r0: task do_patch: Started
NOTE: Running task 1039 of 2124 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland-protocols_1.48.bb:do_fetch)
NOTE: recipe openssl-native-3.5.6-r0: task do_patch: Succeeded
NOTE: Running task 1049 of 2124 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_fetch)
NOTE: recipe xcb-proto-1.17.0-r0: task do_fetch: Started
NOTE: recipe expat-native-2.8.1-r0: task do_create_recipe_spdx: Started
NOTE: recipe wayland-protocols-1.48-r0: task do_fetch: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_fetch: Succeeded
NOTE: recipe libcap-ng-0.9.1-r0: task do_unpack: Succeeded
NOTE: Running task 1060 of 2124 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/perl/perl_5.42.2.bb:do_recipe_qa)
NOTE: Running task 1061 of 2124 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.1.bb:do_patch)
NOTE: recipe base-passwd-3.6.8-r0: task do_unpack: Succeeded
NOTE: Running task 1062 of 2124 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_patch)
NOTE: recipe util-macros-1_1.20.2-r0: task do_patch: Succeeded
NOTE: recipe shadow-sysroot-4.6-r0: task do_fetch: Started
NOTE: Running task 1064 of 2124 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_unpack)
NOTE: recipe shadow-sysroot-4.6-r0: task do_fetch: Succeeded
NOTE: Running task 1065 of 2124 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_unpack)
NOTE: recipe acl-2.3.2-r0: task do_patch: Succeeded
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_unpack: Succeeded
NOTE: recipe wayland-native-1.25.0-r0: task do_patch: Succeeded
NOTE: Running task 1084 of 2124 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/procps/procps_4.0.6.bb:do_fetch)
NOTE: Running task 1085 of 2124 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.0.bb:do_patch)
NOTE: Running task 1087 of 2124 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/sed/sed_4.10.bb:do_fetch)
NOTE: recipe glib-2.0-native-1_2.88.0-r0: task do_patch: Succeeded
NOTE: Running task 1095 of 2124 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_unpack)
NOTE: recipe libcap-ng-0.9.1-r0: task do_patch: Started
NOTE: recipe perl-5.42.2-r0: task do_recipe_qa: Started
NOTE: recipe base-passwd-3.6.8-r0: task do_patch: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_unpack: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_unpack: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_unpack: Started
NOTE: recipe procps-4.0.6-r0: task do_fetch: Started
NOTE: recipe sed-4.10-r0: task do_fetch: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_unpack: Succeeded
NOTE: Running task 1096 of 2124 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_patch)
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_patch: Started
NOTE: recipe expat-native-2.8.1-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe sed-4.10-r0: task do_fetch: Succeeded
NOTE: recipe libcap-ng-0.9.1-r0: task do_patch: Succeeded
NOTE: Running task 1097 of 2124 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.5.bb:do_create_recipe_spdx)
NOTE: Running task 1111 of 2124 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/sed/sed_4.10.bb:do_unpack)
NOTE: Running task 1122 of 2124 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland-protocols_1.48.bb:do_write_config)
NOTE: recipe libpthread-stubs-0.5-r0: task do_unpack: Succeeded
NOTE: Running task 1123 of 2124 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_patch)
NOTE: recipe shadow-sysroot-4.6-r0: task do_patch: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_unpack: Succeeded
NOTE: Running task 1124 of 2124 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_patch)
NOTE: recipe wayland-protocols-1.48-r0: task do_write_config: Started
NOTE: recipe sed-4.10-r0: task do_unpack: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_patch: Started
NOTE: recipe perl-native-5.42.2-r0: task do_unpack: Succeeded
NOTE: Running task 1125 of 2124 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/perl/perl_5.42.2.bb:do_patch)
NOTE: recipe wayland-protocols-1.48-r0: task do_write_config: Succeeded
NOTE: recipe shadow-sysroot-4.6-r0: task do_patch: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_patch: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-native-3.14.5-r0: task do_create_recipe_spdx: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_patch: Succeeded
NOTE: Running task 1161 of 2124 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_fetch)
NOTE: Running task 1164 of 2124 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/readline/readline_8.3.bb:do_fetch)
NOTE: Running task 1165 of 2124 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_patch)
NOTE: Running task 1167 of 2124 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_fetch)
NOTE: recipe perl-5.42.2-r0: task do_recipe_qa: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/perl/perl_5.42.2.bb:do_recipe_qa unihash changed to 98cb771390d1ac3415b53e56d9a24a6b93bf548e6c47e44c82700fbd688039f1
NOTE: recipe gmp-6.3.0-r0: task do_fetch: Started
NOTE: recipe perl-native-5.42.2-r0: task do_patch: Started
NOTE: recipe readline-8.3-r0: task do_fetch: Started
NOTE: recipe mpfr-4.2.2-r0: task do_fetch: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_patch: Started
NOTE: recipe gmp-6.3.0-r0: task do_fetch: Succeeded
NOTE: recipe readline-8.3-r0: task do_fetch: Succeeded
NOTE: recipe mpfr-4.2.2-r0: task do_fetch: Succeeded
NOTE: recipe sed-4.10-r0: task do_unpack: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1168 of 2124 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/perl/perl_5.42.2.bb:do_fetch)
NOTE: Running task 1169 of 2124 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/sed/sed_4.10.bb:do_patch)
NOTE: Running task 1171 of 2124 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/gawk/gawk_5.4.0.bb:do_fetch)
NOTE: Running task 1172 of 2124 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_unpack)
NOTE: Running task 1173 of 2124 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/readline/readline_8.3.bb:do_unpack)
NOTE: recipe xcb-proto-1.17.0-r0: task do_patch: Succeeded
NOTE: Running task 1175 of 2124 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_unpack)
NOTE: recipe perl-5.42.2-r0: task do_fetch: Started
NOTE: recipe gmp-6.3.0-r0: task do_unpack: Started
NOTE: recipe sed-4.10-r0: task do_patch: Started
NOTE: recipe gawk-5.4.0-r0: task do_fetch: Started
NOTE: recipe readline-8.3-r0: task do_unpack: Started
NOTE: recipe mpfr-4.2.2-r0: task do_unpack: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_patch: Succeeded
NOTE: recipe gawk-5.4.0-r0: task do_fetch: Succeeded
NOTE: Running task 1178 of 2124 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb:do_fetch)
NOTE: recipe perl-5.42.2-r0: task do_fetch: Succeeded
NOTE: Running task 1180 of 2124 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/gawk/gawk_5.4.0.bb:do_unpack)
NOTE: recipe base-passwd-3.6.8-r0: task do_patch: Succeeded
NOTE: Running task 1181 of 2124 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/perl/perl_5.42.2.bb:do_unpack)
NOTE: Running task 1184 of 2124 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_fetch)
NOTE: recipe sed-4.10-r0: task do_patch: Succeeded
NOTE: Running task 1201 of 2124 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/dejagnu/dejagnu_1.6.3.bb:do_fetch)
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_patch: Succeeded
NOTE: Running task 1203 of 2124 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_fetch)
NOTE: recipe ptest-runner-2.5.1-r0: task do_fetch: Started
NOTE: recipe readline-8.3-r0: task do_unpack: Succeeded
NOTE: Running task 1204 of 2124 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/readline/readline_8.3.bb:do_patch)
NOTE: recipe gawk-5.4.0-r0: task do_unpack: Started
NOTE: recipe perl-5.42.2-r0: task do_unpack: Started
NOTE: recipe dejagnu-1.6.3-r0: task do_fetch: Started
NOTE: recipe opkg-utils-native-0.7.0-r0: task do_fetch: Started
NOTE: recipe mpfr-4.2.2-r0: task do_unpack: Succeeded
NOTE: Running task 1205 of 2124 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_patch)
NOTE: recipe python3-native-3.14.5-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe psmisc-23.7-r0: task do_fetch: Started
NOTE: Running task 1206 of 2124 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-flit-core_3.12.0.bb:do_create_recipe_spdx)
NOTE: recipe readline-8.3-r0: task do_patch: Started
NOTE: recipe mpfr-4.2.2-r0: task do_patch: Started
NOTE: recipe opkg-utils-native-0.7.0-r0: task do_fetch: Succeeded
NOTE: recipe mpfr-4.2.2-r0: task do_patch: Succeeded
NOTE: Running task 1207 of 2124 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.3.bb:do_create_recipe_spdx)
NOTE: Running task 1209 of 2124 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_unpack)
NOTE: recipe python3-flit-core-native-3.12.0-r0: task do_create_recipe_spdx: Started
NOTE: recipe ptest-runner-2.5.1-r0: task do_fetch: Succeeded
NOTE: Running task 1210 of 2124 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb:do_unpack)
NOTE: recipe wayland-protocols-1.48-r0: task do_fetch: Succeeded
NOTE: Running task 1211 of 2124 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland-protocols_1.48.bb:do_unpack)
NOTE: recipe cmake-native-4.3.2-r0: task do_fetch: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1212 of 2124 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/cmake/cmake-native_4.3.2.bb:do_unpack)
NOTE: recipe opkg-utils-native-0.7.0-r0: task do_unpack: Started
NOTE: recipe gawk-5.4.0-r0: task do_unpack: Succeeded
NOTE: recipe psmisc-23.7-r0: task do_fetch: Succeeded
NOTE: Running task 1213 of 2124 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/gawk/gawk_5.4.0.bb:do_patch)
NOTE: recipe ptest-runner-2.5.1-r0: task do_unpack: Started
NOTE: recipe util-linux-native-2.41.3-r0: task do_create_recipe_spdx: Started
NOTE: Running task 1214 of 2124 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/make/make_4.4.1.bb:do_fetch)
NOTE: recipe cmake-native-4.3.2-r0: task do_unpack: Started
NOTE: recipe wayland-protocols-1.48-r0: task do_unpack: Started
NOTE: recipe readline-8.3-r0: task do_patch: Succeeded
NOTE: Running task 1217 of 2124 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/dpkg/dpkg_1.23.7.bb:do_fetch)
NOTE: recipe gmp-6.3.0-r0: task do_unpack: Succeeded
NOTE: Running task 1218 of 2124 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_patch)
NOTE: recipe python3-flit-core-native-3.12.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe make-4.4.1-r0: task do_fetch: Started
NOTE: recipe gawk-5.4.0-r0: task do_patch: Started
NOTE: recipe make-4.4.1-r0: task do_fetch: Succeeded
NOTE: Running task 1219 of 2124 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-installer_0.7.0.bb:do_create_recipe_spdx)
NOTE: Running task 1232 of 2124 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_unpack)
NOTE: recipe wayland-protocols-1.48-r0: task do_unpack: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_patch: Started
NOTE: Running task 1233 of 2124 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland-protocols_1.48.bb:do_patch)
NOTE: recipe dpkg-native-1.23.7-r0: task do_fetch: Started
NOTE: recipe gawk-5.4.0-r0: task do_patch: Succeeded
NOTE: Running task 1235 of 2124 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/make/make_4.4.1.bb:do_unpack)
NOTE: recipe psmisc-23.7-r0: task do_unpack: Started
NOTE: recipe python3-installer-native-0.7.0-r0: task do_create_recipe_spdx: Started
NOTE: recipe wayland-protocols-1.48-r0: task do_patch: Started
NOTE: recipe util-linux-native-2.41.3-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe wayland-protocols-1.48-r0: task do_patch: Succeeded
NOTE: recipe make-4.4.1-r0: task do_unpack: Started
NOTE: recipe make-4.4.1-r0: task do_unpack: Succeeded
NOTE: Running task 1258 of 2124 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/make/make_4.4.1.bb:do_patch)
NOTE: recipe python3-installer-native-0.7.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 1259 of 2124 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pyproject-hooks_1.2.0.bb:do_create_recipe_spdx)
NOTE: recipe make-4.4.1-r0: task do_patch: Started
NOTE: recipe perl-5.42.2-r0: task do_unpack: Succeeded
NOTE: Running task 1260 of 2124 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/perl/perl_5.42.2.bb:do_patch)
NOTE: recipe opkg-utils-native-0.7.0-r0: task do_unpack: Succeeded
NOTE: Running task 1261 of 2124 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_patch)
NOTE: recipe gmp-6.3.0-r0: task do_patch: Succeeded
NOTE: recipe python3-pyproject-hooks-native-1.2.0-r0: task do_create_recipe_spdx: Started
NOTE: recipe perl-5.42.2-r0: task do_patch: Started
NOTE: recipe ptest-runner-2.5.1-r0: task do_unpack: Succeeded
NOTE: recipe opkg-utils-native-0.7.0-r0: task do_patch: Started
NOTE: Running task 1263 of 2124 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb:do_patch)
NOTE: recipe make-4.4.1-r0: task do_patch: Succeeded
NOTE: recipe ptest-runner-2.5.1-r0: task do_patch: Started
NOTE: recipe opkg-utils-native-0.7.0-r0: task do_patch: Succeeded
NOTE: recipe xmlto-native-0.0.29-r0: task do_fetch: Succeeded
NOTE: Running task 1266 of 2124 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/xmlto/xmlto_0.0.29.bb:do_unpack)
NOTE: recipe docbook-xsl-stylesheets-native-1.79.1-r0: task do_fetch: Succeeded
NOTE: Running task 1267 of 2124 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/docbook-xml/docbook-xsl-stylesheets_1.79.1.bb:do_unpack)
NOTE: Running task 1268 of 2124 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/docbook-xml/docbook-xsl-stylesheets_1.79.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pyproject-hooks-native-1.2.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe ptest-runner-2.5.1-r0: task do_patch: Succeeded
NOTE: Running task 1270 of 2124 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-build_1.5.0.bb:do_create_recipe_spdx)
NOTE: recipe psmisc-23.7-r0: task do_unpack: Succeeded
NOTE: Running task 1271 of 2124 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_patch)
NOTE: recipe xmlto-native-0.0.29-r0: task do_unpack: Started
NOTE: recipe docbook-xsl-stylesheets-native-1.79.1-r0: task do_unpack: Started
NOTE: recipe docbook-xsl-stylesheets-native-1.79.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-build-native-1.5.0-r0: task do_create_recipe_spdx: Started
NOTE: recipe psmisc-23.7-r0: task do_patch: Started
NOTE: recipe docbook-xsl-stylesheets-native-1.79.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe psmisc-23.7-r0: task do_patch: Succeeded
NOTE: recipe python3-build-native-1.5.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 1273 of 2124 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-wheel_0.47.0.bb:do_create_recipe_spdx)
NOTE: Running task 1274 of 2124 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jinja2_3.1.6.bb:do_create_recipe_spdx)
NOTE: recipe perl-5.42.2-r0: task do_patch: Succeeded
NOTE: Running task 1275 of 2124 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/perl/perl_5.42.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1276 of 2124 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/perl/perl_5.42.2.bb:do_populate_lic)
NOTE: recipe python3-wheel-native-0.47.0-r0: task do_create_recipe_spdx: Started
NOTE: recipe python3-jinja2-native-3.1.6-r0: task do_create_recipe_spdx: Started
NOTE: recipe perl-5.42.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe perl-5.42.2-r0: task do_populate_lic: Started
NOTE: recipe cmake-native-4.3.2-r0: task do_unpack: Succeeded
NOTE: Running task 1277 of 2124 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/cmake/cmake-native_4.3.2.bb:do_patch)
NOTE: recipe xmlto-native-0.0.29-r0: task do_unpack: Succeeded
NOTE: Running task 1278 of 2124 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/xmlto/xmlto_0.0.29.bb:do_patch)
NOTE: recipe cmake-native-4.3.2-r0: task do_patch: Started
NOTE: recipe cmake-native-4.3.2-r0: task do_patch: Succeeded
NOTE: recipe perl-5.42.2-r0: task do_populate_lic: Succeeded
NOTE: recipe xmlto-native-0.0.29-r0: task do_patch: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/perl/perl_5.42.2.bb:do_populate_lic unihash changed to 9089fb62597913a600d862fe8e3f6b4fb802c1828b40da0f49675e6b8069de6a
NOTE: recipe perl-5.42.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/perl/perl_5.42.2.bb:do_deploy_source_date_epoch unihash changed to ffc4321adf95774567c4577ef155facdbaac683fc7c6cb47fb254d836bac3366
NOTE: recipe xmlto-native-0.0.29-r0: task do_patch: Succeeded
NOTE: recipe python3-jinja2-native-3.1.6-r0: task do_create_recipe_spdx: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe python3-wheel-native-0.47.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 1281 of 2124 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_82.0.1.bb:do_create_recipe_spdx)
NOTE: recipe python3-setuptools-native-82.0.1-r0: task do_create_recipe_spdx: Started
NOTE: recipe dejagnu-1.6.3-r0: task do_fetch: Succeeded
NOTE: Running task 1282 of 2124 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/dejagnu/dejagnu_1.6.3.bb:do_unpack)
NOTE: recipe dejagnu-1.6.3-r0: task do_unpack: Started
NOTE: recipe dejagnu-1.6.3-r0: task do_unpack: Succeeded
NOTE: Running task 1283 of 2124 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/dejagnu/dejagnu_1.6.3.bb:do_patch)
NOTE: recipe python3-setuptools-native-82.0.1-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe dejagnu-1.6.3-r0: task do_patch: Started
NOTE: Running task 1284 of 2124 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/meson/meson_1.11.1.bb:do_create_recipe_spdx)
NOTE: recipe dejagnu-1.6.3-r0: task do_patch: Succeeded
NOTE: recipe meson-native-1.11.1-r0: task do_create_recipe_spdx: Started
NOTE: recipe meson-native-1.11.1-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 1286 of 2124 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/systemd/systemd-systemctl-native_259.5.bb:do_create_recipe_spdx)
NOTE: Running task 1287 of 2124 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.0.bb:do_create_recipe_spdx)
NOTE: Running task 1288 of 2124 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.25.0.bb:do_create_recipe_spdx)
NOTE: recipe systemd-systemctl-native-259.5-r0: task do_create_recipe_spdx: Started
NOTE: recipe wayland-native-1.25.0-r0: task do_create_recipe_spdx: Started
NOTE: recipe glib-2.0-native-1_2.88.0-r0: task do_create_recipe_spdx: Started
NOTE: recipe docbook-xsl-stylesheets-native-1.79.1-r0: task do_unpack: Succeeded
NOTE: Running task 1289 of 2124 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/docbook-xml/docbook-xsl-stylesheets_1.79.1.bb:do_patch)
NOTE: recipe docbook-xsl-stylesheets-native-1.79.1-r0: task do_patch: Started
NOTE: recipe glib-2.0-native-1_2.88.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe systemd-systemctl-native-259.5-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe wayland-native-1.25.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 1290 of 2124 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/qemu/qemu-native_10.2.0.bb:do_create_recipe_spdx)
NOTE: Running task 1291 of 2124 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_create_recipe_spdx)
NOTE: Running task 1292 of 2124 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_create_recipe_spdx)
NOTE: Running task 1293 of 2124 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland-protocols_1.48.bb:do_create_recipe_spdx)
NOTE: Running task 1294 of 2124 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc_2.43.bb:do_create_recipe_spdx)
NOTE: recipe docbook-xsl-stylesheets-native-1.79.1-r0: task do_patch: Succeeded
NOTE: Running task 1296 of 2124 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/docbook-xml/docbook-xsl-stylesheets_1.79.1.bb:do_configure)
NOTE: recipe qemu-native-10.2.0-r0: task do_create_recipe_spdx: Started
NOTE: recipe wayland-protocols-1.48-r0: task do_create_recipe_spdx: Started
NOTE: recipe shared-mime-info-native-2.4-r0: task do_create_recipe_spdx: Started
NOTE: recipe gobject-introspection-native-1.86.0-r0: task do_create_recipe_spdx: Started
NOTE: recipe glibc-2.43+git-r1: task do_create_recipe_spdx: Started
NOTE: recipe docbook-xsl-stylesheets-native-1.79.1-r0: task do_configure: Started
NOTE: recipe docbook-xsl-stylesheets-native-1.79.1-r0: task do_configure: Succeeded
NOTE: Running task 1297 of 2124 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/docbook-xml/docbook-xsl-stylesheets_1.79.1.bb:do_compile)
NOTE: recipe wayland-protocols-1.48-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe qemu-native-10.2.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe docbook-xsl-stylesheets-native-1.79.1-r0: task do_compile: Started
NOTE: recipe gobject-introspection-native-1.86.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe glibc-2.43+git-r1: task do_create_recipe_spdx: Succeeded
NOTE: Running task 1298 of 2124 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_create_recipe_spdx)
NOTE: recipe docbook-xsl-stylesheets-native-1.79.1-r0: task do_compile: Succeeded
NOTE: Running task 1299 of 2124 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/docbook-xml/docbook-xsl-stylesheets_1.79.1.bb:do_install)
NOTE: recipe libgcc-15.2.0-r0: task do_create_recipe_spdx: Started
NOTE: recipe docbook-xsl-stylesheets-native-1.79.1-r0: task do_install: Started
NOTE: recipe shared-mime-info-native-2.4-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe docbook-xsl-stylesheets-native-1.79.1-r0: task do_install: Succeeded
NOTE: recipe libgcc-15.2.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 1300 of 2124 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_create_recipe_spdx)
NOTE: recipe procps-4.0.6-r0: task do_fetch: Succeeded
NOTE: Running task 1301 of 2124 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/procps/procps_4.0.6.bb:do_unpack)
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_recipe_spdx: Started
NOTE: recipe procps-4.0.6-r0: task do_unpack: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 1302 of 2124 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_create_recipe_spdx)
NOTE: Running task 1303 of 2124 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_create_recipe_spdx)
NOTE: Running task 1304 of 2124 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_create_recipe_spdx)
NOTE: Running task 1305 of 2124 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2025.1.bb:do_create_recipe_spdx)
NOTE: Running task 1306 of 2124 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.53.0.bb:do_create_recipe_spdx)
NOTE: Running task 1307 of 2124 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.1.bb:do_create_recipe_spdx)
NOTE: Running task 1308 of 2124 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_create_recipe_spdx)
NOTE: recipe libtool-cross-2.5.4-r0: task do_create_recipe_spdx: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_recipe_spdx: Started
NOTE: recipe zlib-1.3.2-r0: task do_create_recipe_spdx: Started
NOTE: recipe zstd-1.5.7-r0: task do_create_recipe_spdx: Started
NOTE: recipe sqlite3-3_3.53.0-r0: task do_create_recipe_spdx: Started
NOTE: recipe xorgproto-2025.1-r0: task do_create_recipe_spdx: Started
NOTE: recipe expat-2.8.1-r0: task do_create_recipe_spdx: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe libtool-cross-2.5.4-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe zlib-1.3.2-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe expat-2.8.1-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 1309 of 2124 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxcrypt/libxcrypt_4.5.2.bb:do_create_recipe_spdx)
NOTE: Running task 1310 of 2124 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.17.0.bb:do_create_recipe_spdx)
NOTE: Running task 1311 of 2124 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_create_recipe_spdx)
NOTE: Running task 1312 of 2124 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_create_recipe_spdx)
NOTE: Running task 1313 of 2124 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_create_recipe_spdx)
NOTE: recipe zstd-1.5.7-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 1314 of 2124 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_create_recipe_spdx)
NOTE: Running task 1315 of 2124 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.3.bb:do_create_recipe_spdx)
NOTE: Running task 1316 of 2124 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.3.bb:do_create_recipe_spdx)
NOTE: recipe xorgproto-2025.1-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 1317 of 2124 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.6.bb:do_create_recipe_spdx)
NOTE: Running task 1318 of 2124 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.3.bb:do_create_recipe_spdx)
NOTE: Running task 1319 of 2124 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_create_recipe_spdx)
NOTE: Running task 1320 of 2124 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_create_recipe_spdx)
NOTE: recipe libxcrypt-4.5.2-r0: task do_create_recipe_spdx: Started
NOTE: recipe bash-completion-2.17.0-r0: task do_create_recipe_spdx: Started
NOTE: recipe libffi-3.5.2-r0: task do_create_recipe_spdx: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_create_recipe_spdx: Started
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_create_recipe_spdx: Started
NOTE: recipe bzip2-1.0.8-r0: task do_create_recipe_spdx: Started
NOTE: recipe ncurses-6.6-r0: task do_create_recipe_spdx: Started
NOTE: recipe libxml2-2.15.3-r0: task do_create_recipe_spdx: Started
NOTE: recipe xz-5.8.3-r0: task do_create_recipe_spdx: Started
NOTE: recipe openssl-3.5.6-r0: task do_create_recipe_spdx: Started
NOTE: recipe procps-4.0.6-r0: task do_unpack: Succeeded
NOTE: recipe gdbm-1.26-r0: task do_create_recipe_spdx: Started
NOTE: recipe base-passwd-3.6.8-r0: task do_create_recipe_spdx: Started
NOTE: recipe sqlite3-3_3.53.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 1321 of 2124 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/procps/procps_4.0.6.bb:do_patch)
NOTE: Running task 1322 of 2124 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.5.2.bb:do_create_recipe_spdx)
NOTE: recipe procps-4.0.6-r0: task do_patch: Started
NOTE: recipe attr-2.5.2-r0: task do_create_recipe_spdx: Started
NOTE: recipe procps-4.0.6-r0: task do_patch: Succeeded
NOTE: Running task 1324 of 2124 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.1.bb:do_create_recipe_spdx)
NOTE: recipe bash-completion-2.17.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 1325 of 2124 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_create_recipe_spdx)
NOTE: recipe base-passwd-3.6.8-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe openssl-3.5.6-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe xz-5.8.3-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 1326 of 2124 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_create_recipe_spdx)
NOTE: recipe bzip2-1.0.8-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 1327 of 2124 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_create_recipe_spdx)
NOTE: Running task 1328 of 2124 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.47.bb:do_create_recipe_spdx)
NOTE: recipe libcap-ng-0.9.1-r0: task do_create_recipe_spdx: Started
NOTE: Running task 1329 of 2124 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_create_recipe_spdx)
NOTE: Running task 1330 of 2124 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/kmod/kmod_34.2.bb:do_create_recipe_spdx)
NOTE: recipe util-macros-1_1.20.2-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe libffi-3.5.2-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe libxml2-2.15.3-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 1331 of 2124 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_create_recipe_spdx)
NOTE: recipe libxcrypt-4.5.2-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 1332 of 2124 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_create_recipe_spdx)
NOTE: recipe attr-2.5.2-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_create_recipe_spdx: Started
NOTE: recipe gdbm-1.26-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe ncurses-6.6-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 1333 of 2124 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.47.bb:do_create_recipe_spdx)
NOTE: recipe shadow-sysroot-4.6-r0: task do_create_recipe_spdx: Started
NOTE: Running task 1334 of 2124 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.25.0.bb:do_create_recipe_spdx)
NOTE: Running task 1335 of 2124 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20251016-3.1.bb:do_create_recipe_spdx)
NOTE: Running task 1336 of 2124 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_create_recipe_spdx)
NOTE: recipe xcb-proto-1.17.0-r0: task do_create_recipe_spdx: Started
NOTE: Running task 1337 of 2124 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.3.2.bb:do_create_recipe_spdx)
NOTE: recipe libpcre2-10.47-r0: task do_create_recipe_spdx: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_create_recipe_spdx: Started
NOTE: recipe kmod-34.2-r0: task do_create_recipe_spdx: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_create_recipe_spdx: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_create_recipe_spdx: Started
NOTE: recipe xkeyboard-config-2.47-r0: task do_create_recipe_spdx: Started
NOTE: recipe libedit-20251016-3.1-r0: task do_create_recipe_spdx: Started
NOTE: recipe wayland-1.25.0-r0: task do_create_recipe_spdx: Started
NOTE: recipe acl-2.3.2-r0: task do_create_recipe_spdx: Started
NOTE: recipe libpam-1.7.2-r0: task do_create_recipe_spdx: Started
NOTE: recipe libcap-ng-0.9.1-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 1338 of 2124 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/perl/perl_5.42.2.bb:do_create_recipe_spdx)
NOTE: recipe shadow-sysroot-4.6-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 1339 of 2124 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/sed/sed_4.10.bb:do_create_recipe_spdx)
NOTE: recipe perl-5.42.2-r0: task do_create_recipe_spdx: Started
NOTE: recipe libpcre2-10.47-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 1340 of 2124 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.88.0.bb:do_create_recipe_spdx)
NOTE: recipe libxau-1_1.0.12-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe xkeyboard-config-2.47-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe sed-4.10-r0: task do_create_recipe_spdx: Started
NOTE: recipe libpam-1.7.2-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe libseccomp-2.6.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 1341 of 2124 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.3.bb:do_create_recipe_spdx)
NOTE: Running task 1342 of 2124 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.19.4.bb:do_create_recipe_spdx)
NOTE: Running task 1343 of 2124 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_create_recipe_spdx)
NOTE: recipe wayland-1.25.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 1344 of 2124 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.78.bb:do_create_recipe_spdx)
NOTE: recipe kmod-34.2-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe libedit-20251016-3.1-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 1345 of 2124 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.5.bb:do_create_recipe_spdx)
NOTE: recipe glib-2.0-initial-1_2.88.0-r0: task do_create_recipe_spdx: Started
NOTE: recipe libcap-2.78-r0: task do_create_recipe_spdx: Started
NOTE: recipe perl-5.42.2-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_create_recipe_spdx: Started
NOTE: recipe shadow-4.19.4-r0: task do_create_recipe_spdx: Started
NOTE: recipe util-linux-2.41.3-r0: task do_create_recipe_spdx: Started
NOTE: recipe python3-3.14.5-r0: task do_create_recipe_spdx: Started
NOTE: recipe sed-4.10-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe glib-2.0-initial-1_2.88.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe libcap-2.78-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 1346 of 2124 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.13.1.bb:do_create_recipe_spdx)
NOTE: recipe util-linux-2.41.3-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe shadow-4.19.4-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 1347 of 2124 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb:do_create_recipe_spdx)
NOTE: recipe python3-3.14.5-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 1348 of 2124 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_create_recipe_spdx)
NOTE: recipe libxkbcommon-1.13.1-r0: task do_create_recipe_spdx: Started
NOTE: recipe ptest-runner-2.5.1-r0: task do_create_recipe_spdx: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_create_recipe_spdx: Started
NOTE: recipe ptest-runner-2.5.1-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe libxkbcommon-1.13.1-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe gobject-introspection-1.86.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 1349 of 2124 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.0.bb:do_create_recipe_spdx)
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_create_recipe_spdx: Started
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 1350 of 2124 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_create_recipe_spdx)
NOTE: recipe shared-mime-info-2.4-r0: task do_create_recipe_spdx: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 1351 of 2124 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/systemd/systemd_259.5.bb:do_create_recipe_spdx)
NOTE: recipe perl-native-5.42.2-r0: task do_patch: Failed
NOTE: recipe systemd-1_259.5-r0: task do_create_recipe_spdx: Started
NOTE: recipe systemd-1_259.5-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe dpkg-native-1.23.7-r0: task do_fetch: Succeeded
NOTE: Tasks Summary: Attempted 1351 tasks of which 1148 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260515073314.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260515073314.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/perl/perl_5.42.2.bb:do_patch
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/perl-native/5.42.2/temp/log.do_patch.579932
Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: perl-native-5.42.2-r0 do_patch: Applying patch '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/perl/files/perl-configpm-switch.patch' on target directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/perl-native/5.42.2/sources/perl-5.42.2'
CmdError('quilt --quiltrc /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/perl-native/5.42.2/recipe-sysroot-native/etc/quiltrc push', 0, 'stdout: Patch perl-configpm-switch.patch is already applied; check your series file

stderr: ')
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/perl-native/5.42.2/temp/log.do_patch.579932
ERROR: Task (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/perl/perl_5.42.2.bb:do_patch) failed with exit code '1'

--===============4153732413477387271==--

