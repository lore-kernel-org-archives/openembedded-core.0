Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AB6DE9A05B
	for <webhook@archiver.kernel.org>; Wed, 18 Feb 2026 18:41:47 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1414.1771440096633008302
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Feb 2026 10:41:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=bgCXb6sB;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=f4DhPGRZ;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101019c720eda0d-87cc3a52-7c52-41e2-9239-2992745eff60-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1771440102;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=8QE+GwV008a/tqDKv2NJ0I6imc1SgUkVW/ttYYEkRV0=;
	b=bgCXb6sBxaXD80sg1shR40evyjiaU3Wb3Or32kloEAkeFo9U0rT3q82EyFPEIOM5
	7GDuXZuzJeLvXxGrWwKQbqNp0g5oVVWNkUX+R/Yp90lauD6UDkEYFluQdKYHy6suOq4
	xUvIsTtZ3Z8F0aVbxpbNGMfRb0zR93wqzcuXi8VA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1771440102;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=8QE+GwV008a/tqDKv2NJ0I6imc1SgUkVW/ttYYEkRV0=;
	b=f4DhPGRZZdcivoyeDzdCKa2oKrmhg/K0gt1oWWEhtdGdmYqtCVYXuQQ1rKLRWdRN
	CohEvakerRNBMxr6wa/r8OSQyaO1bG5gajto/mNNdbY8q6BKuU9R+H9SZI2lRgpaokp
	PDV+TyXwpwknDBiuWpf1/lqf5Hhrzwgxq4qmb5X0=
Content-Type: multipart/mixed; boundary="===============2370533023589522591=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] perl: upgrading to 5.42.0 FAILED
Message-ID: <0101019c720eda0d-87cc3a52-7c52-41e2-9239-2992745eff60-000000@us-west-2.amazonses.com>
Date: Wed, 18 Feb 2026 18:41:41 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.02.18-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Feb 2026 18:41:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231352

--===============2370533023589522591==
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
From 599ece102f7168d27fd48b08d1993dc7b80d8dd9 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 18 Feb 2026 13:00:54 +0000
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
index 2076c61ee0..768f605b24 100644
--- a/meta/recipes-devtools/perl/files/0001-Somehow-this-module-breaks-through-the-perl-wrapper-.patch
+++ b/meta/recipes-devtools/perl/files/0001-Somehow-this-module-breaks-through-the-perl-wrapper-.patch
@@ -1,4 +1,4 @@
-From 47cd22cd213d2c5f28e674b12c264dc731682560 Mon Sep 17 00:00:00 2001
+From d7fa8ef284fb5ed5ec89a7377ea6cc93d1d5e070 Mon Sep 17 00:00:00 2001
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
index 7e5d08d8db..6b9abb6ff0 100644
--- a/meta/recipes-devtools/perl/files/0001-cpan-Sys-Syslog-Makefile.PL-Fix-_PATH_LOG-for-determ.patch
+++ b/meta/recipes-devtools/perl/files/0001-cpan-Sys-Syslog-Makefile.PL-Fix-_PATH_LOG-for-determ.patch
@@ -1,4 +1,4 @@
-From 322972384e0795be339252f7cf9a318dc759b51e Mon Sep 17 00:00:00 2001
+From 3e5de9d49dd0dd7aee60916fd5caf6f60a97dc42 Mon Sep 17 00:00:00 2001
 From: Robert Yang <liezhi.yang@windriver.com>
 Date: Fri, 18 Feb 2022 09:44:26 +0000
 Subject: [PATCH] cpan/Sys-Syslog/Makefile.PL: Fix _PATH_LOG for deterministic
diff --git a/meta/recipes-devtools/perl/files/0002-Constant-Fix-up-shebang.patch b/meta/recipes-devtools/perl/files/0002-Constant-Fix-up-shebang.patch
index 80986e66da..0a351f25e9 100644
--- a/meta/recipes-devtools/perl/files/0002-Constant-Fix-up-shebang.patch
+++ b/meta/recipes-devtools/perl/files/0002-Constant-Fix-up-shebang.patch
@@ -1,4 +1,4 @@
-From a02355bdc8cde1115daf101675cdfb707d337bf1 Mon Sep 17 00:00:00 2001
+From a2151a9a839b7c8a0617ca463bb8fe3c9f14ba04 Mon Sep 17 00:00:00 2001
 From: Joshua Watt <JPEWhacker@gmail.com>
 Date: Mon, 17 Jun 2019 10:47:23 -0500
 Subject: [PATCH] Constant: Fix up shebang
