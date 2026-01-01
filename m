Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62098EEB58E
	for <webhook@archiver.kernel.org>; Thu,  1 Jan 2026 11:37:59 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.102972.1767267475144214666
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Jan 2026 03:37:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=ARolH4JC;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=ZJD7DiGK;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101019b7959a862-cfa16c43-d76f-4800-9c62-b4b88c60efa7-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1767267477;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=jUQAOF1DqIhSf0tyEskEQo4ltwfNWikY1UzAlbKJX6s=;
	b=ARolH4JCeawht8YkSmlV5h9XPEl5NZRe9o9hEdM4uvogJLbi35gxB1QUgonfnG99
	ioTSdxIvNuqKrW5TaV5RK76E02HfufWAYim6vD//Elw4EFTIZeh8IRelfh8MEzCTi+4
	kYfSCSX06TfedZlC+tzFTrwj9OyEZFKmrRrDSETc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1767267477;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=jUQAOF1DqIhSf0tyEskEQo4ltwfNWikY1UzAlbKJX6s=;
	b=ZJD7DiGKhcOpYURn2OuwqmIQe3RqxA3whSlUl1MzAFY/Xt7FFYf9aO7O70BdGMwC
	6DJiXNFzSCrtrVapJFGYEumBs4ofo1UVdc4ECH/kuuOvETJICgxEaZ1CWNlEgZ7A3lz
	iIakS4ctcZX+ANRFgnLK4LIuXFhKnN+RoIRCgJHM=
Content-Type: multipart/mixed; boundary="===============0796662082399546012=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Denys Dmytriyenko <denis@denix.org>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] xz: upgrading to 5.8.2 SUCCEEDED
Message-ID: <0101019b7959a862-cfa16c43-d76f-4800-9c62-b4b88c60efa7-000000@us-west-2.amazonses.com>
Date: Thu, 1 Jan 2026 11:37:57 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.01.01-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Jan 2026 11:37:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228787

--===============0796662082399546012==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *xz* to *5.8.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-xz-upgrade-5.8.1-5.8.2.patch
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
From 8c84ac9c2d18f47a1f0cdcf9c7f611dbcf7bf374 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 1 Jan 2026 09:16:35 +0000
Subject: [PATCH] xz: upgrade 5.8.1 -> 5.8.2

---
 .../xz/{xz_5.8.1.bb => xz_5.8.2.bb}           | 80 ++++++++++++++++++-
 1 file changed, 77 insertions(+), 3 deletions(-)
 rename meta/recipes-extended/xz/{xz_5.8.1.bb => xz_5.8.2.bb} (47%)

diff --git a/meta/recipes-extended/xz/xz_5.8.1.bb b/meta/recipes-extended/xz/xz_5.8.2.bb
similarity index 47%
rename from meta/recipes-extended/xz/xz_5.8.1.bb
rename to meta/recipes-extended/xz/xz_5.8.2.bb
index 406ecbbec4..cab0bc9caf 100644
--- a/meta/recipes-extended/xz/xz_5.8.1.bb
+++ b/meta/recipes-extended/xz/xz_5.8.2.bb
@@ -1,3 +1,77 @@
+# FIXME: the LIC_FILES_CHKSUM values have been updated by 'devtool upgrade'.
+# The following is the difference between the old and the new license text.
+# Please update the LICENSE value if needed, and summarize the changes in
+# the commit message via 'License-Update:' tag.
+# (example: 'License-Update: copyright years updated.')
+#
+# The changes:
+#
+# --- COPYING.GPLv2
+# +++ COPYING.GPLv2
+# @@ -2,7 +2,7 @@
+#                         Version 2, June 1991
+#  
+#   Copyright (C) 1989, 1991 Free Software Foundation, Inc.,
+# - 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
+# + <https://fsf.org/>
+#   Everyone is permitted to copy and distribute verbatim copies
+#   of this license document, but changing it is not allowed.
+#  
+# @@ -304,8 +304,7 @@
+#      GNU General Public License for more details.
+#  
+#      You should have received a copy of the GNU General Public License along
+# -    with this program; if not, write to the Free Software Foundation, Inc.,
+# -    51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
+# +    with this program; if not, see <https://www.gnu.org/licenses/>.
+#  
+#  Also add information on how to contact you by electronic and paper mail.
+#  
+# @@ -329,8 +328,8 @@
+#    Yoyodyne, Inc., hereby disclaims all copyright interest in the program
+#    `Gnomovision' (which makes passes at compilers) written by James Hacker.
+#  
+# -  <signature of Ty Coon>, 1 April 1989
+# -  Ty Coon, President of Vice
+# +  <signature of Moe Ghoul>, 1 April 1989
+# +  Moe Ghoul, President of Vice
+#  
+#  This General Public License does not permit incorporating your program into
+#  proprietary programs.  If your program is a subroutine library, you may
+# --- COPYING.LGPLv2.1
+# +++ COPYING.LGPLv2.1
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
 SUMMARY = "Utilities for managing LZMA compressed files"
 HOMEPAGE = "https://tukaani.org/xz/"
 DESCRIPTION = "XZ Utils is free general-purpose data compression software with a high compression ratio. XZ Utils were written for POSIX-like systems, but also work on some not-so-POSIX systems. XZ Utils are the successor to LZMA Utils."
