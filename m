Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6323.1793344580221469431
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Oct 2026 00:16:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=BXatmNMp;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=IKuhml4j;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 010101a18baaa64e-334dd2b2-d85d-44e9-b8b6-4eeba104cf33-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1793344579;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=oZD+b1qtJpkPhAbEgJIc1CO8/XSP8QdeYxQ9ATbLReo=;
	b=BXatmNMpZFJKrsUpUHyHC8wGyTnqvb7CHRmIg0NAz7OoXReyIWuzWJ7Li3DGlo/a
	0/EL9sJJmpbEFD9PIuyt3f9vHBMsZs+isI0PsrTo8RlU2PCFuryuxgtU2CWZYFl6sDg
	J0CKT4GKtsmcH7FVTCKXb17sNfJGW7pGkKCKPqww=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1793344579;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=oZD+b1qtJpkPhAbEgJIc1CO8/XSP8QdeYxQ9ATbLReo=;
	b=IKuhml4jeqJaXPm5qPlnWFBXPA3rfigx9y+Qdpksu0HVSbhAkBCZfCAtwP0vvU+b
	0I3htBaajAU3ewjzYZVji19dLo78dWHjOZ+LcEiQahBJOSNPmhjGuqZkuhjEhENX1r6
	DQnF9CUH/5kqVton51N4Vi/O2rgjZdC6MDgy+Y8E=
Content-Type: multipart/mixed; boundary="===============1738592929400479883=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Wang Mingyu <wangmy@fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] librepo: upgrading to 1.21.3 SUCCEEDED
Message-ID: <010101a18baaa64e-334dd2b2-d85d-44e9-b8b6-4eeba104cf33-000000@us-west-2.amazonses.com>
Date: Fri, 30 Oct 2026 07:16:19 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.10.30-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 30 Oct 2026 07:16:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248996

--===============1738592929400479883==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *librepo* to *1.21.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-librepo-upgrade-1.21.2-1.21.3.patch
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
From c2ac0e6adfe324626822b9eb38558fa824337ce7 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 30 Oct 2026 05:25:48 +0000
Subject: [PATCH] librepo: upgrade 1.21.2 -> 1.21.3

spec: Remove unsed build dependency on python3-sphinx
Group metalink exclusion fields with related handle state
Make metalink exclusion patterns case-insensitive by default
Add support for excluding domains and locations in metalink parsing
yum: Fix memory leaks in lr_yum_download_repos() and lr_yum_download_repo()
python tests: add missing shebang to run_unittests.sh.in
Update COPYING to current FSF wording
Update FSF's address in LGPL-2.1 headers
python: Fix reference leaks of list items
Add LR_PACKAGEDOWNLOAD_TRANSIENT to skip persisting checksum cache
---
 ...tain-PYTHON_INSTALL_DIR-by-running-p.patch |  2 +-
 .../{librepo_1.21.2.bb => librepo_1.21.3.bb}  | 46 ++++++++++++++++++-
 2 files changed, 45 insertions(+), 3 deletions(-)
 rename meta/recipes-devtools/librepo/{librepo_1.21.2.bb => librepo_1.21.3.bb} (33%)

diff --git a/meta/recipes-devtools/librepo/librepo/0002-Do-not-try-to-obtain-PYTHON_INSTALL_DIR-by-running-p.patch b/meta/recipes-devtools/librepo/librepo/0002-Do-not-try-to-obtain-PYTHON_INSTALL_DIR-by-running-p.patch
index 30802fd4f2..c7d23732ab 100644
--- a/meta/recipes-devtools/librepo/librepo/0002-Do-not-try-to-obtain-PYTHON_INSTALL_DIR-by-running-p.patch
+++ b/meta/recipes-devtools/librepo/librepo/0002-Do-not-try-to-obtain-PYTHON_INSTALL_DIR-by-running-p.patch
@@ -1,4 +1,4 @@
-From e15c8ab0aab4eda7754e186c63b5ee0feb13f886 Mon Sep 17 00:00:00 2001
+From a6282ddaf4a7143866ef500db3bb334b599fa300 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 30 Dec 2016 18:05:36 +0200
 Subject: [PATCH] Do not try to obtain PYTHON_INSTALL_DIR by running python.
