Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86C4DCA0EF9
	for <webhook@archiver.kernel.org>; Fri, 15 Aug 2025 13:07:11 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web10.11417.1755263225673658398
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Aug 2025 06:07:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=AJv32GKR;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=nn4ypaZ0;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 01010198add74cd0-8d9ac98f-d9b4-4b46-ac64-9988b0ab640b-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1755263225;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=7ZPVOEKYxat1h+ql1mwwr5MFtTj4Kv1K/oOjqNaOqVY=;
	b=AJv32GKRh6KawLJt9DvrxpMC7ap1pvTxzbRQZRmHFxfmYDS4pRkEYxOCdSi9EMfJ
	fxX5fPmF7gtchIriXcA9/nIuhPmfSpve2MaWuCZUywnVdIAzTTwPXpU250ecNKEEYg3
	aZxKAQNIc3zlpDLnv4E2wsfrJizICJ+9eyp2nWFE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1755263225;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=7ZPVOEKYxat1h+ql1mwwr5MFtTj4Kv1K/oOjqNaOqVY=;
	b=nn4ypaZ0fIs1LeBQyftL1U3yc7T8nzkVqhwLmlZZen+qPFJMmwuShsAZSP9W/zl1
	x8FgICS0+w0sF2TpLfq7top84gfZ9EhIURXAhp28oasRIMfBalG/I/DrqBAgI60nwxw
	Qur++gZTPQa+E8i13X3UbuH9VVVOE7W123wsa+so=
Content-Type: multipart/mixed; boundary="===============2315881836393093244=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] perl: upgrading to 5.42.0 FAILED
Message-ID: <01010198add74cd0-8d9ac98f-d9b4-4b46-ac64-9988b0ab640b-000000@us-west-2.amazonses.com>
Date: Fri, 15 Aug 2025 13:07:05 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.08.15-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Aug 2025 13:07:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221912

--===============2315881836393093244==
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
From 60229d6a0e8c76fc9f4710e2850fc394941f943b Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 15 Aug 2025 08:45:00 +0000
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
index 2076c61ee0..0f0ea8c8ee 100644
--- a/meta/recipes-devtools/perl/files/0001-Somehow-this-module-breaks-through-the-perl-wrapper-.patch
+++ b/meta/recipes-devtools/perl/files/0001-Somehow-this-module-breaks-through-the-perl-wrapper-.patch
@@ -1,4 +1,4 @@
-From 47cd22cd213d2c5f28e674b12c264dc731682560 Mon Sep 17 00:00:00 2001
+From d1262151a16be06c3f6353186ff6d8b5cac5cdbe Mon Sep 17 00:00:00 2001
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
index 7e5d08d8db..86628a472a 100644
--- a/meta/recipes-devtools/perl/files/0001-cpan-Sys-Syslog-Makefile.PL-Fix-_PATH_LOG-for-determ.patch
+++ b/meta/recipes-devtools/perl/files/0001-cpan-Sys-Syslog-Makefile.PL-Fix-_PATH_LOG-for-determ.patch
@@ -1,4 +1,4 @@
-From 322972384e0795be339252f7cf9a318dc759b51e Mon Sep 17 00:00:00 2001
+From 0c5bbce54d0bd7f33aa351ad757a2b5261ac71e0 Mon Sep 17 00:00:00 2001
 From: Robert Yang <liezhi.yang@windriver.com>
 Date: Fri, 18 Feb 2022 09:44:26 +0000
 Subject: [PATCH] cpan/Sys-Syslog/Makefile.PL: Fix _PATH_LOG for deterministic
diff --git a/meta/recipes-devtools/perl/files/0002-Constant-Fix-up-shebang.patch b/meta/recipes-devtools/perl/files/0002-Constant-Fix-up-shebang.patch
index 80986e66da..17a69c4ab7 100644
--- a/meta/recipes-devtools/perl/files/0002-Constant-Fix-up-shebang.patch
+++ b/meta/recipes-devtools/perl/files/0002-Constant-Fix-up-shebang.patch
@@ -1,4 +1,4 @@
-From a02355bdc8cde1115daf101675cdfb707d337bf1 Mon Sep 17 00:00:00 2001
+From fbdec7e9806d54e72e1229ac1d5b957f3f03334f Mon Sep 17 00:00:00 2001
 From: Joshua Watt <JPEWhacker@gmail.com>
 Date: Mon, 17 Jun 2019 10:47:23 -0500
 Subject: [PATCH] Constant: Fix up shebang
diff --git a/meta/recipes-devtools/perl/files/determinism.patch b/meta/recipes-devtools/perl/files/determinism.patch
index bdb9a928bb..575b4c3a00 100644
--- a/meta/recipes-devtools/perl/files/determinism.patch
+++ b/meta/recipes-devtools/perl/files/determinism.patch
@@ -1,4 +1,4 @@
-From 5c4fd57daf125357262aa796057d7be8e78d378e Mon Sep 17 00:00:00 2001
+From 906d117965041c9b40cf9773646276ce3c14d6b8 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Wed, 5 Feb 2020 23:54:02 +0000
 Subject: [PATCH] Fixes to make the perl build reproducible:
diff --git a/meta/recipes-devtools/perl/files/encodefix.patch b/meta/recipes-devtools/perl/files/encodefix.patch
index 665699d12d..24998a465b 100644
--- a/meta/recipes-devtools/perl/files/encodefix.patch
+++ b/meta/recipes-devtools/perl/files/encodefix.patch
@@ -1,4 +1,4 @@
-From a4e22c7f2a519f24bc8aa89c6677017c0fe13679 Mon Sep 17 00:00:00 2001
+From 1c88540989c9fea647c729b00d499084ece87e43 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Tue, 18 Feb 2020 17:27:26 +0000
 Subject: [PATCH] perl: Fix encode module reproducibility issues
diff --git a/meta/recipes-devtools/perl/files/errno_ver.diff b/meta/recipes-devtools/perl/files/errno_ver.diff
index 477642f457..cbcf441ba9 100644
--- a/meta/recipes-devtools/perl/files/errno_ver.diff
+++ b/meta/recipes-devtools/perl/files/errno_ver.diff
@@ -1,4 +1,4 @@
-From 9c404d4b1c3607e827fb56b5ae4f8fbbdb52cd0b Mon Sep 17 00:00:00 2001
+From e050dbb7b023d5d1a31105df1a4b2ed82e874a0c Mon Sep 17 00:00:00 2001
 From: Brendan O'Dea <bod@debian.org>
 Date: Fri, 16 Dec 2005 01:32:14 +1100
 Subject: [PATCH] Remove Errno version check due to upgrade problems with
diff --git a/meta/recipes-devtools/perl/files/native-perlinc.patch b/meta/recipes-devtools/perl/files/native-perlinc.patch
index 7e3e5f6652..5928184ecb 100644
--- a/meta/recipes-devtools/perl/files/native-perlinc.patch
+++ b/meta/recipes-devtools/perl/files/native-perlinc.patch
@@ -1,4 +1,4 @@
-From 9fec62b19a49d1451fd1120c5dc38baf59f73856 Mon Sep 17 00:00:00 2001
+From e45f3eb9623eff21d0376ea6d0872eff31c89902 Mon Sep 17 00:00:00 2001
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
index 3721277933..7c2a4b0a76 100644
--- a/meta/recipes-devtools/perl/files/perl-configpm-switch.patch
+++ b/meta/recipes-devtools/perl/files/perl-configpm-switch.patch
@@ -1,4 +1,4 @@
-From 7a48538a7e8614a3342151b646d2105c0cb0cdd9 Mon Sep 17 00:00:00 2001
+From 7fb6ea26ba60d8d346cd57fbd8f98b96f5a1a00c Mon Sep 17 00:00:00 2001
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
index 5472602d3a..7c1c3150e7 100644
--- a/meta/recipes-devtools/perl/files/perl-dynloader.patch
+++ b/meta/recipes-devtools/perl/files/perl-dynloader.patch
@@ -1,4 +1,4 @@
-From 25a26c52c320e699b37a7ad1f4f045bc8aa4cb00 Mon Sep 17 00:00:00 2001
+From 8d2cfe32843e3d254856c2e9acca38c86ecb2ccc Mon Sep 17 00:00:00 2001
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
index 1df1467d42..6867f26215 100644
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


