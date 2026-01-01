Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6E9CEED612
	for <webhook@archiver.kernel.org>; Thu,  1 Jan 2026 11:37:59 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.103055.1767267472433691631
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Jan 2026 03:37:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=uBafUkuo;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=mcOkJiU9;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101019b7959913e-ddb5252e-91f8-419a-bb2c-648bb4ba9515-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1767267471;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=cWDs9est2qeFRJNKKdzXZS7ls8JXjFNAZYTP/5Bb58g=;
	b=uBafUkuooyJpADxg+/zV/toNHAjEwGttWTQjNpb8J7Rnm8hrIClcdzA9vYB65RIF
	NGEeuKIr+eH3uJuTUzkHGo1we9vkVBF2eYXm251T9Fhk7p11aKwipQVikUM0NHbQPh3
	XuyzLGH2nqQzH083T//WRgn1SGBJed2fCBdCbFJQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1767267471;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=cWDs9est2qeFRJNKKdzXZS7ls8JXjFNAZYTP/5Bb58g=;
	b=mcOkJiU9JAYAya242xoL7NxRgXQs6zcs0p9o5oTbDhvpXSTu4+S57xVAAZfH+n6T
	XQSY3v16NxN8hfYkZ9oRWn+O3zuJc+CAOA9kBUj8nMx42WW+cyUtnQY3R1lfZccMU/V
	L2FDs6PXxntwEDBq76YdE9noczkZgZG+g9Kzzhho=
Content-Type: multipart/mixed; boundary="===============3661769861586890178=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] perl: upgrading to 5.42.0 FAILED
Message-ID: <0101019b7959913e-ddb5252e-91f8-419a-bb2c-648bb4ba9515-000000@us-west-2.amazonses.com>
Date: Thu, 1 Jan 2026 11:37:51 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.01.01-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Jan 2026 11:37:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228769

--===============3661769861586890178==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *perl* to *5.42.0* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-perl-upgrade-5.40.2-5.42.0.patch
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
From 0b749e9d21dd6478f64a680e949503baad7f6423 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 1 Jan 2026 06:56:50 +0000
Subject: [PATCH] perl: upgrade 5.40.2 -> 5.42.0

---
 ...ule-breaks-through-the-perl-wrapper-.patch |  8 ++--
 ...Makefile.PL-Fix-_PATH_LOG-for-determ.patch |  2 +-
 .../files/0002-Constant-Fix-up-shebang.patch  |  2 +-
 .../perl/files/determinism.patch              |  2 +-
 .../perl/files/encodefix.patch                |  2 +-
 .../perl/files/errno_ver.diff                 |  2 +-
 .../perl/files/native-perlinc.patch           |  6 +--
 .../perl/files/perl-configpm-switch.patch     |  4 +-
 .../perl/files/perl-dynloader.patch           |  2 +-
 meta/recipes-devtools/perl/perl-ptest.inc     | 12 ++++-
 .../perl/{perl_5.40.2.bb => perl_5.42.0.bb}   | 46 ++++++++++++++++++-
 11 files changed, 70 insertions(+), 18 deletions(-)
 rename meta/recipes-devtools/perl/{perl_5.40.2.bb => perl_5.42.0.bb} (92%)

diff --git a/meta/recipes-devtools/perl/files/0001-Somehow-this-module-breaks-through-the-perl-wrapper-.patch b/meta/recipes-devtools/perl/files/0001-Somehow-this-module-breaks-through-the-perl-wrapper-.patch
index 2076c61ee0..6e630d380f 100644
--- a/meta/recipes-devtools/perl/files/0001-Somehow-this-module-breaks-through-the-perl-wrapper-.patch
+++ b/meta/recipes-devtools/perl/files/0001-Somehow-this-module-breaks-through-the-perl-wrapper-.patch
@@ -1,4 +1,4 @@
-From 47cd22cd213d2c5f28e674b12c264dc731682560 Mon Sep 17 00:00:00 2001
+From bc89d177d0b9f9476852a33cd011299dd4364115 Mon Sep 17 00:00:00 2001
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
index 7e5d08d8db..8decd9920e 100644
--- a/meta/recipes-devtools/perl/files/0001-cpan-Sys-Syslog-Makefile.PL-Fix-_PATH_LOG-for-determ.patch
+++ b/meta/recipes-devtools/perl/files/0001-cpan-Sys-Syslog-Makefile.PL-Fix-_PATH_LOG-for-determ.patch
@@ -1,4 +1,4 @@
-From 322972384e0795be339252f7cf9a318dc759b51e Mon Sep 17 00:00:00 2001
+From f6f0bd5ebdec5191dfd9a2b97829752eaf2b0772 Mon Sep 17 00:00:00 2001
 From: Robert Yang <liezhi.yang@windriver.com>
 Date: Fri, 18 Feb 2022 09:44:26 +0000
 Subject: [PATCH] cpan/Sys-Syslog/Makefile.PL: Fix _PATH_LOG for deterministic
diff --git a/meta/recipes-devtools/perl/files/0002-Constant-Fix-up-shebang.patch b/meta/recipes-devtools/perl/files/0002-Constant-Fix-up-shebang.patch
index 80986e66da..44379b548a 100644
--- a/meta/recipes-devtools/perl/files/0002-Constant-Fix-up-shebang.patch
+++ b/meta/recipes-devtools/perl/files/0002-Constant-Fix-up-shebang.patch
@@ -1,4 +1,4 @@
-From a02355bdc8cde1115daf101675cdfb707d337bf1 Mon Sep 17 00:00:00 2001
+From 0fb50f8a5a820d402b9cf20d7cc5f7f18dc5f5a6 Mon Sep 17 00:00:00 2001
 From: Joshua Watt <JPEWhacker@gmail.com>
 Date: Mon, 17 Jun 2019 10:47:23 -0500
 Subject: [PATCH] Constant: Fix up shebang
diff --git a/meta/recipes-devtools/perl/files/determinism.patch b/meta/recipes-devtools/perl/files/determinism.patch
index bdb9a928bb..c2cc2f8f8f 100644
--- a/meta/recipes-devtools/perl/files/determinism.patch
+++ b/meta/recipes-devtools/perl/files/determinism.patch
@@ -1,4 +1,4 @@
-From 5c4fd57daf125357262aa796057d7be8e78d378e Mon Sep 17 00:00:00 2001
+From bb774494aa8c59cde755c2fbb6a06e343d9ab1db Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Wed, 5 Feb 2020 23:54:02 +0000
 Subject: [PATCH] Fixes to make the perl build reproducible:
diff --git a/meta/recipes-devtools/perl/files/encodefix.patch b/meta/recipes-devtools/perl/files/encodefix.patch
index 665699d12d..31134a7963 100644
--- a/meta/recipes-devtools/perl/files/encodefix.patch
+++ b/meta/recipes-devtools/perl/files/encodefix.patch
@@ -1,4 +1,4 @@
-From a4e22c7f2a519f24bc8aa89c6677017c0fe13679 Mon Sep 17 00:00:00 2001
+From 916ccf896b62ceca5379acf15f9d1681532b75c1 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Tue, 18 Feb 2020 17:27:26 +0000
 Subject: [PATCH] perl: Fix encode module reproducibility issues
