Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49F81CCFA1D
	for <webhook@archiver.kernel.org>; Wed,  5 Nov 2025 23:16:23 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2357.1762384577815006049
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Nov 2025 15:16:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=WqM36TJU;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=Zi9CXU+x;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101019a564e9264-653dcdb6-4737-4e0b-baef-8f0665c040b1-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1762384581;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=gQfhtHaWpPYQvN0aiBOqas4MTXz6VZvFDKdN5KYArKk=;
	b=WqM36TJUQfC0DN0tkYo+xjN7voukbPLhRa/a9HUcU3moBdWNAAvHoHZ+QIVeV+JM
	v3IrZDrWGAp+UKQuipIfU0wM8Ci2Mri/SKH1Zr4V1ez5v/aGwwGvCRTXK/gdQy/9Oja
	tQu+k2iA0ZIXOmR7/88CbWzz7ixKaVruwhw9IWu8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1762384581;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=gQfhtHaWpPYQvN0aiBOqas4MTXz6VZvFDKdN5KYArKk=;
	b=Zi9CXU+xiI7x9peVr2H8M40moMEhBc+o3/QxPtNcE3ycWo49JwxNRcvn89TdWIC6
	S4CtDI10jVQ4Q96ywh/oNJ2HMNcrv5bZ8vumYFG9/VSTs5tO5ZDP4pou8ZBXHPObJCo
	2zganPBOp3tcrbWAyO9S76hHkPb6P25TnGcsQaSI=
Content-Type: multipart/mixed; boundary="===============0196051039569994432=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] perl: upgrading to 5.42.0 FAILED
Message-ID: <0101019a564e9264-653dcdb6-4737-4e0b-baef-8f0665c040b1-000000@us-west-2.amazonses.com>
Date: Wed, 5 Nov 2025 23:16:21 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.11.05-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Nov 2025 23:16:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225819

--===============0196051039569994432==
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
From 2a71ca94198255b14fd552dd0e0a1428d2a77819 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 5 Nov 2025 16:32:30 +0000
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
index 2076c61ee0..47e26a0db9 100644
--- a/meta/recipes-devtools/perl/files/0001-Somehow-this-module-breaks-through-the-perl-wrapper-.patch
+++ b/meta/recipes-devtools/perl/files/0001-Somehow-this-module-breaks-through-the-perl-wrapper-.patch
@@ -1,4 +1,4 @@
-From 47cd22cd213d2c5f28e674b12c264dc731682560 Mon Sep 17 00:00:00 2001
+From 9ffcaeadf5dc59e22baf98d6df37068d3215af6d Mon Sep 17 00:00:00 2001
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
index 7e5d08d8db..95a38a3b07 100644
--- a/meta/recipes-devtools/perl/files/0001-cpan-Sys-Syslog-Makefile.PL-Fix-_PATH_LOG-for-determ.patch
+++ b/meta/recipes-devtools/perl/files/0001-cpan-Sys-Syslog-Makefile.PL-Fix-_PATH_LOG-for-determ.patch
@@ -1,4 +1,4 @@
-From 322972384e0795be339252f7cf9a318dc759b51e Mon Sep 17 00:00:00 2001
+From cee031f155e783fe96950362891d4cff09fc3f9b Mon Sep 17 00:00:00 2001
 From: Robert Yang <liezhi.yang@windriver.com>
 Date: Fri, 18 Feb 2022 09:44:26 +0000
 Subject: [PATCH] cpan/Sys-Syslog/Makefile.PL: Fix _PATH_LOG for deterministic
diff --git a/meta/recipes-devtools/perl/files/0002-Constant-Fix-up-shebang.patch b/meta/recipes-devtools/perl/files/0002-Constant-Fix-up-shebang.patch
index 80986e66da..edf2eff98e 100644
--- a/meta/recipes-devtools/perl/files/0002-Constant-Fix-up-shebang.patch
+++ b/meta/recipes-devtools/perl/files/0002-Constant-Fix-up-shebang.patch
@@ -1,4 +1,4 @@
-From a02355bdc8cde1115daf101675cdfb707d337bf1 Mon Sep 17 00:00:00 2001
+From 167dbc094bf57339086eb0039ae58a1c1c7248ff Mon Sep 17 00:00:00 2001
 From: Joshua Watt <JPEWhacker@gmail.com>
 Date: Mon, 17 Jun 2019 10:47:23 -0500
 Subject: [PATCH] Constant: Fix up shebang
diff --git a/meta/recipes-devtools/perl/files/determinism.patch b/meta/recipes-devtools/perl/files/determinism.patch
index bdb9a928bb..fb4cc67344 100644
--- a/meta/recipes-devtools/perl/files/determinism.patch
+++ b/meta/recipes-devtools/perl/files/determinism.patch
@@ -1,4 +1,4 @@
-From 5c4fd57daf125357262aa796057d7be8e78d378e Mon Sep 17 00:00:00 2001
+From 80b242d1ce2e2272d014e228984fe6a030286ce7 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Wed, 5 Feb 2020 23:54:02 +0000
 Subject: [PATCH] Fixes to make the perl build reproducible:
diff --git a/meta/recipes-devtools/perl/files/encodefix.patch b/meta/recipes-devtools/perl/files/encodefix.patch
index 665699d12d..c602ef5861 100644
--- a/meta/recipes-devtools/perl/files/encodefix.patch
+++ b/meta/recipes-devtools/perl/files/encodefix.patch
@@ -1,4 +1,4 @@
-From a4e22c7f2a519f24bc8aa89c6677017c0fe13679 Mon Sep 17 00:00:00 2001
+From d1a5b3657a6c44bdaeba67571092a21da5319f7b Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Tue, 18 Feb 2020 17:27:26 +0000
 Subject: [PATCH] perl: Fix encode module reproducibility issues
diff --git a/meta/recipes-devtools/perl/files/errno_ver.diff b/meta/recipes-devtools/perl/files/errno_ver.diff
index 477642f457..8905f8bcbf 100644
--- a/meta/recipes-devtools/perl/files/errno_ver.diff
+++ b/meta/recipes-devtools/perl/files/errno_ver.diff
@@ -1,4 +1,4 @@
-From 9c404d4b1c3607e827fb56b5ae4f8fbbdb52cd0b Mon Sep 17 00:00:00 2001
+From ab2d9ffab2e441c92fa14763c6d92ffb1d593df5 Mon Sep 17 00:00:00 2001
 From: Brendan O'Dea <bod@debian.org>
 Date: Fri, 16 Dec 2005 01:32:14 +1100
 Subject: [PATCH] Remove Errno version check due to upgrade problems with
diff --git a/meta/recipes-devtools/perl/files/native-perlinc.patch b/meta/recipes-devtools/perl/files/native-perlinc.patch
index 7e3e5f6652..70dda5c64a 100644
--- a/meta/recipes-devtools/perl/files/native-perlinc.patch
+++ b/meta/recipes-devtools/perl/files/native-perlinc.patch
@@ -1,4 +1,4 @@
-From 9fec62b19a49d1451fd1120c5dc38baf59f73856 Mon Sep 17 00:00:00 2001
+From da7fc761c681ffe0565ffe8f2601c3bc9ece8aab Mon Sep 17 00:00:00 2001
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
index 3721277933..340ff0225d 100644
--- a/meta/recipes-devtools/perl/files/perl-configpm-switch.patch
+++ b/meta/recipes-devtools/perl/files/perl-configpm-switch.patch
@@ -1,4 +1,4 @@
-From 7a48538a7e8614a3342151b646d2105c0cb0cdd9 Mon Sep 17 00:00:00 2001
+From 9f7c49cc565feeae999062eda4eb3b2528ce10c9 Mon Sep 17 00:00:00 2001
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
index 5472602d3a..b7cc1b22c7 100644
--- a/meta/recipes-devtools/perl/files/perl-dynloader.patch
+++ b/meta/recipes-devtools/perl/files/perl-dynloader.patch
@@ -1,4 +1,4 @@
-From 25a26c52c320e699b37a7ad1f4f045bc8aa4cb00 Mon Sep 17 00:00:00 2001
+From f538e37b63c25428d1db7cf90837ce329d05a1eb Mon Sep 17 00:00:00 2001
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