diff --git a/meta/recipes-devtools/librepo/librepo_1.21.2.bb b/meta/recipes-devtools/librepo/librepo_1.21.3.bb
similarity index 33%
rename from meta/recipes-devtools/librepo/librepo_1.21.2.bb
rename to meta/recipes-devtools/librepo/librepo_1.21.3.bb
index ab60e76b6e..cdb7a44409 100644
--- a/meta/recipes-devtools/librepo/librepo_1.21.2.bb
+++ b/meta/recipes-devtools/librepo/librepo_1.21.3.bb
@@ -1,15 +1,57 @@
+# FIXME: the LIC_FILES_CHKSUM values have been updated by 'devtool upgrade'.
+# The following is the difference between the old and the new license text.
+# Please update the LICENSE value if needed, and summarize the changes in
+# the commit message via 'License-Update:' tag.
+# (example: 'License-Update: copyright years updated.')
+#
+# The changes:
+#
+# --- COPYING
+# +++ COPYING
+# @@ -2,7 +2,7 @@
+#                         Version 2.1, February 1999
+#  
+#   Copyright (C) 1991, 1999 Free Software Foundation, Inc.
+# - 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
+# + <https://fsf.org/>
+#   Everyone is permitted to copy and distribute verbatim copies
+#   of this license document, but changing it is not allowed.
+#  
+# @@ -484,8 +484,7 @@
+#      Lesser General Public License for more details.
+#  
+#      You should have received a copy of the GNU Lesser General Public
+# -    License along with this library; if not, write to the Free Software
+# -    Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
+# +    License along with this library; if not, see <https://www.gnu.org/licenses/>.
+#  
+#  Also add information on how to contact you by electronic and paper mail.
+#  
+# @@ -496,7 +495,7 @@
+#    Yoyodyne, Inc., hereby disclaims all copyright interest in the
+#    library `Frob' (a library for tweaking knobs) written by James Random Hacker.
+#  
+# -  <signature of Ty Coon>, 1 April 1990
+# -  Ty Coon, President of Vice
+# +  <signature of Moe Ghoul>, 1 April 1990
+# +  Moe Ghoul, President of Vice
+#  
+#  That's all there is to it!
+# 
+#
+
 SUMMARY = "A library providing C and Python (libcURL like) API \
            for downloading linux repository metadata and packages."
 HOMEPAGE = "https://github.com/rpm-software-management/librepo"
 DESCRIPTION = "${SUMMARY}"
 LICENSE = "LGPL-2.1-only"
-LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
+LIC_FILES_CHKSUM = "file://COPYING;md5=4bf661c1e3793e55c8d1051bc5e0ae21"
 
 SRC_URI = "git://github.com/rpm-software-management/librepo.git;branch=master;protocol=https;tag=${PV} \
            file://0002-Do-not-try-to-obtain-PYTHON_INSTALL_DIR-by-running-p.patch \
            "
 
-SRCREV = "f892f216a8f7934f32846712f56a27f997b300a3"
+SRCREV = "d665398754be6fe270d0a70c3db2ea5c3b917e68"
 
 DEPENDS = "curl glib-2.0 openssl attr gpgme libxml2"
 
-- 
2.47.1


