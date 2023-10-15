Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6496C04AAB
	for <webhook@archiver.kernel.org>; Sun, 15 Oct 2023 19:45:22 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web11.102712.1697399114966582883
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Oct 2023 12:45:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=L7FQ2TD+;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=Y2D8/tkG;
 spf=pass (domain: automation.yoctoproject.org, ip: 54.240.27.191, mailfrom: 0101018b34df0a10-3326e947-e035-4698-ad39-29c32740b2c8-000000@automation.yoctoproject.org)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1697399114;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=dqx2WFXUNeNdSZPJioCQ2akMGvdqGRL8RIoGG148eDc=;
	b=L7FQ2TD+L/hTFqidubE4gUCjmn/3Qy54inotrq1HNsR6pF5pa5VwFlf7rJoYWfP6
	ccouR7+8QWR5RG2CjysbpE5tXCc/02zNALrgrL+nntyXvF5N1KCa+ru/k8Ms88q61uJ
	/M6HzGf9/r2cSLWov6DEkLcBXJ4L6hIl7/P42RkQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1697399114;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=dqx2WFXUNeNdSZPJioCQ2akMGvdqGRL8RIoGG148eDc=;
	b=Y2D8/tkG9GCxFKo5ZA8i6AcDhIbveiLVuIaiRS8013Y3Df9A4Riu01UJdbNkWOPc
	ZONsEmrq61Pee7W0znmAjbKRKK0eNi3s2rNiikh9Bp2nD88nCyq1ViMcmE7HROD+nPp
	7sfuvee4ac9La9SXLM+bTUmKAUhm71Rora6YFiEU=
Content-Type: multipart/mixed; boundary="===============7083359335001491005=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-subunit: upgrading to 1.4.3 SUCCEEDED
Message-ID: <0101018b34df0a10-3326e947-e035-4698-ad39-29c32740b2c8-000000@us-west-2.amazonses.com>
Date: Sun, 15 Oct 2023 19:45:14 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.10.15-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Oct 2023 19:45:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189203

--===============7083359335001491005==
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
From 7d7598363e8812339c2e8149b10d371ad832399f Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 15 Oct 2023 12:15:51 +0000
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


--===============7083359335001491005==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/python3-subunit/python3-subunit: FILELIST: directory renamed /usr/lib/python3.11/site-packages/python_subunit-1.4.2.dist-info -> /usr/lib/python3.11/site-packages/python_subunit-1.4.3.dist-info, removed "/usr/lib/python3.11/site-packages/subunit/iso8601.py /usr/lib/python3.11/site-packages/subunit/__pycache__/iso8601.cpython-311.pyc"
Changes to packages/core2-32-poky-linux/python3-subunit (sysroot):
  /usr/lib/python3.11/site-packages/python_subunit-1.4.2.dist-info moved to /usr/lib/python3.11/site-packages/python_subunit-1.4.3.dist-info
  /usr/lib/python3.11/site-packages/subunit/iso8601.py was removed
  /usr/lib/python3.11/site-packages/subunit/__pycache__/iso8601.cpython-311.pyc was removed

--===============7083359335001491005==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-subunit-upgrade-1.4.2-1.4.3.patch"

