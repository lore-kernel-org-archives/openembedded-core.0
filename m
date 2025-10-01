Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8A73CCF9EA
	for <webhook@archiver.kernel.org>; Wed,  1 Oct 2025 13:32:36 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web10.17955.1759325541749950653
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Oct 2025 06:32:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=GUo2AGss;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=qNLj3fE+;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 010101999ff98977-7cff4f81-0d08-4afb-9ed9-e3cf9daa095c-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1759325555;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Ko5KBh9rkaqXkrmeldO/Jn4QSAVMLxm+dBSVhR65OCQ=;
	b=GUo2AGssHCDFTJWYXa7o2TVuxijR3Piz8A+uEm1rE4CU8D8K68kRWlGuFs+DvuCI
	ghw4gc5gG5N0oScfsdz9Vmd+v745Hlvv9YSo/NAfsO4Pknrg2oFgvuRstAv9NS0+KAZ
	El//deS/5lXGSAyCRJnYsL52Nk+XQGzAZD5DOLVE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1759325555;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Ko5KBh9rkaqXkrmeldO/Jn4QSAVMLxm+dBSVhR65OCQ=;
	b=qNLj3fE+T11je2/efkACDGI/UVCeqdQ62ybp27R++YVXhPpsg9il+3eovEizHwDA
	EGU7APisqPs3hxWEdHgK/JW0D05Bao+dpar4GVtITtosenVnmCJ5/MXPAmuTCXE4tcH
	3CzN8XavAPRqzd/iUff79wseT+FWC6GO+5h7l45Q=
Content-Type: multipart/mixed; boundary="===============2254429120286392314=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] appstream: upgrading to 1.1.0 FAILED
Message-ID: <010101999ff98977-7cff4f81-0d08-4afb-9ed9-e3cf9daa095c-000000@us-west-2.amazonses.com>
Date: Wed, 1 Oct 2025 13:32:35 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.10.01-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Oct 2025 13:32:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224295

--===============2254429120286392314==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *appstream* to *1.1.0* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-appstream-upgrade-1.0.6-1.1.0.patch
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
From fff99a8c86cca8c8ec2519eead36b54924c7762b Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 1 Oct 2025 13:02:31 +0000
Subject: [PATCH] appstream: upgrade 1.0.6 -> 1.1.0

---
 .../0001-remove-hardcoded-path.patch          |   6 +-
 .../0002-Do-not-build-qt-tests.patch          |   2 +-
 ...IX_DIR-in-qt-cmake-AppStreamQtConfig.patch |   2 +-
 ...{appstream_1.0.6.bb => appstream_1.1.0.bb} | 145 +++++++++++++++++-
 4 files changed, 148 insertions(+), 7 deletions(-)
 rename meta/recipes-support/appstream/{appstream_1.0.6.bb => appstream_1.1.0.bb} (19%)

diff --git a/meta/recipes-support/appstream/appstream/0001-remove-hardcoded-path.patch b/meta/recipes-support/appstream/appstream/0001-remove-hardcoded-path.patch
index 5f4ec29628..49fd8c5596 100644
--- a/meta/recipes-support/appstream/appstream/0001-remove-hardcoded-path.patch
+++ b/meta/recipes-support/appstream/appstream/0001-remove-hardcoded-path.patch
@@ -1,4 +1,4 @@
-From e713f4d6ce2ee198eabcc31bc734e84cdb20ea32 Mon Sep 17 00:00:00 2001
+From 9a438e2b2667419473e7e007af90ef5081b8421e Mon Sep 17 00:00:00 2001
 From: Markus Volk <f_l_k@t-online.de>
 Date: Mon, 12 Dec 2022 15:42:42 +0100
 Subject: [PATCH] remove hardcoded path
@@ -14,10 +14,10 @@ Upstream-Status: Inappropriate [oe-specific]
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/meson.build b/meson.build
-index ee5b179..8a06e75 100644
+index cb092d0..7193eb8 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -194,10 +194,10 @@ endif
+@@ -193,10 +193,10 @@ endif
  stemmer_inc_dirs = include_directories()
  if get_option('stemming')
      stemmer_lib = cc.find_library('stemmer', required: true)
diff --git a/meta/recipes-support/appstream/appstream/0002-Do-not-build-qt-tests.patch b/meta/recipes-support/appstream/appstream/0002-Do-not-build-qt-tests.patch
index cf26013019..aa959f1b21 100644
--- a/meta/recipes-support/appstream/appstream/0002-Do-not-build-qt-tests.patch
+++ b/meta/recipes-support/appstream/appstream/0002-Do-not-build-qt-tests.patch
@@ -1,4 +1,4 @@
-From eafac7178683c9fe5ab50192dec004f24638b2f4 Mon Sep 17 00:00:00 2001
+From ad3dca9a9f451d43d692f921e0e7729e12fbd835 Mon Sep 17 00:00:00 2001
 From: Marc Ferland <marc.ferland@sonatest.com>
 Date: Fri, 26 Jul 2024 15:41:00 -0400
 Subject: [PATCH] Do not build qt/tests
diff --git a/meta/recipes-support/appstream/appstream/0003-Fix-PACKAGE_PREFIX_DIR-in-qt-cmake-AppStreamQtConfig.patch b/meta/recipes-support/appstream/appstream/0003-Fix-PACKAGE_PREFIX_DIR-in-qt-cmake-AppStreamQtConfig.patch
index d1994e3c4c..c7a3921a8e 100644
--- a/meta/recipes-support/appstream/appstream/0003-Fix-PACKAGE_PREFIX_DIR-in-qt-cmake-AppStreamQtConfig.patch
+++ b/meta/recipes-support/appstream/appstream/0003-Fix-PACKAGE_PREFIX_DIR-in-qt-cmake-AppStreamQtConfig.patch
@@ -1,4 +1,4 @@
-From f19365d8b90cde7d2a385f8c85b74a2565ff25fa Mon Sep 17 00:00:00 2001
+From 0ef5254150ac85d6a5ce9a7aa19872d523189dc5 Mon Sep 17 00:00:00 2001
 From: Marc Ferland <marc.ferland@sonatest.com>
 Date: Mon, 29 Jul 2024 09:35:51 -0400
 Subject: [PATCH] Fix PACKAGE_PREFIX_DIR in qt/cmake/AppStreamQtConfig.cmake.in