--===============1738592929400479883==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/librepo: SRC_URI changed from "git://github.com/rpm-software-management/librepo.git;branch=master;protocol=https;tag=1.21.2 file://0002-Do-not-try-to-obtain-PYTHON_INSTALL_DIR-by-running-p.patch" to "git://github.com/rpm-software-management/librepo.git;branch=master;protocol=https;tag=1.21.3 file://0002-Do-not-try-to-obtain-PYTHON_INSTALL_DIR-by-running-p.patch"
packages/x86-64-v3-poky-linux/librepo: PKGV changed from 1.21.2 [default] to 1.21.3 [default]
packages/x86-64-v3-poky-linux/librepo: PV changed from "1.21.2" to "1.21.3"
packages/x86-64-v3-poky-linux/librepo/librepo-dbg: PKGSIZE changed from 967536 to 981512 (+1%)
packages/x86-64-v3-poky-linux/librepo/librepo-dbg: PKGV changed from 1.21.2 [default] to 1.21.3 [default]
packages/x86-64-v3-poky-linux/librepo/librepo-dbg: PV changed from "1.21.2" to "1.21.3"
packages/x86-64-v3-poky-linux/librepo/librepo-dev: PKGSIZE changed from 128421 to 128111 (-0%)
packages/x86-64-v3-poky-linux/librepo/librepo-dev: PKGV changed from 1.21.2 [default] to 1.21.3 [default]
packages/x86-64-v3-poky-linux/librepo/librepo-dev: PV changed from "1.21.2" to "1.21.3"
packages/x86-64-v3-poky-linux/librepo/librepo-doc: PKGV changed from 1.21.2 [default] to 1.21.3 [default]
packages/x86-64-v3-poky-linux/librepo/librepo-doc: PV changed from "1.21.2" to "1.21.3"
packages/x86-64-v3-poky-linux/librepo/librepo-locale: PKGV changed from 1.21.2 [default] to 1.21.3 [default]
packages/x86-64-v3-poky-linux/librepo/librepo-locale: PV changed from "1.21.2" to "1.21.3"
packages/x86-64-v3-poky-linux/librepo/librepo-src: FILELIST: directory renamed /usr/src/debug/librepo/1.21.2/librepo/python -> /usr/src/debug/librepo/1.21.3/librepo/python, removed "/usr/src/debug/librepo/1.21.2/librepo/downloader.c /usr/src/debug/librepo/1.21.2/librepo/repomd.h /usr/src/debug/librepo/1.21.2/librepo/checksum.h /usr/src/debug/librepo/1.21.2/librepo/rcodes.c /usr/src/debug/librepo/1.21.2/librepo/metalink.h /usr/src/debug/librepo/1.21.2/librepo/checksum.c /usr/src/debug/librepo/1.21.2/librepo/cleanup.h /usr/src/debug/librepo/1.21.2/librepo/downloader.h /usr/src/debug/librepo/1.21.2/librepo/handle_internal.h /usr/src/debug/librepo/1.21.2/librepo/metalink.c /usr/src/debug/librepo/1.21.2/librepo/rcodes.h /usr/src/debug/librepo/1.21.2/librepo/repomd.c /usr/src/debug/librepo/1.21.2/librepo/downloader_internal.h /usr/src/debug/librepo/1.21.2/librepo/gpg.h /usr/src/debug/librepo/1.21.2/librepo/xmlparser.c /usr/src/debug/librepo/1.21.2/librepo/gpg.c /usr/src/debug/librepo/1.21.
 2/librepo/fastestmirror_internal.h /usr/src/debug/librepo/1.21.2/librepo/xmlparser.h /usr/src/debug/librepo/1.21.2/librepo/util.h /usr/src/debug/librepo/1.21.2/librepo/gpg_internal.h /usr/src/debug/librepo/1.21.2/librepo/handle.h /usr/src/debug/librepo/1.21.2/librepo/xmlparser_internal.h /usr/src/debug/librepo/1.21.2/librepo/repoconf_internal.h /usr/src/debug/librepo/1.21.2/librepo/handle.c /usr/src/debug/librepo/1.21.2/librepo/util.c /usr/src/debug/librepo/1.21.2/librepo/mirrorlist.h /usr/src/debug/librepo/1.21.2/librepo/yum.c /usr/src/debug/librepo/1.21.2/librepo/lrmirrorlist.c /usr/src/debug/librepo/1.21.2/librepo/metadata_downloader.c /usr/src/debug/librepo/1.21.2/librepo/yum.h /usr/src/debug/librepo/1.21.2/librepo/mirrorlist.c /usr/src/debug/librepo/1.21.2/librepo/types.h /usr/src/debug/librepo/1.21.2/librepo/lrmirrorlist.h /usr/src/debug/librepo/1.21.2/librepo/metadata_downloader.h /usr/src/debug/librepo/1.21.2/librepo/repoutil_yum.h /usr/src/debug/librepo/1.21.2/librepo/url_s
 ubstitution.c /usr/src/debug/librepo/1.21.2/librepo/url_substitution.h /usr/src/debug/librepo/1.21.2/librepo/repoutil_yum.c /usr/src/debug/librepo/1.21.2/librepo/result.c /usr/src/debug/librepo/1.21.2/librepo/downloadtarget.h /usr/src/debug/librepo/1.21.2/librepo/downloadtarget_internal.h /usr/src/debug/librepo/1.21.2/librepo/result.h /usr/src/debug/librepo/1.21.2/librepo/result_internal.h /usr/src/debug/librepo/1.21.2/librepo/downloadtarget.c /usr/src/debug/librepo/1.21.2/librepo/repoconf.c /usr/src/debug/librepo/1.21.2/librepo/yum_internal.h /usr/src/debug/librepo/1.21.2/librepo/fastestmirror.c /usr/src/debug/librepo/1.21.2/librepo/package_downloader.c /usr/src/debug/librepo/1.21.2/librepo/gpg_gpgme.c /usr/src/debug/librepo/1.21.2/librepo/repoconf.h /usr/src/debug/librepo/1.21.2/librepo/package_downloader.h /usr/src/debug/librepo/1.21.2/librepo/fastestmirror.h", added "/usr/src/debug/librepo/1.21.3/librepo/downloader.c /usr/src/debug/librepo/1.21.3/librepo/repomd.h /usr/src/debug/
 librepo/1.21.3/librepo/checksum.h /usr/src/debug/librepo/1.21.3/librepo/rcodes.c /usr/src/debug/librepo/1.21.3/librepo/metalink.h /usr/src/debug/librepo/1.21.3/librepo/checksum.c /usr/src/debug/librepo/1.21.3/librepo/cleanup.h /usr/src/debug/librepo/1.21.3/librepo/downloader.h /usr/src/debug/librepo/1.21.3/librepo/handle_internal.h /usr/src/debug/librepo/1.21.3/librepo/metalink.c /usr/src/debug/librepo/1.21.3/librepo/rcodes.h /usr/src/debug/librepo/1.21.3/librepo/repomd.c /usr/src/debug/librepo/1.21.3/librepo/metalink_internal.h /usr/src/debug/librepo/1.21.3/librepo/downloader_internal.h /usr/src/debug/librepo/1.21.3/librepo/gpg.h /usr/src/debug/librepo/1.21.3/librepo/xmlparser.c /usr/src/debug/librepo/1.21.3/librepo/gpg.c /usr/src/debug/librepo/1.21.3/librepo/fastestmirror_internal.h /usr/src/debug/librepo/1.21.3/librepo/xmlparser.h /usr/src/debug/librepo/1.21.3/librepo/util.h /usr/src/debug/librepo/1.21.3/librepo/gpg_internal.h /usr/src/debug/librepo/1.21.3/librepo/handle.h /usr/s
 rc/debug/librepo/1.21.3/librepo/xmlparser_internal.h /usr/src/debug/librepo/1.21.3/librepo/repoconf_internal.h /usr/src/debug/librepo/1.21.3/librepo/handle.c /usr/src/debug/librepo/1.21.3/librepo/util.c /usr/src/debug/librepo/1.21.3/librepo/mirrorlist.h /usr/src/debug/librepo/1.21.3/librepo/yum.c /usr/src/debug/librepo/1.21.3/librepo/lrmirrorlist.c /usr/src/debug/librepo/1.21.3/librepo/metadata_downloader.c /usr/src/debug/librepo/1.21.3/librepo/yum.h /usr/src/debug/librepo/1.21.3/librepo/mirrorlist.c /usr/src/debug/librepo/1.21.3/librepo/types.h /usr/src/debug/librepo/1.21.3/librepo/lrmirrorlist.h /usr/src/debug/librepo/1.21.3/librepo/metadata_downloader.h /usr/src/debug/librepo/1.21.3/librepo/repoutil_yum.h /usr/src/debug/librepo/1.21.3/librepo/url_substitution.c /usr/src/debug/librepo/1.21.3/librepo/url_substitution.h /usr/src/debug/librepo/1.21.3/librepo/repoutil_yum.c /usr/src/debug/librepo/1.21.3/librepo/result.c /usr/src/debug/librepo/1.21.3/librepo/downloadtarget.h /usr/src/d
 ebug/librepo/1.21.3/librepo/downloadtarget_internal.h /usr/src/debug/librepo/1.21.3/librepo/result.h /usr/src/debug/librepo/1.21.3/librepo/result_internal.h /usr/src/debug/librepo/1.21.3/librepo/downloadtarget.c /usr/src/debug/librepo/1.21.3/librepo/repoconf.c /usr/src/debug/librepo/1.21.3/librepo/yum_internal.h /usr/src/debug/librepo/1.21.3/librepo/fastestmirror.c /usr/src/debug/librepo/1.21.3/librepo/package_downloader.c /usr/src/debug/librepo/1.21.3/librepo/gpg_gpgme.c /usr/src/debug/librepo/1.21.3/librepo/repoconf.h /usr/src/debug/librepo/1.21.3/librepo/package_downloader.h /usr/src/debug/librepo/1.21.3/librepo/fastestmirror.h"