@@ -19,16 +93,16 @@ LICENSE:liblzma = "0BSD"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=d38d562f6112174de93a9677682231b2 \
                     file://COPYING.0BSD;md5=0672c210ce80c83444339b9aa31fee2f \
-                    file://COPYING.GPLv2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
+                    file://COPYING.GPLv2;md5=570a9b3749dd0463a1778803b12a6dce \
                     file://COPYING.GPLv3;md5=1ebbd3e34237af26da5dc08a4e440464 \
-                    file://COPYING.LGPLv2.1;md5=4fbd65380cdd255951079008b364516c \
+                    file://COPYING.LGPLv2.1;md5=4bf661c1e3793e55c8d1051bc5e0ae21 \
                     file://lib/getopt.c;endline=23;md5=3f33e207287bf72834f3ae8c247dfb6a \
                     "
 
 SRC_URI = "https://github.com/tukaani-project/xz/releases/download/v${PV}/xz-${PV}.tar.gz \
            file://run-ptest \
           "
-SRC_URI[sha256sum] = "507825b599356c10dca1cd720c9d0d0c9d5400b9de300af00e4d1ea150795543"
+SRC_URI[sha256sum] = "ce09c50a5962786b83e5da389c90dd2c15ecd0980a258dd01f70f9e7ce58a8f1"
 UPSTREAM_CHECK_REGEX = "releases/tag/v(?P<pver>\d+(\.\d+)+)"
 UPSTREAM_CHECK_URI = "https://github.com/tukaani-project/xz/releases/"
 
-- 
2.47.1


--===============0796662082399546012==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="0001-xz-upgrade-5.8.1-5.8.2.patch"