--===============0196051039569994432==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1947 entries from dependency cache.
Parsing recipes...done.
Parsing of 948 .bb files complete (947 cached, 1 parsed). 1945 targets, 47 skipped, 0 masked, 0 errors.
Removing 1 recipes from the qemux86_64 sysroot...done.
Removing 1 recipes from the x86-64-v3 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.15.2"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2.99+snapshot-650ce7d9362ad548603126e73b602bce924e5a81"
TUNE_FEATURES        = "m64 x86-64-v3"
TARGET_FPU           = ""
meta                 = "tmp-auh-upgrades:650ce7d9362ad548603126e73b602bce924e5a81"
meta-yocto-bsp       
meta-poky            = "master:66ea31cee15309af07afeee8dec8a6fe1d92d28e"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 493 Local 167 Mirrors 0 Missed 326 Current 270 (33% match, 57% complete)
Removing 39 stale sstate objects for arch x86_64...done.
Removing 62 stale sstate objects for arch qemux86_64...done.
Removing 49 stale sstate objects for arch x86-64-v3...done.
Removing 2 stale sstate objects for arch allarch...done.
NOTE: Executing Tasks
NOTE: Running setscene task 363 of 763 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 370 of 763 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/dpkg/dpkg_1.22.21.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 377 of 763 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 388 of 763 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/gawk/gawk_5.3.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 389 of 763 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/systemd/systemd_257.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 397 of 763 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/readline/readline_8.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 409 of 763 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 414 of 763 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/make/make_4.4.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 422 of 763 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/sed/sed_4.9.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 424 of 763 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc-locale_2.42.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 430 of 763 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/procps/procps_4.0.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 437 of 763 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/perl/perl_5.42.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 440 of 763 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 441 of 763 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 444 of 763 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 456 of 763 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe psmisc-23.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe glibc-locale-2.42+git-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe readline-8.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe make-4.4.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gawk-5.3.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sed-4.9-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe mpfr-4.2.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe procps-4.0.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe perl-5.42.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe dpkg-native-1.22.21-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe opkg-utils-native-0.7.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe systemd-1_257.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 467 of 763 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 471 of 763 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe psmisc-23.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 473 of 763 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.76.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe make-4.4.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe glibc-locale-2.42+git-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe readline-8.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 481 of 763 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.3.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 484 of 763 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.11.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 486 of 763 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.45.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gawk-5.3.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe mpfr-4.2.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe procps-4.0.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libseccomp-2.6.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 488 of 763 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/gawk/gawk_5.3.2.bb:do_recipe_qa_setscene)
NOTE: recipe sed-4.9-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe perl-5.42.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 491 of 763 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 496 of 763 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 502 of 763 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe dpkg-native-1.22.21-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 512 of 763 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 516 of 763 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/kmod/kmod_34.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 520 of 763 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe opkg-utils-native-0.7.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe systemd-1_257.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 525 of 763 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.86.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 538 of 763 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/systemd/systemd_257.8.bb:do_recipe_qa_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 546 of 763 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libcap-2.76-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxkbcommon-1.11.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xkeyboard-config-2.45-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gawk-5.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe psmisc-23.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe mpfr-4.2.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 548 of 763 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe shadow-4.18.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-passwd-3.6.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 551 of 763 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.5.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe kmod-34.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libcap-2.76-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 553 of 763 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/initscripts/initscripts_1.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe glib-2.0-1_2.86.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xkeyboard-config-2.45-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxkbcommon-1.11.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 558 of 763 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 562 of 763 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.14.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gawk-5.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe mpfr-4.2.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe psmisc-23.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe systemd-1_257.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 567 of 763 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 569 of 763 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 570 of 763 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe shadow-4.18.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe base-passwd-3.6.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 574 of 763 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 575 of 763 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.45.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 578 of 763 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe kmod-34.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 580 of 763 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.86.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe wayland-1.24.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe glib-2.0-1_2.86.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 582 of 763 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.11.0.bb:do_recipe_qa_setscene)
NOTE: recipe attr-2.5.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 590 of 763 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/kmod/kmod_34.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 594 of 763 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_recipe_qa_setscene)
NOTE: recipe systemd-1_257.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 595 of 763 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxcb-1.17.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxml2-2.14.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe wayland-1.24.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 596 of 763 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.14.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gobject-introspection-1.84.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xkeyboard-config-2.45-r0: task do_recipe_qa_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 597 of 763 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_recipe_qa_setscene)
NOTE: recipe glib-2.0-initial-1_2.86.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-linux-2.41.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxkbcommon-1.11.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 598 of 763 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.46.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe shadow-4.18.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe kmod-34.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 599 of 763 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.7.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 600 of 763 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxml2-2.14.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 601 of 763 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/initscripts/initscripts_1.0.bb:do_recipe_qa_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gobject-introspection-1.84.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.45-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 610 of 763 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.86.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 611 of 763 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 612 of 763 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe shared-mime-info-2.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxkbcommon-1.11.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-2.41.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 614 of 763 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 615 of 763 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.14.6.bb:do_recipe_qa_setscene)
NOTE: recipe shadow-4.18.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 616 of 763 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xcb-proto-1.17.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 619 of 763 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_80.9.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxml2-native-2.14.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe glib-2.0-initial-1_2.86.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 621 of 763 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe kmod-34.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 626 of 763 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 629 of 763 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libpcre2-10.46-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-passwd-3.6.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe wayland-1.24.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 632 of 763 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc-initial_15.2.bb:do_create_spdx_setscene)
NOTE: recipe glib-2.0-1_2.86.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxml2-native-2.14.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 635 of 763 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_recipe_qa_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpcre2-10.46-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe base-passwd-3.6.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-setuptools-80.9.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 636 of 763 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils-cross_2.45.bb:do_create_spdx_setscene)
NOTE: recipe libxml2-2.14.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 638 of 763 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 639 of 763 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.13.9.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe util-macros-1_1.20.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 642 of 763 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxcrypt/libxcrypt_4.4.38.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xorgproto-2024.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpam-1.7.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe wayland-1.24.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 648 of 763 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_recipe_qa_setscene)
NOTE: recipe libgcc-initial-15.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.86.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 651 of 763 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 652 of 763 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_recipe_qa_setscene)
NOTE: recipe bash-completion-2.16.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 670 of 763 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxml2-2.14.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 671 of 763 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.86.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.45-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 672 of 763 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 673 of 763 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_recipe_qa_setscene)
NOTE: recipe libpam-1.7.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxcrypt-4.4.38-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 674 of 763 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe util-linux-2.41.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-setuptools-80.9.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libgcc-initial-15.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 675 of 763 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 676 of 763 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 677 of 763 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gobject-introspection-1.84.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-3.13.9-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 678 of 763 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.46.bb:do_recipe_qa_setscene)
NOTE: recipe libxcrypt-4.4.38-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 679 of 763 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe binutils-cross-x86_64-2.45-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe glib-2.0-initial-1_2.86.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-3.5.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 680 of 763 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxau-1_1.0.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xorgproto-2024.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-linux-2.41.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 682 of 763 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_recipe_qa_setscene)
NOTE: recipe libcap-ng-0.8.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gobject-introspection-1.84.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-3.13.9-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 683 of 763 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.7.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xcb-proto-1.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 685 of 763 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_80.9.0.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-libuuid-2.41.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 686 of 763 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libffi-3.5.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe sqlite3-3_3.48.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 688 of 763 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxau-1_1.0.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpcre2-10.46-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-3.5.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 689 of 763 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 698 of 763 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libedit-20250104-3.1-r1: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 702 of 763 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 707 of 763 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe glib-2.0-initial-1_2.86.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gdbm-1.26-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 711 of 763 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_create_spdx_setscene)
NOTE: recipe bash-completion-2.16.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-libuuid-2.41.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe sqlite3-3_3.48.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 715 of 763 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 724 of 763 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc_2.42.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libpcre2-10.46-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-setuptools-80.9.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 725 of 763 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc-initial_15.2.bb:do_populate_sysroot_setscene)
NOTE: recipe expat-2.7.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libffi-3.5.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xz-5.8.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 731 of 763 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.17.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libtool-cross-2.5.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 754 of 763 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 757 of 763 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/perl/perl_5.42.0.bb:do_recipe_qa_setscene)
NOTE: recipe ncurses-6.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-15.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-setuptools-80.9.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libedit-native-20250104-3.1-r1: task do_create_spdx_setscene: Started
NOTE: recipe xz-5.8.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libgcc-15.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libgcc-initial-15.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtool-cross-2.5.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.17-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe glibc-2.42+git-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe expat-2.7.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gcc-runtime-15.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libgcc-15.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe perl-native-5.42.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-native-3.5.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe linux-libc-headers-6.17-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe glibc-2.42+git-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libedit-native-20250104-3.1-r1: task do_create_spdx_setscene: Succeeded
NOTE: recipe perl-native-5.42.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe openssl-native-3.5.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libgcc-initial-15.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 310 of 2118 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/perl/perl_5.42.0.bb:do_fetch)
NOTE: Running setscene task 759 of 763 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-cross_15.2.bb:do_gcc_stash_builddir_setscene)
NOTE: Running setscene task 760 of 763 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc-initial_15.2.bb:do_recipe_qa_setscene)
NOTE: Running task 318 of 2118 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.4.bb:do_fetch)
NOTE: Running task 358 of 2118 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.17.bb:do_fetch)
NOTE: Running task 469 of 2118 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc_2.42.bb:do_fetch)
NOTE: recipe gcc-cross-x86_64-15.2.0-r0: task do_gcc_stash_builddir_setscene: Started
NOTE: recipe libgcc-initial-15.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running noexec task 521 of 2118 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_fetch)
NOTE: Running noexec task 531 of 2118 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_fetch)
NOTE: Running task 533 of 2118 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_fetch)
NOTE: Running task 537 of 2118 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_fetch)
NOTE: Running task 545 of 2118 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.1.bb:do_fetch)
NOTE: Running task 547 of 2118 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.7.3.bb:do_fetch)
NOTE: Running task 549 of 2118 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_fetch)
NOTE: Running task 551 of 2118 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_fetch)
NOTE: recipe linux-libc-headers-6.17-r0: task do_fetch: Started
NOTE: Running task 554 of 2118 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.4.bb:do_fetch)
NOTE: Running task 555 of 2118 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.1.bb:do_fetch)
NOTE: recipe perl-native-5.42.0-r0: task do_fetch: Started
NOTE: recipe linux-libc-headers-6.17-r0: task do_fetch: Succeeded
NOTE: Running task 594 of 2118 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.17.bb:do_unpack)
NOTE: Running task 595 of 2118 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.17.bb:do_prepare_recipe_sysroot)
NOTE: recipe openssl-native-3.5.4-r0: task do_fetch: Started
NOTE: Running task 609 of 2118 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.5.bb:do_fetch)
NOTE: recipe perl-native-5.42.0-r0: task do_fetch: Succeeded
NOTE: recipe libgcc-initial-15.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 610 of 2118 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/perl/perl_5.42.0.bb:do_unpack)
NOTE: Running task 611 of 2118 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/perl/perl_5.42.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libtool-cross-2.5.4-r0: task do_fetch: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_fetch: Started
NOTE: recipe glibc-2.42+git-r0: task do_fetch: Started
NOTE: recipe zlib-1.3.1-r0: task do_fetch: Started
NOTE: recipe openssl-native-3.5.4-r0: task do_fetch: Succeeded
NOTE: recipe expat-2.7.3-r0: task do_fetch: Started
NOTE: recipe bzip2-1.0.8-r0: task do_fetch: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_fetch: Succeeded
NOTE: recipe gdbm-1.26-r0: task do_fetch: Started
NOTE: Running task 612 of 2118 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.4.bb:do_unpack)
NOTE: recipe zlib-1.3.1-r0: task do_fetch: Succeeded
NOTE: recipe openssl-3.5.4-r0: task do_fetch: Started
NOTE: recipe xz-5.8.1-r0: task do_fetch: Started
NOTE: Running task 615 of 2118 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_unpack)
NOTE: Running task 616 of 2118 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.1.bb:do_unpack)
NOTE: recipe glibc-2.42+git-r0: task do_fetch: Succeeded
NOTE: recipe linux-libc-headers-6.17-r0: task do_unpack: Started
NOTE: recipe gdbm-1.26-r0: task do_fetch: Succeeded
NOTE: recipe linux-libc-headers-6.17-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 617 of 2118 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc_2.42.bb:do_unpack)
NOTE: Running task 618 of 2118 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_unpack)
NOTE: recipe openssl-3.5.4-r0: task do_fetch: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_fetch: Started
NOTE: Running task 619 of 2118 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.4.bb:do_unpack)
NOTE: recipe xz-5.8.1-r0: task do_fetch: Succeeded
NOTE: recipe expat-2.7.3-r0: task do_fetch: Succeeded
NOTE: Running task 620 of 2118 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.1.bb:do_unpack)
NOTE: Running task 621 of 2118 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.7.3.bb:do_unpack)
NOTE: recipe perl-native-5.42.0-r0: task do_unpack: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_unpack: Started
NOTE: recipe perl-native-5.42.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe zlib-1.3.1-r0: task do_unpack: Started
NOTE: recipe linux-libc-headers-6.17-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 623 of 2118 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxcrypt/libxcrypt_4.4.38.bb:do_fetch)
NOTE: recipe gdbm-1.26-r0: task do_unpack: Started
NOTE: recipe openssl-native-3.5.4-r0: task do_unpack: Started
NOTE: recipe glibc-2.42+git-r0: task do_unpack: Started
NOTE: recipe openssl-3.5.4-r0: task do_unpack: Started
NOTE: recipe xz-5.8.1-r0: task do_unpack: Started
NOTE: recipe expat-2.7.3-r0: task do_unpack: Started
NOTE: recipe bzip2-1.0.8-r0: task do_fetch: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_unpack: Succeeded
NOTE: Running task 624 of 2118 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_unpack)
NOTE: Running task 625 of 2118 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.1.bb:do_patch)
NOTE: recipe perl-native-5.42.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxcrypt-4.4.38-r0: task do_fetch: Started
NOTE: recipe ncurses-6.5-r0: task do_fetch: Succeeded
NOTE: Running task 651 of 2118 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.5.bb:do_unpack)
NOTE: recipe gdbm-1.26-r0: task do_unpack: Succeeded
NOTE: recipe libtool-cross-2.5.4-r0: task do_unpack: Succeeded
NOTE: Running task 679 of 2118 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_fetch)
NOTE: Running task 680 of 2118 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_patch)
NOTE: Running task 681 of 2118 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_patch)
NOTE: recipe xz-5.8.1-r0: task do_unpack: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_patch: Started
NOTE: recipe bzip2-1.0.8-r0: task do_unpack: Started
NOTE: Running task 682 of 2118 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.1.bb:do_patch)
NOTE: recipe opkg-utils-0.7.0-r0: task do_fetch: Succeeded
NOTE: recipe expat-2.7.3-r0: task do_unpack: Succeeded
NOTE: Running task 683 of 2118 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.7.3.bb:do_patch)
NOTE: Running task 684 of 2118 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_unpack)
NOTE: recipe ncurses-6.5-r0: task do_unpack: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_patch: Started
NOTE: recipe libffi-3.5.2-r0: task do_fetch: Started
NOTE: recipe gdbm-1.26-r0: task do_patch: Started
NOTE: recipe libffi-3.5.2-r0: task do_fetch: Succeeded
NOTE: Running task 689 of 2118 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_fetch)
NOTE: recipe xz-5.8.1-r0: task do_patch: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_unpack: Started
NOTE: recipe expat-2.7.3-r0: task do_patch: Started
NOTE: recipe sqlite3-3_3.48.0-r0: task do_fetch: Started
NOTE: recipe zlib-1.3.1-r0: task do_patch: Succeeded
NOTE: Running task 691 of 2118 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.1.bb:do_fetch)
NOTE: recipe libxcrypt-4.4.38-r0: task do_fetch: Succeeded
NOTE: Running task 692 of 2118 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxcrypt/libxcrypt_4.4.38.bb:do_unpack)
NOTE: recipe xz-5.8.1-r0: task do_patch: Succeeded
NOTE: recipe sqlite3-3_3.48.0-r0: task do_fetch: Succeeded
NOTE: Running task 703 of 2118 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_fetch)
NOTE: Running task 705 of 2118 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.13.9.bb:do_fetch)
NOTE: recipe expat-2.7.3-r0: task do_patch: Succeeded
NOTE: recipe gdbm-1.26-r0: task do_patch: Succeeded
NOTE: Running task 707 of 2118 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.7.3.bb:do_generate_toolchain_file)
NOTE: Running task 734 of 2118 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_unpack)
NOTE: recipe util-linux-libuuid-2.41.1-r0: task do_fetch: Started
NOTE: recipe libxcrypt-4.4.38-r0: task do_unpack: Started
NOTE: recipe util-linux-libuuid-2.41.1-r0: task do_fetch: Succeeded
NOTE: Running task 736 of 2118 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.14.6.bb:do_fetch)
NOTE: recipe libedit-20250104-3.1-r1: task do_fetch: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_fetch: Succeeded
NOTE: recipe expat-2.7.3-r0: task do_generate_toolchain_file: Started
NOTE: Running task 740 of 2118 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.1.bb:do_fetch)
NOTE: recipe libffi-3.5.2-r0: task do_unpack: Started
NOTE: recipe python3-3.13.9-r0: task do_fetch: Started
NOTE: recipe expat-2.7.3-r0: task do_generate_toolchain_file: Succeeded
NOTE: Running task 741 of 2118 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_unpack)
NOTE: recipe libxml2-native-2.14.6-r0: task do_fetch: Started
NOTE: recipe python3-3.13.9-r0: task do_fetch: Succeeded
NOTE: recipe libpam-1.7.1-r0: task do_fetch: Started
NOTE: recipe libxml2-native-2.14.6-r0: task do_fetch: Succeeded
NOTE: Running task 742 of 2118 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.1.bb:do_unpack)
NOTE: Running task 743 of 2118 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_unpack)
NOTE: recipe libpam-1.7.1-r0: task do_fetch: Succeeded
NOTE: recipe libffi-3.5.2-r0: task do_unpack: Succeeded
NOTE: Running task 744 of 2118 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.13.9.bb:do_unpack)
NOTE: Running task 745 of 2118 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_patch)
NOTE: recipe sqlite3-3_3.48.0-r0: task do_unpack: Started
NOTE: recipe bzip2-1.0.8-r0: task do_unpack: Succeeded
NOTE: Running task 746 of 2118 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_patch)
NOTE: recipe opkg-utils-0.7.0-r0: task do_unpack: Succeeded
NOTE: recipe util-linux-libuuid-2.41.1-r0: task do_unpack: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_unpack: Started
NOTE: Running task 747 of 2118 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_patch)
NOTE: recipe libffi-3.5.2-r0: task do_patch: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_unpack: Succeeded
NOTE: recipe sqlite3-3_3.48.0-r0: task do_unpack: Succeeded
NOTE: Running task 748 of 2118 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_patch)
NOTE: recipe bzip2-1.0.8-r0: task do_patch: Started
NOTE: Running task 749 of 2118 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_patch)
NOTE: recipe python3-3.13.9-r0: task do_unpack: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_patch: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_patch: Succeeded
NOTE: recipe libedit-20250104-3.1-r1: task do_patch: Started
NOTE: recipe sqlite3-3_3.48.0-r0: task do_patch: Started
NOTE: Running task 769 of 2118 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.14.6.bb:do_unpack)
NOTE: recipe ncurses-6.5-r0: task do_unpack: Succeeded
NOTE: Running task 770 of 2118 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.5.bb:do_patch)
NOTE: recipe libxcrypt-4.4.38-r0: task do_unpack: Succeeded
NOTE: Running task 771 of 2118 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxcrypt/libxcrypt_4.4.38.bb:do_patch)
NOTE: recipe opkg-utils-0.7.0-r0: task do_patch: Succeeded
NOTE: Running task 773 of 2118 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.1.bb:do_unpack)
NOTE: recipe bzip2-1.0.8-r0: task do_patch: Succeeded
NOTE: recipe libffi-3.5.2-r0: task do_patch: Succeeded
NOTE: recipe sqlite3-3_3.48.0-r0: task do_patch: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_patch: Started
NOTE: Running task 806 of 2118 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_fetch)
NOTE: recipe libxcrypt-4.4.38-r0: task do_patch: Started
NOTE: Running task 809 of 2118 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.1.bb:do_write_config)
NOTE: Running task 813 of 2118 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.46.bb:do_fetch)
NOTE: recipe libxml2-native-2.14.6-r0: task do_unpack: Started
NOTE: recipe perl-native-5.42.0-r0: task do_unpack: Succeeded
NOTE: Running task 814 of 2118 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/perl/perl_5.42.0.bb:do_patch)
NOTE: recipe libedit-20250104-3.1-r1: task do_patch: Succeeded
NOTE: Running task 815 of 2118 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/perl/perl_5.42.0.bb:do_collect_spdx_deps)
NOTE: recipe libpam-1.7.1-r0: task do_unpack: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_fetch: Started
NOTE: recipe libpcre2-10.46-r0: task do_fetch: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_fetch: Succeeded
NOTE: recipe libpam-1.7.1-r0: task do_write_config: Started
NOTE: Running task 817 of 2118 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_unpack)
NOTE: recipe libxcrypt-4.4.38-r0: task do_patch: Succeeded
NOTE: Running task 820 of 2118 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.86.0.bb:do_fetch)
NOTE: recipe libpcre2-10.46-r0: task do_fetch: Succeeded
NOTE: Running task 823 of 2118 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.46.bb:do_unpack)
NOTE: recipe perl-native-5.42.0-r0: task do_patch: Started
NOTE: recipe libpam-1.7.1-r0: task do_write_config: Succeeded
NOTE: Running task 825 of 2118 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.14.6.bb:do_fetch)
NOTE: recipe bash-completion-2.16.0-r0: task do_unpack: Started
NOTE: recipe perl-native-5.42.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe glib-2.0-initial-1_2.86.0-r0: task do_fetch: Started
NOTE: recipe libpcre2-10.46-r0: task do_unpack: Started
NOTE: recipe perl-native-5.42.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe glib-2.0-initial-1_2.86.0-r0: task do_fetch: Succeeded
NOTE: Running task 829 of 2118 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_fetch)
NOTE: Running task 830 of 2118 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.86.0.bb:do_unpack)
NOTE: recipe util-linux-libuuid-2.41.1-r0: task do_unpack: Succeeded
NOTE: recipe libxml2-2.14.6-r0: task do_fetch: Started
NOTE: Running task 831 of 2118 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.1.bb:do_patch)
NOTE: recipe openssl-native-3.5.4-r0: task do_unpack: Succeeded
NOTE: recipe libcap-ng-0.8.5-r0: task do_fetch: Started
NOTE: recipe libpam-1.7.1-r0: task do_unpack: Succeeded
NOTE: Running task 832 of 2118 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.4.bb:do_patch)
NOTE: Running task 833 of 2118 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.1.bb:do_patch)
NOTE: recipe glib-2.0-initial-1_2.86.0-r0: task do_unpack: Started
NOTE: recipe util-linux-libuuid-2.41.1-r0: task do_patch: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_unpack: Succeeded
NOTE: Running task 834 of 2118 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_patch)
NOTE: recipe ncurses-6.5-r0: task do_patch: Succeeded
NOTE: recipe libpam-1.7.1-r0: task do_patch: Started
NOTE: Running task 837 of 2118 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.1.bb:do_fetch)
NOTE: recipe openssl-native-3.5.4-r0: task do_patch: Started
NOTE: recipe libxml2-2.14.6-r0: task do_fetch: Succeeded
NOTE: Running task 841 of 2118 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.5.2.bb:do_fetch)
NOTE: recipe libpam-1.7.1-r0: task do_patch: Succeeded
NOTE: recipe bash-completion-2.16.0-r0: task do_patch: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_fetch: Succeeded
NOTE: Running task 843 of 2118 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.14.6.bb:do_unpack)
NOTE: Running task 846 of 2118 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_unpack)
NOTE: recipe libpcre2-10.46-r0: task do_unpack: Succeeded
NOTE: recipe bash-completion-2.16.0-r0: task do_patch: Succeeded
NOTE: Running task 847 of 2118 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.46.bb:do_patch)
NOTE: Running task 849 of 2118 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.86.0.bb:do_write_config)
NOTE: recipe util-linux-2.41.1-r0: task do_fetch: Started
NOTE: recipe attr-2.5.2-r0: task do_fetch: Started
NOTE: recipe util-linux-2.41.1-r0: task do_fetch: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_fetch: Succeeded
NOTE: Running task 850 of 2118 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.1.bb:do_unpack)
NOTE: recipe libcap-ng-0.8.5-r0: task do_unpack: Started
NOTE: recipe libxml2-2.14.6-r0: task do_unpack: Started
NOTE: Running task 853 of 2118 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.5.2.bb:do_unpack)
NOTE: recipe libpcre2-10.46-r0: task do_patch: Started
NOTE: recipe glib-2.0-initial-1_2.86.0-r0: task do_write_config: Started
NOTE: recipe libxml2-native-2.14.6-r0: task do_unpack: Succeeded
NOTE: Running task 854 of 2118 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.14.6.bb:do_patch)
NOTE: recipe attr-2.5.2-r0: task do_unpack: Started
NOTE: recipe openssl-native-3.5.4-r0: task do_patch: Succeeded
NOTE: recipe glib-2.0-initial-1_2.86.0-r0: task do_write_config: Succeeded
NOTE: recipe util-linux-2.41.1-r0: task do_unpack: Started
NOTE: Running task 877 of 2118 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_80.9.0.bb:do_fetch)
NOTE: Running task 879 of 2118 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_fetch)
NOTE: recipe attr-2.5.2-r0: task do_unpack: Succeeded
NOTE: recipe libpcre2-10.46-r0: task do_patch: Succeeded
NOTE: Running task 880 of 2118 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.5.2.bb:do_patch)
NOTE: Running task 884 of 2118 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_fetch)
NOTE: recipe glib-2.0-initial-1_2.86.0-r0: task do_unpack: Succeeded
NOTE: Running task 885 of 2118 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.86.0.bb:do_patch)
NOTE: recipe libxml2-native-2.14.6-r0: task do_patch: Started
NOTE: recipe python3-setuptools-80.9.0-r0: task do_fetch: Started
NOTE: recipe gobject-introspection-1.84.0-r0: task do_fetch: Started
NOTE: recipe python3-setuptools-80.9.0-r0: task do_fetch: Succeeded
NOTE: Running task 886 of 2118 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.86.0.bb:do_fetch)
NOTE: recipe gcc-cross-x86_64-15.2.0-r0: task do_gcc_stash_builddir_setscene: Succeeded
NOTE: recipe gobject-introspection-1.84.0-r0: task do_fetch: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 907 of 2118 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_80.9.0.bb:do_unpack)
NOTE: Running task 908 of 2118 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_unpack)
NOTE: recipe attr-2.5.2-r0: task do_patch: Started
NOTE: recipe wayland-1.24.0-r0: task do_fetch: Started
NOTE: recipe wayland-1.24.0-r0: task do_fetch: Succeeded
NOTE: Running task 911 of 2118 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_fetch)
NOTE: recipe glib-2.0-initial-1_2.86.0-r0: task do_patch: Started
NOTE: recipe python3-setuptools-80.9.0-r0: task do_unpack: Started
NOTE: recipe glib-2.0-1_2.86.0-r0: task do_fetch: Started
NOTE: recipe gobject-introspection-1.84.0-r0: task do_unpack: Started
NOTE: recipe glib-2.0-1_2.86.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-3.13.9-r0: task do_unpack: Succeeded
NOTE: Running task 912 of 2118 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.13.9.bb:do_patch)
NOTE: Running task 913 of 2118 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.3.2.bb:do_fetch)
NOTE: recipe libseccomp-2.6.0-r0: task do_fetch: Started
NOTE: recipe util-linux-libuuid-2.41.1-r0: task do_patch: Succeeded
NOTE: Running task 917 of 2118 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_unpack)
NOTE: recipe python3-setuptools-80.9.0-r0: task do_unpack: Succeeded
NOTE: recipe libcap-ng-0.8.5-r0: task do_unpack: Succeeded
NOTE: Running task 918 of 2118 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_80.9.0.bb:do_patch)
NOTE: recipe attr-2.5.2-r0: task do_patch: Succeeded
NOTE: Running task 919 of 2118 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_patch)
NOTE: Running task 921 of 2118 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.86.0.bb:do_unpack)
NOTE: recipe libxml2-native-2.14.6-r0: task do_patch: Succeeded
NOTE: Running task 925 of 2118 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_fetch)
NOTE: recipe acl-2.3.2-r0: task do_fetch: Started
NOTE: recipe acl-2.3.2-r0: task do_fetch: Succeeded
NOTE: recipe wayland-1.24.0-r0: task do_unpack: Started
NOTE: Running task 926 of 2118 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_fetch)
NOTE: recipe python3-3.13.9-r0: task do_patch: Started
NOTE: recipe python3-setuptools-80.9.0-r0: task do_patch: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_patch: Started
NOTE: recipe libxml2-2.14.6-r0: task do_unpack: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_fetch: Started
NOTE: Running task 927 of 2118 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.14.6.bb:do_patch)
NOTE: recipe libseccomp-2.6.0-r0: task do_fetch: Succeeded
NOTE: recipe glib-2.0-1_2.86.0-r0: task do_unpack: Started
NOTE: Running task 930 of 2118 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_unpack)
NOTE: recipe xorgproto-2024.1-r0: task do_fetch: Succeeded
NOTE: Running task 931 of 2118 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.3.2.bb:do_unpack)
NOTE: recipe util-macros-1_1.20.2-r0: task do_fetch: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_fetch: Succeeded
NOTE: Running task 932 of 2118 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_unpack)
NOTE: recipe util-linux-2.41.1-r0: task do_unpack: Succeeded
NOTE: recipe gobject-introspection-1.84.0-r0: task do_unpack: Succeeded
NOTE: Running task 933 of 2118 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.1.bb:do_patch)
NOTE: recipe libxml2-2.14.6-r0: task do_patch: Started
NOTE: Running task 934 of 2118 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_patch)
NOTE: recipe libseccomp-2.6.0-r0: task do_unpack: Started
NOTE: recipe acl-2.3.2-r0: task do_unpack: Started
NOTE: recipe python3-setuptools-80.9.0-r0: task do_patch: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_unpack: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_patch: Succeeded
NOTE: Running task 935 of 2118 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_unpack)
NOTE: recipe wayland-1.24.0-r0: task do_unpack: Succeeded
NOTE: Running task 944 of 2118 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_write_config)
NOTE: Running task 945 of 2118 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_patch)
NOTE: recipe acl-2.3.2-r0: task do_unpack: Succeeded
NOTE: Running task 946 of 2118 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.3.2.bb:do_patch)
NOTE: recipe gobject-introspection-1.84.0-r0: task do_patch: Started
NOTE: recipe util-linux-2.41.1-r0: task do_patch: Started
NOTE: recipe openssl-3.5.4-r0: task do_unpack: Succeeded
NOTE: Running task 947 of 2118 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.4.bb:do_patch)
NOTE: recipe util-macros-1_1.20.2-r0: task do_unpack: Started
NOTE: recipe gobject-introspection-1.84.0-r0: task do_patch: Succeeded
NOTE: recipe gobject-introspection-1.84.0-r0: task do_write_config: Started
NOTE: recipe wayland-1.24.0-r0: task do_patch: Started
NOTE: Running task 949 of 2118 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_write_config)
NOTE: recipe acl-2.3.2-r0: task do_patch: Started
NOTE: recipe xorgproto-2024.1-r0: task do_unpack: Succeeded
NOTE: Running task 950 of 2118 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_patch)
NOTE: recipe gobject-introspection-1.84.0-r0: task do_write_config: Succeeded
NOTE: Running task 951 of 2118 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.86.0.bb:do_write_config)
NOTE: recipe openssl-3.5.4-r0: task do_patch: Started
NOTE: recipe glibc-2.42+git-r0: task do_unpack: Succeeded
NOTE: recipe libxml2-2.14.6-r0: task do_patch: Succeeded
NOTE: Running task 952 of 2118 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc_2.42.bb:do_patch)
NOTE: Running task 957 of 2118 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.7.bb:do_fetch)
NOTE: recipe glib-2.0-initial-1_2.86.0-r0: task do_patch: Succeeded
NOTE: recipe wayland-1.24.0-r0: task do_write_config: Started
NOTE: Running task 964 of 2118 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/perl/perl_5.42.0.bb:do_fetch)
NOTE: recipe xorgproto-2024.1-r0: task do_patch: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_unpack: Succeeded
NOTE: Running task 965 of 2118 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_patch)
NOTE: recipe wayland-1.24.0-r0: task do_write_config: Succeeded
NOTE: recipe wayland-1.24.0-r0: task do_patch: Succeeded
NOTE: Running task 966 of 2118 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_write_config)
NOTE: recipe xorgproto-2024.1-r0: task do_patch: Succeeded
NOTE: recipe glib-2.0-1_2.86.0-r0: task do_write_config: Started
NOTE: recipe base-passwd-3.6.7-r0: task do_fetch: Started
NOTE: Running task 971 of 2118 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/sed/sed_4.9.bb:do_fetch)
NOTE: Running task 977 of 2118 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_fetch)
NOTE: recipe glibc-2.42+git-r0: task do_patch: Started
NOTE: recipe base-passwd-3.6.7-r0: task do_fetch: Succeeded
NOTE: recipe perl-5.42.0-r0: task do_fetch: Started
NOTE: Running task 978 of 2118 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.7.bb:do_unpack)
NOTE: recipe glib-2.0-1_2.86.0-r0: task do_write_config: Succeeded
NOTE: Running task 979 of 2118 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_fetch)
NOTE: recipe glib-2.0-1_2.86.0-r0: task do_unpack: Succeeded
NOTE: recipe util-macros-1_1.20.2-r0: task do_patch: Started
NOTE: Running task 980 of 2118 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.86.0.bb:do_patch)
NOTE: recipe xorgproto-2024.1-r0: task do_write_config: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_fetch: Started
NOTE: recipe sed-4.9-r0: task do_fetch: Started
NOTE: recipe acl-2.3.2-r0: task do_patch: Succeeded
NOTE: recipe sed-4.9-r0: task do_fetch: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_fetch: Succeeded
NOTE: Running task 982 of 2118 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_fetch)
NOTE: recipe libseccomp-2.6.0-r0: task do_unpack: Succeeded
NOTE: Running task 983 of 2118 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_fetch)
NOTE: recipe perl-5.42.0-r0: task do_fetch: Succeeded
NOTE: recipe base-passwd-3.6.7-r0: task do_unpack: Started
NOTE: Running task 987 of 2118 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_fetch)
NOTE: Running task 988 of 2118 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_patch)
NOTE: Running task 989 of 2118 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/perl/perl_5.42.0.bb:do_unpack)
NOTE: recipe xorgproto-2024.1-r0: task do_write_config: Succeeded
NOTE: Running task 994 of 2118 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.45.bb:do_fetch)
NOTE: recipe libxau-1_1.0.12-r0: task do_fetch: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_fetch: Succeeded
NOTE: Running task 996 of 2118 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_fetch)
NOTE: recipe glib-2.0-1_2.86.0-r0: task do_patch: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_fetch: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_fetch: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_fetch: Succeeded
NOTE: recipe shadow-4.18.0-r0: task do_fetch: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_patch: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_fetch: Succeeded
NOTE: recipe perl-5.42.0-r0: task do_unpack: Started
NOTE: Running task 1001 of 2118 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/sed/sed_4.9.bb:do_unpack)
NOTE: Running task 1002 of 2118 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_unpack)
NOTE: recipe openssl-3.5.4-r0: task do_patch: Succeeded
NOTE: Running task 1004 of 2118 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_unpack)
NOTE: recipe xkeyboard-config-2.45-r0: task do_fetch: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_patch: Succeeded
NOTE: recipe shadow-4.18.0-r0: task do_fetch: Succeeded
NOTE: Running task 1006 of 2118 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_unpack)
NOTE: recipe xkeyboard-config-2.45-r0: task do_fetch: Succeeded
NOTE: Running task 1007 of 2118 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_unpack)
NOTE: recipe libxcb-1.17.0-r0: task do_fetch: Started
NOTE: Running task 1010 of 2118 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_unpack)
NOTE: recipe libxcb-1.17.0-r0: task do_fetch: Succeeded
NOTE: Running task 1028 of 2118 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/initscripts/initscripts_1.0.bb:do_fetch)
NOTE: recipe xcb-proto-1.17.0-r0: task do_unpack: Started
NOTE: recipe sed-4.9-r0: task do_unpack: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_unpack: Started
NOTE: recipe base-passwd-3.6.7-r0: task do_unpack: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_unpack: Started
NOTE: Running task 1029 of 2118 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.7.bb:do_patch)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_unpack: Started
NOTE: recipe shadow-4.18.0-r0: task do_unpack: Started
NOTE: recipe initscripts-1.0-r0: task do_fetch: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_patch: Succeeded
NOTE: Running task 1031 of 2118 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_fetch)
NOTE: recipe util-linux-2.41.1-r0: task do_patch: Succeeded
NOTE: Running task 1033 of 2118 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_fetch)
NOTE: recipe base-passwd-3.6.7-r0: task do_patch: Started
NOTE: recipe initscripts-1.0-r0: task do_fetch: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_unpack: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_unpack: Succeeded
NOTE: Running task 1034 of 2118 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.11.0.bb:do_fetch)
NOTE: Running task 1035 of 2118 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_patch)
NOTE: recipe xcb-proto-1.17.0-r0: task do_unpack: Succeeded
NOTE: Running task 1036 of 2118 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_patch)
NOTE: Running task 1037 of 2118 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_patch)
NOTE: recipe zstd-1.5.7-r0: task do_fetch: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_unpack: Succeeded
NOTE: Running task 1038 of 2118 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_patch)
NOTE: recipe shared-mime-info-2.4-r0: task do_fetch: Started
NOTE: recipe sed-4.9-r0: task do_unpack: Succeeded
NOTE: Running task 1039 of 2118 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/sed/sed_4.9.bb:do_patch)
NOTE: recipe libxau-1_1.0.12-r0: task do_patch: Started
NOTE: recipe libxkbcommon-1.11.0-r0: task do_fetch: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_patch: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_patch: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_patch: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_patch: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_patch: Succeeded
NOTE: Running task 1041 of 2118 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/kmod/kmod_34.2.bb:do_fetch)
NOTE: Running task 1042 of 2118 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.76.bb:do_fetch)
NOTE: recipe sed-4.9-r0: task do_patch: Started
NOTE: recipe zstd-1.5.7-r0: task do_fetch: Succeeded
NOTE: Running task 1044 of 2118 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_fetch)
NOTE: recipe shared-mime-info-2.4-r0: task do_fetch: Succeeded
NOTE: recipe libcap-2.76-r0: task do_fetch: Started
NOTE: Running task 1045 of 2118 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.45.bb:do_unpack)
NOTE: recipe libcap-2.76-r0: task do_fetch: Succeeded
NOTE: recipe kmod-34.2-r0: task do_fetch: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_patch: Succeeded
NOTE: Running task 1047 of 2118 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_unpack)
NOTE: recipe sed-4.9-r0: task do_patch: Succeeded
NOTE: Running task 1055 of 2118 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_fetch)
NOTE: Running task 1063 of 2118 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/initscripts/initscripts_1.0.bb:do_unpack)
NOTE: recipe kmod-34.2-r0: task do_fetch: Succeeded
NOTE: recipe shadow-sysroot-4.6-r0: task do_fetch: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_patch: Succeeded
NOTE: Running task 1064 of 2118 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_unpack)
NOTE: recipe shadow-sysroot-4.6-r0: task do_fetch: Succeeded
NOTE: Running task 1065 of 2118 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_unpack)
NOTE: recipe python3-3.13.9-r0: task do_patch: Succeeded
NOTE: Running task 1067 of 2118 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/kmod/kmod_34.2.bb:do_unpack)
NOTE: recipe glib-2.0-1_2.86.0-r0: task do_patch: Succeeded
NOTE: Running task 1069 of 2118 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.76.bb:do_unpack)
NOTE: Running task 1072 of 2118 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_unpack)
NOTE: recipe xkeyboard-config-2.45-r0: task do_unpack: Started
NOTE: recipe libxcb-1.17.0-r0: task do_unpack: Started
NOTE: recipe gmp-6.3.0-r0: task do_fetch: Started
NOTE: recipe initscripts-1.0-r0: task do_unpack: Started
NOTE: recipe libxkbcommon-1.11.0-r0: task do_fetch: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_unpack: Started
NOTE: Running task 1073 of 2118 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.11.0.bb:do_unpack)
NOTE: recipe gmp-6.3.0-r0: task do_fetch: Succeeded
NOTE: recipe shadow-sysroot-4.6-r0: task do_unpack: Started
NOTE: Running task 1080 of 2118 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/readline/readline_8.3.bb:do_fetch)
NOTE: recipe libcap-2.76-r0: task do_unpack: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_unpack: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_unpack: Succeeded
NOTE: recipe kmod-34.2-r0: task do_unpack: Started
NOTE: Running task 1081 of 2118 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_patch)
NOTE: recipe libxkbcommon-1.11.0-r0: task do_unpack: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_patch: Started
NOTE: recipe readline-8.3-r0: task do_fetch: Started
NOTE: recipe libxcb-1.17.0-r0: task do_unpack: Succeeded
NOTE: Running task 1082 of 2118 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_patch)
NOTE: recipe xkeyboard-config-2.45-r0: task do_unpack: Succeeded
NOTE: Running task 1083 of 2118 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.45.bb:do_patch)
NOTE: recipe base-passwd-3.6.7-r0: task do_patch: Succeeded
NOTE: Running task 1085 of 2118 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_fetch)
NOTE: recipe libcap-2.76-r0: task do_unpack: Succeeded
NOTE: recipe readline-8.3-r0: task do_fetch: Succeeded
NOTE: Running task 1086 of 2118 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.76.bb:do_patch)
NOTE: Running task 1090 of 2118 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/systemd/systemd_257.8.bb:do_fetch)
NOTE: recipe kmod-34.2-r0: task do_unpack: Succeeded
NOTE: Running task 1091 of 2118 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/kmod/kmod_34.2.bb:do_patch)
NOTE: recipe initscripts-1.0-r0: task do_unpack: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_patch: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_patch: Succeeded
NOTE: Running task 1092 of 2118 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/initscripts/initscripts_1.0.bb:do_patch)
NOTE: recipe xkeyboard-config-2.45-r0: task do_patch: Started
NOTE: Running task 1099 of 2118 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/gawk/gawk_5.3.2.bb:do_fetch)
NOTE: recipe mpfr-4.2.2-r0: task do_fetch: Started
NOTE: recipe libcap-2.76-r0: task do_patch: Started
NOTE: recipe mpfr-4.2.2-r0: task do_fetch: Succeeded
NOTE: Running task 1101 of 2118 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.45.bb:do_write_config)
NOTE: recipe xkeyboard-config-2.45-r0: task do_patch: Succeeded
NOTE: Running task 1104 of 2118 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_unpack)
NOTE: recipe perl-5.42.0-r0: task do_unpack: Succeeded
NOTE: Running task 1105 of 2118 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/perl/perl_5.42.0.bb:do_patch)
NOTE: recipe systemd-1_257.8-r0: task do_fetch: Started
NOTE: recipe initscripts-1.0-r0: task do_patch: Started
NOTE: recipe kmod-34.2-r0: task do_patch: Started
NOTE: recipe gawk-5.3.2-r0: task do_fetch: Started
NOTE: recipe libxcb-1.17.0-r0: task do_patch: Succeeded
NOTE: Running task 1107 of 2118 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/readline/readline_8.3.bb:do_unpack)
NOTE: recipe gawk-5.3.2-r0: task do_fetch: Succeeded
NOTE: Running task 1108 of 2118 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_unpack)
NOTE: recipe xkeyboard-config-2.45-r0: task do_write_config: Started
NOTE: recipe libcap-2.76-r0: task do_patch: Succeeded
NOTE: recipe kmod-34.2-r0: task do_patch: Succeeded
NOTE: Running task 1116 of 2118 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/gawk/gawk_5.3.2.bb:do_unpack)
NOTE: Running task 1126 of 2118 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_fetch)
NOTE: recipe gmp-6.3.0-r0: task do_unpack: Started
NOTE: recipe perl-5.42.0-r0: task do_patch: Started
NOTE: recipe xkeyboard-config-2.45-r0: task do_write_config: Succeeded
NOTE: Running task 1142 of 2118 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/initscripts/initscripts_1.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe initscripts-1.0-r0: task do_patch: Succeeded
NOTE: recipe readline-8.3-r0: task do_unpack: Started
NOTE: Running task 1144 of 2118 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_write_config)
NOTE: recipe glibc-2.42+git-r0: task do_patch: Succeeded
NOTE: recipe mpfr-4.2.2-r0: task do_unpack: Started
NOTE: Running task 1146 of 2118 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.11.0.bb:do_write_config)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_fetch: Started
NOTE: recipe shadow-4.18.0-r0: task do_unpack: Succeeded
NOTE: recipe gawk-5.3.2-r0: task do_unpack: Started
NOTE: Running task 1147 of 2118 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_patch)
NOTE: recipe initscripts-1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_write_config: Started
NOTE: recipe initscripts-1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe readline-8.3-r0: task do_unpack: Succeeded
NOTE: Running task 1149 of 2118 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/kmod/kmod_34.2.bb:do_write_config)
NOTE: Running task 1150 of 2118 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/readline/readline_8.3.bb:do_patch)
NOTE: recipe libxkbcommon-1.11.0-r0: task do_write_config: Started
NOTE: recipe shadow-4.18.0-r0: task do_patch: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_write_config: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_unpack: Succeeded
NOTE: Running task 1151 of 2118 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/initscripts/initscripts_1.0.bb:do_configure)
NOTE: Running task 1152 of 2118 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_patch)
NOTE: recipe libxkbcommon-1.11.0-r0: task do_write_config: Succeeded
NOTE: Running task 1156 of 2118 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_fetch: Succeeded
NOTE: recipe systemd-1_257.8-r0: task do_fetch: Succeeded
NOTE: Running task 1158 of 2118 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/procps/procps_4.0.5.bb:do_fetch)
NOTE: recipe shared-mime-info-2.4-r0: task do_unpack: Succeeded
NOTE: Running task 1159 of 2118 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/systemd/systemd_257.8.bb:do_unpack)
NOTE: recipe readline-8.3-r0: task do_patch: Started
NOTE: Running task 1160 of 2118 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_patch)
NOTE: recipe kmod-34.2-r0: task do_write_config: Started
NOTE: recipe libxkbcommon-1.11.0-r0: task do_unpack: Succeeded
NOTE: Running task 1161 of 2118 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.11.0.bb:do_patch)
NOTE: recipe initscripts-1.0-r0: task do_configure: Started
NOTE: recipe zstd-1.5.7-r0: task do_patch: Started
NOTE: recipe mpfr-4.2.2-r0: task do_unpack: Succeeded
NOTE: Running task 1162 of 2118 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_patch)
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot: Started
NOTE: recipe procps-4.0.5-r0: task do_fetch: Started
NOTE: recipe gawk-5.3.2-r0: task do_unpack: Succeeded
NOTE: recipe kmod-34.2-r0: task do_write_config: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_patch: Started
NOTE: Running task 1163 of 2118 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/gawk/gawk_5.3.2.bb:do_patch)
NOTE: recipe initscripts-1.0-r0: task do_configure: Succeeded
NOTE: Running task 1164 of 2118 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_unpack)
NOTE: recipe shadow-4.18.0-r0: task do_patch: Succeeded
NOTE: Running task 1165 of 2118 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/initscripts/initscripts_1.0.bb:do_compile)
NOTE: recipe libxkbcommon-1.11.0-r0: task do_patch: Started
NOTE: Running task 1168 of 2118 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_fetch)
NOTE: recipe mpfr-4.2.2-r0: task do_patch: Started
NOTE: recipe systemd-1_257.8-r0: task do_unpack: Started
NOTE: recipe zstd-1.5.7-r0: task do_patch: Succeeded
NOTE: Running task 1171 of 2118 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/systemd/systemd_257.8.bb:do_warn_musl)
NOTE: recipe mpfr-4.2.2-r0: task do_patch: Succeeded
NOTE: Running task 1173 of 2118 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/systemd/systemd_257.8.bb:do_write_config)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_unpack: Started
NOTE: recipe gawk-5.3.2-r0: task do_patch: Started
NOTE: recipe initscripts-1.0-r0: task do_compile: Started
NOTE: recipe libxkbcommon-1.11.0-r0: task do_patch: Succeeded
NOTE: recipe opkg-utils-native-0.7.0-r0: task do_fetch: Started
NOTE: Running task 1179 of 2118 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_fetch)
NOTE: recipe gmp-6.3.0-r0: task do_unpack: Succeeded
NOTE: recipe readline-8.3-r0: task do_patch: Succeeded
NOTE: Running task 1180 of 2118 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_patch)
NOTE: recipe initscripts-1.0-r0: task do_compile: Succeeded
NOTE: Running task 1182 of 2118 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/make/make_4.4.1.bb:do_fetch)
NOTE: Running task 1183 of 2118 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/initscripts/initscripts_1.0.bb:do_install)
NOTE: recipe systemd-1_257.8-r0: task do_warn_musl: Started
NOTE: recipe systemd-1_257.8-r0: task do_write_config: Started
NOTE: recipe systemd-1_257.8-r0: task do_warn_musl: Succeeded
NOTE: recipe psmisc-23.7-r0: task do_fetch: Started
NOTE: recipe gmp-6.3.0-r0: task do_patch: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_patch: Succeeded
NOTE: recipe make-4.4.1-r0: task do_fetch: Started
NOTE: recipe make-4.4.1-r0: task do_fetch: Succeeded
NOTE: recipe procps-4.0.5-r0: task do_fetch: Succeeded
NOTE: recipe systemd-1_257.8-r0: task do_write_config: Succeeded
NOTE: recipe gawk-5.3.2-r0: task do_patch: Succeeded
NOTE: recipe opkg-utils-native-0.7.0-r0: task do_fetch: Succeeded
NOTE: recipe perl-5.42.0-r0: task do_patch: Succeeded
NOTE: recipe psmisc-23.7-r0: task do_fetch: Succeeded
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_unpack: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_patch: Succeeded
NOTE: Running task 1186 of 2118 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/perl/perl_5.42.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1188 of 2118 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_patch)
NOTE: Running task 1189 of 2118 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/procps/procps_4.0.5.bb:do_unpack)
NOTE: Running task 1191 of 2118 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_unpack)
NOTE: Running task 1192 of 2118 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/dpkg/dpkg_1.22.21.bb:do_fetch)
NOTE: Running task 1195 of 2118 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_unpack)
NOTE: Running task 1196 of 2118 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/make/make_4.4.1.bb:do_unpack)
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1208 of 2118 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_collect_spdx_deps)
NOTE: Running task 1213 of 2118 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/initscripts/initscripts_1.0.bb:do_collect_spdx_deps)
NOTE: Running task 1215 of 2118 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/perl/perl_5.42.0.bb:do_populate_lic)
NOTE: recipe initscripts-1.0-r0: task do_install: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 43a5eed45be5f03da4b85c3553d0f54d484743ea1bf86e066be2f808a536e5e1
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_patch: Started
NOTE: recipe perl-5.42.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe procps-4.0.5-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r0: task do_collect_spdx_deps: Started
NOTE: recipe make-4.4.1-r0: task do_unpack: Started
NOTE: recipe initscripts-1.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe psmisc-23.7-r0: task do_unpack: Started
NOTE: recipe opkg-utils-native-0.7.0-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe perl-5.42.0-r0: task do_populate_lic: Started
NOTE: recipe dpkg-native-1.22.21-r0: task do_fetch: Started
NOTE: Setscene tasks completed
NOTE: recipe initscripts-1.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_patch: Succeeded
NOTE: recipe make-4.4.1-r0: task do_unpack: Succeeded
NOTE: Running task 1217 of 2118 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/make/make_4.4.1.bb:do_patch)
NOTE: recipe make-4.4.1-r0: task do_patch: Started
NOTE: recipe perl-5.42.0-r0: task do_populate_lic: Succeeded
NOTE: recipe systemd-1_257.8-r0: task do_unpack: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/perl/perl_5.42.0.bb:do_populate_lic unihash changed to c208bfcb7e149cd230506550772c5f6cef25b302d97bee28f8647bd016647189
NOTE: Running task 1218 of 2118 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/systemd/systemd_257.8.bb:do_patch)
NOTE: recipe opkg-utils-native-0.7.0-r0: task do_unpack: Succeeded
NOTE: Running task 1219 of 2118 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_patch)
NOTE: recipe make-4.4.1-r0: task do_patch: Succeeded
NOTE: recipe perl-5.42.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/perl/perl_5.42.0.bb:do_deploy_source_date_epoch unihash changed to dd5d66cf35710d33ab9ce1dc858f3c35a7e3ae85ac0f273450737ec0aeb42137
NOTE: recipe systemd-1_257.8-r0: task do_patch: Started
NOTE: recipe opkg-utils-native-0.7.0-r0: task do_patch: Started
NOTE: recipe psmisc-23.7-r0: task do_unpack: Succeeded
NOTE: recipe procps-4.0.5-r0: task do_unpack: Succeeded
NOTE: recipe opkg-utils-native-0.7.0-r0: task do_patch: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1221 of 2118 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/procps/procps_4.0.5.bb:do_patch)
NOTE: Running task 1223 of 2118 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_patch)
NOTE: recipe systemd-1_257.8-r0: task do_patch: Succeeded
NOTE: recipe procps-4.0.5-r0: task do_patch: Started
NOTE: recipe psmisc-23.7-r0: task do_patch: Started
NOTE: recipe procps-4.0.5-r0: task do_patch: Succeeded
NOTE: recipe psmisc-23.7-r0: task do_patch: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_install: Succeeded
NOTE: recipe linux-libc-headers-6.17-r0: task do_unpack: Succeeded
NOTE: Running task 1228 of 2118 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.17.bb:do_patch)
NOTE: Running task 1229 of 2118 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.17.bb:do_collect_spdx_deps)
NOTE: recipe linux-libc-headers-6.17-r0: task do_patch: Started
NOTE: recipe linux-libc-headers-6.17-r0: task do_collect_spdx_deps: Started
NOTE: recipe linux-libc-headers-6.17-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe linux-libc-headers-6.17-r0: task do_patch: Succeeded
NOTE: Running noexec task 1231 of 2118 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.17.bb:do_configure)
NOTE: Running noexec task 1232 of 2118 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.17.bb:do_compile)
NOTE: Running task 1233 of 2118 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.17.bb:do_install)
NOTE: recipe linux-libc-headers-6.17-r0: task do_install: Started
NOTE: recipe perl-native-5.42.0-r0: task do_patch: Failed
NOTE: recipe linux-libc-headers-6.17-r0: task do_install: Succeeded
NOTE: recipe dpkg-native-1.22.21-r0: task do_fetch: Succeeded
NOTE: Tasks Summary: Attempted 1233 tasks of which 1012 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20251105163155.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20251105163155.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/perl/perl_5.42.0.bb:do_patch
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/perl-native/5.42.0/temp/log.do_patch.983868
Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: perl-native-5.42.0-r0 do_patch: Applying patch 'perl-configpm-switch.patch' on target directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/perl-native/5.42.0/sources/perl-5.42.0'
CmdError('quilt --quiltrc /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/perl-native/5.42.0/recipe-sysroot-native/etc/quiltrc push', 0, 'stdout: Patch perl-configpm-switch.patch is already applied; check your series file

stderr: ')
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/perl-native/5.42.0/temp/log.do_patch.983868
ERROR: Task (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/perl/perl_5.42.0.bb:do_patch) failed with exit code '1'

--===============0196051039569994432==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-perl-upgrade-5.40.2-5.42.0.patch"

RnJvbSAyYTcxY2E5NDE5ODI1NWIxNGZkNTUyZGQwZTBhMTQyOGQyYTc3ODE5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgNSBOb3YgMjAyNSAxNjozMjozMCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHBl
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
dGhyb3VnaC10aGUtcGVybC13cmFwcGVyLS5wYXRjaAppbmRleCAyMDc2YzYxZWUwLi40N2UyNmEw
ZGI5IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcGVybC9maWxlcy8wMDAxLVNv
bWVob3ctdGhpcy1tb2R1bGUtYnJlYWtzLXRocm91Z2gtdGhlLXBlcmwtd3JhcHBlci0ucGF0Y2gK
KysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3BlcmwvZmlsZXMvMDAwMS1Tb21laG93LXRoaXMt
bW9kdWxlLWJyZWFrcy10aHJvdWdoLXRoZS1wZXJsLXdyYXBwZXItLnBhdGNoCkBAIC0xLDQgKzEs
NCBAQAotRnJvbSA0N2NkMjJjZDIxM2QyYzVmMjhlNjc0YjEyYzI2NGRjNzMxNjgyNTYwIE1vbiBT
ZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSA5ZmZjYWVhZGY1ZGM1OWUyMmJhZjk4ZDZkZjM3MDY4
ZDMyMTVhZjZkIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogQWxleGFuZGVyIEthbmF2
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
CmluZGV4IDdlNWQwOGQ4ZGIuLjk1YTM4YTNiMDcgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9wZXJsL2ZpbGVzLzAwMDEtY3Bhbi1TeXMtU3lzbG9nLU1ha2VmaWxlLlBMLUZpeC1f
UEFUSF9MT0ctZm9yLWRldGVybS5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcGVy
bC9maWxlcy8wMDAxLWNwYW4tU3lzLVN5c2xvZy1NYWtlZmlsZS5QTC1GaXgtX1BBVEhfTE9HLWZv
ci1kZXRlcm0ucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDMyMjk3MjM4NGUwNzk1YmUzMzky
NTJmN2NmOWEzMThkYzc1OWI1MWUgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIGNlZTAz
MWYxNTVlNzgzZmU5Njk1MDM2Mjg5MWQ0Y2ZmMDlmYzNmOWIgTW9uIFNlcCAxNyAwMDowMDowMCAy
MDAxCiBGcm9tOiBSb2JlcnQgWWFuZyA8bGllemhpLnlhbmdAd2luZHJpdmVyLmNvbT4KIERhdGU6
IEZyaSwgMTggRmViIDIwMjIgMDk6NDQ6MjYgKzAwMDAKIFN1YmplY3Q6IFtQQVRDSF0gY3Bhbi9T
eXMtU3lzbG9nL01ha2VmaWxlLlBMOiBGaXggX1BBVEhfTE9HIGZvciBkZXRlcm1pbmlzdGljCmRp
ZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcGVybC9maWxlcy8wMDAyLUNvbnN0YW50
LUZpeC11cC1zaGViYW5nLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3BlcmwvZmlsZXMv
MDAwMi1Db25zdGFudC1GaXgtdXAtc2hlYmFuZy5wYXRjaAppbmRleCA4MDk4NmU2NmRhLi5lZGYy
ZWZmOThlIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcGVybC9maWxlcy8wMDAy
LUNvbnN0YW50LUZpeC11cC1zaGViYW5nLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29s
cy9wZXJsL2ZpbGVzLzAwMDItQ29uc3RhbnQtRml4LXVwLXNoZWJhbmcucGF0Y2gKQEAgLTEsNCAr
MSw0IEBACi1Gcm9tIGEwMjM1NWJkYzhjZGUxMTE1ZGFmMTAxNjc1Y2RmYjcwN2QzMzdiZjEgTW9u
IFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDE2N2RiYzA5NGJmNTczMzkwODZlYjAwMzlhZTU4
YTFjMWM3MjQ4ZmYgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBKb3NodWEgV2F0dCA8
SlBFV2hhY2tlckBnbWFpbC5jb20+CiBEYXRlOiBNb24sIDE3IEp1biAyMDE5IDEwOjQ3OjIzIC0w
NTAwCiBTdWJqZWN0OiBbUEFUQ0hdIENvbnN0YW50OiBGaXggdXAgc2hlYmFuZwpkaWZmIC0tZ2l0
IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3BlcmwvZmlsZXMvZGV0ZXJtaW5pc20ucGF0Y2ggYi9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcGVybC9maWxlcy9kZXRlcm1pbmlzbS5wYXRjaAppbmRleCBi
ZGI5YTkyOGJiLi5mYjRjYzY3MzQ0IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
cGVybC9maWxlcy9kZXRlcm1pbmlzbS5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
cGVybC9maWxlcy9kZXRlcm1pbmlzbS5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gNWM0ZmQ1
N2RhZjEyNTM1NzI2MmFhNzk2MDU3ZDdiZThlNzhkMzc4ZSBNb24gU2VwIDE3IDAwOjAwOjAwIDIw
MDEKK0Zyb20gODBiMjQyZDFjZTJlMjI3MmQwMTRlMjI4OTg0ZmU2YTAzMDI4NmNlNyBNb24gU2Vw
IDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IFJpY2hhcmQgUHVyZGllIDxyaWNoYXJkLnB1cmRpZUBs
aW51eGZvdW5kYXRpb24ub3JnPgogRGF0ZTogV2VkLCA1IEZlYiAyMDIwIDIzOjU0OjAyICswMDAw
CiBTdWJqZWN0OiBbUEFUQ0hdIEZpeGVzIHRvIG1ha2UgdGhlIHBlcmwgYnVpbGQgcmVwcm9kdWNp
YmxlOgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3BlcmwvZmlsZXMvZW5jb2Rl
Zml4LnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3BlcmwvZmlsZXMvZW5jb2RlZml4LnBh
dGNoCmluZGV4IDY2NTY5OWQxMmQuLmM2MDJlZjU4NjEgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBl
cy1kZXZ0b29scy9wZXJsL2ZpbGVzL2VuY29kZWZpeC5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcGVybC9maWxlcy9lbmNvZGVmaXgucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9t
IGE0ZTIyYzdmMmE1MTlmMjRiYzhhYTg5YzY2NzcwMTdjMGZlMTM2NzkgTW9uIFNlcCAxNyAwMDow
MDowMCAyMDAxCitGcm9tIGQxYTViMzY1N2E2YzQ0YmRhZWJhNjc1NzEwOTJhMjFkYTUzMTlmN2Ig
TW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBSaWNoYXJkIFB1cmRpZSA8cmljaGFyZC5w
dXJkaWVAbGludXhmb3VuZGF0aW9uLm9yZz4KIERhdGU6IFR1ZSwgMTggRmViIDIwMjAgMTc6Mjc6
MjYgKzAwMDAKIFN1YmplY3Q6IFtQQVRDSF0gcGVybDogRml4IGVuY29kZSBtb2R1bGUgcmVwcm9k
dWNpYmlsaXR5IGlzc3VlcwpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3Blcmwv
ZmlsZXMvZXJybm9fdmVyLmRpZmYgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcGVybC9maWxlcy9l
cnJub192ZXIuZGlmZgppbmRleCA0Nzc2NDJmNDU3Li44OTA1ZjhiY2JmIDEwMDY0NAotLS0gYS9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcGVybC9maWxlcy9lcnJub192ZXIuZGlmZgorKysgYi9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcGVybC9maWxlcy9lcnJub192ZXIuZGlmZgpAQCAtMSw0ICsxLDQg
QEAKLUZyb20gOWM0MDRkNGIxYzM2MDdlODI3ZmI1NmI1YWU0ZjhmYmJkYjUyY2QwYiBNb24gU2Vw
IDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gYWIyZDlmZmFiMmU0NDFjOTJmYTE0NzYzYzZkOTJmZmIx
ZDU5M2RmNSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEJyZW5kYW4gTydEZWEgPGJv
ZEBkZWJpYW4ub3JnPgogRGF0ZTogRnJpLCAxNiBEZWMgMjAwNSAwMTozMjoxNCArMTEwMAogU3Vi
amVjdDogW1BBVENIXSBSZW1vdmUgRXJybm8gdmVyc2lvbiBjaGVjayBkdWUgdG8gdXBncmFkZSBw
cm9ibGVtcyB3aXRoCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcGVybC9maWxl
cy9uYXRpdmUtcGVybGluYy5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9wZXJsL2ZpbGVz
L25hdGl2ZS1wZXJsaW5jLnBhdGNoCmluZGV4IDdlM2U1ZjY2NTIuLjcwZGRhNWM2NGEgMTAwNjQ0
Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9wZXJsL2ZpbGVzL25hdGl2ZS1wZXJsaW5jLnBh
dGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9wZXJsL2ZpbGVzL25hdGl2ZS1wZXJsaW5j
LnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSA5ZmVjNjJiMTlhNDlkMTQ1MWZkMTEyMGM1ZGMz
OGJhZjU5ZjczODU2IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBkYTdmYzc2MWM2ODFm
ZmUwNTY1ZmZlOGYyNjAxYzNiYzllY2U4YWFiIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJv
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
Li4zNDBmZjAyMjVkIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcGVybC9maWxl
cy9wZXJsLWNvbmZpZ3BtLXN3aXRjaC5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
cGVybC9maWxlcy9wZXJsLWNvbmZpZ3BtLXN3aXRjaC5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZy
b20gN2E0ODUzOGE3ZTg2MTRhMzM0MjE1MWI2NDZkMjEwNWMwY2IwY2RkOSBNb24gU2VwIDE3IDAw
OjAwOjAwIDIwMDEKK0Zyb20gOWY3YzQ5Y2M1NjVmZWVhZTk5OTA2MmVkYTRlYjNiMjUyOGNlMTBj
OSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4
LmthbmF2aW5AZ21haWwuY29tPgogRGF0ZTogU3VuLCAyNyBNYXkgMjAwNyAyMTowNDoxMSArMDAw
MAogU3ViamVjdDogW1BBVENIXSBwZXJsOiA1LjguNyAtPiA1LjguOCAoZnJvbSBPRSkKQEAgLTE5
LDcgKzE5LDcgQEAgU2lnbmVkLW9mZi1ieTogQWxleGFuZGVyIEthbmF2aW4gPGFsZXgua2FuYXZp
bkBnbWFpbC5jb20+CiAgMSBmaWxlIGNoYW5nZWQsIDE2IGluc2VydGlvbnMoKyksIDIgZGVsZXRp
b25zKC0pCiAKIGRpZmYgLS1naXQgYS9jb25maWdwbSBiL2NvbmZpZ3BtCi1pbmRleCAwNzIxOWQ4
Li4wMWEyM2ZhIDEwMDc1NQoraW5kZXggMGM0NmI5ZS4uMWRhZWJlZiAxMDA3NTUKIC0tLSBhL2Nv
bmZpZ3BtCiArKysgYi9jb25maWdwbQogQEAgLTcxOCw3ICs3MTgsNyBAQCAkY29uZmlnX3R4dCAu
PSB1bmNvbW1lbnQgPDwnRU5ET0ZFTkQnOwpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3BlcmwvZmlsZXMvcGVybC1keW5sb2FkZXIucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcGVybC9maWxlcy9wZXJsLWR5bmxvYWRlci5wYXRjaAppbmRleCA1NDcyNjAyZDNhLi5iN2Nj
MWIyMmM3IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcGVybC9maWxlcy9wZXJs
LWR5bmxvYWRlci5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcGVybC9maWxlcy9w
ZXJsLWR5bmxvYWRlci5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gMjVhMjZjNTJjMzIwZTY5
OWIzN2E3YWQxZjRmMDQ1YmM4YWE0Y2IwMCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20g
ZjUzOGUzN2I2M2MyNTQyOGQxZGI3Y2Y5MDgzN2NlMzI5ZDA1YTFlYiBNb24gU2VwIDE3IDAwOjAw
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

--===============0196051039569994432==--