--===============2315881836393093244==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1943 entries from dependency cache.
Parsing recipes...done.
Parsing of 944 .bb files complete (943 cached, 1 parsed). 1941 targets, 42 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-64 sysroot...done.
Removing 1 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.15.2"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2.99+snapshot-a2ff37dc156e81fbc41d3118ef5391a020dba19f"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:a2ff37dc156e81fbc41d3118ef5391a020dba19f"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 566 Local 240 Mirrors 0 Missed 326 Current 197 (42% match, 57% complete)
Removing 62 stale sstate objects for arch qemux86_64...done.
Removing 2 stale sstate objects for arch allarch...done.
Removing 53 stale sstate objects for arch x86_64...done.
Removing 22 stale sstate objects for arch core2-64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 275 of 763 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 288 of 763 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd_257.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 289 of 763 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc-locale_2.42.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 299 of 763 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/dpkg/dpkg_1.22.21.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 304 of 763 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/make/make_4.4.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 318 of 763 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 325 of 763 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 327 of 763 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 328 of 763 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/procps/procps_4.0.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 332 of 763 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.42.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 343 of 763 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.76.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 351 of 763 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 352 of 763 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_create_spdx_setscene)
NOTE: Running setscene task 357 of 763 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 358 of 763 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 362 of 763 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gawk/gawk_5.3.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe glibc-locale-2.42+git-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe psmisc-23.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe make-4.4.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libcap-2.76-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe procps-4.0.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sed-4.9-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe perl-5.42.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-native-0.7.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gawk-5.3.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe update-rc.d-native-0.8+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe systemd-1_257.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe dpkg-native-1.22.21-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe glibc-locale-2.42+git-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 365 of 763 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe psmisc-23.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe make-4.4.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 367 of 763 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.10.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 368 of 763 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_recipe_qa_setscene)
NOTE: recipe libcap-2.76-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 384 of 763 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 385 of 763 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 388 of 763 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe sed-4.9-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe procps-4.0.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe perl-5.42.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-native-0.7.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 392 of 763 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 393 of 763 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 400 of 763 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_34.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 401 of 763 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe shared-mime-info-2.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gawk-5.3.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 402 of 763 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.76.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 408 of 763 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/docbook-xml/docbook-xml-dtd4_4.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe update-rc.d-native-0.8+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe systemd-1_257.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 409 of 763 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 410 of 763 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/make/make_4.4.1.bb:do_recipe_qa_setscene)
NOTE: recipe dpkg-native-1.22.21-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 412 of 763 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/xmlto/xmlto_0.0.29.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 413 of 763 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/docbook-xml/docbook-xsl-stylesheets_1.79.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxkbcommon-1.10.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe psmisc-23.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-passwd-3.6.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe readline-8.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libcap-2.76-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shadow-4.18.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe kmod-34.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe wayland-1.24.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe make-4.4.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 415 of 763 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gawk/gawk_5.3.2.bb:do_recipe_qa_setscene)
NOTE: recipe docbook-xml-dtd4-native-4.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xmlto-native-0.0.29-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-passwd-3.6.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe psmisc-23.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxkbcommon-1.10.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 417 of 763 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe acl-2.3.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe readline-8.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 424 of 763 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 426 of 763 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd_257.8.bb:do_recipe_qa_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 435 of 763 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 436 of 763 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.84.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 442 of 763 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libseccomp-2.6.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libcap-2.76-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 443 of 763 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.7.bb:do_recipe_qa_setscene)
NOTE: recipe shadow-4.18.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe docbook-xsl-stylesheets-native-1.79.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 444 of 763 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 445 of 763 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.44.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe make-4.4.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe kmod-34.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe wayland-1.24.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 447 of 763 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 449 of 763 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_34.2.bb:do_recipe_qa_setscene)
NOTE: recipe docbook-xml-dtd4-native-4.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 450 of 763 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.14.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 451 of 763 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xmlto-native-0.0.29-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gawk-5.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 452 of 763 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_recipe_qa_setscene)
NOTE: recipe update-rc.d-0.8+git-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe docbook-xsl-stylesheets-native-1.79.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 453 of 763 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe readline-8.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-passwd-3.6.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xkeyboard-config-2.44-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe glib-2.0-1_2.84.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gawk-5.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libseccomp-2.6.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 455 of 763 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe update-rc.d-0.8+git-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxml2-2.14.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe kmod-34.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe systemd-1_257.8-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 466 of 763 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe wayland-native-1.24.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 469 of 763 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe acl-2.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe readline-8.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 473 of 763 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libxslt/libxslt_1.1.43.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe base-passwd-3.6.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 475 of 763 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.10.0.bb:do_recipe_qa_setscene)
NOTE: recipe mpfr-4.2.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.44-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 478 of 763 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe glib-2.0-1_2.84.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 484 of 763 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libseccomp-2.6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 485 of 763 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 487 of 763 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 490 of 763 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.44.bb:do_recipe_qa_setscene)
NOTE: recipe kmod-34.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxml2-2.14.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe wayland-native-1.24.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 492 of 763 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 493 of 763 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxcb-1.17.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 502 of 763 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.41.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe acl-2.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe systemd-1_257.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 506 of 763 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 508 of 763 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe mpfr-4.2.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 510 of 763 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.14.5.bb:do_recipe_qa_setscene)
NOTE: recipe libxkbcommon-1.10.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxslt-native-1.1.43-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 516 of 763 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.84.2.bb:do_recipe_qa_setscene)
NOTE: recipe xcb-proto-1.17.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe shadow-4.18.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.44-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 518 of 763 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxau-1_1.0.12-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 521 of 763 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe wayland-1.24.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-linux-2.41.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxml2-2.14.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxkbcommon-1.10.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 522 of 763 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_recipe_qa_setscene)
NOTE: recipe attr-2.5.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxslt-native-1.1.43-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 526 of 763 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xcb-proto-1.17.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 527 of 763 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0-initial_2.84.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe shadow-4.18.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 528 of 763 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.14.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xkeyboard-config-2.44-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 534 of 763 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 537 of 763 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 538 of 763 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_80.9.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxau-1_1.0.12-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 541 of 763 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 543 of 763 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.45.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe wayland-1.24.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 546 of 763 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 547 of 763 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe glib-2.0-1_2.84.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-2.41.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 548 of 763 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxml2-2.14.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gobject-introspection-1.84.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 553 of 763 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_recipe_qa_setscene)
NOTE: recipe libxcb-1.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xorgproto-2024.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe mpfr-4.2.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 554 of 763 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_recipe_qa_setscene)
NOTE: recipe python3-setuptools-80.9.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpam-1.7.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe glib-2.0-1_2.84.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpcre2-10.45-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 564 of 763 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_recipe_qa_setscene)
NOTE: recipe xcb-proto-1.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe glib-2.0-initial-1_2.84.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gobject-introspection-1.84.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 568 of 763 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_recipe_qa_setscene)
NOTE: recipe libxml2-native-2.14.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 572 of 763 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.8.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-3.13.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe mpfr-4.2.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 577 of 763 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 578 of 763 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxcrypt/libxcrypt_4.4.38.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-setuptools-80.9.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 580 of 763 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.41.1.bb:do_recipe_qa_setscene)
NOTE: recipe libpam-1.7.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 582 of 763 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xcb-proto-1.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 583 of 763 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_recipe_qa_setscene)
NOTE: recipe libcap-ng-0.8.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpcre2-10.45-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe glib-2.0-initial-1_2.84.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 589 of 763 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 590 of 763 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_80.9.0.bb:do_recipe_qa_setscene)
NOTE: recipe util-macros-1_1.20.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxml2-native-2.14.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 591 of 763 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 594 of 763 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 595 of 763 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xorgproto-2024.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 597 of 763 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0-initial_2.84.2.bb:do_recipe_qa_setscene)
NOTE: recipe python3-3.13.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 598 of 763 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.45.bb:do_recipe_qa_setscene)
NOTE: recipe xz-5.8.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bash-completion-2.16.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxcrypt-4.4.38-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 599 of 763 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe util-macros-1_1.20.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 600 of 763 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.6.bb:do_recipe_qa_setscene)
NOTE: recipe libedit-20250104-3.1-r1: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-2.41.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-setuptools-80.9.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xorgproto-2024.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 602 of 763 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.5.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gobject-introspection-1.84.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-3.5.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xz-5.8.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 603 of 763 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bash-completion-2.16.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxcrypt-4.4.38-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 604 of 763 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.1.bb:do_recipe_qa_setscene)
NOTE: recipe glib-2.0-initial-1_2.84.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 606 of 763 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.26.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libpcre2-10.45-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 607 of 763 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxau-1_1.0.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.48.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 608 of 763 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe util-linux-2.41.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-setuptools-80.9.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 609 of 763 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 610 of 763 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_recipe_qa_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 611 of 763 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.41.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gobject-introspection-1.84.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 617 of 763 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_recipe_qa_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libffi-3.5.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe openssl-3.5.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 618 of 763 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 619 of 763 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc-initial_15.2.bb:do_create_spdx_setscene)
NOTE: recipe glib-2.0-initial-1_2.84.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpcre2-10.45-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-3.13.6-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 620 of 763 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.8.1.bb:do_recipe_qa_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 624 of 763 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_create_spdx_setscene)
NOTE: recipe sqlite3-3_3.48.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 625 of 763 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.2.bb:do_recipe_qa_setscene)
NOTE: recipe gdbm-1.26-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpam-1.7.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe expat-2.7.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.5.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.41.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 627 of 763 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bash-completion-2.16.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libgcc-initial-15.2.0-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 629 of 763 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_recipe_qa_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-3.13.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 631 of 763 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gdbm-1.26-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xz-5.8.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpam-1.7.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 633 of 763 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.5.1.bb:do_recipe_qa_setscene)
NOTE: recipe ncurses-6.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 636 of 763 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libcap-ng-0.8.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libedit-20250104-3.1-r1: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 640 of 763 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_recipe_qa_setscene)
NOTE: recipe expat-2.7.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 645 of 763 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.42.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 647 of 763 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_recipe_qa_setscene)
NOTE: recipe libcap-ng-native-0.8.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe openssl-3.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-libuuid-2.41.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 650 of 763 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/meson/meson_1.8.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bash-completion-2.16.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 652 of 763 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-markupsafe_3.0.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 653 of 763 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jinja2_3.1.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libtool-cross-2.5.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcc-initial-15.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 655 of 763 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.41.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 656 of 763 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_80.9.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xz-5.8.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.48.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 657 of 763 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/unzip/unzip_6.0.bb:do_create_spdx_setscene)
NOTE: recipe openssl-3.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-15.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libffi-3.5.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 658 of 763 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_15.2.bb:do_create_spdx_setscene)
NOTE: recipe libtool-cross-2.5.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libcap-ng-native-0.8.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libgcc-15.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 662 of 763 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc-initial_15.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 663 of 763 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_recipe_qa_setscene)
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe expat-2.7.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe glibc-2.42+git-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe sqlite3-3_3.48.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 664 of 763 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_create_spdx_setscene)
NOTE: recipe meson-native-1.8.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-linux-libuuid-2.41.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-markupsafe-native-3.0.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-jinja2-native-3.1.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libffi-3.5.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-15.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 666 of 763 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-wheel_0.46.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 669 of 763 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.41.1.bb:do_create_spdx_setscene)
NOTE: recipe libgcc-15.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-setuptools-native-80.9.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 671 of 763 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-build_1.2.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-15.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe unzip-native-1_6.0-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 672 of 763 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.8.1.bb:do_create_spdx_setscene)
NOTE: recipe libtool-cross-2.5.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcc-initial-15.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glibc-2.42+git-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.41.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 676 of 763 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pyproject-hooks_1.2.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe meson-native-1.8.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 677 of 763 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-installer_0.7.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 678 of 763 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-packaging_25.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe expat-2.7.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-markupsafe-native-3.0.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 681 of 763 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/meson/meson_1.8.2.bb:do_recipe_qa_setscene)
NOTE: recipe python3-jinja2-native-3.1.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 682 of 763 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl-cross/perlcross_1.6.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 683 of 763 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-flit-core_3.12.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-setuptools-native-80.9.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 684 of 763 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/make/make_4.4.1.bb:do_create_spdx_setscene)
NOTE: recipe libtool-cross-2.5.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-native-3_3.48.0-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 685 of 763 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.26.bb:do_create_spdx_setscene)
NOTE: recipe unzip-native-1_6.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-15.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 688 of 763 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.45.bb:do_create_spdx_setscene)
NOTE: Running setscene task 695 of 763 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_create_spdx_setscene)
NOTE: recipe python3-wheel-native-0.46.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-linux-libuuid-native-2.41.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-build-native-1.2.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xz-native-5.8.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-pyproject-hooks-native-1.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe perlcross-native-1.6.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-installer-native-0.7.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe sqlite3-native-3_3.48.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 697 of 763 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rpm/rpm_4.20.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-packaging-native-25.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe meson-native-1.8.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-flit-core-native-3.12.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libgcc-initial-15.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 701 of 763 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rsync/rsync_3.4.1.bb:do_create_spdx_setscene)
NOTE: recipe make-native-4.4.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe util-linux-libuuid-native-2.41.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.45-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-build-native-1.2.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-wheel-native-0.46.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 702 of 763 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_15.2.bb:do_populate_sysroot_setscene)
NOTE: recipe zstd-native-1.5.7-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 703 of 763 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/dwarfsrcfiles/dwarfsrcfiles.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gdbm-native-1.26-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 704 of 763 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/unifdef/unifdef_2.12.bb:do_create_spdx_setscene)
NOTE: recipe xz-native-5.8.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 705 of 763 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.16.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-pyproject-hooks-native-1.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-installer-native-0.7.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 706 of 763 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc-initial_15.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 712 of 763 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/json-c/json-c_0.18.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe perlcross-native-1.6.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe meson-native-1.8.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-packaging-native-25.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 717 of 763 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.193.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-flit-core-native-3.12.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 720 of 763 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 721 of 763 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.8.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 722 of 763 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe make-native-4.4.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 725 of 763 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.15.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe binutils-cross-x86_64-2.45-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe zstd-native-1.5.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gdbm-native-1.26-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe rpm-native-1_4.20.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-cross-x86_64-15.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 726 of 763 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 729 of 763 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 730 of 763 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.41.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe rsync-native-3.4.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libgcc-initial-15.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe linux-libc-headers-6.16-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe unifdef-native-2.12-r0: task do_create_spdx_setscene: Started
NOTE: recipe rpm-native-1_4.20.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe json-c-native-0.18-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 733 of 763 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe elfutils-native-0.193-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libarchive-native-3.8.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe rsync-native-3.4.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe e2fsprogs-native-1.47.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libgcc-initial-15.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 736 of 763 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gnutls-native-3.8.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 737 of 763 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.20.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 740 of 763 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rsync/rsync_3.4.1.bb:do_populate_sysroot_setscene)
NOTE: recipe unifdef-native-2.12-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.16-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 742 of 763 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/unifdef/unifdef_2.12.bb:do_populate_sysroot_setscene)
NOTE: recipe libmicrohttpd-native-1.0.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 747 of 763 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/cmake/cmake-native_4.1.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe curl-native-8.15.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libidn2-native-2.3.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe json-c-native-0.18-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 749 of 763 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe elfutils-native-0.193-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 750 of 763 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl-cross/perlcross_1.6.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libarchive-native-3.8.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe e2fsprogs-native-1.47.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-linux-native-2.41.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 752 of 763 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.42.0.bb:do_recipe_qa_setscene)
NOTE: recipe gnutls-native-3.8.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe cmake-native-4.1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libmicrohttpd-native-1.0.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe curl-native-8.15.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libidn2-native-2.3.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libtasn1-native-4.20.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe rsync-native-3.4.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-native-2.7.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-linux-native-2.41.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe unifdef-native-2.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-native-3.13.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe cmake-native-4.1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe perlcross-native-1.6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 158 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/cmake/cmake-native_4.1.0.bb:do_fetch)
NOTE: recipe openssl-native-3.5.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtasn1-native-4.20.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe expat-native-2.7.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 202 of 2118 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_fetch)
NOTE: recipe perl-native-5.42.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 242 of 2118 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-flit-core_3.12.0.bb:do_fetch)
NOTE: Running task 252 of 2118 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-installer_0.7.0.bb:do_fetch)
NOTE: recipe python3-native-3.13.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 274 of 2118 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.6.bb:do_fetch)
NOTE: Running task 292 of 2118 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pyproject-hooks_1.2.0.bb:do_fetch)
NOTE: recipe cmake-native-4.1.0-r0: task do_fetch: Started
NOTE: Running task 308 of 2118 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-packaging_25.0.bb:do_fetch)
NOTE: Running task 320 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.16.bb:do_fetch)
NOTE: Running task 330 of 2118 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-build_1.2.2.bb:do_fetch)
NOTE: recipe unifdef-native-2.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe rsync-native-3.4.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 754 of 763 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/unifdef/unifdef_2.12.bb:do_recipe_qa_setscene)
NOTE: recipe perl-native-5.42.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 756 of 763 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rsync/rsync_3.4.1.bb:do_recipe_qa_setscene)
NOTE: Running task 345 of 2118 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-wheel_0.46.1.bb:do_fetch)
NOTE: Running task 347 of 2118 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.42.0.bb:do_fetch)
NOTE: recipe openssl-native-3.5.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 348 of 2118 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.2.bb:do_fetch)
NOTE: recipe expat-native-2.7.1-r0: task do_fetch: Started
NOTE: recipe python3-flit-core-native-3.12.0-r0: task do_fetch: Started
NOTE: recipe python3-installer-native-0.7.0-r0: task do_fetch: Started
NOTE: recipe linux-libc-headers-6.16-r0: task do_fetch: Started
NOTE: recipe expat-native-2.7.1-r0: task do_fetch: Succeeded
NOTE: Running task 349 of 2118 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_unpack)
NOTE: recipe python3-pyproject-hooks-native-1.2.0-r0: task do_fetch: Started
NOTE: recipe python3-packaging-native-25.0-r0: task do_fetch: Started
NOTE: recipe python3-build-native-1.2.2-r0: task do_fetch: Started
NOTE: recipe unifdef-native-2.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe rsync-native-3.4.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe perlcross-native-1.6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 758 of 763 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl-cross/perlcross_1.6.2.bb:do_recipe_qa_setscene)
NOTE: recipe python3-wheel-native-0.46.1-r0: task do_fetch: Started
NOTE: recipe python3-flit-core-native-3.12.0-r0: task do_fetch: Succeeded
NOTE: Running task 350 of 2118 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-flit-core_3.12.0.bb:do_unpack)
NOTE: recipe perl-native-5.42.0-r0: task do_fetch: Started
NOTE: recipe python3-native-3.13.6-r0: task do_fetch: Started
NOTE: recipe python3-installer-native-0.7.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-pyproject-hooks-native-1.2.0-r0: task do_fetch: Succeeded
NOTE: Running task 351 of 2118 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-installer_0.7.0.bb:do_unpack)
NOTE: recipe openssl-native-3.5.2-r0: task do_fetch: Started
NOTE: Running task 352 of 2118 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pyproject-hooks_1.2.0.bb:do_unpack)
NOTE: recipe perl-native-5.42.0-r0: task do_fetch: Succeeded
NOTE: recipe openssl-native-3.5.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-native-3.13.6-r0: task do_fetch: Succeeded
NOTE: Running task 353 of 2118 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.42.0.bb:do_unpack)
NOTE: recipe unifdef-native-2.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 354 of 2118 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.2.bb:do_unpack)
NOTE: Running task 355 of 2118 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.6.bb:do_unpack)
NOTE: recipe rsync-native-3.4.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe expat-native-2.7.1-r0: task do_unpack: Started
NOTE: Running task 398 of 2118 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_80.9.0.bb:do_fetch)
NOTE: Running task 408 of 2118 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.41.1.bb:do_fetch)
NOTE: recipe perlcross-native-1.6.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-build-native-1.2.2-r0: task do_fetch: Succeeded
NOTE: Running task 409 of 2118 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-build_1.2.2.bb:do_unpack)
NOTE: recipe python3-flit-core-native-3.12.0-r0: task do_unpack: Started
NOTE: recipe python3-packaging-native-25.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-wheel-native-0.46.1-r0: task do_fetch: Succeeded
NOTE: Running task 410 of 2118 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-packaging_25.0.bb:do_unpack)
NOTE: Running task 411 of 2118 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-wheel_0.46.1.bb:do_unpack)
NOTE: recipe python3-pyproject-hooks-native-1.2.0-r0: task do_unpack: Started
NOTE: recipe python3-installer-native-0.7.0-r0: task do_unpack: Started
NOTE: recipe python3-flit-core-native-3.12.0-r0: task do_unpack: Succeeded
NOTE: recipe perlcross-native-1.6.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 412 of 2118 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-flit-core_3.12.0.bb:do_patch)
NOTE: recipe python3-pyproject-hooks-native-1.2.0-r0: task do_unpack: Succeeded
NOTE: recipe perl-native-5.42.0-r0: task do_unpack: Started
NOTE: Running task 423 of 2118 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.42.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 424 of 2118 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pyproject-hooks_1.2.0.bb:do_patch)
NOTE: recipe openssl-native-3.5.2-r0: task do_unpack: Started
NOTE: recipe python3-installer-native-0.7.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-setuptools-native-80.9.0-r0: task do_fetch: Started
NOTE: recipe expat-native-2.7.1-r0: task do_unpack: Succeeded
NOTE: Running task 425 of 2118 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-installer_0.7.0.bb:do_patch)
NOTE: Running task 426 of 2118 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_patch)
NOTE: recipe python3-setuptools-native-80.9.0-r0: task do_fetch: Succeeded
NOTE: Running task 427 of 2118 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_80.9.0.bb:do_unpack)
NOTE: recipe python3-build-native-1.2.2-r0: task do_unpack: Started
NOTE: recipe python3-native-3.13.6-r0: task do_unpack: Started
NOTE: recipe util-linux-native-2.41.1-r0: task do_fetch: Started
NOTE: recipe python3-packaging-native-25.0-r0: task do_unpack: Started
NOTE: recipe python3-wheel-native-0.46.1-r0: task do_unpack: Started
NOTE: recipe python3-build-native-1.2.2-r0: task do_unpack: Succeeded
NOTE: Running task 428 of 2118 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-build_1.2.2.bb:do_patch)
NOTE: recipe util-linux-native-2.41.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-wheel-native-0.46.1-r0: task do_unpack: Succeeded
NOTE: Running task 432 of 2118 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/meson/meson_1.8.2.bb:do_fetch)
NOTE: recipe python3-flit-core-native-3.12.0-r0: task do_patch: Started
NOTE: Running task 433 of 2118 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-wheel_0.46.1.bb:do_patch)
NOTE: recipe python3-packaging-native-25.0-r0: task do_unpack: Succeeded
NOTE: Running task 434 of 2118 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-packaging_25.0.bb:do_patch)
NOTE: recipe perl-native-5.42.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pyproject-hooks-native-1.2.0-r0: task do_patch: Started
NOTE: recipe python3-installer-native-0.7.0-r0: task do_patch: Started
NOTE: recipe python3-flit-core-native-3.12.0-r0: task do_patch: Succeeded
NOTE: recipe expat-native-2.7.1-r0: task do_patch: Started
NOTE: recipe python3-setuptools-native-80.9.0-r0: task do_unpack: Started
NOTE: Running task 443 of 2118 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jinja2_3.1.6.bb:do_fetch)
NOTE: recipe python3-pyproject-hooks-native-1.2.0-r0: task do_patch: Succeeded
NOTE: Running task 446 of 2118 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-markupsafe_3.0.2.bb:do_fetch)
NOTE: recipe python3-build-native-1.2.2-r0: task do_patch: Started
NOTE: recipe expat-native-2.7.1-r0: task do_patch: Succeeded
NOTE: recipe meson-native-1.8.2-r0: task do_fetch: Started
NOTE: Running task 448 of 2118 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_generate_toolchain_file)
NOTE: recipe python3-wheel-native-0.46.1-r0: task do_patch: Started
NOTE: recipe meson-native-1.8.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-build-native-1.2.2-r0: task do_patch: Succeeded
NOTE: recipe python3-packaging-native-25.0-r0: task do_patch: Started
NOTE: Running task 454 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.42.bb:do_fetch)
NOTE: recipe perl-native-5.42.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-setuptools-native-80.9.0-r0: task do_unpack: Succeeded
NOTE: Running task 462 of 2118 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_80.9.0.bb:do_patch)
NOTE: Running task 463 of 2118 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.41.1.bb:do_unpack)
NOTE: Running task 466 of 2118 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/meson/meson_1.8.2.bb:do_unpack)
NOTE: recipe python3-wheel-native-0.46.1-r0: task do_patch: Succeeded
NOTE: recipe python3-packaging-native-25.0-r0: task do_patch: Succeeded
NOTE: recipe python3-jinja2-native-3.1.6-r0: task do_fetch: Started
NOTE: Running noexec task 499 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_fetch)
NOTE: Running noexec task 510 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_fetch)
NOTE: Running task 512 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_fetch)
NOTE: Running task 516 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_fetch)
NOTE: recipe python3-markupsafe-native-3.0.2-r0: task do_fetch: Started
NOTE: recipe python3-installer-native-0.7.0-r0: task do_patch: Succeeded
NOTE: Running task 525 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_fetch)
NOTE: recipe expat-native-2.7.1-r0: task do_generate_toolchain_file: Started
NOTE: recipe glibc-2.42+git-r0: task do_fetch: Started
NOTE: recipe python3-setuptools-native-80.9.0-r0: task do_patch: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_fetch: Started
NOTE: recipe meson-native-1.8.2-r0: task do_unpack: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_fetch: Started
NOTE: recipe python3-jinja2-native-3.1.6-r0: task do_fetch: Succeeded
NOTE: recipe glibc-2.42+git-r0: task do_fetch: Succeeded
NOTE: recipe expat-native-2.7.1-r0: task do_generate_toolchain_file: Succeeded
NOTE: Running task 526 of 2118 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jinja2_3.1.6.bb:do_unpack)
NOTE: recipe util-linux-native-2.41.1-r0: task do_unpack: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_fetch: Succeeded
NOTE: Running task 527 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.42.bb:do_unpack)
NOTE: recipe python3-markupsafe-native-3.0.2-r0: task do_fetch: Succeeded
NOTE: Running task 529 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_unpack)
NOTE: Running task 530 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_fetch)
NOTE: Running task 531 of 2118 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-markupsafe_3.0.2.bb:do_unpack)
NOTE: recipe zlib-1.3.1-r0: task do_fetch: Started
NOTE: recipe zlib-1.3.1-r0: task do_fetch: Succeeded
NOTE: Running task 533 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_fetch)
NOTE: recipe python3-setuptools-native-80.9.0-r0: task do_patch: Succeeded
NOTE: recipe gcc-cross-x86_64-15.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtool-cross-2.5.4-r0: task do_unpack: Started
NOTE: Running setscene task 759 of 763 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_15.2.bb:do_gcc_stash_builddir_setscene)
NOTE: Running task 535 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_unpack)
NOTE: recipe expat-2.7.1-r0: task do_fetch: Started
NOTE: recipe python3-jinja2-native-3.1.6-r0: task do_unpack: Started
NOTE: recipe glibc-2.42+git-r0: task do_unpack: Started
NOTE: recipe expat-2.7.1-r0: task do_fetch: Succeeded
NOTE: Running task 536 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_unpack)
NOTE: recipe python3-markupsafe-native-3.0.2-r0: task do_unpack: Started
NOTE: recipe bzip2-1.0.8-r0: task do_fetch: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_fetch: Succeeded
NOTE: Running task 537 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_unpack)
NOTE: recipe python3-markupsafe-native-3.0.2-r0: task do_unpack: Succeeded
NOTE: Running task 538 of 2118 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-markupsafe_3.0.2.bb:do_patch)
NOTE: recipe gcc-cross-x86_64-15.2.0-r0: task do_gcc_stash_builddir_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_unpack: Started
NOTE: recipe python3-jinja2-native-3.1.6-r0: task do_unpack: Succeeded
NOTE: Running task 539 of 2118 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jinja2_3.1.6.bb:do_patch)
NOTE: recipe expat-2.7.1-r0: task do_unpack: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_unpack: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_unpack: Started
NOTE: Running task 540 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_patch)
NOTE: recipe zlib-1.3.1-r0: task do_unpack: Succeeded
NOTE: Running task 541 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_patch)
NOTE: recipe python3-markupsafe-native-3.0.2-r0: task do_patch: Started
NOTE: recipe python3-jinja2-native-3.1.6-r0: task do_patch: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_patch: Started
NOTE: recipe bzip2-1.0.8-r0: task do_fetch: Succeeded
NOTE: Running task 543 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.26.bb:do_fetch)
NOTE: recipe python3-markupsafe-native-3.0.2-r0: task do_patch: Succeeded
NOTE: recipe meson-native-1.8.2-r0: task do_unpack: Succeeded
NOTE: Running task 547 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.2.bb:do_fetch)
NOTE: recipe zlib-1.3.1-r0: task do_patch: Started
NOTE: recipe expat-2.7.1-r0: task do_unpack: Succeeded
NOTE: Running task 548 of 2118 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/meson/meson_1.8.2.bb:do_patch)
NOTE: recipe python3-jinja2-native-3.1.6-r0: task do_patch: Succeeded
NOTE: Running task 549 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_patch)
NOTE: Running task 551 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.8.1.bb:do_fetch)
NOTE: recipe gdbm-1.26-r0: task do_fetch: Started
NOTE: recipe openssl-3.5.2-r0: task do_fetch: Started
NOTE: recipe gdbm-1.26-r0: task do_fetch: Succeeded
NOTE: Running task 558 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_unpack)
NOTE: recipe expat-2.7.1-r0: task do_patch: Started
NOTE: recipe xz-5.8.1-r0: task do_fetch: Started
NOTE: recipe meson-native-1.8.2-r0: task do_patch: Started
NOTE: recipe xz-5.8.1-r0: task do_fetch: Succeeded
NOTE: Running task 559 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.26.bb:do_unpack)
NOTE: recipe perl-native-5.42.0-r0: task do_unpack: Succeeded
NOTE: Running task 560 of 2118 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.42.0.bb:do_patch)
NOTE: recipe util-linux-native-2.41.1-r0: task do_unpack: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_patch: Succeeded
NOTE: Running task 561 of 2118 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.41.1.bb:do_patch)
NOTE: Running task 562 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.8.1.bb:do_unpack)
NOTE: recipe bzip2-1.0.8-r0: task do_unpack: Started
NOTE: recipe expat-2.7.1-r0: task do_patch: Succeeded
NOTE: Running task 566 of 2118 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.15.0.bb:do_fetch)
NOTE: recipe gdbm-1.26-r0: task do_unpack: Started
NOTE: recipe perl-native-5.42.0-r0: task do_patch: Started
NOTE: recipe xz-5.8.1-r0: task do_unpack: Started
NOTE: recipe gdbm-1.26-r0: task do_unpack: Succeeded
NOTE: Running task 567 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.26.bb:do_patch)
NOTE: recipe opkg-utils-0.7.0-r0: task do_unpack: Succeeded
NOTE: Running task 568 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_patch)
NOTE: recipe util-linux-native-2.41.1-r0: task do_patch: Started
NOTE: recipe meson-native-1.8.2-r0: task do_patch: Succeeded
NOTE: Running task 577 of 2118 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.3.bb:do_fetch)
NOTE: recipe curl-native-8.15.0-r0: task do_fetch: Started
NOTE: recipe openssl-3.5.2-r0: task do_fetch: Succeeded
NOTE: recipe xz-5.8.1-r0: task do_unpack: Succeeded
NOTE: Running task 578 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.2.bb:do_unpack)
NOTE: Running task 579 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.8.1.bb:do_patch)
NOTE: recipe opkg-utils-0.7.0-r0: task do_patch: Started
NOTE: recipe gdbm-1.26-r0: task do_patch: Started
NOTE: recipe curl-native-8.15.0-r0: task do_fetch: Succeeded
NOTE: Running task 582 of 2118 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.8.1.bb:do_fetch)
NOTE: recipe openssl-native-3.5.2-r0: task do_unpack: Succeeded
NOTE: Running task 583 of 2118 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.2.bb:do_patch)
NOTE: recipe python3-native-3.13.6-r0: task do_unpack: Succeeded
NOTE: Running task 584 of 2118 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.6.bb:do_patch)
NOTE: recipe xz-5.8.1-r0: task do_patch: Started
NOTE: recipe e2fsprogs-native-1.47.3-r0: task do_fetch: Started
NOTE: recipe openssl-3.5.2-r0: task do_unpack: Started
NOTE: recipe libarchive-native-3.8.1-r0: task do_fetch: Started
NOTE: recipe libarchive-native-3.8.1-r0: task do_fetch: Succeeded
NOTE: Running task 588 of 2118 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/json-c/json-c_0.18.bb:do_fetch)
NOTE: recipe opkg-utils-0.7.0-r0: task do_patch: Succeeded
NOTE: recipe gdbm-1.26-r0: task do_patch: Succeeded
NOTE: Running task 590 of 2118 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.15.0.bb:do_unpack)
NOTE: Running task 592 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_generate_toolchain_file)
NOTE: recipe xz-5.8.1-r0: task do_patch: Succeeded
NOTE: recipe openssl-native-3.5.2-r0: task do_patch: Started
NOTE: Running task 599 of 2118 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.8.1.bb:do_unpack)
NOTE: recipe libtool-cross-2.5.4-r0: task do_patch: Succeeded
NOTE: Running task 604 of 2118 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_fetch)
NOTE: recipe python3-native-3.13.6-r0: task do_patch: Started
NOTE: recipe json-c-native-0.18-r0: task do_fetch: Started
NOTE: recipe e2fsprogs-native-1.47.3-r0: task do_fetch: Succeeded
NOTE: recipe expat-2.7.1-r0: task do_generate_toolchain_file: Started
NOTE: Running task 605 of 2118 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.3.bb:do_unpack)
NOTE: recipe json-c-native-0.18-r0: task do_fetch: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_unpack: Succeeded
NOTE: Running task 606 of 2118 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.20.0.bb:do_fetch)
NOTE: Running task 607 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_patch)
NOTE: recipe curl-native-8.15.0-r0: task do_unpack: Started
NOTE: recipe libarchive-native-3.8.1-r0: task do_unpack: Started
NOTE: recipe libidn2-native-2.3.8-r0: task do_fetch: Started
NOTE: recipe expat-2.7.1-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe libidn2-native-2.3.8-r0: task do_fetch: Succeeded
NOTE: Running task 610 of 2118 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.10.bb:do_fetch)
NOTE: Running task 612 of 2118 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.2.bb:do_fetch)
NOTE: recipe bzip2-1.0.8-r0: task do_patch: Started
NOTE: recipe e2fsprogs-native-1.47.3-r0: task do_unpack: Started
NOTE: recipe libtasn1-native-4.20.0-r0: task do_fetch: Started
NOTE: recipe libtasn1-native-4.20.0-r0: task do_fetch: Succeeded
NOTE: recipe openssl-native-3.5.2-r0: task do_patch: Succeeded
NOTE: Running task 613 of 2118 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/json-c/json-c_0.18.bb:do_unpack)
NOTE: Running task 616 of 2118 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.193.bb:do_fetch)
NOTE: recipe libmicrohttpd-native-1.0.2-r0: task do_fetch: Started
NOTE: recipe gnutls-native-3.8.10-r0: task do_fetch: Started
NOTE: recipe libmicrohttpd-native-1.0.2-r0: task do_fetch: Succeeded
NOTE: Running task 620 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_fetch)
NOTE: recipe libarchive-native-3.8.1-r0: task do_unpack: Succeeded
NOTE: recipe gnutls-native-3.8.10-r0: task do_fetch: Succeeded
NOTE: Running task 621 of 2118 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.8.1.bb:do_patch)
NOTE: recipe util-linux-native-2.41.1-r0: task do_patch: Succeeded
NOTE: Running task 623 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxcrypt/libxcrypt_4.4.38.bb:do_fetch)
NOTE: Running task 626 of 2118 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rpm/rpm_4.20.1.bb:do_fetch)
NOTE: recipe json-c-native-0.18-r0: task do_unpack: Started
NOTE: recipe elfutils-native-0.193-r0: task do_fetch: Started
NOTE: recipe bzip2-1.0.8-r0: task do_patch: Succeeded
NOTE: Running task 628 of 2118 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_unpack)
NOTE: recipe elfutils-native-0.193-r0: task do_fetch: Succeeded
NOTE: Running task 629 of 2118 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.20.0.bb:do_unpack)
NOTE: recipe ncurses-6.5-r0: task do_fetch: Started
NOTE: recipe libxcrypt-4.4.38-r0: task do_fetch: Started
NOTE: recipe json-c-native-0.18-r0: task do_unpack: Succeeded
NOTE: Running task 630 of 2118 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/json-c/json-c_0.18.bb:do_patch)
NOTE: recipe libarchive-native-3.8.1-r0: task do_patch: Started
NOTE: recipe rpm-native-1_4.20.1-r0: task do_fetch: Started
NOTE: recipe curl-native-8.15.0-r0: task do_unpack: Succeeded
NOTE: Running task 631 of 2118 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.15.0.bb:do_patch)
NOTE: recipe libarchive-native-3.8.1-r0: task do_patch: Succeeded
NOTE: Running task 640 of 2118 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.10.bb:do_unpack)
NOTE: recipe libidn2-native-2.3.8-r0: task do_unpack: Started
NOTE: recipe libtasn1-native-4.20.0-r0: task do_unpack: Started
NOTE: recipe json-c-native-0.18-r0: task do_patch: Started
NOTE: recipe libxcrypt-4.4.38-r0: task do_fetch: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_fetch: Succeeded
NOTE: Running task 641 of 2118 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.2.bb:do_unpack)
NOTE: Running task 642 of 2118 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.193.bb:do_unpack)
NOTE: recipe json-c-native-0.18-r0: task do_patch: Succeeded
NOTE: Running task 647 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_unpack)
NOTE: recipe curl-native-8.15.0-r0: task do_patch: Started
NOTE: recipe gnutls-native-3.8.10-r0: task do_unpack: Started
NOTE: recipe libtasn1-native-4.20.0-r0: task do_unpack: Succeeded
NOTE: Running task 648 of 2118 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.20.0.bb:do_patch)
NOTE: recipe libidn2-native-2.3.8-r0: task do_unpack: Succeeded
NOTE: Running task 649 of 2118 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_patch)
NOTE: recipe ncurses-6.5-r0: task do_unpack: Started
NOTE: recipe libmicrohttpd-native-1.0.2-r0: task do_unpack: Started
NOTE: recipe elfutils-native-0.193-r0: task do_unpack: Started
NOTE: recipe curl-native-8.15.0-r0: task do_patch: Succeeded
NOTE: Running task 673 of 2118 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/dwarfsrcfiles/dwarfsrcfiles.bb:do_fetch)
NOTE: recipe libtasn1-native-4.20.0-r0: task do_patch: Started
NOTE: recipe libidn2-native-2.3.8-r0: task do_patch: Started
NOTE: recipe libmicrohttpd-native-1.0.2-r0: task do_unpack: Succeeded
NOTE: Running task 674 of 2118 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.2.bb:do_patch)
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_fetch: Started
NOTE: recipe libidn2-native-2.3.8-r0: task do_patch: Succeeded
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_fetch: Succeeded
NOTE: Running task 675 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxcrypt/libxcrypt_4.4.38.bb:do_unpack)
NOTE: Running task 677 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.5.1.bb:do_fetch)
NOTE: recipe libtasn1-native-4.20.0-r0: task do_patch: Succeeded
NOTE: Running task 682 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.41.1.bb:do_fetch)
NOTE: recipe libmicrohttpd-native-1.0.2-r0: task do_patch: Started
NOTE: recipe libffi-3.5.1-r0: task do_fetch: Started
NOTE: recipe libxcrypt-4.4.38-r0: task do_unpack: Started
NOTE: recipe libmicrohttpd-native-1.0.2-r0: task do_patch: Succeeded
NOTE: recipe e2fsprogs-native-1.47.3-r0: task do_unpack: Succeeded
NOTE: recipe util-linux-libuuid-2.41.1-r0: task do_fetch: Started
NOTE: Running task 683 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_fetch)
NOTE: Running task 684 of 2118 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.3.bb:do_patch)
NOTE: recipe libffi-3.5.1-r0: task do_fetch: Succeeded
NOTE: Running task 689 of 2118 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.42.0.bb:do_collect_spdx_deps)
NOTE: recipe util-linux-libuuid-2.41.1-r0: task do_fetch: Succeeded
NOTE: Running task 695 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_fetch)
NOTE: recipe sqlite3-3_3.48.0-r0: task do_fetch: Started
NOTE: recipe sqlite3-3_3.48.0-r0: task do_fetch: Succeeded
NOTE: Running task 697 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.6.bb:do_fetch)
NOTE: recipe libedit-20250104-3.1-r1: task do_fetch: Started
NOTE: recipe e2fsprogs-native-1.47.3-r0: task do_patch: Started
NOTE: recipe perl-native-5.42.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_fetch: Succeeded
NOTE: recipe openssl-3.5.2-r0: task do_unpack: Succeeded
NOTE: Running task 698 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.2.bb:do_patch)
NOTE: Running task 717 of 2118 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/json-c/json-c_0.18.bb:do_generate_toolchain_file)
NOTE: recipe perl-native-5.42.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 720 of 2118 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/dwarfsrcfiles/dwarfsrcfiles.bb:do_unpack)
NOTE: recipe gnutls-native-3.8.10-r0: task do_unpack: Succeeded
NOTE: Running task 721 of 2118 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.10.bb:do_patch)
NOTE: recipe python3-3.13.6-r0: task do_fetch: Started
NOTE: recipe openssl-3.5.2-r0: task do_patch: Started
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_unpack: Started
NOTE: recipe python3-3.13.6-r0: task do_fetch: Succeeded
NOTE: recipe json-c-native-0.18-r0: task do_generate_toolchain_file: Started
NOTE: Running task 722 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.5.1.bb:do_unpack)
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_unpack: Succeeded
NOTE: recipe gcc-cross-x86_64-15.2.0-r0: task do_gcc_stash_builddir_setscene: Succeeded
NOTE: Running setscene task 762 of 763 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.45.bb:do_populate_sysroot_setscene)
NOTE: Running task 733 of 2118 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/dwarfsrcfiles/dwarfsrcfiles.bb:do_patch)
NOTE: recipe python3-native-3.13.6-r0: task do_patch: Succeeded
NOTE: Running task 736 of 2118 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.14.5.bb:do_fetch)
NOTE: recipe gnutls-native-3.8.10-r0: task do_patch: Started
NOTE: recipe json-c-native-0.18-r0: task do_generate_toolchain_file: Succeeded
NOTE: Running task 740 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.1.bb:do_fetch)
NOTE: recipe libffi-3.5.1-r0: task do_unpack: Started
NOTE: recipe binutils-cross-x86_64-2.45-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcrypt-4.4.38-r0: task do_unpack: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_unpack: Succeeded
NOTE: Running task 741 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxcrypt/libxcrypt_4.4.38.bb:do_patch)
NOTE: Running task 742 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_patch)
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_patch: Started
NOTE: recipe libxml2-native-2.14.5-r0: task do_fetch: Started
NOTE: recipe libpam-1.7.1-r0: task do_fetch: Started
NOTE: recipe libffi-3.5.1-r0: task do_unpack: Succeeded
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_patch: Succeeded
NOTE: Running task 743 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.5.1.bb:do_patch)
NOTE: Running task 744 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.41.1.bb:do_unpack)
NOTE: recipe libpam-1.7.1-r0: task do_fetch: Succeeded
NOTE: Running task 745 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_unpack)
NOTE: recipe libxcrypt-4.4.38-r0: task do_patch: Started
NOTE: recipe e2fsprogs-native-1.47.3-r0: task do_patch: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_patch: Started
NOTE: Running task 747 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_unpack)
NOTE: recipe libffi-3.5.1-r0: task do_patch: Started
NOTE: recipe openssl-3.5.2-r0: task do_patch: Succeeded
NOTE: recipe util-linux-libuuid-2.41.1-r0: task do_unpack: Started
NOTE: Running task 749 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.6.bb:do_unpack)
NOTE: recipe sqlite3-3_3.48.0-r0: task do_unpack: Started
NOTE: recipe gnutls-native-3.8.10-r0: task do_patch: Succeeded
NOTE: Running task 769 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.1.bb:do_unpack)
NOTE: recipe libedit-20250104-3.1-r1: task do_unpack: Started
NOTE: recipe libxcrypt-4.4.38-r0: task do_patch: Succeeded
NOTE: Running task 800 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_fetch)
NOTE: recipe libedit-20250104-3.1-r1: task do_unpack: Succeeded
NOTE: Running task 801 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_patch)
NOTE: recipe glibc-2.42+git-r0: task do_unpack: Succeeded
NOTE: recipe sqlite3-3_3.48.0-r0: task do_unpack: Succeeded
NOTE: Running task 802 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.42.bb:do_patch)
NOTE: Running task 803 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_patch)
NOTE: recipe binutils-cross-x86_64-2.45-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpam-1.7.1-r0: task do_unpack: Started
NOTE: Setscene tasks completed
NOTE: recipe python3-3.13.6-r0: task do_unpack: Started
NOTE: Running task 813 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.1.bb:do_write_config)
NOTE: recipe bash-completion-2.16.0-r0: task do_fetch: Started
NOTE: recipe libffi-3.5.1-r0: task do_patch: Succeeded
NOTE: Running task 818 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.45.bb:do_fetch)
NOTE: recipe libedit-20250104-3.1-r1: task do_patch: Started
NOTE: recipe sqlite3-3_3.48.0-r0: task do_patch: Started
NOTE: recipe elfutils-native-0.193-r0: task do_unpack: Succeeded
NOTE: Running task 819 of 2118 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.193.bb:do_patch)
NOTE: recipe glibc-2.42+git-r0: task do_patch: Started
NOTE: recipe libpam-1.7.1-r0: task do_write_config: Started
NOTE: recipe libpcre2-10.45-r0: task do_fetch: Started
NOTE: recipe libpam-1.7.1-r0: task do_write_config: Succeeded
NOTE: Running task 821 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0-initial_2.84.2.bb:do_fetch)
NOTE: recipe sqlite3-3_3.48.0-r0: task do_patch: Succeeded
NOTE: Running task 826 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.14.5.bb:do_fetch)
NOTE: recipe elfutils-native-0.193-r0: task do_patch: Started
NOTE: recipe libpam-1.7.1-r0: task do_unpack: Succeeded
NOTE: recipe libedit-20250104-3.1-r1: task do_patch: Succeeded
NOTE: Running task 827 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.1.bb:do_patch)
NOTE: Running task 832 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_fetch)
NOTE: recipe ncurses-6.5-r0: task do_patch: Succeeded
NOTE: Running task 835 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.41.1.bb:do_fetch)
NOTE: recipe glib-2.0-initial-1_2.84.2-r0: task do_fetch: Started
NOTE: recipe libxml2-2.14.5-r0: task do_fetch: Started
NOTE: recipe glib-2.0-initial-1_2.84.2-r0: task do_fetch: Succeeded
NOTE: Running task 836 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0-initial_2.84.2.bb:do_unpack)
NOTE: recipe libcap-ng-0.8.5-r0: task do_fetch: Started
NOTE: recipe libpam-1.7.1-r0: task do_patch: Started
NOTE: recipe util-linux-2.41.1-r0: task do_fetch: Started
NOTE: recipe util-linux-libuuid-2.41.1-r0: task do_unpack: Succeeded
NOTE: Running task 837 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.41.1.bb:do_patch)
NOTE: recipe libpam-1.7.1-r0: task do_patch: Succeeded
NOTE: Running task 842 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_fetch)
NOTE: recipe util-linux-2.41.1-r0: task do_fetch: Succeeded
NOTE: Running task 845 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.41.1.bb:do_unpack)
NOTE: recipe glib-2.0-initial-1_2.84.2-r0: task do_unpack: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_fetch: Succeeded
NOTE: recipe util-linux-libuuid-2.41.1-r0: task do_patch: Started
NOTE: Running task 846 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_unpack)
NOTE: recipe attr-2.5.2-r0: task do_fetch: Started
NOTE: recipe attr-2.5.2-r0: task do_fetch: Succeeded
NOTE: Running task 847 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0-initial_2.84.2.bb:do_write_config)
NOTE: recipe util-linux-2.41.1-r0: task do_unpack: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_unpack: Started
NOTE: recipe glib-2.0-initial-1_2.84.2-r0: task do_write_config: Started
NOTE: recipe glib-2.0-initial-1_2.84.2-r0: task do_write_config: Succeeded
NOTE: Running task 850 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_unpack)
NOTE: recipe libpcre2-10.45-r0: task do_fetch: Succeeded
NOTE: Running task 851 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.45.bb:do_unpack)
NOTE: recipe bash-completion-2.16.0-r0: task do_unpack: Succeeded
NOTE: Running task 852 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_patch)
NOTE: recipe libxml2-native-2.14.5-r0: task do_fetch: Succeeded
NOTE: recipe libxml2-2.14.5-r0: task do_fetch: Succeeded
NOTE: Running task 853 of 2118 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.14.5.bb:do_unpack)
NOTE: Running task 854 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.14.5.bb:do_unpack)
NOTE: recipe elfutils-native-0.193-r0: task do_patch: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_unpack: Started
NOTE: Running task 875 of 2118 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_fetch)
NOTE: recipe libpcre2-10.45-r0: task do_unpack: Started
NOTE: recipe attr-2.5.2-r0: task do_unpack: Succeeded
NOTE: Running task 876 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_patch)
NOTE: recipe bash-completion-2.16.0-r0: task do_patch: Started
NOTE: recipe glib-2.0-initial-1_2.84.2-r0: task do_unpack: Succeeded
NOTE: Running task 877 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0-initial_2.84.2.bb:do_patch)
NOTE: recipe libxml2-2.14.5-r0: task do_unpack: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_patch: Succeeded
NOTE: recipe libxml2-native-2.14.5-r0: task do_unpack: Started
NOTE: Running task 880 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_80.9.0.bb:do_fetch)
NOTE: recipe wayland-native-1.24.0-r0: task do_fetch: Started
NOTE: recipe wayland-native-1.24.0-r0: task do_fetch: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_patch: Started
NOTE: Running task 882 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_fetch)
NOTE: recipe glib-2.0-initial-1_2.84.2-r0: task do_patch: Started
NOTE: recipe python3-setuptools-80.9.0-r0: task do_fetch: Started
NOTE: recipe python3-setuptools-80.9.0-r0: task do_fetch: Succeeded
NOTE: Running task 885 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_fetch)
NOTE: recipe util-linux-libuuid-2.41.1-r0: task do_patch: Succeeded
NOTE: recipe gobject-introspection-1.84.0-r0: task do_fetch: Started
NOTE: recipe util-linux-2.41.1-r0: task do_unpack: Succeeded
NOTE: Running task 887 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.84.2.bb:do_fetch)
NOTE: Running task 888 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.41.1.bb:do_patch)
NOTE: recipe gobject-introspection-1.84.0-r0: task do_fetch: Succeeded
NOTE: Running task 897 of 2118 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_unpack)
NOTE: recipe attr-2.5.2-r0: task do_patch: Succeeded
NOTE: recipe wayland-1.24.0-r0: task do_fetch: Started
NOTE: Running task 899 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_80.9.0.bb:do_unpack)
NOTE: recipe libpcre2-10.45-r0: task do_unpack: Succeeded
NOTE: recipe wayland-1.24.0-r0: task do_fetch: Succeeded
NOTE: Running task 900 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.45.bb:do_patch)
NOTE: Running task 901 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_unpack)
NOTE: recipe glib-2.0-1_2.84.2-r0: task do_fetch: Started
NOTE: recipe python3-3.13.6-r0: task do_unpack: Succeeded
NOTE: recipe util-linux-2.41.1-r0: task do_patch: Started
NOTE: Running task 902 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.6.bb:do_patch)
NOTE: recipe glib-2.0-1_2.84.2-r0: task do_fetch: Succeeded
NOTE: Running task 905 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_fetch)
NOTE: recipe wayland-native-1.24.0-r0: task do_unpack: Started
NOTE: recipe python3-setuptools-80.9.0-r0: task do_unpack: Started
NOTE: recipe libpcre2-10.45-r0: task do_patch: Started
NOTE: recipe gobject-introspection-1.84.0-r0: task do_unpack: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_fetch: Started
NOTE: recipe glibc-2.42+git-r0: task do_patch: Succeeded
NOTE: recipe linux-libc-headers-6.16-r0: task do_fetch: Succeeded
NOTE: Running task 906 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.16.bb:do_unpack)
NOTE: Running task 907 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.16.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-setuptools-80.9.0-r0: task do_unpack: Succeeded
NOTE: Running task 909 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_80.9.0.bb:do_patch)
NOTE: recipe python3-3.13.6-r0: task do_patch: Started
NOTE: recipe wayland-native-1.24.0-r0: task do_unpack: Succeeded
NOTE: recipe libpcre2-10.45-r0: task do_patch: Succeeded
NOTE: Running task 910 of 2118 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_patch)
NOTE: Running task 912 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_fetch)
NOTE: recipe linux-libc-headers-6.16-r0: task do_unpack: Started
NOTE: recipe linux-libc-headers-6.16-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxml2-2.14.5-r0: task do_unpack: Succeeded
NOTE: recipe python3-setuptools-80.9.0-r0: task do_patch: Started
NOTE: Running task 913 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.14.5.bb:do_patch)
NOTE: recipe acl-2.3.2-r0: task do_fetch: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_fetch: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_fetch: Succeeded
NOTE: Running task 916 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_unpack)
NOTE: Running task 917 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.84.2.bb:do_unpack)
NOTE: recipe wayland-native-1.24.0-r0: task do_patch: Started
NOTE: recipe linux-libc-headers-6.16-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gobject-introspection-1.84.0-r0: task do_unpack: Succeeded
NOTE: Running task 920 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_fetch)
NOTE: Running task 921 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_patch)
NOTE: recipe libxml2-2.14.5-r0: task do_patch: Started
NOTE: recipe glib-2.0-initial-1_2.84.2-r0: task do_patch: Succeeded
NOTE: Running task 923 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_fetch)
NOTE: recipe wayland-1.24.0-r0: task do_unpack: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_fetch: Succeeded
NOTE: recipe python3-setuptools-80.9.0-r0: task do_patch: Succeeded
NOTE: Running task 924 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_unpack)
NOTE: recipe glib-2.0-1_2.84.2-r0: task do_unpack: Started
NOTE: recipe xorgproto-2024.1-r0: task do_fetch: Started
NOTE: Running task 926 of 2118 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libxslt/libxslt_1.1.43.bb:do_fetch)
NOTE: recipe wayland-native-1.24.0-r0: task do_patch: Succeeded
NOTE: Running task 927 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_unpack)
NOTE: recipe xorgproto-2024.1-r0: task do_fetch: Succeeded
NOTE: recipe libxml2-native-2.14.5-r0: task do_unpack: Succeeded
NOTE: recipe gobject-introspection-1.84.0-r0: task do_patch: Started
NOTE: Running task 928 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_unpack)
NOTE: Running task 929 of 2118 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.14.5.bb:do_patch)
NOTE: recipe util-macros-1_1.20.2-r0: task do_fetch: Started
NOTE: recipe gobject-introspection-1.84.0-r0: task do_patch: Succeeded
NOTE: Running task 930 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_unpack)
NOTE: recipe libcap-ng-0.8.5-r0: task do_unpack: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_unpack: Started
NOTE: recipe libxslt-native-1.1.43-r0: task do_fetch: Started
NOTE: recipe wayland-1.24.0-r0: task do_unpack: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_unpack: Started
NOTE: Running task 931 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_patch)
NOTE: recipe libxml2-native-2.14.5-r0: task do_patch: Started
NOTE: recipe util-linux-2.41.1-r0: task do_patch: Succeeded
NOTE: recipe libxml2-2.14.5-r0: task do_patch: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_unpack: Started
NOTE: Running task 934 of 2118 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_write_config)
NOTE: Running task 938 of 2118 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/docbook-xml/docbook-xml-dtd4_4.5.bb:do_fetch)
NOTE: recipe acl-2.3.2-r0: task do_unpack: Succeeded
NOTE: Running task 939 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_patch)
NOTE: recipe wayland-1.24.0-r0: task do_patch: Started
NOTE: recipe docbook-xml-dtd4-native-4.5-r0: task do_fetch: Started
NOTE: recipe acl-2.3.2-r0: task do_patch: Started
NOTE: recipe wayland-native-1.24.0-r0: task do_write_config: Started
NOTE: recipe xorgproto-2024.1-r0: task do_unpack: Succeeded
NOTE: Running task 940 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_patch)
NOTE: recipe wayland-1.24.0-r0: task do_patch: Succeeded
NOTE: Running task 941 of 2118 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/docbook-xml/docbook-xsl-stylesheets_1.79.1.bb:do_fetch)
NOTE: recipe wayland-native-1.24.0-r0: task do_write_config: Succeeded
NOTE: Running task 944 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_write_config)
NOTE: recipe libxml2-native-2.14.5-r0: task do_patch: Succeeded
NOTE: Running task 947 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_write_config)
NOTE: recipe xorgproto-2024.1-r0: task do_patch: Started
NOTE: recipe glib-2.0-1_2.84.2-r0: task do_unpack: Succeeded
NOTE: recipe docbook-xsl-stylesheets-native-1.79.1-r0: task do_fetch: Started
NOTE: Running task 948 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.84.2.bb:do_patch)
NOTE: recipe xorgproto-2024.1-r0: task do_patch: Succeeded
NOTE: Running task 949 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.84.2.bb:do_write_config)
NOTE: recipe gobject-introspection-1.84.0-r0: task do_write_config: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_unpack: Succeeded
NOTE: Running task 950 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_patch)
NOTE: recipe wayland-1.24.0-r0: task do_write_config: Started
NOTE: recipe acl-2.3.2-r0: task do_patch: Succeeded
NOTE: Running task 952 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.7.bb:do_fetch)
NOTE: recipe libseccomp-2.6.0-r0: task do_unpack: Succeeded
NOTE: recipe gobject-introspection-1.84.0-r0: task do_write_config: Succeeded
NOTE: Running task 953 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_patch)
NOTE: Running task 956 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.42.0.bb:do_fetch)
NOTE: recipe wayland-1.24.0-r0: task do_write_config: Succeeded
NOTE: Running task 958 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_write_config)
NOTE: recipe glib-2.0-1_2.84.2-r0: task do_patch: Started
NOTE: recipe glib-2.0-1_2.84.2-r0: task do_write_config: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_patch: Started
NOTE: recipe libxslt-native-1.1.43-r0: task do_fetch: Succeeded
NOTE: Running task 959 of 2118 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libxslt/libxslt_1.1.43.bb:do_unpack)
NOTE: recipe base-passwd-3.6.7-r0: task do_fetch: Started
NOTE: recipe glib-2.0-1_2.84.2-r0: task do_write_config: Succeeded
NOTE: recipe base-passwd-3.6.7-r0: task do_fetch: Succeeded
NOTE: recipe libseccomp-2.6.0-r0: task do_patch: Started
NOTE: Running task 961 of 2118 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/xmlto/xmlto_0.0.29.bb:do_fetch)
NOTE: recipe perl-5.42.0-r0: task do_fetch: Started
NOTE: Running task 962 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.7.bb:do_unpack)
NOTE: recipe xorgproto-2024.1-r0: task do_write_config: Started
NOTE: recipe perl-5.42.0-r0: task do_fetch: Succeeded
NOTE: Running task 964 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_fetch)
NOTE: recipe xorgproto-2024.1-r0: task do_write_config: Succeeded
NOTE: recipe libxslt-native-1.1.43-r0: task do_unpack: Started
NOTE: Running task 969 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_fetch)
NOTE: recipe base-passwd-3.6.7-r0: task do_unpack: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_patch: Succeeded
NOTE: recipe xmlto-native-0.0.29-r0: task do_fetch: Started
NOTE: Running task 971 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_fetch)
NOTE: recipe libcap-ng-0.8.5-r0: task do_patch: Succeeded
NOTE: Running task 973 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_fetch)
NOTE: recipe sed-4.9-r0: task do_fetch: Started
NOTE: recipe sed-4.9-r0: task do_fetch: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_fetch: Started
NOTE: Running task 974 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_fetch)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_fetch: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_fetch: Started
NOTE: Running task 975 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.42.0.bb:do_unpack)
NOTE: recipe libxau-1_1.0.12-r0: task do_fetch: Started
NOTE: recipe python3-3.13.6-r0: task do_patch: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_fetch: Succeeded
NOTE: Running task 980 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_fetch)
NOTE: Running task 984 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.44.bb:do_fetch)
NOTE: recipe base-passwd-3.6.7-r0: task do_unpack: Succeeded
NOTE: Running task 985 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.7.bb:do_patch)
NOTE: recipe xcb-proto-1.17.0-r0: task do_fetch: Started
NOTE: recipe perl-5.42.0-r0: task do_unpack: Started
NOTE: recipe shadow-4.18.0-r0: task do_fetch: Started
NOTE: recipe xkeyboard-config-2.44-r0: task do_fetch: Started
NOTE: recipe libxslt-native-1.1.43-r0: task do_unpack: Succeeded
NOTE: recipe xkeyboard-config-2.44-r0: task do_fetch: Succeeded
NOTE: Running task 986 of 2118 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libxslt/libxslt_1.1.43.bb:do_patch)
NOTE: recipe base-passwd-3.6.7-r0: task do_patch: Started
NOTE: recipe shadow-4.18.0-r0: task do_fetch: Succeeded
NOTE: Running task 987 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_fetch)
NOTE: Running task 989 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_unpack)
NOTE: recipe libxcb-1.17.0-r0: task do_fetch: Started
NOTE: recipe sed-4.9-r0: task do_unpack: Started
NOTE: recipe libxcb-1.17.0-r0: task do_fetch: Succeeded
NOTE: recipe libxslt-native-1.1.43-r0: task do_patch: Started
NOTE: Running task 990 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_unpack)
NOTE: recipe glib-2.0-1_2.84.2-r0: task do_patch: Succeeded
NOTE: Running task 992 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_unpack)
NOTE: recipe libxslt-native-1.1.43-r0: task do_patch: Succeeded
NOTE: Running task 997 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_unpack)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_unpack: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_unpack: Started
NOTE: recipe cmake-native-4.1.0-r0: task do_fetch: Succeeded
NOTE: Running task 998 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/cmake/cmake-native_4.1.0.bb:do_unpack)
NOTE: recipe shadow-4.18.0-r0: task do_unpack: Started
NOTE: recipe sed-4.9-r0: task do_unpack: Succeeded
NOTE: Running task 999 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_patch)
NOTE: recipe cmake-native-4.1.0-r0: task do_unpack: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_unpack: Succeeded
NOTE: Running task 1000 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_patch)
NOTE: recipe libxau-1_1.0.12-r0: task do_unpack: Succeeded
NOTE: Running task 1001 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_patch)
NOTE: recipe sed-4.9-r0: task do_patch: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_patch: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_patch: Started
NOTE: recipe sed-4.9-r0: task do_patch: Succeeded
NOTE: Running task 1018 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.10.0.bb:do_fetch)
NOTE: recipe base-passwd-3.6.7-r0: task do_patch: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_patch: Succeeded
NOTE: Running task 1020 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_fetch)
NOTE: Running task 1021 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_fetch)
NOTE: recipe libxau-1_1.0.12-r0: task do_patch: Succeeded
NOTE: Running task 1022 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_fetch)
NOTE: recipe libxkbcommon-1.10.0-r0: task do_fetch: Started
NOTE: recipe zstd-1.5.7-r0: task do_fetch: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_fetch: Started
NOTE: recipe initscripts-1.0-r0: task do_fetch: Started
NOTE: recipe initscripts-1.0-r0: task do_fetch: Succeeded
NOTE: Running task 1023 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_fetch)
NOTE: recipe update-rc.d-0.8+git-r0: task do_fetch: Started
NOTE: recipe libxkbcommon-1.10.0-r0: task do_fetch: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_fetch: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_fetch: Succeeded
NOTE: Running task 1024 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_34.2.bb:do_fetch)
NOTE: Running task 1025 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.76.bb:do_fetch)
NOTE: Running task 1027 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_fetch)
NOTE: recipe util-macros-1_1.20.2-r0: task do_fetch: Succeeded
NOTE: Running task 1028 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_unpack)
NOTE: recipe shadow-sysroot-4.6-r0: task do_fetch: Started
NOTE: recipe perl-5.42.0-r0: task do_unpack: Succeeded
NOTE: recipe shadow-sysroot-4.6-r0: task do_fetch: Succeeded
NOTE: recipe libcap-2.76-r0: task do_fetch: Started
NOTE: Running task 1029 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.42.0.bb:do_patch)
NOTE: Running task 1030 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.44.bb:do_unpack)
NOTE: recipe kmod-34.2-r0: task do_fetch: Started
NOTE: recipe libcap-2.76-r0: task do_fetch: Succeeded
NOTE: recipe util-macros-1_1.20.2-r0: task do_unpack: Started
NOTE: Running task 1031 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_unpack)
NOTE: recipe kmod-34.2-r0: task do_fetch: Succeeded
NOTE: Running task 1039 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_fetch)
NOTE: recipe util-macros-1_1.20.2-r0: task do_unpack: Succeeded
NOTE: Running task 1040 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_patch)
NOTE: recipe perl-5.42.0-r0: task do_patch: Started
NOTE: recipe xkeyboard-config-2.44-r0: task do_unpack: Started
NOTE: recipe libxcb-1.17.0-r0: task do_unpack: Started
NOTE: recipe gmp-6.3.0-r0: task do_fetch: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_patch: Started
NOTE: recipe gmp-6.3.0-r0: task do_fetch: Succeeded
NOTE: Running task 1048 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.10.0.bb:do_unpack)
NOTE: recipe libxkbcommon-1.10.0-r0: task do_unpack: Started
NOTE: recipe xkeyboard-config-2.44-r0: task do_unpack: Succeeded
NOTE: Running task 1049 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.44.bb:do_patch)
NOTE: recipe libxcb-1.17.0-r0: task do_unpack: Succeeded
NOTE: Running task 1050 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_patch)
NOTE: recipe util-macros-1_1.20.2-r0: task do_patch: Succeeded
NOTE: Running task 1052 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_unpack)
NOTE: recipe xkeyboard-config-2.44-r0: task do_patch: Started
NOTE: recipe shadow-4.18.0-r0: task do_unpack: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_patch: Started
NOTE: Running task 1053 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_patch)
NOTE: recipe xkeyboard-config-2.44-r0: task do_patch: Succeeded
NOTE: Running task 1054 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_unpack)
NOTE: recipe shared-mime-info-2.4-r0: task do_unpack: Started
NOTE: recipe shadow-4.18.0-r0: task do_patch: Started
NOTE: recipe libxcb-1.17.0-r0: task do_patch: Succeeded
NOTE: Running task 1055 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_unpack)
NOTE: recipe zstd-1.5.7-r0: task do_unpack: Started
NOTE: recipe initscripts-1.0-r0: task do_unpack: Started
NOTE: recipe shadow-4.18.0-r0: task do_patch: Succeeded
NOTE: Running task 1056 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_34.2.bb:do_unpack)
NOTE: recipe update-rc.d-0.8+git-r0: task do_fetch: Succeeded
NOTE: Running task 1057 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_unpack)
NOTE: recipe docbook-xml-dtd4-native-4.5-r0: task do_fetch: Succeeded
NOTE: Running task 1058 of 2118 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/docbook-xml/docbook-xml-dtd4_4.5.bb:do_unpack)
NOTE: recipe update-rc.d-0.8+git-r0: task do_unpack: Started
NOTE: recipe libxkbcommon-1.10.0-r0: task do_unpack: Succeeded
NOTE: recipe kmod-34.2-r0: task do_unpack: Started
NOTE: Running task 1059 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.76.bb:do_unpack)
NOTE: recipe initscripts-1.0-r0: task do_unpack: Succeeded
NOTE: recipe perl-5.42.0-r0: task do_patch: Succeeded
NOTE: Running task 1060 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.10.0.bb:do_patch)
NOTE: Running task 1061 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.42.0.bb:do_deploy_source_date_epoch)
NOTE: recipe xcb-proto-1.17.0-r0: task do_fetch: Succeeded
NOTE: Running task 1062 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_unpack)
NOTE: recipe docbook-xml-dtd4-native-4.5-r0: task do_unpack: Started
NOTE: recipe libcap-2.76-r0: task do_unpack: Started
NOTE: recipe libxkbcommon-1.10.0-r0: task do_patch: Started
NOTE: recipe perl-5.42.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe cmake-native-4.1.0-r0: task do_unpack: Succeeded
NOTE: Running task 1063 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/cmake/cmake-native_4.1.0.bb:do_patch)
NOTE: recipe kmod-34.2-r0: task do_unpack: Succeeded
NOTE: Running task 1064 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_patch)
NOTE: recipe xcb-proto-1.17.0-r0: task do_unpack: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_fetch: Succeeded
NOTE: Running task 1065 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_unpack)
NOTE: recipe cmake-native-4.1.0-r0: task do_patch: Started
NOTE: recipe libcap-2.76-r0: task do_unpack: Succeeded
NOTE: Running task 1066 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_34.2.bb:do_patch)
NOTE: recipe docbook-xml-dtd4-native-4.5-r0: task do_unpack: Succeeded
NOTE: recipe libxkbcommon-1.10.0-r0: task do_patch: Succeeded
NOTE: Running task 1067 of 2118 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/docbook-xml/docbook-xml-dtd4_4.5.bb:do_patch)
NOTE: Running task 1068 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.76.bb:do_patch)
NOTE: recipe zstd-1.5.7-r0: task do_unpack: Succeeded
NOTE: Running task 1069 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_patch)
NOTE: recipe initscripts-1.0-r0: task do_patch: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_unpack: Succeeded
NOTE: Running task 1070 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_patch)
NOTE: recipe libpthread-stubs-0.5-r0: task do_unpack: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_unpack: Succeeded
NOTE: Running task 1071 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_patch)
NOTE: recipe libcap-2.76-r0: task do_patch: Started
NOTE: recipe kmod-34.2-r0: task do_patch: Started
NOTE: recipe zstd-1.5.7-r0: task do_patch: Started
NOTE: recipe perl-5.42.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe docbook-xml-dtd4-native-4.5-r0: task do_patch: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.42.0.bb:do_deploy_source_date_epoch unihash changed to 36b21b4e161a4dac1b21dd44f28eaa7bb8abfc98acabd533da0eab30941e27ad
NOTE: recipe shared-mime-info-2.4-r0: task do_patch: Started
NOTE: recipe cmake-native-4.1.0-r0: task do_patch: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_patch: Succeeded
NOTE: recipe libcap-2.76-r0: task do_patch: Succeeded
NOTE: recipe kmod-34.2-r0: task do_patch: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_unpack: Succeeded
NOTE: recipe update-rc.d-0.8+git-r0: task do_unpack: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_patch: Started
NOTE: Setscene tasks completed
NOTE: Running task 1073 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_patch)
NOTE: Running task 1074 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_patch)
NOTE: Running task 1075 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_unpack)
NOTE: Running task 1080 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.3.bb:do_fetch)
NOTE: Running task 1081 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_fetch)
NOTE: Running task 1085 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd_257.8.bb:do_fetch)
NOTE: Running task 1093 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gawk/gawk_5.3.2.bb:do_fetch)
NOTE: recipe zstd-1.5.7-r0: task do_patch: Succeeded
NOTE: recipe docbook-xml-dtd4-native-4.5-r0: task do_patch: Succeeded
NOTE: Running task 1097 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.44.bb:do_write_config)
NOTE: Running task 1099 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.45.bb:do_write_config)
NOTE: recipe shadow-sysroot-4.6-r0: task do_unpack: Started
NOTE: recipe update-rc.d-0.8+git-r0: task do_patch: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_patch: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_unpack: Succeeded
NOTE: recipe mpfr-4.2.2-r0: task do_fetch: Started
NOTE: recipe readline-8.3-r0: task do_fetch: Started
NOTE: Running task 1100 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_patch)
NOTE: recipe gawk-5.3.2-r0: task do_fetch: Started
NOTE: recipe mpfr-4.2.2-r0: task do_fetch: Succeeded
NOTE: Running task 1101 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_unpack)
NOTE: recipe wayland-protocols-1.45-r0: task do_write_config: Started
NOTE: recipe xkeyboard-config-2.44-r0: task do_write_config: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_patch: Succeeded
NOTE: recipe systemd-1_257.8-r0: task do_fetch: Started
NOTE: Running task 1103 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_unpack)
NOTE: recipe xcb-proto-1.17.0-r0: task do_patch: Succeeded
NOTE: recipe shadow-sysroot-4.6-r0: task do_patch: Started
NOTE: Running task 1121 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_fetch)
NOTE: recipe xkeyboard-config-2.44-r0: task do_write_config: Succeeded
NOTE: recipe update-rc.d-0.8+git-r0: task do_patch: Succeeded
NOTE: recipe wayland-protocols-1.45-r0: task do_write_config: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_patch: Succeeded
NOTE: Running task 1139 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.10.0.bb:do_write_config)
NOTE: Running task 1140 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_write_config)
NOTE: Running task 1142 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe gmp-6.3.0-r0: task do_unpack: Started
NOTE: Running task 1143 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe mpfr-4.2.2-r0: task do_unpack: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_fetch: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_patch: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1145 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_34.2.bb:do_write_config)
NOTE: recipe libxkbcommon-1.10.0-r0: task do_write_config: Started
NOTE: recipe update-rc.d-0.8+git-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_write_config: Started
NOTE: recipe initscripts-1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe update-rc.d-0.8+git-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1146 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_configure)
NOTE: Running task 1147 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_configure)
NOTE: recipe systemd-1_257.8-r0: task do_fetch: Succeeded
NOTE: Running task 1148 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd_257.8.bb:do_unpack)
NOTE: recipe libxkbcommon-1.10.0-r0: task do_write_config: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_write_config: Succeeded
NOTE: Running task 1149 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 1151 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/procps/procps_4.0.5.bb:do_fetch)
NOTE: recipe kmod-34.2-r0: task do_write_config: Started
NOTE: recipe mpfr-4.2.2-r0: task do_unpack: Succeeded
NOTE: recipe update-rc.d-0.8+git-r0: task do_configure: Started
NOTE: recipe initscripts-1.0-r0: task do_configure: Started
NOTE: Running task 1152 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_patch)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_fetch: Succeeded
NOTE: Running task 1153 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_unpack)
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot: Started
NOTE: recipe kmod-34.2-r0: task do_write_config: Succeeded
NOTE: recipe procps-4.0.5-r0: task do_fetch: Started
NOTE: Running task 1155 of 2118 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_fetch)
NOTE: recipe systemd-1_257.8-r0: task do_unpack: Started
NOTE: recipe update-rc.d-0.8+git-r0: task do_configure: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_configure: Succeeded
NOTE: Running task 1156 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_compile)
NOTE: Running task 1157 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_compile)
NOTE: recipe mpfr-4.2.2-r0: task do_patch: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_unpack: Started
NOTE: recipe mpfr-4.2.2-r0: task do_patch: Succeeded
NOTE: Running task 1159 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd_257.8.bb:do_warn_musl)
NOTE: recipe opkg-utils-native-0.7.0-r0: task do_fetch: Started
NOTE: recipe update-rc.d-0.8+git-r0: task do_compile: Started
NOTE: recipe initscripts-1.0-r0: task do_compile: Started
NOTE: recipe update-rc.d-0.8+git-r0: task do_compile: Succeeded
NOTE: Running task 1160 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_install)
NOTE: recipe procps-4.0.5-r0: task do_fetch: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_compile: Succeeded
NOTE: Running task 1161 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_install)
NOTE: Running task 1162 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd_257.8.bb:do_write_config)
NOTE: recipe systemd-1_257.8-r0: task do_warn_musl: Started
NOTE: recipe systemd-1_257.8-r0: task do_warn_musl: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_unpack: Succeeded
NOTE: recipe opkg-utils-native-0.7.0-r0: task do_fetch: Succeeded
NOTE: recipe update-rc.d-0.8+git-r0: task do_install: Started
NOTE: Running task 1163 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_patch)
NOTE: recipe xmlto-native-0.0.29-r0: task do_fetch: Succeeded
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_unpack: Succeeded
NOTE: recipe perl-native-5.42.0-r0: task do_patch: Failed
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 43a5eed45be5f03da4b85c3553d0f54d484743ea1bf86e066be2f808a536e5e1
NOTE: recipe initscripts-1.0-r0: task do_install: Started
NOTE: recipe gmp-6.3.0-r0: task do_patch: Started
NOTE: recipe systemd-1_257.8-r0: task do_write_config: Started
NOTE: recipe update-rc.d-0.8+git-r0: task do_install: Succeeded
NOTE: recipe systemd-1_257.8-r0: task do_write_config: Succeeded
NOTE: recipe readline-8.3-r0: task do_fetch: Succeeded
NOTE: recipe systemd-1_257.8-r0: task do_unpack: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_patch: Succeeded
NOTE: recipe gawk-5.3.2-r0: task do_fetch: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_install: Succeeded
NOTE: recipe linux-libc-headers-6.16-r0: task do_unpack: Succeeded
NOTE: recipe rpm-native-1_4.20.1-r0: task do_fetch: Succeeded
NOTE: recipe docbook-xsl-stylesheets-native-1.79.1-r0: task do_fetch: Succeeded
NOTE: Tasks Summary: Attempted 1163 tasks of which 872 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250815084421.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250815084421.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.42.0.bb:do_patch
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/perl-native/5.42.0/temp/log.do_patch.3191294
Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: perl-native-5.42.0-r0 do_patch: Applying patch 'perl-configpm-switch.patch' on target directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/perl-native/5.42.0/sources/perl-5.42.0'
CmdError('quilt --quiltrc /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/perl-native/5.42.0/recipe-sysroot-native/etc/quiltrc push', 0, 'stdout: Patch perl-configpm-switch.patch is already applied; check your series file

stderr: ')
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/perl-native/5.42.0/temp/log.do_patch.3191294
ERROR: Task (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.42.0.bb:do_patch) failed with exit code '1'

--===============2315881836393093244==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-perl-upgrade-5.40.2-5.42.0.patch"

RnJvbSA2MDIyOWQ2YTBlOGM3NmZjOWY0NzEwZTI4NTBmYzM5NDk0MWY5NDNiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMTUgQXVnIDIwMjUgMDg6NDU6MDAgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
ZXJsOiB1cGdyYWRlIDUuNDAuMiAtPiA1LjQyLjAKCi0tLQogLi4udWxlLWJyZWFrcy10aHJvdWdo
LXRoZS1wZXJsLXdyYXBwZXItLnBhdGNoIHwgIDggKystLQogLi4uTWFrZWZpbGUuUEwtRml4LV9Q
QVRIX0xPRy1mb3ItZGV0ZXJtLnBhdGNoIHwgIDIgKy0KIC4uLi9maWxlcy8wMDAyLUNvbnN0YW50
LUZpeC11cC1zaGViYW5nLnBhdGNoICB8ICAyICstCiAuLi4vcGVybC9maWxlcy9kZXRlcm1pbmlz
bS5wYXRjaCAgICAgICAgICAgICAgfCAgMiArLQogLi4uL3BlcmwvZmlsZXMvZW5jb2RlZml4LnBh
dGNoICAgICAgICAgICAgICAgIHwgIDIgKy0KIC4uLi9wZXJsL2ZpbGVzL2Vycm5vX3Zlci5kaWZm
ICAgICAgICAgICAgICAgICB8ICAyICstCiAuLi4vcGVybC9maWxlcy9uYXRpdmUtcGVybGluYy5w
YXRjaCAgICAgICAgICAgfCAgNiArLS0KIC4uLi9wZXJsL2ZpbGVzL3BlcmwtY29uZmlncG0tc3dp
dGNoLnBhdGNoICAgICB8ICA0ICstCiAuLi4vcGVybC9maWxlcy9wZXJsLWR5bmxvYWRlci5wYXRj
aCAgICAgICAgICAgfCAgMiArLQogbWV0YS9yZWNpcGVzLWRldnRvb2xzL3BlcmwvcGVybC1wdGVz
dC5pbmMgICAgIHwgMTIgKysrKy0KIC4uLi9wZXJsL3twZXJsXzUuNDAuMi5iYiA9PiBwZXJsXzUu
NDIuMC5iYn0gICB8IDQ2ICsrKysrKysrKysrKysrKysrKy0KIDExIGZpbGVzIGNoYW5nZWQsIDcw
IGluc2VydGlvbnMoKyksIDE4IGRlbGV0aW9ucygtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0
b29scy9wZXJsL3twZXJsXzUuNDAuMi5iYiA9PiBwZXJsXzUuNDIuMC5iYn0gKDkyJSkKCmRpZmYg
LS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcGVybC9maWxlcy8wMDAxLVNvbWVob3ctdGhp
cy1tb2R1bGUtYnJlYWtzLXRocm91Z2gtdGhlLXBlcmwtd3JhcHBlci0ucGF0Y2ggYi9tZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvcGVybC9maWxlcy8wMDAxLVNvbWVob3ctdGhpcy1tb2R1bGUtYnJlYWtz
LXRocm91Z2gtdGhlLXBlcmwtd3JhcHBlci0ucGF0Y2gKaW5kZXggMjA3NmM2MWVlMC4uMGYwZWE4
YzhlZSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3BlcmwvZmlsZXMvMDAwMS1T
b21laG93LXRoaXMtbW9kdWxlLWJyZWFrcy10aHJvdWdoLXRoZS1wZXJsLXdyYXBwZXItLnBhdGNo
CisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9wZXJsL2ZpbGVzLzAwMDEtU29tZWhvdy10aGlz
LW1vZHVsZS1icmVha3MtdGhyb3VnaC10aGUtcGVybC13cmFwcGVyLS5wYXRjaApAQCAtMSw0ICsx
LDQgQEAKLUZyb20gNDdjZDIyY2QyMTNkMmM1ZjI4ZTY3NGIxMmMyNjRkYzczMTY4MjU2MCBNb24g
U2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gZDEyNjIxNTFhMTZiZTA2YzNmNjM1MzE4NmZmNmQ4
YjVjYWM1Y2RiZSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEFsZXhhbmRlciBLYW5h
dmluIDxhbGV4LmthbmF2aW5AZ21haWwuY29tPgogRGF0ZTogVHVlLCA1IEp1biAyMDE4IDE0OjU4
OjQyICswMzAwCiBTdWJqZWN0OiBbUEFUQ0hdIFNvbWVob3cgdGhpcyBtb2R1bGUgYnJlYWtzIHRo
cm91Z2ggdGhlIHBlcmwgd3JhcHBlciBhbmQKQEAgLTExLDEwICsxMSwxMCBAQCBTaWduZWQtb2Zm
LWJ5OiBBbGV4YW5kZXIgS2FuYXZpbiA8YWxleC5rYW5hdmluQGdtYWlsLmNvbT4KICAxIGZpbGUg
Y2hhbmdlZCwgNCBpbnNlcnRpb25zKCspCiAKIGRpZmYgLS1naXQgYS9jcGFuL0V4dFV0aWxzLU1h
a2VNYWtlci9saWIvRXh0VXRpbHMvTU1fVW5peC5wbSBiL2NwYW4vRXh0VXRpbHMtTWFrZU1ha2Vy
L2xpYi9FeHRVdGlscy9NTV9Vbml4LnBtCi1pbmRleCBmZTM4NTk4Li4wODI4ZjUyIDEwMDY0NAor
aW5kZXggNTcwZmU1Mi4uNDZmYWQxNSAxMDA2NDQKIC0tLSBhL2NwYW4vRXh0VXRpbHMtTWFrZU1h
a2VyL2xpYi9FeHRVdGlscy9NTV9Vbml4LnBtCiArKysgYi9jcGFuL0V4dFV0aWxzLU1ha2VNYWtl
ci9saWIvRXh0VXRpbHMvTU1fVW5peC5wbQotQEAgLTExNjEsNiArMTE2MSw5IEBAIFdBUk5JTkcK
K0BAIC0xMTg4LDYgKzExODgsOSBAQCBXQVJOSU5HCiAgICAgIH0KICAKICAgICAgZm9yZWFjaCBt
eSAkbmFtZSAoQCRuYW1lcyl7CkBAIC0yNCw3ICsyNCw3IEBAIGluZGV4IGZlMzg1OTguLjA4Mjhm
NTIgMTAwNjQ0CiAgICAgICAgICBteSAoJGFicywgJHVzZV9kaXIpOwogICAgICAgICAgaWYgKCRz
ZWxmLT5maWxlX25hbWVfaXNfYWJzb2x1dGUoJG5hbWUpKSB7ICAgICAjIC9mb28vYmFyCiAgICAg
ICAgICAgICAgJGFicyA9ICRuYW1lOwotQEAgLTIwOTcsNiArMjEwMCw3IEBAIHN1YiBpbml0X1BF
UkwgeworQEAgLTIxMjAsNiArMjEyMyw3IEBAIHN1YiBpbml0X1BFUkwgewogIAogICAgICAkc2Vs
Zi0+e1BFUkx9IHx8PQogICAgICAgICAgJHNlbGYtPmZpbmRfcGVybCg1LjAsIFxAcGVybHMsIFxA
ZGVmcGF0aCwgJFZlcmJvc2UgKTsKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9w
ZXJsL2ZpbGVzLzAwMDEtY3Bhbi1TeXMtU3lzbG9nLU1ha2VmaWxlLlBMLUZpeC1fUEFUSF9MT0ct
Zm9yLWRldGVybS5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9wZXJsL2ZpbGVzLzAwMDEt
Y3Bhbi1TeXMtU3lzbG9nLU1ha2VmaWxlLlBMLUZpeC1fUEFUSF9MT0ctZm9yLWRldGVybS5wYXRj
aAppbmRleCA3ZTVkMDhkOGRiLi44NjYyOGE0NzJhIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcGVybC9maWxlcy8wMDAxLWNwYW4tU3lzLVN5c2xvZy1NYWtlZmlsZS5QTC1GaXgt
X1BBVEhfTE9HLWZvci1kZXRlcm0ucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3Bl
cmwvZmlsZXMvMDAwMS1jcGFuLVN5cy1TeXNsb2ctTWFrZWZpbGUuUEwtRml4LV9QQVRIX0xPRy1m
b3ItZGV0ZXJtLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSAzMjI5NzIzODRlMDc5NWJlMzM5
MjUyZjdjZjlhMzE4ZGM3NTliNTFlIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSAwYzVi
YmNlNTRkMGJkN2YzM2FhMzUxYWQ3NTdhMmI1MjYxYWM3MWUwIE1vbiBTZXAgMTcgMDA6MDA6MDAg
MjAwMQogRnJvbTogUm9iZXJ0IFlhbmcgPGxpZXpoaS55YW5nQHdpbmRyaXZlci5jb20+CiBEYXRl
OiBGcmksIDE4IEZlYiAyMDIyIDA5OjQ0OjI2ICswMDAwCiBTdWJqZWN0OiBbUEFUQ0hdIGNwYW4v
U3lzLVN5c2xvZy9NYWtlZmlsZS5QTDogRml4IF9QQVRIX0xPRyBmb3IgZGV0ZXJtaW5pc3RpYwpk
aWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3BlcmwvZmlsZXMvMDAwMi1Db25zdGFu
dC1GaXgtdXAtc2hlYmFuZy5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9wZXJsL2ZpbGVz
LzAwMDItQ29uc3RhbnQtRml4LXVwLXNoZWJhbmcucGF0Y2gKaW5kZXggODA5ODZlNjZkYS4uMTdh
NjljNGFiNyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3BlcmwvZmlsZXMvMDAw
Mi1Db25zdGFudC1GaXgtdXAtc2hlYmFuZy5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcGVybC9maWxlcy8wMDAyLUNvbnN0YW50LUZpeC11cC1zaGViYW5nLnBhdGNoCkBAIC0xLDQg
KzEsNCBAQAotRnJvbSBhMDIzNTViZGM4Y2RlMTExNWRhZjEwMTY3NWNkZmI3MDdkMzM3YmYxIE1v
biBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBmYmRlYzdlOTgwNmQ1NGU3MmUxMjI5YWMxZDVi
OTU3ZjNmMDMzMzRmIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogSm9zaHVhIFdhdHQg
PEpQRVdoYWNrZXJAZ21haWwuY29tPgogRGF0ZTogTW9uLCAxNyBKdW4gMjAxOSAxMDo0NzoyMyAt
MDUwMAogU3ViamVjdDogW1BBVENIXSBDb25zdGFudDogRml4IHVwIHNoZWJhbmcKZGlmZiAtLWdp
dCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9wZXJsL2ZpbGVzL2RldGVybWluaXNtLnBhdGNoIGIv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3BlcmwvZmlsZXMvZGV0ZXJtaW5pc20ucGF0Y2gKaW5kZXgg
YmRiOWE5MjhiYi4uNTc1YjRjM2EwMCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L3BlcmwvZmlsZXMvZGV0ZXJtaW5pc20ucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L3BlcmwvZmlsZXMvZGV0ZXJtaW5pc20ucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDVjNGZk
NTdkYWYxMjUzNTcyNjJhYTc5NjA1N2Q3YmU4ZTc4ZDM3OGUgTW9uIFNlcCAxNyAwMDowMDowMCAy
MDAxCitGcm9tIDkwNmQxMTc5NjUwNDFjOWI0MGNmOTc3MzY0NjI3NmNlM2MxNGQ2YjggTW9uIFNl
cCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBSaWNoYXJkIFB1cmRpZSA8cmljaGFyZC5wdXJkaWVA
bGludXhmb3VuZGF0aW9uLm9yZz4KIERhdGU6IFdlZCwgNSBGZWIgMjAyMCAyMzo1NDowMiArMDAw
MAogU3ViamVjdDogW1BBVENIXSBGaXhlcyB0byBtYWtlIHRoZSBwZXJsIGJ1aWxkIHJlcHJvZHVj
aWJsZToKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9wZXJsL2ZpbGVzL2VuY29k
ZWZpeC5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9wZXJsL2ZpbGVzL2VuY29kZWZpeC5w
YXRjaAppbmRleCA2NjU2OTlkMTJkLi4yNDk5OGE0NjViIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvcGVybC9maWxlcy9lbmNvZGVmaXgucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3BlcmwvZmlsZXMvZW5jb2RlZml4LnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJv
bSBhNGUyMmM3ZjJhNTE5ZjI0YmM4YWE4OWM2Njc3MDE3YzBmZTEzNjc5IE1vbiBTZXAgMTcgMDA6
MDA6MDAgMjAwMQorRnJvbSAxYzg4NTQwOTg5YzlmZWE2NDdjNzI5YjAwZDQ5OTA4NGVjZTg3ZTQz
IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogUmljaGFyZCBQdXJkaWUgPHJpY2hhcmQu
cHVyZGllQGxpbnV4Zm91bmRhdGlvbi5vcmc+CiBEYXRlOiBUdWUsIDE4IEZlYiAyMDIwIDE3OjI3
OjI2ICswMDAwCiBTdWJqZWN0OiBbUEFUQ0hdIHBlcmw6IEZpeCBlbmNvZGUgbW9kdWxlIHJlcHJv
ZHVjaWJpbGl0eSBpc3N1ZXMKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9wZXJs
L2ZpbGVzL2Vycm5vX3Zlci5kaWZmIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3BlcmwvZmlsZXMv
ZXJybm9fdmVyLmRpZmYKaW5kZXggNDc3NjQyZjQ1Ny4uY2JjZjQ0MWJhOSAxMDA2NDQKLS0tIGEv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3BlcmwvZmlsZXMvZXJybm9fdmVyLmRpZmYKKysrIGIvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3BlcmwvZmlsZXMvZXJybm9fdmVyLmRpZmYKQEAgLTEsNCArMSw0
IEBACi1Gcm9tIDljNDA0ZDRiMWMzNjA3ZTgyN2ZiNTZiNWFlNGY4ZmJiZGI1MmNkMGIgTW9uIFNl
cCAxNyAwMDowMDowMCAyMDAxCitGcm9tIGUwNTBkYmI3YjAyM2Q1ZDFhMzExMDVkZjFhNGIyZWQ4
MmU4NzRhMGMgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBCcmVuZGFuIE8nRGVhIDxi
b2RAZGViaWFuLm9yZz4KIERhdGU6IEZyaSwgMTYgRGVjIDIwMDUgMDE6MzI6MTQgKzExMDAKIFN1
YmplY3Q6IFtQQVRDSF0gUmVtb3ZlIEVycm5vIHZlcnNpb24gY2hlY2sgZHVlIHRvIHVwZ3JhZGUg
cHJvYmxlbXMgd2l0aApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3BlcmwvZmls
ZXMvbmF0aXZlLXBlcmxpbmMucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcGVybC9maWxl
cy9uYXRpdmUtcGVybGluYy5wYXRjaAppbmRleCA3ZTNlNWY2NjUyLi41OTI4MTg0ZWNiIDEwMDY0
NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcGVybC9maWxlcy9uYXRpdmUtcGVybGluYy5w
YXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcGVybC9maWxlcy9uYXRpdmUtcGVybGlu
Yy5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gOWZlYzYyYjE5YTQ5ZDE0NTFmZDExMjBjNWRj
MzhiYWY1OWY3Mzg1NiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gZTQ1ZjNlYjk2MjNl
ZmYyMWQwMzc2ZWE2ZDA4NzJlZmYzMWM4OTkwMiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZy
b206IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4LmthbmF2aW5AZ21haWwuY29tPgogRGF0ZTogV2Vk
LCAzMCBNYXkgMjAwNyAwOTozMzozMiArMDAwMAogU3ViamVjdDogW1BBVENIXSBwZXJsOiBzeW5j
IHdpdGggT0UKQEAgLTEwLDEwICsxMCwxMCBAQCBTaWduZWQtb2ZmLWJ5OiBBbGV4YW5kZXIgS2Fu
YXZpbiA8YWxleC5rYW5hdmluQGdtYWlsLmNvbT4KICAxIGZpbGUgY2hhbmdlZCwgMTMgaW5zZXJ0
aW9ucygrKQogCiBkaWZmIC0tZ2l0IGEvY3Bhbi9FeHRVdGlscy1NYWtlTWFrZXIvbGliL0V4dFV0
aWxzL01NX1VuaXgucG0gYi9jcGFuL0V4dFV0aWxzLU1ha2VNYWtlci9saWIvRXh0VXRpbHMvTU1f
VW5peC5wbQotaW5kZXggMDgyOGY1Mi4uYjhhYmZmNCAxMDA2NDQKK2luZGV4IDQ2ZmFkMTUuLmU1
NDMxNzggMTAwNjQ0CiAtLS0gYS9jcGFuL0V4dFV0aWxzLU1ha2VNYWtlci9saWIvRXh0VXRpbHMv
TU1fVW5peC5wbQogKysrIGIvY3Bhbi9FeHRVdGlscy1NYWtlTWFrZXIvbGliL0V4dFV0aWxzL01N
X1VuaXgucG0KLUBAIC0xODYyLDYgKzE4NjIsMTkgQEAgZnJvbSB0aGUgcGVybCBzb3VyY2UgdHJl
ZS4KK0BAIC0xODkyLDYgKzE4OTIsMTkgQEAgZnJvbSB0aGUgcGVybCBzb3VyY2UgdHJlZS4KICAJ
JHNlbGYtPntQRVJMX0xJQn0gICAgIHx8PSAkQ29uZmlne3ByaXZsaWJleHB9OwogIAkkc2VsZi0+
e1BFUkxfQVJDSExJQn0gfHw9ICRDb25maWd7YXJjaGxpYmV4cH07CiAgCSRzZWxmLT57UEVSTF9J
TkN9ICAgICA9ICRzZWxmLT5jYXRkaXIoIiRzZWxmLT57UEVSTF9BUkNITElCfSIsIkNPUkUiKTsg
IyB3aWxkIGd1ZXNzIGZvciBub3cKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9w
ZXJsL2ZpbGVzL3BlcmwtY29uZmlncG0tc3dpdGNoLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3BlcmwvZmlsZXMvcGVybC1jb25maWdwbS1zd2l0Y2gucGF0Y2gKaW5kZXggMzcyMTI3Nzkz
My4uN2MyYTRiMGE3NiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3BlcmwvZmls
ZXMvcGVybC1jb25maWdwbS1zd2l0Y2gucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L3BlcmwvZmlsZXMvcGVybC1jb25maWdwbS1zd2l0Y2gucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1G
cm9tIDdhNDg1MzhhN2U4NjE0YTMzNDIxNTFiNjQ2ZDIxMDVjMGNiMGNkZDkgTW9uIFNlcCAxNyAw
MDowMDowMCAyMDAxCitGcm9tIDdmYjZlYTI2YmE2MGQ4ZDM0NmNkNTdmYmQ4Zjk4Yjk2ZjVhMWEw
MGMgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBBbGV4YW5kZXIgS2FuYXZpbiA8YWxl
eC5rYW5hdmluQGdtYWlsLmNvbT4KIERhdGU6IFN1biwgMjcgTWF5IDIwMDcgMjE6MDQ6MTEgKzAw
MDAKIFN1YmplY3Q6IFtQQVRDSF0gcGVybDogNS44LjcgLT4gNS44LjggKGZyb20gT0UpCkBAIC0x
OSw3ICsxOSw3IEBAIFNpZ25lZC1vZmYtYnk6IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4LmthbmF2
aW5AZ21haWwuY29tPgogIDEgZmlsZSBjaGFuZ2VkLCAxNiBpbnNlcnRpb25zKCspLCAyIGRlbGV0
aW9ucygtKQogCiBkaWZmIC0tZ2l0IGEvY29uZmlncG0gYi9jb25maWdwbQotaW5kZXggMDcyMTlk
OC4uMDFhMjNmYSAxMDA3NTUKK2luZGV4IDBjNDZiOWUuLjFkYWViZWYgMTAwNzU1CiAtLS0gYS9j
b25maWdwbQogKysrIGIvY29uZmlncG0KIEBAIC03MTgsNyArNzE4LDcgQEAgJGNvbmZpZ190eHQg
Lj0gdW5jb21tZW50IDw8J0VORE9GRU5EJzsKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0
b29scy9wZXJsL2ZpbGVzL3BlcmwtZHlubG9hZGVyLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3BlcmwvZmlsZXMvcGVybC1keW5sb2FkZXIucGF0Y2gKaW5kZXggNTQ3MjYwMmQzYS4uN2Mx
YzMxNTBlNyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3BlcmwvZmlsZXMvcGVy
bC1keW5sb2FkZXIucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3BlcmwvZmlsZXMv
cGVybC1keW5sb2FkZXIucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDI1YTI2YzUyYzMyMGU2
OTliMzdhN2FkMWY0ZjA0NWJjOGFhNGNiMDAgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9t
IDhkMmNmZTMyODQzZTNkMjU0ODU2YzJlOWFjY2EzOGM4NmVjYjJjY2MgTW9uIFNlcCAxNyAwMDow
MDowMCAyMDAxCiBGcm9tOiBSaWNoYXJkIFB1cmRpZSA8cmljaGFyZEBvcGVuZWRoYW5kLmNvbT4K
IERhdGU6IFN1biwgMjcgTWF5IDIwMDcgMjE6MDQ6MTEgKzAwMDAKIFN1YmplY3Q6IFtQQVRDSF0g
cGVybDogNS44LjcgLT4gNS44LjggKGZyb20gT0UpCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcGVybC9wZXJsLXB0ZXN0LmluYyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9wZXJs
L3BlcmwtcHRlc3QuaW5jCmluZGV4IDRiNDc1NjExOGMuLjA4MzBmZjViMmEgMTAwNjQ0Ci0tLSBh
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9wZXJsL3BlcmwtcHRlc3QuaW5jCisrKyBiL21ldGEvcmVj
aXBlcy1kZXZ0b29scy9wZXJsL3BlcmwtcHRlc3QuaW5jCkBAIC0xLDYgKzEsMTYgQEAKIGluaGVy
aXQgcHRlc3QKIAotU1JDX1VSSSArPSAiZmlsZTovL3J1bi1wdGVzdCBcCitTUkNfVVJJID0gImh0
dHBzOi8vd3d3LmNwYW4ub3JnL3NyYy81LjAvcGVybC0ke1BWfS50YXIuZ3o7bmFtZT1wZXJsIFwK
KyAgICAgICAgICAgZmlsZTovL3BlcmwtcmRlcGVuZHMudHh0IFwKKyAgICAgICAgICAgZmlsZTov
LzAwMDEtU29tZWhvdy10aGlzLW1vZHVsZS1icmVha3MtdGhyb3VnaC10aGUtcGVybC13cmFwcGVy
LS5wYXRjaCBcCisgICAgICAgICAgIGZpbGU6Ly9lcnJub192ZXIuZGlmZiBcCisgICAgICAgICAg
IGZpbGU6Ly9uYXRpdmUtcGVybGluYy5wYXRjaCBcCisgICAgICAgICAgIGZpbGU6Ly9wZXJsLWR5
bmxvYWRlci5wYXRjaCBcCisgICAgICAgICAgIGZpbGU6Ly8wMDAyLUNvbnN0YW50LUZpeC11cC1z
aGViYW5nLnBhdGNoIFwKKyAgICAgICAgICAgZmlsZTovL2RldGVybWluaXNtLnBhdGNoIFwKKyAg
ICAgICAgICAgZmlsZTovLzAwMDEtY3Bhbi1TeXMtU3lzbG9nLU1ha2VmaWxlLlBMLUZpeC1fUEFU
SF9MT0ctZm9yLWRldGVybS5wYXRjaCBcCisgICAgICAgICAgIGZpbGU6Ly9ydW4tcHRlc3QgXAor
ICAgICAgICAgICBmaWxlOi8vcGVybC1jb25maWdwbS1zd2l0Y2gucGF0Y2ggXAogICAgICAgICAg
ICAiCiAKIERFQlVHX1BSRUZJWF9NQVBfUkVHRVggPSAiJHtAJ1xcfCcuam9pbihkLmdldFZhcign
REVCVUdfUFJFRklYX01BUCcpLnNwbGl0KCkpfSIKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9wZXJsL3BlcmxfNS40MC4yLmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3Blcmwv
cGVybF81LjQyLjAuYmIKc2ltaWxhcml0eSBpbmRleCA5MiUKcmVuYW1lIGZyb20gbWV0YS9yZWNp
cGVzLWRldnRvb2xzL3BlcmwvcGVybF81LjQwLjIuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1k
ZXZ0b29scy9wZXJsL3BlcmxfNS40Mi4wLmJiCmluZGV4IDFkZjE0NjdkNDIuLjY4NjdmMjYyMTUg
MTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9wZXJsL3BlcmxfNS40MC4yLmJiCisr
KyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9wZXJsL3BlcmxfNS40Mi4wLmJiCkBAIC0xLDkgKzEs
NTEgQEAKKyMgRklYTUU6IHRoZSBMSUNfRklMRVNfQ0hLU1VNIHZhbHVlcyBoYXZlIGJlZW4gdXBk
YXRlZCBieSAnZGV2dG9vbCB1cGdyYWRlJy4KKyMgVGhlIGZvbGxvd2luZyBpcyB0aGUgZGlmZmVy
ZW5jZSBiZXR3ZWVuIHRoZSBvbGQgYW5kIHRoZSBuZXcgbGljZW5zZSB0ZXh0LgorIyBQbGVhc2Ug
dXBkYXRlIHRoZSBMSUNFTlNFIHZhbHVlIGlmIG5lZWRlZCwgYW5kIHN1bW1hcml6ZSB0aGUgY2hh
bmdlcyBpbgorIyB0aGUgY29tbWl0IG1lc3NhZ2UgdmlhICdMaWNlbnNlLVVwZGF0ZTonIHRhZy4K
KyMgKGV4YW1wbGU6ICdMaWNlbnNlLVVwZGF0ZTogY29weXJpZ2h0IHllYXJzIHVwZGF0ZWQuJykK
KyMKKyMgVGhlIGNoYW5nZXM6CisjCisjIC0tLSBDb3B5aW5nCisjICsrKyBDb3B5aW5nCisjIEBA
IC0zLDcgKzMsNyBAQAorIyAgICAgICAgICAgICAgICAgICAgICAgVmVyc2lvbiAxLCBGZWJydWFy
eSAxOTg5CisjICAKKyMgICBDb3B5cmlnaHQgKEMpIDE5ODkgRnJlZSBTb2Z0d2FyZSBGb3VuZGF0
aW9uLCBJbmMuCisjIC0gICAgICAgICAgICAgICAgICAgIDUxIEZyYW5rbGluIFN0LCBGaWZ0aCBG
bG9vciwgQm9zdG9uLCBNQSAgMDIxMTAtMTMwMSAgVVNBCisjICsgICAgICAgICAgICAgICA8aHR0
cHM6Ly9mc2Yub3JnLz4KKyMgIAorIyAgIEV2ZXJ5b25lIGlzIHBlcm1pdHRlZCB0byBjb3B5IGFu
ZCBkaXN0cmlidXRlIHZlcmJhdGltIGNvcGllcworIyAgIG9mIHRoaXMgbGljZW5zZSBkb2N1bWVu
dCwgYnV0IGNoYW5naW5nIGl0IGlzIG5vdCBhbGxvd2VkLgorIyBAQCAtMjE3LDggKzIxNyw3IEBA
CisjICAgICAgR05VIEdlbmVyYWwgUHVibGljIExpY2Vuc2UgZm9yIG1vcmUgZGV0YWlscy4KKyMg
IAorIyAgICAgIFlvdSBzaG91bGQgaGF2ZSByZWNlaXZlZCBhIGNvcHkgb2YgdGhlIEdOVSBHZW5l
cmFsIFB1YmxpYyBMaWNlbnNlCisjIC0gICAgYWxvbmcgd2l0aCB0aGlzIHByb2dyYW07IGlmIG5v
dCwgd3JpdGUgdG8gdGhlIEZyZWUgU29mdHdhcmUKKyMgLSAgICBGb3VuZGF0aW9uLCBJbmMuLCA1
MSBGcmFua2xpbiBTdHJlZXQsIEZpZnRoIEZsb29yLCBCb3N0b24gTUEgIDAyMTEwLTEzMDEgVVNB
CisjICsgICAgYWxvbmcgd2l0aCB0aGlzIHByb2dyYW07IGlmIG5vdCwgc2VlIDxodHRwczovL3d3
dy5nbnUub3JnL2xpY2Vuc2VzLz4uCisjICAKKyMgIAorIyAgQWxzbyBhZGQgaW5mb3JtYXRpb24g
b24gaG93IHRvIGNvbnRhY3QgeW91IGJ5IGVsZWN0cm9uaWMgYW5kIHBhcGVyIG1haWwuCisjIEBA
IC0yNDUsNyArMjQ0LDcgQEAKKyMgICAgcHJvZ3JhbSBgR25vbW92aXNpb24nIChhIHByb2dyYW0g
dG8gZGlyZWN0IGNvbXBpbGVycyB0byBtYWtlIHBhc3NlcworIyAgICBhdCBhc3NlbWJsZXJzKSB3
cml0dGVuIGJ5IEphbWVzIEhhY2tlci4KKyMgIAorIyAtICA8c2lnbmF0dXJlIG9mIFR5IENvb24+
LCAxIEFwcmlsIDE5ODkKKyMgLSAgVHkgQ29vbiwgUHJlc2lkZW50IG9mIFZpY2UKKyMgKyAgPHNp
Z25hdHVyZSBvZiBNb2UgR2hvdWw+LCAxIEFwcmlsIDE5ODkKKyMgKyAgTW9lIEdob3VsLCBQcmVz
aWRlbnQgb2YgVmljZQorIyAgCisjICBUaGF0J3MgYWxsIHRoZXJlIGlzIHRvIGl0IQorIyAKKyMK
KwogU1VNTUFSWSA9ICJQZXJsIHNjcmlwdGluZyBsYW5ndWFnZSIKIEhPTUVQQUdFID0gImh0dHA6
Ly93d3cucGVybC5vcmcvIgogREVTQ1JJUFRJT04gPSAiUGVybCBpcyBhIGhpZ2hseSBjYXBhYmxl
LCBmZWF0dXJlLXJpY2ggcHJvZ3JhbW1pbmcgbGFuZ3VhZ2UiCiBTRUNUSU9OID0gImRldmVsIgog
TElDRU5TRSA9ICJBcnRpc3RpYy0xLjAgfCBHUEwtMS4wLW9yLWxhdGVyIgotTElDX0ZJTEVTX0NI
S1NVTSA9ICJmaWxlOi8vQ29weWluZzttZDU9NWIxMjJhMzZkMGY2ZGM1NTI3OWEwZWJjNjlmM2M2
MGIgXAorTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vQ29weWluZzttZDU9OGY3ZGQwODczZTU5
NTMwYWJiYjM2NTAzOTcyYWZjZGIgXAogICAgICAgICAgICAgICAgICAgICBmaWxlOi8vQXJ0aXN0
aWM7bWQ1PTcxYTRkNWQ5YWNjMThjMDk1MmE2ZGYyMjE4YmI2OGRhIFwKICAgICAgICAgICAgICAg
ICAgICAgIgogCkBAIC0yNCw3ICs2Niw3IEBAIFNSQ19VUkk6YXBwZW5kOmNsYXNzLXRhcmdldCA9
ICIgXAogICAgICAgICAgICBmaWxlOi8vZW5jb2RlZml4LnBhdGNoIFwKICIKIAotU1JDX1VSSVtw
ZXJsLnNoYTI1NnN1bV0gPSAiMTBkNDY0N2NmYmI1NDNhN2Y5YWUzZTVmNjg1MWVjNDkzMDUyMzJl
YTc2MjFhZWQyNGM3Y2ZiYjBiZWY0YjcwZCIKK1NSQ19VUklbcGVybC5zaGEyNTZzdW1dID0gImUw
OTNlZjE4NGQ3ZjlhMWI5Nzk3ZTI0NjUyOTZmNTU1MTBhZGI2ZGFiODg0MmIwYzNlZDUzMzI5NjYz
MDk2ZGMiCiAKIEIgPSAiJHtXT1JLRElSfS9wZXJsLSR7UFZ9LWJ1aWxkIgogCi0tIAoyLjQ3LjEK
Cg==

--===============2315881836393093244==--

