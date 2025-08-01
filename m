Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E1B6CA0EC6
	for <webhook@archiver.kernel.org>; Fri,  1 Aug 2025 14:08:00 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web11.88635.1754057271639236010
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Aug 2025 07:07:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=RijtizH7;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=F0JRJWKX;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101019865f5e6b5-708d93eb-0ff0-4d5e-8584-7f1260d156eb-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1754057271;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=KMqqqjYzgBmZZyDL7aO9vEgZ6629LqP5jogZGbxMsZ8=;
	b=RijtizH79qY0Uo0T9oOXOid4hzOstiFWazC7RBHvskT49AGqyq1RuxaJyqpIZBVI
	OqfPo0RWcscxmz+ymYYTwZ0ERigcSY1z/7YJkeQ8hCqe4RCHzxdUxCYbScy+3ucdupo
	t7gbDfBzpaA1/k/PDJtg3pSSVGoNcqP9QaU5VAao=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1754057271;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=KMqqqjYzgBmZZyDL7aO9vEgZ6629LqP5jogZGbxMsZ8=;
	b=F0JRJWKXiWRmi3oJ44uvq9HrkFJZgZ2oOjxgf9mNLp9v4bi0eb1HCj5nHIWSRqJZ
	aV3gepHlAWneeIJHTI0Qwp17gQhKORw/dtN4Z2mUAmqGS6y3sDIIXMpCLWL0MXPcj03
	zOBevmHZAZ7qZ5t+B4S5FohpBd714EzT/0MGrcu4=
Content-Type: multipart/mixed; boundary="===============4954271061371799274=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] perl: upgrading to 5.42.0 FAILED
Message-ID: <0101019865f5e6b5-708d93eb-0ff0-4d5e-8584-7f1260d156eb-000000@us-west-2.amazonses.com>
Date: Fri, 1 Aug 2025 14:07:50 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.08.01-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Aug 2025 14:08:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221277

--===============4954271061371799274==
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
From dfeab1a72dc2263342dd39f02fdcf9157da436ff Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 1 Aug 2025 09:13:30 +0000
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
index 2076c61ee0..a179ae6a6a 100644
--- a/meta/recipes-devtools/perl/files/0001-Somehow-this-module-breaks-through-the-perl-wrapper-.patch
+++ b/meta/recipes-devtools/perl/files/0001-Somehow-this-module-breaks-through-the-perl-wrapper-.patch
@@ -1,4 +1,4 @@
-From 47cd22cd213d2c5f28e674b12c264dc731682560 Mon Sep 17 00:00:00 2001
+From a93431de36d1fed86f6a552185e88a221615d13a Mon Sep 17 00:00:00 2001
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
index 7e5d08d8db..d28a45412b 100644
--- a/meta/recipes-devtools/perl/files/0001-cpan-Sys-Syslog-Makefile.PL-Fix-_PATH_LOG-for-determ.patch
+++ b/meta/recipes-devtools/perl/files/0001-cpan-Sys-Syslog-Makefile.PL-Fix-_PATH_LOG-for-determ.patch
@@ -1,4 +1,4 @@
-From 322972384e0795be339252f7cf9a318dc759b51e Mon Sep 17 00:00:00 2001
+From e8540afa13864e2413cface697a14f9b09288f0c Mon Sep 17 00:00:00 2001
 From: Robert Yang <liezhi.yang@windriver.com>
 Date: Fri, 18 Feb 2022 09:44:26 +0000
 Subject: [PATCH] cpan/Sys-Syslog/Makefile.PL: Fix _PATH_LOG for deterministic
diff --git a/meta/recipes-devtools/perl/files/0002-Constant-Fix-up-shebang.patch b/meta/recipes-devtools/perl/files/0002-Constant-Fix-up-shebang.patch
index 80986e66da..e4901a8100 100644
--- a/meta/recipes-devtools/perl/files/0002-Constant-Fix-up-shebang.patch
+++ b/meta/recipes-devtools/perl/files/0002-Constant-Fix-up-shebang.patch
@@ -1,4 +1,4 @@
-From a02355bdc8cde1115daf101675cdfb707d337bf1 Mon Sep 17 00:00:00 2001
+From 0801a14eade9b946159f7e2f066b08d251dec3e4 Mon Sep 17 00:00:00 2001
 From: Joshua Watt <JPEWhacker@gmail.com>
 Date: Mon, 17 Jun 2019 10:47:23 -0500
 Subject: [PATCH] Constant: Fix up shebang
diff --git a/meta/recipes-devtools/perl/files/determinism.patch b/meta/recipes-devtools/perl/files/determinism.patch
index bdb9a928bb..863e98501f 100644
--- a/meta/recipes-devtools/perl/files/determinism.patch
+++ b/meta/recipes-devtools/perl/files/determinism.patch
@@ -1,4 +1,4 @@
-From 5c4fd57daf125357262aa796057d7be8e78d378e Mon Sep 17 00:00:00 2001
+From 4f1796ac7befcf5cab926f1a10b06f886c17fa4b Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Wed, 5 Feb 2020 23:54:02 +0000
 Subject: [PATCH] Fixes to make the perl build reproducible:
diff --git a/meta/recipes-devtools/perl/files/encodefix.patch b/meta/recipes-devtools/perl/files/encodefix.patch
index 665699d12d..a44c76448a 100644
--- a/meta/recipes-devtools/perl/files/encodefix.patch
+++ b/meta/recipes-devtools/perl/files/encodefix.patch
@@ -1,4 +1,4 @@
-From a4e22c7f2a519f24bc8aa89c6677017c0fe13679 Mon Sep 17 00:00:00 2001
+From ed460dbcba78afb0a094bed45ab336baeab47243 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Tue, 18 Feb 2020 17:27:26 +0000
 Subject: [PATCH] perl: Fix encode module reproducibility issues
diff --git a/meta/recipes-devtools/perl/files/errno_ver.diff b/meta/recipes-devtools/perl/files/errno_ver.diff
index 477642f457..ba8b9c5db2 100644
--- a/meta/recipes-devtools/perl/files/errno_ver.diff
+++ b/meta/recipes-devtools/perl/files/errno_ver.diff
@@ -1,4 +1,4 @@
-From 9c404d4b1c3607e827fb56b5ae4f8fbbdb52cd0b Mon Sep 17 00:00:00 2001
+From 03dbf99d3538c44f428adb4df785d80ace4c5a79 Mon Sep 17 00:00:00 2001
 From: Brendan O'Dea <bod@debian.org>
 Date: Fri, 16 Dec 2005 01:32:14 +1100
 Subject: [PATCH] Remove Errno version check due to upgrade problems with
diff --git a/meta/recipes-devtools/perl/files/native-perlinc.patch b/meta/recipes-devtools/perl/files/native-perlinc.patch
index 7e3e5f6652..c5537ff298 100644
--- a/meta/recipes-devtools/perl/files/native-perlinc.patch
+++ b/meta/recipes-devtools/perl/files/native-perlinc.patch
@@ -1,4 +1,4 @@
-From 9fec62b19a49d1451fd1120c5dc38baf59f73856 Mon Sep 17 00:00:00 2001
+From 5c2f7375c79468ea166f5033aa135b7e848ca816 Mon Sep 17 00:00:00 2001
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
index 3721277933..a35ee7164b 100644
--- a/meta/recipes-devtools/perl/files/perl-configpm-switch.patch
+++ b/meta/recipes-devtools/perl/files/perl-configpm-switch.patch
@@ -1,4 +1,4 @@
-From 7a48538a7e8614a3342151b646d2105c0cb0cdd9 Mon Sep 17 00:00:00 2001
+From dd9059a38346b1f7fe7f21f29da72bf0aa285860 Mon Sep 17 00:00:00 2001
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
index 5472602d3a..50403017a6 100644
--- a/meta/recipes-devtools/perl/files/perl-dynloader.patch
+++ b/meta/recipes-devtools/perl/files/perl-dynloader.patch
@@ -1,4 +1,4 @@
-From 25a26c52c320e699b37a7ad1f4f045bc8aa4cb00 Mon Sep 17 00:00:00 2001
+From ad25eed03e8ae74d94d247128e1f9343dbbfc6ee Mon Sep 17 00:00:00 2001
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
index c3bcbf053d..2ed02466ac 100644
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