diff --git a/meta/recipes-devtools/perl/files/determinism.patch b/meta/recipes-devtools/perl/files/determinism.patch
index bdb9a928bb..4e34f11673 100644
--- a/meta/recipes-devtools/perl/files/determinism.patch
+++ b/meta/recipes-devtools/perl/files/determinism.patch
@@ -1,4 +1,4 @@
-From 5c4fd57daf125357262aa796057d7be8e78d378e Mon Sep 17 00:00:00 2001
+From 5c78201bee485124a39aec827e3aff4624d85326 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Wed, 5 Feb 2020 23:54:02 +0000
 Subject: [PATCH] Fixes to make the perl build reproducible:
diff --git a/meta/recipes-devtools/perl/files/encodefix.patch b/meta/recipes-devtools/perl/files/encodefix.patch
index 665699d12d..7da630f066 100644
--- a/meta/recipes-devtools/perl/files/encodefix.patch
+++ b/meta/recipes-devtools/perl/files/encodefix.patch
@@ -1,4 +1,4 @@
-From a4e22c7f2a519f24bc8aa89c6677017c0fe13679 Mon Sep 17 00:00:00 2001
+From 53d0396945b9e5242d1f7f0a015a323c12b8a605 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Tue, 18 Feb 2020 17:27:26 +0000
 Subject: [PATCH] perl: Fix encode module reproducibility issues
diff --git a/meta/recipes-devtools/perl/files/errno_ver.diff b/meta/recipes-devtools/perl/files/errno_ver.diff
index 477642f457..91254a8721 100644
--- a/meta/recipes-devtools/perl/files/errno_ver.diff
+++ b/meta/recipes-devtools/perl/files/errno_ver.diff
@@ -1,4 +1,4 @@
-From 9c404d4b1c3607e827fb56b5ae4f8fbbdb52cd0b Mon Sep 17 00:00:00 2001
+From c6b35204b06f4d904a3039d061ecd1f11ab16cd6 Mon Sep 17 00:00:00 2001
 From: Brendan O'Dea <bod@debian.org>
 Date: Fri, 16 Dec 2005 01:32:14 +1100
 Subject: [PATCH] Remove Errno version check due to upgrade problems with
diff --git a/meta/recipes-devtools/perl/files/native-perlinc.patch b/meta/recipes-devtools/perl/files/native-perlinc.patch
index 7e3e5f6652..10670d15af 100644
--- a/meta/recipes-devtools/perl/files/native-perlinc.patch
+++ b/meta/recipes-devtools/perl/files/native-perlinc.patch
@@ -1,4 +1,4 @@
-From 9fec62b19a49d1451fd1120c5dc38baf59f73856 Mon Sep 17 00:00:00 2001
+From c6975c92325fa80de9ff087a64fa87b7315cf11d Mon Sep 17 00:00:00 2001
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
index 3721277933..f195281428 100644
--- a/meta/recipes-devtools/perl/files/perl-configpm-switch.patch
+++ b/meta/recipes-devtools/perl/files/perl-configpm-switch.patch
@@ -1,4 +1,4 @@
-From 7a48538a7e8614a3342151b646d2105c0cb0cdd9 Mon Sep 17 00:00:00 2001
+From 627900d2fead64e53d96eb9c475bc607751c9aab Mon Sep 17 00:00:00 2001
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
index 5472602d3a..f7f5f37f6d 100644
--- a/meta/recipes-devtools/perl/files/perl-dynloader.patch
+++ b/meta/recipes-devtools/perl/files/perl-dynloader.patch
@@ -1,4 +1,4 @@
-From 25a26c52c320e699b37a7ad1f4f045bc8aa4cb00 Mon Sep 17 00:00:00 2001
+From 8c7411fe077cf9c061bab868be0351d6ecec2fdd Mon Sep 17 00:00:00 2001
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
index 2225dc202b..a23f5c3581 100644
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


--===============2370533023589522591==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-perl-upgrade-5.40.2-5.42.0.patch"