RnJvbSA4Yzg0YWM5YzJkMThmNDdhMWYwY2RjZjljN2Y2MTFkYmNmN2JmMzc0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBKYW4gMjAyNiAwOToxNjozNSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHh6
OiB1cGdyYWRlIDUuOC4xIC0+IDUuOC4yCgotLS0KIC4uLi94ei97eHpfNS44LjEuYmIgPT4geHpf
NS44LjIuYmJ9ICAgICAgICAgICB8IDgwICsrKysrKysrKysrKysrKysrKy0KIDEgZmlsZSBjaGFu
Z2VkLCA3NyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQogcmVuYW1lIG1ldGEvcmVjaXBl
cy1leHRlbmRlZC94ei97eHpfNS44LjEuYmIgPT4geHpfNS44LjIuYmJ9ICg0NyUpCgpkaWZmIC0t
Z2l0IGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3h6L3h6XzUuOC4xLmJiIGIvbWV0YS9yZWNpcGVz
LWV4dGVuZGVkL3h6L3h6XzUuOC4yLmJiCnNpbWlsYXJpdHkgaW5kZXggNDclCnJlbmFtZSBmcm9t
IG1ldGEvcmVjaXBlcy1leHRlbmRlZC94ei94el81LjguMS5iYgpyZW5hbWUgdG8gbWV0YS9yZWNp
cGVzLWV4dGVuZGVkL3h6L3h6XzUuOC4yLmJiCmluZGV4IDQwNmVjYmJlYzQuLmNhYjBiYzljYWYg
MTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC94ei94el81LjguMS5iYgorKysgYi9t
ZXRhL3JlY2lwZXMtZXh0ZW5kZWQveHoveHpfNS44LjIuYmIKQEAgLTEsMyArMSw3NyBAQAorIyBG
SVhNRTogdGhlIExJQ19GSUxFU19DSEtTVU0gdmFsdWVzIGhhdmUgYmVlbiB1cGRhdGVkIGJ5ICdk
ZXZ0b29sIHVwZ3JhZGUnLgorIyBUaGUgZm9sbG93aW5nIGlzIHRoZSBkaWZmZXJlbmNlIGJldHdl
ZW4gdGhlIG9sZCBhbmQgdGhlIG5ldyBsaWNlbnNlIHRleHQuCisjIFBsZWFzZSB1cGRhdGUgdGhl
IExJQ0VOU0UgdmFsdWUgaWYgbmVlZGVkLCBhbmQgc3VtbWFyaXplIHRoZSBjaGFuZ2VzIGluCisj
IHRoZSBjb21taXQgbWVzc2FnZSB2aWEgJ0xpY2Vuc2UtVXBkYXRlOicgdGFnLgorIyAoZXhhbXBs
ZTogJ0xpY2Vuc2UtVXBkYXRlOiBjb3B5cmlnaHQgeWVhcnMgdXBkYXRlZC4nKQorIworIyBUaGUg
Y2hhbmdlczoKKyMKKyMgLS0tIENPUFlJTkcuR1BMdjIKKyMgKysrIENPUFlJTkcuR1BMdjIKKyMg
QEAgLTIsNyArMiw3IEBACisjICAgICAgICAgICAgICAgICAgICAgICAgIFZlcnNpb24gMiwgSnVu
ZSAxOTkxCisjICAKKyMgICBDb3B5cmlnaHQgKEMpIDE5ODksIDE5OTEgRnJlZSBTb2Z0d2FyZSBG
b3VuZGF0aW9uLCBJbmMuLAorIyAtIDUxIEZyYW5rbGluIFN0cmVldCwgRmlmdGggRmxvb3IsIEJv
c3RvbiwgTUEgMDIxMTAtMTMwMSBVU0EKKyMgKyA8aHR0cHM6Ly9mc2Yub3JnLz4KKyMgICBFdmVy
eW9uZSBpcyBwZXJtaXR0ZWQgdG8gY29weSBhbmQgZGlzdHJpYnV0ZSB2ZXJiYXRpbSBjb3BpZXMK
KyMgICBvZiB0aGlzIGxpY2Vuc2UgZG9jdW1lbnQsIGJ1dCBjaGFuZ2luZyBpdCBpcyBub3QgYWxs
b3dlZC4KKyMgIAorIyBAQCAtMzA0LDggKzMwNCw3IEBACisjICAgICAgR05VIEdlbmVyYWwgUHVi
bGljIExpY2Vuc2UgZm9yIG1vcmUgZGV0YWlscy4KKyMgIAorIyAgICAgIFlvdSBzaG91bGQgaGF2
ZSByZWNlaXZlZCBhIGNvcHkgb2YgdGhlIEdOVSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlIGFsb25n
CisjIC0gICAgd2l0aCB0aGlzIHByb2dyYW07IGlmIG5vdCwgd3JpdGUgdG8gdGhlIEZyZWUgU29m
dHdhcmUgRm91bmRhdGlvbiwgSW5jLiwKKyMgLSAgICA1MSBGcmFua2xpbiBTdHJlZXQsIEZpZnRo
IEZsb29yLCBCb3N0b24sIE1BIDAyMTEwLTEzMDEgVVNBLgorIyArICAgIHdpdGggdGhpcyBwcm9n
cmFtOyBpZiBub3QsIHNlZSA8aHR0cHM6Ly93d3cuZ251Lm9yZy9saWNlbnNlcy8+LgorIyAgCisj
ICBBbHNvIGFkZCBpbmZvcm1hdGlvbiBvbiBob3cgdG8gY29udGFjdCB5b3UgYnkgZWxlY3Ryb25p
YyBhbmQgcGFwZXIgbWFpbC4KKyMgIAorIyBAQCAtMzI5LDggKzMyOCw4IEBACisjICAgIFlveW9k
eW5lLCBJbmMuLCBoZXJlYnkgZGlzY2xhaW1zIGFsbCBjb3B5cmlnaHQgaW50ZXJlc3QgaW4gdGhl
IHByb2dyYW0KKyMgICAgYEdub21vdmlzaW9uJyAod2hpY2ggbWFrZXMgcGFzc2VzIGF0IGNvbXBp
bGVycykgd3JpdHRlbiBieSBKYW1lcyBIYWNrZXIuCisjICAKKyMgLSAgPHNpZ25hdHVyZSBvZiBU
eSBDb29uPiwgMSBBcHJpbCAxOTg5CisjIC0gIFR5IENvb24sIFByZXNpZGVudCBvZiBWaWNlCisj
ICsgIDxzaWduYXR1cmUgb2YgTW9lIEdob3VsPiwgMSBBcHJpbCAxOTg5CisjICsgIE1vZSBHaG91
bCwgUHJlc2lkZW50IG9mIFZpY2UKKyMgIAorIyAgVGhpcyBHZW5lcmFsIFB1YmxpYyBMaWNlbnNl
IGRvZXMgbm90IHBlcm1pdCBpbmNvcnBvcmF0aW5nIHlvdXIgcHJvZ3JhbSBpbnRvCisjICBwcm9w
cmlldGFyeSBwcm9ncmFtcy4gIElmIHlvdXIgcHJvZ3JhbSBpcyBhIHN1YnJvdXRpbmUgbGlicmFy
eSwgeW91IG1heQorIyAtLS0gQ09QWUlORy5MR1BMdjIuMQorIyArKysgQ09QWUlORy5MR1BMdjIu
MQorIyBAQCAtMiw3ICsyLDcgQEAKKyMgICAgICAgICAgICAgICAgICAgICAgICAgVmVyc2lvbiAy
LjEsIEZlYnJ1YXJ5IDE5OTkKKyMgIAorIyAgIENvcHlyaWdodCAoQykgMTk5MSwgMTk5OSBGcmVl
IFNvZnR3YXJlIEZvdW5kYXRpb24sIEluYy4KKyMgLSA1MSBGcmFua2xpbiBTdHJlZXQsIEZpZnRo
IEZsb29yLCBCb3N0b24sIE1BICAwMjExMC0xMzAxICBVU0EKKyMgKyA8aHR0cHM6Ly9mc2Yub3Jn
Lz4KKyMgICBFdmVyeW9uZSBpcyBwZXJtaXR0ZWQgdG8gY29weSBhbmQgZGlzdHJpYnV0ZSB2ZXJi
YXRpbSBjb3BpZXMKKyMgICBvZiB0aGlzIGxpY2Vuc2UgZG9jdW1lbnQsIGJ1dCBjaGFuZ2luZyBp
dCBpcyBub3QgYWxsb3dlZC4KKyMgIAorIyBAQCAtNDg0LDggKzQ4NCw3IEBACisjICAgICAgTGVz
c2VyIEdlbmVyYWwgUHVibGljIExpY2Vuc2UgZm9yIG1vcmUgZGV0YWlscy4KKyMgIAorIyAgICAg
IFlvdSBzaG91bGQgaGF2ZSByZWNlaXZlZCBhIGNvcHkgb2YgdGhlIEdOVSBMZXNzZXIgR2VuZXJh
bCBQdWJsaWMKKyMgLSAgICBMaWNlbnNlIGFsb25nIHdpdGggdGhpcyBsaWJyYXJ5OyBpZiBub3Qs
IHdyaXRlIHRvIHRoZSBGcmVlIFNvZnR3YXJlCisjIC0gICAgRm91bmRhdGlvbiwgSW5jLiwgNTEg
RnJhbmtsaW4gU3RyZWV0LCBGaWZ0aCBGbG9vciwgQm9zdG9uLCBNQSAgMDIxMTAtMTMwMSAgVVNB
CisjICsgICAgTGljZW5zZSBhbG9uZyB3aXRoIHRoaXMgbGlicmFyeTsgaWYgbm90LCBzZWUgPGh0
dHBzOi8vd3d3LmdudS5vcmcvbGljZW5zZXMvPi4KKyMgIAorIyAgQWxzbyBhZGQgaW5mb3JtYXRp
b24gb24gaG93IHRvIGNvbnRhY3QgeW91IGJ5IGVsZWN0cm9uaWMgYW5kIHBhcGVyIG1haWwuCisj
ICAKKyMgQEAgLTQ5Niw3ICs0OTUsNyBAQAorIyAgICBZb3lvZHluZSwgSW5jLiwgaGVyZWJ5IGRp
c2NsYWltcyBhbGwgY29weXJpZ2h0IGludGVyZXN0IGluIHRoZQorIyAgICBsaWJyYXJ5IGBGcm9i
JyAoYSBsaWJyYXJ5IGZvciB0d2Vha2luZyBrbm9icykgd3JpdHRlbiBieSBKYW1lcyBSYW5kb20g
SGFja2VyLgorIyAgCisjIC0gIDxzaWduYXR1cmUgb2YgVHkgQ29vbj4sIDEgQXByaWwgMTk5MAor
IyAtICBUeSBDb29uLCBQcmVzaWRlbnQgb2YgVmljZQorIyArICA8c2lnbmF0dXJlIG9mIE1vZSBH
aG91bD4sIDEgQXByaWwgMTk5MAorIyArICBNb2UgR2hvdWwsIFByZXNpZGVudCBvZiBWaWNlCisj
ICAKKyMgIFRoYXQncyBhbGwgdGhlcmUgaXMgdG8gaXQhCisjIAorIworCiBTVU1NQVJZID0gIlV0
aWxpdGllcyBmb3IgbWFuYWdpbmcgTFpNQSBjb21wcmVzc2VkIGZpbGVzIgogSE9NRVBBR0UgPSAi
aHR0cHM6Ly90dWthYW5pLm9yZy94ei8iCiBERVNDUklQVElPTiA9ICJYWiBVdGlscyBpcyBmcmVl
IGdlbmVyYWwtcHVycG9zZSBkYXRhIGNvbXByZXNzaW9uIHNvZnR3YXJlIHdpdGggYSBoaWdoIGNv
bXByZXNzaW9uIHJhdGlvLiBYWiBVdGlscyB3ZXJlIHdyaXR0ZW4gZm9yIFBPU0lYLWxpa2Ugc3lz
dGVtcywgYnV0IGFsc28gd29yayBvbiBzb21lIG5vdC1zby1QT1NJWCBzeXN0ZW1zLiBYWiBVdGls
cyBhcmUgdGhlIHN1Y2Nlc3NvciB0byBMWk1BIFV0aWxzLiIKQEAgLTE5LDE2ICs5MywxNiBAQCBM
SUNFTlNFOmxpYmx6bWEgPSAiMEJTRCIKIAogTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vQ09Q
WUlORzttZDU9ZDM4ZDU2MmY2MTEyMTc0ZGU5M2E5Njc3NjgyMjMxYjIgXAogICAgICAgICAgICAg
ICAgICAgICBmaWxlOi8vQ09QWUlORy4wQlNEO21kNT0wNjcyYzIxMGNlODBjODM0NDQzMzliOWFh
MzFmZWUyZiBcCi0gICAgICAgICAgICAgICAgICAgIGZpbGU6Ly9DT1BZSU5HLkdQTHYyO21kNT1i
MjM0ZWU0ZDY5ZjVmY2U0NDg2YTgwZmRhZjRhNDI2MyBcCisgICAgICAgICAgICAgICAgICAgIGZp
bGU6Ly9DT1BZSU5HLkdQTHYyO21kNT01NzBhOWIzNzQ5ZGQwNDYzYTE3Nzg4MDNiMTJhNmRjZSBc
CiAgICAgICAgICAgICAgICAgICAgIGZpbGU6Ly9DT1BZSU5HLkdQTHYzO21kNT0xZWJiZDNlMzQy
MzdhZjI2ZGE1ZGMwOGE0ZTQ0MDQ2NCBcCi0gICAgICAgICAgICAgICAgICAgIGZpbGU6Ly9DT1BZ
SU5HLkxHUEx2Mi4xO21kNT00ZmJkNjUzODBjZGQyNTU5NTEwNzkwMDhiMzY0NTE2YyBcCisgICAg
ICAgICAgICAgICAgICAgIGZpbGU6Ly9DT1BZSU5HLkxHUEx2Mi4xO21kNT00YmY2NjFjMWUzNzkz
ZTU1YzhkMTA1MWJjNWUwYWUyMSBcCiAgICAgICAgICAgICAgICAgICAgIGZpbGU6Ly9saWIvZ2V0
b3B0LmM7ZW5kbGluZT0yMzttZDU9M2YzM2UyMDcyODdiZjcyODM0ZjNhZThjMjQ3ZGZiNmEgXAog
ICAgICAgICAgICAgICAgICAgICAiCiAKIFNSQ19VUkkgPSAiaHR0cHM6Ly9naXRodWIuY29tL3R1
a2FhbmktcHJvamVjdC94ei9yZWxlYXNlcy9kb3dubG9hZC92JHtQVn0veHotJHtQVn0udGFyLmd6
IFwKICAgICAgICAgICAgZmlsZTovL3J1bi1wdGVzdCBcCiAgICAgICAgICAgIgotU1JDX1VSSVtz
aGEyNTZzdW1dID0gIjUwNzgyNWI1OTkzNTZjMTBkY2ExY2Q3MjBjOWQwZDBjOWQ1NDAwYjlkZTMw
MGFmMDBlNGQxZWExNTA3OTU1NDMiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiY2UwOWM1MGE1OTYy
Nzg2YjgzZTVkYTM4OWM5MGRkMmMxNWVjZDA5ODBhMjU4ZGQwMWY3MGY5ZTdjZTU4YThmMSIKIFVQ
U1RSRUFNX0NIRUNLX1JFR0VYID0gInJlbGVhc2VzL3RhZy92KD9QPHB2ZXI+XGQrKFwuXGQrKSsp
IgogVVBTVFJFQU1fQ0hFQ0tfVVJJID0gImh0dHBzOi8vZ2l0aHViLmNvbS90dWthYW5pLXByb2pl
Y3QveHovcmVsZWFzZXMvIgogCi0tIAoyLjQ3LjEKCg==