--===============4954271061371799274==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1935 entries from dependency cache.
Parsing recipes...done.
Parsing of 942 .bb files complete (941 cached, 1 parsed). 1933 targets, 42 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-64 sysroot...done.
Removing 1 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.15.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2.99+snapshot-bbdabe5d0a226205895c3e6e5116b2ccacbc7687"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:bbdabe5d0a226205895c3e6e5116b2ccacbc7687"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 521 Local 195 Mirrors 0 Missed 326 Current 242 (37% match, 57% complete)
Removing 54 stale sstate objects for arch x86_64...done.
Removing 1 stale sstate objects for arch allarch...done.
Removing 22 stale sstate objects for arch core2-64...done.
Removing 62 stale sstate objects for arch qemux86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 335 of 763 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd_257.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 346 of 763 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc-locale_2.41.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 357 of 763 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 378 of 763 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 384 of 763 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 386 of 763 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 388 of 763 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/dpkg/dpkg_1.22.11.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 391 of 763 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 399 of 763 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/procps/procps_4.0.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 409 of 763 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 411 of 763 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/make/make_4.4.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 416 of 763 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 417 of 763 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.84.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 419 of 763 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 429 of 763 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gawk/gawk_5.3.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 441 of 763 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_34.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe glibc-locale-2.41+git-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe psmisc-23.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe mpfr-4.2.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe make-4.4.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe procps-4.0.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe opkg-utils-native-0.7.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe sed-4.9-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gawk-5.3.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe systemd-1_257.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe kmod-34.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe glib-2.0-1_2.84.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe dpkg-native-1.22.11-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 446 of 763 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe glibc-locale-2.41+git-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 452 of 763 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 458 of 763 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.10.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe psmisc-23.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe mpfr-4.2.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 459 of 763 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.42.0.bb:do_recipe_qa_setscene)
NOTE: recipe make-4.4.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 460 of 763 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.76.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe procps-4.0.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 462 of 763 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_recipe_qa_setscene)
NOTE: recipe acl-2.3.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 469 of 763 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe opkg-utils-native-0.7.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 471 of 763 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe sed-4.9-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 474 of 763 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gawk-5.3.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 478 of 763 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 481 of 763 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gawk/gawk_5.3.2.bb:do_recipe_qa_setscene)
NOTE: recipe systemd-1_257.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.84.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe dpkg-native-1.22.11-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe kmod-34.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 484 of 763 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 486 of 763 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.41.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 488 of 763 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 491 of 763 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 492 of 763 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe shared-mime-info-2.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxkbcommon-1.10.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libcap-2.76-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe mpfr-4.2.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe perl-5.42.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shadow-4.18.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe readline-8.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gobject-introspection-1.84.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gawk-5.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-passwd-3.6.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe psmisc-23.7-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 493 of 763 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_80.9.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe wayland-1.24.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libcap-2.76-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxkbcommon-1.10.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 496 of 763 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_recipe_qa_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-linux-2.41-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe mpfr-4.2.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe perl-5.42.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 502 of 763 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 505 of 763 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/make/make_4.4.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 506 of 763 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 507 of 763 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.84.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 511 of 763 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 516 of 763 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.44.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe shadow-4.18.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe readline-8.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gobject-introspection-1.84.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 522 of 763 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 530 of 763 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.45.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 532 of 763 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd_257.6.bb:do_recipe_qa_setscene)
NOTE: recipe gawk-5.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 537 of 763 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe base-passwd-3.6.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe psmisc-23.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 540 of 763 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.10.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 541 of 763 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_34.2.bb:do_recipe_qa_setscene)
NOTE: recipe wayland-1.24.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 542 of 763 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-setuptools-80.9.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-linux-2.41-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 544 of 763 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_recipe_qa_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe make-4.4.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xkeyboard-config-2.44-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe glib-2.0-1_2.84.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpcre2-10.45-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-setuptools-80.9.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpam-1.7.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 545 of 763 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0-initial_2.84.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxkbcommon-1.10.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe kmod-34.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe make-4.4.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 547 of 763 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.3.bb:do_recipe_qa_setscene)
NOTE: recipe acl-2.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 549 of 763 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.76.bb:do_recipe_qa_setscene)
NOTE: recipe shadow-4.18.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 552 of 763 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 554 of 763 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe systemd-1_257.6-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 556 of 763 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_recipe_qa_setscene)
NOTE: recipe xkeyboard-config-2.44-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 557 of 763 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.7.bb:do_recipe_qa_setscene)
NOTE: recipe glib-2.0-1_2.84.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 559 of 763 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_80.9.0.bb:do_recipe_qa_setscene)
NOTE: recipe libpcre2-10.45-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 563 of 763 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 569 of 763 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_recipe_qa_setscene)
NOTE: recipe libpam-1.7.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxkbcommon-1.10.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 570 of 763 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 572 of 763 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe kmod-34.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 573 of 763 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.1.bb:do_recipe_qa_setscene)
NOTE: recipe shadow-4.18.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 575 of 763 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_recipe_qa_setscene)
NOTE: recipe glib-2.0-initial-1_2.84.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 577 of 763 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_recipe_qa_setscene)
NOTE: recipe systemd-1_257.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 578 of 763 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.45.bb:do_recipe_qa_setscene)
NOTE: recipe libcap-2.76-r0: task do_recipe_qa_setscene: Started
NOTE: recipe readline-8.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-passwd-3.6.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-setuptools-80.9.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe glib-2.0-initial-1_2.84.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 579 of 763 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libcap-ng-0.8.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libcap-2.76-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 580 of 763 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 581 of 763 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.14.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe readline-8.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libseccomp-2.6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 582 of 763 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_recipe_qa_setscene)
NOTE: recipe libpcre2-10.45-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 584 of 763 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.41.bb:do_recipe_qa_setscene)
NOTE: recipe libpam-1.7.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gobject-introspection-1.84.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe base-passwd-3.6.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 585 of 763 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.44.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 586 of 763 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_recipe_qa_setscene)
NOTE: recipe python3-setuptools-80.9.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 589 of 763 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bash-completion-2.16.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 590 of 763 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 591 of 763 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxau-1_1.0.12-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 592 of 763 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 594 of 763 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_recipe_qa_setscene)
NOTE: recipe xcb-proto-1.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 595 of 763 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_recipe_qa_setscene)
NOTE: recipe libpcre2-10.45-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpam-1.7.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gobject-introspection-1.84.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 603 of 763 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0-initial_2.84.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 604 of 763 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 605 of 763 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxml2-2.14.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe wayland-1.24.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xkeyboard-config-2.44-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-linux-2.41-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xorgproto-2024.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 629 of 763 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_recipe_qa_setscene)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 630 of 763 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.8.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxml2-2.14.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe glib-2.0-initial-1_2.84.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe wayland-1.24.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 631 of 763 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_recipe_qa_setscene)
NOTE: recipe attr-2.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 634 of 763 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 635 of 763 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc-initial_15.1.bb:do_create_spdx_setscene)
NOTE: recipe util-macros-1_1.20.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.44-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 641 of 763 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 643 of 763 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 644 of 763 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe util-linux-2.41-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 645 of 763 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 648 of 763 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxcrypt/libxcrypt_4.4.38.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bash-completion-2.16.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 649 of 763 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.5.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 650 of 763 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.41.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-3.13.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 654 of 763 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.14.5.bb:do_recipe_qa_setscene)
NOTE: recipe glib-2.0-initial-1_2.84.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 655 of 763 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe attr-2.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 657 of 763 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_recipe_qa_setscene)
NOTE: recipe xz-5.8.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcc-initial-15.1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe sqlite3-3_3.48.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gdbm-1.24-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxcrypt-4.4.38-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-3.13.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe openssl-3.5.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 660 of 763 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_recipe_qa_setscene)
NOTE: recipe libffi-3.5.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-linux-libuuid-2.41-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xorgproto-2024.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 661 of 763 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xz-5.8.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxml2-2.14.5-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 664 of 763 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 668 of 763 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.5.bb:do_recipe_qa_setscene)
NOTE: recipe sqlite3-3_3.48.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 669 of 763 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.8.1.bb:do_recipe_qa_setscene)
NOTE: recipe libgcc-initial-15.1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libedit-20250104-3.1-r1: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 670 of 763 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_recipe_qa_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 671 of 763 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_recipe_qa_setscene)
NOTE: recipe libxcrypt-4.4.38-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gdbm-1.24-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe openssl-3.5.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 673 of 763 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 674 of 763 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libffi-3.5.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 675 of 763 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 677 of 763 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_15.1.bb:do_create_spdx_setscene)
NOTE: recipe util-linux-libuuid-2.41-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 679 of 763 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.5.1.bb:do_recipe_qa_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 681 of 763 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.41.bb:do_recipe_qa_setscene)
NOTE: recipe libxml2-2.14.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 689 of 763 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_15.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 690 of 763 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.41.bb:do_create_spdx_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe expat-2.7.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 693 of 763 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: recipe ncurses-6.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xz-5.8.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.48.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_recipe_qa_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 697 of 763 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_15.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gcc-cross-x86_64-15.1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libffi-3.5.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-libuuid-2.41-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-3.5.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-3.13.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe expat-2.7.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 699 of 763 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl-cross/perlcross_1.6.2.bb:do_create_spdx_setscene)
NOTE: recipe ncurses-6.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 700 of 763 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_recipe_qa_setscene)
NOTE: recipe sqlite3-3_3.48.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xz-5.8.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libedit-20250104-3.1-r1: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtool-cross-2.5.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 701 of 763 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/make/make_4.4.1.bb:do_create_spdx_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 702 of 763 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-runtime-15.1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 705 of 763 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.41.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 706 of 763 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc-initial_15.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 709 of 763 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/meson/meson_1.8.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe util-linux-libuuid-native-2.41-r0: task do_create_spdx_setscene: Started
NOTE: recipe libffi-3.5.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-15.1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 713 of 763 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_recipe_qa_setscene)
NOTE: recipe openssl-3.5.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.41-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcc-15.1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 716 of 763 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.45.bb:do_create_spdx_setscene)
NOTE: Running setscene task 726 of 763 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.15.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 734 of 763 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.14.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-3.13.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 738 of 763 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/json-c/json-c_0.18.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-15.1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 739 of 763 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.41.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 745 of 763 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe perlcross-native-1.6.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcc-initial-15.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-15.1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-linux-libuuid-native-2.41-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 746 of 763 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/cmake/cmake-native_4.0.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe expat-2.7.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 749 of 763 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe binutils-cross-x86_64-2.45-r0: task do_create_spdx_setscene: Started
NOTE: recipe make-native-4.4.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe linux-libc-headers-6.15-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe glibc-2.41+git-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe meson-native-1.8.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe perlcross-native-1.6.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 752 of 763 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.42.0.bb:do_recipe_qa_setscene)
NOTE: recipe cmake-native-4.0.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe json-c-native-0.18-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe curl-native-8.14.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe expat-2.7.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.15-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe glibc-2.41+git-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.45-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe make-native-4.4.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe expat-native-2.7.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe meson-native-1.8.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 755 of 763 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/meson/meson_1.8.2.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-native-2.41-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe openssl-native-3.5.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe cmake-native-4.0.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libgcc-initial-15.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe json-c-native-0.18-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe curl-native-8.14.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 757 of 763 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_15.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 758 of 763 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc-initial_15.1.bb:do_recipe_qa_setscene)
NOTE: recipe expat-native-2.7.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 154 of 2118 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_fetch)
NOTE: recipe perl-native-5.42.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-native-2.41-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 171 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/cmake/cmake-native_4.0.3.bb:do_fetch)
NOTE: recipe openssl-native-3.5.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 206 of 2118 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.1.bb:do_fetch)
NOTE: recipe gcc-cross-x86_64-15.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-initial-15.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe meson-native-1.8.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe perl-native-5.42.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe cmake-native-4.0.3-r0: task do_fetch: Started
NOTE: Running task 325 of 2118 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.42.0.bb:do_fetch)
NOTE: Running task 348 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.15.bb:do_fetch)
NOTE: recipe libgcc-initial-15.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe meson-native-1.8.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe expat-native-2.7.1-r0: task do_fetch: Started
NOTE: Running task 434 of 2118 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.41.bb:do_fetch)
NOTE: Running task 438 of 2118 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/meson/meson_1.8.2.bb:do_fetch)
NOTE: Running task 455 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.41.bb:do_fetch)
NOTE: recipe expat-native-2.7.1-r0: task do_fetch: Succeeded
NOTE: Running task 484 of 2118 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_unpack)
NOTE: recipe openssl-native-3.5.1-r0: task do_fetch: Started
NOTE: Running noexec task 502 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_15.1.bb:do_fetch)
NOTE: Running noexec task 512 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_15.1.bb:do_fetch)
NOTE: Running task 514 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_fetch)
NOTE: Running task 518 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_fetch)
NOTE: recipe linux-libc-headers-6.15-r0: task do_fetch: Started
NOTE: Running task 526 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_fetch)
NOTE: recipe openssl-native-3.5.1-r0: task do_fetch: Succeeded
NOTE: Running task 528 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_fetch)
NOTE: Running task 530 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_fetch)
NOTE: Running task 532 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_fetch)
NOTE: Running task 535 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.1.bb:do_fetch)
NOTE: Running task 536 of 2118 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.1.bb:do_unpack)
NOTE: recipe linux-libc-headers-6.15-r0: task do_fetch: Succeeded
NOTE: Running task 537 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.15.bb:do_unpack)
NOTE: recipe perl-native-5.42.0-r0: task do_fetch: Started
NOTE: recipe perl-native-5.42.0-r0: task do_fetch: Succeeded
NOTE: Running task 538 of 2118 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.42.0.bb:do_unpack)
NOTE: recipe libtool-cross-2.5.4-r0: task do_fetch: Started
NOTE: recipe meson-native-1.8.2-r0: task do_fetch: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_fetch: Started
NOTE: recipe glibc-2.41+git-r0: task do_fetch: Started
NOTE: recipe zlib-1.3.1-r0: task do_fetch: Started
NOTE: recipe meson-native-1.8.2-r0: task do_fetch: Succeeded
NOTE: recipe libtool-cross-2.5.4-r0: task do_fetch: Succeeded
NOTE: recipe expat-2.7.1-r0: task do_fetch: Started
NOTE: recipe util-linux-native-2.41-r0: task do_fetch: Started
NOTE: recipe gdbm-1.24-r0: task do_fetch: Started
NOTE: recipe bzip2-1.0.8-r0: task do_fetch: Started
NOTE: Running task 539 of 2118 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.42.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe expat-native-2.7.1-r0: task do_unpack: Started
NOTE: Running task 540 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.15.bb:do_prepare_recipe_sysroot)
NOTE: recipe zlib-1.3.1-r0: task do_fetch: Succeeded
NOTE: recipe openssl-3.5.1-r0: task do_fetch: Started
NOTE: recipe linux-libc-headers-6.15-r0: task do_unpack: Started
NOTE: Running task 541 of 2118 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/meson/meson_1.8.2.bb:do_unpack)
NOTE: recipe gdbm-1.24-r0: task do_fetch: Succeeded
NOTE: recipe util-linux-native-2.41-r0: task do_fetch: Succeeded
NOTE: Running task 542 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_unpack)
NOTE: recipe openssl-3.5.1-r0: task do_fetch: Succeeded
NOTE: Running task 543 of 2118 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.41.bb:do_unpack)
NOTE: Running task 544 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_unpack)
NOTE: recipe openssl-native-3.5.1-r0: task do_unpack: Started
NOTE: recipe perl-native-5.42.0-r0: task do_unpack: Started
NOTE: recipe linux-libc-headers-6.15-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_unpack: Started
NOTE: recipe expat-2.7.1-r0: task do_fetch: Succeeded
NOTE: Running task 545 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_unpack)
NOTE: recipe expat-native-2.7.1-r0: task do_unpack: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_unpack: Started
NOTE: recipe perl-native-5.42.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 546 of 2118 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_patch)
NOTE: recipe linux-libc-headers-6.15-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe meson-native-1.8.2-r0: task do_unpack: Started
NOTE: Running task 547 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.8.1.bb:do_fetch)
NOTE: recipe opkg-utils-0.7.0-r0: task do_fetch: Succeeded
NOTE: Running task 548 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_unpack)
NOTE: recipe util-linux-native-2.41-r0: task do_unpack: Started
NOTE: recipe bzip2-1.0.8-r0: task do_fetch: Succeeded
NOTE: recipe glibc-2.41+git-r0: task do_fetch: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_unpack: Succeeded
NOTE: Running task 553 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.41.bb:do_unpack)
NOTE: Running task 556 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_unpack)
NOTE: Running task 557 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_patch)
NOTE: recipe expat-2.7.1-r0: task do_unpack: Started
NOTE: recipe xz-5.8.1-r0: task do_fetch: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_unpack: Started
NOTE: recipe perl-native-5.42.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 558 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_unpack)
NOTE: recipe xz-5.8.1-r0: task do_fetch: Succeeded
NOTE: recipe expat-native-2.7.1-r0: task do_patch: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_unpack: Succeeded
NOTE: Running task 559 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.1.bb:do_unpack)
NOTE: Running task 560 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_patch)
NOTE: recipe bzip2-1.0.8-r0: task do_unpack: Started
NOTE: recipe zlib-1.3.1-r0: task do_patch: Started
NOTE: recipe expat-native-2.7.1-r0: task do_patch: Succeeded
NOTE: Running task 562 of 2118 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_generate_toolchain_file)
NOTE: recipe glibc-2.41+git-r0: task do_unpack: Started
NOTE: recipe expat-2.7.1-r0: task do_unpack: Succeeded
NOTE: Running task 563 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_patch)
NOTE: recipe gdbm-1.24-r0: task do_unpack: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_patch: Started
NOTE: recipe openssl-3.5.1-r0: task do_unpack: Started
NOTE: recipe gdbm-1.24-r0: task do_unpack: Succeeded
NOTE: Running task 564 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_patch)
NOTE: recipe expat-native-2.7.1-r0: task do_generate_toolchain_file: Started
NOTE: recipe expat-2.7.1-r0: task do_patch: Started
NOTE: recipe zlib-1.3.1-r0: task do_patch: Succeeded
NOTE: Running task 565 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.8.1.bb:do_unpack)
NOTE: recipe expat-native-2.7.1-r0: task do_generate_toolchain_file: Succeeded
NOTE: Running task 569 of 2118 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.14.1.bb:do_fetch)
NOTE: recipe gdbm-1.24-r0: task do_patch: Started
NOTE: recipe meson-native-1.8.2-r0: task do_unpack: Succeeded
NOTE: Running task 570 of 2118 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/meson/meson_1.8.2.bb:do_patch)
NOTE: recipe expat-2.7.1-r0: task do_patch: Succeeded
NOTE: Running task 585 of 2118 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/json-c/json-c_0.18.bb:do_fetch)
NOTE: recipe xz-5.8.1-r0: task do_unpack: Started
NOTE: recipe curl-native-8.14.1-r0: task do_fetch: Started
NOTE: recipe curl-native-8.14.1-r0: task do_fetch: Succeeded
NOTE: recipe meson-native-1.8.2-r0: task do_patch: Started
NOTE: Running task 586 of 2118 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.14.1.bb:do_unpack)
NOTE: recipe opkg-utils-0.7.0-r0: task do_unpack: Succeeded
NOTE: Running task 587 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_patch)
NOTE: recipe json-c-native-0.18-r0: task do_fetch: Started
NOTE: recipe xz-5.8.1-r0: task do_unpack: Succeeded
NOTE: Running task 588 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.8.1.bb:do_patch)
NOTE: recipe gdbm-1.24-r0: task do_patch: Succeeded
NOTE: recipe util-linux-native-2.41-r0: task do_unpack: Succeeded
NOTE: recipe json-c-native-0.18-r0: task do_fetch: Succeeded
NOTE: Running task 590 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_generate_toolchain_file)
NOTE: Running task 591 of 2118 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.41.bb:do_patch)
NOTE: Running task 611 of 2118 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/json-c/json-c_0.18.bb:do_unpack)
NOTE: recipe opkg-utils-0.7.0-r0: task do_patch: Started
NOTE: recipe curl-native-8.14.1-r0: task do_unpack: Started
NOTE: recipe bzip2-1.0.8-r0: task do_unpack: Succeeded
NOTE: recipe xz-5.8.1-r0: task do_patch: Started
NOTE: Running task 612 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_patch)
NOTE: recipe expat-2.7.1-r0: task do_generate_toolchain_file: Started
NOTE: recipe json-c-native-0.18-r0: task do_unpack: Started
NOTE: recipe expat-2.7.1-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe util-linux-native-2.41-r0: task do_patch: Started
NOTE: Running task 618 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_fetch)
NOTE: recipe meson-native-1.8.2-r0: task do_patch: Succeeded
NOTE: recipe json-c-native-0.18-r0: task do_unpack: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_patch: Started
NOTE: recipe xz-5.8.1-r0: task do_patch: Succeeded
NOTE: Running task 621 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxcrypt/libxcrypt_4.4.38.bb:do_fetch)
NOTE: Running task 622 of 2118 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/json-c/json-c_0.18.bb:do_patch)
NOTE: recipe gcc-cross-x86_64-15.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_patch: Succeeded
NOTE: Running setscene task 759 of 763 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_15.1.bb:do_gcc_stash_builddir_setscene)
NOTE: Running task 676 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.5.1.bb:do_fetch)
NOTE: Running task 681 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_fetch)
NOTE: recipe ncurses-6.5-r0: task do_fetch: Started
NOTE: recipe perl-native-5.42.0-r0: task do_unpack: Succeeded
NOTE: Running task 682 of 2118 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.42.0.bb:do_patch)
NOTE: recipe libxcrypt-4.4.38-r0: task do_fetch: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_patch: Succeeded
NOTE: Running task 684 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.41.bb:do_fetch)
NOTE: recipe gcc-cross-x86_64-15.1.0-r0: task do_gcc_stash_builddir_setscene: Started
NOTE: recipe json-c-native-0.18-r0: task do_patch: Started
NOTE: recipe libffi-3.5.1-r0: task do_fetch: Started
NOTE: recipe sqlite3-3_3.48.0-r0: task do_fetch: Started
NOTE: recipe libffi-3.5.1-r0: task do_fetch: Succeeded
NOTE: recipe sqlite3-3_3.48.0-r0: task do_fetch: Succeeded
NOTE: Running task 689 of 2118 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.42.0.bb:do_collect_spdx_deps)
NOTE: recipe json-c-native-0.18-r0: task do_patch: Succeeded
NOTE: Running task 695 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_fetch)
NOTE: Running task 697 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.5.bb:do_fetch)
NOTE: recipe bzip2-1.0.8-r0: task do_patch: Succeeded
NOTE: recipe util-linux-libuuid-2.41-r0: task do_fetch: Started
NOTE: recipe perl-native-5.42.0-r0: task do_patch: Started
NOTE: Running task 718 of 2118 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/json-c/json-c_0.18.bb:do_generate_toolchain_file)
NOTE: recipe util-linux-libuuid-2.41-r0: task do_fetch: Succeeded
NOTE: Running task 724 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.5.1.bb:do_unpack)
NOTE: recipe ncurses-6.5-r0: task do_fetch: Succeeded
NOTE: recipe curl-native-8.14.1-r0: task do_unpack: Succeeded
NOTE: Running task 725 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_unpack)
NOTE: Running task 726 of 2118 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.14.1.bb:do_patch)
NOTE: recipe libxcrypt-4.4.38-r0: task do_fetch: Succeeded
NOTE: recipe libedit-20250104-3.1-r1: task do_fetch: Started
NOTE: Running task 727 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxcrypt/libxcrypt_4.4.38.bb:do_unpack)
NOTE: recipe libedit-20250104-3.1-r1: task do_fetch: Succeeded
NOTE: recipe perl-native-5.42.0-r0: task do_collect_spdx_deps: Started
NOTE: Running task 733 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.1.bb:do_fetch)
NOTE: recipe python3-3.13.5-r0: task do_fetch: Started
NOTE: recipe perl-native-5.42.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe json-c-native-0.18-r0: task do_generate_toolchain_file: Started
NOTE: recipe libffi-3.5.1-r0: task do_unpack: Started
NOTE: Running task 734 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_unpack)
NOTE: recipe ncurses-6.5-r0: task do_unpack: Started
NOTE: recipe openssl-native-3.5.1-r0: task do_unpack: Succeeded
NOTE: recipe libxcrypt-4.4.38-r0: task do_unpack: Started
NOTE: recipe python3-3.13.5-r0: task do_fetch: Succeeded
NOTE: Running task 735 of 2118 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.1.bb:do_patch)
NOTE: Running task 736 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.41.bb:do_unpack)
NOTE: recipe json-c-native-0.18-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe curl-native-8.14.1-r0: task do_patch: Started
NOTE: Running task 737 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_unpack)
NOTE: recipe libpam-1.7.1-r0: task do_fetch: Started
NOTE: recipe libffi-3.5.1-r0: task do_unpack: Succeeded
NOTE: Running task 738 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.5.1.bb:do_patch)
NOTE: recipe sqlite3-3_3.48.0-r0: task do_unpack: Started
NOTE: recipe libpam-1.7.1-r0: task do_fetch: Succeeded
NOTE: Running task 739 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.5.bb:do_unpack)
NOTE: recipe util-linux-libuuid-2.41-r0: task do_unpack: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_unpack: Started
NOTE: recipe openssl-native-3.5.1-r0: task do_patch: Started
NOTE: recipe libffi-3.5.1-r0: task do_patch: Started
NOTE: recipe curl-native-8.14.1-r0: task do_patch: Succeeded
NOTE: recipe libedit-20250104-3.1-r1: task do_unpack: Succeeded
NOTE: Running task 761 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.1.bb:do_unpack)
NOTE: recipe sqlite3-3_3.48.0-r0: task do_unpack: Succeeded
NOTE: Running task 762 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_patch)
NOTE: Running task 763 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_patch)
NOTE: recipe util-linux-native-2.41-r0: task do_patch: Succeeded
NOTE: Running task 796 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_fetch)
NOTE: recipe python3-3.13.5-r0: task do_unpack: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_patch: Started
NOTE: recipe libpam-1.7.1-r0: task do_unpack: Started
NOTE: recipe sqlite3-3_3.48.0-r0: task do_patch: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_fetch: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_fetch: Succeeded
NOTE: Running task 798 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.1.bb:do_write_config)
NOTE: recipe libffi-3.5.1-r0: task do_patch: Succeeded
NOTE: Running task 802 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_unpack)
NOTE: recipe openssl-native-3.5.1-r0: task do_patch: Succeeded
NOTE: recipe sqlite3-3_3.48.0-r0: task do_patch: Succeeded
NOTE: Running task 805 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.45.bb:do_fetch)
NOTE: Running task 808 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0-initial_2.84.2.bb:do_fetch)
NOTE: recipe libxcrypt-4.4.38-r0: task do_unpack: Succeeded
NOTE: recipe bash-completion-2.16.0-r0: task do_unpack: Started
NOTE: Running task 809 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxcrypt/libxcrypt_4.4.38.bb:do_patch)
NOTE: recipe libedit-20250104-3.1-r1: task do_patch: Succeeded
NOTE: recipe libpam-1.7.1-r0: task do_write_config: Started
NOTE: Running task 814 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.14.5.bb:do_fetch)
NOTE: recipe libpcre2-10.45-r0: task do_fetch: Started
NOTE: recipe glib-2.0-initial-1_2.84.2-r0: task do_fetch: Started
NOTE: recipe libpam-1.7.1-r0: task do_unpack: Succeeded
NOTE: recipe libpcre2-10.45-r0: task do_fetch: Succeeded
NOTE: Running task 815 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.1.bb:do_patch)
NOTE: Running task 816 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.45.bb:do_unpack)
NOTE: recipe libpam-1.7.1-r0: task do_write_config: Succeeded
NOTE: recipe glib-2.0-initial-1_2.84.2-r0: task do_fetch: Succeeded
NOTE: Running task 820 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_fetch)
NOTE: Running task 821 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0-initial_2.84.2.bb:do_unpack)
NOTE: recipe libxcrypt-4.4.38-r0: task do_patch: Started
NOTE: recipe libxml2-2.14.5-r0: task do_fetch: Started
NOTE: recipe libxml2-2.14.5-r0: task do_fetch: Succeeded
NOTE: Running task 823 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.41.bb:do_fetch)
NOTE: recipe libpcre2-10.45-r0: task do_unpack: Started
NOTE: recipe libpam-1.7.1-r0: task do_patch: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_fetch: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_unpack: Succeeded
NOTE: recipe glib-2.0-initial-1_2.84.2-r0: task do_unpack: Started
NOTE: Running task 824 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_patch)
NOTE: recipe util-linux-libuuid-2.41-r0: task do_unpack: Succeeded
NOTE: recipe libxcrypt-4.4.38-r0: task do_patch: Succeeded
NOTE: Running task 826 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.41.bb:do_patch)
NOTE: Running task 830 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_fetch)
NOTE: recipe libpam-1.7.1-r0: task do_patch: Succeeded
NOTE: Running task 832 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.14.5.bb:do_unpack)
NOTE: recipe ncurses-6.5-r0: task do_unpack: Succeeded
NOTE: Running task 833 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_patch)
NOTE: recipe util-linux-2.41-r0: task do_fetch: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_patch: Started
NOTE: recipe util-linux-2.41-r0: task do_fetch: Succeeded
NOTE: recipe util-linux-libuuid-2.41-r0: task do_patch: Started
NOTE: Running task 836 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.41.bb:do_unpack)
NOTE: recipe attr-2.5.2-r0: task do_fetch: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_patch: Succeeded
NOTE: recipe libxml2-2.14.5-r0: task do_unpack: Started
NOTE: recipe attr-2.5.2-r0: task do_fetch: Succeeded
NOTE: Running task 838 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0-initial_2.84.2.bb:do_write_config)
NOTE: recipe ncurses-6.5-r0: task do_patch: Started
NOTE: Running task 841 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_unpack)
NOTE: recipe libcap-ng-0.8.5-r0: task do_fetch: Succeeded
NOTE: Running task 842 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_unpack)
NOTE: recipe util-linux-2.41-r0: task do_unpack: Started
NOTE: recipe glib-2.0-initial-1_2.84.2-r0: task do_write_config: Started
NOTE: recipe attr-2.5.2-r0: task do_unpack: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_unpack: Started
NOTE: recipe libpcre2-10.45-r0: task do_unpack: Succeeded
NOTE: recipe glib-2.0-initial-1_2.84.2-r0: task do_write_config: Succeeded
NOTE: Running task 843 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.45.bb:do_patch)
NOTE: recipe attr-2.5.2-r0: task do_unpack: Succeeded
NOTE: Running task 850 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_patch)
NOTE: Running task 864 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_80.9.0.bb:do_fetch)
NOTE: recipe libpcre2-10.45-r0: task do_patch: Started
NOTE: recipe python3-setuptools-80.9.0-r0: task do_fetch: Started
NOTE: recipe attr-2.5.2-r0: task do_patch: Started
NOTE: recipe python3-setuptools-80.9.0-r0: task do_fetch: Succeeded
NOTE: Running task 866 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_fetch)
NOTE: recipe openssl-3.5.1-r0: task do_unpack: Succeeded
NOTE: recipe glib-2.0-initial-1_2.84.2-r0: task do_unpack: Succeeded
NOTE: Running task 867 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.1.bb:do_patch)
NOTE: Running task 868 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0-initial_2.84.2.bb:do_patch)
NOTE: recipe libpcre2-10.45-r0: task do_patch: Succeeded
NOTE: Running task 872 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_fetch)
NOTE: recipe gobject-introspection-1.84.0-r0: task do_fetch: Started
NOTE: recipe gobject-introspection-1.84.0-r0: task do_fetch: Succeeded
NOTE: Running task 873 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.84.2.bb:do_fetch)
NOTE: recipe glib-2.0-initial-1_2.84.2-r0: task do_patch: Started
NOTE: recipe openssl-3.5.1-r0: task do_patch: Started
NOTE: recipe attr-2.5.2-r0: task do_patch: Succeeded
NOTE: recipe wayland-1.24.0-r0: task do_fetch: Started
NOTE: recipe ncurses-6.5-r0: task do_patch: Succeeded
NOTE: Running task 885 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_80.9.0.bb:do_unpack)
NOTE: Running task 887 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_unpack)
NOTE: recipe wayland-1.24.0-r0: task do_fetch: Succeeded
NOTE: Running task 890 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_fetch)
NOTE: recipe glib-2.0-1_2.84.2-r0: task do_fetch: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_unpack: Succeeded
NOTE: recipe libxml2-2.14.5-r0: task do_unpack: Succeeded
NOTE: Running task 891 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_patch)
NOTE: recipe util-linux-libuuid-2.41-r0: task do_patch: Succeeded
NOTE: recipe glib-2.0-1_2.84.2-r0: task do_fetch: Succeeded
NOTE: Running task 892 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.14.5.bb:do_patch)
NOTE: recipe python3-setuptools-80.9.0-r0: task do_unpack: Started
NOTE: Running task 894 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_fetch)
NOTE: Running task 897 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_unpack)
NOTE: recipe gobject-introspection-1.84.0-r0: task do_unpack: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_fetch: Started
NOTE: recipe util-linux-2.41-r0: task do_unpack: Succeeded
NOTE: recipe python3-setuptools-80.9.0-r0: task do_unpack: Succeeded
NOTE: Running task 898 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.41.bb:do_patch)
NOTE: recipe python3-3.13.5-r0: task do_unpack: Succeeded
NOTE: recipe libcap-ng-0.8.5-r0: task do_patch: Started
NOTE: Running task 899 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_80.9.0.bb:do_patch)
NOTE: Running task 900 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.5.bb:do_patch)
NOTE: recipe acl-2.3.2-r0: task do_fetch: Started
NOTE: recipe libxml2-2.14.5-r0: task do_patch: Started
NOTE: recipe wayland-1.24.0-r0: task do_unpack: Started
NOTE: recipe acl-2.3.2-r0: task do_fetch: Succeeded
NOTE: Running task 901 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.84.2.bb:do_unpack)
NOTE: recipe python3-setuptools-80.9.0-r0: task do_patch: Started
NOTE: recipe openssl-3.5.1-r0: task do_patch: Succeeded
NOTE: recipe util-linux-2.41-r0: task do_patch: Started
NOTE: Running task 905 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_fetch)
NOTE: recipe libseccomp-2.6.0-r0: task do_fetch: Succeeded
NOTE: recipe glibc-2.41+git-r0: task do_unpack: Succeeded
NOTE: Running task 906 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_fetch)
NOTE: Running task 907 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.41.bb:do_patch)
NOTE: recipe python3-3.13.5-r0: task do_patch: Started
NOTE: recipe glib-2.0-1_2.84.2-r0: task do_unpack: Started
NOTE: recipe wayland-1.24.0-r0: task do_unpack: Succeeded
NOTE: Running task 908 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_patch)
NOTE: recipe libcap-ng-0.8.5-r0: task do_patch: Succeeded
NOTE: Running task 912 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_unpack)
NOTE: recipe gobject-introspection-1.84.0-r0: task do_unpack: Succeeded
NOTE: recipe cmake-native-4.0.3-r0: task do_fetch: Succeeded
NOTE: Running task 913 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_patch)
NOTE: Running task 914 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/cmake/cmake-native_4.0.3.bb:do_unpack)
NOTE: recipe util-macros-1_1.20.2-r0: task do_fetch: Started
NOTE: recipe xorgproto-2024.1-r0: task do_fetch: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_fetch: Succeeded
NOTE: Running task 915 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_unpack)
NOTE: recipe xorgproto-2024.1-r0: task do_fetch: Succeeded
NOTE: Running task 916 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_unpack)
NOTE: recipe glibc-2.41+git-r0: task do_patch: Started
NOTE: recipe wayland-1.24.0-r0: task do_patch: Started
NOTE: recipe libxml2-2.14.5-r0: task do_patch: Succeeded
NOTE: recipe cmake-native-4.0.3-r0: task do_unpack: Started
NOTE: recipe python3-setuptools-80.9.0-r0: task do_patch: Succeeded
NOTE: Running task 918 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_unpack)
NOTE: recipe libseccomp-2.6.0-r0: task do_unpack: Started
NOTE: Running task 926 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_write_config)
NOTE: recipe gobject-introspection-1.84.0-r0: task do_patch: Started
NOTE: recipe acl-2.3.2-r0: task do_unpack: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_unpack: Started
NOTE: recipe gobject-introspection-1.84.0-r0: task do_patch: Succeeded
NOTE: Running task 928 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_write_config)
NOTE: recipe util-macros-1_1.20.2-r0: task do_unpack: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_unpack: Started
NOTE: Running task 929 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_patch)
NOTE: recipe glib-2.0-initial-1_2.84.2-r0: task do_patch: Succeeded
NOTE: recipe gobject-introspection-1.84.0-r0: task do_write_config: Started
NOTE: recipe wayland-1.24.0-r0: task do_patch: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_unpack: Succeeded
NOTE: Running task 931 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.84.2.bb:do_write_config)
NOTE: Running task 934 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_patch)
NOTE: Running task 937 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.7.bb:do_fetch)
NOTE: recipe gobject-introspection-1.84.0-r0: task do_write_config: Succeeded
NOTE: recipe gcc-cross-x86_64-15.1.0-r0: task do_gcc_stash_builddir_setscene: Succeeded
NOTE: Running setscene task 760 of 763 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.45.bb:do_populate_sysroot_setscene)
NOTE: recipe wayland-1.24.0-r0: task do_write_config: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_patch: Started
NOTE: Running task 953 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.42.0.bb:do_fetch)
NOTE: recipe base-passwd-3.6.7-r0: task do_fetch: Started
NOTE: recipe glib-2.0-1_2.84.2-r0: task do_write_config: Started
NOTE: recipe base-passwd-3.6.7-r0: task do_fetch: Succeeded
NOTE: recipe wayland-1.24.0-r0: task do_write_config: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_patch: Started
NOTE: recipe xorgproto-2024.1-r0: task do_unpack: Succeeded
NOTE: Running task 954 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.7.bb:do_unpack)
NOTE: Running task 955 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_patch)
NOTE: Running task 956 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_write_config)
NOTE: recipe binutils-cross-x86_64-2.45-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-1_2.84.2-r0: task do_write_config: Succeeded
NOTE: recipe perl-5.42.0-r0: task do_fetch: Started
NOTE: Running task 960 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_fetch)
NOTE: recipe perl-5.42.0-r0: task do_fetch: Succeeded
NOTE: recipe glib-2.0-1_2.84.2-r0: task do_unpack: Succeeded
NOTE: Running task 965 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_fetch)
NOTE: recipe base-passwd-3.6.7-r0: task do_unpack: Started
NOTE: Running task 966 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.84.2.bb:do_patch)
NOTE: recipe xorgproto-2024.1-r0: task do_patch: Started
NOTE: recipe xorgproto-2024.1-r0: task do_write_config: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_patch: Succeeded
NOTE: Running task 968 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_fetch)
NOTE: recipe sed-4.9-r0: task do_fetch: Started
NOTE: recipe xorgproto-2024.1-r0: task do_patch: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_write_config: Succeeded
NOTE: recipe sed-4.9-r0: task do_fetch: Succeeded
NOTE: Running task 970 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_fetch)
NOTE: Running task 971 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_fetch)
NOTE: Running task 973 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.42.0.bb:do_unpack)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_fetch: Started
NOTE: recipe util-linux-2.41-r0: task do_patch: Succeeded
NOTE: Running task 978 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_fetch)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_fetch: Succeeded
NOTE: recipe libseccomp-2.6.0-r0: task do_unpack: Succeeded
NOTE: Running task 982 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.44.bb:do_fetch)
NOTE: recipe glib-2.0-1_2.84.2-r0: task do_patch: Started
NOTE: Running task 983 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_patch)
NOTE: recipe libpthread-stubs-0.5-r0: task do_fetch: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_fetch: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_patch: Succeeded
NOTE: Running task 985 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_fetch)
NOTE: recipe xcb-proto-1.17.0-r0: task do_fetch: Started
NOTE: recipe base-passwd-3.6.7-r0: task do_unpack: Succeeded
NOTE: Running task 991 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_unpack)
NOTE: recipe libxau-1_1.0.12-r0: task do_fetch: Started
NOTE: Running task 992 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.7.bb:do_patch)
NOTE: recipe perl-5.42.0-r0: task do_unpack: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_fetch: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_fetch: Succeeded
NOTE: Running task 993 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_unpack)
NOTE: Running task 994 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_unpack)
NOTE: recipe shadow-4.18.0-r0: task do_fetch: Started
NOTE: recipe xkeyboard-config-2.44-r0: task do_fetch: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_patch: Started
NOTE: recipe shadow-4.18.0-r0: task do_fetch: Succeeded
NOTE: recipe xkeyboard-config-2.44-r0: task do_fetch: Succeeded
NOTE: Running task 995 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_unpack)
NOTE: Running task 996 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_unpack)
NOTE: recipe libxcb-1.17.0-r0: task do_fetch: Started
NOTE: recipe binutils-cross-x86_64-2.45-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe base-passwd-3.6.7-r0: task do_patch: Started
NOTE: recipe libxcb-1.17.0-r0: task do_fetch: Succeeded
NOTE: recipe sed-4.9-r0: task do_unpack: Started
NOTE: Running task 1011 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_unpack)
NOTE: Running task 1028 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.76.bb:do_fetch)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_unpack: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_unpack: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_unpack: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_unpack: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_patch: Succeeded
NOTE: Running task 1030 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_fetch)
NOTE: recipe libcap-2.76-r0: task do_fetch: Started
NOTE: recipe shadow-4.18.0-r0: task do_unpack: Started
NOTE: recipe libcap-2.76-r0: task do_fetch: Succeeded
NOTE: Running task 1031 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_fetch)
NOTE: recipe libpthread-stubs-0.5-r0: task do_unpack: Succeeded
NOTE: Running task 1032 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_patch)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_unpack: Succeeded
NOTE: Running task 1033 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_patch)
NOTE: recipe shared-mime-info-2.4-r0: task do_fetch: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_unpack: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_unpack: Succeeded
NOTE: Running task 1034 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_patch)
NOTE: recipe sed-4.9-r0: task do_unpack: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_fetch: Started
NOTE: Running task 1035 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_patch)
NOTE: Running task 1036 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_patch)
NOTE: recipe libpthread-stubs-0.5-r0: task do_patch: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_patch: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_patch: Succeeded
NOTE: Running task 1037 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_fetch)
NOTE: recipe libxau-1_1.0.12-r0: task do_patch: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_patch: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_patch: Started
NOTE: Running task 1038 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.10.0.bb:do_fetch)
NOTE: recipe sed-4.9-r0: task do_patch: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_patch: Succeeded
NOTE: Running task 1039 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_34.2.bb:do_fetch)
NOTE: recipe shared-mime-info-2.4-r0: task do_fetch: Succeeded
NOTE: recipe sed-4.9-r0: task do_patch: Succeeded
NOTE: Running task 1042 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_fetch)
NOTE: Running task 1043 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.44.bb:do_unpack)
NOTE: recipe initscripts-1.0-r0: task do_fetch: Started
NOTE: recipe zstd-1.5.7-r0: task do_fetch: Succeeded
NOTE: Running task 1045 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_unpack)
NOTE: recipe libxkbcommon-1.10.0-r0: task do_fetch: Started
NOTE: recipe initscripts-1.0-r0: task do_fetch: Succeeded
NOTE: Running task 1053 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_fetch)
NOTE: recipe shadow-sysroot-4.6-r0: task do_fetch: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_fetch: Succeeded
NOTE: recipe glib-2.0-1_2.84.2-r0: task do_patch: Succeeded
NOTE: Running task 1061 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.76.bb:do_unpack)
NOTE: recipe kmod-34.2-r0: task do_fetch: Started
NOTE: Running task 1063 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_unpack)
NOTE: recipe xkeyboard-config-2.44-r0: task do_unpack: Started
NOTE: recipe kmod-34.2-r0: task do_fetch: Succeeded
NOTE: Running task 1064 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_unpack)
NOTE: recipe python3-3.13.5-r0: task do_patch: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_unpack: Started
NOTE: Running task 1066 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_unpack)
NOTE: recipe xcb-proto-1.17.0-r0: task do_patch: Succeeded
NOTE: Running task 1067 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_34.2.bb:do_unpack)
NOTE: recipe base-passwd-3.6.7-r0: task do_patch: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_fetch: Started
NOTE: Running task 1071 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_unpack)
NOTE: recipe libcap-2.76-r0: task do_unpack: Started
NOTE: recipe gmp-6.3.0-r0: task do_fetch: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_unpack: Started
NOTE: Running task 1078 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_fetch)
NOTE: recipe zstd-1.5.7-r0: task do_unpack: Started
NOTE: recipe libxkbcommon-1.10.0-r0: task do_fetch: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_unpack: Started
NOTE: Running task 1079 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.10.0.bb:do_unpack)
NOTE: recipe shadow-sysroot-4.6-r0: task do_unpack: Started
NOTE: recipe kmod-34.2-r0: task do_unpack: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_unpack: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_unpack: Succeeded
NOTE: Running task 1080 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_patch)
NOTE: recipe xkeyboard-config-2.44-r0: task do_unpack: Succeeded
NOTE: Running task 1081 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_patch)
NOTE: Running task 1082 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.44.bb:do_patch)
NOTE: recipe mpfr-4.2.2-r0: task do_fetch: Started
NOTE: recipe libcap-2.76-r0: task do_unpack: Succeeded
NOTE: recipe mpfr-4.2.2-r0: task do_fetch: Succeeded
NOTE: Running task 1083 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.76.bb:do_patch)
NOTE: Running task 1084 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.3.bb:do_fetch)
NOTE: recipe libxkbcommon-1.10.0-r0: task do_unpack: Started
NOTE: recipe glibc-2.41+git-r0: task do_patch: Succeeded
NOTE: Running task 1089 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd_257.6.bb:do_fetch)
NOTE: recipe shadow-sysroot-4.6-r0: task do_patch: Started
NOTE: recipe libxcb-1.17.0-r0: task do_patch: Started
NOTE: recipe xkeyboard-config-2.44-r0: task do_patch: Started
NOTE: recipe libcap-2.76-r0: task do_patch: Started
NOTE: recipe kmod-34.2-r0: task do_unpack: Succeeded
NOTE: recipe readline-8.3-r0: task do_fetch: Started
NOTE: Running task 1090 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_34.2.bb:do_patch)
NOTE: recipe cmake-native-4.0.3-r0: task do_unpack: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_unpack: Succeeded
NOTE: recipe xkeyboard-config-2.44-r0: task do_patch: Succeeded
NOTE: Running task 1091 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/cmake/cmake-native_4.0.3.bb:do_patch)
NOTE: Running task 1092 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_patch)
NOTE: recipe readline-8.3-r0: task do_fetch: Succeeded
NOTE: Running task 1099 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gawk/gawk_5.3.2.bb:do_fetch)
NOTE: Running task 1102 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.44.bb:do_write_config)
NOTE: recipe libcap-2.76-r0: task do_patch: Succeeded
NOTE: recipe shadow-sysroot-4.6-r0: task do_patch: Succeeded
NOTE: Running task 1103 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.45.bb:do_write_config)
NOTE: Running task 1104 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_unpack)
NOTE: recipe perl-5.42.0-r0: task do_unpack: Succeeded
NOTE: Running task 1105 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.42.0.bb:do_patch)
NOTE: recipe systemd-1_257.6-r0: task do_fetch: Started
NOTE: recipe libxcb-1.17.0-r0: task do_patch: Succeeded
NOTE: Running task 1107 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_unpack)
NOTE: recipe cmake-native-4.0.3-r0: task do_patch: Started
NOTE: recipe initscripts-1.0-r0: task do_patch: Started
NOTE: recipe kmod-34.2-r0: task do_patch: Started
NOTE: recipe gawk-5.3.2-r0: task do_fetch: Started
NOTE: recipe xkeyboard-config-2.44-r0: task do_write_config: Started
NOTE: recipe wayland-protocols-1.45-r0: task do_write_config: Started
NOTE: recipe gmp-6.3.0-r0: task do_unpack: Started
NOTE: recipe gawk-5.3.2-r0: task do_fetch: Succeeded
NOTE: recipe perl-5.42.0-r0: task do_patch: Started
NOTE: Running task 1108 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.3.bb:do_unpack)
NOTE: recipe kmod-34.2-r0: task do_patch: Succeeded
NOTE: recipe mpfr-4.2.2-r0: task do_unpack: Started
NOTE: Running task 1116 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gawk/gawk_5.3.2.bb:do_unpack)
NOTE: recipe wayland-protocols-1.45-r0: task do_write_config: Succeeded
NOTE: recipe xkeyboard-config-2.44-r0: task do_write_config: Succeeded
NOTE: Running task 1126 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_fetch)
NOTE: Running task 1142 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_write_config)
NOTE: recipe initscripts-1.0-r0: task do_patch: Succeeded
NOTE: Running task 1144 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe readline-8.3-r0: task do_unpack: Started
NOTE: recipe systemd-1_257.6-r0: task do_fetch: Succeeded
NOTE: recipe cmake-native-4.0.3-r0: task do_patch: Succeeded
NOTE: Running task 1145 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd_257.6.bb:do_unpack)
NOTE: recipe gawk-5.3.2-r0: task do_unpack: Started
NOTE: Running task 1147 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.10.0.bb:do_write_config)
NOTE: recipe shadow-4.18.0-r0: task do_unpack: Succeeded
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_fetch: Started
NOTE: Running task 1148 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_patch)
NOTE: recipe zstd-1.5.7-r0: task do_unpack: Succeeded
NOTE: Running task 1149 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_patch)
NOTE: recipe shared-mime-info-2.4-r0: task do_write_config: Started
NOTE: recipe initscripts-1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mpfr-4.2.2-r0: task do_unpack: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1150 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_patch)
NOTE: recipe readline-8.3-r0: task do_unpack: Succeeded
NOTE: Running task 1151 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_34.2.bb:do_write_config)
NOTE: Running task 1152 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.3.bb:do_patch)
NOTE: recipe libxkbcommon-1.10.0-r0: task do_write_config: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_write_config: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_unpack: Succeeded
NOTE: Running task 1153 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_patch)
NOTE: recipe shadow-4.18.0-r0: task do_patch: Started
NOTE: Running task 1155 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_configure)
NOTE: recipe zstd-1.5.7-r0: task do_patch: Started
NOTE: recipe systemd-1_257.6-r0: task do_unpack: Started
NOTE: recipe libxkbcommon-1.10.0-r0: task do_unpack: Succeeded
NOTE: recipe libxkbcommon-1.10.0-r0: task do_write_config: Succeeded
NOTE: Running task 1156 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.10.0.bb:do_patch)
NOTE: Running task 1160 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: recipe mpfr-4.2.2-r0: task do_patch: Started
NOTE: recipe readline-8.3-r0: task do_patch: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_fetch: Succeeded
NOTE: recipe kmod-34.2-r0: task do_write_config: Started
NOTE: Running task 1162 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/procps/procps_4.0.5.bb:do_fetch)
NOTE: recipe initscripts-1.0-r0: task do_configure: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_patch: Started
NOTE: recipe mpfr-4.2.2-r0: task do_patch: Succeeded
NOTE: Running task 1163 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_unpack)
NOTE: recipe zstd-1.5.7-r0: task do_patch: Succeeded
NOTE: Running task 1166 of 2118 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_fetch)
NOTE: recipe kmod-34.2-r0: task do_write_config: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot: Started
NOTE: Running task 1169 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd_257.6.bb:do_warn_musl)
NOTE: recipe libxkbcommon-1.10.0-r0: task do_patch: Started
NOTE: recipe gawk-5.3.2-r0: task do_unpack: Succeeded
NOTE: Running task 1170 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gawk/gawk_5.3.2.bb:do_patch)
NOTE: recipe initscripts-1.0-r0: task do_configure: Succeeded
NOTE: Running task 1171 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_compile)
NOTE: recipe procps-4.0.5-r0: task do_fetch: Started
NOTE: recipe shadow-4.18.0-r0: task do_patch: Succeeded
NOTE: Running task 1173 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd_257.6.bb:do_write_config)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_unpack: Started
NOTE: recipe opkg-utils-native-0.7.0-r0: task do_fetch: Started
NOTE: recipe readline-8.3-r0: task do_patch: Succeeded
NOTE: recipe libxkbcommon-1.10.0-r0: task do_patch: Succeeded
NOTE: recipe gawk-5.3.2-r0: task do_patch: Started
NOTE: Running task 1180 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_fetch)
NOTE: recipe initscripts-1.0-r0: task do_compile: Started
NOTE: Running task 1181 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/make/make_4.4.1.bb:do_fetch)
NOTE: recipe gmp-6.3.0-r0: task do_unpack: Succeeded
NOTE: Running task 1182 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_patch)
NOTE: recipe systemd-1_257.6-r0: task do_warn_musl: Started
NOTE: recipe systemd-1_257.6-r0: task do_warn_musl: Succeeded
NOTE: Running task 1184 of 2118 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/dpkg/dpkg_1.22.11.bb:do_fetch)
NOTE: recipe initscripts-1.0-r0: task do_compile: Succeeded
NOTE: Running task 1185 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_install)
NOTE: recipe systemd-1_257.6-r0: task do_write_config: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_patch: Succeeded
NOTE: recipe procps-4.0.5-r0: task do_fetch: Succeeded
NOTE: recipe make-4.4.1-r0: task do_fetch: Started
NOTE: recipe psmisc-23.7-r0: task do_fetch: Started
NOTE: recipe gmp-6.3.0-r0: task do_patch: Started
NOTE: recipe make-4.4.1-r0: task do_fetch: Succeeded
NOTE: recipe systemd-1_257.6-r0: task do_write_config: Succeeded
NOTE: recipe opkg-utils-native-0.7.0-r0: task do_fetch: Succeeded
NOTE: recipe dpkg-native-1.22.11-r0: task do_fetch: Started
NOTE: Running task 1187 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/procps/procps_4.0.5.bb:do_unpack)
NOTE: recipe gawk-5.3.2-r0: task do_patch: Succeeded
NOTE: recipe perl-5.42.0-r0: task do_patch: Succeeded
NOTE: recipe psmisc-23.7-r0: task do_fetch: Succeeded
NOTE: recipe dpkg-native-1.22.11-r0: task do_fetch: Succeeded
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_unpack: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_patch: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 43a5eed45be5f03da4b85c3553d0f54d484743ea1bf86e066be2f808a536e5e1
NOTE: recipe initscripts-1.0-r0: task do_install: Started
NOTE: Setscene tasks completed
NOTE: Running task 1189 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.42.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1191 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_patch)
NOTE: Running task 1192 of 2118 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_unpack)
NOTE: Running task 1195 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_unpack)
NOTE: Running task 1196 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/make/make_4.4.1.bb:do_unpack)
NOTE: Running task 1197 of 2118 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/dpkg/dpkg_1.22.11.bb:do_unpack)
NOTE: Running task 1209 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_collect_spdx_deps)
NOTE: Running task 1214 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_collect_spdx_deps)
NOTE: Running task 1216 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.42.0.bb:do_populate_lic)
NOTE: recipe procps-4.0.5-r0: task do_unpack: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_patch: Started
NOTE: recipe perl-5.42.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r0: task do_collect_spdx_deps: Started
NOTE: recipe make-4.4.1-r0: task do_unpack: Started
NOTE: recipe psmisc-23.7-r0: task do_unpack: Started
NOTE: recipe initscripts-1.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe opkg-utils-native-0.7.0-r0: task do_unpack: Started
NOTE: recipe perl-5.42.0-r0: task do_populate_lic: Started
NOTE: recipe base-files-3.0.14-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe dpkg-native-1.22.11-r0: task do_unpack: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_patch: Succeeded
NOTE: recipe make-4.4.1-r0: task do_unpack: Succeeded
NOTE: Running task 1218 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/make/make_4.4.1.bb:do_patch)
NOTE: recipe systemd-1_257.6-r0: task do_unpack: Succeeded
NOTE: Running task 1219 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd_257.6.bb:do_patch)
NOTE: recipe perl-5.42.0-r0: task do_populate_lic: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.42.0.bb:do_populate_lic unihash changed to cd2ca6db9ec58f3e7ceae427e8326d58485914303550e7279877d8a9e4a9fad0
NOTE: recipe make-4.4.1-r0: task do_patch: Started
NOTE: recipe perl-5.42.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.42.0.bb:do_deploy_source_date_epoch unihash changed to 36b21b4e161a4dac1b21dd44f28eaa7bb8abfc98acabd533da0eab30941e27ad
NOTE: recipe systemd-1_257.6-r0: task do_patch: Started
NOTE: Setscene tasks completed
NOTE: recipe opkg-utils-native-0.7.0-r0: task do_unpack: Succeeded
NOTE: Running task 1220 of 2118 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_patch)
NOTE: recipe make-4.4.1-r0: task do_patch: Succeeded
NOTE: recipe procps-4.0.5-r0: task do_unpack: Succeeded
NOTE: Running task 1222 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/procps/procps_4.0.5.bb:do_patch)
NOTE: recipe psmisc-23.7-r0: task do_unpack: Succeeded
NOTE: Running task 1223 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_patch)
NOTE: recipe opkg-utils-native-0.7.0-r0: task do_patch: Started
NOTE: recipe systemd-1_257.6-r0: task do_patch: Succeeded
NOTE: recipe procps-4.0.5-r0: task do_patch: Started
NOTE: recipe psmisc-23.7-r0: task do_patch: Started
NOTE: recipe linux-libc-headers-6.15-r0: task do_unpack: Succeeded
NOTE: Running task 1225 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.15.bb:do_patch)
NOTE: Running task 1226 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.15.bb:do_collect_spdx_deps)
NOTE: recipe opkg-utils-native-0.7.0-r0: task do_patch: Succeeded
NOTE: recipe procps-4.0.5-r0: task do_patch: Succeeded
NOTE: recipe linux-libc-headers-6.15-r0: task do_patch: Started
NOTE: recipe psmisc-23.7-r0: task do_patch: Succeeded
NOTE: recipe linux-libc-headers-6.15-r0: task do_collect_spdx_deps: Started
NOTE: recipe linux-libc-headers-6.15-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe linux-libc-headers-6.15-r0: task do_patch: Succeeded
NOTE: Running noexec task 1231 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.15.bb:do_configure)
NOTE: Running noexec task 1232 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.15.bb:do_compile)
NOTE: Running task 1233 of 2118 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.15.bb:do_install)
NOTE: recipe linux-libc-headers-6.15-r0: task do_install: Started
NOTE: recipe dpkg-native-1.22.11-r0: task do_unpack: Succeeded
NOTE: Running task 1234 of 2118 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/dpkg/dpkg_1.22.11.bb:do_patch)
NOTE: recipe initscripts-1.0-r0: task do_install: Succeeded
NOTE: recipe dpkg-native-1.22.11-r0: task do_patch: Started
NOTE: recipe dpkg-native-1.22.11-r0: task do_patch: Succeeded
NOTE: recipe perl-native-5.42.0-r0: task do_patch: Failed
NOTE: recipe linux-libc-headers-6.15-r0: task do_install: Succeeded
NOTE: Tasks Summary: Attempted 1236 tasks of which 995 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250801091314.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250801091314.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.42.0.bb:do_patch
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/perl-native/5.42.0/temp/log.do_patch.1535358
Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: perl-native-5.42.0-r0 do_patch: Applying patch 'perl-configpm-switch.patch' on target directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/perl-native/5.42.0/sources/perl-5.42.0'
CmdError('quilt --quiltrc /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/perl-native/5.42.0/recipe-sysroot-native/etc/quiltrc push', 0, 'stdout: Patch perl-configpm-switch.patch is already applied; check your series file

stderr: ')
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/perl-native/5.42.0/temp/log.do_patch.1535358
ERROR: Task (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.42.0.bb:do_patch) failed with exit code '1'

--===============4954271061371799274==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-perl-upgrade-5.40.2-5.42.0.patch"

RnJvbSBkZmVhYjFhNzJkYzIyNjMzNDJkZDM5ZjAyZmRjZjkxNTdkYTQzNmZmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMSBBdWcgMjAyNSAwOToxMzozMCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHBl
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
dGhyb3VnaC10aGUtcGVybC13cmFwcGVyLS5wYXRjaAppbmRleCAyMDc2YzYxZWUwLi5hMTc5YWU2
YTZhIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcGVybC9maWxlcy8wMDAxLVNv
bWVob3ctdGhpcy1tb2R1bGUtYnJlYWtzLXRocm91Z2gtdGhlLXBlcmwtd3JhcHBlci0ucGF0Y2gK
KysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3BlcmwvZmlsZXMvMDAwMS1Tb21laG93LXRoaXMt
bW9kdWxlLWJyZWFrcy10aHJvdWdoLXRoZS1wZXJsLXdyYXBwZXItLnBhdGNoCkBAIC0xLDQgKzEs
NCBAQAotRnJvbSA0N2NkMjJjZDIxM2QyYzVmMjhlNjc0YjEyYzI2NGRjNzMxNjgyNTYwIE1vbiBT
ZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBhOTM0MzFkZTM2ZDFmZWQ4NmY2YTU1MjE4NWU4OGEy
MjE2MTVkMTNhIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogQWxleGFuZGVyIEthbmF2
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
CmluZGV4IDdlNWQwOGQ4ZGIuLmQyOGE0NTQxMmIgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9wZXJsL2ZpbGVzLzAwMDEtY3Bhbi1TeXMtU3lzbG9nLU1ha2VmaWxlLlBMLUZpeC1f
UEFUSF9MT0ctZm9yLWRldGVybS5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcGVy
bC9maWxlcy8wMDAxLWNwYW4tU3lzLVN5c2xvZy1NYWtlZmlsZS5QTC1GaXgtX1BBVEhfTE9HLWZv
ci1kZXRlcm0ucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDMyMjk3MjM4NGUwNzk1YmUzMzky
NTJmN2NmOWEzMThkYzc1OWI1MWUgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIGU4NTQw
YWZhMTM4NjRlMjQxM2NmYWNlNjk3YTE0ZjliMDkyODhmMGMgTW9uIFNlcCAxNyAwMDowMDowMCAy
MDAxCiBGcm9tOiBSb2JlcnQgWWFuZyA8bGllemhpLnlhbmdAd2luZHJpdmVyLmNvbT4KIERhdGU6
IEZyaSwgMTggRmViIDIwMjIgMDk6NDQ6MjYgKzAwMDAKIFN1YmplY3Q6IFtQQVRDSF0gY3Bhbi9T
eXMtU3lzbG9nL01ha2VmaWxlLlBMOiBGaXggX1BBVEhfTE9HIGZvciBkZXRlcm1pbmlzdGljCmRp
ZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcGVybC9maWxlcy8wMDAyLUNvbnN0YW50
LUZpeC11cC1zaGViYW5nLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3BlcmwvZmlsZXMv
MDAwMi1Db25zdGFudC1GaXgtdXAtc2hlYmFuZy5wYXRjaAppbmRleCA4MDk4NmU2NmRhLi5lNDkw
MWE4MTAwIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcGVybC9maWxlcy8wMDAy
LUNvbnN0YW50LUZpeC11cC1zaGViYW5nLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29s
cy9wZXJsL2ZpbGVzLzAwMDItQ29uc3RhbnQtRml4LXVwLXNoZWJhbmcucGF0Y2gKQEAgLTEsNCAr
MSw0IEBACi1Gcm9tIGEwMjM1NWJkYzhjZGUxMTE1ZGFmMTAxNjc1Y2RmYjcwN2QzMzdiZjEgTW9u
IFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDA4MDFhMTRlYWRlOWI5NDYxNTlmN2UyZjA2NmIw
OGQyNTFkZWMzZTQgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBKb3NodWEgV2F0dCA8
SlBFV2hhY2tlckBnbWFpbC5jb20+CiBEYXRlOiBNb24sIDE3IEp1biAyMDE5IDEwOjQ3OjIzIC0w
NTAwCiBTdWJqZWN0OiBbUEFUQ0hdIENvbnN0YW50OiBGaXggdXAgc2hlYmFuZwpkaWZmIC0tZ2l0
IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3BlcmwvZmlsZXMvZGV0ZXJtaW5pc20ucGF0Y2ggYi9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcGVybC9maWxlcy9kZXRlcm1pbmlzbS5wYXRjaAppbmRleCBi
ZGI5YTkyOGJiLi44NjNlOTg1MDFmIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
cGVybC9maWxlcy9kZXRlcm1pbmlzbS5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
cGVybC9maWxlcy9kZXRlcm1pbmlzbS5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gNWM0ZmQ1
N2RhZjEyNTM1NzI2MmFhNzk2MDU3ZDdiZThlNzhkMzc4ZSBNb24gU2VwIDE3IDAwOjAwOjAwIDIw
MDEKK0Zyb20gNGYxNzk2YWM3YmVmY2Y1Y2FiOTI2ZjFhMTBiMDZmODg2YzE3ZmE0YiBNb24gU2Vw
IDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IFJpY2hhcmQgUHVyZGllIDxyaWNoYXJkLnB1cmRpZUBs
aW51eGZvdW5kYXRpb24ub3JnPgogRGF0ZTogV2VkLCA1IEZlYiAyMDIwIDIzOjU0OjAyICswMDAw
CiBTdWJqZWN0OiBbUEFUQ0hdIEZpeGVzIHRvIG1ha2UgdGhlIHBlcmwgYnVpbGQgcmVwcm9kdWNp
YmxlOgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3BlcmwvZmlsZXMvZW5jb2Rl
Zml4LnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3BlcmwvZmlsZXMvZW5jb2RlZml4LnBh
dGNoCmluZGV4IDY2NTY5OWQxMmQuLmE0NGM3NjQ0OGEgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBl
cy1kZXZ0b29scy9wZXJsL2ZpbGVzL2VuY29kZWZpeC5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcGVybC9maWxlcy9lbmNvZGVmaXgucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9t
IGE0ZTIyYzdmMmE1MTlmMjRiYzhhYTg5YzY2NzcwMTdjMGZlMTM2NzkgTW9uIFNlcCAxNyAwMDow
MDowMCAyMDAxCitGcm9tIGVkNDYwZGJjYmE3OGFmYjBhMDk0YmVkNDVhYjMzNmJhZWFiNDcyNDMg
TW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBSaWNoYXJkIFB1cmRpZSA8cmljaGFyZC5w
dXJkaWVAbGludXhmb3VuZGF0aW9uLm9yZz4KIERhdGU6IFR1ZSwgMTggRmViIDIwMjAgMTc6Mjc6
MjYgKzAwMDAKIFN1YmplY3Q6IFtQQVRDSF0gcGVybDogRml4IGVuY29kZSBtb2R1bGUgcmVwcm9k
dWNpYmlsaXR5IGlzc3VlcwpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3Blcmwv
ZmlsZXMvZXJybm9fdmVyLmRpZmYgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcGVybC9maWxlcy9l
cnJub192ZXIuZGlmZgppbmRleCA0Nzc2NDJmNDU3Li5iYThiOWM1ZGIyIDEwMDY0NAotLS0gYS9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcGVybC9maWxlcy9lcnJub192ZXIuZGlmZgorKysgYi9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcGVybC9maWxlcy9lcnJub192ZXIuZGlmZgpAQCAtMSw0ICsxLDQg
QEAKLUZyb20gOWM0MDRkNGIxYzM2MDdlODI3ZmI1NmI1YWU0ZjhmYmJkYjUyY2QwYiBNb24gU2Vw
IDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gMDNkYmY5OWQzNTM4YzQ0ZjQyOGFkYjRkZjc4NWQ4MGFj
ZTRjNWE3OSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEJyZW5kYW4gTydEZWEgPGJv
ZEBkZWJpYW4ub3JnPgogRGF0ZTogRnJpLCAxNiBEZWMgMjAwNSAwMTozMjoxNCArMTEwMAogU3Vi
amVjdDogW1BBVENIXSBSZW1vdmUgRXJybm8gdmVyc2lvbiBjaGVjayBkdWUgdG8gdXBncmFkZSBw
cm9ibGVtcyB3aXRoCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcGVybC9maWxl
cy9uYXRpdmUtcGVybGluYy5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9wZXJsL2ZpbGVz
L25hdGl2ZS1wZXJsaW5jLnBhdGNoCmluZGV4IDdlM2U1ZjY2NTIuLmM1NTM3ZmYyOTggMTAwNjQ0
Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9wZXJsL2ZpbGVzL25hdGl2ZS1wZXJsaW5jLnBh
dGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9wZXJsL2ZpbGVzL25hdGl2ZS1wZXJsaW5j
LnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSA5ZmVjNjJiMTlhNDlkMTQ1MWZkMTEyMGM1ZGMz
OGJhZjU5ZjczODU2IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSA1YzJmNzM3NWM3OTQ2
OGVhMTY2ZjUwMzNhYTEzNWI3ZTg0OGNhODE2IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJv
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
Li5hMzVlZTcxNjRiIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcGVybC9maWxl
cy9wZXJsLWNvbmZpZ3BtLXN3aXRjaC5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
cGVybC9maWxlcy9wZXJsLWNvbmZpZ3BtLXN3aXRjaC5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZy
b20gN2E0ODUzOGE3ZTg2MTRhMzM0MjE1MWI2NDZkMjEwNWMwY2IwY2RkOSBNb24gU2VwIDE3IDAw
OjAwOjAwIDIwMDEKK0Zyb20gZGQ5MDU5YTM4MzQ2YjFmN2ZlN2YyMWYyOWRhNzJiZjBhYTI4NTg2
MCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4
LmthbmF2aW5AZ21haWwuY29tPgogRGF0ZTogU3VuLCAyNyBNYXkgMjAwNyAyMTowNDoxMSArMDAw
MAogU3ViamVjdDogW1BBVENIXSBwZXJsOiA1LjguNyAtPiA1LjguOCAoZnJvbSBPRSkKQEAgLTE5
LDcgKzE5LDcgQEAgU2lnbmVkLW9mZi1ieTogQWxleGFuZGVyIEthbmF2aW4gPGFsZXgua2FuYXZp
bkBnbWFpbC5jb20+CiAgMSBmaWxlIGNoYW5nZWQsIDE2IGluc2VydGlvbnMoKyksIDIgZGVsZXRp
b25zKC0pCiAKIGRpZmYgLS1naXQgYS9jb25maWdwbSBiL2NvbmZpZ3BtCi1pbmRleCAwNzIxOWQ4
Li4wMWEyM2ZhIDEwMDc1NQoraW5kZXggMGM0NmI5ZS4uMWRhZWJlZiAxMDA3NTUKIC0tLSBhL2Nv
bmZpZ3BtCiArKysgYi9jb25maWdwbQogQEAgLTcxOCw3ICs3MTgsNyBAQCAkY29uZmlnX3R4dCAu
PSB1bmNvbW1lbnQgPDwnRU5ET0ZFTkQnOwpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3BlcmwvZmlsZXMvcGVybC1keW5sb2FkZXIucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcGVybC9maWxlcy9wZXJsLWR5bmxvYWRlci5wYXRjaAppbmRleCA1NDcyNjAyZDNhLi41MDQw
MzAxN2E2IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcGVybC9maWxlcy9wZXJs
LWR5bmxvYWRlci5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcGVybC9maWxlcy9w
ZXJsLWR5bmxvYWRlci5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gMjVhMjZjNTJjMzIwZTY5
OWIzN2E3YWQxZjRmMDQ1YmM4YWE0Y2IwMCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20g
YWQyNWVlZDAzZThhZTc0ZDk0ZDI0NzEyOGUxZjkzNDNkYmJmYzZlZSBNb24gU2VwIDE3IDAwOjAw
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
dnRvb2xzL3BlcmwvcGVybF81LjQyLjAuYmIKaW5kZXggYzNiY2JmMDUzZC4uMmVkMDI0NjZhYyAx
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

--===============4954271061371799274==--