RnJvbSA1OTllY2UxMDJmNzE2OGQyN2ZkNDhiMDhkMTk5M2RjN2I4MGQ4ZGQ5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTggRmViIDIwMjYgMTM6MDA6NTQgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
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
LXRocm91Z2gtdGhlLXBlcmwtd3JhcHBlci0ucGF0Y2gKaW5kZXggMjA3NmM2MWVlMC4uNzY4ZjYw
NWIyNCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3BlcmwvZmlsZXMvMDAwMS1T
b21laG93LXRoaXMtbW9kdWxlLWJyZWFrcy10aHJvdWdoLXRoZS1wZXJsLXdyYXBwZXItLnBhdGNo
CisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9wZXJsL2ZpbGVzLzAwMDEtU29tZWhvdy10aGlz
LW1vZHVsZS1icmVha3MtdGhyb3VnaC10aGUtcGVybC13cmFwcGVyLS5wYXRjaApAQCAtMSw0ICsx
LDQgQEAKLUZyb20gNDdjZDIyY2QyMTNkMmM1ZjI4ZTY3NGIxMmMyNjRkYzczMTY4MjU2MCBNb24g
U2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gZDdmYThlZjI4NGZiNWVkNWVjODlhNzM3N2VhNmNj
OTNkMWQ1ZTA3MCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEFsZXhhbmRlciBLYW5h
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
aAppbmRleCA3ZTVkMDhkOGRiLi42YjlhYmI2ZmYwIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcGVybC9maWxlcy8wMDAxLWNwYW4tU3lzLVN5c2xvZy1NYWtlZmlsZS5QTC1GaXgt
X1BBVEhfTE9HLWZvci1kZXRlcm0ucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3Bl
cmwvZmlsZXMvMDAwMS1jcGFuLVN5cy1TeXNsb2ctTWFrZWZpbGUuUEwtRml4LV9QQVRIX0xPRy1m
b3ItZGV0ZXJtLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSAzMjI5NzIzODRlMDc5NWJlMzM5
MjUyZjdjZjlhMzE4ZGM3NTliNTFlIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSAzZTVk
ZTlkNDlkZDBkZDdhZWU2MDkxNmZkNWNhZjZmNjBhOTdkYzQyIE1vbiBTZXAgMTcgMDA6MDA6MDAg
MjAwMQogRnJvbTogUm9iZXJ0IFlhbmcgPGxpZXpoaS55YW5nQHdpbmRyaXZlci5jb20+CiBEYXRl
OiBGcmksIDE4IEZlYiAyMDIyIDA5OjQ0OjI2ICswMDAwCiBTdWJqZWN0OiBbUEFUQ0hdIGNwYW4v
U3lzLVN5c2xvZy9NYWtlZmlsZS5QTDogRml4IF9QQVRIX0xPRyBmb3IgZGV0ZXJtaW5pc3RpYwpk
aWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3BlcmwvZmlsZXMvMDAwMi1Db25zdGFu
dC1GaXgtdXAtc2hlYmFuZy5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9wZXJsL2ZpbGVz
LzAwMDItQ29uc3RhbnQtRml4LXVwLXNoZWJhbmcucGF0Y2gKaW5kZXggODA5ODZlNjZkYS4uMGEz
NTFmMjVlOSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3BlcmwvZmlsZXMvMDAw
Mi1Db25zdGFudC1GaXgtdXAtc2hlYmFuZy5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcGVybC9maWxlcy8wMDAyLUNvbnN0YW50LUZpeC11cC1zaGViYW5nLnBhdGNoCkBAIC0xLDQg
KzEsNCBAQAotRnJvbSBhMDIzNTViZGM4Y2RlMTExNWRhZjEwMTY3NWNkZmI3MDdkMzM3YmYxIE1v
biBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBhMjE1MWE5YTgzOWI3YzhhMDYxN2NhNDYzYmI4
ZmUzYzlmMTRiYTA0IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogSm9zaHVhIFdhdHQg
PEpQRVdoYWNrZXJAZ21haWwuY29tPgogRGF0ZTogTW9uLCAxNyBKdW4gMjAxOSAxMDo0NzoyMyAt
MDUwMAogU3ViamVjdDogW1BBVENIXSBDb25zdGFudDogRml4IHVwIHNoZWJhbmcKZGlmZiAtLWdp
dCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9wZXJsL2ZpbGVzL2RldGVybWluaXNtLnBhdGNoIGIv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3BlcmwvZmlsZXMvZGV0ZXJtaW5pc20ucGF0Y2gKaW5kZXgg
YmRiOWE5MjhiYi4uNGUzNGYxMTY3MyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L3BlcmwvZmlsZXMvZGV0ZXJtaW5pc20ucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L3BlcmwvZmlsZXMvZGV0ZXJtaW5pc20ucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDVjNGZk
NTdkYWYxMjUzNTcyNjJhYTc5NjA1N2Q3YmU4ZTc4ZDM3OGUgTW9uIFNlcCAxNyAwMDowMDowMCAy
MDAxCitGcm9tIDVjNzgyMDFiZWU0ODUxMjRhMzlhZWM4MjdlM2FmZjQ2MjRkODUzMjYgTW9uIFNl
cCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBSaWNoYXJkIFB1cmRpZSA8cmljaGFyZC5wdXJkaWVA
bGludXhmb3VuZGF0aW9uLm9yZz4KIERhdGU6IFdlZCwgNSBGZWIgMjAyMCAyMzo1NDowMiArMDAw
MAogU3ViamVjdDogW1BBVENIXSBGaXhlcyB0byBtYWtlIHRoZSBwZXJsIGJ1aWxkIHJlcHJvZHVj
aWJsZToKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9wZXJsL2ZpbGVzL2VuY29k
ZWZpeC5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9wZXJsL2ZpbGVzL2VuY29kZWZpeC5w
YXRjaAppbmRleCA2NjU2OTlkMTJkLi43ZGE2MzBmMDY2IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvcGVybC9maWxlcy9lbmNvZGVmaXgucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3BlcmwvZmlsZXMvZW5jb2RlZml4LnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJv
bSBhNGUyMmM3ZjJhNTE5ZjI0YmM4YWE4OWM2Njc3MDE3YzBmZTEzNjc5IE1vbiBTZXAgMTcgMDA6
MDA6MDAgMjAwMQorRnJvbSA1M2QwMzk2OTQ1YjllNTI0MmQxZjdmMGEwMTVhMzIzYzEyYjhhNjA1
IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogUmljaGFyZCBQdXJkaWUgPHJpY2hhcmQu
cHVyZGllQGxpbnV4Zm91bmRhdGlvbi5vcmc+CiBEYXRlOiBUdWUsIDE4IEZlYiAyMDIwIDE3OjI3
OjI2ICswMDAwCiBTdWJqZWN0OiBbUEFUQ0hdIHBlcmw6IEZpeCBlbmNvZGUgbW9kdWxlIHJlcHJv
ZHVjaWJpbGl0eSBpc3N1ZXMKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9wZXJs
L2ZpbGVzL2Vycm5vX3Zlci5kaWZmIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3BlcmwvZmlsZXMv
ZXJybm9fdmVyLmRpZmYKaW5kZXggNDc3NjQyZjQ1Ny4uOTEyNTRhODcyMSAxMDA2NDQKLS0tIGEv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3BlcmwvZmlsZXMvZXJybm9fdmVyLmRpZmYKKysrIGIvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3BlcmwvZmlsZXMvZXJybm9fdmVyLmRpZmYKQEAgLTEsNCArMSw0
IEBACi1Gcm9tIDljNDA0ZDRiMWMzNjA3ZTgyN2ZiNTZiNWFlNGY4ZmJiZGI1MmNkMGIgTW9uIFNl
cCAxNyAwMDowMDowMCAyMDAxCitGcm9tIGM2YjM1MjA0YjA2ZjRkOTA0YTMwMzlkMDYxZWNkMWYx
MWFiMTZjZDYgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBCcmVuZGFuIE8nRGVhIDxi
b2RAZGViaWFuLm9yZz4KIERhdGU6IEZyaSwgMTYgRGVjIDIwMDUgMDE6MzI6MTQgKzExMDAKIFN1
YmplY3Q6IFtQQVRDSF0gUmVtb3ZlIEVycm5vIHZlcnNpb24gY2hlY2sgZHVlIHRvIHVwZ3JhZGUg
cHJvYmxlbXMgd2l0aApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3BlcmwvZmls
ZXMvbmF0aXZlLXBlcmxpbmMucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcGVybC9maWxl
cy9uYXRpdmUtcGVybGluYy5wYXRjaAppbmRleCA3ZTNlNWY2NjUyLi4xMDY3MGQxNWFmIDEwMDY0
NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcGVybC9maWxlcy9uYXRpdmUtcGVybGluYy5w
YXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcGVybC9maWxlcy9uYXRpdmUtcGVybGlu
Yy5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gOWZlYzYyYjE5YTQ5ZDE0NTFmZDExMjBjNWRj
MzhiYWY1OWY3Mzg1NiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gYzY5NzVjOTIzMjVm
YTgwZGU5ZmYwODdhNjRmYTg3YjczMTVjZjExZCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZy
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
My4uZjE5NTI4MTQyOCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3BlcmwvZmls
ZXMvcGVybC1jb25maWdwbS1zd2l0Y2gucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L3BlcmwvZmlsZXMvcGVybC1jb25maWdwbS1zd2l0Y2gucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1G
cm9tIDdhNDg1MzhhN2U4NjE0YTMzNDIxNTFiNjQ2ZDIxMDVjMGNiMGNkZDkgTW9uIFNlcCAxNyAw
MDowMDowMCAyMDAxCitGcm9tIDYyNzkwMGQyZmVhZDY0ZTUzZDk2ZWI5YzQ3NWJjNjA3NzUxYzlh
YWIgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBBbGV4YW5kZXIgS2FuYXZpbiA8YWxl
eC5rYW5hdmluQGdtYWlsLmNvbT4KIERhdGU6IFN1biwgMjcgTWF5IDIwMDcgMjE6MDQ6MTEgKzAw
MDAKIFN1YmplY3Q6IFtQQVRDSF0gcGVybDogNS44LjcgLT4gNS44LjggKGZyb20gT0UpCkBAIC0x
OSw3ICsxOSw3IEBAIFNpZ25lZC1vZmYtYnk6IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4LmthbmF2
aW5AZ21haWwuY29tPgogIDEgZmlsZSBjaGFuZ2VkLCAxNiBpbnNlcnRpb25zKCspLCAyIGRlbGV0
aW9ucygtKQogCiBkaWZmIC0tZ2l0IGEvY29uZmlncG0gYi9jb25maWdwbQotaW5kZXggMDcyMTlk
OC4uMDFhMjNmYSAxMDA3NTUKK2luZGV4IDBjNDZiOWUuLjFkYWViZWYgMTAwNzU1CiAtLS0gYS9j
b25maWdwbQogKysrIGIvY29uZmlncG0KIEBAIC03MTgsNyArNzE4LDcgQEAgJGNvbmZpZ190eHQg
Lj0gdW5jb21tZW50IDw8J0VORE9GRU5EJzsKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0
b29scy9wZXJsL2ZpbGVzL3BlcmwtZHlubG9hZGVyLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3BlcmwvZmlsZXMvcGVybC1keW5sb2FkZXIucGF0Y2gKaW5kZXggNTQ3MjYwMmQzYS4uZjdm
NWYzN2Y2ZCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3BlcmwvZmlsZXMvcGVy
bC1keW5sb2FkZXIucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3BlcmwvZmlsZXMv
cGVybC1keW5sb2FkZXIucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDI1YTI2YzUyYzMyMGU2
OTliMzdhN2FkMWY0ZjA0NWJjOGFhNGNiMDAgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9t
IDhjNzQxMWZlMDc3Y2Y5YzA2MWJhYjg2OGJlMDM1MWQ2ZWNlYzJmZGQgTW9uIFNlcCAxNyAwMDow
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
ZXZ0b29scy9wZXJsL3BlcmxfNS40Mi4wLmJiCmluZGV4IDIyMjVkYzIwMmIuLmEyM2Y1YzM1ODEg
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