diff --git a/meta/recipes-devtools/perl/files/errno_ver.diff b/meta/recipes-devtools/perl/files/errno_ver.diff
index 477642f457..fcc0a370b6 100644
--- a/meta/recipes-devtools/perl/files/errno_ver.diff
+++ b/meta/recipes-devtools/perl/files/errno_ver.diff
@@ -1,4 +1,4 @@
-From 9c404d4b1c3607e827fb56b5ae4f8fbbdb52cd0b Mon Sep 17 00:00:00 2001
+From 0e78cde5df2991fba60cac95dc753476edba363a Mon Sep 17 00:00:00 2001
 From: Brendan O'Dea <bod@debian.org>
 Date: Fri, 16 Dec 2005 01:32:14 +1100
 Subject: [PATCH] Remove Errno version check due to upgrade problems with
diff --git a/meta/recipes-devtools/perl/files/native-perlinc.patch b/meta/recipes-devtools/perl/files/native-perlinc.patch
index 7e3e5f6652..24f99555eb 100644
--- a/meta/recipes-devtools/perl/files/native-perlinc.patch
+++ b/meta/recipes-devtools/perl/files/native-perlinc.patch
@@ -1,4 +1,4 @@
-From 9fec62b19a49d1451fd1120c5dc38baf59f73856 Mon Sep 17 00:00:00 2001
+From 9905bba74c2514164858babf81a6d1411a0e03f5 Mon Sep 17 00:00:00 2001
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
index 3721277933..6902d6ce51 100644
--- a/meta/recipes-devtools/perl/files/perl-configpm-switch.patch
+++ b/meta/recipes-devtools/perl/files/perl-configpm-switch.patch
@@ -1,4 +1,4 @@
-From 7a48538a7e8614a3342151b646d2105c0cb0cdd9 Mon Sep 17 00:00:00 2001
+From fdb9d9ff77522fb100a0b55649bb87625a611da3 Mon Sep 17 00:00:00 2001
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
index 5472602d3a..dfe575b69e 100644
--- a/meta/recipes-devtools/perl/files/perl-dynloader.patch
+++ b/meta/recipes-devtools/perl/files/perl-dynloader.patch
@@ -1,4 +1,4 @@
-From 25a26c52c320e699b37a7ad1f4f045bc8aa4cb00 Mon Sep 17 00:00:00 2001
+From 36f54f3381d3649b0cc8306fce9217bf9dfa994a Mon Sep 17 00:00:00 2001
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
diff --git a/meta/recipes-devtools/perl/perl_5.40.2.bb b/meta/recipes-devtools/perl/perl_5.42.0.bb
similarity index 92%
rename from meta/recipes-devtools/perl/perl_5.40.2.bb
rename to meta/recipes-devtools/perl/perl_5.42.0.bb
index a78d2ed0be..9f4132bf16 100644
--- a/meta/recipes-devtools/perl/perl_5.40.2.bb
+++ b/meta/recipes-devtools/perl/perl_5.42.0.bb
@@ -1,9 +1,51 @@
+# FIXME: the LIC_FILES_CHKSUM values have been updated by 'devtool upgrade'.
+# The following is the difference between the old and the new license text.
+# Please update the LICENSE value if needed, and summarize the changes in
+# the commit message via 'License-Update:' tag.
+# (example: 'License-Update: copyright years updated.')
+#
+# The changes:
+#
+# --- Copying
+# +++ Copying
+# @@ -3,7 +3,7 @@
+#                       Version 1, February 1989
+#  
+#   Copyright (C) 1989 Free Software Foundation, Inc.
+# -                    51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
+# +               <https://fsf.org/>
+#  
+#   Everyone is permitted to copy and distribute verbatim copies
+#   of this license document, but changing it is not allowed.
+# @@ -217,8 +217,7 @@
+#      GNU General Public License for more details.
+#  
+#      You should have received a copy of the GNU General Public License
+# -    along with this program; if not, write to the Free Software
+# -    Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston MA  02110-1301 USA
+# +    along with this program; if not, see <https://www.gnu.org/licenses/>.
+#  
+#  
+#  Also add information on how to contact you by electronic and paper mail.
+# @@ -245,7 +244,7 @@
+#    program `Gnomovision' (a program to direct compilers to make passes
+#    at assemblers) written by James Hacker.
+#  
+# -  <signature of Ty Coon>, 1 April 1989
+# -  Ty Coon, President of Vice
+# +  <signature of Moe Ghoul>, 1 April 1989
+# +  Moe Ghoul, President of Vice
+#  
+#  That's all there is to it!
+# 
+#
+
 SUMMARY = "Perl scripting language"
 HOMEPAGE = "http://www.perl.org/"
 DESCRIPTION = "Perl is a highly capable, feature-rich programming language"
 SECTION = "devel"
 LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
-LIC_FILES_CHKSUM = "file://Copying;md5=5b122a36d0f6dc55279a0ebc69f3c60b \
+LIC_FILES_CHKSUM = "file://Copying;md5=8f7dd0873e59530abbb36503972afcdb \
                     file://Artistic;md5=71a4d5d9acc18c0952a6df2218bb68da \
                     "
 
@@ -24,7 +66,7 @@ SRC_URI:append:class-target = " \
            file://encodefix.patch \
 "
 
-SRC_URI[perl.sha256sum] = "10d4647cfbb543a7f9ae3e5f6851ec49305232ea7621aed24c7cfbb0bef4b70d"
+SRC_URI[perl.sha256sum] = "e093ef184d7f9a1b9797e2465296f55510adb6dab8842b0c3ed53329663096dc"
 
 B = "${WORKDIR}/perl-${PV}-build"
 
-- 
2.47.1


--===============3661769861586890178==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-perl-upgrade-5.40.2-5.42.0.patch"

