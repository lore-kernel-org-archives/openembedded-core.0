Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40032E7491F
	for <webhook@archiver.kernel.org>; Sun,  1 Oct 2023 18:13:18 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web11.64727.1696183990448262099
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Oct 2023 11:13:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=K19PhMIG;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=QEwvh/uq;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101018aec71b941-a3511f74-c3f5-4c92-bf71-b072d67b5363-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1696183990;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=wXZtHWCyGeY0V/bUToyQmQmdemuTIlqPWaPyDu0Px08=;
	b=K19PhMIGsCcIM7zuRO9E/n7b+8lYBLZ3AvAl7AjE7K7rWmlZXquciKGWYDQ9XPlL
	PeeWKb1nJXh3uhXmPNK1NdNjI5lo8yNOHaQqOC7q1X4PrxpFv6gVZqDeYxxaL5SvvNc
	EXwheft+UB5FbWtXSMVf6d2qN1KqkprFETZFD/Es=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1696183990;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=wXZtHWCyGeY0V/bUToyQmQmdemuTIlqPWaPyDu0Px08=;
	b=QEwvh/uqlfiF2OIhDEBICu+396RAGS3BwCgK60OmG5vX/d3YAsOBHT9oN8U5eUvy
	jhRxWrGZFWCTfT8ehR7vU99jWM9zA59MlEc+UKcdLC/OpHFKBfG3REkPTHTOq7h5ORH
	UiZDOgmufbTw3X+4fn69V0g9yjQr+KuE7ipCkWOQ=
Content-Type: multipart/mixed; boundary="===============3091264354734626232=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-subunit: upgrading to 1.4.3 SUCCEEDED
Message-ID: <0101018aec71b941-a3511f74-c3f5-4c92-bf71-b072d67b5363-000000@us-west-2.amazonses.com>
Date: Sun, 1 Oct 2023 18:13:10 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.10.01-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Oct 2023 18:13:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188535

--===============3091264354734626232==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-subunit* to *1.4.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-subunit-upgrade-1.4.2-1.4.3.patch
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
From 539360471a73882b9266236dae35a83e2e4d6fff Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 1 Oct 2023 10:14:03 +0000
Subject: [PATCH] python3-subunit: upgrade 1.4.2 -> 1.4.3

---
 ...unit_1.4.2.bb => python3-subunit_1.4.3.bb} | 26 +++++++++++++++++--
 1 file changed, 24 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-subunit_1.4.2.bb => python3-subunit_1.4.3.bb} (31%)

diff --git a/meta/recipes-devtools/python/python3-subunit_1.4.2.bb b/meta/recipes-devtools/python/python3-subunit_1.4.3.bb
similarity index 31%
rename from meta/recipes-devtools/python/python3-subunit_1.4.2.bb
rename to meta/recipes-devtools/python/python3-subunit_1.4.3.bb
index a018ef1dc8..6558d31aec 100644
--- a/meta/recipes-devtools/python/python3-subunit_1.4.2.bb
+++ b/meta/recipes-devtools/python/python3-subunit_1.4.3.bb
@@ -1,12 +1,34 @@
+# FIXME: the LIC_FILES_CHKSUM values have been updated by 'devtool upgrade'.
+# The following is the difference between the old and the new license text.
+# Please update the LICENSE value if needed, and summarize the changes in
+# the commit message via 'License-Update:' tag.
+# (example: 'License-Update: copyright years updated.')
+#
+# The changes:
+#
+# --- README.rst
+# +++ README.rst
+# @@ -15,6 +15,6 @@
+#  
+#    See the COPYING file for full details on the licensing of Subunit.
+#  
+# -  subunit reuses iso8601 by Michael Twomey, distributed under an MIT style
+# -  licence - see python/iso8601/LICENSE for details.
+# +Subunit
+# +-------
+#  
+# 
+#
+
 SUMMARY = "Python implementation of subunit test streaming protocol"
 HOMEPAGE = "https://pypi.org/project/python-subunit/"
 SECTION = "devel/python"
 LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://README.rst;beginline=1;endline=20;md5=909c08e291647fd985fbe5d9836d51b6"
+LIC_FILES_CHKSUM = "file://README.rst;beginline=1;endline=20;md5=571e2d702e247b9d8a7745b3b54315ed"
 
 PYPI_PACKAGE = "python-subunit"
 
-SRC_URI[sha256sum] = "2988d324d55ec35dd037e502e3f74ac38f4e457bd44ee0edf5e898f7ee1134d4"
+SRC_URI[sha256sum] = "9ee76092d5b0a02055219763f1aa9e28835f2dd722f03ea9fd8d68e4066b3378"
 
 inherit pypi setuptools3
 
-- 
2.39.2


