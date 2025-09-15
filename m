Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28AD0CAC5AD
	for <webhook@archiver.kernel.org>; Mon, 15 Sep 2025 11:54:48 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web10.30891.1757937282164102890
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Sep 2025 04:54:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=oy2gWCqe;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=s3kDj9is;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 010101994d3a29c1-6bd4d649-248a-4ae1-8e0b-ee9780cd1d76-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1757937281;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=lPNyeWBAxUoxzQ73OH+VEDjrN0d55UsvmAfoL/mRt/c=;
	b=oy2gWCqe7R76P1Wr8Fbx2PNTm6hdPKyogdh+NZUy9baBQXUZy4WqYpulFqkTgeLY
	gAV9UdEQIoXgN+63X8MGE9zxTMnVRykbS9Mnh+WH6YGwK0LwEONkJ2hyEdbVYwGJeWF
	48UckAJ0n7BvZ3US3cBQIuMRAiJWP5ODSr1e/BbY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1757937281;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=lPNyeWBAxUoxzQ73OH+VEDjrN0d55UsvmAfoL/mRt/c=;
	b=s3kDj9isCvTngJ89d/Ke5R74G/ZLjlLhqXDt/BYrg1dYaWJBiSTeJ+wDgnNuo+mi
	iqDeUUeKiKS4E33tSRWIcgjZeAYfMrVx4UGWlaLEdzOUkehwqcqL7152UTLh1Fi3YiK
	yjKP0NW5MguQhbM0uLPJ4wmjFJgHJBQRQ6k2N6W0=
Content-Type: multipart/mixed; boundary="===============6367800068944982985=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Zang Ruochen <zangruochen@loongson.cn>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-pygobject: upgrading to 3.54.2 SUCCEEDED
Message-ID: <010101994d3a29c1-6bd4d649-248a-4ae1-8e0b-ee9780cd1d76-000000@us-west-2.amazonses.com>
Date: Mon, 15 Sep 2025 11:54:41 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.09.15-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Sep 2025 11:54:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223428

--===============6367800068944982985==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-pygobject* to *3.54.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-pygobject-upgrade-3.52.3-3.54.2.patch
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
From 9b1eb0adcaf43a9864cb3f2bfbfd3701e9898827 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 15 Sep 2025 08:20:48 +0000
Subject: [PATCH] python3-pygobject: upgrade 3.52.3 -> 3.54.2

---
 ..._3.52.3.bb => python3-pygobject_3.54.2.bb} | 107 +++++++++++++++++-
 1 file changed, 105 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-pygobject_3.52.3.bb => python3-pygobject_3.54.2.bb} (23%)

diff --git a/meta/recipes-devtools/python/python3-pygobject_3.52.3.bb b/meta/recipes-devtools/python/python3-pygobject_3.54.2.bb
similarity index 23%
rename from meta/recipes-devtools/python/python3-pygobject_3.52.3.bb
rename to meta/recipes-devtools/python/python3-pygobject_3.54.2.bb
index 42b071ca08..b14286f818 100644
--- a/meta/recipes-devtools/python/python3-pygobject_3.52.3.bb
+++ b/meta/recipes-devtools/python/python3-pygobject_3.54.2.bb
@@ -1,9 +1,112 @@
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
+#  		  GNU LESSER GENERAL PUBLIC LICENSE
+#     TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION
+#  
+# @@ -146,7 +146,7 @@
+#  on the Library (independent of the use of the Library in a tool for
+#  writing it).  Whether that is true depends on what the Library does
+#  and what the program that uses the Library does.
+# -  
+# +
+#    1. You may copy and distribute verbatim copies of the Library's
+#  complete source code as you receive it, in any medium, provided that
+#  you conspicuously and appropriately publish on each copy an
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
+# @@ -456,7 +456,7 @@
+#  DAMAGES.
+#  
+#  		     END OF TERMS AND CONDITIONS
+# -
+# +
+#             How to Apply These Terms to Your New Libraries
+#  
+#    If you develop a new library, and you want it to be of the greatest
+# 
+#
+
 SUMMARY = "Python GObject bindings"
 HOMEPAGE = "https://gitlab.gnome.org/GNOME/pygobject"
 DESCRIPTION = "PyGObject is a Python package which provides bindings for GObject based libraries such as GTK, GStreamer, WebKitGTK, GLib, GIO and many more."
 SECTION = "devel/python"
 LICENSE = "LGPL-2.1-only"