RnJvbSAwYjc0OWU5ZDIxZGQ2NDc4ZjY0YTY4MGU5NDk1MDNiYWFkN2Y2NDIzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBKYW4gMjAyNiAwNjo1Njo1MCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHBl
cmw6IHVwZ3JhZGUgNS40MC4yIC0+IDUuNDIuMAoKLS0tCiAuLi51bGUtYnJlYWtzLXRocm91Z2gt
dGhlLXBlcmwtd3JhcHBlci0ucGF0Y2ggfCAgOCArKy0tCiAuLi5NYWtlZmlsZS5QTC1GaXgtX1BB
VEhfTE9HLWZvci1kZXRlcm0ucGF0Y2ggfCAgMiArLQogLi4uL2ZpbGVzLzAwMDItQ29uc3RhbnQt
Rml4LXVwLXNoZWJhbmcucGF0Y2ggIHwgIDIgKy0KIC4uLi9wZXJsL2ZpbGVzL2RldGVybWluaXNt
LnBhdGNoICAgICAgICAgICAgICB8ICAyICstCiAuLi4vcGVybC9maWxlcy9lbmNvZGVmaXgucGF0
Y2ggICAgICAgICAgICAgICAgfCAgMiArLQogLi4uL3BlcmwvZmlsZXMvZXJybm9fdmVyLmRpZmYg
ICAgICAgICAgICAgICAgIHwgIDIgKy0KIC4uLi9wZXJsL2ZpbGVzL25hdGl2ZS1wZXJsaW5jLnBh
dGNoICAgICAgICAgICB8ICA2ICstLQogLi4uL3BlcmwvZmlsZXMvcGVybC1jb25maWdwbS1zd2l0
Y2gucGF0Y2ggICAgIHwgIDQgKy0KIC4uLi9wZXJsL2ZpbGVzL3BlcmwtZHlubG9hZGVyLnBhdGNo
ICAgICAgICAgICB8ICAyICstCiBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcGVybC9wZXJsLXB0ZXN0
LmluYyAgICAgfCAxMiArKysrLQogLi4uL3Blcmwve3BlcmxfNS40MC4yLmJiID0+IHBlcmxfNS40
Mi4wLmJifSAgIHwgNDYgKysrKysrKysrKysrKysrKysrLQogMTEgZmlsZXMgY2hhbmdlZCwgNzAg
aW5zZXJ0aW9ucygrKSwgMTggZGVsZXRpb25zKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3Blcmwve3BlcmxfNS40MC4yLmJiID0+IHBlcmxfNS40Mi4wLmJifSAoOTIlKQoKZGlmZiAt
LWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9wZXJsL2ZpbGVzLzAwMDEtU29tZWhvdy10aGlz
LW1vZHVsZS1icmVha3MtdGhyb3VnaC10aGUtcGVybC13cmFwcGVyLS5wYXRjaCBiL21ldGEvcmVj
aXBlcy1kZXZ0b29scy9wZXJsL2ZpbGVzLzAwMDEtU29tZWhvdy10aGlzLW1vZHVsZS1icmVha3Mt
dGhyb3VnaC10aGUtcGVybC13cmFwcGVyLS5wYXRjaAppbmRleCAyMDc2YzYxZWUwLi42ZTYzMGQz
ODBmIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcGVybC9maWxlcy8wMDAxLVNv
bWVob3ctdGhpcy1tb2R1bGUtYnJlYWtzLXRocm91Z2gtdGhlLXBlcmwtd3JhcHBlci0ucGF0Y2gK
KysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3BlcmwvZmlsZXMvMDAwMS1Tb21laG93LXRoaXMt
bW9kdWxlLWJyZWFrcy10aHJvdWdoLXRoZS1wZXJsLXdyYXBwZXItLnBhdGNoCkBAIC0xLDQgKzEs
NCBAQAotRnJvbSA0N2NkMjJjZDIxM2QyYzVmMjhlNjc0YjEyYzI2NGRjNzMxNjgyNTYwIE1vbiBT
ZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBiYzg5ZDE3N2QwYjlmOTQ3Njg1MmEzM2NkMDExMjk5
ZGQ0MzY0MTE1IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogQWxleGFuZGVyIEthbmF2
aW4gPGFsZXgua2FuYXZpbkBnbWFpbC5jb20+CiBEYXRlOiBUdWUsIDUgSnVuIDIwMTggMTQ6NTg6
NDIgKzAzMDAKIFN1YmplY3Q6IFtQQVRDSF0gU29tZWhvdyB0aGlzIG1vZHVsZSBicmVha3MgdGhy
b3VnaCB0aGUgcGVybCB3cmFwcGVyIGFuZApAQCAtMTEsMTAgKzExLDEwIEBAIFNpZ25lZC1vZmYt
Ynk6IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4LmthbmF2aW5AZ21haWwuY29tPgogIDEgZmlsZSBj
aGFuZ2VkLCA0IGluc2VydGlvbnMoKykKIAogZGlmZiAtLWdpdCBhL2NwYW4vRXh0VXRpbHMtTWFr
ZU1ha2VyL2xpYi9FeHRVdGlscy9NTV9Vbml4LnBtIGIvY3Bhbi9FeHRVdGlscy1NYWtlTWFrZXIv
bGliL0V4dFV0aWxzL01NX1VuaXgucG0KLWluZGV4IGZlMzg1OTguLjA4MjhmNTIgMTAwNjQ0Citp
bmRleCA1NzBmZTUyLi40NmZhZDE1IDEwMDY0NAogLS0tIGEvY3Bhbi9FeHRVdGlscy1NYWtlTWFr
ZXIvbGliL0V4dFV0aWxzL01NX1VuaXgucG0KICsrKyBiL2NwYW4vRXh0VXRpbHMtTWFrZU1ha2Vy
L2xpYi9FeHRVdGlscy9NTV9Vbml4LnBtCi1AQCAtMTE2MSw2ICsxMTYxLDkgQEAgV0FSTklORwor
QEAgLTExODgsNiArMTE4OCw5IEBAIFdBUk5JTkcKICAgICAgfQogIAogICAgICBmb3JlYWNoIG15
ICRuYW1lIChAJG5hbWVzKXsKQEAgLTI0LDcgKzI0LDcgQEAgaW5kZXggZmUzODU5OC4uMDgyOGY1
MiAxMDA2NDQKICAgICAgICAgIG15ICgkYWJzLCAkdXNlX2Rpcik7CiAgICAgICAgICBpZiAoJHNl
bGYtPmZpbGVfbmFtZV9pc19hYnNvbHV0ZSgkbmFtZSkpIHsgICAgICMgL2Zvby9iYXIKICAgICAg
ICAgICAgICAkYWJzID0gJG5hbWU7Ci1AQCAtMjA5Nyw2ICsyMTAwLDcgQEAgc3ViIGluaXRfUEVS
TCB7CitAQCAtMjEyMCw2ICsyMTIzLDcgQEAgc3ViIGluaXRfUEVSTCB7CiAgCiAgICAgICRzZWxm
LT57UEVSTH0gfHw9CiAgICAgICAgICAkc2VsZi0+ZmluZF9wZXJsKDUuMCwgXEBwZXJscywgXEBk
ZWZwYXRoLCAkVmVyYm9zZSApOwpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3Bl
cmwvZmlsZXMvMDAwMS1jcGFuLVN5cy1TeXNsb2ctTWFrZWZpbGUuUEwtRml4LV9QQVRIX0xPRy1m
b3ItZGV0ZXJtLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3BlcmwvZmlsZXMvMDAwMS1j
cGFuLVN5cy1TeXNsb2ctTWFrZWZpbGUuUEwtRml4LV9QQVRIX0xPRy1mb3ItZGV0ZXJtLnBhdGNo
CmluZGV4IDdlNWQwOGQ4ZGIuLjhkZWNkOTkyMGUgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9wZXJsL2ZpbGVzLzAwMDEtY3Bhbi1TeXMtU3lzbG9nLU1ha2VmaWxlLlBMLUZpeC1f
UEFUSF9MT0ctZm9yLWRldGVybS5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcGVy
bC9maWxlcy8wMDAxLWNwYW4tU3lzLVN5c2xvZy1NYWtlZmlsZS5QTC1GaXgtX1BBVEhfTE9HLWZv
ci1kZXRlcm0ucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDMyMjk3MjM4NGUwNzk1YmUzMzky
NTJmN2NmOWEzMThkYzc1OWI1MWUgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIGY2ZjBi
ZDVlYmRlYzUxOTFkZmQ5YTJiOTc4Mjk3NTJlYWYyYjA3NzIgTW9uIFNlcCAxNyAwMDowMDowMCAy
MDAxCiBGcm9tOiBSb2JlcnQgWWFuZyA8bGllemhpLnlhbmdAd2luZHJpdmVyLmNvbT4KIERhdGU6
IEZyaSwgMTggRmViIDIwMjIgMDk6NDQ6MjYgKzAwMDAKIFN1YmplY3Q6IFtQQVRDSF0gY3Bhbi9T
eXMtU3lzbG9nL01ha2VmaWxlLlBMOiBGaXggX1BBVEhfTE9HIGZvciBkZXRlcm1pbmlzdGljCmRp
ZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcGVybC9maWxlcy8wMDAyLUNvbnN0YW50
LUZpeC11cC1zaGViYW5nLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3BlcmwvZmlsZXMv
MDAwMi1Db25zdGFudC1GaXgtdXAtc2hlYmFuZy5wYXRjaAppbmRleCA4MDk4NmU2NmRhLi40NDM3
OWI1NDhhIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcGVybC9maWxlcy8wMDAy
LUNvbnN0YW50LUZpeC11cC1zaGViYW5nLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29s
cy9wZXJsL2ZpbGVzLzAwMDItQ29uc3RhbnQtRml4LXVwLXNoZWJhbmcucGF0Y2gKQEAgLTEsNCAr
MSw0IEBACi1Gcm9tIGEwMjM1NWJkYzhjZGUxMTE1ZGFmMTAxNjc1Y2RmYjcwN2QzMzdiZjEgTW9u
IFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDBmYjUwZjhhNWE4MjBkNDAyYjljZjIwZDdjYzVm
N2YxOGRjNWY1YTYgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBKb3NodWEgV2F0dCA8
SlBFV2hhY2tlckBnbWFpbC5jb20+CiBEYXRlOiBNb24sIDE3IEp1biAyMDE5IDEwOjQ3OjIzIC0w
NTAwCiBTdWJqZWN0OiBbUEFUQ0hdIENvbnN0YW50OiBGaXggdXAgc2hlYmFuZwpkaWZmIC0tZ2l0
IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3BlcmwvZmlsZXMvZGV0ZXJtaW5pc20ucGF0Y2ggYi9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcGVybC9maWxlcy9kZXRlcm1pbmlzbS5wYXRjaAppbmRleCBi
ZGI5YTkyOGJiLi5jMmNjMmY4ZjhmIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
cGVybC9maWxlcy9kZXRlcm1pbmlzbS5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
cGVybC9maWxlcy9kZXRlcm1pbmlzbS5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gNWM0ZmQ1
N2RhZjEyNTM1NzI2MmFhNzk2MDU3ZDdiZThlNzhkMzc4ZSBNb24gU2VwIDE3IDAwOjAwOjAwIDIw
MDEKK0Zyb20gYmI3NzQ0OTRhYThjNTljZGU3NTVjMmZiYjZhMDZlMzQzZDlhYjFkYiBNb24gU2Vw
IDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IFJpY2hhcmQgUHVyZGllIDxyaWNoYXJkLnB1cmRpZUBs
aW51eGZvdW5kYXRpb24ub3JnPgogRGF0ZTogV2VkLCA1IEZlYiAyMDIwIDIzOjU0OjAyICswMDAw
CiBTdWJqZWN0OiBbUEFUQ0hdIEZpeGVzIHRvIG1ha2UgdGhlIHBlcmwgYnVpbGQgcmVwcm9kdWNp
YmxlOgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3BlcmwvZmlsZXMvZW5jb2Rl
Zml4LnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3BlcmwvZmlsZXMvZW5jb2RlZml4LnBh
dGNoCmluZGV4IDY2NTY5OWQxMmQuLjMxMTM0YTc5NjMgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBl
cy1kZXZ0b29scy9wZXJsL2ZpbGVzL2VuY29kZWZpeC5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcGVybC9maWxlcy9lbmNvZGVmaXgucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9t
IGE0ZTIyYzdmMmE1MTlmMjRiYzhhYTg5YzY2NzcwMTdjMGZlMTM2NzkgTW9uIFNlcCAxNyAwMDow
MDowMCAyMDAxCitGcm9tIDkxNmNjZjg5NmI2MmNlY2E1Mzc5YWNmMTVmOWQxNjgxNTMyYjc1YzEg
TW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBSaWNoYXJkIFB1cmRpZSA8cmljaGFyZC5w
dXJkaWVAbGludXhmb3VuZGF0aW9uLm9yZz4KIERhdGU6IFR1ZSwgMTggRmViIDIwMjAgMTc6Mjc6
MjYgKzAwMDAKIFN1YmplY3Q6IFtQQVRDSF0gcGVybDogRml4IGVuY29kZSBtb2R1bGUgcmVwcm9k
dWNpYmlsaXR5IGlzc3VlcwpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3Blcmwv
ZmlsZXMvZXJybm9fdmVyLmRpZmYgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcGVybC9maWxlcy9l
cnJub192ZXIuZGlmZgppbmRleCA0Nzc2NDJmNDU3Li5mY2MwYTM3MGI2IDEwMDY0NAotLS0gYS9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcGVybC9maWxlcy9lcnJub192ZXIuZGlmZgorKysgYi9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcGVybC9maWxlcy9lcnJub192ZXIuZGlmZgpAQCAtMSw0ICsxLDQg
QEAKLUZyb20gOWM0MDRkNGIxYzM2MDdlODI3ZmI1NmI1YWU0ZjhmYmJkYjUyY2QwYiBNb24gU2Vw
IDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gMGU3OGNkZTVkZjI5OTFmYmE2MGNhYzk1ZGM3NTM0NzZl
ZGJhMzYzYSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEJyZW5kYW4gTydEZWEgPGJv
ZEBkZWJpYW4ub3JnPgogRGF0ZTogRnJpLCAxNiBEZWMgMjAwNSAwMTozMjoxNCArMTEwMAogU3Vi
amVjdDogW1BBVENIXSBSZW1vdmUgRXJybm8gdmVyc2lvbiBjaGVjayBkdWUgdG8gdXBncmFkZSBw
cm9ibGVtcyB3aXRoCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcGVybC9maWxl
cy9uYXRpdmUtcGVybGluYy5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9wZXJsL2ZpbGVz
L25hdGl2ZS1wZXJsaW5jLnBhdGNoCmluZGV4IDdlM2U1ZjY2NTIuLjI0Zjk5NTU1ZWIgMTAwNjQ0
Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9wZXJsL2ZpbGVzL25hdGl2ZS1wZXJsaW5jLnBh
dGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9wZXJsL2ZpbGVzL25hdGl2ZS1wZXJsaW5j
LnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSA5ZmVjNjJiMTlhNDlkMTQ1MWZkMTEyMGM1ZGMz
OGJhZjU5ZjczODU2IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSA5OTA1YmJhNzRjMjUx
NDE2NDg1OGJhYmY4MWE2ZDE0MTFhMGUwM2Y1IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJv
bTogQWxleGFuZGVyIEthbmF2aW4gPGFsZXgua2FuYXZpbkBnbWFpbC5jb20+CiBEYXRlOiBXZWQs
IDMwIE1heSAyMDA3IDA5OjMzOjMyICswMDAwCiBTdWJqZWN0OiBbUEFUQ0hdIHBlcmw6IHN5bmMg
d2l0aCBPRQpAQCAtMTAsMTAgKzEwLDEwIEBAIFNpZ25lZC1vZmYtYnk6IEFsZXhhbmRlciBLYW5h
dmluIDxhbGV4LmthbmF2aW5AZ21haWwuY29tPgogIDEgZmlsZSBjaGFuZ2VkLCAxMyBpbnNlcnRp
b25zKCspCiAKIGRpZmYgLS1naXQgYS9jcGFuL0V4dFV0aWxzLU1ha2VNYWtlci9saWIvRXh0VXRp
bHMvTU1fVW5peC5wbSBiL2NwYW4vRXh0VXRpbHMtTWFrZU1ha2VyL2xpYi9FeHRVdGlscy9NTV9V
bml4LnBtCi1pbmRleCAwODI4ZjUyLi5iOGFiZmY0IDEwMDY0NAoraW5kZXggNDZmYWQxNS4uZTU0
MzE3OCAxMDA2NDQKIC0tLSBhL2NwYW4vRXh0VXRpbHMtTWFrZU1ha2VyL2xpYi9FeHRVdGlscy9N
TV9Vbml4LnBtCiArKysgYi9jcGFuL0V4dFV0aWxzLU1ha2VNYWtlci9saWIvRXh0VXRpbHMvTU1f
VW5peC5wbQotQEAgLTE4NjIsNiArMTg2MiwxOSBAQCBmcm9tIHRoZSBwZXJsIHNvdXJjZSB0cmVl
LgorQEAgLTE4OTIsNiArMTg5MiwxOSBAQCBmcm9tIHRoZSBwZXJsIHNvdXJjZSB0cmVlLgogIAkk
c2VsZi0+e1BFUkxfTElCfSAgICAgfHw9ICRDb25maWd7cHJpdmxpYmV4cH07CiAgCSRzZWxmLT57
UEVSTF9BUkNITElCfSB8fD0gJENvbmZpZ3thcmNobGliZXhwfTsKICAJJHNlbGYtPntQRVJMX0lO
Q30gICAgID0gJHNlbGYtPmNhdGRpcigiJHNlbGYtPntQRVJMX0FSQ0hMSUJ9IiwiQ09SRSIpOyAj
IHdpbGQgZ3Vlc3MgZm9yIG5vdwpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3Bl
cmwvZmlsZXMvcGVybC1jb25maWdwbS1zd2l0Y2gucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcGVybC9maWxlcy9wZXJsLWNvbmZpZ3BtLXN3aXRjaC5wYXRjaAppbmRleCAzNzIxMjc3OTMz
Li42OTAyZDZjZTUxIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcGVybC9maWxl
cy9wZXJsLWNvbmZpZ3BtLXN3aXRjaC5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
cGVybC9maWxlcy9wZXJsLWNvbmZpZ3BtLXN3aXRjaC5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZy
b20gN2E0ODUzOGE3ZTg2MTRhMzM0MjE1MWI2NDZkMjEwNWMwY2IwY2RkOSBNb24gU2VwIDE3IDAw
OjAwOjAwIDIwMDEKK0Zyb20gZmRiOWQ5ZmY3NzUyMmZiMTAwYTBiNTU2NDliYjg3NjI1YTYxMWRh
MyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4
LmthbmF2aW5AZ21haWwuY29tPgogRGF0ZTogU3VuLCAyNyBNYXkgMjAwNyAyMTowNDoxMSArMDAw
MAogU3ViamVjdDogW1BBVENIXSBwZXJsOiA1LjguNyAtPiA1LjguOCAoZnJvbSBPRSkKQEAgLTE5
LDcgKzE5LDcgQEAgU2lnbmVkLW9mZi1ieTogQWxleGFuZGVyIEthbmF2aW4gPGFsZXgua2FuYXZp
bkBnbWFpbC5jb20+CiAgMSBmaWxlIGNoYW5nZWQsIDE2IGluc2VydGlvbnMoKyksIDIgZGVsZXRp
b25zKC0pCiAKIGRpZmYgLS1naXQgYS9jb25maWdwbSBiL2NvbmZpZ3BtCi1pbmRleCAwNzIxOWQ4
Li4wMWEyM2ZhIDEwMDc1NQoraW5kZXggMGM0NmI5ZS4uMWRhZWJlZiAxMDA3NTUKIC0tLSBhL2Nv
bmZpZ3BtCiArKysgYi9jb25maWdwbQogQEAgLTcxOCw3ICs3MTgsNyBAQCAkY29uZmlnX3R4dCAu
PSB1bmNvbW1lbnQgPDwnRU5ET0ZFTkQnOwpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3BlcmwvZmlsZXMvcGVybC1keW5sb2FkZXIucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcGVybC9maWxlcy9wZXJsLWR5bmxvYWRlci5wYXRjaAppbmRleCA1NDcyNjAyZDNhLi5kZmU1
NzViNjllIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcGVybC9maWxlcy9wZXJs
LWR5bmxvYWRlci5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcGVybC9maWxlcy9w
ZXJsLWR5bmxvYWRlci5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gMjVhMjZjNTJjMzIwZTY5
OWIzN2E3YWQxZjRmMDQ1YmM4YWE0Y2IwMCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20g
MzZmNTRmMzM4MWQzNjQ5YjBjYzgzMDZmY2U5MjE3YmY5ZGZhOTk0YSBNb24gU2VwIDE3IDAwOjAw
OjAwIDIwMDEKIEZyb206IFJpY2hhcmQgUHVyZGllIDxyaWNoYXJkQG9wZW5lZGhhbmQuY29tPgog
RGF0ZTogU3VuLCAyNyBNYXkgMjAwNyAyMTowNDoxMSArMDAwMAogU3ViamVjdDogW1BBVENIXSBw
ZXJsOiA1LjguNyAtPiA1LjguOCAoZnJvbSBPRSkKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9wZXJsL3BlcmwtcHRlc3QuaW5jIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3Blcmwv
cGVybC1wdGVzdC5pbmMKaW5kZXggNGI0NzU2MTE4Yy4uMDgzMGZmNWIyYSAxMDA2NDQKLS0tIGEv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3BlcmwvcGVybC1wdGVzdC5pbmMKKysrIGIvbWV0YS9yZWNp
cGVzLWRldnRvb2xzL3BlcmwvcGVybC1wdGVzdC5pbmMKQEAgLTEsNiArMSwxNiBAQAogaW5oZXJp
dCBwdGVzdAogCi1TUkNfVVJJICs9ICJmaWxlOi8vcnVuLXB0ZXN0IFwKK1NSQ19VUkkgPSAiaHR0
cHM6Ly93d3cuY3Bhbi5vcmcvc3JjLzUuMC9wZXJsLSR7UFZ9LnRhci5nejtuYW1lPXBlcmwgXAor
ICAgICAgICAgICBmaWxlOi8vcGVybC1yZGVwZW5kcy50eHQgXAorICAgICAgICAgICBmaWxlOi8v
MDAwMS1Tb21laG93LXRoaXMtbW9kdWxlLWJyZWFrcy10aHJvdWdoLXRoZS1wZXJsLXdyYXBwZXIt
LnBhdGNoIFwKKyAgICAgICAgICAgZmlsZTovL2Vycm5vX3Zlci5kaWZmIFwKKyAgICAgICAgICAg
ZmlsZTovL25hdGl2ZS1wZXJsaW5jLnBhdGNoIFwKKyAgICAgICAgICAgZmlsZTovL3BlcmwtZHlu
bG9hZGVyLnBhdGNoIFwKKyAgICAgICAgICAgZmlsZTovLzAwMDItQ29uc3RhbnQtRml4LXVwLXNo
ZWJhbmcucGF0Y2ggXAorICAgICAgICAgICBmaWxlOi8vZGV0ZXJtaW5pc20ucGF0Y2ggXAorICAg
ICAgICAgICBmaWxlOi8vMDAwMS1jcGFuLVN5cy1TeXNsb2ctTWFrZWZpbGUuUEwtRml4LV9QQVRI
X0xPRy1mb3ItZGV0ZXJtLnBhdGNoIFwKKyAgICAgICAgICAgZmlsZTovL3J1bi1wdGVzdCBcCisg
ICAgICAgICAgIGZpbGU6Ly9wZXJsLWNvbmZpZ3BtLXN3aXRjaC5wYXRjaCBcCiAgICAgICAgICAg
ICIKIAogREVCVUdfUFJFRklYX01BUF9SRUdFWCA9ICIke0AnXFx8Jy5qb2luKGQuZ2V0VmFyKCdE
RUJVR19QUkVGSVhfTUFQJykuc3BsaXQoKSl9IgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL3BlcmwvcGVybF81LjQwLjIuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcGVybC9w
ZXJsXzUuNDIuMC5iYgpzaW1pbGFyaXR5IGluZGV4IDkyJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvcGVybC9wZXJsXzUuNDAuMi5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL3BlcmwvcGVybF81LjQyLjAuYmIKaW5kZXggYTc4ZDJlZDBiZS4uOWY0MTMyYmYxNiAx
MDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3BlcmwvcGVybF81LjQwLjIuYmIKKysr
IGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3BlcmwvcGVybF81LjQyLjAuYmIKQEAgLTEsOSArMSw1
MSBAQAorIyBGSVhNRTogdGhlIExJQ19GSUxFU19DSEtTVU0gdmFsdWVzIGhhdmUgYmVlbiB1cGRh
dGVkIGJ5ICdkZXZ0b29sIHVwZ3JhZGUnLgorIyBUaGUgZm9sbG93aW5nIGlzIHRoZSBkaWZmZXJl
bmNlIGJldHdlZW4gdGhlIG9sZCBhbmQgdGhlIG5ldyBsaWNlbnNlIHRleHQuCisjIFBsZWFzZSB1
cGRhdGUgdGhlIExJQ0VOU0UgdmFsdWUgaWYgbmVlZGVkLCBhbmQgc3VtbWFyaXplIHRoZSBjaGFu
Z2VzIGluCisjIHRoZSBjb21taXQgbWVzc2FnZSB2aWEgJ0xpY2Vuc2UtVXBkYXRlOicgdGFnLgor
IyAoZXhhbXBsZTogJ0xpY2Vuc2UtVXBkYXRlOiBjb3B5cmlnaHQgeWVhcnMgdXBkYXRlZC4nKQor
IworIyBUaGUgY2hhbmdlczoKKyMKKyMgLS0tIENvcHlpbmcKKyMgKysrIENvcHlpbmcKKyMgQEAg
LTMsNyArMyw3IEBACisjICAgICAgICAgICAgICAgICAgICAgICBWZXJzaW9uIDEsIEZlYnJ1YXJ5
IDE5ODkKKyMgIAorIyAgIENvcHlyaWdodCAoQykgMTk4OSBGcmVlIFNvZnR3YXJlIEZvdW5kYXRp
b24sIEluYy4KKyMgLSAgICAgICAgICAgICAgICAgICAgNTEgRnJhbmtsaW4gU3QsIEZpZnRoIEZs
b29yLCBCb3N0b24sIE1BICAwMjExMC0xMzAxICBVU0EKKyMgKyAgICAgICAgICAgICAgIDxodHRw
czovL2ZzZi5vcmcvPgorIyAgCisjICAgRXZlcnlvbmUgaXMgcGVybWl0dGVkIHRvIGNvcHkgYW5k
IGRpc3RyaWJ1dGUgdmVyYmF0aW0gY29waWVzCisjICAgb2YgdGhpcyBsaWNlbnNlIGRvY3VtZW50
LCBidXQgY2hhbmdpbmcgaXQgaXMgbm90IGFsbG93ZWQuCisjIEBAIC0yMTcsOCArMjE3LDcgQEAK
KyMgICAgICBHTlUgR2VuZXJhbCBQdWJsaWMgTGljZW5zZSBmb3IgbW9yZSBkZXRhaWxzLgorIyAg
CisjICAgICAgWW91IHNob3VsZCBoYXZlIHJlY2VpdmVkIGEgY29weSBvZiB0aGUgR05VIEdlbmVy
YWwgUHVibGljIExpY2Vuc2UKKyMgLSAgICBhbG9uZyB3aXRoIHRoaXMgcHJvZ3JhbTsgaWYgbm90
LCB3cml0ZSB0byB0aGUgRnJlZSBTb2Z0d2FyZQorIyAtICAgIEZvdW5kYXRpb24sIEluYy4sIDUx
IEZyYW5rbGluIFN0cmVldCwgRmlmdGggRmxvb3IsIEJvc3RvbiBNQSAgMDIxMTAtMTMwMSBVU0EK
KyMgKyAgICBhbG9uZyB3aXRoIHRoaXMgcHJvZ3JhbTsgaWYgbm90LCBzZWUgPGh0dHBzOi8vd3d3
LmdudS5vcmcvbGljZW5zZXMvPi4KKyMgIAorIyAgCisjICBBbHNvIGFkZCBpbmZvcm1hdGlvbiBv
biBob3cgdG8gY29udGFjdCB5b3UgYnkgZWxlY3Ryb25pYyBhbmQgcGFwZXIgbWFpbC4KKyMgQEAg
LTI0NSw3ICsyNDQsNyBAQAorIyAgICBwcm9ncmFtIGBHbm9tb3Zpc2lvbicgKGEgcHJvZ3JhbSB0
byBkaXJlY3QgY29tcGlsZXJzIHRvIG1ha2UgcGFzc2VzCisjICAgIGF0IGFzc2VtYmxlcnMpIHdy
aXR0ZW4gYnkgSmFtZXMgSGFja2VyLgorIyAgCisjIC0gIDxzaWduYXR1cmUgb2YgVHkgQ29vbj4s
IDEgQXByaWwgMTk4OQorIyAtICBUeSBDb29uLCBQcmVzaWRlbnQgb2YgVmljZQorIyArICA8c2ln
bmF0dXJlIG9mIE1vZSBHaG91bD4sIDEgQXByaWwgMTk4OQorIyArICBNb2UgR2hvdWwsIFByZXNp
ZGVudCBvZiBWaWNlCisjICAKKyMgIFRoYXQncyBhbGwgdGhlcmUgaXMgdG8gaXQhCisjIAorIwor
CiBTVU1NQVJZID0gIlBlcmwgc2NyaXB0aW5nIGxhbmd1YWdlIgogSE9NRVBBR0UgPSAiaHR0cDov
L3d3dy5wZXJsLm9yZy8iCiBERVNDUklQVElPTiA9ICJQZXJsIGlzIGEgaGlnaGx5IGNhcGFibGUs
IGZlYXR1cmUtcmljaCBwcm9ncmFtbWluZyBsYW5ndWFnZSIKIFNFQ1RJT04gPSAiZGV2ZWwiCiBM
SUNFTlNFID0gIkFydGlzdGljLTEuMCB8IEdQTC0xLjAtb3ItbGF0ZXIiCi1MSUNfRklMRVNfQ0hL
U1VNID0gImZpbGU6Ly9Db3B5aW5nO21kNT01YjEyMmEzNmQwZjZkYzU1Mjc5YTBlYmM2OWYzYzYw
YiBcCitMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9Db3B5aW5nO21kNT04ZjdkZDA4NzNlNTk1
MzBhYmJiMzY1MDM5NzJhZmNkYiBcCiAgICAgICAgICAgICAgICAgICAgIGZpbGU6Ly9BcnRpc3Rp
YzttZDU9NzFhNGQ1ZDlhY2MxOGMwOTUyYTZkZjIyMThiYjY4ZGEgXAogICAgICAgICAgICAgICAg
ICAgICAiCiAKQEAgLTI0LDcgKzY2LDcgQEAgU1JDX1VSSTphcHBlbmQ6Y2xhc3MtdGFyZ2V0ID0g
IiBcCiAgICAgICAgICAgIGZpbGU6Ly9lbmNvZGVmaXgucGF0Y2ggXAogIgogCi1TUkNfVVJJW3Bl
cmwuc2hhMjU2c3VtXSA9ICIxMGQ0NjQ3Y2ZiYjU0M2E3ZjlhZTNlNWY2ODUxZWM0OTMwNTIzMmVh
NzYyMWFlZDI0YzdjZmJiMGJlZjRiNzBkIgorU1JDX1VSSVtwZXJsLnNoYTI1NnN1bV0gPSAiZTA5
M2VmMTg0ZDdmOWExYjk3OTdlMjQ2NTI5NmY1NTUxMGFkYjZkYWI4ODQyYjBjM2VkNTMzMjk2NjMw
OTZkYyIKIAogQiA9ICIke1dPUktESVJ9L3BlcmwtJHtQVn0tYnVpbGQiCiAKLS0gCjIuNDcuMQoK