--===============0796662082399546012==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/xz: SRC_URI changed from "https://github.com/tukaani-project/xz/releases/download/v5.8.1/xz-5.8.1.tar.gz file://run-ptest" to "https://github.com/tukaani-project/xz/releases/download/v5.8.2/xz-5.8.2.tar.gz file://run-ptest"
packages/x86-64-v3-poky-linux/xz: PKGV changed from 5.8.1 [default] to 5.8.2 [default]
packages/x86-64-v3-poky-linux/xz: PV changed from "5.8.1" to "5.8.2"
packages/x86-64-v3-poky-linux/xz/liblzma: FILELIST: removed "/usr/lib/liblzma.so.5.8.1", added "/usr/lib/liblzma.so.5.8.2"
packages/x86-64-v3-poky-linux/xz/liblzma: PKGV changed from 5.8.1 [default] to 5.8.2 [default]
packages/x86-64-v3-poky-linux/xz/liblzma: PV changed from "5.8.1" to "5.8.2"
Changes to packages/x86-64-v3-poky-linux/xz (sysroot):
  /usr/lib/liblzma.so.5 changed symlink target from liblzma.so.5.8.1 to liblzma.so.5.8.2
  /usr/lib/liblzma.so changed symlink target from liblzma.so.5.8.1 to liblzma.so.5.8.2
  /usr/lib/liblzma.so.5.8.1 moved to /usr/lib/liblzma.so.5.8.2
