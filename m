Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 562B5C2FC22
	for <webhook@archiver.kernel.org>; Wed, 16 Aug 2023 22:19:12 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web11.173803.1692224343970671896
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Aug 2023 15:19:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=ZvQTRL4Y;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=WVC7Bxfg;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101018a006e65ca-3ab90c8e-5acb-4d63-9856-14d21f6e076f-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1692224349;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=NAoq/w1MpaijdgvVAiMC5ojnPipzczbud1UIPnuyAb8=;
	b=ZvQTRL4Yw7x7rYu7Kb2Zhb9B0GozPNjqBtd9Q0IZ4UCI07KFhIVIlI0okp5evs1A
	1w+8x+cSogA98Vv38zAuUdcQxzxctrG9h1t7xunRubW/AfGf3+YlKo9c2d0AJNfmNak
	9lYqO6axTjfr7Re5egvSEgdufwtio0jWXsjR2DZA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1692224349;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=NAoq/w1MpaijdgvVAiMC5ojnPipzczbud1UIPnuyAb8=;
	b=WVC7BxfgxByVLScdfwdx9AO5LKwCeHkAlLUrABhgKGwDS7vhCPI+5YGngMe0bqrO
	KH135S6Ak9JJQWmfBRpTqQNTnHG/+9pzn83xT7svMFoPXnTBN0rFeJClV2O8BKkyGYt
	dUzMPxyWKLVgfqqKGFdXdTkTxMslBHpCckTjdQJE=
Content-Type: multipart/mixed; boundary="===============6254717982371296775=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Chen Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] tar: upgrading to 1.35 SUCCEEDED
Message-ID: <0101018a006e65ca-3ab90c8e-5acb-4d63-9856-14d21f6e076f-000000@us-west-2.amazonses.com>
Date: Wed, 16 Aug 2023 22:19:09 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.08.16-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Aug 2023 22:19:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186209

--===============6254717982371296775==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *tar* to *1.35* has Succeeded.

Next steps:
    - apply the patch: git am 0001-tar-upgrade-1.34-1.35.patch
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
From b26d321f38a48251d63c49237785d94a47a4e460 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 16 Aug 2023 09:05:58 +0000
Subject: [PATCH] tar: upgrade 1.34 -> 1.35

---
 .../tar/tar/CVE-2022-48303.patch              | 43 ---------------
 .../tar/{tar_1.34.bb => tar_1.35.bb}          | 53 +++++++++++++++++--
 2 files changed, 48 insertions(+), 48 deletions(-)
 delete mode 100644 meta/recipes-extended/tar/tar/CVE-2022-48303.patch
 rename meta/recipes-extended/tar/{tar_1.34.bb => tar_1.35.bb} (45%)