--===============3661769861586890178==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 951 .bb files complete (0 cached, 951 parsed). 1954 targets, 47 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "5.2.99+snapshot-516ba0c00b1d56cfbff56531351aff5110745ca8"
TUNE_FEATURES        = "m64 x86-64-v3"
TARGET_FPU           = ""
meta                 = "tmp-auh-upgrades:516ba0c00b1d56cfbff56531351aff5110745ca8"
meta-yocto-bsp       
meta-poky            = "master:853589ccc3445f5952efc02a7102587cb4d4f075"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 399 Local 80 Mirrors 0 Missed 319 Current 369 (20% match, 58% complete)
done.
Removing 62 stale sstate objects for arch qemux86_64...done.
Removing 2 stale sstate objects for arch allarch...done.
Removing 41 stale sstate objects for arch x86_64...done.
Removing 144 stale sstate objects for arch x86-64-v3...done.
NOTE: Executing Tasks
NOTE: Running setscene task 486 of 768 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/dpkg/dpkg_1.22.21.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 517 of 768 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/perl/perl_5.42.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 525 of 768 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 540 of 768 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/docbook-xml/docbook-xml-dtd4_4.5.bb:do_create_spdx_setscene)
NOTE: Running setscene task 639 of 768 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/docbook-xml/docbook-xsl-stylesheets_1.79.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 697 of 768 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 711 of 768 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20251016-3.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 729 of 768 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/perl-cross/perlcross_1.6.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 762 of 768 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 764 of 768 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/perl/perl_5.42.0.bb:do_recipe_qa_setscene)
NOTE: recipe perl-5.42.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe docbook-xml-dtd4-native-4.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe openssl-3.5.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe opkg-utils-native-0.7.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe docbook-xsl-stylesheets-native-1.79.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe perlcross-native-1.6.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe dpkg-native-1.22.21-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libedit-native-20251016-3.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe perl-native-5.42.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1218 of 2132 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/initscripts/initscripts_1.0.bb:do_collect_spdx_deps)
NOTE: recipe openssl-native-3.5.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 1219 of 2132 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_collect_spdx_deps)
NOTE: recipe perl-5.42.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1221 of 2132 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/perl/perl_5.42.0.bb:do_fetch)
NOTE: recipe opkg-utils-native-0.7.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe docbook-xsl-stylesheets-native-1.79.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe openssl-3.5.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 1222 of 2132 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/docbook-xml/docbook-xsl-stylesheets_1.79.1.bb:do_fetch)
NOTE: Running task 1223 of 2132 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.4.bb:do_fetch)
NOTE: recipe dpkg-native-1.22.21-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe docbook-xml-dtd4-native-4.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running task 1224 of 2132 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_fetch)
NOTE: recipe perlcross-native-1.6.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libedit-native-20251016-3.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 766 of 768 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/perl-cross/perlcross_1.6.2.bb:do_populate_sysroot_setscene)
NOTE: recipe perl-native-5.42.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe openssl-native-3.5.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 1243 of 2132 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/perl/perl_5.42.0.bb:do_fetch)
NOTE: Running task 1244 of 2132 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.4.bb:do_fetch)
NOTE: Running task 1248 of 2132 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/dpkg/dpkg_1.22.21.bb:do_fetch)
NOTE: recipe update-rc.d-0.8+git-r0: task do_collect_spdx_deps: Started
NOTE: recipe initscripts-1.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe perl-5.42.0-r0: task do_fetch: Started
NOTE: recipe docbook-xsl-stylesheets-native-1.79.1-r0: task do_fetch: Started
NOTE: recipe openssl-3.5.4-r0: task do_fetch: Started
NOTE: recipe opkg-utils-native-0.7.0-r0: task do_fetch: Started
NOTE: recipe perl-5.42.0-r0: task do_fetch: Succeeded
NOTE: recipe perlcross-native-1.6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1251 of 2132 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/perl/perl_5.42.0.bb:do_unpack)
NOTE: recipe openssl-3.5.4-r0: task do_fetch: Succeeded
NOTE: Running task 1252 of 2132 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.4.bb:do_unpack)
NOTE: recipe perl-native-5.42.0-r0: task do_fetch: Started
NOTE: recipe openssl-native-3.5.4-r0: task do_fetch: Started
NOTE: recipe dpkg-native-1.22.21-r0: task do_fetch: Started
NOTE: recipe openssl-native-3.5.4-r0: task do_fetch: Succeeded
NOTE: recipe perl-native-5.42.0-r0: task do_fetch: Succeeded
NOTE: Running task 1253 of 2132 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.4.bb:do_unpack)
NOTE: Running task 1254 of 2132 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/perl/perl_5.42.0.bb:do_unpack)
NOTE: recipe perl-5.42.0-r0: task do_unpack: Started
NOTE: recipe openssl-3.5.4-r0: task do_unpack: Started
NOTE: recipe opkg-utils-native-0.7.0-r0: task do_fetch: Succeeded
NOTE: Running task 1255 of 2132 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_unpack)
NOTE: recipe perlcross-native-1.6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 768 of 768 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/perl-cross/perlcross_1.6.2.bb:do_recipe_qa_setscene)
NOTE: recipe perl-native-5.42.0-r0: task do_unpack: Started
NOTE: recipe openssl-native-3.5.4-r0: task do_unpack: Started
NOTE: recipe initscripts-1.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe dpkg-native-1.22.21-r0: task do_fetch: Succeeded
NOTE: recipe update-rc.d-0.8+git-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe opkg-utils-native-0.7.0-r0: task do_unpack: Started
NOTE: Running task 1256 of 2132 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/dpkg/dpkg_1.22.21.bb:do_unpack)
NOTE: recipe perlcross-native-1.6.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe perlcross-native-1.6.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1267 of 2132 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/perl/perl_5.42.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe dpkg-native-1.22.21-r0: task do_unpack: Started
NOTE: recipe perl-native-5.42.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe perl-native-5.42.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe opkg-utils-native-0.7.0-r0: task do_unpack: Succeeded
NOTE: Running task 1270 of 2132 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_patch)
NOTE: recipe opkg-utils-native-0.7.0-r0: task do_patch: Started
NOTE: recipe opkg-utils-native-0.7.0-r0: task do_patch: Succeeded
NOTE: recipe perl-5.42.0-r0: task do_unpack: Succeeded
NOTE: Running task 1272 of 2132 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/perl/perl_5.42.0.bb:do_patch)
NOTE: recipe perl-5.42.0-r0: task do_patch: Started
NOTE: recipe openssl-3.5.4-r0: task do_unpack: Succeeded
NOTE: Running task 1273 of 2132 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.4.bb:do_patch)
NOTE: recipe dpkg-native-1.22.21-r0: task do_unpack: Succeeded
NOTE: Running task 1274 of 2132 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/dpkg/dpkg_1.22.21.bb:do_patch)
NOTE: recipe openssl-3.5.4-r0: task do_patch: Started
NOTE: recipe dpkg-native-1.22.21-r0: task do_patch: Started
NOTE: recipe perl-native-5.42.0-r0: task do_unpack: Succeeded
NOTE: Running task 1275 of 2132 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/perl/perl_5.42.0.bb:do_patch)
NOTE: Running task 1276 of 2132 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/perl/perl_5.42.0.bb:do_collect_spdx_deps)
NOTE: recipe perl-5.42.0-r0: task do_patch: Succeeded
NOTE: Running task 1277 of 2132 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/perl/perl_5.42.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1278 of 2132 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/perl/perl_5.42.0.bb:do_populate_lic)
NOTE: recipe perl-native-5.42.0-r0: task do_patch: Started
NOTE: recipe perl-native-5.42.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe openssl-3.5.4-r0: task do_patch: Succeeded
NOTE: recipe perl-native-5.42.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe perl-5.42.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe perl-5.42.0-r0: task do_populate_lic: Started
NOTE: recipe perl-5.42.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/perl/perl_5.42.0.bb:do_deploy_source_date_epoch unihash changed to dd5d66cf35710d33ab9ce1dc858f3c35a7e3ae85ac0f273450737ec0aeb42137
NOTE: recipe perl-5.42.0-r0: task do_populate_lic: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/perl/perl_5.42.0.bb:do_populate_lic unihash changed to c208bfcb7e149cd230506550772c5f6cef25b302d97bee28f8647bd016647189
NOTE: Setscene tasks completed
NOTE: recipe dpkg-native-1.22.21-r0: task do_patch: Succeeded
NOTE: recipe docbook-xsl-stylesheets-native-1.79.1-r0: task do_fetch: Succeeded
NOTE: Running task 1281 of 2132 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/docbook-xml/docbook-xsl-stylesheets_1.79.1.bb:do_unpack)
NOTE: Running task 1282 of 2132 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/docbook-xml/docbook-xsl-stylesheets_1.79.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe openssl-native-3.5.4-r0: task do_unpack: Succeeded
NOTE: Running task 1283 of 2132 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.4.bb:do_patch)
NOTE: recipe docbook-xsl-stylesheets-native-1.79.1-r0: task do_unpack: Started
NOTE: recipe docbook-xsl-stylesheets-native-1.79.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe openssl-native-3.5.4-r0: task do_patch: Started
NOTE: recipe docbook-xsl-stylesheets-native-1.79.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe openssl-native-3.5.4-r0: task do_patch: Succeeded
NOTE: recipe docbook-xsl-stylesheets-native-1.79.1-r0: task do_unpack: Succeeded
NOTE: Running task 1285 of 2132 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/docbook-xml/docbook-xsl-stylesheets_1.79.1.bb:do_patch)
NOTE: Running task 1286 of 2132 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/docbook-xml/docbook-xsl-stylesheets_1.79.1.bb:do_collect_spdx_deps)
NOTE: recipe docbook-xsl-stylesheets-native-1.79.1-r0: task do_patch: Started
NOTE: recipe docbook-xsl-stylesheets-native-1.79.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe docbook-xsl-stylesheets-native-1.79.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe docbook-xsl-stylesheets-native-1.79.1-r0: task do_patch: Succeeded
NOTE: Running task 1288 of 2132 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/docbook-xml/docbook-xsl-stylesheets_1.79.1.bb:do_configure)
NOTE: recipe docbook-xsl-stylesheets-native-1.79.1-r0: task do_configure: Started
NOTE: recipe docbook-xsl-stylesheets-native-1.79.1-r0: task do_configure: Succeeded
NOTE: Running task 1289 of 2132 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/docbook-xml/docbook-xsl-stylesheets_1.79.1.bb:do_compile)
NOTE: recipe docbook-xsl-stylesheets-native-1.79.1-r0: task do_compile: Started
NOTE: recipe docbook-xsl-stylesheets-native-1.79.1-r0: task do_compile: Succeeded
NOTE: Running task 1290 of 2132 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/docbook-xml/docbook-xsl-stylesheets_1.79.1.bb:do_install)
NOTE: recipe docbook-xsl-stylesheets-native-1.79.1-r0: task do_install: Started
NOTE: recipe docbook-xsl-stylesheets-native-1.79.1-r0: task do_install: Succeeded
NOTE: recipe perl-native-5.42.0-r0: task do_patch: Failed
NOTE: Tasks Summary: Attempted 1290 tasks of which 1258 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260101065636.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260101065636.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/perl/perl_5.42.0.bb:do_patch
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/perl-native/5.42.0/temp/log.do_patch.2444134
Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: perl-native-5.42.0-r0 do_patch: Applying patch 'perl-configpm-switch.patch' on target directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/perl-native/5.42.0/sources/perl-5.42.0'
CmdError('quilt --quiltrc /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/perl-native/5.42.0/recipe-sysroot-native/etc/quiltrc push', 0, 'stdout: Patch perl-configpm-switch.patch is already applied; check your series file

stderr: ')
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/perl-native/5.42.0/temp/log.do_patch.2444134
ERROR: Task (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/perl/perl_5.42.0.bb:do_patch) failed with exit code '1'

--===============3661769861586890178==--

