Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21F97CD6E6D
	for <webhook@archiver.kernel.org>; Mon,  1 Jun 2026 15:35:40 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1559.1780328132630584587
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jun 2026 08:35:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=SFzQPmzY;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=2mjgQG3q;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101019e83d37f33-8f5fd122-004c-45aa-9586-9b53e68d545b-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1780328136;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=1Bv2+E+DUmNQxs4HoTzLn5VvNJ+O1ux8w3wCxheZdU4=;
	b=SFzQPmzYK/J83ewRX+4b6cLeWWVS6lDhkw24BDf5RYYDeYgbInkpHYj/woQoqRaq
	TJFenv6df6HWsLr4OdBE/SjfRtNBm5SzLDUEnogNa1NJl4rtUZ3r0T5evD6AAMT/Yrq
	FG1T6GqohnjGh3VXawRxRaySINPpzyom7nKIdE+k=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1780328136;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=1Bv2+E+DUmNQxs4HoTzLn5VvNJ+O1ux8w3wCxheZdU4=;
	b=2mjgQG3qTC8CwhBORf8nCQNMOBwa3dqmDutN5092i9/nfN1SmTOQ8OekhZtxUOQL
	MXPLQEGVfw9t+xwHImMRkpCBipMuhCWHo4KuxivzXXZ8+ctqxuE/R9fn32LW0XeP+gr
	3Kc4WVk2Y7xY4Dni8dtNFEtzvxAKFIV7vykK/PTo=
Content-Type: multipart/mixed; boundary="===============4230332934482229906=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] perl: upgrading to 5.42.2 FAILED
Message-ID: <0101019e83d37f33-8f5fd122-004c-45aa-9586-9b53e68d545b-000000@us-west-2.amazonses.com>
Date: Mon, 1 Jun 2026 15:35:36 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.06.01-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Jun 2026 15:35:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237874

--===============4230332934482229906==
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
From c3110a13e932898f7431c6fbef64fc54516df823 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 1 Jun 2026 08:08:23 +0000
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
index 2076c61ee0..eec4e6b05f 100644
--- a/meta/recipes-devtools/perl/files/0001-Somehow-this-module-breaks-through-the-perl-wrapper-.patch
+++ b/meta/recipes-devtools/perl/files/0001-Somehow-this-module-breaks-through-the-perl-wrapper-.patch
@@ -1,4 +1,4 @@
-From 47cd22cd213d2c5f28e674b12c264dc731682560 Mon Sep 17 00:00:00 2001
+From 94c4eb9683c91cb845ace110856038436afe8213 Mon Sep 17 00:00:00 2001
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
index 7e5d08d8db..20d07603b4 100644
--- a/meta/recipes-devtools/perl/files/0001-cpan-Sys-Syslog-Makefile.PL-Fix-_PATH_LOG-for-determ.patch
+++ b/meta/recipes-devtools/perl/files/0001-cpan-Sys-Syslog-Makefile.PL-Fix-_PATH_LOG-for-determ.patch
@@ -1,4 +1,4 @@
-From 322972384e0795be339252f7cf9a318dc759b51e Mon Sep 17 00:00:00 2001
+From 54d3c7c9dfcf7f55105492e946722c1612ba7d3e Mon Sep 17 00:00:00 2001
 From: Robert Yang <liezhi.yang@windriver.com>
 Date: Fri, 18 Feb 2022 09:44:26 +0000
 Subject: [PATCH] cpan/Sys-Syslog/Makefile.PL: Fix _PATH_LOG for deterministic
diff --git a/meta/recipes-devtools/perl/files/0002-Constant-Fix-up-shebang.patch b/meta/recipes-devtools/perl/files/0002-Constant-Fix-up-shebang.patch
index 80986e66da..506c4d7b4d 100644
--- a/meta/recipes-devtools/perl/files/0002-Constant-Fix-up-shebang.patch
+++ b/meta/recipes-devtools/perl/files/0002-Constant-Fix-up-shebang.patch
@@ -1,4 +1,4 @@
-From a02355bdc8cde1115daf101675cdfb707d337bf1 Mon Sep 17 00:00:00 2001
+From d6ea14d18ae2961b678a8f10c8e708db602caa9e Mon Sep 17 00:00:00 2001
 From: Joshua Watt <JPEWhacker@gmail.com>
 Date: Mon, 17 Jun 2019 10:47:23 -0500
 Subject: [PATCH] Constant: Fix up shebang
diff --git a/meta/recipes-devtools/perl/files/determinism.patch b/meta/recipes-devtools/perl/files/determinism.patch
index bdb9a928bb..ee4e59e4a5 100644
--- a/meta/recipes-devtools/perl/files/determinism.patch
+++ b/meta/recipes-devtools/perl/files/determinism.patch
@@ -1,4 +1,4 @@
-From 5c4fd57daf125357262aa796057d7be8e78d378e Mon Sep 17 00:00:00 2001
+From c8696e265dceb8f1c887ee67df9eefe57afaf825 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Wed, 5 Feb 2020 23:54:02 +0000
 Subject: [PATCH] Fixes to make the perl build reproducible:
diff --git a/meta/recipes-devtools/perl/files/encodefix.patch b/meta/recipes-devtools/perl/files/encodefix.patch
index 665699d12d..300a3f74a0 100644
--- a/meta/recipes-devtools/perl/files/encodefix.patch
+++ b/meta/recipes-devtools/perl/files/encodefix.patch
@@ -1,4 +1,4 @@
-From a4e22c7f2a519f24bc8aa89c6677017c0fe13679 Mon Sep 17 00:00:00 2001
+From 274364d0ae364ddf8eee80367d6a70f05cb5cbcd Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Tue, 18 Feb 2020 17:27:26 +0000
 Subject: [PATCH] perl: Fix encode module reproducibility issues
diff --git a/meta/recipes-devtools/perl/files/errno_ver.diff b/meta/recipes-devtools/perl/files/errno_ver.diff
index 477642f457..f4520067f3 100644
--- a/meta/recipes-devtools/perl/files/errno_ver.diff
+++ b/meta/recipes-devtools/perl/files/errno_ver.diff
@@ -1,4 +1,4 @@
-From 9c404d4b1c3607e827fb56b5ae4f8fbbdb52cd0b Mon Sep 17 00:00:00 2001
+From a3be07665201a3edebb4add143df21f46ed2e20b Mon Sep 17 00:00:00 2001
 From: Brendan O'Dea <bod@debian.org>
 Date: Fri, 16 Dec 2005 01:32:14 +1100
 Subject: [PATCH] Remove Errno version check due to upgrade problems with
diff --git a/meta/recipes-devtools/perl/files/native-perlinc.patch b/meta/recipes-devtools/perl/files/native-perlinc.patch
index 7e3e5f6652..7c3bb6d26f 100644
--- a/meta/recipes-devtools/perl/files/native-perlinc.patch
+++ b/meta/recipes-devtools/perl/files/native-perlinc.patch
@@ -1,4 +1,4 @@
-From 9fec62b19a49d1451fd1120c5dc38baf59f73856 Mon Sep 17 00:00:00 2001
+From 78c3eaa2e399c7179a435b9c127d925c04519a83 Mon Sep 17 00:00:00 2001
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
index 3721277933..e4ef2edf66 100644
--- a/meta/recipes-devtools/perl/files/perl-configpm-switch.patch
+++ b/meta/recipes-devtools/perl/files/perl-configpm-switch.patch
@@ -1,4 +1,4 @@
-From 7a48538a7e8614a3342151b646d2105c0cb0cdd9 Mon Sep 17 00:00:00 2001
+From 4b5f2727bcfd439130ec621d797762467bc607e5 Mon Sep 17 00:00:00 2001
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
index 5472602d3a..782f6e38de 100644
--- a/meta/recipes-devtools/perl/files/perl-dynloader.patch
+++ b/meta/recipes-devtools/perl/files/perl-dynloader.patch
@@ -1,4 +1,4 @@
-From 25a26c52c320e699b37a7ad1f4f045bc8aa4cb00 Mon Sep 17 00:00:00 2001
+From 070a32a1c36c0fa3c0366f7ec9dc4db2ec8cc5d0 Mon Sep 17 00:00:00 2001
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


--===============4230332934482229906==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-perl-upgrade-5.42.0-5.42.2.patch"