diff --git a/meta/recipes-support/appstream/appstream_1.0.6.bb b/meta/recipes-support/appstream/appstream_1.1.0.bb
similarity index 19%
rename from meta/recipes-support/appstream/appstream_1.0.6.bb
rename to meta/recipes-support/appstream/appstream_1.1.0.bb
index 62761380f5..1746a13667 100644
--- a/meta/recipes-support/appstream/appstream_1.0.6.bb
+++ b/meta/recipes-support/appstream/appstream_1.1.0.bb
@@ -1,7 +1,148 @@
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
+# @@ -55,7 +55,7 @@
+#  that what they have is not the original version, so that the original
+#  author's reputation will not be affected by problems that might be
+#  introduced by others.
+# -
+# +
+#    Finally, software patents pose a constant threat to the existence of
+#  any free program.  We wish to make sure that a company cannot
+#  effectively restrict the users of a free program by obtaining a
+# @@ -111,7 +111,7 @@
+#  "work based on the library" and a "work that uses the library".  The
+#  former contains code derived from the library, whereas the latter must
+#  be combined with the library in order to run.
+# -
+# +
+#                    GNU LESSER GENERAL PUBLIC LICENSE
+#     TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION
+#  
+# @@ -158,7 +158,7 @@
+#    You may charge a fee for the physical act of transferring a copy,
+#  and you may at your option offer warranty protection in exchange for a
+#  fee.
+# -
+# +
+#    2. You may modify your copy or copies of the Library or any portion
+#  of it, thus forming a work based on the Library, and copy and
+#  distribute such modifications or work under the terms of Section 1
+# @@ -216,7 +216,7 @@
+#  ordinary GNU General Public License has appeared, then you can specify
+#  that version instead if you wish.)  Do not make any other change in
+#  these notices.
+# -
+# +
+#    Once this change is made in a given copy, it is irreversible for
+#  that copy, so the ordinary GNU General Public License applies to all
+#  subsequent copies and derivative works made from that copy.
+# @@ -267,7 +267,7 @@
+#  distribute the object code for the work under the terms of Section 6.
+#  Any executables containing that work also fall under Section 6,
+#  whether or not they are linked directly with the Library itself.
+# -
+# +
+#    6. As an exception to the Sections above, you may also combine or
+#  link a "work that uses the Library" with the Library to produce a
+#  work containing portions of the Library, and distribute that work
+# @@ -329,7 +329,7 @@
+#  accompany the operating system.  Such a contradiction means you cannot
+#  use both them and the Library together in an executable that you
+#  distribute.
+# -
+# +
+#    7. You may place library facilities that are a work based on the
+#  Library side-by-side in a single library together with other library
+#  facilities not covered by this License, and distribute such a combined
+# @@ -370,7 +370,7 @@
+#  restrictions on the recipients' exercise of the rights granted herein.
+#  You are not responsible for enforcing compliance by third parties with
+#  this License.
+# -
+# +
+#    11. If, as a consequence of a court judgment or allegation of patent
+#  infringement or for any other reason (not limited to patent issues),
+#  conditions are imposed on you (whether by court order, agreement or
+# @@ -422,7 +422,7 @@
+#  the Free Software Foundation.  If the Library does not specify a
+#  license version number, you may choose any version ever published by
+#  the Free Software Foundation.
+# -
+# +
+#    14. If you wish to incorporate parts of the Library into other free
+#  programs whose distribution conditions are incompatible with these,
+#  write to the author to ask for permission.  For software which is
+# @@ -456,3 +456,46 @@
+#  DAMAGES.
+#  
+#                       END OF TERMS AND CONDITIONS
+# +
+# +           How to Apply These Terms to Your New Libraries
+# +
+# +  If you develop a new library, and you want it to be of the greatest
+# +possible use to the public, we recommend making it free software that
+# +everyone can redistribute and change.  You can do so by permitting
+# +redistribution under these terms (or, alternatively, under the terms of the
+# +ordinary General Public License).
+# +
+# +  To apply these terms, attach the following notices to the library.  It is
+# +safest to attach them to the start of each source file to most effectively
+# +convey the exclusion of warranty; and each file should have at least the
+# +"copyright" line and a pointer to where the full notice is found.
+# +
+# +    <one line to give the library's name and a brief idea of what it does.>
+# +    Copyright (C) <year>  <name of author>
+# +
+# +    This library is free software; you can redistribute it and/or
+# +    modify it under the terms of the GNU Lesser General Public
+# +    License as published by the Free Software Foundation; either
+# +    version 2.1 of the License, or (at your option) any later version.
+# +
+# +    This library is distributed in the hope that it will be useful,
+# +    but WITHOUT ANY WARRANTY; without even the implied warranty of
+# +    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+# +    Lesser General Public License for more details.
+# +
+# +    You should have received a copy of the GNU Lesser General Public
+# +    License along with this library; if not, see <https://www.gnu.org/licenses/>.
+# +
+# +Also add information on how to contact you by electronic and paper mail.
+# +
+# +You should also get your employer (if you work as a programmer) or your
+# +school, if any, to sign a "copyright disclaimer" for the library, if
+# +necessary.  Here is a sample; alter the names:
+# +
+# +  Yoyodyne, Inc., hereby disclaims all copyright interest in the
+# +  library `Frob' (a library for tweaking knobs) written by James Random Hacker.
+# +
+# +  <signature of Moe Ghoul>, 1 April 1990
+# +  Moe Ghoul, President of Vice
+# +
+# +That's all there is to it!
+# 
+#
+
 SUMMARY = "AppStream is a collaborative effort for making machine-readable software metadata easily available."
 HOMEPAGE = "https://github.com/ximion/appstream"
 LICENSE = "LGPL-2.1-only"
-LIC_FILES_CHKSUM = "file://COPYING;md5=435ed639f84d4585d93824e7da3d85da"
+LIC_FILES_CHKSUM = "file://COPYING;md5=4bf661c1e3793e55c8d1051bc5e0ae21"
 
 DEPENDS = " \
     appstream-native \
@@ -30,7 +171,7 @@ SRC_URI = " \
 	file://0002-Do-not-build-qt-tests.patch \
 	file://0003-Fix-PACKAGE_PREFIX_DIR-in-qt-cmake-AppStreamQtConfig.patch \
 "
-SRC_URI[sha256sum] = "db4439db6a33de3ca1041473501610844ddf1b72ae23016c05242c681c380b4d"
+SRC_URI[sha256sum] = "298b4732a2670503328e022d68d6ebbb253c716dad0b6ba127a4065262dd2f2c"
 
 S = "${UNPACKDIR}/AppStream-${PV}"
 
-- 
2.47.1


--===============2254429120286392314==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-appstream-upgrade-1.0.6-1.1.0.patch"