packages/x86-64-v3-poky-linux/xz/xz-dbg: PKGSIZE changed from 2198776 to 2199872 (+0%)
packages/x86-64-v3-poky-linux/xz/xz-dbg: FILELIST: removed "/usr/lib/.debug/liblzma.so.5.8.1", added "/usr/lib/.debug/liblzma.so.5.8.2"
packages/x86-64-v3-poky-linux/xz/xz-dbg: PKGV changed from 5.8.1 [default] to 5.8.2 [default]
packages/x86-64-v3-poky-linux/xz/xz-dbg: PV changed from "5.8.1" to "5.8.2"
packages/x86-64-v3-poky-linux/xz/xz-dev: PKGSIZE changed from 229962 to 229928 (-0%)
packages/x86-64-v3-poky-linux/xz/xz-dev: PKGV changed from 5.8.1 [default] to 5.8.2 [default]
packages/x86-64-v3-poky-linux/xz/xz-dev: PV changed from "5.8.1" to "5.8.2"
packages/x86-64-v3-poky-linux/xz/xz-doc: PKGSIZE changed from 1290628 to 1390205 (+8%)
packages/x86-64-v3-poky-linux/xz/xz-doc: FILELIST: added "/usr/share/man/sv/man1/lzmore.1 /usr/share/man/sv/man1/xzmore.1 /usr/share/man/sv/man1/lzegrep.1 /usr/share/man/sv/man1/xzegrep.1 /usr/share/man/sv/man1/xzcmp.1 /usr/share/man/sv/man1/lzcmp.1 /usr/share/man/sv/man1/unxz.1 /usr/share/man/sv/man1/lzdiff.1 /usr/share/man/sv/man1/xzdiff.1 /usr/share/man/sv/man1/lzfgrep.1 /usr/share/man/sv/man1/lzma.1 /usr/share/man/sv/man1/lzmainfo.1 /usr/share/man/sv/man1/xzdec.1 /usr/share/man/sv/man1/lzless.1 /usr/share/man/sv/man1/xzless.1 /usr/share/man/sv/man1/unlzma.1 /usr/share/man/sv/man1/lzmadec.1 /usr/share/man/sv/man1/lzcat.1 /usr/share/man/sv/man1/xzcat.1 /usr/share/man/sv/man1/xz.1 /usr/share/man/sv/man1/lzgrep.1 /usr/share/man/sv/man1/xzgrep.1 /usr/share/man/sv/man1/xzfgrep.1"
packages/x86-64-v3-poky-linux/xz/xz-doc: PKGV changed from 5.8.1 [default] to 5.8.2 [default]
packages/x86-64-v3-poky-linux/xz/xz-doc: PV changed from "5.8.1" to "5.8.2"
packages/x86-64-v3-poky-linux/xz/xz-locale-ca: PKGV changed from 5.8.1 [default] to 5.8.2 [default]
packages/x86-64-v3-poky-linux/xz/xz-locale-ca: PV changed from "5.8.1" to "5.8.2"
packages/x86-64-v3-poky-linux/xz/xz-locale-cs: PKGV changed from 5.8.1 [default] to 5.8.2 [default]
packages/x86-64-v3-poky-linux/xz/xz-locale-cs: PV changed from "5.8.1" to "5.8.2"
packages/x86-64-v3-poky-linux/xz/xz-locale-da: PKGV changed from 5.8.1 [default] to 5.8.2 [default]
packages/x86-64-v3-poky-linux/xz/xz-locale-da: PV changed from "5.8.1" to "5.8.2"
packages/x86-64-v3-poky-linux/xz/xz-locale-de: PKGV changed from 5.8.1 [default] to 5.8.2 [default]
packages/x86-64-v3-poky-linux/xz/xz-locale-de: PV changed from "5.8.1" to "5.8.2"
packages/x86-64-v3-poky-linux/xz/xz-locale-eo: PKGV changed from 5.8.1 [default] to 5.8.2 [default]
packages/x86-64-v3-poky-linux/xz/xz-locale-eo: PV changed from "5.8.1" to "5.8.2"
packages/x86-64-v3-poky-linux/xz/xz-locale-es: PKGSIZE changed from 29228 to 29244 (+0%)
packages/x86-64-v3-poky-linux/xz/xz-locale-es: PKGV changed from 5.8.1 [default] to 5.8.2 [default]
packages/x86-64-v3-poky-linux/xz/xz-locale-es: PV changed from "5.8.1" to "5.8.2"
packages/x86-64-v3-poky-linux/xz/xz-locale-fi: PKGV changed from 5.8.1 [default] to 5.8.2 [default]
packages/x86-64-v3-poky-linux/xz/xz-locale-fi: PV changed from "5.8.1" to "5.8.2"
packages/x86-64-v3-poky-linux/xz/xz-locale-fr: PKGV changed from 5.8.1 [default] to 5.8.2 [default]
packages/x86-64-v3-poky-linux/xz/xz-locale-fr: PV changed from "5.8.1" to "5.8.2"
packages/x86-64-v3-poky-linux/xz/xz-locale-hr: PKGV changed from 5.8.1 [default] to 5.8.2 [default]
packages/x86-64-v3-poky-linux/xz/xz-locale-hr: PV changed from "5.8.1" to "5.8.2"
packages/x86-64-v3-poky-linux/xz/xz-locale-hu: PKGV changed from 5.8.1 [default] to 5.8.2 [default]
packages/x86-64-v3-poky-linux/xz/xz-locale-hu: PV changed from "5.8.1" to "5.8.2"
packages/x86-64-v3-poky-linux/xz/xz-locale-it: PKGV changed from 5.8.1 [default] to 5.8.2 [default]
packages/x86-64-v3-poky-linux/xz/xz-locale-it: PV changed from "5.8.1" to "5.8.2"
packages/x86-64-v3-poky-linux/xz/xz-locale-ka: PKGV changed from 5.8.1 [default] to 5.8.2 [default]
packages/x86-64-v3-poky-linux/xz/xz-locale-ka: PV changed from "5.8.1" to "5.8.2"
packages/x86-64-v3-poky-linux/xz/xz-locale-ko: PKGV changed from 5.8.1 [default] to 5.8.2 [default]
packages/x86-64-v3-poky-linux/xz/xz-locale-ko: PV changed from "5.8.1" to "5.8.2"
packages/x86-64-v3-poky-linux/xz/xz-locale-nl: PKGV changed from 5.8.1 [default] to 5.8.2 [default]
packages/x86-64-v3-poky-linux/xz/xz-locale-nl: PV changed from "5.8.1" to "5.8.2"
packages/x86-64-v3-poky-linux/xz/xz-locale-pl: PKGV changed from 5.8.1 [default] to 5.8.2 [default]
packages/x86-64-v3-poky-linux/xz/xz-locale-pl: PV changed from "5.8.1" to "5.8.2"
packages/x86-64-v3-poky-linux/xz/xz-locale-pt-br: PKGV changed from 5.8.1 [default] to 5.8.2 [default]
packages/x86-64-v3-poky-linux/xz/xz-locale-pt-br: PV changed from "5.8.1" to "5.8.2"
packages/x86-64-v3-poky-linux/xz/xz-locale-pt: PKGV changed from 5.8.1 [default] to 5.8.2 [default]
packages/x86-64-v3-poky-linux/xz/xz-locale-pt: PV changed from "5.8.1" to "5.8.2"
packages/x86-64-v3-poky-linux/xz/xz-locale-ro: PKGV changed from 5.8.1 [default] to 5.8.2 [default]
packages/x86-64-v3-poky-linux/xz/xz-locale-ro: PV changed from "5.8.1" to "5.8.2"
packages/x86-64-v3-poky-linux/xz/xz-locale-sr: PKGV changed from 5.8.1 [default] to 5.8.2 [default]
packages/x86-64-v3-poky-linux/xz/xz-locale-sr: PV changed from "5.8.1" to "5.8.2"
packages/x86-64-v3-poky-linux/xz/xz-locale-sv: PKGV changed from 5.8.1 [default] to 5.8.2 [default]
packages/x86-64-v3-poky-linux/xz/xz-locale-sv: PV changed from "5.8.1" to "5.8.2"
packages/x86-64-v3-poky-linux/xz/xz-locale-tr: PKGV changed from 5.8.1 [default] to 5.8.2 [default]
packages/x86-64-v3-poky-linux/xz/xz-locale-tr: PV changed from "5.8.1" to "5.8.2"
packages/x86-64-v3-poky-linux/xz/xz-locale-uk: PKGV changed from 5.8.1 [default] to 5.8.2 [default]
packages/x86-64-v3-poky-linux/xz/xz-locale-uk: PV changed from "5.8.1" to "5.8.2"
packages/x86-64-v3-poky-linux/xz/xz-locale-vi: PKGV changed from 5.8.1 [default] to 5.8.2 [default]
packages/x86-64-v3-poky-linux/xz/xz-locale-vi: PV changed from "5.8.1" to "5.8.2"
packages/x86-64-v3-poky-linux/xz/xz-locale-zh-cn: PKGV changed from 5.8.1 [default] to 5.8.2 [default]
packages/x86-64-v3-poky-linux/xz/xz-locale-zh-cn: PV changed from "5.8.1" to "5.8.2"
packages/x86-64-v3-poky-linux/xz/xz-locale-zh-tw: PKGV changed from 5.8.1 [default] to 5.8.2 [default]
packages/x86-64-v3-poky-linux/xz/xz-locale-zh-tw: PV changed from "5.8.1" to "5.8.2"
packages/x86-64-v3-poky-linux/xz/xz-ptest: PKGSIZE changed from 472715 to 472892 (+0%)
packages/x86-64-v3-poky-linux/xz/xz-ptest: PKGV changed from 5.8.1 [default] to 5.8.2 [default]
packages/x86-64-v3-poky-linux/xz/xz-ptest: PV changed from "5.8.1" to "5.8.2"
packages/x86-64-v3-poky-linux/xz/xz-src: PKGSIZE changed from 1692651 to 1696338 (+0%)
packages/x86-64-v3-poky-linux/xz/xz-src: FILELIST: directory renamed /usr/src/debug/xz/5.8.1/src/liblzma/check -> /usr/src/debug/xz/5.8.2/src/liblzma/check, directory renamed /usr/src/debug/xz/5.8.1/src/liblzma/api/lzma -> /usr/src/debug/xz/5.8.2/src/liblzma/api/lzma, directory renamed /usr/src/debug/xz/5.8.1/src/common -> /usr/src/debug/xz/5.8.2/src/common, directory renamed /usr/src/debug/xz/5.8.1/src/liblzma/delta -> /usr/src/debug/xz/5.8.2/src/liblzma/delta, directory renamed /usr/src/debug/xz/5.8.1/src/xz -> /usr/src/debug/xz/5.8.2/src/xz, directory renamed /usr/src/debug/xz/5.8.1/src/liblzma/common -> /usr/src/debug/xz/5.8.2/src/liblzma/common, directory renamed /usr/src/debug/xz/5.8.1/src/liblzma/simple -> /usr/src/debug/xz/5.8.2/src/liblzma/simple, directory renamed /usr/src/debug/xz/5.8.1/tests -> /usr/src/debug/xz/5.8.2/tests, directory renamed /usr/src/debug/xz/5.8.1/src/liblzma/rangecoder -> /usr/src/debug/xz/5.8.2/src/liblzma/rangecoder, directory renamed /usr/src/debug/
 xz/5.8.1/src/liblzma/lz -> /usr/src/debug/xz/5.8.2/src/liblzma/lz, directory renamed /usr/src/debug/xz/5.8.1/src/lzmainfo -> /usr/src/debug/xz/5.8.2/src/lzmainfo, directory renamed /usr/src/debug/xz/5.8.1/src/liblzma/lzma -> /usr/src/debug/xz/5.8.2/src/liblzma/lzma, directory renamed /usr/src/debug/xz/5.8.1/src/xzdec -> /usr/src/debug/xz/5.8.2/src/xzdec
