Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34ADECD3436
	for <webhook@archiver.kernel.org>; Wed,  5 Nov 2025 23:16:35 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2349.1762384572388914338
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Nov 2025 15:16:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=J2+hNZxC;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=gHR9nrwQ;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101019a564ead1f-8d0ecd96-0770-4735-be8b-117da3d3894f-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1762384588;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=CS6r6o0SUnb92jOE6TR238WMtEQ6eZsBbRs9d408L2I=;
	b=J2+hNZxCFrEFXEvXKDFjDfSxz0TIE/dhgUmSkz2OXPcGPVW2W+e1jI6G3vYarlGI
	+QNv+71nKPJmkEJ7uRkHhUS3nyy+Kub6jI3jy5N39CY+klzTg8Unfzu+XsOmmSNVG4U
	b9t0YUCw/zWWHmcSCP4rLSizU+7RF69ShIgm3s8g=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1762384588;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=CS6r6o0SUnb92jOE6TR238WMtEQ6eZsBbRs9d408L2I=;
	b=gHR9nrwQsKlEojLKVpSx2ojxXyoD/5mQm9rzkuk2mjt+ltR0wdcknKgTAQouLIW3
	Pigd/AaWE4tmXMFue0cXnSlzCQSxUE4bydlXtiFZNoh8YsW/ki21rDr8d6ZWSc79aM6
	uOHCOcZ+UwsmgDr/+lVzaSMeoTVGUgtvd+MoFUz4=
Content-Type: multipart/mixed; boundary="===============1910356486549098398=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-pygobject: upgrading to 3.54.5 SUCCEEDED
Message-ID: <0101019a564ead1f-8d0ecd96-0770-4735-be8b-117da3d3894f-000000@us-west-2.amazonses.com>
Date: Wed, 5 Nov 2025 23:16:28 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.11.05-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Nov 2025 23:16:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225838

--===============1910356486549098398==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-pygobject* to *3.54.5* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-pygobject-upgrade-3.52.3-3.54.5.patch
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
From 5258356afbc77c83e9f455c1751d7bf9583db7a6 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 5 Nov 2025 17:33:17 +0000
Subject: [PATCH] python3-pygobject: upgrade 3.52.3 -> 3.54.5

---
 ..._3.52.3.bb => python3-pygobject_3.54.5.bb} | 107 +++++++++++++++++-
 1 file changed, 105 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-pygobject_3.52.3.bb => python3-pygobject_3.54.5.bb} (23%)

diff --git a/meta/recipes-devtools/python/python3-pygobject_3.52.3.bb b/meta/recipes-devtools/python/python3-pygobject_3.54.5.bb
similarity index 23%
rename from meta/recipes-devtools/python/python3-pygobject_3.52.3.bb
rename to meta/recipes-devtools/python/python3-pygobject_3.54.5.bb
index 42b071ca08..5702fbbe92 100644
--- a/meta/recipes-devtools/python/python3-pygobject_3.52.3.bb
+++ b/meta/recipes-devtools/python/python3-pygobject_3.54.5.bb
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
+SRC_URI[sha256sum] = "b6656f6348f5245606cf15ea48c384c7f05156c75ead206c1b246c80a22fb585"
 
 S = "${UNPACKDIR}/${SRCNAME}-${PV}"
 
-- 
2.47.1


--===============1910356486549098398==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-pygobject/python3-pygobject-dev: PKGSIZE changed from 25227 to 28308 (+12%)
packages/x86-64-v3-poky-linux/python3-pygobject/python3-pygobject: FILELIST: directory renamed /usr/lib/python3.13/site-packages/PyGObject-3.52.3.dist-info -> /usr/lib/python3.13/site-packages/PyGObject-3.54.5.dist-info, added "/usr/lib/python3.13/site-packages/gi/overrides/GioUnix.py /usr/lib/python3.13/site-packages/gi/overrides/__pycache__/GioUnix.cpython-313.pyc"
Changes to packages/x86-64-v3-poky-linux/python3-pygobject (sysroot):
  /usr/lib/python3.13/site-packages/PyGObject-3.52.3.dist-info moved to /usr/lib/python3.13/site-packages/PyGObject-3.54.5.dist-info
  /usr/lib/python3.13/site-packages/gi/overrides/GioUnix.py was added
  /usr/lib/python3.13/site-packages/gi/overrides/__pycache__/GioUnix.cpython-313.pyc was added