RnJvbSBmZmY5OWE4Yzg2Y2NhOGM4ZWMyNTE5ZWVhZDM2YjU0OTI0Yzc3NjJiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBPY3QgMjAyNSAxMzowMjozMSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGFw
cHN0cmVhbTogdXBncmFkZSAxLjAuNiAtPiAxLjEuMAoKLS0tCiAuLi4vMDAwMS1yZW1vdmUtaGFy
ZGNvZGVkLXBhdGgucGF0Y2ggICAgICAgICAgfCAgIDYgKy0KIC4uLi8wMDAyLURvLW5vdC1idWls
ZC1xdC10ZXN0cy5wYXRjaCAgICAgICAgICB8ICAgMiArLQogLi4uSVhfRElSLWluLXF0LWNtYWtl
LUFwcFN0cmVhbVF0Q29uZmlnLnBhdGNoIHwgICAyICstCiAuLi57YXBwc3RyZWFtXzEuMC42LmJi
ID0+IGFwcHN0cmVhbV8xLjEuMC5iYn0gfCAxNDUgKysrKysrKysrKysrKysrKystCiA0IGZpbGVz
IGNoYW5nZWQsIDE0OCBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQogcmVuYW1lIG1ldGEv
cmVjaXBlcy1zdXBwb3J0L2FwcHN0cmVhbS97YXBwc3RyZWFtXzEuMC42LmJiID0+IGFwcHN0cmVh
bV8xLjEuMC5iYn0gKDE5JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9hcHBz
dHJlYW0vYXBwc3RyZWFtLzAwMDEtcmVtb3ZlLWhhcmRjb2RlZC1wYXRoLnBhdGNoIGIvbWV0YS9y
ZWNpcGVzLXN1cHBvcnQvYXBwc3RyZWFtL2FwcHN0cmVhbS8wMDAxLXJlbW92ZS1oYXJkY29kZWQt
cGF0aC5wYXRjaAppbmRleCA1ZjRlYzI5NjI4Li40OWZkOGM1NTk2IDEwMDY0NAotLS0gYS9tZXRh
L3JlY2lwZXMtc3VwcG9ydC9hcHBzdHJlYW0vYXBwc3RyZWFtLzAwMDEtcmVtb3ZlLWhhcmRjb2Rl
ZC1wYXRoLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2FwcHN0cmVhbS9hcHBzdHJl
YW0vMDAwMS1yZW1vdmUtaGFyZGNvZGVkLXBhdGgucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9t
IGU3MTNmNGQ2Y2UyZWUxOThlYWJjYzMxYmM3MzRlODRjZGIyMGVhMzIgTW9uIFNlcCAxNyAwMDow
MDowMCAyMDAxCitGcm9tIDlhNDM4ZTJiMjY2NzQxOTQ3M2U3ZTAwN2FmOTBlZjUwODFiODQyMWUg
TW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBNYXJrdXMgVm9sayA8Zl9sX2tAdC1vbmxp
bmUuZGU+CiBEYXRlOiBNb24sIDEyIERlYyAyMDIyIDE1OjQyOjQyICswMTAwCiBTdWJqZWN0OiBb
UEFUQ0hdIHJlbW92ZSBoYXJkY29kZWQgcGF0aApAQCAtMTQsMTAgKzE0LDEwIEBAIFVwc3RyZWFt
LVN0YXR1czogSW5hcHByb3ByaWF0ZSBbb2Utc3BlY2lmaWNdCiAgMSBmaWxlIGNoYW5nZWQsIDIg
aW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKIAogZGlmZiAtLWdpdCBhL21lc29uLmJ1aWxk
IGIvbWVzb24uYnVpbGQKLWluZGV4IGVlNWIxNzkuLjhhMDZlNzUgMTAwNjQ0CitpbmRleCBjYjA5
MmQwLi43MTkzZWI4IDEwMDY0NAogLS0tIGEvbWVzb24uYnVpbGQKICsrKyBiL21lc29uLmJ1aWxk
Ci1AQCAtMTk0LDEwICsxOTQsMTAgQEAgZW5kaWYKK0BAIC0xOTMsMTAgKzE5MywxMCBAQCBlbmRp
ZgogIHN0ZW1tZXJfaW5jX2RpcnMgPSBpbmNsdWRlX2RpcmVjdG9yaWVzKCkKICBpZiBnZXRfb3B0
aW9uKCdzdGVtbWluZycpCiAgICAgIHN0ZW1tZXJfbGliID0gY2MuZmluZF9saWJyYXJ5KCdzdGVt
bWVyJywgcmVxdWlyZWQ6IHRydWUpCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9h
cHBzdHJlYW0vYXBwc3RyZWFtLzAwMDItRG8tbm90LWJ1aWxkLXF0LXRlc3RzLnBhdGNoIGIvbWV0
YS9yZWNpcGVzLXN1cHBvcnQvYXBwc3RyZWFtL2FwcHN0cmVhbS8wMDAyLURvLW5vdC1idWlsZC1x
dC10ZXN0cy5wYXRjaAppbmRleCBjZjI2MDEzMDE5Li5hYTk1OWYxYjIxIDEwMDY0NAotLS0gYS9t
ZXRhL3JlY2lwZXMtc3VwcG9ydC9hcHBzdHJlYW0vYXBwc3RyZWFtLzAwMDItRG8tbm90LWJ1aWxk
LXF0LXRlc3RzLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2FwcHN0cmVhbS9hcHBz
dHJlYW0vMDAwMi1Eby1ub3QtYnVpbGQtcXQtdGVzdHMucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1G
cm9tIGVhZmFjNzE3ODY4M2M5ZmU1YWI1MDE5MmRlYzAwNGYyNDYzOGIyZjQgTW9uIFNlcCAxNyAw
MDowMDowMCAyMDAxCitGcm9tIGFkM2RjYTlhOWY0NTFkNDNkNjkyZjkyMWUwZTc3MjllMTJmYmQ4
MzUgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBNYXJjIEZlcmxhbmQgPG1hcmMuZmVy
bGFuZEBzb25hdGVzdC5jb20+CiBEYXRlOiBGcmksIDI2IEp1bCAyMDI0IDE1OjQxOjAwIC0wNDAw
CiBTdWJqZWN0OiBbUEFUQ0hdIERvIG5vdCBidWlsZCBxdC90ZXN0cwpkaWZmIC0tZ2l0IGEvbWV0
YS9yZWNpcGVzLXN1cHBvcnQvYXBwc3RyZWFtL2FwcHN0cmVhbS8wMDAzLUZpeC1QQUNLQUdFX1BS
RUZJWF9ESVItaW4tcXQtY21ha2UtQXBwU3RyZWFtUXRDb25maWcucGF0Y2ggYi9tZXRhL3JlY2lw
ZXMtc3VwcG9ydC9hcHBzdHJlYW0vYXBwc3RyZWFtLzAwMDMtRml4LVBBQ0tBR0VfUFJFRklYX0RJ
Ui1pbi1xdC1jbWFrZS1BcHBTdHJlYW1RdENvbmZpZy5wYXRjaAppbmRleCBkMTk5NGUzYzRjLi5j
N2EzOTIxYThlIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9hcHBzdHJlYW0vYXBw
c3RyZWFtLzAwMDMtRml4LVBBQ0tBR0VfUFJFRklYX0RJUi1pbi1xdC1jbWFrZS1BcHBTdHJlYW1R
dENvbmZpZy5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9hcHBzdHJlYW0vYXBwc3Ry
ZWFtLzAwMDMtRml4LVBBQ0tBR0VfUFJFRklYX0RJUi1pbi1xdC1jbWFrZS1BcHBTdHJlYW1RdENv
bmZpZy5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gZjE5MzY1ZDhiOTBjZGU3ZDJhMzg1Zjhj
ODViNzRhMjU2NWZmMjVmYSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gMGVmNTI1NDE1
MGFjODVkNmE1Y2U5YTdhYTE5ODcyZDUyMzE4OWRjNSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEK
IEZyb206IE1hcmMgRmVybGFuZCA8bWFyYy5mZXJsYW5kQHNvbmF0ZXN0LmNvbT4KIERhdGU6IE1v
biwgMjkgSnVsIDIwMjQgMDk6MzU6NTEgLTA0MDAKIFN1YmplY3Q6IFtQQVRDSF0gRml4IFBBQ0tB
R0VfUFJFRklYX0RJUiBpbiBxdC9jbWFrZS9BcHBTdHJlYW1RdENvbmZpZy5jbWFrZS5pbgpkaWZm
IC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvYXBwc3RyZWFtL2FwcHN0cmVhbV8xLjAuNi5i
YiBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2FwcHN0cmVhbS9hcHBzdHJlYW1fMS4xLjAuYmIKc2lt
aWxhcml0eSBpbmRleCAxOSUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLXN1cHBvcnQvYXBwc3Ry
ZWFtL2FwcHN0cmVhbV8xLjAuNi5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLXN1cHBvcnQvYXBw
c3RyZWFtL2FwcHN0cmVhbV8xLjEuMC5iYgppbmRleCA2Mjc2MTM4MGY1Li4xNzQ2YTEzNjY3IDEw
MDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9hcHBzdHJlYW0vYXBwc3RyZWFtXzEuMC42
LmJiCisrKyBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2FwcHN0cmVhbS9hcHBzdHJlYW1fMS4xLjAu
YmIKQEAgLTEsNyArMSwxNDggQEAKKyMgRklYTUU6IHRoZSBMSUNfRklMRVNfQ0hLU1VNIHZhbHVl
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
YW5naW5nIGl0IGlzIG5vdCBhbGxvd2VkLgorIyAgCisjIEBAIC01NSw3ICs1NSw3IEBACisjICB0
aGF0IHdoYXQgdGhleSBoYXZlIGlzIG5vdCB0aGUgb3JpZ2luYWwgdmVyc2lvbiwgc28gdGhhdCB0
aGUgb3JpZ2luYWwKKyMgIGF1dGhvcidzIHJlcHV0YXRpb24gd2lsbCBub3QgYmUgYWZmZWN0ZWQg
YnkgcHJvYmxlbXMgdGhhdCBtaWdodCBiZQorIyAgaW50cm9kdWNlZCBieSBvdGhlcnMuCisjIC0K
KyMgKwwKKyMgICAgRmluYWxseSwgc29mdHdhcmUgcGF0ZW50cyBwb3NlIGEgY29uc3RhbnQgdGhy
ZWF0IHRvIHRoZSBleGlzdGVuY2Ugb2YKKyMgIGFueSBmcmVlIHByb2dyYW0uICBXZSB3aXNoIHRv
IG1ha2Ugc3VyZSB0aGF0IGEgY29tcGFueSBjYW5ub3QKKyMgIGVmZmVjdGl2ZWx5IHJlc3RyaWN0
IHRoZSB1c2VycyBvZiBhIGZyZWUgcHJvZ3JhbSBieSBvYnRhaW5pbmcgYQorIyBAQCAtMTExLDcg
KzExMSw3IEBACisjICAid29yayBiYXNlZCBvbiB0aGUgbGlicmFyeSIgYW5kIGEgIndvcmsgdGhh
dCB1c2VzIHRoZSBsaWJyYXJ5Ii4gIFRoZQorIyAgZm9ybWVyIGNvbnRhaW5zIGNvZGUgZGVyaXZl
ZCBmcm9tIHRoZSBsaWJyYXJ5LCB3aGVyZWFzIHRoZSBsYXR0ZXIgbXVzdAorIyAgYmUgY29tYmlu
ZWQgd2l0aCB0aGUgbGlicmFyeSBpbiBvcmRlciB0byBydW4uCisjIC0KKyMgKwwKKyMgICAgICAg
ICAgICAgICAgICAgIEdOVSBMRVNTRVIgR0VORVJBTCBQVUJMSUMgTElDRU5TRQorIyAgICAgVEVS
TVMgQU5EIENPTkRJVElPTlMgRk9SIENPUFlJTkcsIERJU1RSSUJVVElPTiBBTkQgTU9ESUZJQ0FU
SU9OCisjICAKKyMgQEAgLTE1OCw3ICsxNTgsNyBAQAorIyAgICBZb3UgbWF5IGNoYXJnZSBhIGZl
ZSBmb3IgdGhlIHBoeXNpY2FsIGFjdCBvZiB0cmFuc2ZlcnJpbmcgYSBjb3B5LAorIyAgYW5kIHlv
dSBtYXkgYXQgeW91ciBvcHRpb24gb2ZmZXIgd2FycmFudHkgcHJvdGVjdGlvbiBpbiBleGNoYW5n
ZSBmb3IgYQorIyAgZmVlLgorIyAtCisjICsMCisjICAgIDIuIFlvdSBtYXkgbW9kaWZ5IHlvdXIg
Y29weSBvciBjb3BpZXMgb2YgdGhlIExpYnJhcnkgb3IgYW55IHBvcnRpb24KKyMgIG9mIGl0LCB0
aHVzIGZvcm1pbmcgYSB3b3JrIGJhc2VkIG9uIHRoZSBMaWJyYXJ5LCBhbmQgY29weSBhbmQKKyMg
IGRpc3RyaWJ1dGUgc3VjaCBtb2RpZmljYXRpb25zIG9yIHdvcmsgdW5kZXIgdGhlIHRlcm1zIG9m
IFNlY3Rpb24gMQorIyBAQCAtMjE2LDcgKzIxNiw3IEBACisjICBvcmRpbmFyeSBHTlUgR2VuZXJh
bCBQdWJsaWMgTGljZW5zZSBoYXMgYXBwZWFyZWQsIHRoZW4geW91IGNhbiBzcGVjaWZ5CisjICB0
aGF0IHZlcnNpb24gaW5zdGVhZCBpZiB5b3Ugd2lzaC4pICBEbyBub3QgbWFrZSBhbnkgb3RoZXIg
Y2hhbmdlIGluCisjICB0aGVzZSBub3RpY2VzLgorIyAtCisjICsMCisjICAgIE9uY2UgdGhpcyBj
aGFuZ2UgaXMgbWFkZSBpbiBhIGdpdmVuIGNvcHksIGl0IGlzIGlycmV2ZXJzaWJsZSBmb3IKKyMg
IHRoYXQgY29weSwgc28gdGhlIG9yZGluYXJ5IEdOVSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlIGFw
cGxpZXMgdG8gYWxsCisjICBzdWJzZXF1ZW50IGNvcGllcyBhbmQgZGVyaXZhdGl2ZSB3b3JrcyBt
YWRlIGZyb20gdGhhdCBjb3B5LgorIyBAQCAtMjY3LDcgKzI2Nyw3IEBACisjICBkaXN0cmlidXRl
IHRoZSBvYmplY3QgY29kZSBmb3IgdGhlIHdvcmsgdW5kZXIgdGhlIHRlcm1zIG9mIFNlY3Rpb24g
Ni4KKyMgIEFueSBleGVjdXRhYmxlcyBjb250YWluaW5nIHRoYXQgd29yayBhbHNvIGZhbGwgdW5k
ZXIgU2VjdGlvbiA2LAorIyAgd2hldGhlciBvciBub3QgdGhleSBhcmUgbGlua2VkIGRpcmVjdGx5
IHdpdGggdGhlIExpYnJhcnkgaXRzZWxmLgorIyAtCisjICsMCisjICAgIDYuIEFzIGFuIGV4Y2Vw
dGlvbiB0byB0aGUgU2VjdGlvbnMgYWJvdmUsIHlvdSBtYXkgYWxzbyBjb21iaW5lIG9yCisjICBs
aW5rIGEgIndvcmsgdGhhdCB1c2VzIHRoZSBMaWJyYXJ5IiB3aXRoIHRoZSBMaWJyYXJ5IHRvIHBy
b2R1Y2UgYQorIyAgd29yayBjb250YWluaW5nIHBvcnRpb25zIG9mIHRoZSBMaWJyYXJ5LCBhbmQg
ZGlzdHJpYnV0ZSB0aGF0IHdvcmsKKyMgQEAgLTMyOSw3ICszMjksNyBAQAorIyAgYWNjb21wYW55
IHRoZSBvcGVyYXRpbmcgc3lzdGVtLiAgU3VjaCBhIGNvbnRyYWRpY3Rpb24gbWVhbnMgeW91IGNh
bm5vdAorIyAgdXNlIGJvdGggdGhlbSBhbmQgdGhlIExpYnJhcnkgdG9nZXRoZXIgaW4gYW4gZXhl
Y3V0YWJsZSB0aGF0IHlvdQorIyAgZGlzdHJpYnV0ZS4KKyMgLQorIyArDAorIyAgICA3LiBZb3Ug
bWF5IHBsYWNlIGxpYnJhcnkgZmFjaWxpdGllcyB0aGF0IGFyZSBhIHdvcmsgYmFzZWQgb24gdGhl
CisjICBMaWJyYXJ5IHNpZGUtYnktc2lkZSBpbiBhIHNpbmdsZSBsaWJyYXJ5IHRvZ2V0aGVyIHdp
dGggb3RoZXIgbGlicmFyeQorIyAgZmFjaWxpdGllcyBub3QgY292ZXJlZCBieSB0aGlzIExpY2Vu
c2UsIGFuZCBkaXN0cmlidXRlIHN1Y2ggYSBjb21iaW5lZAorIyBAQCAtMzcwLDcgKzM3MCw3IEBA
CisjICByZXN0cmljdGlvbnMgb24gdGhlIHJlY2lwaWVudHMnIGV4ZXJjaXNlIG9mIHRoZSByaWdo
dHMgZ3JhbnRlZCBoZXJlaW4uCisjICBZb3UgYXJlIG5vdCByZXNwb25zaWJsZSBmb3IgZW5mb3Jj
aW5nIGNvbXBsaWFuY2UgYnkgdGhpcmQgcGFydGllcyB3aXRoCisjICB0aGlzIExpY2Vuc2UuCisj
IC0KKyMgKwwKKyMgICAgMTEuIElmLCBhcyBhIGNvbnNlcXVlbmNlIG9mIGEgY291cnQganVkZ21l
bnQgb3IgYWxsZWdhdGlvbiBvZiBwYXRlbnQKKyMgIGluZnJpbmdlbWVudCBvciBmb3IgYW55IG90
aGVyIHJlYXNvbiAobm90IGxpbWl0ZWQgdG8gcGF0ZW50IGlzc3VlcyksCisjICBjb25kaXRpb25z
IGFyZSBpbXBvc2VkIG9uIHlvdSAod2hldGhlciBieSBjb3VydCBvcmRlciwgYWdyZWVtZW50IG9y
CisjIEBAIC00MjIsNyArNDIyLDcgQEAKKyMgIHRoZSBGcmVlIFNvZnR3YXJlIEZvdW5kYXRpb24u
ICBJZiB0aGUgTGlicmFyeSBkb2VzIG5vdCBzcGVjaWZ5IGEKKyMgIGxpY2Vuc2UgdmVyc2lvbiBu
dW1iZXIsIHlvdSBtYXkgY2hvb3NlIGFueSB2ZXJzaW9uIGV2ZXIgcHVibGlzaGVkIGJ5CisjICB0
aGUgRnJlZSBTb2Z0d2FyZSBGb3VuZGF0aW9uLgorIyAtCisjICsMCisjICAgIDE0LiBJZiB5b3Ug
d2lzaCB0byBpbmNvcnBvcmF0ZSBwYXJ0cyBvZiB0aGUgTGlicmFyeSBpbnRvIG90aGVyIGZyZWUK
KyMgIHByb2dyYW1zIHdob3NlIGRpc3RyaWJ1dGlvbiBjb25kaXRpb25zIGFyZSBpbmNvbXBhdGli
bGUgd2l0aCB0aGVzZSwKKyMgIHdyaXRlIHRvIHRoZSBhdXRob3IgdG8gYXNrIGZvciBwZXJtaXNz
aW9uLiAgRm9yIHNvZnR3YXJlIHdoaWNoIGlzCisjIEBAIC00NTYsMyArNDU2LDQ2IEBACisjICBE
QU1BR0VTLgorIyAgCisjICAgICAgICAgICAgICAgICAgICAgICBFTkQgT0YgVEVSTVMgQU5EIENP
TkRJVElPTlMKKyMgKwwKKyMgKyAgICAgICAgICAgSG93IHRvIEFwcGx5IFRoZXNlIFRlcm1zIHRv
IFlvdXIgTmV3IExpYnJhcmllcworIyArCisjICsgIElmIHlvdSBkZXZlbG9wIGEgbmV3IGxpYnJh
cnksIGFuZCB5b3Ugd2FudCBpdCB0byBiZSBvZiB0aGUgZ3JlYXRlc3QKKyMgK3Bvc3NpYmxlIHVz
ZSB0byB0aGUgcHVibGljLCB3ZSByZWNvbW1lbmQgbWFraW5nIGl0IGZyZWUgc29mdHdhcmUgdGhh
dAorIyArZXZlcnlvbmUgY2FuIHJlZGlzdHJpYnV0ZSBhbmQgY2hhbmdlLiAgWW91IGNhbiBkbyBz
byBieSBwZXJtaXR0aW5nCisjICtyZWRpc3RyaWJ1dGlvbiB1bmRlciB0aGVzZSB0ZXJtcyAob3Is
IGFsdGVybmF0aXZlbHksIHVuZGVyIHRoZSB0ZXJtcyBvZiB0aGUKKyMgK29yZGluYXJ5IEdlbmVy
YWwgUHVibGljIExpY2Vuc2UpLgorIyArCisjICsgIFRvIGFwcGx5IHRoZXNlIHRlcm1zLCBhdHRh
Y2ggdGhlIGZvbGxvd2luZyBub3RpY2VzIHRvIHRoZSBsaWJyYXJ5LiAgSXQgaXMKKyMgK3NhZmVz
dCB0byBhdHRhY2ggdGhlbSB0byB0aGUgc3RhcnQgb2YgZWFjaCBzb3VyY2UgZmlsZSB0byBtb3N0
IGVmZmVjdGl2ZWx5CisjICtjb252ZXkgdGhlIGV4Y2x1c2lvbiBvZiB3YXJyYW50eTsgYW5kIGVh
Y2ggZmlsZSBzaG91bGQgaGF2ZSBhdCBsZWFzdCB0aGUKKyMgKyJjb3B5cmlnaHQiIGxpbmUgYW5k
IGEgcG9pbnRlciB0byB3aGVyZSB0aGUgZnVsbCBub3RpY2UgaXMgZm91bmQuCisjICsKKyMgKyAg
ICA8b25lIGxpbmUgdG8gZ2l2ZSB0aGUgbGlicmFyeSdzIG5hbWUgYW5kIGEgYnJpZWYgaWRlYSBv
ZiB3aGF0IGl0IGRvZXMuPgorIyArICAgIENvcHlyaWdodCAoQykgPHllYXI+ICA8bmFtZSBvZiBh
dXRob3I+CisjICsKKyMgKyAgICBUaGlzIGxpYnJhcnkgaXMgZnJlZSBzb2Z0d2FyZTsgeW91IGNh
biByZWRpc3RyaWJ1dGUgaXQgYW5kL29yCisjICsgICAgbW9kaWZ5IGl0IHVuZGVyIHRoZSB0ZXJt
cyBvZiB0aGUgR05VIExlc3NlciBHZW5lcmFsIFB1YmxpYworIyArICAgIExpY2Vuc2UgYXMgcHVi
bGlzaGVkIGJ5IHRoZSBGcmVlIFNvZnR3YXJlIEZvdW5kYXRpb247IGVpdGhlcgorIyArICAgIHZl
cnNpb24gMi4xIG9mIHRoZSBMaWNlbnNlLCBvciAoYXQgeW91ciBvcHRpb24pIGFueSBsYXRlciB2
ZXJzaW9uLgorIyArCisjICsgICAgVGhpcyBsaWJyYXJ5IGlzIGRpc3RyaWJ1dGVkIGluIHRoZSBo
b3BlIHRoYXQgaXQgd2lsbCBiZSB1c2VmdWwsCisjICsgICAgYnV0IFdJVEhPVVQgQU5ZIFdBUlJB
TlRZOyB3aXRob3V0IGV2ZW4gdGhlIGltcGxpZWQgd2FycmFudHkgb2YKKyMgKyAgICBNRVJDSEFO
VEFCSUxJVFkgb3IgRklUTkVTUyBGT1IgQSBQQVJUSUNVTEFSIFBVUlBPU0UuICBTZWUgdGhlIEdO
VQorIyArICAgIExlc3NlciBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlIGZvciBtb3JlIGRldGFpbHMu
CisjICsKKyMgKyAgICBZb3Ugc2hvdWxkIGhhdmUgcmVjZWl2ZWQgYSBjb3B5IG9mIHRoZSBHTlUg
TGVzc2VyIEdlbmVyYWwgUHVibGljCisjICsgICAgTGljZW5zZSBhbG9uZyB3aXRoIHRoaXMgbGli
cmFyeTsgaWYgbm90LCBzZWUgPGh0dHBzOi8vd3d3LmdudS5vcmcvbGljZW5zZXMvPi4KKyMgKwor
IyArQWxzbyBhZGQgaW5mb3JtYXRpb24gb24gaG93IHRvIGNvbnRhY3QgeW91IGJ5IGVsZWN0cm9u
aWMgYW5kIHBhcGVyIG1haWwuCisjICsKKyMgK1lvdSBzaG91bGQgYWxzbyBnZXQgeW91ciBlbXBs
b3llciAoaWYgeW91IHdvcmsgYXMgYSBwcm9ncmFtbWVyKSBvciB5b3VyCisjICtzY2hvb2wsIGlm
IGFueSwgdG8gc2lnbiBhICJjb3B5cmlnaHQgZGlzY2xhaW1lciIgZm9yIHRoZSBsaWJyYXJ5LCBp
ZgorIyArbmVjZXNzYXJ5LiAgSGVyZSBpcyBhIHNhbXBsZTsgYWx0ZXIgdGhlIG5hbWVzOgorIyAr
CisjICsgIFlveW9keW5lLCBJbmMuLCBoZXJlYnkgZGlzY2xhaW1zIGFsbCBjb3B5cmlnaHQgaW50
ZXJlc3QgaW4gdGhlCisjICsgIGxpYnJhcnkgYEZyb2InIChhIGxpYnJhcnkgZm9yIHR3ZWFraW5n
IGtub2JzKSB3cml0dGVuIGJ5IEphbWVzIFJhbmRvbSBIYWNrZXIuCisjICsKKyMgKyAgPHNpZ25h
dHVyZSBvZiBNb2UgR2hvdWw+LCAxIEFwcmlsIDE5OTAKKyMgKyAgTW9lIEdob3VsLCBQcmVzaWRl
bnQgb2YgVmljZQorIyArCisjICtUaGF0J3MgYWxsIHRoZXJlIGlzIHRvIGl0IQorIyAKKyMKKwog
U1VNTUFSWSA9ICJBcHBTdHJlYW0gaXMgYSBjb2xsYWJvcmF0aXZlIGVmZm9ydCBmb3IgbWFraW5n
IG1hY2hpbmUtcmVhZGFibGUgc29mdHdhcmUgbWV0YWRhdGEgZWFzaWx5IGF2YWlsYWJsZS4iCiBI
T01FUEFHRSA9ICJodHRwczovL2dpdGh1Yi5jb20veGltaW9uL2FwcHN0cmVhbSIKIExJQ0VOU0Ug
PSAiTEdQTC0yLjEtb25seSIKLUxJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0NPUFlJTkc7bWQ1
PTQzNWVkNjM5Zjg0ZDQ1ODVkOTM4MjRlN2RhM2Q4NWRhIgorTElDX0ZJTEVTX0NIS1NVTSA9ICJm
aWxlOi8vQ09QWUlORzttZDU9NGJmNjYxYzFlMzc5M2U1NWM4ZDEwNTFiYzVlMGFlMjEiCiAKIERF
UEVORFMgPSAiIFwKICAgICBhcHBzdHJlYW0tbmF0aXZlIFwKQEAgLTMwLDcgKzE3MSw3IEBAIFNS
Q19VUkkgPSAiIFwKIAlmaWxlOi8vMDAwMi1Eby1ub3QtYnVpbGQtcXQtdGVzdHMucGF0Y2ggXAog
CWZpbGU6Ly8wMDAzLUZpeC1QQUNLQUdFX1BSRUZJWF9ESVItaW4tcXQtY21ha2UtQXBwU3RyZWFt
UXRDb25maWcucGF0Y2ggXAogIgotU1JDX1VSSVtzaGEyNTZzdW1dID0gImRiNDQzOWRiNmEzM2Rl
M2NhMTA0MTQ3MzUwMTYxMDg0NGRkZjFiNzJhZTIzMDE2YzA1MjQyYzY4MWMzODBiNGQiCitTUkNf
VVJJW3NoYTI1NnN1bV0gPSAiMjk4YjQ3MzJhMjY3MDUwMzMyOGUwMjJkNjhkNmViYmIyNTNjNzE2
ZGFkMGI2YmExMjdhNDA2NTI2MmRkMmYyYyIKIAogUyA9ICIke1VOUEFDS0RJUn0vQXBwU3RyZWFt
LSR7UFZ9IgogCi0tIAoyLjQ3LjEKCg==