packages/x86-64-v3-poky-linux/xz/xz-src: PKGV changed from 5.8.1 [default] to 5.8.2 [default]
packages/x86-64-v3-poky-linux/xz/xz-src: PV changed from "5.8.1" to "5.8.2"
packages/x86-64-v3-poky-linux/xz/xz-staticdev: PKGV changed from 5.8.1 [default] to 5.8.2 [default]
packages/x86-64-v3-poky-linux/xz/xz-staticdev: PV changed from "5.8.1" to "5.8.2"
packages/x86-64-v3-poky-linux/xz/xz: PKGSIZE changed from 167095 to 171464 (+3%)
packages/x86-64-v3-poky-linux/xz/xz: PKGV changed from 5.8.1 [default] to 5.8.2 [default]
packages/x86-64-v3-poky-linux/xz/xz: PV changed from "5.8.1" to "5.8.2"
Changes to packages/x86_64-linux/glib-2.0-native (sysroot):
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.86.3 was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.86.3/recipe-sysroot-native was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.86.3/recipe-sysroot-native/usr was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.86.3/recipe-sysroot-native/usr/lib was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.86.3/recipe-sysroot-native/usr/lib/libglib-2.0.so.0.8600.3-gdb.py was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.86.3/recipe-sysroot-native/usr/lib/libgobject-2.0.so.0.8600.3-gdb.py was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work/x86_64-linux was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work/x86_64-linux/glib-2.0-native was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work/x86_64-linux/glib-2.0-native/2.86.3 was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work/x86_64-linux/glib-2.0-native/2.86.3/recipe-sysroot-native was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work/x86_64-linux/glib-2.0-native/2.86.3/recipe-sysroot-native/usr was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work/x86_64-linux/glib-2.0-native/2.86.3/recipe-sysroot-native/usr/lib was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work/x86_64-linux/glib-2.0-native/2.86.3/recipe-sysroot-native/usr/lib/libglib-2.0.so.0.8600.3-gdb.py was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work/x86_64-linux/glib-2.0-native/2.86.3/recipe-sysroot-native/usr/lib/libgobject-2.0.so.0.8600.3-gdb.py was removed
Changes to packages/x86_64-linux/xz-native (sysroot):
  /usr/lib/liblzma.so.5 changed symlink target from liblzma.so.5.8.1 to liblzma.so.5.8.2
  /usr/lib/liblzma.so changed symlink target from liblzma.so.5.8.1 to liblzma.so.5.8.2
  /usr/lib/liblzma.so.5.8.1 moved to /usr/lib/liblzma.so.5.8.2