--===============2370533023589522591==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 944 .bb files complete (0 cached, 944 parsed). 1952 targets, 42 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "5.3.99+snapshot-6122d10c7c97288bab5f4ec9c2408c85f39f34cd"
TUNE_FEATURES        = "m64 x86-64-v3"
TARGET_FPU           = ""
meta                 = "tmp-auh-upgrades:6122d10c7c97288bab5f4ec9c2408c85f39f34cd"
meta-yocto-bsp       
meta-poky            = "master:2486ce2889062500e39446bc07c7d21120a0345e"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 386 Local 73 Mirrors 0 Missed 313 Current 365 (18% match, 58% complete)
done.
Removing 3 stale sstate objects for arch allarch...done.
Removing 40 stale sstate objects for arch x86_64...done.
Removing 60 stale sstate objects for arch qemux86_64...done.
Removing 125 stale sstate objects for arch x86-64-v3...done.
NOTE: Executing Tasks
NOTE: Running setscene task 455 of 751 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/dpkg/dpkg_1.22.21.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 469 of 751 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/perl/perl_5.42.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 516 of 751 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/docbook-xml/docbook-xml-dtd4_4.5.bb:do_create_spdx_setscene)
NOTE: Running setscene task 618 of 751 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/docbook-xml/docbook-xsl-stylesheets_1.79.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 646 of 751 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.47.bb:do_create_spdx_setscene)
NOTE: Running setscene task 678 of 751 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 688 of 751 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 707 of 751 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/perl-cross/perlcross_1.6.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 745 of 751 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/perl/perl_5.42.0.bb:do_recipe_qa_setscene)
NOTE: recipe perl-5.42.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe docbook-xml-dtd4-native-4.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe docbook-xsl-stylesheets-native-1.79.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe openssl-3.5.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe perlcross-native-1.6.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe dpkg-native-1.22.21-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpcre2-native-10.47-r0: task do_create_spdx_setscene: Started
NOTE: recipe perl-native-5.42.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe perl-5.42.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe docbook-xsl-stylesheets-native-1.79.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 1137 of 2090 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.1.bb:do_fetch)
NOTE: Running task 1138 of 2090 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/perl/perl_5.42.0.bb:do_fetch)
NOTE: Running task 1139 of 2090 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/docbook-xml/docbook-xsl-stylesheets_1.79.1.bb:do_fetch)
NOTE: recipe openssl-3.5.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe docbook-xml-dtd4-native-4.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running task 1140 of 2090 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.5.bb:do_fetch)
NOTE: recipe dpkg-native-1.22.21-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe perlcross-native-1.6.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 747 of 751 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/perl-cross/perlcross_1.6.2.bb:do_populate_sysroot_setscene)
NOTE: Running task 1145 of 2090 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/dpkg/dpkg_1.22.21.bb:do_fetch)
NOTE: recipe libpcre2-native-10.47-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe perl-native-5.42.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 748 of 751 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.1.bb:do_create_spdx_setscene)
NOTE: Running task 1149 of 2090 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/perl/perl_5.42.0.bb:do_fetch)
NOTE: recipe zlib-1.3.1-r0: task do_fetch: Started
NOTE: recipe perl-5.42.0-r0: task do_fetch: Started
NOTE: recipe docbook-xsl-stylesheets-native-1.79.1-r0: task do_fetch: Started
NOTE: recipe zlib-1.3.1-r0: task do_fetch: Succeeded
NOTE: recipe openssl-3.5.5-r0: task do_fetch: Started
NOTE: Running task 1152 of 2090 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.1.bb:do_unpack)
NOTE: recipe perlcross-native-1.6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe perl-5.42.0-r0: task do_fetch: Succeeded
NOTE: recipe openssl-3.5.5-r0: task do_fetch: Succeeded
NOTE: Running task 1153 of 2090 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/perl/perl_5.42.0.bb:do_unpack)
NOTE: recipe zlib-native-1.3.1-r0: task do_create_spdx_setscene: Started
NOTE: Running task 1154 of 2090 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.5.bb:do_unpack)
NOTE: recipe dpkg-native-1.22.21-r0: task do_fetch: Started
NOTE: recipe perl-native-5.42.0-r0: task do_fetch: Started
NOTE: recipe perl-native-5.42.0-r0: task do_fetch: Succeeded
NOTE: Running task 1155 of 2090 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/perl/perl_5.42.0.bb:do_unpack)
NOTE: recipe zlib-1.3.1-r0: task do_unpack: Started
NOTE: recipe zlib-native-1.3.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe perl-5.42.0-r0: task do_unpack: Started
NOTE: recipe openssl-3.5.5-r0: task do_unpack: Started
NOTE: recipe zlib-1.3.1-r0: task do_unpack: Succeeded
NOTE: Running task 1222 of 2090 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.1.bb:do_patch)
NOTE: recipe perl-native-5.42.0-r0: task do_unpack: Started
NOTE: recipe perlcross-native-1.6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 751 of 751 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/perl-cross/perlcross_1.6.2.bb:do_recipe_qa_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_patch: Started
NOTE: recipe dpkg-native-1.22.21-r0: task do_fetch: Succeeded
NOTE: recipe perlcross-native-1.6.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1223 of 2090 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/dpkg/dpkg_1.22.21.bb:do_unpack)
NOTE: recipe perlcross-native-1.6.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1234 of 2090 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/perl/perl_5.42.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe zlib-1.3.1-r0: task do_patch: Succeeded
NOTE: recipe dpkg-native-1.22.21-r0: task do_unpack: Started
NOTE: recipe perl-native-5.42.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe perl-native-5.42.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe perl-5.42.0-r0: task do_unpack: Succeeded
NOTE: Running task 1238 of 2090 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/perl/perl_5.42.0.bb:do_patch)
NOTE: recipe perl-5.42.0-r0: task do_patch: Started
NOTE: recipe openssl-3.5.5-r0: task do_unpack: Succeeded
NOTE: Running task 1239 of 2090 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.5.bb:do_patch)
NOTE: recipe dpkg-native-1.22.21-r0: task do_unpack: Succeeded
NOTE: Running task 1240 of 2090 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/dpkg/dpkg_1.22.21.bb:do_patch)
NOTE: recipe openssl-3.5.5-r0: task do_patch: Started
NOTE: recipe dpkg-native-1.22.21-r0: task do_patch: Started
NOTE: recipe perl-native-5.42.0-r0: task do_unpack: Succeeded
NOTE: Running task 1241 of 2090 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/perl/perl_5.42.0.bb:do_patch)
NOTE: Running task 1242 of 2090 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/perl/perl_5.42.0.bb:do_collect_spdx_deps)
NOTE: recipe openssl-3.5.5-r0: task do_patch: Succeeded
NOTE: recipe perl-5.42.0-r0: task do_patch: Succeeded
NOTE: Running task 1244 of 2090 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/perl/perl_5.42.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1245 of 2090 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/perl/perl_5.42.0.bb:do_populate_lic)
NOTE: recipe perl-native-5.42.0-r0: task do_patch: Started
NOTE: recipe perl-native-5.42.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe perl-native-5.42.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe perl-5.42.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe perl-5.42.0-r0: task do_populate_lic: Started
NOTE: recipe perl-5.42.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe perl-5.42.0-r0: task do_populate_lic: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/perl/perl_5.42.0.bb:do_deploy_source_date_epoch unihash changed to dd5d66cf35710d33ab9ce1dc858f3c35a7e3ae85ac0f273450737ec0aeb42137
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/perl/perl_5.42.0.bb:do_populate_lic unihash changed to c208bfcb7e149cd230506550772c5f6cef25b302d97bee28f8647bd016647189
NOTE: Setscene tasks completed
NOTE: recipe dpkg-native-1.22.21-r0: task do_patch: Succeeded
NOTE: recipe perl-native-5.42.0-r0: task do_patch: Failed
NOTE: recipe docbook-xsl-stylesheets-native-1.79.1-r0: task do_fetch: Succeeded
NOTE: Tasks Summary: Attempted 1246 tasks of which 1226 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260218130037.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260218130037.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/perl/perl_5.42.0.bb:do_patch
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/perl-native/5.42.0/temp/log.do_patch.258410
Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: perl-native-5.42.0-r0 do_patch: Applying patch '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/perl/files/perl-configpm-switch.patch' on target directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/perl-native/5.42.0/sources/perl-5.42.0'
CmdError('quilt --quiltrc /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/perl-native/5.42.0/recipe-sysroot-native/etc/quiltrc push', 0, 'stdout: Patch perl-configpm-switch.patch is already applied; check your series file

stderr: ')
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/perl-native/5.42.0/temp/log.do_patch.258410
ERROR: Task (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/perl/perl_5.42.0.bb:do_patch) failed with exit code '1'

--===============2370533023589522591==--