-LIC_FILES_CHKSUM = "file://COPYING;md5=a916467b91076e631dd8edb7424769c7"
+LIC_FILES_CHKSUM = "file://COPYING;md5=91db794c3adc9d824d4eddabb341e816"
 
 GIR_MESON_OPTION = ""
 
@@ -19,7 +122,7 @@ DEPENDS += "python3 glib-2.0"
 SRCNAME = "pygobject"
 
 SRC_URI = "http://ftp.gnome.org/pub/GNOME/sources/${SRCNAME}/${@gnome_verdir("${PV}")}/${SRCNAME}-${PV}.tar.gz"
-SRC_URI[sha256sum] = "00e427d291e957462a8fad659a9f9c8be776ff82a8b76bdf402f1eaeec086d82"
+SRC_URI[sha256sum] = "03cffeb49d8a1879b621d8f606ac904218019a0ae699b1cd3780a8ee611e696b"
 
 S = "${UNPACKDIR}/${SRCNAME}-${PV}"
 
-- 
2.47.1


--===============6367800068944982985==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-pygobject: PKGV changed from 3.52.3 [default] to 3.54.2 [default]
packages/x86-64-v3-poky-linux/python3-pygobject: SRC_URI changed from "http://ftp.gnome.org/pub/GNOME/sources/pygobject/3.52/pygobject-3.52.3.tar.gz" to "http://ftp.gnome.org/pub/GNOME/sources/pygobject/3.54/pygobject-3.54.2.tar.gz"
packages/x86-64-v3-poky-linux/python3-pygobject: PV changed from "3.52.3" to "3.54.2"
packages/x86-64-v3-poky-linux/python3-pygobject/python3-pygobject-dbg: PKGSIZE changed from 1457696 to 1463200 (+0%)
packages/x86-64-v3-poky-linux/python3-pygobject/python3-pygobject-dbg: PKGV changed from 3.52.3 [default] to 3.54.2 [default]
packages/x86-64-v3-poky-linux/python3-pygobject/python3-pygobject-dbg: PV changed from "3.52.3" to "3.54.2"
packages/x86-64-v3-poky-linux/python3-pygobject/python3-pygobject-dev: PKGSIZE changed from 25227 to 28308 (+12%)
packages/x86-64-v3-poky-linux/python3-pygobject/python3-pygobject-dev: PKGV changed from 3.52.3 [default] to 3.54.2 [default]
packages/x86-64-v3-poky-linux/python3-pygobject/python3-pygobject-dev: PV changed from "3.52.3" to "3.54.2"
packages/x86-64-v3-poky-linux/python3-pygobject/python3-pygobject-doc: PKGV changed from 3.52.3 [default] to 3.54.2 [default]
packages/x86-64-v3-poky-linux/python3-pygobject/python3-pygobject-doc: PV changed from "3.52.3" to "3.54.2"
packages/x86-64-v3-poky-linux/python3-pygobject/python3-pygobject-locale: PKGV changed from 3.52.3 [default] to 3.54.2 [default]
packages/x86-64-v3-poky-linux/python3-pygobject/python3-pygobject-locale: PV changed from "3.52.3" to "3.54.2"
packages/x86-64-v3-poky-linux/python3-pygobject/python3-pygobject-src: PKGV changed from 3.52.3 [default] to 3.54.2 [default]
packages/x86-64-v3-poky-linux/python3-pygobject/python3-pygobject-src: PV changed from "3.52.3" to "3.54.2"
packages/x86-64-v3-poky-linux/python3-pygobject/python3-pygobject-staticdev: PKGV changed from 3.52.3 [default] to 3.54.2 [default]
packages/x86-64-v3-poky-linux/python3-pygobject/python3-pygobject-staticdev: PV changed from "3.52.3" to "3.54.2"
packages/x86-64-v3-poky-linux/python3-pygobject/python3-pygobject: PKGSIZE changed from 1094057 to 1111810 (+2%)
packages/x86-64-v3-poky-linux/python3-pygobject/python3-pygobject: PKGV changed from 3.52.3 [default] to 3.54.2 [default]
packages/x86-64-v3-poky-linux/python3-pygobject/python3-pygobject: PV changed from "3.52.3" to "3.54.2"
Changes to packages/x86-64-v3-poky-linux/python3-pygobject (sysroot):
  /usr/lib/python3.13/site-packages/PyGObject-3.52.3.dist-info moved to /usr/lib/python3.13/site-packages/PyGObject-3.54.2.dist-info