RnJvbSA3ZDc1OTgzNjNlODgxMjMzOWMyZTgxNDliMTBkMzcxYWQ4MzIzOTlmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMTUgT2N0IDIwMjMgMTI6MTU6NTEgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXN1YnVuaXQ6IHVwZ3JhZGUgMS40LjIgLT4gMS40LjMKCi0tLQogLi4udW5pdF8xLjQu
Mi5iYiA9PiBweXRob24zLXN1YnVuaXRfMS40LjMuYmJ9IHwgMjYgKysrKysrKysrKysrKysrKyst
LQogMSBmaWxlIGNoYW5nZWQsIDI0IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCiByZW5h
bWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1zdWJ1bml0XzEuNC4yLmJi
ID0+IHB5dGhvbjMtc3VidW5pdF8xLjQuMy5iYn0gKDMxJSkKCmRpZmYgLS1naXQgYS9tZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtc3VidW5pdF8xLjQuMi5iYiBiL21ldGEvcmVj
aXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1zdWJ1bml0XzEuNC4zLmJiCnNpbWlsYXJpdHkg
aW5kZXggMzElCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9u
My1zdWJ1bml0XzEuNC4yLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9u
L3B5dGhvbjMtc3VidW5pdF8xLjQuMy5iYgppbmRleCBhMDE4ZWYxZGM4Li42NTU4ZDMxYWVjIDEw
MDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtc3VidW5pdF8x
LjQuMi5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtc3VidW5p
dF8xLjQuMy5iYgpAQCAtMSwxMiArMSwzNCBAQAorIyBGSVhNRTogdGhlIExJQ19GSUxFU19DSEtT
VU0gdmFsdWVzIGhhdmUgYmVlbiB1cGRhdGVkIGJ5ICdkZXZ0b29sIHVwZ3JhZGUnLgorIyBUaGUg
Zm9sbG93aW5nIGlzIHRoZSBkaWZmZXJlbmNlIGJldHdlZW4gdGhlIG9sZCBhbmQgdGhlIG5ldyBs
aWNlbnNlIHRleHQuCisjIFBsZWFzZSB1cGRhdGUgdGhlIExJQ0VOU0UgdmFsdWUgaWYgbmVlZGVk
LCBhbmQgc3VtbWFyaXplIHRoZSBjaGFuZ2VzIGluCisjIHRoZSBjb21taXQgbWVzc2FnZSB2aWEg
J0xpY2Vuc2UtVXBkYXRlOicgdGFnLgorIyAoZXhhbXBsZTogJ0xpY2Vuc2UtVXBkYXRlOiBjb3B5
cmlnaHQgeWVhcnMgdXBkYXRlZC4nKQorIworIyBUaGUgY2hhbmdlczoKKyMKKyMgLS0tIFJFQURN
RS5yc3QKKyMgKysrIFJFQURNRS5yc3QKKyMgQEAgLTE1LDYgKzE1LDYgQEAKKyMgIAorIyAgICBT
ZWUgdGhlIENPUFlJTkcgZmlsZSBmb3IgZnVsbCBkZXRhaWxzIG9uIHRoZSBsaWNlbnNpbmcgb2Yg
U3VidW5pdC4KKyMgIAorIyAtICBzdWJ1bml0IHJldXNlcyBpc284NjAxIGJ5IE1pY2hhZWwgVHdv
bWV5LCBkaXN0cmlidXRlZCB1bmRlciBhbiBNSVQgc3R5bGUKKyMgLSAgbGljZW5jZSAtIHNlZSBw
eXRob24vaXNvODYwMS9MSUNFTlNFIGZvciBkZXRhaWxzLgorIyArU3VidW5pdAorIyArLS0tLS0t
LQorIyAgCisjIAorIworCiBTVU1NQVJZID0gIlB5dGhvbiBpbXBsZW1lbnRhdGlvbiBvZiBzdWJ1
bml0IHRlc3Qgc3RyZWFtaW5nIHByb3RvY29sIgogSE9NRVBBR0UgPSAiaHR0cHM6Ly9weXBpLm9y
Zy9wcm9qZWN0L3B5dGhvbi1zdWJ1bml0LyIKIFNFQ1RJT04gPSAiZGV2ZWwvcHl0aG9uIgogTElD
RU5TRSA9ICJBcGFjaGUtMi4wIgotTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vUkVBRE1FLnJz
dDtiZWdpbmxpbmU9MTtlbmRsaW5lPTIwO21kNT05MDljMDhlMjkxNjQ3ZmQ5ODVmYmU1ZDk4MzZk
NTFiNiIKK0xJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL1JFQURNRS5yc3Q7YmVnaW5saW5lPTE7
ZW5kbGluZT0yMDttZDU9NTcxZTJkNzAyZTI0N2I5ZDhhNzc0NWIzYjU0MzE1ZWQiCiAKIFBZUElf
UEFDS0FHRSA9ICJweXRob24tc3VidW5pdCIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjI5ODhk
MzI0ZDU1ZWMzNWRkMDM3ZTUwMmUzZjc0YWMzOGY0ZTQ1N2JkNDRlZTBlZGY1ZTg5OGY3ZWUxMTM0
ZDQiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiOWVlNzYwOTJkNWIwYTAyMDU1MjE5NzYzZjFhYTll
Mjg4MzVmMmRkNzIyZjAzZWE5ZmQ4ZDY4ZTQwNjZiMzM3OCIKIAogaW5oZXJpdCBweXBpIHNldHVw
dG9vbHMzCiAKLS0gCjIuMzkuMgoK