--===============3091264354734626232==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-subunit: PKGV changed from 1.4.2 [default] to 1.4.3 [default]
packages/core2-32-poky-linux/python3-subunit: SRC_URI changed from "https://files.pythonhosted.org/packages/source/p/python-subunit/python-subunit-1.4.2.tar.gz;downloadfilename=python-subunit-1.4.2.tar.gz" to "https://files.pythonhosted.org/packages/source/p/python-subunit/python-subunit-1.4.3.tar.gz;downloadfilename=python-subunit-1.4.3.tar.gz"
packages/core2-32-poky-linux/python3-subunit: PV changed from "1.4.2" to "1.4.3"
packages/core2-32-poky-linux/python3-subunit/python3-subunit-dbg: PKGV changed from 1.4.2 [default] to 1.4.3 [default]
packages/core2-32-poky-linux/python3-subunit/python3-subunit-dbg: PV changed from "1.4.2" to "1.4.3"
packages/core2-32-poky-linux/python3-subunit/python3-subunit-dev: PKGV changed from 1.4.2 [default] to 1.4.3 [default]
packages/core2-32-poky-linux/python3-subunit/python3-subunit-dev: PV changed from "1.4.2" to "1.4.3"
packages/core2-32-poky-linux/python3-subunit/python3-subunit-doc: PKGV changed from 1.4.2 [default] to 1.4.3 [default]
packages/core2-32-poky-linux/python3-subunit/python3-subunit-doc: PV changed from "1.4.2" to "1.4.3"
packages/core2-32-poky-linux/python3-subunit/python3-subunit-locale: PKGV changed from 1.4.2 [default] to 1.4.3 [default]
packages/core2-32-poky-linux/python3-subunit/python3-subunit-locale: PV changed from "1.4.2" to "1.4.3"
packages/core2-32-poky-linux/python3-subunit/python3-subunit-src: PKGV changed from 1.4.2 [default] to 1.4.3 [default]
packages/core2-32-poky-linux/python3-subunit/python3-subunit-src: PV changed from "1.4.2" to "1.4.3"
packages/core2-32-poky-linux/python3-subunit/python3-subunit-staticdev: PKGV changed from 1.4.2 [default] to 1.4.3 [default]
packages/core2-32-poky-linux/python3-subunit/python3-subunit-staticdev: PV changed from "1.4.2" to "1.4.3"
packages/core2-32-poky-linux/python3-subunit/python3-subunit: FILELIST: directory renamed /usr/lib/python3.11/site-packages/python_subunit-1.4.2.dist-info -> /usr/lib/python3.11/site-packages/python_subunit-1.4.3.dist-info, removed "/usr/lib/python3.11/site-packages/subunit/iso8601.py /usr/lib/python3.11/site-packages/subunit/__pycache__/iso8601.cpython-311.pyc"
packages/core2-32-poky-linux/python3-subunit/python3-subunit: PKGV changed from 1.4.2 [default] to 1.4.3 [default]
packages/core2-32-poky-linux/python3-subunit/python3-subunit: PKGSIZE changed from 932776 to 915191 (-2%)
packages/core2-32-poky-linux/python3-subunit/python3-subunit: PV changed from "1.4.2" to "1.4.3"
Changes to packages/core2-32-poky-linux/python3-subunit (sysroot):
  /usr/lib/python3.11/site-packages/python_subunit-1.4.2.dist-info moved to /usr/lib/python3.11/site-packages/python_subunit-1.4.3.dist-info
  /usr/lib/python3.11/site-packages/subunit/iso8601.py was removed
  /usr/lib/python3.11/site-packages/subunit/__pycache__/iso8601.cpython-311.pyc was removed

--===============3091264354734626232==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-subunit-upgrade-1.4.2-1.4.3.patch"