packages/x86-64-v3-poky-linux/librepo/librepo-src: PKGSIZE changed from 756745 to 758498 (+0%)
packages/x86-64-v3-poky-linux/librepo/librepo-src: PKGV changed from 1.21.2 [default] to 1.21.3 [default]
packages/x86-64-v3-poky-linux/librepo/librepo-src: PV changed from "1.21.2" to "1.21.3"
packages/x86-64-v3-poky-linux/librepo/librepo-staticdev: PKGV changed from 1.21.2 [default] to 1.21.3 [default]
packages/x86-64-v3-poky-linux/librepo/librepo-staticdev: PV changed from "1.21.2" to "1.21.3"
packages/x86-64-v3-poky-linux/librepo/librepo: PKGSIZE changed from 330670 to 331862 (+0%)
packages/x86-64-v3-poky-linux/librepo/librepo: PKGV changed from 1.21.2 [default] to 1.21.3 [default]
packages/x86-64-v3-poky-linux/librepo/librepo: PV changed from "1.21.2" to "1.21.3"

--===============1738592929400479883==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="librepo-changelog.txt"

spec: Remove unsed build dependency on python3-sphinx
Group metalink exclusion fields with related handle state
Make metalink exclusion patterns case-insensitive by default
Add support for excluding domains and locations in metalink parsing
yum: Fix memory leaks in lr_yum_download_repos() and lr_yum_download_repo()
python tests: add missing shebang to run_unittests.sh.in
Update COPYING to current FSF wording
Update FSF's address in LGPL-2.1 headers
python: Fix reference leaks of list items
Add LR_PACKAGEDOWNLOAD_TRANSIENT to skip persisting checksum cache