--===============7083359335001491005==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-subunit: PV changed from "1.4.2" to "1.4.3"
packages/core2-32-poky-linux/python3-subunit: SRC_URI changed from "https://files.pythonhosted.org/packages/source/p/python-subunit/python-subunit-1.4.2.tar.gz;downloadfilename=python-subunit-1.4.2.tar.gz" to "https://files.pythonhosted.org/packages/source/p/python-subunit/python-subunit-1.4.3.tar.gz;downloadfilename=python-subunit-1.4.3.tar.gz"
packages/core2-32-poky-linux/python3-subunit: PKGV changed from 1.4.2 [default] to 1.4.3 [default]
packages/core2-32-poky-linux/python3-subunit/python3-subunit-dbg: PV changed from "1.4.2" to "1.4.3"
packages/core2-32-poky-linux/python3-subunit/python3-subunit-dbg: PKGV changed from 1.4.2 [default] to 1.4.3 [default]
packages/core2-32-poky-linux/python3-subunit/python3-subunit-dev: PV changed from "1.4.2" to "1.4.3"
packages/core2-32-poky-linux/python3-subunit/python3-subunit-dev: PKGV changed from 1.4.2 [default] to 1.4.3 [default]
packages/core2-32-poky-linux/python3-subunit/python3-subunit-doc: PV changed from "1.4.2" to "1.4.3"
packages/core2-32-poky-linux/python3-subunit/python3-subunit-doc: PKGV changed from 1.4.2 [default] to 1.4.3 [default]
packages/core2-32-poky-linux/python3-subunit/python3-subunit-locale: PV changed from "1.4.2" to "1.4.3"
packages/core2-32-poky-linux/python3-subunit/python3-subunit-locale: PKGV changed from 1.4.2 [default] to 1.4.3 [default]
packages/core2-32-poky-linux/python3-subunit/python3-subunit-src: PV changed from "1.4.2" to "1.4.3"
packages/core2-32-poky-linux/python3-subunit/python3-subunit-src: PKGV changed from 1.4.2 [default] to 1.4.3 [default]
packages/core2-32-poky-linux/python3-subunit/python3-subunit-staticdev: PV changed from "1.4.2" to "1.4.3"
packages/core2-32-poky-linux/python3-subunit/python3-subunit-staticdev: PKGV changed from 1.4.2 [default] to 1.4.3 [default]
packages/core2-32-poky-linux/python3-subunit/python3-subunit: PV changed from "1.4.2" to "1.4.3"
packages/core2-32-poky-linux/python3-subunit/python3-subunit: PKGSIZE changed from 932776 to 915191 (-2%)
packages/core2-32-poky-linux/python3-subunit/python3-subunit: PKGV changed from 1.4.2 [default] to 1.4.3 [default]
packages/core2-32-poky-linux/python3-subunit/python3-subunit: FILELIST: directory renamed /usr/lib/python3.11/site-packages/python_subunit-1.4.2.dist-info -> /usr/lib/python3.11/site-packages/python_subunit-1.4.3.dist-info, removed "/usr/lib/python3.11/site-packages/subunit/__pycache__/iso8601.cpython-311.pyc /usr/lib/python3.11/site-packages/subunit/iso8601.py"
Changes to packages/core2-32-poky-linux/python3-subunit (sysroot):
  /usr/lib/python3.11/site-packages/python_subunit-1.4.2.dist-info moved to /usr/lib/python3.11/site-packages/python_subunit-1.4.3.dist-info
  /usr/lib/python3.11/site-packages/subunit/iso8601.py was removed
  /usr/lib/python3.11/site-packages/subunit/__pycache__/iso8601.cpython-311.pyc was removed

--===============7083359335001491005==--