--===============1910356486549098398==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-pygobject: SRC_URI changed from "http://ftp.gnome.org/pub/GNOME/sources/pygobject/3.52/pygobject-3.52.3.tar.gz" to "http://ftp.gnome.org/pub/GNOME/sources/pygobject/3.54/pygobject-3.54.5.tar.gz"
packages/x86-64-v3-poky-linux/python3-pygobject: PKGV changed from 3.52.3 [default] to 3.54.5 [default]
packages/x86-64-v3-poky-linux/python3-pygobject: PV changed from "3.52.3" to "3.54.5"
packages/x86-64-v3-poky-linux/python3-pygobject/python3-pygobject-dbg: PKGSIZE changed from 1457704 to 1463200 (+0%)
packages/x86-64-v3-poky-linux/python3-pygobject/python3-pygobject-dbg: PKGV changed from 3.52.3 [default] to 3.54.5 [default]
packages/x86-64-v3-poky-linux/python3-pygobject/python3-pygobject-dbg: PV changed from "3.52.3" to "3.54.5"
packages/x86-64-v3-poky-linux/python3-pygobject/python3-pygobject-dev: PKGSIZE changed from 25227 to 28308 (+12%)
packages/x86-64-v3-poky-linux/python3-pygobject/python3-pygobject-dev: PKGV changed from 3.52.3 [default] to 3.54.5 [default]
packages/x86-64-v3-poky-linux/python3-pygobject/python3-pygobject-dev: PV changed from "3.52.3" to "3.54.5"
packages/x86-64-v3-poky-linux/python3-pygobject/python3-pygobject-doc: PKGV changed from 3.52.3 [default] to 3.54.5 [default]
packages/x86-64-v3-poky-linux/python3-pygobject/python3-pygobject-doc: PV changed from "3.52.3" to "3.54.5"
packages/x86-64-v3-poky-linux/python3-pygobject/python3-pygobject-locale: PKGV changed from 3.52.3 [default] to 3.54.5 [default]
packages/x86-64-v3-poky-linux/python3-pygobject/python3-pygobject-locale: PV changed from "3.52.3" to "3.54.5"
packages/x86-64-v3-poky-linux/python3-pygobject/python3-pygobject-src: PKGV changed from 3.52.3 [default] to 3.54.5 [default]
packages/x86-64-v3-poky-linux/python3-pygobject/python3-pygobject-src: PV changed from "3.52.3" to "3.54.5"
packages/x86-64-v3-poky-linux/python3-pygobject/python3-pygobject-staticdev: PKGV changed from 3.52.3 [default] to 3.54.5 [default]
packages/x86-64-v3-poky-linux/python3-pygobject/python3-pygobject-staticdev: PV changed from "3.52.3" to "3.54.5"
packages/x86-64-v3-poky-linux/python3-pygobject/python3-pygobject: FILELIST: directory renamed /usr/lib/python3.13/site-packages/PyGObject-3.52.3.dist-info -> /usr/lib/python3.13/site-packages/PyGObject-3.54.5.dist-info, added "/usr/lib/python3.13/site-packages/gi/overrides/__pycache__/GioUnix.cpython-313.pyc /usr/lib/python3.13/site-packages/gi/overrides/GioUnix.py"
packages/x86-64-v3-poky-linux/python3-pygobject/python3-pygobject: PKGSIZE changed from 1094057 to 1126758 (+3%)
packages/x86-64-v3-poky-linux/python3-pygobject/python3-pygobject: PKGV changed from 3.52.3 [default] to 3.54.5 [default]
packages/x86-64-v3-poky-linux/python3-pygobject/python3-pygobject: PV changed from "3.52.3" to "3.54.5"
Changes to packages/x86-64-v3-poky-linux/python3-pygobject (sysroot):
  /usr/lib/python3.13/site-packages/PyGObject-3.52.3.dist-info moved to /usr/lib/python3.13/site-packages/PyGObject-3.54.5.dist-info
  /usr/lib/python3.13/site-packages/gi/overrides/GioUnix.py was added
  /usr/lib/python3.13/site-packages/gi/overrides/__pycache__/GioUnix.cpython-313.pyc was added