--===============0796662082399546012==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/xz/liblzma: FILELIST: removed "/usr/lib/liblzma.so.5.8.1", added "/usr/lib/liblzma.so.5.8.2"
Changes to packages/x86-64-v3-poky-linux/xz (sysroot):
  /usr/lib/liblzma.so.5 changed symlink target from liblzma.so.5.8.1 to liblzma.so.5.8.2
  /usr/lib/liblzma.so changed symlink target from liblzma.so.5.8.1 to liblzma.so.5.8.2
  /usr/lib/liblzma.so.5.8.1 moved to /usr/lib/liblzma.so.5.8.2
packages/x86-64-v3-poky-linux/xz/xz-doc: FILELIST: added "/usr/share/man/sv/man1/unxz.1 /usr/share/man/sv/man1/xz.1 /usr/share/man/sv/man1/lzmainfo.1 /usr/share/man/sv/man1/lzcat.1 /usr/share/man/sv/man1/xzcat.1 /usr/share/man/sv/man1/lzfgrep.1 /usr/share/man/sv/man1/xzfgrep.1 /usr/share/man/sv/man1/lzgrep.1 /usr/share/man/sv/man1/xzgrep.1 /usr/share/man/sv/man1/lzma.1 /usr/share/man/sv/man1/lzcmp.1 /usr/share/man/sv/man1/xzcmp.1 /usr/share/man/sv/man1/lzmadec.1 /usr/share/man/sv/man1/lzless.1 /usr/share/man/sv/man1/xzless.1 /usr/share/man/sv/man1/lzegrep.1 /usr/share/man/sv/man1/xzegrep.1 /usr/share/man/sv/man1/lzdiff.1 /usr/share/man/sv/man1/xzdec.1 /usr/share/man/sv/man1/xzdiff.1 /usr/share/man/sv/man1/unlzma.1 /usr/share/man/sv/man1/xzmore.1 /usr/share/man/sv/man1/lzmore.1"
Changes to packages/x86_64-linux/glib-2.0-native (sysroot):
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.86.3 was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.86.3/recipe-sysroot-native was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.86.3/recipe-sysroot-native/usr was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.86.3/recipe-sysroot-native/usr/lib was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.86.3/recipe-sysroot-native/usr/lib/libglib-2.0.so.0.8600.3-gdb.py was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.86.3/recipe-sysroot-native/usr/lib/libgobject-2.0.so.0.8600.3-gdb.py was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work/x86_64-linux was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work/x86_64-linux/glib-2.0-native was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work/x86_64-linux/glib-2.0-native/2.86.3 was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work/x86_64-linux/glib-2.0-native/2.86.3/recipe-sysroot-native was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work/x86_64-linux/glib-2.0-native/2.86.3/recipe-sysroot-native/usr was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work/x86_64-linux/glib-2.0-native/2.86.3/recipe-sysroot-native/usr/lib was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work/x86_64-linux/glib-2.0-native/2.86.3/recipe-sysroot-native/usr/lib/libglib-2.0.so.0.8600.3-gdb.py was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work/x86_64-linux/glib-2.0-native/2.86.3/recipe-sysroot-native/usr/lib/libgobject-2.0.so.0.8600.3-gdb.py was removed
Changes to packages/x86_64-linux/xz-native (sysroot):
  /usr/lib/liblzma.so.5 changed symlink target from liblzma.so.5.8.1 to liblzma.so.5.8.2
  /usr/lib/liblzma.so changed symlink target from liblzma.so.5.8.1 to liblzma.so.5.8.2
  /usr/lib/liblzma.so.5.8.1 moved to /usr/lib/liblzma.so.5.8.2

--===============0796662082399546012==--