RnJvbSA1MzkzNjA0NzFhNzM4ODJiOTI2NjIzNmRhZTM1YTgzZTJlNGQ2ZmZmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMSBPY3QgMjAyMyAxMDoxNDowMyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtc3VidW5pdDogdXBncmFkZSAxLjQuMiAtPiAxLjQuMwoKLS0tCiAuLi51bml0XzEuNC4y
LmJiID0+IHB5dGhvbjMtc3VidW5pdF8xLjQuMy5iYn0gfCAyNiArKysrKysrKysrKysrKysrKy0t
CiAxIGZpbGUgY2hhbmdlZCwgMjQgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKIHJlbmFt
ZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLXN1YnVuaXRfMS40LjIuYmIg
PT4gcHl0aG9uMy1zdWJ1bml0XzEuNC4zLmJifSAoMzElKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVj
aXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1zdWJ1bml0XzEuNC4yLmJiIGIvbWV0YS9yZWNp
cGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXN1YnVuaXRfMS40LjMuYmIKc2ltaWxhcml0eSBp
bmRleCAzMSUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24z
LXN1YnVuaXRfMS40LjIuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24v
cHl0aG9uMy1zdWJ1bml0XzEuNC4zLmJiCmluZGV4IGEwMThlZjFkYzguLjY1NThkMzFhZWMgMTAw
NjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1zdWJ1bml0XzEu
NC4yLmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1zdWJ1bml0
XzEuNC4zLmJiCkBAIC0xLDEyICsxLDM0IEBACisjIEZJWE1FOiB0aGUgTElDX0ZJTEVTX0NIS1NV
TSB2YWx1ZXMgaGF2ZSBiZWVuIHVwZGF0ZWQgYnkgJ2RldnRvb2wgdXBncmFkZScuCisjIFRoZSBm
b2xsb3dpbmcgaXMgdGhlIGRpZmZlcmVuY2UgYmV0d2VlbiB0aGUgb2xkIGFuZCB0aGUgbmV3IGxp
Y2Vuc2UgdGV4dC4KKyMgUGxlYXNlIHVwZGF0ZSB0aGUgTElDRU5TRSB2YWx1ZSBpZiBuZWVkZWQs
IGFuZCBzdW1tYXJpemUgdGhlIGNoYW5nZXMgaW4KKyMgdGhlIGNvbW1pdCBtZXNzYWdlIHZpYSAn
TGljZW5zZS1VcGRhdGU6JyB0YWcuCisjIChleGFtcGxlOiAnTGljZW5zZS1VcGRhdGU6IGNvcHly
aWdodCB5ZWFycyB1cGRhdGVkLicpCisjCisjIFRoZSBjaGFuZ2VzOgorIworIyAtLS0gUkVBRE1F
LnJzdAorIyArKysgUkVBRE1FLnJzdAorIyBAQCAtMTUsNiArMTUsNiBAQAorIyAgCisjICAgIFNl
ZSB0aGUgQ09QWUlORyBmaWxlIGZvciBmdWxsIGRldGFpbHMgb24gdGhlIGxpY2Vuc2luZyBvZiBT
dWJ1bml0LgorIyAgCisjIC0gIHN1YnVuaXQgcmV1c2VzIGlzbzg2MDEgYnkgTWljaGFlbCBUd29t
ZXksIGRpc3RyaWJ1dGVkIHVuZGVyIGFuIE1JVCBzdHlsZQorIyAtICBsaWNlbmNlIC0gc2VlIHB5
dGhvbi9pc284NjAxL0xJQ0VOU0UgZm9yIGRldGFpbHMuCisjICtTdWJ1bml0CisjICstLS0tLS0t
CisjICAKKyMgCisjCisKIFNVTU1BUlkgPSAiUHl0aG9uIGltcGxlbWVudGF0aW9uIG9mIHN1YnVu
aXQgdGVzdCBzdHJlYW1pbmcgcHJvdG9jb2wiCiBIT01FUEFHRSA9ICJodHRwczovL3B5cGkub3Jn
L3Byb2plY3QvcHl0aG9uLXN1YnVuaXQvIgogU0VDVElPTiA9ICJkZXZlbC9weXRob24iCiBMSUNF
TlNFID0gIkFwYWNoZS0yLjAiCi1MSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9SRUFETUUucnN0
O2JlZ2lubGluZT0xO2VuZGxpbmU9MjA7bWQ1PTkwOWMwOGUyOTE2NDdmZDk4NWZiZTVkOTgzNmQ1
MWI2IgorTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vUkVBRE1FLnJzdDtiZWdpbmxpbmU9MTtl
bmRsaW5lPTIwO21kNT01NzFlMmQ3MDJlMjQ3YjlkOGE3NzQ1YjNiNTQzMTVlZCIKIAogUFlQSV9Q
QUNLQUdFID0gInB5dGhvbi1zdWJ1bml0IgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiMjk4OGQz
MjRkNTVlYzM1ZGQwMzdlNTAyZTNmNzRhYzM4ZjRlNDU3YmQ0NGVlMGVkZjVlODk4ZjdlZTExMzRk
NCIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICI5ZWU3NjA5MmQ1YjBhMDIwNTUyMTk3NjNmMWFhOWUy
ODgzNWYyZGQ3MjJmMDNlYTlmZDhkNjhlNDA2NmIzMzc4IgogCiBpbmhlcml0IHB5cGkgc2V0dXB0
b29sczMKIAotLSAKMi4zOS4yCgo=

--===============3091264354734626232==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/python3-subunit/python3-subunit: FILELIST: directory renamed /usr/lib/python3.11/site-packages/python_subunit-1.4.2.dist-info -> /usr/lib/python3.11/site-packages/python_subunit-1.4.3.dist-info, removed "/usr/lib/python3.11/site-packages/subunit/__pycache__/iso8601.cpython-311.pyc /usr/lib/python3.11/site-packages/subunit/iso8601.py"
Changes to packages/core2-32-poky-linux/python3-subunit (sysroot):
  /usr/lib/python3.11/site-packages/python_subunit-1.4.2.dist-info moved to /usr/lib/python3.11/site-packages/python_subunit-1.4.3.dist-info
  /usr/lib/python3.11/site-packages/subunit/iso8601.py was removed
  /usr/lib/python3.11/site-packages/subunit/__pycache__/iso8601.cpython-311.pyc was removed

--===============3091264354734626232==--