RnJvbSBjMzExMGExM2U5MzI4OThmNzQzMWM2ZmJlZjY0ZmM1NDUxNmRmODIzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMSBKdW4gMjAyNiAwODowODoyMyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHBl
cmw6IHVwZ3JhZGUgNS40Mi4wIC0+IDUuNDIuMgoKLS0tCiAuLi5oaXMtbW9kdWxlLWJyZWFrcy10
aHJvdWdoLXRoZS1wZXJsLXdyYXBwZXItLnBhdGNoIHwgIDggKysrKy0tLS0KIC4uLlN5c2xvZy1N
YWtlZmlsZS5QTC1GaXgtX1BBVEhfTE9HLWZvci1kZXRlcm0ucGF0Y2ggfCAgMiArLQogLi4uL3Bl
cmwvZmlsZXMvMDAwMi1Db25zdGFudC1GaXgtdXAtc2hlYmFuZy5wYXRjaCAgICB8ICAyICstCiBt
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcGVybC9maWxlcy9kZXRlcm1pbmlzbS5wYXRjaCAgIHwgIDIg
Ky0KIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9wZXJsL2ZpbGVzL2VuY29kZWZpeC5wYXRjaCAgICAg
fCAgMiArLQogbWV0YS9yZWNpcGVzLWRldnRvb2xzL3BlcmwvZmlsZXMvZXJybm9fdmVyLmRpZmYg
ICAgICB8ICAyICstCiAuLi4vcmVjaXBlcy1kZXZ0b29scy9wZXJsL2ZpbGVzL25hdGl2ZS1wZXJs
aW5jLnBhdGNoIHwgIDYgKysrLS0tCiAuLi4vcGVybC9maWxlcy9wZXJsLWNvbmZpZ3BtLXN3aXRj
aC5wYXRjaCAgICAgICAgICAgIHwgIDQgKystLQogLi4uL3JlY2lwZXMtZGV2dG9vbHMvcGVybC9m
aWxlcy9wZXJsLWR5bmxvYWRlci5wYXRjaCB8ICAyICstCiBtZXRhL3JlY2lwZXMtZGV2dG9vbHMv
cGVybC9wZXJsLXB0ZXN0LmluYyAgICAgICAgICAgIHwgMTIgKysrKysrKysrKystCiAuLi4vcGVy
bC97cGVybF81LjQyLjAuYmIgPT4gcGVybF81LjQyLjIuYmJ9ICAgICAgICAgIHwgIDIgKy0KIDEx
IGZpbGVzIGNoYW5nZWQsIDI3IGluc2VydGlvbnMoKyksIDE3IGRlbGV0aW9ucygtKQogcmVuYW1l
IG1ldGEvcmVjaXBlcy1kZXZ0b29scy9wZXJsL3twZXJsXzUuNDIuMC5iYiA9PiBwZXJsXzUuNDIu
Mi5iYn0gKDk5JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcGVybC9maWxl
cy8wMDAxLVNvbWVob3ctdGhpcy1tb2R1bGUtYnJlYWtzLXRocm91Z2gtdGhlLXBlcmwtd3JhcHBl
ci0ucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcGVybC9maWxlcy8wMDAxLVNvbWVob3ct
dGhpcy1tb2R1bGUtYnJlYWtzLXRocm91Z2gtdGhlLXBlcmwtd3JhcHBlci0ucGF0Y2gKaW5kZXgg
MjA3NmM2MWVlMC4uZWVjNGU2YjA1ZiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L3BlcmwvZmlsZXMvMDAwMS1Tb21laG93LXRoaXMtbW9kdWxlLWJyZWFrcy10aHJvdWdoLXRoZS1w
ZXJsLXdyYXBwZXItLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9wZXJsL2ZpbGVz
LzAwMDEtU29tZWhvdy10aGlzLW1vZHVsZS1icmVha3MtdGhyb3VnaC10aGUtcGVybC13cmFwcGVy
LS5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gNDdjZDIyY2QyMTNkMmM1ZjI4ZTY3NGIxMmMy
NjRkYzczMTY4MjU2MCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gOTRjNGViOTY4M2M5
MWNiODQ1YWNlMTEwODU2MDM4NDM2YWZlODIxMyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZy
b206IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4LmthbmF2aW5AZ21haWwuY29tPgogRGF0ZTogVHVl
LCA1IEp1biAyMDE4IDE0OjU4OjQyICswMzAwCiBTdWJqZWN0OiBbUEFUQ0hdIFNvbWVob3cgdGhp
cyBtb2R1bGUgYnJlYWtzIHRocm91Z2ggdGhlIHBlcmwgd3JhcHBlciBhbmQKQEAgLTExLDEwICsx
MSwxMCBAQCBTaWduZWQtb2ZmLWJ5OiBBbGV4YW5kZXIgS2FuYXZpbiA8YWxleC5rYW5hdmluQGdt
YWlsLmNvbT4KICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspCiAKIGRpZmYgLS1naXQg
YS9jcGFuL0V4dFV0aWxzLU1ha2VNYWtlci9saWIvRXh0VXRpbHMvTU1fVW5peC5wbSBiL2NwYW4v
RXh0VXRpbHMtTWFrZU1ha2VyL2xpYi9FeHRVdGlscy9NTV9Vbml4LnBtCi1pbmRleCBmZTM4NTk4
Li4wODI4ZjUyIDEwMDY0NAoraW5kZXggNTcwZmU1Mi4uNDZmYWQxNSAxMDA2NDQKIC0tLSBhL2Nw
YW4vRXh0VXRpbHMtTWFrZU1ha2VyL2xpYi9FeHRVdGlscy9NTV9Vbml4LnBtCiArKysgYi9jcGFu
L0V4dFV0aWxzLU1ha2VNYWtlci9saWIvRXh0VXRpbHMvTU1fVW5peC5wbQotQEAgLTExNjEsNiAr
MTE2MSw5IEBAIFdBUk5JTkcKK0BAIC0xMTg4LDYgKzExODgsOSBAQCBXQVJOSU5HCiAgICAgIH0K
ICAKICAgICAgZm9yZWFjaCBteSAkbmFtZSAoQCRuYW1lcyl7CkBAIC0yNCw3ICsyNCw3IEBAIGlu
ZGV4IGZlMzg1OTguLjA4MjhmNTIgMTAwNjQ0CiAgICAgICAgICBteSAoJGFicywgJHVzZV9kaXIp
OwogICAgICAgICAgaWYgKCRzZWxmLT5maWxlX25hbWVfaXNfYWJzb2x1dGUoJG5hbWUpKSB7ICAg
ICAjIC9mb28vYmFyCiAgICAgICAgICAgICAgJGFicyA9ICRuYW1lOwotQEAgLTIwOTcsNiArMjEw
MCw3IEBAIHN1YiBpbml0X1BFUkwgeworQEAgLTIxMjAsNiArMjEyMyw3IEBAIHN1YiBpbml0X1BF
UkwgewogIAogICAgICAkc2VsZi0+e1BFUkx9IHx8PQogICAgICAgICAgJHNlbGYtPmZpbmRfcGVy
bCg1LjAsIFxAcGVybHMsIFxAZGVmcGF0aCwgJFZlcmJvc2UgKTsKZGlmZiAtLWdpdCBhL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9wZXJsL2ZpbGVzLzAwMDEtY3Bhbi1TeXMtU3lzbG9nLU1ha2VmaWxl
LlBMLUZpeC1fUEFUSF9MT0ctZm9yLWRldGVybS5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29s
cy9wZXJsL2ZpbGVzLzAwMDEtY3Bhbi1TeXMtU3lzbG9nLU1ha2VmaWxlLlBMLUZpeC1fUEFUSF9M
T0ctZm9yLWRldGVybS5wYXRjaAppbmRleCA3ZTVkMDhkOGRiLi4yMGQwNzYwM2I0IDEwMDY0NAot
LS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcGVybC9maWxlcy8wMDAxLWNwYW4tU3lzLVN5c2xv
Zy1NYWtlZmlsZS5QTC1GaXgtX1BBVEhfTE9HLWZvci1kZXRlcm0ucGF0Y2gKKysrIGIvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3BlcmwvZmlsZXMvMDAwMS1jcGFuLVN5cy1TeXNsb2ctTWFrZWZpbGUu
UEwtRml4LV9QQVRIX0xPRy1mb3ItZGV0ZXJtLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSAz
MjI5NzIzODRlMDc5NWJlMzM5MjUyZjdjZjlhMzE4ZGM3NTliNTFlIE1vbiBTZXAgMTcgMDA6MDA6
MDAgMjAwMQorRnJvbSA1NGQzYzdjOWRmY2Y3ZjU1MTA1NDkyZTk0NjcyMmMxNjEyYmE3ZDNlIE1v
biBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogUm9iZXJ0IFlhbmcgPGxpZXpoaS55YW5nQHdp
bmRyaXZlci5jb20+CiBEYXRlOiBGcmksIDE4IEZlYiAyMDIyIDA5OjQ0OjI2ICswMDAwCiBTdWJq
ZWN0OiBbUEFUQ0hdIGNwYW4vU3lzLVN5c2xvZy9NYWtlZmlsZS5QTDogRml4IF9QQVRIX0xPRyBm
b3IgZGV0ZXJtaW5pc3RpYwpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3Blcmwv
ZmlsZXMvMDAwMi1Db25zdGFudC1GaXgtdXAtc2hlYmFuZy5wYXRjaCBiL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9wZXJsL2ZpbGVzLzAwMDItQ29uc3RhbnQtRml4LXVwLXNoZWJhbmcucGF0Y2gKaW5k
ZXggODA5ODZlNjZkYS4uNTA2YzRkN2I0ZCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3BlcmwvZmlsZXMvMDAwMi1Db25zdGFudC1GaXgtdXAtc2hlYmFuZy5wYXRjaAorKysgYi9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcGVybC9maWxlcy8wMDAyLUNvbnN0YW50LUZpeC11cC1zaGVi
YW5nLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSBhMDIzNTViZGM4Y2RlMTExNWRhZjEwMTY3
NWNkZmI3MDdkMzM3YmYxIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBkNmVhMTRkMThh
ZTI5NjFiNjc4YThmMTBjOGU3MDhkYjYwMmNhYTllIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQog
RnJvbTogSm9zaHVhIFdhdHQgPEpQRVdoYWNrZXJAZ21haWwuY29tPgogRGF0ZTogTW9uLCAxNyBK
dW4gMjAxOSAxMDo0NzoyMyAtMDUwMAogU3ViamVjdDogW1BBVENIXSBDb25zdGFudDogRml4IHVw
IHNoZWJhbmcKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9wZXJsL2ZpbGVzL2Rl
dGVybWluaXNtLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3BlcmwvZmlsZXMvZGV0ZXJt
aW5pc20ucGF0Y2gKaW5kZXggYmRiOWE5MjhiYi4uZWU0ZTU5ZTRhNSAxMDA2NDQKLS0tIGEvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3BlcmwvZmlsZXMvZGV0ZXJtaW5pc20ucGF0Y2gKKysrIGIvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3BlcmwvZmlsZXMvZGV0ZXJtaW5pc20ucGF0Y2gKQEAgLTEsNCAr
MSw0IEBACi1Gcm9tIDVjNGZkNTdkYWYxMjUzNTcyNjJhYTc5NjA1N2Q3YmU4ZTc4ZDM3OGUgTW9u
IFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIGM4Njk2ZTI2NWRjZWI4ZjFjODg3ZWU2N2RmOWVl
ZmU1N2FmYWY4MjUgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBSaWNoYXJkIFB1cmRp
ZSA8cmljaGFyZC5wdXJkaWVAbGludXhmb3VuZGF0aW9uLm9yZz4KIERhdGU6IFdlZCwgNSBGZWIg
MjAyMCAyMzo1NDowMiArMDAwMAogU3ViamVjdDogW1BBVENIXSBGaXhlcyB0byBtYWtlIHRoZSBw
ZXJsIGJ1aWxkIHJlcHJvZHVjaWJsZToKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29s
cy9wZXJsL2ZpbGVzL2VuY29kZWZpeC5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9wZXJs
L2ZpbGVzL2VuY29kZWZpeC5wYXRjaAppbmRleCA2NjU2OTlkMTJkLi4zMDBhM2Y3NGEwIDEwMDY0
NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcGVybC9maWxlcy9lbmNvZGVmaXgucGF0Y2gK
KysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3BlcmwvZmlsZXMvZW5jb2RlZml4LnBhdGNoCkBA
IC0xLDQgKzEsNCBAQAotRnJvbSBhNGUyMmM3ZjJhNTE5ZjI0YmM4YWE4OWM2Njc3MDE3YzBmZTEz
Njc5IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSAyNzQzNjRkMGFlMzY0ZGRmOGVlZTgw
MzY3ZDZhNzBmMDVjYjVjYmNkIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogUmljaGFy
ZCBQdXJkaWUgPHJpY2hhcmQucHVyZGllQGxpbnV4Zm91bmRhdGlvbi5vcmc+CiBEYXRlOiBUdWUs
IDE4IEZlYiAyMDIwIDE3OjI3OjI2ICswMDAwCiBTdWJqZWN0OiBbUEFUQ0hdIHBlcmw6IEZpeCBl
bmNvZGUgbW9kdWxlIHJlcHJvZHVjaWJpbGl0eSBpc3N1ZXMKZGlmZiAtLWdpdCBhL21ldGEvcmVj
aXBlcy1kZXZ0b29scy9wZXJsL2ZpbGVzL2Vycm5vX3Zlci5kaWZmIGIvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL3BlcmwvZmlsZXMvZXJybm9fdmVyLmRpZmYKaW5kZXggNDc3NjQyZjQ1Ny4uZjQ1MjAw
NjdmMyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3BlcmwvZmlsZXMvZXJybm9f
dmVyLmRpZmYKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3BlcmwvZmlsZXMvZXJybm9fdmVy
LmRpZmYKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDljNDA0ZDRiMWMzNjA3ZTgyN2ZiNTZiNWFlNGY4
ZmJiZGI1MmNkMGIgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIGEzYmUwNzY2NTIwMWEz
ZWRlYmI0YWRkMTQzZGYyMWY0NmVkMmUyMGIgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9t
OiBCcmVuZGFuIE8nRGVhIDxib2RAZGViaWFuLm9yZz4KIERhdGU6IEZyaSwgMTYgRGVjIDIwMDUg
MDE6MzI6MTQgKzExMDAKIFN1YmplY3Q6IFtQQVRDSF0gUmVtb3ZlIEVycm5vIHZlcnNpb24gY2hl
Y2sgZHVlIHRvIHVwZ3JhZGUgcHJvYmxlbXMgd2l0aApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3BlcmwvZmlsZXMvbmF0aXZlLXBlcmxpbmMucGF0Y2ggYi9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcGVybC9maWxlcy9uYXRpdmUtcGVybGluYy5wYXRjaAppbmRleCA3ZTNlNWY2NjUy
Li43YzNiYjZkMjZmIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcGVybC9maWxl
cy9uYXRpdmUtcGVybGluYy5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcGVybC9m
aWxlcy9uYXRpdmUtcGVybGluYy5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gOWZlYzYyYjE5
YTQ5ZDE0NTFmZDExMjBjNWRjMzhiYWY1OWY3Mzg1NiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEK
K0Zyb20gNzhjM2VhYTJlMzk5YzcxNzlhNDM1YjljMTI3ZDkyNWMwNDUxOWE4MyBNb24gU2VwIDE3
IDAwOjAwOjAwIDIwMDEKIEZyb206IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4LmthbmF2aW5AZ21h
aWwuY29tPgogRGF0ZTogV2VkLCAzMCBNYXkgMjAwNyAwOTozMzozMiArMDAwMAogU3ViamVjdDog
W1BBVENIXSBwZXJsOiBzeW5jIHdpdGggT0UKQEAgLTEwLDEwICsxMCwxMCBAQCBTaWduZWQtb2Zm
LWJ5OiBBbGV4YW5kZXIgS2FuYXZpbiA8YWxleC5rYW5hdmluQGdtYWlsLmNvbT4KICAxIGZpbGUg
Y2hhbmdlZCwgMTMgaW5zZXJ0aW9ucygrKQogCiBkaWZmIC0tZ2l0IGEvY3Bhbi9FeHRVdGlscy1N
YWtlTWFrZXIvbGliL0V4dFV0aWxzL01NX1VuaXgucG0gYi9jcGFuL0V4dFV0aWxzLU1ha2VNYWtl
ci9saWIvRXh0VXRpbHMvTU1fVW5peC5wbQotaW5kZXggMDgyOGY1Mi4uYjhhYmZmNCAxMDA2NDQK
K2luZGV4IDQ2ZmFkMTUuLmU1NDMxNzggMTAwNjQ0CiAtLS0gYS9jcGFuL0V4dFV0aWxzLU1ha2VN
YWtlci9saWIvRXh0VXRpbHMvTU1fVW5peC5wbQogKysrIGIvY3Bhbi9FeHRVdGlscy1NYWtlTWFr
ZXIvbGliL0V4dFV0aWxzL01NX1VuaXgucG0KLUBAIC0xODYyLDYgKzE4NjIsMTkgQEAgZnJvbSB0
aGUgcGVybCBzb3VyY2UgdHJlZS4KK0BAIC0xODkyLDYgKzE4OTIsMTkgQEAgZnJvbSB0aGUgcGVy
bCBzb3VyY2UgdHJlZS4KICAJJHNlbGYtPntQRVJMX0xJQn0gICAgIHx8PSAkQ29uZmlne3ByaXZs
aWJleHB9OwogIAkkc2VsZi0+e1BFUkxfQVJDSExJQn0gfHw9ICRDb25maWd7YXJjaGxpYmV4cH07
CiAgCSRzZWxmLT57UEVSTF9JTkN9ICAgICA9ICRzZWxmLT5jYXRkaXIoIiRzZWxmLT57UEVSTF9B
UkNITElCfSIsIkNPUkUiKTsgIyB3aWxkIGd1ZXNzIGZvciBub3cKZGlmZiAtLWdpdCBhL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9wZXJsL2ZpbGVzL3BlcmwtY29uZmlncG0tc3dpdGNoLnBhdGNoIGIv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3BlcmwvZmlsZXMvcGVybC1jb25maWdwbS1zd2l0Y2gucGF0
Y2gKaW5kZXggMzcyMTI3NzkzMy4uZTRlZjJlZGY2NiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3BlcmwvZmlsZXMvcGVybC1jb25maWdwbS1zd2l0Y2gucGF0Y2gKKysrIGIvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3BlcmwvZmlsZXMvcGVybC1jb25maWdwbS1zd2l0Y2gucGF0Y2gK
QEAgLTEsNCArMSw0IEBACi1Gcm9tIDdhNDg1MzhhN2U4NjE0YTMzNDIxNTFiNjQ2ZDIxMDVjMGNi
MGNkZDkgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDRiNWYyNzI3YmNmZDQzOTEzMGVj
NjIxZDc5Nzc2MjQ2N2JjNjA3ZTUgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBBbGV4
YW5kZXIgS2FuYXZpbiA8YWxleC5rYW5hdmluQGdtYWlsLmNvbT4KIERhdGU6IFN1biwgMjcgTWF5
IDIwMDcgMjE6MDQ6MTEgKzAwMDAKIFN1YmplY3Q6IFtQQVRDSF0gcGVybDogNS44LjcgLT4gNS44
LjggKGZyb20gT0UpCkBAIC0xOSw3ICsxOSw3IEBAIFNpZ25lZC1vZmYtYnk6IEFsZXhhbmRlciBL
YW5hdmluIDxhbGV4LmthbmF2aW5AZ21haWwuY29tPgogIDEgZmlsZSBjaGFuZ2VkLCAxNiBpbnNl
cnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQogCiBkaWZmIC0tZ2l0IGEvY29uZmlncG0gYi9jb25m
aWdwbQotaW5kZXggMDcyMTlkOC4uMDFhMjNmYSAxMDA3NTUKK2luZGV4IDBjNDZiOWUuLjFkYWVi
ZWYgMTAwNzU1CiAtLS0gYS9jb25maWdwbQogKysrIGIvY29uZmlncG0KIEBAIC03MTgsNyArNzE4
LDcgQEAgJGNvbmZpZ190eHQgLj0gdW5jb21tZW50IDw8J0VORE9GRU5EJzsKZGlmZiAtLWdpdCBh
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9wZXJsL2ZpbGVzL3BlcmwtZHlubG9hZGVyLnBhdGNoIGIv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3BlcmwvZmlsZXMvcGVybC1keW5sb2FkZXIucGF0Y2gKaW5k
ZXggNTQ3MjYwMmQzYS4uNzgyZjZlMzhkZSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3BlcmwvZmlsZXMvcGVybC1keW5sb2FkZXIucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL3BlcmwvZmlsZXMvcGVybC1keW5sb2FkZXIucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1G
cm9tIDI1YTI2YzUyYzMyMGU2OTliMzdhN2FkMWY0ZjA0NWJjOGFhNGNiMDAgTW9uIFNlcCAxNyAw
MDowMDowMCAyMDAxCitGcm9tIDA3MGEzMmExYzM2YzBmYTNjMDM2NmY3ZWM5ZGM0ZGIyZWM4Y2M1
ZDAgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBSaWNoYXJkIFB1cmRpZSA8cmljaGFy
ZEBvcGVuZWRoYW5kLmNvbT4KIERhdGU6IFN1biwgMjcgTWF5IDIwMDcgMjE6MDQ6MTEgKzAwMDAK
IFN1YmplY3Q6IFtQQVRDSF0gcGVybDogNS44LjcgLT4gNS44LjggKGZyb20gT0UpCmRpZmYgLS1n
aXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcGVybC9wZXJsLXB0ZXN0LmluYyBiL21ldGEvcmVj
aXBlcy1kZXZ0b29scy9wZXJsL3BlcmwtcHRlc3QuaW5jCmluZGV4IDRiNDc1NjExOGMuLjA4MzBm
ZjViMmEgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9wZXJsL3BlcmwtcHRlc3Qu
aW5jCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9wZXJsL3BlcmwtcHRlc3QuaW5jCkBAIC0x
LDYgKzEsMTYgQEAKIGluaGVyaXQgcHRlc3QKIAotU1JDX1VSSSArPSAiZmlsZTovL3J1bi1wdGVz
dCBcCitTUkNfVVJJID0gImh0dHBzOi8vd3d3LmNwYW4ub3JnL3NyYy81LjAvcGVybC0ke1BWfS50
YXIuZ3o7bmFtZT1wZXJsIFwKKyAgICAgICAgICAgZmlsZTovL3BlcmwtcmRlcGVuZHMudHh0IFwK
KyAgICAgICAgICAgZmlsZTovLzAwMDEtU29tZWhvdy10aGlzLW1vZHVsZS1icmVha3MtdGhyb3Vn
aC10aGUtcGVybC13cmFwcGVyLS5wYXRjaCBcCisgICAgICAgICAgIGZpbGU6Ly9lcnJub192ZXIu
ZGlmZiBcCisgICAgICAgICAgIGZpbGU6Ly9uYXRpdmUtcGVybGluYy5wYXRjaCBcCisgICAgICAg
ICAgIGZpbGU6Ly9wZXJsLWR5bmxvYWRlci5wYXRjaCBcCisgICAgICAgICAgIGZpbGU6Ly8wMDAy
LUNvbnN0YW50LUZpeC11cC1zaGViYW5nLnBhdGNoIFwKKyAgICAgICAgICAgZmlsZTovL2RldGVy
bWluaXNtLnBhdGNoIFwKKyAgICAgICAgICAgZmlsZTovLzAwMDEtY3Bhbi1TeXMtU3lzbG9nLU1h
a2VmaWxlLlBMLUZpeC1fUEFUSF9MT0ctZm9yLWRldGVybS5wYXRjaCBcCisgICAgICAgICAgIGZp
bGU6Ly9ydW4tcHRlc3QgXAorICAgICAgICAgICBmaWxlOi8vcGVybC1jb25maWdwbS1zd2l0Y2gu
cGF0Y2ggXAogICAgICAgICAgICAiCiAKIERFQlVHX1BSRUZJWF9NQVBfUkVHRVggPSAiJHtAJ1xc
fCcuam9pbihkLmdldFZhcignREVCVUdfUFJFRklYX01BUCcpLnNwbGl0KCkpfSIKZGlmZiAtLWdp
dCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9wZXJsL3BlcmxfNS40Mi4wLmJiIGIvbWV0YS9yZWNp
cGVzLWRldnRvb2xzL3BlcmwvcGVybF81LjQyLjIuYmIKc2ltaWxhcml0eSBpbmRleCA5OSUKcmVu
YW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3BlcmwvcGVybF81LjQyLjAuYmIKcmVuYW1l
IHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9wZXJsL3BlcmxfNS40Mi4yLmJiCmluZGV4IGNmMjgw
NjdiYWIuLmFjMDJjN2M3NWIgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9wZXJs
L3BlcmxfNS40Mi4wLmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9wZXJsL3BlcmxfNS40
Mi4yLmJiCkBAIC0yNCw3ICsyNCw3IEBAIFNSQ19VUkk6YXBwZW5kOmNsYXNzLXRhcmdldCA9ICIg
XAogICAgICAgICAgICBmaWxlOi8vZW5jb2RlZml4LnBhdGNoIFwKICIKIAotU1JDX1VSSVtwZXJs
LnNoYTI1NnN1bV0gPSAiZTA5M2VmMTg0ZDdmOWExYjk3OTdlMjQ2NTI5NmY1NTUxMGFkYjZkYWI4
ODQyYjBjM2VkNTMzMjk2NjMwOTZkYyIKK1NSQ19VUklbcGVybC5zaGEyNTZzdW1dID0gIjkzODRl
OGRlYjc1YjdiMTY5NWU1NjM3OTcxYjc1MjI4MWFhZWNkMDI1YTNkNWQ0NzM0ZDMzYzFkMGFkZmVl
NDciCiAKIEIgPSAiJHtXT1JLRElSfS9wZXJsLSR7UFZ9LWJ1aWxkIgogCi0tIAoyLjQ3LjEKCg==