--===============2254429120286392314==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1940 entries from dependency cache.
Parsing recipes...done.
Parsing of 944 .bb files complete (943 cached, 1 parsed). 1939 targets, 43 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "5.2.99+snapshot-e9d4b3899c462f901c0b2e96298ca55c17904638"
TUNE_FEATURES        = "m64 x86-64-v3"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:e9d4b3899c462f901c0b2e96298ca55c17904638"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 290 Local 273 Mirrors 0 Missed 17 Current 500 (94% match, 97% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 591 of 790 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_create_spdx_setscene)
NOTE: Running setscene task 592 of 790 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.23.bb:do_create_spdx_setscene)
NOTE: Running setscene task 593 of 790 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.18.bb:do_create_spdx_setscene)
NOTE: Running setscene task 595 of 790 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd_257.8.bb:do_create_spdx_setscene)
NOTE: Running setscene task 599 of 790 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.16.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 600 of 790 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.23.bb:do_create_spdx_setscene)
NOTE: Running task 1117 of 2223 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/appstream/appstream_1.1.0.bb:do_recipe_qa)
NOTE: Running task 1120 of 2223 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/appstream/appstream_1.1.0.bb:do_recipe_qa)
NOTE: Running task 1202 of 2223 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/appstream/appstream_1.1.0.bb:do_write_config)
NOTE: Running task 1203 of 2223 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/appstream/appstream_1.1.0.bb:do_write_config)
NOTE: recipe libyaml-0.2.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe vala-0.56.18-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxmlb-0.3.23-r0: task do_create_spdx_setscene: Started
NOTE: recipe curl-8.16.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe appstream-1.1.0-r0: task do_recipe_qa: Started
NOTE: recipe systemd-1_257.8-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxmlb-native-0.3.23-r0: task do_create_spdx_setscene: Started
NOTE: recipe appstream-native-1.1.0-r0: task do_recipe_qa: Started
NOTE: recipe libyaml-0.2.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe appstream-1.1.0-r0: task do_write_config: Started
NOTE: recipe vala-0.56.18-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxmlb-0.3.23-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 612 of 790 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.86.0.bb:do_create_spdx_setscene)
NOTE: recipe appstream-native-1.1.0-r0: task do_write_config: Started
NOTE: recipe curl-8.16.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxmlb-native-0.3.23-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe appstream-1.1.0-r0: task do_write_config: Succeeded
NOTE: recipe systemd-1_257.8-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 668 of 790 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.14.6.bb:do_create_spdx_setscene)
NOTE: recipe appstream-native-1.1.0-r0: task do_write_config: Succeeded
NOTE: recipe glib-2.0-1_2.86.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe appstream-1.1.0-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1459 of 2223 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/appstream/appstream_1.1.0.bb:do_fetch)
NOTE: recipe libxml2-2.14.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe glib-2.0-1_2.86.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 690 of 790 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_create_spdx_setscene)
NOTE: recipe appstream-1.1.0-r0: task do_fetch: Started
NOTE: recipe libxml2-2.14.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe appstream-1.1.0-r0: task do_fetch: Succeeded
NOTE: Running task 1482 of 2223 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/appstream/appstream_1.1.0.bb:do_unpack)
NOTE: recipe gobject-introspection-1.84.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe appstream-native-1.1.0-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1483 of 2223 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/appstream/appstream_1.1.0.bb:do_fetch)
NOTE: recipe appstream-1.1.0-r0: task do_unpack: Started
NOTE: recipe gobject-introspection-1.84.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 762 of 790 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_create_spdx_setscene)
NOTE: recipe appstream-native-1.1.0-r0: task do_fetch: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe appstream-native-1.1.0-r0: task do_fetch: Succeeded
NOTE: Running task 1569 of 2223 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/appstream/appstream_1.1.0.bb:do_unpack)
NOTE: Running task 1570 of 2223 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/appstream/appstream_1.1.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe appstream-1.1.0-r0: task do_unpack: Succeeded
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running task 1571 of 2223 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/appstream/appstream_1.1.0.bb:do_patch)
NOTE: Running setscene task 768 of 790 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.42.bb:do_create_spdx_setscene)
NOTE: recipe appstream-1.1.0-r0: task do_patch: Started
NOTE: recipe appstream-native-1.1.0-r0: task do_unpack: Started
NOTE: recipe appstream-native-1.1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe glibc-2.42+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe glibc-2.42+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 774 of 790 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_15.2.bb:do_create_spdx_setscene)
NOTE: recipe gcc-cross-x86_64-15.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe appstream-native-1.1.0-r0: task do_unpack: Succeeded
NOTE: Running task 1580 of 2223 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/appstream/appstream_1.1.0.bb:do_patch)
NOTE: Running task 1581 of 2223 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/appstream/appstream_1.1.0.bb:do_collect_spdx_deps)
NOTE: recipe appstream-1.1.0-r0: task do_patch: Succeeded
NOTE: Running task 1582 of 2223 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/appstream/appstream_1.1.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1583 of 2223 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/appstream/appstream_1.1.0.bb:do_populate_lic)
NOTE: recipe gcc-cross-x86_64-15.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 781 of 790 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_15.2.bb:do_populate_sysroot_setscene)
NOTE: recipe appstream-1.1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe appstream-native-1.1.0-r0: task do_patch: Started
NOTE: recipe appstream-1.1.0-r0: task do_populate_lic: Started
NOTE: recipe gcc-cross-x86_64-15.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe appstream-native-1.1.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe appstream-native-1.1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe appstream-native-1.1.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe appstream-1.1.0-r0: task do_populate_lic: Succeeded
NOTE: recipe appstream-1.1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe appstream-native-1.1.0-r0: task do_patch: Succeeded
NOTE: Running task 1631 of 2223 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/appstream/appstream_1.1.0.bb:do_deploy_source_date_epoch)
NOTE: recipe appstream-native-1.1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe appstream-native-1.1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1632 of 2223 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/appstream/appstream_1.1.0.bb:do_configure)
NOTE: recipe appstream-native-1.1.0-r0: task do_configure: Started
NOTE: recipe gcc-cross-x86_64-15.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
Log data follows:
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are ['/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/gettext/gettext-minimal-native_0.26.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/quilt/quilt-native_0.69.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.86.0.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.14.6.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/docbook-xml/docbook-xml-dtd4_4.5.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/docbook-xml/docbook-xsl-stylesheets_1.79.1.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/meson/meson_1.9.0.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/ninja/ninja_1.13.1.bb:d
 o_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pygments_2.19.2.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.7.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.18.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gperf/gperf_3.3.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.8.1.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.23.bb
 :do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.16.0.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/itstool/itstool_2.0.7.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libxslt/libxslt_1.1.43.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_populate_sysroot']
| NOTE: Installed into sysroot: []
| NOTE: Skipping as already exists in sysroot: ['gettext-minimal-native', 'cmake-native', 'libtool-native', 'm4-native', 'quilt-native', 'texinfo-dummy-native', 'openssl-native', 'expat-native', 'gettext-native', 'glib-2.0-native', 'libxml2-native', 'ncurses-native', 'util-linux-libuuid-native', 'zlib-native', 'docbook-xml-dtd4-native', 'docbook-xsl-stylesheets-native', 'flex-native', 'gnu-config-native', 'libedit-native', 'make-native', 'meson-native', 'ninja-native', 'perl-native', 'pkgconfig-native', 'python3-build-native', 'python3-calver-native', 'python3-editables-native', 'python3-flit-core-native', 'python3-hatchling-native', 'python3-installer-native', 'python3-packaging-native', 'python3-pathspec-native', 'python3-pluggy-native', 'python3-pygments-native', 'python3-pyproject-hooks-native', 'python3-setuptools-scm-native', 'python3-setuptools-native', 'python3-trove-classifiers-native', 'python3-wheel-native', 'python3-native', 'vala-native', 'bzip2-native', 'gperf-native', 
 'unzip-native', 'xz-native', 'zstd-native', 'gobject-introspection-native', 'libxmlb-native', 'curl-native', 'gdbm-native', 'itstool-native', 'libffi-native', 'libpcre2-native', 'libxslt-native', 'libyaml-native', 're2c-native', 'sqlite3-native']
| DEBUG: Python function extend_recipe_sysroot finished
| DEBUG: Executing shell function do_configure
| NOTE: Executing meson -Dapidocs=false -Dgir=false -Dvapi=true -Dqt=false -Dstemming=false -Dsystemd=false...
| The Meson build system
| Version: 1.9.0
| Source dir: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/appstream-native/1.1.0/sources/AppStream-1.1.0
| Build dir: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/appstream-native/1.1.0/build
| Build type: native build
| Project name: AppStream
| Project version: 1.1.0
| C compiler for the host machine: gcc (gcc 14.2.0 "gcc (GCC) 14.2.0")
| C linker for the host machine: gcc ld.bfd 2.43.1.20241111
| Host machine cpu family: x86_64
| Host machine cpu: x86_64
| Compiler for C supports arguments -Werror=shadow: YES
| Compiler for C supports arguments -Werror=empty-body: YES
| Compiler for C supports arguments -Werror=strict-prototypes: YES
| Compiler for C supports arguments -Werror=missing-prototypes: YES
| Compiler for C supports arguments -Werror=implicit-function-declaration: YES
| Compiler for C supports arguments -Werror=pointer-arith: YES
| Compiler for C supports arguments -Werror=missing-declarations: YES
| Compiler for C supports arguments -Werror=return-type: YES
| Compiler for C supports arguments -Werror=int-conversion: YES
| Compiler for C supports arguments -Werror=incompatible-pointer-types: YES
| Compiler for C supports arguments -Werror=misleading-indentation: YES
| Compiler for C supports arguments -Werror=missing-include-dirs: YES
| Compiler for C supports arguments -Werror=declaration-after-statement: YES
| Compiler for C supports arguments -Werror=format-security: NO
| Compiler for C supports arguments -Wno-missing-field-initializers: YES
| Compiler for C supports arguments -Wno-error=missing-field-initializers: YES
| Compiler for C supports arguments -Wno-unused-parameter: YES
| Compiler for C supports arguments -Wno-error=unused-parameter: YES
| Found pkg-config: YES (/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/appstream-native/1.1.0/recipe-sysroot-native/usr/bin/pkg-config-native) 0.29.2
| Run-time dependency glib-2.0 found: YES 2.86.0
| Run-time dependency gobject-2.0 found: YES 2.86.0
| Run-time dependency gio-2.0 found: YES 2.86.0
| Run-time dependency libcurl found: YES 8.16.0
| Run-time dependency libxml-2.0 found: YES 2.14.6
| Found CMake: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/appstream-native/1.1.0/recipe-sysroot-native/usr/bin/cmake (4.1.1)
| Run-time dependency libfyaml found: NO (tried pkgconfig and cmake)
| 
| ../sources/AppStream-1.1.0/meson.build:172:12: ERROR: Dependency "libfyaml" not found, tried pkgconfig and cmake
| 
| A full log can be found at /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/appstream-native/1.1.0/build/meson-logs/meson-log.txt
| ERROR: meson failed
| WARNING: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/appstream-native/1.1.0/temp/run.do_configure.211663:175 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/appstream-native/1.1.0/temp/run.do_configure.211663, line 175
| 	#2: meson_do_configure, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/appstream-native/1.1.0/temp/run.do_configure.211663, line 164
| 	#3: do_configure, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/appstream-native/1.1.0/temp/run.do_configure.211663, line 153
| 	#4: main, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/appstream-native/1.1.0/temp/run.do_configure.211663, line 188
NOTE: recipe appstream-native-1.1.0-r0: task do_configure: Failed
NOTE: Tasks Summary: Attempted 2204 tasks of which 2188 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20251001130216.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20251001130216.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/appstream/appstream_1.1.0.bb:do_configure
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/appstream-native/1.1.0/temp/log.do_configure.211663
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: appstream-native-1.1.0-r0 do_configure: meson failed
ERROR: appstream-native-1.1.0-r0 do_configure: Execution of '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/appstream-native/1.1.0/temp/run.do_configure.211663' failed with exit code 1
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/appstream-native/1.1.0/temp/log.do_configure.211663
ERROR: Task (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/appstream/appstream_1.1.0.bb:do_configure) failed with exit code '1'

--===============2254429120286392314==--