--===============6367800068944982985==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-pygobject/python3-pygobject-dev: PKGSIZE changed from 25227 to 28308 (+12%)
Changes to packages/x86-64-v3-poky-linux/python3-pygobject (sysroot):
  /usr/lib/python3.13/site-packages/PyGObject-3.52.3.dist-info moved to /usr/lib/python3.13/site-packages/PyGObject-3.54.2.dist-info

--===============6367800068944982985==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-pygobject-upgrade-3.52.3-3.54.2.patch"

RnJvbSA5YjFlYjBhZGNhZjQzYTk4NjRjYjNmMmJmYmZkMzcwMWU5ODk4ODI3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTUgU2VwIDIwMjUgMDg6MjA6NDggKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXB5Z29iamVjdDogdXBncmFkZSAzLjUyLjMgLT4gMy41NC4yCgotLS0KIC4uLl8zLjUy
LjMuYmIgPT4gcHl0aG9uMy1weWdvYmplY3RfMy41NC4yLmJifSB8IDEwNyArKysrKysrKysrKysr
KysrKy0KIDEgZmlsZSBjaGFuZ2VkLCAxMDUgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkK
IHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLXB5Z29iamVjdF8z
LjUyLjMuYmIgPT4gcHl0aG9uMy1weWdvYmplY3RfMy41NC4yLmJifSAoMjMlKQoKZGlmZiAtLWdp
dCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1weWdvYmplY3RfMy41Mi4z
LmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXB5Z29iamVjdF8zLjU0
LjIuYmIKc2ltaWxhcml0eSBpbmRleCAyMyUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3B5dGhvbi9weXRob24zLXB5Z29iamVjdF8zLjUyLjMuYmIKcmVuYW1lIHRvIG1ldGEvcmVj
aXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1weWdvYmplY3RfMy41NC4yLmJiCmluZGV4IDQy
YjA3MWNhMDguLmIxNDI4NmY4MTggMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9w
eXRob24vcHl0aG9uMy1weWdvYmplY3RfMy41Mi4zLmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0
b29scy9weXRob24vcHl0aG9uMy1weWdvYmplY3RfMy41NC4yLmJiCkBAIC0xLDkgKzEsMTEyIEBA
CisjIEZJWE1FOiB0aGUgTElDX0ZJTEVTX0NIS1NVTSB2YWx1ZXMgaGF2ZSBiZWVuIHVwZGF0ZWQg
YnkgJ2RldnRvb2wgdXBncmFkZScuCisjIFRoZSBmb2xsb3dpbmcgaXMgdGhlIGRpZmZlcmVuY2Ug
YmV0d2VlbiB0aGUgb2xkIGFuZCB0aGUgbmV3IGxpY2Vuc2UgdGV4dC4KKyMgUGxlYXNlIHVwZGF0
ZSB0aGUgTElDRU5TRSB2YWx1ZSBpZiBuZWVkZWQsIGFuZCBzdW1tYXJpemUgdGhlIGNoYW5nZXMg
aW4KKyMgdGhlIGNvbW1pdCBtZXNzYWdlIHZpYSAnTGljZW5zZS1VcGRhdGU6JyB0YWcuCisjIChl
eGFtcGxlOiAnTGljZW5zZS1VcGRhdGU6IGNvcHlyaWdodCB5ZWFycyB1cGRhdGVkLicpCisjCisj
IFRoZSBjaGFuZ2VzOgorIworIyAtLS0gQ09QWUlORworIyArKysgQ09QWUlORworIyBAQCAtNTUs
NyArNTUsNyBAQAorIyAgdGhhdCB3aGF0IHRoZXkgaGF2ZSBpcyBub3QgdGhlIG9yaWdpbmFsIHZl
cnNpb24sIHNvIHRoYXQgdGhlIG9yaWdpbmFsCisjICBhdXRob3IncyByZXB1dGF0aW9uIHdpbGwg
bm90IGJlIGFmZmVjdGVkIGJ5IHByb2JsZW1zIHRoYXQgbWlnaHQgYmUKKyMgIGludHJvZHVjZWQg
Ynkgb3RoZXJzLgorIyAtDAorIyArCisjICAgIEZpbmFsbHksIHNvZnR3YXJlIHBhdGVudHMgcG9z
ZSBhIGNvbnN0YW50IHRocmVhdCB0byB0aGUgZXhpc3RlbmNlIG9mCisjICBhbnkgZnJlZSBwcm9n
cmFtLiAgV2Ugd2lzaCB0byBtYWtlIHN1cmUgdGhhdCBhIGNvbXBhbnkgY2Fubm90CisjICBlZmZl
Y3RpdmVseSByZXN0cmljdCB0aGUgdXNlcnMgb2YgYSBmcmVlIHByb2dyYW0gYnkgb2J0YWluaW5n
IGEKKyMgQEAgLTExMSw3ICsxMTEsNyBAQAorIyAgIndvcmsgYmFzZWQgb24gdGhlIGxpYnJhcnki
IGFuZCBhICJ3b3JrIHRoYXQgdXNlcyB0aGUgbGlicmFyeSIuICBUaGUKKyMgIGZvcm1lciBjb250
YWlucyBjb2RlIGRlcml2ZWQgZnJvbSB0aGUgbGlicmFyeSwgd2hlcmVhcyB0aGUgbGF0dGVyIG11
c3QKKyMgIGJlIGNvbWJpbmVkIHdpdGggdGhlIGxpYnJhcnkgaW4gb3JkZXIgdG8gcnVuLgorIyAt
DAorIyArCisjICAJCSAgR05VIExFU1NFUiBHRU5FUkFMIFBVQkxJQyBMSUNFTlNFCisjICAgICBU
RVJNUyBBTkQgQ09ORElUSU9OUyBGT1IgQ09QWUlORywgRElTVFJJQlVUSU9OIEFORCBNT0RJRklD
QVRJT04KKyMgIAorIyBAQCAtMTQ2LDcgKzE0Niw3IEBACisjICBvbiB0aGUgTGlicmFyeSAoaW5k
ZXBlbmRlbnQgb2YgdGhlIHVzZSBvZiB0aGUgTGlicmFyeSBpbiBhIHRvb2wgZm9yCisjICB3cml0
aW5nIGl0KS4gIFdoZXRoZXIgdGhhdCBpcyB0cnVlIGRlcGVuZHMgb24gd2hhdCB0aGUgTGlicmFy
eSBkb2VzCisjICBhbmQgd2hhdCB0aGUgcHJvZ3JhbSB0aGF0IHVzZXMgdGhlIExpYnJhcnkgZG9l
cy4KKyMgLSAgCisjICsKKyMgICAgMS4gWW91IG1heSBjb3B5IGFuZCBkaXN0cmlidXRlIHZlcmJh
dGltIGNvcGllcyBvZiB0aGUgTGlicmFyeSdzCisjICBjb21wbGV0ZSBzb3VyY2UgY29kZSBhcyB5
b3UgcmVjZWl2ZSBpdCwgaW4gYW55IG1lZGl1bSwgcHJvdmlkZWQgdGhhdAorIyAgeW91IGNvbnNw
aWN1b3VzbHkgYW5kIGFwcHJvcHJpYXRlbHkgcHVibGlzaCBvbiBlYWNoIGNvcHkgYW4KKyMgQEAg
LTE1OCw3ICsxNTgsNyBAQAorIyAgICBZb3UgbWF5IGNoYXJnZSBhIGZlZSBmb3IgdGhlIHBoeXNp
Y2FsIGFjdCBvZiB0cmFuc2ZlcnJpbmcgYSBjb3B5LAorIyAgYW5kIHlvdSBtYXkgYXQgeW91ciBv
cHRpb24gb2ZmZXIgd2FycmFudHkgcHJvdGVjdGlvbiBpbiBleGNoYW5nZSBmb3IgYQorIyAgZmVl
LgorIyAtDAorIyArCisjICAgIDIuIFlvdSBtYXkgbW9kaWZ5IHlvdXIgY29weSBvciBjb3BpZXMg
b2YgdGhlIExpYnJhcnkgb3IgYW55IHBvcnRpb24KKyMgIG9mIGl0LCB0aHVzIGZvcm1pbmcgYSB3
b3JrIGJhc2VkIG9uIHRoZSBMaWJyYXJ5LCBhbmQgY29weSBhbmQKKyMgIGRpc3RyaWJ1dGUgc3Vj
aCBtb2RpZmljYXRpb25zIG9yIHdvcmsgdW5kZXIgdGhlIHRlcm1zIG9mIFNlY3Rpb24gMQorIyBA
QCAtMjE2LDcgKzIxNiw3IEBACisjICBvcmRpbmFyeSBHTlUgR2VuZXJhbCBQdWJsaWMgTGljZW5z
ZSBoYXMgYXBwZWFyZWQsIHRoZW4geW91IGNhbiBzcGVjaWZ5CisjICB0aGF0IHZlcnNpb24gaW5z
dGVhZCBpZiB5b3Ugd2lzaC4pICBEbyBub3QgbWFrZSBhbnkgb3RoZXIgY2hhbmdlIGluCisjICB0
aGVzZSBub3RpY2VzLgorIyAtDAorIyArCisjICAgIE9uY2UgdGhpcyBjaGFuZ2UgaXMgbWFkZSBp
biBhIGdpdmVuIGNvcHksIGl0IGlzIGlycmV2ZXJzaWJsZSBmb3IKKyMgIHRoYXQgY29weSwgc28g
dGhlIG9yZGluYXJ5IEdOVSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlIGFwcGxpZXMgdG8gYWxsCisj
ICBzdWJzZXF1ZW50IGNvcGllcyBhbmQgZGVyaXZhdGl2ZSB3b3JrcyBtYWRlIGZyb20gdGhhdCBj
b3B5LgorIyBAQCAtMjY3LDcgKzI2Nyw3IEBACisjICBkaXN0cmlidXRlIHRoZSBvYmplY3QgY29k
ZSBmb3IgdGhlIHdvcmsgdW5kZXIgdGhlIHRlcm1zIG9mIFNlY3Rpb24gNi4KKyMgIEFueSBleGVj
dXRhYmxlcyBjb250YWluaW5nIHRoYXQgd29yayBhbHNvIGZhbGwgdW5kZXIgU2VjdGlvbiA2LAor
IyAgd2hldGhlciBvciBub3QgdGhleSBhcmUgbGlua2VkIGRpcmVjdGx5IHdpdGggdGhlIExpYnJh
cnkgaXRzZWxmLgorIyAtDAorIyArCisjICAgIDYuIEFzIGFuIGV4Y2VwdGlvbiB0byB0aGUgU2Vj
dGlvbnMgYWJvdmUsIHlvdSBtYXkgYWxzbyBjb21iaW5lIG9yCisjICBsaW5rIGEgIndvcmsgdGhh
dCB1c2VzIHRoZSBMaWJyYXJ5IiB3aXRoIHRoZSBMaWJyYXJ5IHRvIHByb2R1Y2UgYQorIyAgd29y
ayBjb250YWluaW5nIHBvcnRpb25zIG9mIHRoZSBMaWJyYXJ5LCBhbmQgZGlzdHJpYnV0ZSB0aGF0
IHdvcmsKKyMgQEAgLTMyOSw3ICszMjksNyBAQAorIyAgYWNjb21wYW55IHRoZSBvcGVyYXRpbmcg
c3lzdGVtLiAgU3VjaCBhIGNvbnRyYWRpY3Rpb24gbWVhbnMgeW91IGNhbm5vdAorIyAgdXNlIGJv
dGggdGhlbSBhbmQgdGhlIExpYnJhcnkgdG9nZXRoZXIgaW4gYW4gZXhlY3V0YWJsZSB0aGF0IHlv
dQorIyAgZGlzdHJpYnV0ZS4KKyMgLQwKKyMgKworIyAgICA3LiBZb3UgbWF5IHBsYWNlIGxpYnJh
cnkgZmFjaWxpdGllcyB0aGF0IGFyZSBhIHdvcmsgYmFzZWQgb24gdGhlCisjICBMaWJyYXJ5IHNp
ZGUtYnktc2lkZSBpbiBhIHNpbmdsZSBsaWJyYXJ5IHRvZ2V0aGVyIHdpdGggb3RoZXIgbGlicmFy
eQorIyAgZmFjaWxpdGllcyBub3QgY292ZXJlZCBieSB0aGlzIExpY2Vuc2UsIGFuZCBkaXN0cmli
dXRlIHN1Y2ggYSBjb21iaW5lZAorIyBAQCAtMzcwLDcgKzM3MCw3IEBACisjICByZXN0cmljdGlv
bnMgb24gdGhlIHJlY2lwaWVudHMnIGV4ZXJjaXNlIG9mIHRoZSByaWdodHMgZ3JhbnRlZCBoZXJl
aW4uCisjICBZb3UgYXJlIG5vdCByZXNwb25zaWJsZSBmb3IgZW5mb3JjaW5nIGNvbXBsaWFuY2Ug
YnkgdGhpcmQgcGFydGllcyB3aXRoCisjICB0aGlzIExpY2Vuc2UuCisjIC0MCisjICsKKyMgICAg
MTEuIElmLCBhcyBhIGNvbnNlcXVlbmNlIG9mIGEgY291cnQganVkZ21lbnQgb3IgYWxsZWdhdGlv
biBvZiBwYXRlbnQKKyMgIGluZnJpbmdlbWVudCBvciBmb3IgYW55IG90aGVyIHJlYXNvbiAobm90
IGxpbWl0ZWQgdG8gcGF0ZW50IGlzc3VlcyksCisjICBjb25kaXRpb25zIGFyZSBpbXBvc2VkIG9u
IHlvdSAod2hldGhlciBieSBjb3VydCBvcmRlciwgYWdyZWVtZW50IG9yCisjIEBAIC00MjIsNyAr
NDIyLDcgQEAKKyMgIHRoZSBGcmVlIFNvZnR3YXJlIEZvdW5kYXRpb24uICBJZiB0aGUgTGlicmFy
eSBkb2VzIG5vdCBzcGVjaWZ5IGEKKyMgIGxpY2Vuc2UgdmVyc2lvbiBudW1iZXIsIHlvdSBtYXkg
Y2hvb3NlIGFueSB2ZXJzaW9uIGV2ZXIgcHVibGlzaGVkIGJ5CisjICB0aGUgRnJlZSBTb2Z0d2Fy
ZSBGb3VuZGF0aW9uLgorIyAtDAorIyArCisjICAgIDE0LiBJZiB5b3Ugd2lzaCB0byBpbmNvcnBv
cmF0ZSBwYXJ0cyBvZiB0aGUgTGlicmFyeSBpbnRvIG90aGVyIGZyZWUKKyMgIHByb2dyYW1zIHdo
b3NlIGRpc3RyaWJ1dGlvbiBjb25kaXRpb25zIGFyZSBpbmNvbXBhdGlibGUgd2l0aCB0aGVzZSwK
KyMgIHdyaXRlIHRvIHRoZSBhdXRob3IgdG8gYXNrIGZvciBwZXJtaXNzaW9uLiAgRm9yIHNvZnR3
YXJlIHdoaWNoIGlzCisjIEBAIC00NTYsNyArNDU2LDcgQEAKKyMgIERBTUFHRVMuCisjICAKKyMg
IAkJICAgICBFTkQgT0YgVEVSTVMgQU5EIENPTkRJVElPTlMKKyMgLQwKKyMgKworIyAgICAgICAg
ICAgICBIb3cgdG8gQXBwbHkgVGhlc2UgVGVybXMgdG8gWW91ciBOZXcgTGlicmFyaWVzCisjICAK
KyMgICAgSWYgeW91IGRldmVsb3AgYSBuZXcgbGlicmFyeSwgYW5kIHlvdSB3YW50IGl0IHRvIGJl
IG9mIHRoZSBncmVhdGVzdAorIyAKKyMKKwogU1VNTUFSWSA9ICJQeXRob24gR09iamVjdCBiaW5k
aW5ncyIKIEhPTUVQQUdFID0gImh0dHBzOi8vZ2l0bGFiLmdub21lLm9yZy9HTk9NRS9weWdvYmpl
Y3QiCiBERVNDUklQVElPTiA9ICJQeUdPYmplY3QgaXMgYSBQeXRob24gcGFja2FnZSB3aGljaCBw
cm92aWRlcyBiaW5kaW5ncyBmb3IgR09iamVjdCBiYXNlZCBsaWJyYXJpZXMgc3VjaCBhcyBHVEss
IEdTdHJlYW1lciwgV2ViS2l0R1RLLCBHTGliLCBHSU8gYW5kIG1hbnkgbW9yZS4iCiBTRUNUSU9O
ID0gImRldmVsL3B5dGhvbiIKIExJQ0VOU0UgPSAiTEdQTC0yLjEtb25seSIKLUxJQ19GSUxFU19D
SEtTVU0gPSAiZmlsZTovL0NPUFlJTkc7bWQ1PWE5MTY0NjdiOTEwNzZlNjMxZGQ4ZWRiNzQyNDc2
OWM3IgorTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vQ09QWUlORzttZDU9OTFkYjc5NGMzYWRj
OWQ4MjRkNGVkZGFiYjM0MWU4MTYiCiAKIEdJUl9NRVNPTl9PUFRJT04gPSAiIgogCkBAIC0xOSw3
ICsxMjIsNyBAQCBERVBFTkRTICs9ICJweXRob24zIGdsaWItMi4wIgogU1JDTkFNRSA9ICJweWdv
YmplY3QiCiAKIFNSQ19VUkkgPSAiaHR0cDovL2Z0cC5nbm9tZS5vcmcvcHViL0dOT01FL3NvdXJj
ZXMvJHtTUkNOQU1FfS8ke0Bnbm9tZV92ZXJkaXIoIiR7UFZ9Iil9LyR7U1JDTkFNRX0tJHtQVn0u
dGFyLmd6IgotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjAwZTQyN2QyOTFlOTU3NDYyYThmYWQ2NTlh
OWY5YzhiZTc3NmZmODJhOGI3NmJkZjQwMmYxZWFlZWMwODZkODIiCitTUkNfVVJJW3NoYTI1NnN1
bV0gPSAiMDNjZmZlYjQ5ZDhhMTg3OWI2MjFkOGY2MDZhYzkwNDIxODAxOWEwYWU2OTliMWNkMzc4
MGE4ZWU2MTFlNjk2YiIKIAogUyA9ICIke1VOUEFDS0RJUn0vJHtTUkNOQU1FfS0ke1BWfSIKIAot
LSAKMi40Ny4xCgo=

--===============6367800068944982985==--