diff --git a/meta/recipes-extended/tar/tar/CVE-2022-48303.patch b/meta/recipes-extended/tar/tar/CVE-2022-48303.patch
deleted file mode 100644
index b2f40f3e64..0000000000
--- a/meta/recipes-extended/tar/tar/CVE-2022-48303.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From 3da78400eafcccb97e2f2fd4b227ea40d794ede8 Mon Sep 17 00:00:00 2001
-From: Sergey Poznyakoff <gray@gnu.org>
-Date: Sat, 11 Feb 2023 11:57:39 +0200
-Subject: Fix boundary checking in base-256 decoder
-
-* src/list.c (from_header): Base-256 encoding is at least 2 bytes
-long.
-
-Upstream-Status: Backport [see reference below]
-CVE: CVE-2022-48303
-
-Reference to upstream patch:
-https://savannah.gnu.org/bugs/?62387
-https://git.savannah.gnu.org/cgit/tar.git/patch/src/list.c?id=3da78400eafcccb97e2f2fd4b227ea40d794ede8
-
-Signed-off-by: Rodolfo Quesada Zumbado <rodolfo.zumbado@windriver.com>
-Signed-off-by: Joe Slater <joe.slater@windriver.com>
----
- src/list.c | 5 +++--
- 1 file changed, 3 insertions(+), 2 deletions(-)Signed-off-by: Rodolfo Quesada Zumbado <rodolfo.zumbado@windriver.com>
-
-
-(limited to 'src/list.c')
-
-diff --git a/src/list.c b/src/list.c
-index 9fafc42..86bcfdd 100644
---- a/src/list.c
-+++ b/src/list.c
-@@ -881,8 +881,9 @@ from_header (char const *where0, size_t digs, char const *type,
- 	  where++;
- 	}
-     }
--  else if (*where == '\200' /* positive base-256 */
--	   || *where == '\377' /* negative base-256 */)
-+  else if (where <= lim - 2
-+	   && (*where == '\200' /* positive base-256 */
-+	       || *where == '\377' /* negative base-256 */))
-     {
-       /* Parse base-256 output.  A nonnegative number N is
- 	 represented as (256**DIGS)/2 + N; a negative number -N is
--- 
-cgit v1.1
-
diff --git a/meta/recipes-extended/tar/tar_1.34.bb b/meta/recipes-extended/tar/tar_1.35.bb
similarity index 45%
rename from meta/recipes-extended/tar/tar_1.34.bb
rename to meta/recipes-extended/tar/tar_1.35.bb
index 1ef5fe221e..46b9c92543 100644
--- a/meta/recipes-extended/tar/tar_1.34.bb
+++ b/meta/recipes-extended/tar/tar_1.35.bb
@@ -1,16 +1,59 @@
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
+# @@ -1,7 +1,7 @@
+#                      GNU GENERAL PUBLIC LICENSE
+#                         Version 3, 29 June 2007
+#  
+# - Copyright (C) 2007 Free Software Foundation, Inc. <http://fsf.org/>
+# + Copyright (C) 2007 Free Software Foundation, Inc. <https://fsf.org/>
+#   Everyone is permitted to copy and distribute verbatim copies
+#   of this license document, but changing it is not allowed.
+#  
+# @@ -645,7 +645,7 @@
+#      GNU General Public License for more details.
+#  
+#      You should have received a copy of the GNU General Public License
+# -    along with this program.  If not, see <http://www.gnu.org/licenses/>.
+# +    along with this program.  If not, see <https://www.gnu.org/licenses/>.
+#  
+#  Also add information on how to contact you by electronic and paper mail.
+#  
+# @@ -664,11 +664,11 @@
+#    You should also get your employer (if you work as a programmer) or school,
+#  if any, to sign a "copyright disclaimer" for the program, if necessary.
+#  For more information on this, and how to apply and follow the GNU GPL, see
+# -<http://www.gnu.org/licenses/>.
+# +<https://www.gnu.org/licenses/>.
+#  
+#    The GNU General Public License does not permit incorporating your program
+#  into proprietary programs.  If your program is a subroutine library, you
+#  may consider it more useful to permit linking proprietary applications with
+#  the library.  If this is what you want to do, use the GNU Lesser General
+#  Public License instead of this License.  But first, please read
+# -<http://www.gnu.org/philosophy/why-not-lgpl.html>.
+# +<https://www.gnu.org/licenses/why-not-lgpl.html>.
+# 
+#
+
 SUMMARY = "GNU file archiving program"
 DESCRIPTION = "GNU tar saves many files together into a single tape \
 or disk archive, and can restore individual files from the archive."
 HOMEPAGE = "http://www.gnu.org/software/tar/"
 SECTION = "base"
 LICENSE = "GPL-3.0-only"
-LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
+LIC_FILES_CHKSUM = "file://COPYING;md5=1ebbd3e34237af26da5dc08a4e440464"
 
-SRC_URI = "${GNU_MIRROR}/tar/tar-${PV}.tar.bz2 \
-           file://CVE-2022-48303.patch \
-"
+SRC_URI = "${GNU_MIRROR}/tar/tar-${PV}.tar.bz2"
 
-SRC_URI[sha256sum] = "b44cc67f8a1f6b0250b7c860e952b37e8ed932a90bd9b1862a511079255646ff"
+SRC_URI[sha256sum] = "7edb8886a3dc69420a1446e1e2d061922b642f1cf632d2cd0f9ee7e690775985"
 
 inherit autotools gettext texinfo
 
-- 
2.39.2


--===============6254717982371296775==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/tar: PACKAGES: added "tar-locale-ka"
packages/core2-32-poky-linux/tar: SRC_URI changed from "https://ftp.gnu.org/gnu/tar/tar-1.34.tar.bz2 file://CVE-2022-48303.patch" to "https://ftp.gnu.org/gnu/tar/tar-1.35.tar.bz2"
packages/core2-32-poky-linux/tar: PKGV changed from 1.34 [default] to 1.35 [default]
packages/core2-32-poky-linux/tar: PV changed from "1.34" to "1.35"
packages/core2-32-poky-linux/tar/tar-dbg: PKGSIZE changed from 1672852 to 1703720 (+2%)
packages/core2-32-poky-linux/tar/tar-dbg: PV changed from "1.34" to "1.35"
packages/core2-32-poky-linux/tar/tar-dbg: PKGV changed from 1.34 [default] to 1.35 [default]
packages/core2-32-poky-linux/tar/tar-dev: PV changed from "1.34" to "1.35"
packages/core2-32-poky-linux/tar/tar-dev: PKGV changed from 1.34 [default] to 1.35 [default]
packages/core2-32-poky-linux/tar/tar-doc: FILELIST: added "/usr/share/info/tar.info-3"
packages/core2-32-poky-linux/tar/tar-doc: PKGSIZE changed from 699759 to 732555 (+5%)
packages/core2-32-poky-linux/tar/tar-doc: PV changed from "1.34" to "1.35"
packages/core2-32-poky-linux/tar/tar-doc: PKGV changed from 1.34 [default] to 1.35 [default]
packages/core2-32-poky-linux/tar/tar-locale-bg: PKGSIZE changed from 86963 to 85525 (-2%)
packages/core2-32-poky-linux/tar/tar-locale-bg: PV changed from "1.34" to "1.35"
packages/core2-32-poky-linux/tar/tar-locale-bg: PKGV changed from 1.34 [default] to 1.35 [default]
packages/core2-32-poky-linux/tar/tar-locale-ca: PKGSIZE changed from 64091 to 62123 (-3%)
packages/core2-32-poky-linux/tar/tar-locale-ca: PV changed from "1.34" to "1.35"
packages/core2-32-poky-linux/tar/tar-locale-ca: PKGV changed from 1.34 [default] to 1.35 [default]
packages/core2-32-poky-linux/tar/tar-locale-cs: PKGSIZE changed from 64931 to 63708 (-2%)
packages/core2-32-poky-linux/tar/tar-locale-cs: PV changed from "1.34" to "1.35"
packages/core2-32-poky-linux/tar/tar-locale-cs: PKGV changed from 1.34 [default] to 1.35 [default]
packages/core2-32-poky-linux/tar/tar-locale-da: PKGSIZE changed from 60187 to 58291 (-3%)
packages/core2-32-poky-linux/tar/tar-locale-da: PV changed from "1.34" to "1.35"
packages/core2-32-poky-linux/tar/tar-locale-da: PKGV changed from 1.34 [default] to 1.35 [default]
packages/core2-32-poky-linux/tar/tar-locale-de: PKGSIZE changed from 64342 to 63721 (-1%)
packages/core2-32-poky-linux/tar/tar-locale-de: PV changed from "1.34" to "1.35"
packages/core2-32-poky-linux/tar/tar-locale-de: PKGV changed from 1.34 [default] to 1.35 [default]
packages/core2-32-poky-linux/tar/tar-locale-el: PKGSIZE changed from 14467 to 13857 (-4%)
packages/core2-32-poky-linux/tar/tar-locale-el: PV changed from "1.34" to "1.35"
packages/core2-32-poky-linux/tar/tar-locale-el: PKGV changed from 1.34 [default] to 1.35 [default]
packages/core2-32-poky-linux/tar/tar-locale-eo: PKGSIZE changed from 61190 to 59321 (-3%)
packages/core2-32-poky-linux/tar/tar-locale-eo: PV changed from "1.34" to "1.35"
packages/core2-32-poky-linux/tar/tar-locale-eo: PKGV changed from 1.34 [default] to 1.35 [default]
packages/core2-32-poky-linux/tar/tar-locale-es: PKGSIZE changed from 65237 to 64056 (-2%)
packages/core2-32-poky-linux/tar/tar-locale-es: PV changed from "1.34" to "1.35"
packages/core2-32-poky-linux/tar/tar-locale-es: PKGV changed from 1.34 [default] to 1.35 [default]
packages/core2-32-poky-linux/tar/tar-locale-et: PKGSIZE changed from 59767 to 58742 (-2%)
packages/core2-32-poky-linux/tar/tar-locale-et: PV changed from "1.34" to "1.35"
packages/core2-32-poky-linux/tar/tar-locale-et: PKGV changed from 1.34 [default] to 1.35 [default]
packages/core2-32-poky-linux/tar/tar-locale-eu: PKGSIZE changed from 32368 to 31314 (-3%)
packages/core2-32-poky-linux/tar/tar-locale-eu: PV changed from "1.34" to "1.35"
packages/core2-32-poky-linux/tar/tar-locale-eu: PKGV changed from 1.34 [default] to 1.35 [default]
packages/core2-32-poky-linux/tar/tar-locale-fi: PKGSIZE changed from 57193 to 55692 (-3%)
packages/core2-32-poky-linux/tar/tar-locale-fi: PV changed from "1.34" to "1.35"
packages/core2-32-poky-linux/tar/tar-locale-fi: PKGV changed from 1.34 [default] to 1.35 [default]
packages/core2-32-poky-linux/tar/tar-locale-fr: PKGSIZE changed from 67389 to 65314 (-3%)
packages/core2-32-poky-linux/tar/tar-locale-fr: PV changed from "1.34" to "1.35"
packages/core2-32-poky-linux/tar/tar-locale-fr: PKGV changed from 1.34 [default] to 1.35 [default]
packages/core2-32-poky-linux/tar/tar-locale-ga: PKGSIZE changed from 65812 to 63206 (-4%)
packages/core2-32-poky-linux/tar/tar-locale-ga: PV changed from "1.34" to "1.35"
packages/core2-32-poky-linux/tar/tar-locale-ga: PKGV changed from 1.34 [default] to 1.35 [default]
packages/core2-32-poky-linux/tar/tar-locale-gl: PKGSIZE changed from 10693 to 10288 (-4%)
packages/core2-32-poky-linux/tar/tar-locale-gl: PV changed from "1.34" to "1.35"
packages/core2-32-poky-linux/tar/tar-locale-gl: PKGV changed from 1.34 [default] to 1.35 [default]
packages/core2-32-poky-linux/tar/tar-locale-hr: PKGSIZE changed from 63909 to 62624 (-2%)
packages/core2-32-poky-linux/tar/tar-locale-hr: PV changed from "1.34" to "1.35"
packages/core2-32-poky-linux/tar/tar-locale-hr: PKGV changed from 1.34 [default] to 1.35 [default]
packages/core2-32-poky-linux/tar/tar-locale-hu: PKGSIZE changed from 67032 to 65464 (-2%)
packages/core2-32-poky-linux/tar/tar-locale-hu: PV changed from "1.34" to "1.35"
packages/core2-32-poky-linux/tar/tar-locale-hu: PKGV changed from 1.34 [default] to 1.35 [default]
packages/core2-32-poky-linux/tar/tar-locale-id: PKGSIZE changed from 58343 to 60966 (+4%)
packages/core2-32-poky-linux/tar/tar-locale-id: PV changed from "1.34" to "1.35"
packages/core2-32-poky-linux/tar/tar-locale-id: PKGV changed from 1.34 [default] to 1.35 [default]
packages/core2-32-poky-linux/tar/tar-locale-it: PKGSIZE changed from 63734 to 61806 (-3%)
packages/core2-32-poky-linux/tar/tar-locale-it: PV changed from "1.34" to "1.35"
packages/core2-32-poky-linux/tar/tar-locale-it: PKGV changed from 1.34 [default] to 1.35 [default]
packages/core2-32-poky-linux/tar/tar-locale-ja: PKGSIZE changed from 59218 to 58317 (-2%)
packages/core2-32-poky-linux/tar/tar-locale-ja: PV changed from "1.34" to "1.35"
packages/core2-32-poky-linux/tar/tar-locale-ja: PKGV changed from 1.34 [default] to 1.35 [default]
packages/core2-32-poky-linux/tar/tar-locale-ko: PKGSIZE changed from 66173 to 65165 (-2%)
packages/core2-32-poky-linux/tar/tar-locale-ko: PV changed from "1.34" to "1.35"
packages/core2-32-poky-linux/tar/tar-locale-ko: PKGV changed from 1.34 [default] to 1.35 [default]
packages/core2-32-poky-linux/tar/tar-locale-ky: PKGSIZE changed from 55118 to 53652 (-3%)
packages/core2-32-poky-linux/tar/tar-locale-ky: PV changed from "1.34" to "1.35"
packages/core2-32-poky-linux/tar/tar-locale-ky: PKGV changed from 1.34 [default] to 1.35 [default]
packages/core2-32-poky-linux/tar/tar-locale-ms: PKGSIZE changed from 9658 to 9251 (-4%)
packages/core2-32-poky-linux/tar/tar-locale-ms: PV changed from "1.34" to "1.35"
packages/core2-32-poky-linux/tar/tar-locale-ms: PKGV changed from 1.34 [default] to 1.35 [default]
packages/core2-32-poky-linux/tar/tar-locale-nb: PKGSIZE changed from 60880 to 59064 (-3%)
packages/core2-32-poky-linux/tar/tar-locale-nb: PV changed from "1.34" to "1.35"
packages/core2-32-poky-linux/tar/tar-locale-nb: PKGV changed from 1.34 [default] to 1.35 [default]
packages/core2-32-poky-linux/tar/tar-locale-nl: PKGSIZE changed from 63760 to 62792 (-2%)
packages/core2-32-poky-linux/tar/tar-locale-nl: PV changed from "1.34" to "1.35"
packages/core2-32-poky-linux/tar/tar-locale-nl: PKGV changed from 1.34 [default] to 1.35 [default]
packages/core2-32-poky-linux/tar/tar-locale-pl: PKGSIZE changed from 65132 to 63808 (-2%)
packages/core2-32-poky-linux/tar/tar-locale-pl: PV changed from "1.34" to "1.35"
packages/core2-32-poky-linux/tar/tar-locale-pl: PKGV changed from 1.34 [default] to 1.35 [default]
packages/core2-32-poky-linux/tar/tar-locale-pt-br: PKGSIZE changed from 63982 to 62037 (-3%)
packages/core2-32-poky-linux/tar/tar-locale-pt-br: PV changed from "1.34" to "1.35"
packages/core2-32-poky-linux/tar/tar-locale-pt-br: PKGV changed from 1.34 [default] to 1.35 [default]
packages/core2-32-poky-linux/tar/tar-locale-pt: PKGSIZE changed from 62527 to 60658 (-3%)
packages/core2-32-poky-linux/tar/tar-locale-pt: PV changed from "1.34" to "1.35"
packages/core2-32-poky-linux/tar/tar-locale-pt: PKGV changed from 1.34 [default] to 1.35 [default]
packages/core2-32-poky-linux/tar/tar-locale-ro: PKGSIZE changed from 65028 to 65049 (+0%)
packages/core2-32-poky-linux/tar/tar-locale-ro: PV changed from "1.34" to "1.35"
packages/core2-32-poky-linux/tar/tar-locale-ro: PKGV changed from 1.34 [default] to 1.35 [default]
packages/core2-32-poky-linux/tar/tar-locale-ru: PKGSIZE changed from 83444 to 81715 (-2%)
packages/core2-32-poky-linux/tar/tar-locale-ru: PV changed from "1.34" to "1.35"
packages/core2-32-poky-linux/tar/tar-locale-ru: PKGV changed from 1.34 [default] to 1.35 [default]
packages/core2-32-poky-linux/tar/tar-locale-sk: PKGSIZE changed from 10303 to 9862 (-4%)
packages/core2-32-poky-linux/tar/tar-locale-sk: PV changed from "1.34" to "1.35"
packages/core2-32-poky-linux/tar/tar-locale-sk: PKGV changed from 1.34 [default] to 1.35 [default]
packages/core2-32-poky-linux/tar/tar-locale-sl: PKGSIZE changed from 59520 to 57629 (-3%)
packages/core2-32-poky-linux/tar/tar-locale-sl: PV changed from "1.34" to "1.35"
packages/core2-32-poky-linux/tar/tar-locale-sl: PKGV changed from 1.34 [default] to 1.35 [default]
packages/core2-32-poky-linux/tar/tar-locale-sr: PKGSIZE changed from 82073 to 80284 (-2%)
packages/core2-32-poky-linux/tar/tar-locale-sr: PV changed from "1.34" to "1.35"
packages/core2-32-poky-linux/tar/tar-locale-sr: PKGV changed from 1.34 [default] to 1.35 [default]
packages/core2-32-poky-linux/tar/tar-locale-sv: PKGSIZE changed from 61790 to 60843 (-2%)
packages/core2-32-poky-linux/tar/tar-locale-sv: PV changed from "1.34" to "1.35"
packages/core2-32-poky-linux/tar/tar-locale-sv: PKGV changed from 1.34 [default] to 1.35 [default]
packages/core2-32-poky-linux/tar/tar-locale-tr: PKGSIZE changed from 61110 to 61012 (-0%)
packages/core2-32-poky-linux/tar/tar-locale-tr: PV changed from "1.34" to "1.35"
packages/core2-32-poky-linux/tar/tar-locale-tr: PKGV changed from 1.34 [default] to 1.35 [default]
packages/core2-32-poky-linux/tar/tar-locale-uk: PKGSIZE changed from 84186 to 81231 (-4%)
packages/core2-32-poky-linux/tar/tar-locale-uk: PV changed from "1.34" to "1.35"
packages/core2-32-poky-linux/tar/tar-locale-uk: PKGV changed from 1.34 [default] to 1.35 [default]
packages/core2-32-poky-linux/tar/tar-locale-vi: PKGSIZE changed from 69054 to 68077 (-1%)
packages/core2-32-poky-linux/tar/tar-locale-vi: PV changed from "1.34" to "1.35"
packages/core2-32-poky-linux/tar/tar-locale-vi: PKGV changed from 1.34 [default] to 1.35 [default]
packages/core2-32-poky-linux/tar/tar-locale-zh-cn: PKGSIZE changed from 57717 to 56889 (-1%)
packages/core2-32-poky-linux/tar/tar-locale-zh-cn: PV changed from "1.34" to "1.35"
packages/core2-32-poky-linux/tar/tar-locale-zh-cn: PKGV changed from 1.34 [default] to 1.35 [default]
packages/core2-32-poky-linux/tar/tar-locale-zh-tw: PKGSIZE changed from 58290 to 57419 (-1%)
packages/core2-32-poky-linux/tar/tar-locale-zh-tw: PV changed from "1.34" to "1.35"
packages/core2-32-poky-linux/tar/tar-locale-zh-tw: PKGV changed from 1.34 [default] to 1.35 [default]
packages/core2-32-poky-linux/tar/tar-rmt: PV changed from "1.34" to "1.35"
packages/core2-32-poky-linux/tar/tar-rmt: PKGV changed from 1.34 [default] to 1.35 [default]
packages/core2-32-poky-linux/tar/tar-src: FILELIST: directory renamed /usr/src/debug/tar/1.34-r0/gnu/sys -> /usr/src/debug/tar/1.35-r0/gnu/sys, directory renamed /usr/src/debug/tar/1.34-r0/rmt -> /usr/src/debug/tar/1.35-r0/rmt, directory renamed /usr/src/debug/tar/1.34-r0/src -> /usr/src/debug/tar/1.35-r0/src, removed "/usr/src/debug/tar/1.34-r0/gnu/version-etc.c /usr/src/debug/tar/1.34-r0/gnu/nstrftime.c /usr/src/debug/tar/1.34-r0/gnu/unistd.h /usr/src/debug/tar/1.34-r0/gnu/exclude.h /usr/src/debug/tar/1.34-r0/gnu/version-etc.h /usr/src/debug/tar/1.34-r0/gnu/exclude.c /usr/src/debug/tar/1.34-r0/gnu/fchmodat.c /usr/src/debug/tar/1.34-r0/gnu/xalloc.h /usr/src/debug/tar/1.34-r0/gnu/dup-safer.c /usr/src/debug/tar/1.34-r0/gnu/mbchar.h /usr/src/debug/tar/1.34-r0/gnu/savedir.h /usr/src/debug/tar/1.34-r0/gnu/savedir.c /usr/src/debug/tar/1.34-r0/gnu/mbchar.c /usr/src/debug/tar/1.34-r0/gnu/openat.h /usr/src/debug/tar/1.34-r0/gnu/localcharset.c /usr/src/debug/tar/1.34-r0/gnu/localcharset.h /us
 r/src/debug/tar/1.34-r0/gnu/fcntl-safer.h /usr/src/debug/tar/1.34-r0/gnu/time.h /usr/src/debug/tar/1.34-r0/gnu/idx.h /usr/src/debug/tar/1.34-r0/gnu/regexec.c /usr/src/debug/tar/1.34-r0/gnu/acl.h /usr/src/debug/tar/1.34-r0/gnu/memchr.c /usr/src/debug/tar/1.34-r0/gnu/version-etc-fsf.c /usr/src/debug/tar/1.34-r0/gnu/xasprintf.c /usr/src/debug/tar/1.34-r0/gnu/dirname.c /usr/src/debug/tar/1.34-r0/gnu/argp-fmtstream.h /usr/src/debug/tar/1.34-r0/lib/paxlib.h /usr/src/debug/tar/1.34-r0/gnu/dirname.h /usr/src/debug/tar/1.34-r0/gnu/anytostr.c /usr/src/debug/tar/1.34-r0/gnu/backup-internal.h /usr/src/debug/tar/1.34-r0/gnu/open-safer.c /usr/src/debug/tar/1.34-r0/gnu/argp-fmtstream.c /usr/src/debug/tar/1.34-r0/gnu/hard-locale.h /usr/src/debug/tar/1.34-r0/gnu/string.h /usr/src/debug/tar/1.34-r0/gnu/regcomp.c /usr/src/debug/tar/1.34-r0/gnu/futimens.c /usr/src/debug/tar/1.34-r0/gnu/hard-locale.c /usr/src/debug/tar/1.34-r0/gnu/stripslash.c /usr/src/debug/tar/1.34-r0/gnu/fcntl.c /usr/src/debug/tar/1.
 34-r0/gnu/argp-help.c /usr/src/debug/tar/1.34-r0/gnu/save-cwd.c /usr/src/debug/tar/1.34-r0/gnu/fcntl.h /usr/src/debug/tar/1.34-r0/lib/paxerror.c /usr/src/debug/tar/1.34-r0/gnu/parse-datetime.y /usr/src/debug/tar/1.34-r0/gnu/areadlink.h /usr/src/debug/tar/1.34-r0/gnu/save-cwd.h /usr/src/debug/tar/1.34-r0/lib/xattr-at.h /usr/src/debug/tar/1.34-r0/lib/paxnames.c /usr/src/debug/tar/1.34-r0/gnu/parse-datetime.c /usr/src/debug/tar/1.34-r0/gnu/backup-find.c /usr/src/debug/tar/1.34-r0/gnu/parse-datetime.h /usr/src/debug/tar/1.34-r0/lib/system.h /usr/src/debug/tar/1.34-r0/gnu/mbscasecmp.c /usr/src/debug/tar/1.34-r0/lib/rtapelib.c /usr/src/debug/tar/1.34-r0/gnu/gettime.c /usr/src/debug/tar/1.34-r0/gnu/chdir-long.h /usr/src/debug/tar/1.34-r0/gnu/regex_internal.c /usr/src/debug/tar/1.34-r0/gnu/opendirat.c /usr/src/debug/tar/1.34-r0/gnu/regex_internal.h /usr/src/debug/tar/1.34-r0/gnu/chdir-long.c /usr/src/debug/tar/1.34-r0/gnu/opendirat.h /usr/src/debug/tar/1.34-r0/gnu/safe-write.h /usr/src/debu
 g/tar/1.34-r0/gnu/stat-time.h /usr/src/debug/tar/1.34-r0/gnu/hash.h /usr/src/debug/tar/1.34-r0/gnu/regex.h /usr/src/debug/tar/1.34-r0/gnu/hash.c /usr/src/debug/tar/1.34-r0/gnu/c-ctype.h /usr/src/debug/tar/1.34-r0/gnu/stdopen.h /usr/src/debug/tar/1.34-r0/gnu/c-strcase.h /usr/src/debug/tar/1.34-r0/gnu/stdopen.c /usr/src/debug/tar/1.34-r0/gnu/opendir-safer.c /usr/src/debug/tar/1.34-r0/gnu/closeout.h /usr/src/debug/tar/1.34-r0/gnu/wchar.h /usr/src/debug/tar/1.34-r0/gnu/argp-ba.c /usr/src/debug/tar/1.34-r0/gnu/closeout.c /usr/src/debug/tar/1.34-r0/gnu/fd-safer.c /usr/src/debug/tar/1.34-r0/gnu/xstrndup.h /usr/src/debug/tar/1.34-r0/gnu/c-strcaseeq.h /usr/src/debug/tar/1.34-r0/gnu/file-has-acl.c /usr/src/debug/tar/1.34-r0/gnu/xstrndup.c /usr/src/debug/tar/1.34-r0/gnu/argp-eexst.c /usr/src/debug/tar/1.34-r0/gnu/xvasprintf.c /usr/src/debug/tar/1.34-r0/gnu/sys-limits.h /usr/src/debug/tar/1.34-r0/gnu/openat-priv.h /usr/src/debug/tar/1.34-r0/gnu/xvasprintf.h /usr/src/debug/tar/1.34-r0/gnu/getopt
 1.c /usr/src/debug/tar/1.34-r0/gnu/dirent-safer.h /usr/src/debug/tar/1.34-r0/gnu/xmalloc.c /usr/src/debug/tar/1.34-r0/gnu/openat-proc.c /usr/src/debug/tar/1.34-r0/gnu/quote.h /usr/src/debug/tar/1.34-r0/lib/rmt.h /usr/src/debug/tar/1.34-r0/gnu/fdutimensat.c /usr/src/debug/tar/1.34-r0/gnu/human.c /usr/src/debug/tar/1.34-r0/gnu/argmatch.h /usr/src/debug/tar/1.34-r0/gnu/close-stream.h /usr/src/debug/tar/1.34-r0/gnu/fnmatch.c /usr/src/debug/tar/1.34-r0/gnu/obstack.h /usr/src/debug/tar/1.34-r0/gnu/human.h /usr/src/debug/tar/1.34-r0/gnu/priv-set.h /usr/src/debug/tar/1.34-r0/gnu/progname.h /usr/src/debug/tar/1.34-r0/gnu/at-func.c /usr/src/debug/tar/1.34-r0/gnu/close-stream.c /usr/src/debug/tar/1.34-r0/gnu/argp-pvh.c /usr/src/debug/tar/1.34-r0/gnu/argmatch.c /usr/src/debug/tar/1.34-r0/gnu/fnmatch.h /usr/src/debug/tar/1.34-r0/gnu/obstack.c /usr/src/debug/tar/1.34-r0/gnu/progname.c /usr/src/debug/tar/1.34-r0/gnu/utimens.h /usr/src/debug/tar/1.34-r0/gnu/renameatu.c /usr/src/debug/tar/1.34-r0/gn
 u/xgetcwd.c /usr/src/debug/tar/1.34-r0/lib/paxexit-status.c /usr/src/debug/tar/1.34-r0/gnu/utimens.c /usr/src/debug/tar/1.34-r0/gnu/xgetcwd.h /usr/src/debug/tar/1.34-r0/gnu/renameatu.h /usr/src/debug/tar/1.34-r0/gnu/openat-die.c /usr/src/debug/tar/1.34-r0/gnu/argp-parse.c /usr/src/debug/tar/1.34-r0/gnu/safe-read.c /usr/src/debug/tar/1.34-r0/gnu/inttostr.h /usr/src/debug/tar/1.34-r0/gnu/time-internal.h /usr/src/debug/tar/1.34-r0/gnu/safe-read.h /usr/src/debug/tar/1.34-r0/gnu/error.h /usr/src/debug/tar/1.34-r0/gnu/xsize.h /usr/src/debug/tar/1.34-r0/gnu/quotearg.h /usr/src/debug/tar/1.34-r0/gnu/dirname-lgpl.c /usr/src/debug/tar/1.34-r0/gnu/quotearg.c /usr/src/debug/tar/1.34-r0/gnu/areadlinkat-with-size.c /usr/src/debug/tar/1.34-r0/gnu/time_rz.c /usr/src/debug/tar/1.34-r0/gnu/argp-version-etc.c /usr/src/debug/tar/1.34-r0/gnu/basename.c /usr/src/debug/tar/1.34-r0/gnu/getopt-core.h /usr/src/debug/tar/1.34-r0/gnu/argp-version-etc.h /usr/src/debug/tar/1.34-r0/gnu/argp.h /usr/src/debug/tar/1
 .34-r0/gnu/exitfail.h /usr/src/debug/tar/1.34-r0/gnu/strnlen1.c /usr/src/debug/tar/1.34-r0/gnu/mbuiter.h /usr/src/debug/tar/1.34-r0/gnu/exitfail.c /usr/src/debug/tar/1.34-r0/gnu/openat-safer.c /usr/src/debug/tar/1.34-r0/gnu/strftime.h /usr/src/debug/tar/1.34-r0/gnu/strnlen1.h /usr/src/debug/tar/1.34-r0/gnu/timespec.h /usr/src/debug/tar/1.34-r0/gnu/full-write.h /usr/src/debug/tar/1.34-r0/gnu/full-write.c /usr/src/debug/tar/1.34-r0/gnu/getcwd.c /usr/src/debug/tar/1.34-r0/gnu/argp-pv.c /usr/src/debug/tar/1.34-r0/gnu/backupfile.h /usr/src/debug/tar/1.34-r0/gnu/unistd-safer.h /usr/src/debug/tar/1.34-r0/gnu/acl-errno-valid.c /usr/src/debug/tar/1.34-r0/gnu/backupfile.c /usr/src/debug/tar/1.34-r0/gnu/getopt-ext.h /usr/src/debug/tar/1.34-r0/gnu/getopt_int.h /usr/src/debug/tar/1.34-r0/gnu/bitrotate.h /usr/src/debug/tar/1.34-r0/gnu/xstrtol.c /usr/src/debug/tar/1.34-r0/gnu/xstrtol.h /usr/src/debug/tar/1.34-r0/gnu/xalloc-oversized.h /usr/src/debug/tar/1.34-r0/lib/wordsplit.h /usr/src/debug/tar/1
 .34-r0/gnu/fnmatch_loop.c /usr/src/debug/tar/1.34-r0/gnu/fprintftime.h /usr/src/debug/tar/1.34-r0/gnu/mbrtowc.c /usr/src/debug/tar/1.34-r0/lib/wordsplit.c /usr/src/debug/tar/1.34-r0/gnu/getopt.c /usr/src/debug/tar/1.34-r0/gnu/setlocale_null.c /usr/src/debug/tar/1.34-r0/gnu/basename-lgpl.h /usr/src/debug/tar/1.34-r0/gnu/modechange.h /usr/src/debug/tar/1.34-r0/gnu/setlocale_null.h /usr/src/debug/tar/1.34-r0/gnu/modechange.c /usr/src/debug/tar/1.34-r0/gnu/basename-lgpl.c", added "/usr/src/debug/tar/1.35-r0/gnu/version-etc.c /usr/src/debug/tar/1.35-r0/gnu/nstrftime.c /usr/src/debug/tar/1.35-r0/gnu/strtol.c /usr/src/debug/tar/1.35-r0/gnu/unistd.h /usr/src/debug/tar/1.35-r0/gnu/fopen.c /usr/src/debug/tar/1.35-r0/gnu/exclude.h /usr/src/debug/tar/1.35-r0/gnu/version-etc.h /usr/src/debug/tar/1.35-r0/gnu/exclude.c /usr/src/debug/tar/1.35-r0/gnu/fchmodat.c /usr/src/debug/tar/1.35-r0/gnu/ialloc.h /usr/src/debug/tar/1.35-r0/gnu/xalloc.h /usr/src/debug/tar/1.35-r0/gnu/dup-safer.c /usr/src/debug/t
 ar/1.35-r0/gnu/mbchar.h /usr/src/debug/tar/1.35-r0/gnu/savedir.h /usr/src/debug/tar/1.35-r0/gnu/savedir.c /usr/src/debug/tar/1.35-r0/gnu/mbchar.c /usr/src/debug/tar/1.35-r0/gnu/full-read.h /usr/src/debug/tar/1.35-r0/gnu/openat.h /usr/src/debug/tar/1.35-r0/gnu/localcharset.c /usr/src/debug/tar/1.35-r0/gnu/localcharset.h /usr/src/debug/tar/1.35-r0/gnu/fcntl-safer.h /usr/src/debug/tar/1.35-r0/gnu/time.h /usr/src/debug/tar/1.35-r0/gnu/idx.h /usr/src/debug/tar/1.35-r0/gnu/regexec.c /usr/src/debug/tar/1.35-r0/gnu/acl.h /usr/src/debug/tar/1.35-r0/gnu/memchr.c /usr/src/debug/tar/1.35-r0/gnu/malloc/dynarray_resize.c /usr/src/debug/tar/1.35-r0/gnu/mbrtoc32.c /usr/src/debug/tar/1.35-r0/gnu/version-etc-fsf.c /usr/src/debug/tar/1.35-r0/gnu/dirname.c /usr/src/debug/tar/1.35-r0/gnu/argp-fmtstream.h /usr/src/debug/tar/1.35-r0/lib/paxlib.h /usr/src/debug/tar/1.35-r0/gnu/dirname.h /usr/src/debug/tar/1.35-r0/gnu/anytostr.c /usr/src/debug/tar/1.35-r0/gnu/backup-internal.h /usr/src/debug/tar/1.35-r0/gnu
 /open-safer.c /usr/src/debug/tar/1.35-r0/gnu/argp-fmtstream.c /usr/src/debug/tar/1.35-r0/gnu/hard-locale.h /usr/src/debug/tar/1.35-r0/gnu/string.h /usr/src/debug/tar/1.35-r0/gnu/regcomp.c /usr/src/debug/tar/1.35-r0/gnu/futimens.c /usr/src/debug/tar/1.35-r0/gnu/hard-locale.c /usr/src/debug/tar/1.35-r0/gnu/stripslash.c /usr/src/debug/tar/1.35-r0/gnu/fcntl.c /usr/src/debug/tar/1.35-r0/gnu/argp-help.c /usr/src/debug/tar/1.35-r0/gnu/save-cwd.c /usr/src/debug/tar/1.35-r0/gnu/fcntl.h /usr/src/debug/tar/1.35-r0/lib/paxerror.c /usr/src/debug/tar/1.35-r0/gnu/parse-datetime.y /usr/src/debug/tar/1.35-r0/gnu/areadlink.h /usr/src/debug/tar/1.35-r0/gnu/save-cwd.h /usr/src/debug/tar/1.35-r0/lib/paxnames.c /usr/src/debug/tar/1.35-r0/lib/xattr-at.h /usr/src/debug/tar/1.35-r0/gnu/parse-datetime.c /usr/src/debug/tar/1.35-r0/gnu/backup-find.c /usr/src/debug/tar/1.35-r0/gnu/parse-datetime.h /usr/src/debug/tar/1.35-r0/gnu/malloc/dynarray-skeleton.c /usr/src/debug/tar/1.35-r0/gnu/mbscasecmp.c /usr/src/debu
 g/tar/1.35-r0/lib/rtapelib.c /usr/src/debug/tar/1.35-r0/gnu/fseeko.c /usr/src/debug/tar/1.35-r0/gnu/gettime.c /usr/src/debug/tar/1.35-r0/gnu/chdir-long.h /usr/src/debug/tar/1.35-r0/gnu/regex_internal.c /usr/src/debug/tar/1.35-r0/gnu/opendirat.c /usr/src/debug/tar/1.35-r0/gnu/regex_internal.h /usr/src/debug/tar/1.35-r0/gnu/chdir-long.c /usr/src/debug/tar/1.35-r0/gnu/opendirat.h /usr/src/debug/tar/1.35-r0/gnu/safe-write.h /usr/src/debug/tar/1.35-r0/gnu/stat-time.h /usr/src/debug/tar/1.35-r0/gnu/hash.h /usr/src/debug/tar/1.35-r0/gnu/regex.h /usr/src/debug/tar/1.35-r0/gnu/hash.c /usr/src/debug/tar/1.35-r0/gnu/c-ctype.h /usr/src/debug/tar/1.35-r0/gnu/stdopen.h /usr/src/debug/tar/1.35-r0/gnu/stdlib.h /usr/src/debug/tar/1.35-r0/gnu/c-strcase.h /usr/src/debug/tar/1.35-r0/gnu/stdopen.c /usr/src/debug/tar/1.35-r0/gnu/opendir-safer.c /usr/src/debug/tar/1.35-r0/gnu/closeout.h /usr/src/debug/tar/1.35-r0/gnu/uchar.h /usr/src/debug/tar/1.35-r0/gnu/wchar.h /usr/src/debug/tar/1.35-r0/gnu/argp-ba.c /
 usr/src/debug/tar/1.35-r0/gnu/closeout.c /usr/src/debug/tar/1.35-r0/gnu/fd-safer.c /usr/src/debug/tar/1.35-r0/gnu/c-strcaseeq.h /usr/src/debug/tar/1.35-r0/gnu/file-has-acl.c /usr/src/debug/tar/1.35-r0/gnu/argp-eexst.c /usr/src/debug/tar/1.35-r0/gnu/xvasprintf.c /usr/src/debug/tar/1.35-r0/gnu/sys-limits.h /usr/src/debug/tar/1.35-r0/gnu/openat-priv.h /usr/src/debug/tar/1.35-r0/gnu/xvasprintf.h /usr/src/debug/tar/1.35-r0/gnu/getopt1.c /usr/src/debug/tar/1.35-r0/gnu/dirent-safer.h /usr/src/debug/tar/1.35-r0/gnu/xmalloc.c /usr/src/debug/tar/1.35-r0/gnu/openat-proc.c /usr/src/debug/tar/1.35-r0/gnu/quote.h /usr/src/debug/tar/1.35-r0/lib/rmt.h /usr/src/debug/tar/1.35-r0/gnu/fdutimensat.c /usr/src/debug/tar/1.35-r0/gnu/human.c /usr/src/debug/tar/1.35-r0/gnu/argmatch.h /usr/src/debug/tar/1.35-r0/gnu/close-stream.h /usr/src/debug/tar/1.35-r0/gnu/fnmatch.c /usr/src/debug/tar/1.35-r0/gnu/obstack.h /usr/src/debug/tar/1.35-r0/gnu/human.h /usr/src/debug/tar/1.35-r0/gnu/priv-set.h /usr/src/debug/tar
 /1.35-r0/gnu/progname.h /usr/src/debug/tar/1.35-r0/gnu/at-func.c /usr/src/debug/tar/1.35-r0/gnu/close-stream.c /usr/src/debug/tar/1.35-r0/gnu/argp-pvh.c /usr/src/debug/tar/1.35-r0/gnu/argmatch.c /usr/src/debug/tar/1.35-r0/gnu/fnmatch.h /usr/src/debug/tar/1.35-r0/gnu/obstack.c /usr/src/debug/tar/1.35-r0/gnu/progname.c /usr/src/debug/tar/1.35-r0/gnu/utimens.h /usr/src/debug/tar/1.35-r0/gnu/renameatu.c /usr/src/debug/tar/1.35-r0/gnu/xgetcwd.c /usr/src/debug/tar/1.35-r0/lib/paxexit-status.c /usr/src/debug/tar/1.35-r0/gnu/utimens.c /usr/src/debug/tar/1.35-r0/gnu/xgetcwd.h /usr/src/debug/tar/1.35-r0/gnu/mbsrtowcs-impl.h /usr/src/debug/tar/1.35-r0/gnu/renameatu.h /usr/src/debug/tar/1.35-r0/gnu/openat-die.c /usr/src/debug/tar/1.35-r0/gnu/argp-parse.c /usr/src/debug/tar/1.35-r0/gnu/safe-read.c /usr/src/debug/tar/1.35-r0/gnu/inttostr.h /usr/src/debug/tar/1.35-r0/gnu/time-internal.h /usr/src/debug/tar/1.35-r0/gnu/safe-read.h /usr/src/debug/tar/1.35-r0/gnu/xsize.h /usr/src/debug/tar/1.35-r0/gnu
 /quotearg.h /usr/src/debug/tar/1.35-r0/gnu/dirname-lgpl.c /usr/src/debug/tar/1.35-r0/gnu/quotearg.c /usr/src/debug/tar/1.35-r0/gnu/malloc/dynarray.h /usr/src/debug/tar/1.35-r0/gnu/areadlinkat-with-size.c /usr/src/debug/tar/1.35-r0/gnu/time_rz.c /usr/src/debug/tar/1.35-r0/gnu/dirent.h /usr/src/debug/tar/1.35-r0/gnu/argp-version-etc.c /usr/src/debug/tar/1.35-r0/gnu/mbsrtowcs-state.c /usr/src/debug/tar/1.35-r0/gnu/basename.c /usr/src/debug/tar/1.35-r0/gnu/getopt-core.h /usr/src/debug/tar/1.35-r0/gnu/argp-version-etc.h /usr/src/debug/tar/1.35-r0/gnu/argp.h /usr/src/debug/tar/1.35-r0/gnu/mbsrtowcs.c /usr/src/debug/tar/1.35-r0/gnu/exitfail.h /usr/src/debug/tar/1.35-r0/gnu/strnlen1.c /usr/src/debug/tar/1.35-r0/gnu/mbuiter.h /usr/src/debug/tar/1.35-r0/gnu/exitfail.c /usr/src/debug/tar/1.35-r0/gnu/openat-safer.c /usr/src/debug/tar/1.35-r0/gnu/strftime.h /usr/src/debug/tar/1.35-r0/gnu/strnlen1.h /usr/src/debug/tar/1.35-r0/gnu/timespec.h /usr/src/debug/tar/1.35-r0/gnu/full-write.h /usr/src/deb
 ug/tar/1.35-r0/gnu/btowc.c /usr/src/debug/tar/1.35-r0/gnu/full-write.c /usr/src/debug/tar/1.35-r0/gnu/getcwd.c /usr/src/debug/tar/1.35-r0/gnu/argp-pv.c /usr/src/debug/tar/1.35-r0/gnu/backupfile.h /usr/src/debug/tar/1.35-r0/gnu/unistd-safer.h /usr/src/debug/tar/1.35-r0/gnu/acl-errno-valid.c /usr/src/debug/tar/1.35-r0/gnu/backupfile.c /usr/src/debug/tar/1.35-r0/gnu/getopt-ext.h /usr/src/debug/tar/1.35-r0/gnu/getopt_int.h /usr/src/debug/tar/1.35-r0/gnu/bitrotate.h /usr/src/debug/tar/1.35-r0/gnu/xstrtol.c /usr/src/debug/tar/1.35-r0/gnu/stdio.h /usr/src/debug/tar/1.35-r0/gnu/xstrtol.h /usr/src/debug/tar/1.35-r0/lib/wordsplit.h /usr/src/debug/tar/1.35-r0/gnu/fnmatch_loop.c /usr/src/debug/tar/1.35-r0/gnu/fprintftime.h /usr/src/debug/tar/1.35-r0/gnu/mbrtowc.c /usr/src/debug/tar/1.35-r0/lib/wordsplit.c /usr/src/debug/tar/1.35-r0/gnu/getopt.c /usr/src/debug/tar/1.35-r0/gnu/setlocale_null.c /usr/src/debug/tar/1.35-r0/gnu/basename-lgpl.h /usr/src/debug/tar/1.35-r0/gnu/modechange.h /usr/src/debu
 g/tar/1.35-r0/gnu/setlocale_null.h /usr/src/debug/tar/1.35-r0/gnu/modechange.c /usr/src/debug/tar/1.35-r0/gnu/basename-lgpl.c"
packages/core2-32-poky-linux/tar/tar-src: PKGSIZE changed from 2659496 to 2994363 (+13%)
packages/core2-32-poky-linux/tar/tar-src: PV changed from "1.34" to "1.35"
packages/core2-32-poky-linux/tar/tar-src: PKGV changed from 1.34 [default] to 1.35 [default]
packages/core2-32-poky-linux/tar/tar-staticdev: PV changed from "1.34" to "1.35"
packages/core2-32-poky-linux/tar/tar-staticdev: PKGV changed from 1.34 [default] to 1.35 [default]
packages/core2-32-poky-linux/tar/tar: PKGSIZE changed from 622143 to 605755 (-3%)
packages/core2-32-poky-linux/tar/tar: PV changed from "1.34" to "1.35"
packages/core2-32-poky-linux/tar/tar: PKGV changed from 1.34 [default] to 1.35 [default]

--===============6254717982371296775==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="0001-tar-upgrade-1.34-1.35.patch"

RnJvbSBiMjZkMzIxZjM4YTQ4MjUxZDYzYzQ5MjM3Nzg1ZDk0YTQ3YTRlNDYwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTYgQXVnIDIwMjMgMDk6MDU6NTggKzAwMDAKU3ViamVjdDogW1BBVENIXSB0
YXI6IHVwZ3JhZGUgMS4zNCAtPiAxLjM1CgotLS0KIC4uLi90YXIvdGFyL0NWRS0yMDIyLTQ4MzAz
LnBhdGNoICAgICAgICAgICAgICB8IDQzIC0tLS0tLS0tLS0tLS0tLQogLi4uL3Rhci97dGFyXzEu
MzQuYmIgPT4gdGFyXzEuMzUuYmJ9ICAgICAgICAgIHwgNTMgKysrKysrKysrKysrKysrKystLQog
MiBmaWxlcyBjaGFuZ2VkLCA0OCBpbnNlcnRpb25zKCspLCA0OCBkZWxldGlvbnMoLSkKIGRlbGV0
ZSBtb2RlIDEwMDY0NCBtZXRhL3JlY2lwZXMtZXh0ZW5kZWQvdGFyL3Rhci9DVkUtMjAyMi00ODMw
My5wYXRjaAogcmVuYW1lIG1ldGEvcmVjaXBlcy1leHRlbmRlZC90YXIve3Rhcl8xLjM0LmJiID0+
IHRhcl8xLjM1LmJifSAoNDUlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC90
YXIvdGFyL0NWRS0yMDIyLTQ4MzAzLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3Rhci90
YXIvQ1ZFLTIwMjItNDgzMDMucGF0Y2gKZGVsZXRlZCBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IGIy
ZjQwZjNlNjQuLjAwMDAwMDAwMDAKLS0tIGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3Rhci90YXIv
Q1ZFLTIwMjItNDgzMDMucGF0Y2gKKysrIC9kZXYvbnVsbApAQCAtMSw0MyArMCwwIEBACi1Gcm9t
IDNkYTc4NDAwZWFmY2NjYjk3ZTJmMmZkNGIyMjdlYTQwZDc5NGVkZTggTW9uIFNlcCAxNyAwMDow
MDowMCAyMDAxCi1Gcm9tOiBTZXJnZXkgUG96bnlha29mZiA8Z3JheUBnbnUub3JnPgotRGF0ZTog
U2F0LCAxMSBGZWIgMjAyMyAxMTo1NzozOSArMDIwMAotU3ViamVjdDogRml4IGJvdW5kYXJ5IGNo
ZWNraW5nIGluIGJhc2UtMjU2IGRlY29kZXIKLQotKiBzcmMvbGlzdC5jIChmcm9tX2hlYWRlcik6
IEJhc2UtMjU2IGVuY29kaW5nIGlzIGF0IGxlYXN0IDIgYnl0ZXMKLWxvbmcuCi0KLVVwc3RyZWFt
LVN0YXR1czogQmFja3BvcnQgW3NlZSByZWZlcmVuY2UgYmVsb3ddCi1DVkU6IENWRS0yMDIyLTQ4
MzAzCi0KLVJlZmVyZW5jZSB0byB1cHN0cmVhbSBwYXRjaDoKLWh0dHBzOi8vc2F2YW5uYWguZ251
Lm9yZy9idWdzLz82MjM4NwotaHR0cHM6Ly9naXQuc2F2YW5uYWguZ251Lm9yZy9jZ2l0L3Rhci5n
aXQvcGF0Y2gvc3JjL2xpc3QuYz9pZD0zZGE3ODQwMGVhZmNjY2I5N2UyZjJmZDRiMjI3ZWE0MGQ3
OTRlZGU4Ci0KLVNpZ25lZC1vZmYtYnk6IFJvZG9sZm8gUXVlc2FkYSBadW1iYWRvIDxyb2RvbGZv
Lnp1bWJhZG9Ad2luZHJpdmVyLmNvbT4KLVNpZ25lZC1vZmYtYnk6IEpvZSBTbGF0ZXIgPGpvZS5z
bGF0ZXJAd2luZHJpdmVyLmNvbT4KLS0tLQotIHNyYy9saXN0LmMgfCA1ICsrKy0tCi0gMSBmaWxl
IGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSlTaWduZWQtb2ZmLWJ5OiBS
b2RvbGZvIFF1ZXNhZGEgWnVtYmFkbyA8cm9kb2xmby56dW1iYWRvQHdpbmRyaXZlci5jb20+Ci0K
LQotKGxpbWl0ZWQgdG8gJ3NyYy9saXN0LmMnKQotCi1kaWZmIC0tZ2l0IGEvc3JjL2xpc3QuYyBi
L3NyYy9saXN0LmMKLWluZGV4IDlmYWZjNDIuLjg2YmNmZGQgMTAwNjQ0Ci0tLS0gYS9zcmMvbGlz
dC5jCi0rKysgYi9zcmMvbGlzdC5jCi1AQCAtODgxLDggKzg4MSw5IEBAIGZyb21faGVhZGVyIChj
aGFyIGNvbnN0ICp3aGVyZTAsIHNpemVfdCBkaWdzLCBjaGFyIGNvbnN0ICp0eXBlLAotIAkgIHdo
ZXJlKys7Ci0gCX0KLSAgICAgfQotLSAgZWxzZSBpZiAoKndoZXJlID09ICdcMjAwJyAvKiBwb3Np
dGl2ZSBiYXNlLTI1NiAqLwotLQkgICB8fCAqd2hlcmUgPT0gJ1wzNzcnIC8qIG5lZ2F0aXZlIGJh
c2UtMjU2ICovKQotKyAgZWxzZSBpZiAod2hlcmUgPD0gbGltIC0gMgotKwkgICAmJiAoKndoZXJl
ID09ICdcMjAwJyAvKiBwb3NpdGl2ZSBiYXNlLTI1NiAqLwotKwkgICAgICAgfHwgKndoZXJlID09
ICdcMzc3JyAvKiBuZWdhdGl2ZSBiYXNlLTI1NiAqLykpCi0gICAgIHsKLSAgICAgICAvKiBQYXJz
ZSBiYXNlLTI1NiBvdXRwdXQuICBBIG5vbm5lZ2F0aXZlIG51bWJlciBOIGlzCi0gCSByZXByZXNl
bnRlZCBhcyAoMjU2KipESUdTKS8yICsgTjsgYSBuZWdhdGl2ZSBudW1iZXIgLU4gaXMKLS0tIAot
Y2dpdCB2MS4xCi0KZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC90YXIvdGFyXzEu
MzQuYmIgYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvdGFyL3Rhcl8xLjM1LmJiCnNpbWlsYXJpdHkg
aW5kZXggNDUlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1leHRlbmRlZC90YXIvdGFyXzEuMzQu
YmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1leHRlbmRlZC90YXIvdGFyXzEuMzUuYmIKaW5kZXgg
MWVmNWZlMjIxZS4uNDZiOWM5MjU0MyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVk
L3Rhci90YXJfMS4zNC5iYgorKysgYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvdGFyL3Rhcl8xLjM1
LmJiCkBAIC0xLDE2ICsxLDU5IEBACisjIEZJWE1FOiB0aGUgTElDX0ZJTEVTX0NIS1NVTSB2YWx1
ZXMgaGF2ZSBiZWVuIHVwZGF0ZWQgYnkgJ2RldnRvb2wgdXBncmFkZScuCisjIFRoZSBmb2xsb3dp
bmcgaXMgdGhlIGRpZmZlcmVuY2UgYmV0d2VlbiB0aGUgb2xkIGFuZCB0aGUgbmV3IGxpY2Vuc2Ug
dGV4dC4KKyMgUGxlYXNlIHVwZGF0ZSB0aGUgTElDRU5TRSB2YWx1ZSBpZiBuZWVkZWQsIGFuZCBz
dW1tYXJpemUgdGhlIGNoYW5nZXMgaW4KKyMgdGhlIGNvbW1pdCBtZXNzYWdlIHZpYSAnTGljZW5z
ZS1VcGRhdGU6JyB0YWcuCisjIChleGFtcGxlOiAnTGljZW5zZS1VcGRhdGU6IGNvcHlyaWdodCB5
ZWFycyB1cGRhdGVkLicpCisjCisjIFRoZSBjaGFuZ2VzOgorIworIyAtLS0gQ09QWUlORworIyAr
KysgQ09QWUlORworIyBAQCAtMSw3ICsxLDcgQEAKKyMgICAgICAgICAgICAgICAgICAgICAgR05V
IEdFTkVSQUwgUFVCTElDIExJQ0VOU0UKKyMgICAgICAgICAgICAgICAgICAgICAgICAgVmVyc2lv
biAzLCAyOSBKdW5lIDIwMDcKKyMgIAorIyAtIENvcHlyaWdodCAoQykgMjAwNyBGcmVlIFNvZnR3
YXJlIEZvdW5kYXRpb24sIEluYy4gPGh0dHA6Ly9mc2Yub3JnLz4KKyMgKyBDb3B5cmlnaHQgKEMp
IDIwMDcgRnJlZSBTb2Z0d2FyZSBGb3VuZGF0aW9uLCBJbmMuIDxodHRwczovL2ZzZi5vcmcvPgor
IyAgIEV2ZXJ5b25lIGlzIHBlcm1pdHRlZCB0byBjb3B5IGFuZCBkaXN0cmlidXRlIHZlcmJhdGlt
IGNvcGllcworIyAgIG9mIHRoaXMgbGljZW5zZSBkb2N1bWVudCwgYnV0IGNoYW5naW5nIGl0IGlz
IG5vdCBhbGxvd2VkLgorIyAgCisjIEBAIC02NDUsNyArNjQ1LDcgQEAKKyMgICAgICBHTlUgR2Vu
ZXJhbCBQdWJsaWMgTGljZW5zZSBmb3IgbW9yZSBkZXRhaWxzLgorIyAgCisjICAgICAgWW91IHNo
b3VsZCBoYXZlIHJlY2VpdmVkIGEgY29weSBvZiB0aGUgR05VIEdlbmVyYWwgUHVibGljIExpY2Vu
c2UKKyMgLSAgICBhbG9uZyB3aXRoIHRoaXMgcHJvZ3JhbS4gIElmIG5vdCwgc2VlIDxodHRwOi8v
d3d3LmdudS5vcmcvbGljZW5zZXMvPi4KKyMgKyAgICBhbG9uZyB3aXRoIHRoaXMgcHJvZ3JhbS4g
IElmIG5vdCwgc2VlIDxodHRwczovL3d3dy5nbnUub3JnL2xpY2Vuc2VzLz4uCisjICAKKyMgIEFs
c28gYWRkIGluZm9ybWF0aW9uIG9uIGhvdyB0byBjb250YWN0IHlvdSBieSBlbGVjdHJvbmljIGFu
ZCBwYXBlciBtYWlsLgorIyAgCisjIEBAIC02NjQsMTEgKzY2NCwxMSBAQAorIyAgICBZb3Ugc2hv
dWxkIGFsc28gZ2V0IHlvdXIgZW1wbG95ZXIgKGlmIHlvdSB3b3JrIGFzIGEgcHJvZ3JhbW1lcikg
b3Igc2Nob29sLAorIyAgaWYgYW55LCB0byBzaWduIGEgImNvcHlyaWdodCBkaXNjbGFpbWVyIiBm
b3IgdGhlIHByb2dyYW0sIGlmIG5lY2Vzc2FyeS4KKyMgIEZvciBtb3JlIGluZm9ybWF0aW9uIG9u
IHRoaXMsIGFuZCBob3cgdG8gYXBwbHkgYW5kIGZvbGxvdyB0aGUgR05VIEdQTCwgc2VlCisjIC08
aHR0cDovL3d3dy5nbnUub3JnL2xpY2Vuc2VzLz4uCisjICs8aHR0cHM6Ly93d3cuZ251Lm9yZy9s
aWNlbnNlcy8+LgorIyAgCisjICAgIFRoZSBHTlUgR2VuZXJhbCBQdWJsaWMgTGljZW5zZSBkb2Vz
IG5vdCBwZXJtaXQgaW5jb3Jwb3JhdGluZyB5b3VyIHByb2dyYW0KKyMgIGludG8gcHJvcHJpZXRh
cnkgcHJvZ3JhbXMuICBJZiB5b3VyIHByb2dyYW0gaXMgYSBzdWJyb3V0aW5lIGxpYnJhcnksIHlv
dQorIyAgbWF5IGNvbnNpZGVyIGl0IG1vcmUgdXNlZnVsIHRvIHBlcm1pdCBsaW5raW5nIHByb3By
aWV0YXJ5IGFwcGxpY2F0aW9ucyB3aXRoCisjICB0aGUgbGlicmFyeS4gIElmIHRoaXMgaXMgd2hh
dCB5b3Ugd2FudCB0byBkbywgdXNlIHRoZSBHTlUgTGVzc2VyIEdlbmVyYWwKKyMgIFB1YmxpYyBM
aWNlbnNlIGluc3RlYWQgb2YgdGhpcyBMaWNlbnNlLiAgQnV0IGZpcnN0LCBwbGVhc2UgcmVhZAor
IyAtPGh0dHA6Ly93d3cuZ251Lm9yZy9waGlsb3NvcGh5L3doeS1ub3QtbGdwbC5odG1sPi4KKyMg
KzxodHRwczovL3d3dy5nbnUub3JnL2xpY2Vuc2VzL3doeS1ub3QtbGdwbC5odG1sPi4KKyMgCisj
CisKIFNVTU1BUlkgPSAiR05VIGZpbGUgYXJjaGl2aW5nIHByb2dyYW0iCiBERVNDUklQVElPTiA9
ICJHTlUgdGFyIHNhdmVzIG1hbnkgZmlsZXMgdG9nZXRoZXIgaW50byBhIHNpbmdsZSB0YXBlIFwK
IG9yIGRpc2sgYXJjaGl2ZSwgYW5kIGNhbiByZXN0b3JlIGluZGl2aWR1YWwgZmlsZXMgZnJvbSB0
aGUgYXJjaGl2ZS4iCiBIT01FUEFHRSA9ICJodHRwOi8vd3d3LmdudS5vcmcvc29mdHdhcmUvdGFy
LyIKIFNFQ1RJT04gPSAiYmFzZSIKIExJQ0VOU0UgPSAiR1BMLTMuMC1vbmx5IgotTElDX0ZJTEVT
X0NIS1NVTSA9ICJmaWxlOi8vQ09QWUlORzttZDU9ZDMyMjM5YmNiNjczNDYzYWI4NzRlODBkNDdm
YWU1MDQiCitMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9DT1BZSU5HO21kNT0xZWJiZDNlMzQy
MzdhZjI2ZGE1ZGMwOGE0ZTQ0MDQ2NCIKIAotU1JDX1VSSSA9ICIke0dOVV9NSVJST1J9L3Rhci90
YXItJHtQVn0udGFyLmJ6MiBcCi0gICAgICAgICAgIGZpbGU6Ly9DVkUtMjAyMi00ODMwMy5wYXRj
aCBcCi0iCitTUkNfVVJJID0gIiR7R05VX01JUlJPUn0vdGFyL3Rhci0ke1BWfS50YXIuYnoyIgog
Ci1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiYjQ0Y2M2N2Y4YTFmNmIwMjUwYjdjODYwZTk1MmIzN2U4
ZWQ5MzJhOTBiZDliMTg2MmE1MTEwNzkyNTU2NDZmZiIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICI3
ZWRiODg4NmEzZGM2OTQyMGExNDQ2ZTFlMmQwNjE5MjJiNjQyZjFjZjYzMmQyY2QwZjllZTdlNjkw
Nzc1OTg1IgogCiBpbmhlcml0IGF1dG90b29scyBnZXR0ZXh0IHRleGluZm8KIAotLSAKMi4zOS4y
Cgo=

--===============6254717982371296775==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/tar: PACKAGES: added "tar-locale-ka"
packages/core2-32-poky-linux/tar/tar-doc: FILELIST: added "/usr/share/info/tar.info-3"
packages/core2-32-poky-linux/tar/tar-src: PKGSIZE changed from 2659496 to 2994363 (+13%)

--===============6254717982371296775==--