--===============4230332934482229906==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 950 .bb files complete (0 cached, 950 parsed). 1975 targets, 40 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "6.0.99+snapshot-e368f357cab1513169294c3d1ec11655cbaee476"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:e368f357cab1513169294c3d1ec11655cbaee476"
meta-yocto-bsp       
meta-poky            = "master:d13ca2a2e0f478046d920b8fc7dd3098952b5ad8"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 518 Local 133 Mirrors 0 Missed 385 Current 367 (25% match, 56% complete)
done.
Removing 3 stale sstate objects for arch allarch...done.
Removing 147 stale sstate objects for arch x86-64-v3...done.
Removing 47 stale sstate objects for arch x86_64...done.
Removing 60 stale sstate objects for arch qemux86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 457 of 885 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 468 of 885 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/make/make_4.4.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 488 of 885 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/dejagnu/dejagnu_1.6.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 494 of 885 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/expect/expect_5.45.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 496 of 885 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/perl/perl_5.42.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 501 of 885 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/dpkg/dpkg_1.23.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 510 of 885 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/cross-localedef-native_2.43.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 511 of 885 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc-locale_2.43.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 515 of 885 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 524 of 885 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 530 of 885 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/gawk/gawk_5.4.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 535 of 885 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/sed/sed_4.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 541 of 885 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 562 of 885 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 565 of 885 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 588 of 885 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/readline/readline_8.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe cross-localedef-native-2.43+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ptest-runner-2.5.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe dejagnu-1.6.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe make-4.4.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe glibc-locale-2.43+git-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe perl-5.42.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe mpfr-4.2.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gawk-5.4.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe psmisc-23.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe sed-4.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe readline-8.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe expect-native-5.45.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-native-0.7.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe dpkg-native-1.23.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe ptest-runner-2.5.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe dejagnu-1.6.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 604 of 885 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe make-4.4.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe glibc-locale-2.43+git-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 616 of 885 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/docbook-xml/docbook-xml-dtd4_4.5.bb:do_create_spdx_setscene)
NOTE: Running setscene task 635 of 885 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/dejagnu/dejagnu_1.6.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 637 of 885 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/docbook-xml/docbook-xsl-stylesheets_1.79.1.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 639 of 885 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe perl-5.42.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 650 of 885 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libseccomp-2.6.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe psmisc-23.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe sed-4.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 671 of 885 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland-protocols_1.48.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gawk-5.4.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe mpfr-4.2.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe readline-8.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 688 of 885 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/xmlto/xmlto_0.0.29.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 693 of 885 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 699 of 885 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.88.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 702 of 885 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 707 of 885 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/docbook-xml/docbook-xsl-stylesheets_1.79.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe opkg-utils-native-0.7.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 709 of 885 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_recipe_qa_setscene)
NOTE: recipe dpkg-native-1.23.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 721 of 885 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.25.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe cross-localedef-native-2.43+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 723 of 885 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.47.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe base-passwd-3.6.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe dejagnu-1.6.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe expect-native-5.45.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 725 of 885 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe docbook-xml-dtd4-native-4.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe docbook-xsl-stylesheets-native-1.79.1-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe wayland-protocols-1.48-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe psmisc-23.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-ng-0.9.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe mpfr-4.2.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe glib-2.0-initial-1_2.88.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xmlto-native-0.0.29-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe docbook-xsl-stylesheets-native-1.79.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-passwd-3.6.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpcre2-10.47-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe dejagnu-1.6.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 745 of 885 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 748 of 885 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/tcltk8/tcl8_8.6.17.bb:do_populate_sysroot_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe wayland-protocols-1.48-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe wayland-native-1.25.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 772 of 885 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe docbook-xml-dtd4-native-4.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe docbook-xsl-stylesheets-native-1.79.1-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 777 of 885 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/cross-localedef-native_2.43.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 779 of 885 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/expect/expect_5.45.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 782 of 885 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe psmisc-23.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 785 of 885 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20251016-3.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libcap-ng-0.9.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe mpfr-4.2.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 787 of 885 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe glib-2.0-initial-1_2.88.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxml2-2.15.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 798 of 885 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.88.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 828 of 885 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20251016-3.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 836 of 885 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/perl-cross/perlcross_1.6.4.bb:do_create_spdx_setscene)
NOTE: recipe xmlto-native-0.0.29-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe docbook-xsl-stylesheets-native-1.79.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 837 of 885 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/make/make_4.4.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 857 of 885 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.19.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libpcre2-10.47-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 872 of 885 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/cmake/cmake-native_4.3.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe wayland-native-1.25.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 875 of 885 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xcb-proto-1.17.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe cross-localedef-native-2.43+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxml2-2.15.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 877 of 885 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/perl/perl_5.42.2.bb:do_recipe_qa_setscene)
NOTE: recipe libedit-20251016-3.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe tcl8-native-8.6.17-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cmake-native-4.3.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe glib-2.0-initial-1_2.88.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe perlcross-native-1.6.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe expect-native-5.45.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libedit-native-20251016-3.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe cross-localedef-native-2.43+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe make-native-4.4.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe glib-2.0-native-1_2.88.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe curl-native-8.19.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libedit-20251016-3.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe cmake-native-4.3.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe glib-2.0-initial-1_2.88.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe expect-native-5.45.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe openssl-native-3.5.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe perlcross-native-1.6.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 878 of 885 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/perl-cross/perlcross_1.6.4.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libedit-native-20251016-3.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 881 of 885 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20251016-3.1.bb:do_create_recipe_spdx_setscene)
NOTE: recipe perl-native-5.42.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe glib-2.0-native-1_2.88.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe make-native-4.4.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 882 of 885 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/make/make_4.4.1.bb:do_create_recipe_spdx_setscene)
NOTE: recipe curl-native-8.19.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe openssl-native-3.5.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 157 of 2124 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.6.bb:do_fetch)
NOTE: Running task 178 of 2124 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/cmake/cmake-native_4.3.2.bb:do_fetch)
NOTE: recipe perl-native-5.42.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 211 of 2124 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/perl/perl_5.42.2.bb:do_fetch)
NOTE: recipe perlcross-native-1.6.4-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe tcl8-native-8.6.17-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 885 of 885 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/tcltk8/tcl8_8.6.17.bb:do_recipe_qa_setscene)
NOTE: recipe libedit-native-20251016-3.1-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe cmake-native-4.3.2-r0: task do_fetch: Started
NOTE: recipe make-native-4.4.1-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe cmake-native-4.3.2-r0: task do_fetch: Succeeded
NOTE: Running task 366 of 2124 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/cmake/cmake-native_4.3.2.bb:do_unpack)
NOTE: recipe perlcross-native-1.6.4-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe openssl-native-3.5.6-r0: task do_fetch: Started
NOTE: recipe libedit-native-20251016-3.1-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe openssl-native-3.5.6-r0: task do_fetch: Succeeded
NOTE: recipe perl-native-5.42.2-r0: task do_fetch: Started
NOTE: recipe make-native-4.4.1-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running task 481 of 2124 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.6.bb:do_unpack)
NOTE: recipe cmake-native-4.3.2-r0: task do_unpack: Started
NOTE: recipe perl-native-5.42.2-r0: task do_fetch: Succeeded
NOTE: Running task 536 of 2124 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/perl/perl_5.42.2.bb:do_unpack)
NOTE: recipe tcl8-native-8.6.17-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 537 of 2124 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/perl/perl_5.42.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 608 of 2124 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/perl/perl_5.42.2.bb:do_create_recipe_spdx)
NOTE: Running task 625 of 2124 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.47.bb:do_fetch)
NOTE: Running task 631 of 2124 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.19.0.bb:do_fetch)
NOTE: Running task 639 of 2124 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.0.bb:do_fetch)
NOTE: recipe tcl8-native-8.6.17-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 739 of 2124 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.0.bb:do_write_config)
NOTE: recipe openssl-native-3.5.6-r0: task do_unpack: Started
NOTE: Running task 832 of 2124 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.88.0.bb:do_fetch)
NOTE: recipe perl-native-5.42.2-r0: task do_unpack: Started
NOTE: recipe perl-native-5.42.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 867 of 2124 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.3.bb:do_fetch)
NOTE: Running task 870 of 2124 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.1.bb:do_fetch)
NOTE: Running task 882 of 2124 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20251016-3.1.bb:do_fetch)
NOTE: recipe libpcre2-10.47-r0: task do_fetch: Started
NOTE: Running task 902 of 2124 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.88.0.bb:do_write_config)
NOTE: Running task 923 of 2124 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.25.0.bb:do_fetch)
NOTE: Running task 930 of 2124 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.0.bb:do_fetch)
NOTE: recipe libpcre2-10.47-r0: task do_fetch: Succeeded
NOTE: recipe perl-native-5.42.2-r0: task do_create_recipe_spdx: Started
NOTE: Running task 931 of 2124 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.47.bb:do_unpack)
NOTE: recipe curl-native-8.19.0-r0: task do_fetch: Started
NOTE: recipe curl-native-8.19.0-r0: task do_fetch: Succeeded
NOTE: recipe glib-2.0-native-1_2.88.0-r0: task do_fetch: Started
NOTE: Running task 932 of 2124 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.19.0.bb:do_unpack)
NOTE: recipe glib-2.0-initial-1_2.88.0-r0: task do_fetch: Started
NOTE: recipe glib-2.0-native-1_2.88.0-r0: task do_fetch: Succeeded
NOTE: recipe libedit-20251016-3.1-r0: task do_fetch: Started
NOTE: recipe libcap-ng-0.9.1-r0: task do_fetch: Started
NOTE: Running task 933 of 2124 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.0.bb:do_unpack)
NOTE: recipe libxml2-2.15.3-r0: task do_fetch: Started
NOTE: recipe glib-2.0-initial-1_2.88.0-r0: task do_fetch: Succeeded
NOTE: recipe libedit-20251016-3.1-r0: task do_fetch: Succeeded
NOTE: recipe glib-2.0-native-1_2.88.0-r0: task do_write_config: Started
NOTE: Running task 934 of 2124 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.88.0.bb:do_unpack)
NOTE: recipe libxml2-2.15.3-r0: task do_fetch: Succeeded
NOTE: recipe perl-native-5.42.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 935 of 2124 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20251016-3.1.bb:do_unpack)
NOTE: Running task 936 of 2124 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.3.bb:do_unpack)
NOTE: recipe libpcre2-10.47-r0: task do_unpack: Started
NOTE: Running task 939 of 2124 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_fetch)
NOTE: recipe glib-2.0-initial-1_2.88.0-r0: task do_write_config: Started
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_fetch: Started
NOTE: recipe wayland-native-1.25.0-r0: task do_fetch: Started
NOTE: recipe glib-2.0-native-1_2.88.0-r0: task do_write_config: Succeeded
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_fetch: Succeeded
NOTE: recipe wayland-native-1.25.0-r0: task do_fetch: Succeeded
NOTE: Running task 951 of 2124 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.0.bb:do_unpack)
NOTE: Running task 962 of 2124 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_fetch)
NOTE: Running task 963 of 2124 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.25.0.bb:do_unpack)
NOTE: recipe glib-2.0-initial-1_2.88.0-r0: task do_write_config: Succeeded
NOTE: Running task 967 of 2124 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/docbook-xml/docbook-xsl-stylesheets_1.79.1.bb:do_fetch)
NOTE: recipe curl-native-8.19.0-r0: task do_unpack: Started
NOTE: recipe libedit-20251016-3.1-r0: task do_unpack: Started
NOTE: recipe glib-2.0-initial-1_2.88.0-r0: task do_unpack: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_fetch: Started
NOTE: recipe libxml2-2.15.3-r0: task do_unpack: Started
NOTE: recipe glib-2.0-native-1_2.88.0-r0: task do_unpack: Started
NOTE: recipe perl-native-5.42.2-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe libedit-20251016-3.1-r0: task do_unpack: Succeeded
NOTE: Running task 968 of 2124 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.6.bb:do_create_recipe_spdx)
NOTE: Running task 969 of 2124 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20251016-3.1.bb:do_patch)
NOTE: recipe util-macros-1_1.20.2-r0: task do_fetch: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_fetch: Succeeded
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_unpack: Started
NOTE: Running task 970 of 2124 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.25.0.bb:do_write_config)
NOTE: recipe docbook-xsl-stylesheets-native-1.79.1-r0: task do_fetch: Started
NOTE: recipe wayland-native-1.25.0-r0: task do_unpack: Started
NOTE: recipe libedit-20251016-3.1-r0: task do_patch: Started
NOTE: recipe libcap-ng-0.9.1-r0: task do_fetch: Succeeded
NOTE: Running task 971 of 2124 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.1.bb:do_unpack)
NOTE: recipe openssl-native-3.5.6-r0: task do_create_recipe_spdx: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_fetch: Succeeded
NOTE: Running task 972 of 2124 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_unpack)
NOTE: recipe wayland-native-1.25.0-r0: task do_write_config: Started
NOTE: recipe libcap-ng-0.9.1-r0: task do_unpack: Started
NOTE: recipe wayland-native-1.25.0-r0: task do_write_config: Succeeded
NOTE: recipe libpcre2-10.47-r0: task do_unpack: Succeeded
NOTE: recipe wayland-native-1.25.0-r0: task do_unpack: Succeeded
NOTE: Running task 973 of 2124 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.47.bb:do_patch)
NOTE: Running task 974 of 2124 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.25.0.bb:do_patch)
NOTE: Running task 981 of 2124 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.0.bb:do_write_config)
NOTE: recipe libseccomp-2.6.0-r0: task do_unpack: Started
NOTE: recipe libedit-20251016-3.1-r0: task do_patch: Succeeded
NOTE: Running task 984 of 2124 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_unpack)
NOTE: recipe curl-native-8.19.0-r0: task do_unpack: Succeeded
NOTE: recipe openssl-native-3.5.6-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 985 of 2124 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.19.0.bb:do_patch)
NOTE: recipe libpcre2-10.47-r0: task do_patch: Started
NOTE: Running task 986 of 2124 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/cmake/cmake-native_4.3.2.bb:do_create_recipe_spdx)
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_write_config: Started
NOTE: recipe wayland-native-1.25.0-r0: task do_patch: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_unpack: Started
NOTE: recipe cmake-native-4.3.2-r0: task do_create_recipe_spdx: Started
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_write_config: Succeeded
NOTE: recipe util-macros-1_1.20.2-r0: task do_unpack: Succeeded
NOTE: Running task 988 of 2124 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_patch)
NOTE: Running task 992 of 2124 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_fetch)
NOTE: recipe glib-2.0-initial-1_2.88.0-r0: task do_unpack: Succeeded
NOTE: Running task 993 of 2124 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.88.0.bb:do_patch)
NOTE: recipe libpcre2-10.47-r0: task do_patch: Succeeded
NOTE: Running task 997 of 2124 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/xmlto/xmlto_0.0.29.bb:do_fetch)
NOTE: recipe curl-native-8.19.0-r0: task do_patch: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_patch: Started
NOTE: recipe base-passwd-3.6.8-r0: task do_fetch: Started
NOTE: recipe glib-2.0-initial-1_2.88.0-r0: task do_patch: Started
NOTE: recipe base-passwd-3.6.8-r0: task do_fetch: Succeeded
NOTE: Running task 1003 of 2124 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_unpack)
NOTE: recipe wayland-native-1.25.0-r0: task do_patch: Succeeded
NOTE: recipe libxml2-2.15.3-r0: task do_unpack: Succeeded
NOTE: recipe xmlto-native-0.0.29-r0: task do_fetch: Started
NOTE: Running task 1023 of 2124 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_fetch)
NOTE: Running task 1024 of 2124 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.3.bb:do_patch)
NOTE: recipe curl-native-8.19.0-r0: task do_patch: Succeeded
NOTE: Running task 1026 of 2124 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_fetch)
NOTE: recipe cmake-native-4.3.2-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 1027 of 2124 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.1.bb:do_create_recipe_spdx)
NOTE: recipe perl-native-5.42.2-r0: task do_unpack: Succeeded
NOTE: Running task 1028 of 2124 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/perl/perl_5.42.2.bb:do_patch)
NOTE: recipe base-passwd-3.6.8-r0: task do_unpack: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_fetch: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_fetch: Started
NOTE: recipe libxml2-2.15.3-r0: task do_patch: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_fetch: Succeeded
NOTE: Running task 1039 of 2124 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland-protocols_1.48.bb:do_fetch)
NOTE: recipe libpthread-stubs-0.5-r0: task do_fetch: Succeeded
NOTE: recipe util-macros-1_1.20.2-r0: task do_patch: Succeeded
NOTE: Running task 1048 of 2124 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_fetch)
NOTE: Running task 1061 of 2124 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/perl/perl_5.42.2.bb:do_fetch)
NOTE: recipe glib-2.0-native-1_2.88.0-r0: task do_unpack: Succeeded
NOTE: recipe expat-native-2.8.1-r0: task do_create_recipe_spdx: Started
NOTE: Running task 1062 of 2124 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.0.bb:do_patch)
NOTE: recipe perl-native-5.42.2-r0: task do_patch: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_fetch: Started
NOTE: recipe wayland-protocols-1.48-r0: task do_fetch: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_fetch: Succeeded
NOTE: Running task 1063 of 2124 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_unpack)
NOTE: recipe perl-5.42.2-r0: task do_fetch: Started
NOTE: recipe base-passwd-3.6.8-r0: task do_unpack: Succeeded
NOTE: Running task 1064 of 2124 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_patch)
NOTE: recipe perl-5.42.2-r0: task do_fetch: Succeeded
NOTE: Running task 1065 of 2124 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_unpack)
NOTE: recipe libxml2-2.15.3-r0: task do_patch: Succeeded
NOTE: recipe libseccomp-2.6.0-r0: task do_unpack: Succeeded
NOTE: Running task 1084 of 2124 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/procps/procps_4.0.6.bb:do_fetch)
NOTE: Running task 1085 of 2124 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_patch)
NOTE: recipe glib-2.0-native-1_2.88.0-r0: task do_patch: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_unpack: Started
NOTE: recipe libcap-ng-0.9.1-r0: task do_unpack: Succeeded
NOTE: recipe openssl-native-3.5.6-r0: task do_unpack: Succeeded
NOTE: Running task 1086 of 2124 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.1.bb:do_patch)
NOTE: Running task 1087 of 2124 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.6.bb:do_patch)
NOTE: recipe base-passwd-3.6.8-r0: task do_patch: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_unpack: Started
NOTE: recipe expat-native-2.8.1-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_unpack: Succeeded
NOTE: recipe libseccomp-2.6.0-r0: task do_patch: Started
NOTE: recipe procps-4.0.6-r0: task do_fetch: Started
NOTE: Running task 1088 of 2124 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.0.bb:do_patch)
NOTE: Running task 1089 of 2124 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.5.bb:do_create_recipe_spdx)
NOTE: recipe libcap-ng-0.9.1-r0: task do_patch: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_unpack: Succeeded
NOTE: Running task 1090 of 2124 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_patch)
NOTE: recipe cmake-native-4.3.2-r0: task do_unpack: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_unpack: Succeeded
NOTE: Running task 1091 of 2124 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/cmake/cmake-native_4.3.2.bb:do_patch)
NOTE: Running task 1092 of 2124 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_patch)
NOTE: recipe openssl-native-3.5.6-r0: task do_patch: Started
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_patch: Started
NOTE: recipe libcap-ng-0.9.1-r0: task do_patch: Succeeded
NOTE: Running task 1094 of 2124 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/sed/sed_4.10.bb:do_fetch)
NOTE: recipe xcb-proto-1.17.0-r0: task do_patch: Started
NOTE: recipe glib-2.0-initial-1_2.88.0-r0: task do_patch: Succeeded
NOTE: Running task 1102 of 2124 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_unpack)
NOTE: recipe cmake-native-4.3.2-r0: task do_patch: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_patch: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_patch: Succeeded
NOTE: recipe python3-native-3.14.5-r0: task do_create_recipe_spdx: Started
NOTE: Running task 1114 of 2124 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/perl/perl_5.42.2.bb:do_unpack)
NOTE: recipe cmake-native-4.3.2-r0: task do_patch: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_patch: Succeeded
NOTE: Running task 1128 of 2124 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland-protocols_1.48.bb:do_write_config)
NOTE: recipe shadow-sysroot-4.6-r0: task do_unpack: Started
NOTE: Running task 1164 of 2124 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_fetch)
NOTE: recipe sed-4.10-r0: task do_fetch: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_unpack: Succeeded
NOTE: Running task 1165 of 2124 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_patch)
NOTE: recipe sed-4.10-r0: task do_fetch: Succeeded
NOTE: Running task 1166 of 2124 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/sed/sed_4.10.bb:do_unpack)
NOTE: recipe perl-5.42.2-r0: task do_unpack: Started
NOTE: recipe wayland-protocols-1.48-r0: task do_write_config: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_patch: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_fetch: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_patch: Started
NOTE: Running task 1170 of 2124 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/readline/readline_8.3.bb:do_fetch)
NOTE: recipe gmp-6.3.0-r0: task do_fetch: Succeeded
NOTE: recipe wayland-protocols-1.48-r0: task do_write_config: Succeeded
NOTE: Running task 1171 of 2124 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_fetch)
NOTE: Running task 1173 of 2124 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/gawk/gawk_5.4.0.bb:do_fetch)
NOTE: recipe sed-4.10-r0: task do_unpack: Started
NOTE: recipe openssl-native-3.5.6-r0: task do_patch: Succeeded
NOTE: Running task 1175 of 2124 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_unpack)
NOTE: recipe readline-8.3-r0: task do_fetch: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_patch: Succeeded
NOTE: Running task 1178 of 2124 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb:do_fetch)
NOTE: recipe readline-8.3-r0: task do_fetch: Succeeded
NOTE: Running task 1179 of 2124 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/readline/readline_8.3.bb:do_unpack)
NOTE: recipe python3-native-3.14.5-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe mpfr-4.2.2-r0: task do_fetch: Started
NOTE: recipe gawk-5.4.0-r0: task do_fetch: Started
NOTE: recipe mpfr-4.2.2-r0: task do_fetch: Succeeded
NOTE: recipe gawk-5.4.0-r0: task do_fetch: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_unpack: Started
NOTE: Running task 1180 of 2124 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-flit-core_3.12.0.bb:do_create_recipe_spdx)
NOTE: Running task 1181 of 2124 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.3.bb:do_create_recipe_spdx)
NOTE: Running task 1182 of 2124 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_unpack)
NOTE: recipe base-passwd-3.6.8-r0: task do_patch: Succeeded
NOTE: Running task 1185 of 2124 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/gawk/gawk_5.4.0.bb:do_unpack)
NOTE: recipe ptest-runner-2.5.1-r0: task do_fetch: Started
NOTE: recipe readline-8.3-r0: task do_unpack: Started
NOTE: recipe sed-4.10-r0: task do_unpack: Succeeded
NOTE: Running task 1186 of 2124 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/sed/sed_4.10.bb:do_patch)
NOTE: recipe mpfr-4.2.2-r0: task do_unpack: Started
NOTE: recipe python3-flit-core-native-3.12.0-r0: task do_create_recipe_spdx: Started
NOTE: recipe glib-2.0-native-1_2.88.0-r0: task do_patch: Succeeded
NOTE: Running task 1189 of 2124 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_fetch)
NOTE: recipe gawk-5.4.0-r0: task do_unpack: Started
NOTE: recipe util-linux-native-2.41.3-r0: task do_create_recipe_spdx: Started
NOTE: recipe readline-8.3-r0: task do_unpack: Succeeded
NOTE: Running task 1190 of 2124 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/readline/readline_8.3.bb:do_patch)
NOTE: recipe sed-4.10-r0: task do_patch: Started
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_patch: Succeeded
NOTE: Running task 1207 of 2124 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/dejagnu/dejagnu_1.6.3.bb:do_fetch)
NOTE: recipe opkg-utils-native-0.7.0-r0: task do_fetch: Started
NOTE: recipe sed-4.10-r0: task do_patch: Succeeded
NOTE: Running task 1209 of 2124 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_fetch)
NOTE: recipe mpfr-4.2.2-r0: task do_unpack: Succeeded
NOTE: Running task 1210 of 2124 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_patch)
NOTE: recipe readline-8.3-r0: task do_patch: Started
NOTE: recipe ptest-runner-2.5.1-r0: task do_fetch: Succeeded
NOTE: recipe dejagnu-1.6.3-r0: task do_fetch: Started
NOTE: Running task 1211 of 2124 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb:do_unpack)
NOTE: recipe psmisc-23.7-r0: task do_fetch: Started
NOTE: recipe mpfr-4.2.2-r0: task do_patch: Started
NOTE: recipe python3-flit-core-native-3.12.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe ptest-runner-2.5.1-r0: task do_unpack: Started
NOTE: recipe opkg-utils-native-0.7.0-r0: task do_fetch: Succeeded
NOTE: recipe mpfr-4.2.2-r0: task do_patch: Succeeded
NOTE: Running task 1212 of 2124 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_unpack)
NOTE: Running task 1214 of 2124 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/make/make_4.4.1.bb:do_fetch)
NOTE: recipe util-linux-native-2.41.3-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 1215 of 2124 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-installer_1.0.1.bb:do_create_recipe_spdx)
NOTE: Running task 1217 of 2124 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/dpkg/dpkg_1.23.7.bb:do_fetch)
NOTE: recipe gawk-5.4.0-r0: task do_unpack: Succeeded
NOTE: Running task 1218 of 2124 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/gawk/gawk_5.4.0.bb:do_patch)
NOTE: recipe make-4.4.1-r0: task do_fetch: Started
NOTE: recipe make-4.4.1-r0: task do_fetch: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_unpack: Succeeded
NOTE: recipe opkg-utils-native-0.7.0-r0: task do_unpack: Started
NOTE: Running task 1231 of 2124 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/make/make_4.4.1.bb:do_unpack)
NOTE: Running task 1232 of 2124 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_patch)
NOTE: recipe python3-installer-native-1.0.1-r0: task do_create_recipe_spdx: Started
NOTE: recipe readline-8.3-r0: task do_patch: Succeeded
NOTE: recipe gawk-5.4.0-r0: task do_patch: Started
NOTE: recipe dpkg-native-1.23.7-r0: task do_fetch: Started
NOTE: recipe psmisc-23.7-r0: task do_fetch: Succeeded
NOTE: Running task 1255 of 2124 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_unpack)
NOTE: recipe make-4.4.1-r0: task do_unpack: Started
NOTE: recipe gmp-6.3.0-r0: task do_patch: Started
NOTE: recipe perl-5.42.2-r0: task do_unpack: Succeeded
NOTE: Running task 1256 of 2124 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/perl/perl_5.42.2.bb:do_patch)
NOTE: recipe gawk-5.4.0-r0: task do_patch: Succeeded
NOTE: recipe psmisc-23.7-r0: task do_unpack: Started
NOTE: recipe make-4.4.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-installer-native-1.0.1-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 1258 of 2124 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/make/make_4.4.1.bb:do_patch)
NOTE: Running task 1259 of 2124 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pyproject-hooks_1.2.0.bb:do_create_recipe_spdx)
NOTE: recipe perl-5.42.2-r0: task do_patch: Started
NOTE: recipe make-4.4.1-r0: task do_patch: Started
NOTE: recipe python3-pyproject-hooks-native-1.2.0-r0: task do_create_recipe_spdx: Started
NOTE: recipe wayland-protocols-1.48-r0: task do_fetch: Succeeded
NOTE: Running task 1260 of 2124 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland-protocols_1.48.bb:do_unpack)
NOTE: recipe gmp-6.3.0-r0: task do_patch: Succeeded
NOTE: recipe python3-pyproject-hooks-native-1.2.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe ptest-runner-2.5.1-r0: task do_unpack: Succeeded
NOTE: recipe make-4.4.1-r0: task do_patch: Succeeded
NOTE: Running task 1262 of 2124 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb:do_patch)
NOTE: Running task 1264 of 2124 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-build_1.5.0.bb:do_create_recipe_spdx)
NOTE: recipe opkg-utils-native-0.7.0-r0: task do_unpack: Succeeded
NOTE: Running task 1265 of 2124 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_patch)
NOTE: recipe wayland-protocols-1.48-r0: task do_unpack: Started
NOTE: recipe ptest-runner-2.5.1-r0: task do_patch: Started
NOTE: recipe python3-build-native-1.5.0-r0: task do_create_recipe_spdx: Started
NOTE: recipe docbook-xsl-stylesheets-native-1.79.1-r0: task do_fetch: Succeeded
NOTE: Running task 1266 of 2124 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/docbook-xml/docbook-xsl-stylesheets_1.79.1.bb:do_unpack)
NOTE: Running task 1267 of 2124 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/docbook-xml/docbook-xsl-stylesheets_1.79.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe opkg-utils-native-0.7.0-r0: task do_patch: Started
NOTE: recipe ptest-runner-2.5.1-r0: task do_patch: Succeeded
NOTE: recipe wayland-protocols-1.48-r0: task do_unpack: Succeeded
NOTE: recipe xmlto-native-0.0.29-r0: task do_fetch: Succeeded
NOTE: Running task 1269 of 2124 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland-protocols_1.48.bb:do_patch)
NOTE: Running task 1270 of 2124 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/xmlto/xmlto_0.0.29.bb:do_unpack)
NOTE: recipe docbook-xsl-stylesheets-native-1.79.1-r0: task do_unpack: Started
NOTE: recipe docbook-xsl-stylesheets-native-1.79.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe opkg-utils-native-0.7.0-r0: task do_patch: Succeeded
NOTE: recipe wayland-protocols-1.48-r0: task do_patch: Started
NOTE: recipe xmlto-native-0.0.29-r0: task do_unpack: Started
NOTE: recipe psmisc-23.7-r0: task do_unpack: Succeeded
NOTE: recipe docbook-xsl-stylesheets-native-1.79.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1272 of 2124 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_patch)
NOTE: recipe wayland-protocols-1.48-r0: task do_patch: Succeeded
NOTE: recipe python3-build-native-1.5.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe perl-5.42.2-r0: task do_patch: Succeeded
NOTE: Running task 1274 of 2124 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/perl/perl_5.42.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1275 of 2124 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-wheel_0.47.0.bb:do_create_recipe_spdx)
NOTE: Running task 1276 of 2124 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jinja2_3.1.6.bb:do_create_recipe_spdx)
NOTE: Running task 1277 of 2124 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/perl/perl_5.42.2.bb:do_populate_lic)
NOTE: recipe psmisc-23.7-r0: task do_patch: Started
NOTE: recipe perl-5.42.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe perl-5.42.2-r0: task do_populate_lic: Started
NOTE: recipe python3-wheel-native-0.47.0-r0: task do_create_recipe_spdx: Started
NOTE: recipe python3-jinja2-native-3.1.6-r0: task do_create_recipe_spdx: Started
NOTE: recipe psmisc-23.7-r0: task do_patch: Succeeded
NOTE: recipe perl-5.42.2-r0: task do_populate_lic: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/perl/perl_5.42.2.bb:do_populate_lic unihash changed to 9089fb62597913a600d862fe8e3f6b4fb802c1828b40da0f49675e6b8069de6a
NOTE: recipe perl-5.42.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-jinja2-native-3.1.6-r0: task do_create_recipe_spdx: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/perl/perl_5.42.2.bb:do_deploy_source_date_epoch unihash changed to ffc4321adf95774567c4577ef155facdbaac683fc7c6cb47fb254d836bac3366
NOTE: recipe python3-wheel-native-0.47.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1279 of 2124 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_82.0.1.bb:do_create_recipe_spdx)
NOTE: recipe xmlto-native-0.0.29-r0: task do_unpack: Succeeded
NOTE: Running task 1280 of 2124 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/xmlto/xmlto_0.0.29.bb:do_patch)
NOTE: recipe python3-setuptools-native-82.0.1-r0: task do_create_recipe_spdx: Started
NOTE: recipe dejagnu-1.6.3-r0: task do_fetch: Succeeded
NOTE: Running task 1281 of 2124 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/dejagnu/dejagnu_1.6.3.bb:do_unpack)
NOTE: recipe xmlto-native-0.0.29-r0: task do_patch: Started
NOTE: recipe xmlto-native-0.0.29-r0: task do_patch: Succeeded
NOTE: recipe dejagnu-1.6.3-r0: task do_unpack: Started
NOTE: recipe dejagnu-1.6.3-r0: task do_unpack: Succeeded
NOTE: Running task 1283 of 2124 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/dejagnu/dejagnu_1.6.3.bb:do_patch)
NOTE: recipe dejagnu-1.6.3-r0: task do_patch: Started
NOTE: recipe python3-setuptools-native-82.0.1-r0: task do_create_recipe_spdx: Succeeded
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
NOTE: recipe wayland-native-1.25.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe systemd-systemctl-native-259.5-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 1289 of 2124 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland-protocols_1.48.bb:do_create_recipe_spdx)
NOTE: recipe glib-2.0-native-1_2.88.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 1290 of 2124 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc_2.43.bb:do_create_recipe_spdx)
NOTE: Running task 1291 of 2124 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/qemu/qemu-native_10.2.0.bb:do_create_recipe_spdx)
NOTE: Running task 1292 of 2124 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_create_recipe_spdx)
NOTE: Running task 1293 of 2124 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_create_recipe_spdx)
NOTE: recipe wayland-protocols-1.48-r0: task do_create_recipe_spdx: Started
NOTE: recipe qemu-native-10.2.0-r0: task do_create_recipe_spdx: Started
NOTE: recipe glibc-2.43+git-r1: task do_create_recipe_spdx: Started
NOTE: recipe shared-mime-info-native-2.4-r0: task do_create_recipe_spdx: Started
NOTE: recipe gobject-introspection-native-1.86.0-r0: task do_create_recipe_spdx: Started
NOTE: recipe docbook-xsl-stylesheets-native-1.79.1-r0: task do_unpack: Succeeded
NOTE: Running task 1294 of 2124 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/docbook-xml/docbook-xsl-stylesheets_1.79.1.bb:do_patch)
NOTE: recipe docbook-xsl-stylesheets-native-1.79.1-r0: task do_patch: Started
NOTE: recipe wayland-protocols-1.48-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe qemu-native-10.2.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe gobject-introspection-native-1.86.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe shared-mime-info-native-2.4-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe glibc-2.43+git-r1: task do_create_recipe_spdx: Succeeded
NOTE: Running task 1295 of 2124 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_16.1.bb:do_create_recipe_spdx)
NOTE: recipe docbook-xsl-stylesheets-native-1.79.1-r0: task do_patch: Succeeded
NOTE: Running task 1297 of 2124 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/docbook-xml/docbook-xsl-stylesheets_1.79.1.bb:do_configure)
NOTE: recipe libgcc-16.1.0-r0: task do_create_recipe_spdx: Started
NOTE: recipe docbook-xsl-stylesheets-native-1.79.1-r0: task do_configure: Started
NOTE: recipe procps-4.0.6-r0: task do_fetch: Succeeded
NOTE: Running task 1298 of 2124 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/procps/procps_4.0.6.bb:do_unpack)
NOTE: recipe docbook-xsl-stylesheets-native-1.79.1-r0: task do_configure: Succeeded
NOTE: Running task 1299 of 2124 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/docbook-xml/docbook-xsl-stylesheets_1.79.1.bb:do_compile)
NOTE: recipe procps-4.0.6-r0: task do_unpack: Started
NOTE: recipe docbook-xsl-stylesheets-native-1.79.1-r0: task do_compile: Started
NOTE: recipe libgcc-16.1.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe docbook-xsl-stylesheets-native-1.79.1-r0: task do_compile: Succeeded
NOTE: Running task 1300 of 2124 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.1.bb:do_create_recipe_spdx)
NOTE: Running task 1301 of 2124 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/docbook-xml/docbook-xsl-stylesheets_1.79.1.bb:do_install)
NOTE: recipe gcc-runtime-16.1.0-r0: task do_create_recipe_spdx: Started
NOTE: recipe docbook-xsl-stylesheets-native-1.79.1-r0: task do_install: Started
NOTE: recipe docbook-xsl-stylesheets-native-1.79.1-r0: task do_install: Succeeded
NOTE: recipe gcc-runtime-16.1.0-r0: task do_create_recipe_spdx: Succeeded
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
NOTE: recipe sqlite3-3_3.53.0-r0: task do_create_recipe_spdx: Started
NOTE: recipe zstd-1.5.7-r0: task do_create_recipe_spdx: Started
NOTE: recipe xorgproto-2025.1-r0: task do_create_recipe_spdx: Started
NOTE: recipe expat-2.8.1-r0: task do_create_recipe_spdx: Started
NOTE: recipe procps-4.0.6-r0: task do_unpack: Succeeded
NOTE: Running task 1309 of 2124 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/procps/procps_4.0.6.bb:do_patch)
NOTE: recipe libtool-cross-2.5.4-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 1310 of 2124 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxcrypt/libxcrypt_4.5.2.bb:do_create_recipe_spdx)
NOTE: recipe sqlite3-3_3.53.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 1311 of 2124 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.17.0.bb:do_create_recipe_spdx)
NOTE: Running task 1312 of 2124 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_create_recipe_spdx)
NOTE: recipe expat-2.8.1-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 1313 of 2124 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_create_recipe_spdx)
NOTE: Running task 1314 of 2124 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.3.bb:do_create_recipe_spdx)
NOTE: recipe zlib-1.3.2-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe xorgproto-2025.1-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 1315 of 2124 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_create_recipe_spdx)
NOTE: Running task 1316 of 2124 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_create_recipe_spdx)
NOTE: Running task 1317 of 2124 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.1.bb:do_create_recipe_spdx)
NOTE: recipe procps-4.0.6-r0: task do_patch: Started
NOTE: Running task 1318 of 2124 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_create_recipe_spdx)
NOTE: Running task 1319 of 2124 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_create_recipe_spdx)
NOTE: Running task 1320 of 2124 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.6.bb:do_create_recipe_spdx)
NOTE: Running task 1321 of 2124 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.3.bb:do_create_recipe_spdx)
NOTE: Running task 1322 of 2124 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.3.bb:do_create_recipe_spdx)
NOTE: recipe libxcrypt-4.5.2-r0: task do_create_recipe_spdx: Started
NOTE: recipe bash-completion-2.17.0-r0: task do_create_recipe_spdx: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_create_recipe_spdx: Started
NOTE: recipe libffi-3.5.2-r0: task do_create_recipe_spdx: Started
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_create_recipe_spdx: Started
NOTE: recipe base-passwd-3.6.8-r0: task do_create_recipe_spdx: Started
NOTE: recipe libcap-ng-0.9.1-r0: task do_create_recipe_spdx: Started
NOTE: recipe gdbm-1.26-r0: task do_create_recipe_spdx: Started
NOTE: recipe bzip2-1.0.8-r0: task do_create_recipe_spdx: Started
NOTE: recipe ncurses-6.6-r0: task do_create_recipe_spdx: Started
NOTE: recipe libxml2-2.15.3-r0: task do_create_recipe_spdx: Started
NOTE: recipe procps-4.0.6-r0: task do_patch: Succeeded
NOTE: recipe openssl-3.5.6-r0: task do_create_recipe_spdx: Started
NOTE: recipe xz-5.8.3-r0: task do_create_recipe_spdx: Started
NOTE: Running task 1324 of 2124 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.5.2.bb:do_create_recipe_spdx)
NOTE: recipe attr-2.5.2-r0: task do_create_recipe_spdx: Started
NOTE: recipe libcap-ng-0.9.1-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe bash-completion-2.17.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe gdbm-1.26-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe openssl-3.5.6-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 1325 of 2124 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_create_recipe_spdx)
NOTE: recipe bzip2-1.0.8-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 1326 of 2124 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_create_recipe_spdx)
NOTE: Running task 1327 of 2124 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_create_recipe_spdx)
NOTE: Running task 1328 of 2124 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/sed/sed_4.10.bb:do_create_recipe_spdx)
NOTE: Running task 1329 of 2124 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.47.bb:do_create_recipe_spdx)
NOTE: recipe util-macros-1_1.20.2-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe libffi-3.5.2-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 1330 of 2124 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_create_recipe_spdx)
NOTE: recipe libxcrypt-4.5.2-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe base-passwd-3.6.8-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe ncurses-6.6-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 1331 of 2124 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_create_recipe_spdx)
NOTE: recipe libxml2-2.15.3-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 1332 of 2124 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_create_recipe_spdx)
NOTE: recipe xz-5.8.3-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 1333 of 2124 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_create_recipe_spdx)
NOTE: Running task 1334 of 2124 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.25.0.bb:do_create_recipe_spdx)
NOTE: recipe xcb-proto-1.17.0-r0: task do_create_recipe_spdx: Started
NOTE: Running task 1335 of 2124 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.47.bb:do_create_recipe_spdx)
NOTE: recipe attr-2.5.2-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 1336 of 2124 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20251016-3.1.bb:do_create_recipe_spdx)
NOTE: recipe libpthread-stubs-0.5-r0: task do_create_recipe_spdx: Started
NOTE: Running task 1337 of 2124 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/kmod/kmod_34.2.bb:do_create_recipe_spdx)
NOTE: Running task 1338 of 2124 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.3.2.bb:do_create_recipe_spdx)
NOTE: recipe libseccomp-2.6.0-r0: task do_create_recipe_spdx: Started
NOTE: recipe sed-4.10-r0: task do_create_recipe_spdx: Started
NOTE: recipe libpcre2-10.47-r0: task do_create_recipe_spdx: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_create_recipe_spdx: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_create_recipe_spdx: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_create_recipe_spdx: Started
NOTE: recipe libpam-1.7.2-r0: task do_create_recipe_spdx: Started
NOTE: recipe libedit-20251016-3.1-r0: task do_create_recipe_spdx: Started
NOTE: recipe xkeyboard-config-2.47-r0: task do_create_recipe_spdx: Started
NOTE: recipe wayland-1.25.0-r0: task do_create_recipe_spdx: Started
NOTE: recipe acl-2.3.2-r0: task do_create_recipe_spdx: Started
NOTE: recipe kmod-34.2-r0: task do_create_recipe_spdx: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 1339 of 2124 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/perl/perl_5.42.2.bb:do_create_recipe_spdx)
NOTE: recipe libseccomp-2.6.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe shadow-sysroot-4.6-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe libedit-20251016-3.1-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe wayland-1.25.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 1340 of 2124 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.5.bb:do_create_recipe_spdx)
NOTE: recipe libpthread-stubs-0.5-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe libpcre2-10.47-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe sed-4.10-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 1341 of 2124 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.88.0.bb:do_create_recipe_spdx)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe xkeyboard-config-2.47-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe perl-5.42.2-r0: task do_create_recipe_spdx: Started
NOTE: Running task 1342 of 2124 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_create_recipe_spdx)
NOTE: recipe kmod-34.2-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe libpam-1.7.2-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 1343 of 2124 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.3.bb:do_create_recipe_spdx)
NOTE: Running task 1344 of 2124 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.19.4.bb:do_create_recipe_spdx)
NOTE: Running task 1345 of 2124 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.78.bb:do_create_recipe_spdx)
NOTE: recipe glib-2.0-initial-1_2.88.0-r0: task do_create_recipe_spdx: Started
NOTE: recipe python3-3.14.5-r0: task do_create_recipe_spdx: Started
NOTE: recipe libxcb-1.17.0-r0: task do_create_recipe_spdx: Started
NOTE: recipe libcap-2.78-r0: task do_create_recipe_spdx: Started
NOTE: recipe shadow-4.19.4-r0: task do_create_recipe_spdx: Started
NOTE: recipe util-linux-2.41.3-r0: task do_create_recipe_spdx: Started
NOTE: recipe perl-5.42.2-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 1346 of 2124 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.13.1.bb:do_create_recipe_spdx)
NOTE: recipe shadow-4.19.4-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 1347 of 2124 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb:do_create_recipe_spdx)
NOTE: recipe glib-2.0-initial-1_2.88.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe libcap-2.78-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe python3-3.14.5-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe util-linux-2.41.3-r0: task do_create_recipe_spdx: Succeeded
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
NOTE: recipe perl-native-5.42.2-r0: task do_patch: Failed
NOTE: recipe shared-mime-info-2.4-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe dpkg-native-1.23.7-r0: task do_fetch: Succeeded
NOTE: Tasks Summary: Attempted 1350 tasks of which 1167 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260601080756.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260601080756.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/perl/perl_5.42.2.bb:do_patch
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/perl-native/5.42.2/temp/log.do_patch.573154
Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: perl-native-5.42.2-r0 do_patch: Applying patch '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/perl/files/perl-configpm-switch.patch' on target directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/perl-native/5.42.2/sources/perl-5.42.2'
CmdError('quilt --quiltrc /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/perl-native/5.42.2/recipe-sysroot-native/etc/quiltrc push', 0, 'stdout: Patch perl-configpm-switch.patch is already applied; check your series file

stderr: ')
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/perl-native/5.42.2/temp/log.do_patch.573154
ERROR: Task (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/perl/perl_5.42.2.bb:do_patch) failed with exit code '1'

--===============4230332934482229906==--