--===============1910356486549098398==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-pygobject-upgrade-3.52.3-3.54.5.patch"

RnJvbSA1MjU4MzU2YWZiYzc3YzgzZTlmNDU1YzE3NTFkN2JmOTU4M2RiN2E2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgNSBOb3YgMjAyNSAxNzozMzoxNyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtcHlnb2JqZWN0OiB1cGdyYWRlIDMuNTIuMyAtPiAzLjU0LjUKCi0tLQogLi4uXzMuNTIu
My5iYiA9PiBweXRob24zLXB5Z29iamVjdF8zLjU0LjUuYmJ9IHwgMTA3ICsrKysrKysrKysrKysr
KysrLQogMSBmaWxlIGNoYW5nZWQsIDEwNSBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQog
cmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtcHlnb2JqZWN0XzMu
NTIuMy5iYiA9PiBweXRob24zLXB5Z29iamVjdF8zLjU0LjUuYmJ9ICgyMyUpCgpkaWZmIC0tZ2l0
IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXB5Z29iamVjdF8zLjUyLjMu
YmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcHlnb2JqZWN0XzMuNTQu
NS5iYgpzaW1pbGFyaXR5IGluZGV4IDIzJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcHl0aG9uL3B5dGhvbjMtcHlnb2JqZWN0XzMuNTIuMy5iYgpyZW5hbWUgdG8gbWV0YS9yZWNp
cGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXB5Z29iamVjdF8zLjU0LjUuYmIKaW5kZXggNDJi
MDcxY2EwOC4uNTcwMmZiYmU5MiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5
dGhvbi9weXRob24zLXB5Z29iamVjdF8zLjUyLjMuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3B5dGhvbi9weXRob24zLXB5Z29iamVjdF8zLjU0LjUuYmIKQEAgLTEsOSArMSwxMTIgQEAK
KyMgRklYTUU6IHRoZSBMSUNfRklMRVNfQ0hLU1VNIHZhbHVlcyBoYXZlIGJlZW4gdXBkYXRlZCBi
eSAnZGV2dG9vbCB1cGdyYWRlJy4KKyMgVGhlIGZvbGxvd2luZyBpcyB0aGUgZGlmZmVyZW5jZSBi
ZXR3ZWVuIHRoZSBvbGQgYW5kIHRoZSBuZXcgbGljZW5zZSB0ZXh0LgorIyBQbGVhc2UgdXBkYXRl
IHRoZSBMSUNFTlNFIHZhbHVlIGlmIG5lZWRlZCwgYW5kIHN1bW1hcml6ZSB0aGUgY2hhbmdlcyBp
bgorIyB0aGUgY29tbWl0IG1lc3NhZ2UgdmlhICdMaWNlbnNlLVVwZGF0ZTonIHRhZy4KKyMgKGV4
YW1wbGU6ICdMaWNlbnNlLVVwZGF0ZTogY29weXJpZ2h0IHllYXJzIHVwZGF0ZWQuJykKKyMKKyMg
VGhlIGNoYW5nZXM6CisjCisjIC0tLSBDT1BZSU5HCisjICsrKyBDT1BZSU5HCisjIEBAIC01NSw3
ICs1NSw3IEBACisjICB0aGF0IHdoYXQgdGhleSBoYXZlIGlzIG5vdCB0aGUgb3JpZ2luYWwgdmVy
c2lvbiwgc28gdGhhdCB0aGUgb3JpZ2luYWwKKyMgIGF1dGhvcidzIHJlcHV0YXRpb24gd2lsbCBu
b3QgYmUgYWZmZWN0ZWQgYnkgcHJvYmxlbXMgdGhhdCBtaWdodCBiZQorIyAgaW50cm9kdWNlZCBi
eSBvdGhlcnMuCisjIC0MCisjICsKKyMgICAgRmluYWxseSwgc29mdHdhcmUgcGF0ZW50cyBwb3Nl
IGEgY29uc3RhbnQgdGhyZWF0IHRvIHRoZSBleGlzdGVuY2Ugb2YKKyMgIGFueSBmcmVlIHByb2dy
YW0uICBXZSB3aXNoIHRvIG1ha2Ugc3VyZSB0aGF0IGEgY29tcGFueSBjYW5ub3QKKyMgIGVmZmVj
dGl2ZWx5IHJlc3RyaWN0IHRoZSB1c2VycyBvZiBhIGZyZWUgcHJvZ3JhbSBieSBvYnRhaW5pbmcg
YQorIyBAQCAtMTExLDcgKzExMSw3IEBACisjICAid29yayBiYXNlZCBvbiB0aGUgbGlicmFyeSIg
YW5kIGEgIndvcmsgdGhhdCB1c2VzIHRoZSBsaWJyYXJ5Ii4gIFRoZQorIyAgZm9ybWVyIGNvbnRh
aW5zIGNvZGUgZGVyaXZlZCBmcm9tIHRoZSBsaWJyYXJ5LCB3aGVyZWFzIHRoZSBsYXR0ZXIgbXVz
dAorIyAgYmUgY29tYmluZWQgd2l0aCB0aGUgbGlicmFyeSBpbiBvcmRlciB0byBydW4uCisjIC0M
CisjICsKKyMgIAkJICBHTlUgTEVTU0VSIEdFTkVSQUwgUFVCTElDIExJQ0VOU0UKKyMgICAgIFRF
Uk1TIEFORCBDT05ESVRJT05TIEZPUiBDT1BZSU5HLCBESVNUUklCVVRJT04gQU5EIE1PRElGSUNB
VElPTgorIyAgCisjIEBAIC0xNDYsNyArMTQ2LDcgQEAKKyMgIG9uIHRoZSBMaWJyYXJ5IChpbmRl
cGVuZGVudCBvZiB0aGUgdXNlIG9mIHRoZSBMaWJyYXJ5IGluIGEgdG9vbCBmb3IKKyMgIHdyaXRp
bmcgaXQpLiAgV2hldGhlciB0aGF0IGlzIHRydWUgZGVwZW5kcyBvbiB3aGF0IHRoZSBMaWJyYXJ5
IGRvZXMKKyMgIGFuZCB3aGF0IHRoZSBwcm9ncmFtIHRoYXQgdXNlcyB0aGUgTGlicmFyeSBkb2Vz
LgorIyAtICAKKyMgKworIyAgICAxLiBZb3UgbWF5IGNvcHkgYW5kIGRpc3RyaWJ1dGUgdmVyYmF0
aW0gY29waWVzIG9mIHRoZSBMaWJyYXJ5J3MKKyMgIGNvbXBsZXRlIHNvdXJjZSBjb2RlIGFzIHlv
dSByZWNlaXZlIGl0LCBpbiBhbnkgbWVkaXVtLCBwcm92aWRlZCB0aGF0CisjICB5b3UgY29uc3Bp
Y3VvdXNseSBhbmQgYXBwcm9wcmlhdGVseSBwdWJsaXNoIG9uIGVhY2ggY29weSBhbgorIyBAQCAt
MTU4LDcgKzE1OCw3IEBACisjICAgIFlvdSBtYXkgY2hhcmdlIGEgZmVlIGZvciB0aGUgcGh5c2lj
YWwgYWN0IG9mIHRyYW5zZmVycmluZyBhIGNvcHksCisjICBhbmQgeW91IG1heSBhdCB5b3VyIG9w
dGlvbiBvZmZlciB3YXJyYW50eSBwcm90ZWN0aW9uIGluIGV4Y2hhbmdlIGZvciBhCisjICBmZWUu
CisjIC0MCisjICsKKyMgICAgMi4gWW91IG1heSBtb2RpZnkgeW91ciBjb3B5IG9yIGNvcGllcyBv
ZiB0aGUgTGlicmFyeSBvciBhbnkgcG9ydGlvbgorIyAgb2YgaXQsIHRodXMgZm9ybWluZyBhIHdv
cmsgYmFzZWQgb24gdGhlIExpYnJhcnksIGFuZCBjb3B5IGFuZAorIyAgZGlzdHJpYnV0ZSBzdWNo
IG1vZGlmaWNhdGlvbnMgb3Igd29yayB1bmRlciB0aGUgdGVybXMgb2YgU2VjdGlvbiAxCisjIEBA
IC0yMTYsNyArMjE2LDcgQEAKKyMgIG9yZGluYXJ5IEdOVSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNl
IGhhcyBhcHBlYXJlZCwgdGhlbiB5b3UgY2FuIHNwZWNpZnkKKyMgIHRoYXQgdmVyc2lvbiBpbnN0
ZWFkIGlmIHlvdSB3aXNoLikgIERvIG5vdCBtYWtlIGFueSBvdGhlciBjaGFuZ2UgaW4KKyMgIHRo
ZXNlIG5vdGljZXMuCisjIC0MCisjICsKKyMgICAgT25jZSB0aGlzIGNoYW5nZSBpcyBtYWRlIGlu
IGEgZ2l2ZW4gY29weSwgaXQgaXMgaXJyZXZlcnNpYmxlIGZvcgorIyAgdGhhdCBjb3B5LCBzbyB0
aGUgb3JkaW5hcnkgR05VIEdlbmVyYWwgUHVibGljIExpY2Vuc2UgYXBwbGllcyB0byBhbGwKKyMg
IHN1YnNlcXVlbnQgY29waWVzIGFuZCBkZXJpdmF0aXZlIHdvcmtzIG1hZGUgZnJvbSB0aGF0IGNv
cHkuCisjIEBAIC0yNjcsNyArMjY3LDcgQEAKKyMgIGRpc3RyaWJ1dGUgdGhlIG9iamVjdCBjb2Rl
IGZvciB0aGUgd29yayB1bmRlciB0aGUgdGVybXMgb2YgU2VjdGlvbiA2LgorIyAgQW55IGV4ZWN1
dGFibGVzIGNvbnRhaW5pbmcgdGhhdCB3b3JrIGFsc28gZmFsbCB1bmRlciBTZWN0aW9uIDYsCisj
ICB3aGV0aGVyIG9yIG5vdCB0aGV5IGFyZSBsaW5rZWQgZGlyZWN0bHkgd2l0aCB0aGUgTGlicmFy
eSBpdHNlbGYuCisjIC0MCisjICsKKyMgICAgNi4gQXMgYW4gZXhjZXB0aW9uIHRvIHRoZSBTZWN0
aW9ucyBhYm92ZSwgeW91IG1heSBhbHNvIGNvbWJpbmUgb3IKKyMgIGxpbmsgYSAid29yayB0aGF0
IHVzZXMgdGhlIExpYnJhcnkiIHdpdGggdGhlIExpYnJhcnkgdG8gcHJvZHVjZSBhCisjICB3b3Jr
IGNvbnRhaW5pbmcgcG9ydGlvbnMgb2YgdGhlIExpYnJhcnksIGFuZCBkaXN0cmlidXRlIHRoYXQg
d29yaworIyBAQCAtMzI5LDcgKzMyOSw3IEBACisjICBhY2NvbXBhbnkgdGhlIG9wZXJhdGluZyBz
eXN0ZW0uICBTdWNoIGEgY29udHJhZGljdGlvbiBtZWFucyB5b3UgY2Fubm90CisjICB1c2UgYm90
aCB0aGVtIGFuZCB0aGUgTGlicmFyeSB0b2dldGhlciBpbiBhbiBleGVjdXRhYmxlIHRoYXQgeW91
CisjICBkaXN0cmlidXRlLgorIyAtDAorIyArCisjICAgIDcuIFlvdSBtYXkgcGxhY2UgbGlicmFy
eSBmYWNpbGl0aWVzIHRoYXQgYXJlIGEgd29yayBiYXNlZCBvbiB0aGUKKyMgIExpYnJhcnkgc2lk
ZS1ieS1zaWRlIGluIGEgc2luZ2xlIGxpYnJhcnkgdG9nZXRoZXIgd2l0aCBvdGhlciBsaWJyYXJ5
CisjICBmYWNpbGl0aWVzIG5vdCBjb3ZlcmVkIGJ5IHRoaXMgTGljZW5zZSwgYW5kIGRpc3RyaWJ1
dGUgc3VjaCBhIGNvbWJpbmVkCisjIEBAIC0zNzAsNyArMzcwLDcgQEAKKyMgIHJlc3RyaWN0aW9u
cyBvbiB0aGUgcmVjaXBpZW50cycgZXhlcmNpc2Ugb2YgdGhlIHJpZ2h0cyBncmFudGVkIGhlcmVp
bi4KKyMgIFlvdSBhcmUgbm90IHJlc3BvbnNpYmxlIGZvciBlbmZvcmNpbmcgY29tcGxpYW5jZSBi
eSB0aGlyZCBwYXJ0aWVzIHdpdGgKKyMgIHRoaXMgTGljZW5zZS4KKyMgLQwKKyMgKworIyAgICAx
MS4gSWYsIGFzIGEgY29uc2VxdWVuY2Ugb2YgYSBjb3VydCBqdWRnbWVudCBvciBhbGxlZ2F0aW9u
IG9mIHBhdGVudAorIyAgaW5mcmluZ2VtZW50IG9yIGZvciBhbnkgb3RoZXIgcmVhc29uIChub3Qg
bGltaXRlZCB0byBwYXRlbnQgaXNzdWVzKSwKKyMgIGNvbmRpdGlvbnMgYXJlIGltcG9zZWQgb24g
eW91ICh3aGV0aGVyIGJ5IGNvdXJ0IG9yZGVyLCBhZ3JlZW1lbnQgb3IKKyMgQEAgLTQyMiw3ICs0
MjIsNyBAQAorIyAgdGhlIEZyZWUgU29mdHdhcmUgRm91bmRhdGlvbi4gIElmIHRoZSBMaWJyYXJ5
IGRvZXMgbm90IHNwZWNpZnkgYQorIyAgbGljZW5zZSB2ZXJzaW9uIG51bWJlciwgeW91IG1heSBj
aG9vc2UgYW55IHZlcnNpb24gZXZlciBwdWJsaXNoZWQgYnkKKyMgIHRoZSBGcmVlIFNvZnR3YXJl
IEZvdW5kYXRpb24uCisjIC0MCisjICsKKyMgICAgMTQuIElmIHlvdSB3aXNoIHRvIGluY29ycG9y
YXRlIHBhcnRzIG9mIHRoZSBMaWJyYXJ5IGludG8gb3RoZXIgZnJlZQorIyAgcHJvZ3JhbXMgd2hv
c2UgZGlzdHJpYnV0aW9uIGNvbmRpdGlvbnMgYXJlIGluY29tcGF0aWJsZSB3aXRoIHRoZXNlLAor
IyAgd3JpdGUgdG8gdGhlIGF1dGhvciB0byBhc2sgZm9yIHBlcm1pc3Npb24uICBGb3Igc29mdHdh
cmUgd2hpY2ggaXMKKyMgQEAgLTQ1Niw3ICs0NTYsNyBAQAorIyAgREFNQUdFUy4KKyMgIAorIyAg
CQkgICAgIEVORCBPRiBURVJNUyBBTkQgQ09ORElUSU9OUworIyAtDAorIyArCisjICAgICAgICAg
ICAgIEhvdyB0byBBcHBseSBUaGVzZSBUZXJtcyB0byBZb3VyIE5ldyBMaWJyYXJpZXMKKyMgIAor
IyAgICBJZiB5b3UgZGV2ZWxvcCBhIG5ldyBsaWJyYXJ5LCBhbmQgeW91IHdhbnQgaXQgdG8gYmUg
b2YgdGhlIGdyZWF0ZXN0CisjIAorIworCiBTVU1NQVJZID0gIlB5dGhvbiBHT2JqZWN0IGJpbmRp
bmdzIgogSE9NRVBBR0UgPSAiaHR0cHM6Ly9naXRsYWIuZ25vbWUub3JnL0dOT01FL3B5Z29iamVj
dCIKIERFU0NSSVBUSU9OID0gIlB5R09iamVjdCBpcyBhIFB5dGhvbiBwYWNrYWdlIHdoaWNoIHBy
b3ZpZGVzIGJpbmRpbmdzIGZvciBHT2JqZWN0IGJhc2VkIGxpYnJhcmllcyBzdWNoIGFzIEdUSywg
R1N0cmVhbWVyLCBXZWJLaXRHVEssIEdMaWIsIEdJTyBhbmQgbWFueSBtb3JlLiIKIFNFQ1RJT04g
PSAiZGV2ZWwvcHl0aG9uIgogTElDRU5TRSA9ICJMR1BMLTIuMS1vbmx5IgotTElDX0ZJTEVTX0NI
S1NVTSA9ICJmaWxlOi8vQ09QWUlORzttZDU9YTkxNjQ2N2I5MTA3NmU2MzFkZDhlZGI3NDI0NzY5
YzciCitMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9DT1BZSU5HO21kNT05MWRiNzk0YzNhZGM5
ZDgyNGQ0ZWRkYWJiMzQxZTgxNiIKIAogR0lSX01FU09OX09QVElPTiA9ICIiCiAKQEAgLTE5LDcg
KzEyMiw3IEBAIERFUEVORFMgKz0gInB5dGhvbjMgZ2xpYi0yLjAiCiBTUkNOQU1FID0gInB5Z29i
amVjdCIKIAogU1JDX1VSSSA9ICJodHRwOi8vZnRwLmdub21lLm9yZy9wdWIvR05PTUUvc291cmNl
cy8ke1NSQ05BTUV9LyR7QGdub21lX3ZlcmRpcigiJHtQVn0iKX0vJHtTUkNOQU1FfS0ke1BWfS50
YXIuZ3oiCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiMDBlNDI3ZDI5MWU5NTc0NjJhOGZhZDY1OWE5
ZjljOGJlNzc2ZmY4MmE4Yjc2YmRmNDAyZjFlYWVlYzA4NmQ4MiIKK1NSQ19VUklbc2hhMjU2c3Vt
XSA9ICJiNjY1NmY2MzQ4ZjUyNDU2MDZjZjE1ZWE0OGMzODRjN2YwNTE1NmM3NWVhZDIwNmMxYjI0
NmM4MGEyMmZiNTg1IgogCiBTID0gIiR7VU5QQUNLRElSfS8ke1NSQ05BTUV9LSR7UFZ9IgogCi0t
IAoyLjQ3LjEKCg==

--===============1910356486549098398==--