--===============1738592929400479883==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-librepo-upgrade-1.21.2-1.21.3.patch"

RnJvbSBjMmFjMGU2YWRmZTMyNDYyNjgyMmI5ZWIzODU1OGZhODI0MzM3Y2U3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMzAgT2N0IDIwMjYgMDU6MjU6NDggKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJyZXBvOiB1cGdyYWRlIDEuMjEuMiAtPiAxLjIxLjMKCnNwZWM6IFJlbW92ZSB1bnNlZCBidWls
ZCBkZXBlbmRlbmN5IG9uIHB5dGhvbjMtc3BoaW54Ckdyb3VwIG1ldGFsaW5rIGV4Y2x1c2lvbiBm
aWVsZHMgd2l0aCByZWxhdGVkIGhhbmRsZSBzdGF0ZQpNYWtlIG1ldGFsaW5rIGV4Y2x1c2lvbiBw
YXR0ZXJucyBjYXNlLWluc2Vuc2l0aXZlIGJ5IGRlZmF1bHQKQWRkIHN1cHBvcnQgZm9yIGV4Y2x1
ZGluZyBkb21haW5zIGFuZCBsb2NhdGlvbnMgaW4gbWV0YWxpbmsgcGFyc2luZwp5dW06IEZpeCBt
ZW1vcnkgbGVha3MgaW4gbHJfeXVtX2Rvd25sb2FkX3JlcG9zKCkgYW5kIGxyX3l1bV9kb3dubG9h
ZF9yZXBvKCkKcHl0aG9uIHRlc3RzOiBhZGQgbWlzc2luZyBzaGViYW5nIHRvIHJ1bl91bml0dGVz
dHMuc2guaW4KVXBkYXRlIENPUFlJTkcgdG8gY3VycmVudCBGU0Ygd29yZGluZwpVcGRhdGUgRlNG
J3MgYWRkcmVzcyBpbiBMR1BMLTIuMSBoZWFkZXJzCnB5dGhvbjogRml4IHJlZmVyZW5jZSBsZWFr
cyBvZiBsaXN0IGl0ZW1zCkFkZCBMUl9QQUNLQUdFRE9XTkxPQURfVFJBTlNJRU5UIHRvIHNraXAg
cGVyc2lzdGluZyBjaGVja3N1bSBjYWNoZQotLS0KIC4uLnRhaW4tUFlUSE9OX0lOU1RBTExfRElS
LWJ5LXJ1bm5pbmctcC5wYXRjaCB8ICAyICstCiAuLi4ve2xpYnJlcG9fMS4yMS4yLmJiID0+IGxp
YnJlcG9fMS4yMS4zLmJifSAgfCA0NiArKysrKysrKysrKysrKysrKystCiAyIGZpbGVzIGNoYW5n
ZWQsIDQ1IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVz
LWRldnRvb2xzL2xpYnJlcG8ve2xpYnJlcG9fMS4yMS4yLmJiID0+IGxpYnJlcG9fMS4yMS4zLmJi
fSAoMzMlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9saWJyZXBvL2xpYnJl
cG8vMDAwMi1Eby1ub3QtdHJ5LXRvLW9idGFpbi1QWVRIT05fSU5TVEFMTF9ESVItYnktcnVubmlu
Zy1wLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2xpYnJlcG8vbGlicmVwby8wMDAyLURv
LW5vdC10cnktdG8tb2J0YWluLVBZVEhPTl9JTlNUQUxMX0RJUi1ieS1ydW5uaW5nLXAucGF0Y2gK
aW5kZXggMzA4MDJmZDRmMi4uYzdkMjM3MzJhYiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL2xpYnJlcG8vbGlicmVwby8wMDAyLURvLW5vdC10cnktdG8tb2J0YWluLVBZVEhPTl9J
TlNUQUxMX0RJUi1ieS1ydW5uaW5nLXAucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L2xpYnJlcG8vbGlicmVwby8wMDAyLURvLW5vdC10cnktdG8tb2J0YWluLVBZVEhPTl9JTlNUQUxM
X0RJUi1ieS1ydW5uaW5nLXAucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIGUxNWM4YWIwYWFi
NGVkYTc3NTRlMTg2YzYzYjVlZTBmZWIxM2Y4ODYgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitG
cm9tIGE2MjgyZGRhZjRhNzE0Mzg2NmVmNTAwZGIzYmIzMzRiNTk5ZmEzMDAgTW9uIFNlcCAxNyAw
MDowMDowMCAyMDAxCiBGcm9tOiBBbGV4YW5kZXIgS2FuYXZpbiA8YWxleC5rYW5hdmluQGdtYWls
LmNvbT4KIERhdGU6IEZyaSwgMzAgRGVjIDIwMTYgMTg6MDU6MzYgKzAyMDAKIFN1YmplY3Q6IFtQ
QVRDSF0gRG8gbm90IHRyeSB0byBvYnRhaW4gUFlUSE9OX0lOU1RBTExfRElSIGJ5IHJ1bm5pbmcg
cHl0aG9uLgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2xpYnJlcG8vbGlicmVw
b18xLjIxLjIuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvbGlicmVwby9saWJyZXBvXzEuMjEu
My5iYgpzaW1pbGFyaXR5IGluZGV4IDMzJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9v
bHMvbGlicmVwby9saWJyZXBvXzEuMjEuMi5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRv
b2xzL2xpYnJlcG8vbGlicmVwb18xLjIxLjMuYmIKaW5kZXggYWI2MGU3NmI2ZS4uY2RiN2E0NDQw
OSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2xpYnJlcG8vbGlicmVwb18xLjIx
LjIuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2xpYnJlcG8vbGlicmVwb18xLjIxLjMu
YmIKQEAgLTEsMTUgKzEsNTcgQEAKKyMgRklYTUU6IHRoZSBMSUNfRklMRVNfQ0hLU1VNIHZhbHVl
cyBoYXZlIGJlZW4gdXBkYXRlZCBieSAnZGV2dG9vbCB1cGdyYWRlJy4KKyMgVGhlIGZvbGxvd2lu
ZyBpcyB0aGUgZGlmZmVyZW5jZSBiZXR3ZWVuIHRoZSBvbGQgYW5kIHRoZSBuZXcgbGljZW5zZSB0
ZXh0LgorIyBQbGVhc2UgdXBkYXRlIHRoZSBMSUNFTlNFIHZhbHVlIGlmIG5lZWRlZCwgYW5kIHN1
bW1hcml6ZSB0aGUgY2hhbmdlcyBpbgorIyB0aGUgY29tbWl0IG1lc3NhZ2UgdmlhICdMaWNlbnNl
LVVwZGF0ZTonIHRhZy4KKyMgKGV4YW1wbGU6ICdMaWNlbnNlLVVwZGF0ZTogY29weXJpZ2h0IHll
YXJzIHVwZGF0ZWQuJykKKyMKKyMgVGhlIGNoYW5nZXM6CisjCisjIC0tLSBDT1BZSU5HCisjICsr
KyBDT1BZSU5HCisjIEBAIC0yLDcgKzIsNyBAQAorIyAgICAgICAgICAgICAgICAgICAgICAgICBW
ZXJzaW9uIDIuMSwgRmVicnVhcnkgMTk5OQorIyAgCisjICAgQ29weXJpZ2h0IChDKSAxOTkxLCAx
OTk5IEZyZWUgU29mdHdhcmUgRm91bmRhdGlvbiwgSW5jLgorIyAtIDUxIEZyYW5rbGluIFN0cmVl
dCwgRmlmdGggRmxvb3IsIEJvc3RvbiwgTUEgIDAyMTEwLTEzMDEgIFVTQQorIyArIDxodHRwczov
L2ZzZi5vcmcvPgorIyAgIEV2ZXJ5b25lIGlzIHBlcm1pdHRlZCB0byBjb3B5IGFuZCBkaXN0cmli
dXRlIHZlcmJhdGltIGNvcGllcworIyAgIG9mIHRoaXMgbGljZW5zZSBkb2N1bWVudCwgYnV0IGNo
YW5naW5nIGl0IGlzIG5vdCBhbGxvd2VkLgorIyAgCisjIEBAIC00ODQsOCArNDg0LDcgQEAKKyMg
ICAgICBMZXNzZXIgR2VuZXJhbCBQdWJsaWMgTGljZW5zZSBmb3IgbW9yZSBkZXRhaWxzLgorIyAg
CisjICAgICAgWW91IHNob3VsZCBoYXZlIHJlY2VpdmVkIGEgY29weSBvZiB0aGUgR05VIExlc3Nl
ciBHZW5lcmFsIFB1YmxpYworIyAtICAgIExpY2Vuc2UgYWxvbmcgd2l0aCB0aGlzIGxpYnJhcnk7
IGlmIG5vdCwgd3JpdGUgdG8gdGhlIEZyZWUgU29mdHdhcmUKKyMgLSAgICBGb3VuZGF0aW9uLCBJ
bmMuLCA1MSBGcmFua2xpbiBTdHJlZXQsIEZpZnRoIEZsb29yLCBCb3N0b24sIE1BICAwMjExMC0x
MzAxICBVU0EKKyMgKyAgICBMaWNlbnNlIGFsb25nIHdpdGggdGhpcyBsaWJyYXJ5OyBpZiBub3Qs
IHNlZSA8aHR0cHM6Ly93d3cuZ251Lm9yZy9saWNlbnNlcy8+LgorIyAgCisjICBBbHNvIGFkZCBp
bmZvcm1hdGlvbiBvbiBob3cgdG8gY29udGFjdCB5b3UgYnkgZWxlY3Ryb25pYyBhbmQgcGFwZXIg
bWFpbC4KKyMgIAorIyBAQCAtNDk2LDcgKzQ5NSw3IEBACisjICAgIFlveW9keW5lLCBJbmMuLCBo
ZXJlYnkgZGlzY2xhaW1zIGFsbCBjb3B5cmlnaHQgaW50ZXJlc3QgaW4gdGhlCisjICAgIGxpYnJh
cnkgYEZyb2InIChhIGxpYnJhcnkgZm9yIHR3ZWFraW5nIGtub2JzKSB3cml0dGVuIGJ5IEphbWVz
IFJhbmRvbSBIYWNrZXIuCisjICAKKyMgLSAgPHNpZ25hdHVyZSBvZiBUeSBDb29uPiwgMSBBcHJp
bCAxOTkwCisjIC0gIFR5IENvb24sIFByZXNpZGVudCBvZiBWaWNlCisjICsgIDxzaWduYXR1cmUg
b2YgTW9lIEdob3VsPiwgMSBBcHJpbCAxOTkwCisjICsgIE1vZSBHaG91bCwgUHJlc2lkZW50IG9m
IFZpY2UKKyMgIAorIyAgVGhhdCdzIGFsbCB0aGVyZSBpcyB0byBpdCEKKyMgCisjCisKIFNVTU1B
UlkgPSAiQSBsaWJyYXJ5IHByb3ZpZGluZyBDIGFuZCBQeXRob24gKGxpYmNVUkwgbGlrZSkgQVBJ
IFwKICAgICAgICAgICAgZm9yIGRvd25sb2FkaW5nIGxpbnV4IHJlcG9zaXRvcnkgbWV0YWRhdGEg
YW5kIHBhY2thZ2VzLiIKIEhPTUVQQUdFID0gImh0dHBzOi8vZ2l0aHViLmNvbS9ycG0tc29mdHdh
cmUtbWFuYWdlbWVudC9saWJyZXBvIgogREVTQ1JJUFRJT04gPSAiJHtTVU1NQVJZfSIKIExJQ0VO
U0UgPSAiTEdQTC0yLjEtb25seSIKLUxJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0NPUFlJTkc7
bWQ1PTRmYmQ2NTM4MGNkZDI1NTk1MTA3OTAwOGIzNjQ1MTZjIgorTElDX0ZJTEVTX0NIS1NVTSA9
ICJmaWxlOi8vQ09QWUlORzttZDU9NGJmNjYxYzFlMzc5M2U1NWM4ZDEwNTFiYzVlMGFlMjEiCiAK
IFNSQ19VUkkgPSAiZ2l0Oi8vZ2l0aHViLmNvbS9ycG0tc29mdHdhcmUtbWFuYWdlbWVudC9saWJy
ZXBvLmdpdDticmFuY2g9bWFzdGVyO3Byb3RvY29sPWh0dHBzO3RhZz0ke1BWfSBcCiAgICAgICAg
ICAgIGZpbGU6Ly8wMDAyLURvLW5vdC10cnktdG8tb2J0YWluLVBZVEhPTl9JTlNUQUxMX0RJUi1i
eS1ydW5uaW5nLXAucGF0Y2ggXAogICAgICAgICAgICAiCiAKLVNSQ1JFViA9ICJmODkyZjIxNmE4
Zjc5MzRmMzI4NDY3MTJmNTZhMjdmOTk3YjMwMGEzIgorU1JDUkVWID0gImQ2NjUzOTg3NTRiZTZm
ZTI3MGQwYTcwYzNkYjJlYTVjM2I5MTdlNjgiCiAKIERFUEVORFMgPSAiY3VybCBnbGliLTIuMCBv
cGVuc3NsIGF0dHIgZ3BnbWUgbGlieG1sMiIKIAotLSAKMi40Ny4xCgo=

--===============1738592929400479883==--
