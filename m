Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1BAEF42137
	for <webhook@archiver.kernel.org>; Wed, 15 Apr 2026 14:04:39 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19738.1776261874123920073
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Apr 2026 07:04:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=oD5hnjYU;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=TRjsy6vc;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101019d91755378-fab2c880-ba72-40f1-8265-6583b9d97f21-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1776261878;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=a7CDxBjI7idu1EJHSAiJt3ct2JvOD9Elx+Y8aPZg6nM=;
	b=oD5hnjYU+4UWxH4ADNmx2zoNJlsUoX9FryEUCd35ERIXplPRZLJ0ehaI7yfh0YHr
	Kc/9zSG5EEYrhD1V6RB68x85YA973heiAKDE7zQkS2fASheQyj9bHR3iiUWGbyWf66o
	CR5dl79UZDbGNNRfpVwuuf9L8ygSQ9hWkKdyZ4iU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1776261878;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=a7CDxBjI7idu1EJHSAiJt3ct2JvOD9Elx+Y8aPZg6nM=;
	b=TRjsy6vcBBry9HIC8O8gkDTyrnOnd0/SVeu+kIp11I373RHy+mgMvrHamlj1eVBa
	CVi7ukDyZLMbwZgjQ9vAOCCBmH7Eze86e6vpQE6D2thFiqbA+4xuNn2HrNmA9LjISJg
	ylcXJZ0NnlN6pCMTndFWp6sVHyaGervJrVaOjfgc=
Content-Type: multipart/mixed; boundary="===============6300610540053987611=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-jsonpointer: upgrading to 3.1.1 SUCCEEDED
Message-ID: <0101019d91755378-fab2c880-ba72-40f1-8265-6583b9d97f21-000000@us-west-2.amazonses.com>
Date: Wed, 15 Apr 2026 14:04:38 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.04.15-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Apr 2026 14:04:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235233

--===============6300610540053987611==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-jsonpointer* to *3.1.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-jsonpointer-upgrade-3.0.0-3.1.1.patch
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
From 8ed2e58b9856ee2c08e5eb754fede0e2f9c0c461 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 15 Apr 2026 07:41:00 +0000
Subject: [PATCH] python3-jsonpointer: upgrade 3.0.0 -> 3.1.1

---
 ...ython3-jsonpointer_3.0.0.bb => python3-jsonpointer_3.1.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-jsonpointer_3.0.0.bb => python3-jsonpointer_3.1.1.bb} (85%)

diff --git a/meta/recipes-devtools/python/python3-jsonpointer_3.0.0.bb b/meta/recipes-devtools/python/python3-jsonpointer_3.1.1.bb
similarity index 85%
rename from meta/recipes-devtools/python/python3-jsonpointer_3.0.0.bb
rename to meta/recipes-devtools/python/python3-jsonpointer_3.1.1.bb
index 0a23dc3100..ddc8e256a4 100644
--- a/meta/recipes-devtools/python/python3-jsonpointer_3.0.0.bb
+++ b/meta/recipes-devtools/python/python3-jsonpointer_3.1.1.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=32b15c843b7a329130f4e266a281ebb3"
 
 inherit pypi ptest setuptools3
 
-SRC_URI[sha256sum] = "2b2d729f2091522d61c3b31f82e11870f60b68f43fbc705cb76bf4b832af59ef"
+SRC_URI[sha256sum] = "0b801c7db33a904024f6004d526dcc53bbb8a4a0f4e32bfd10beadf60adf1900"
 
 SRC_URI += " \
 	file://run-ptest \
-- 
2.47.1


--===============6300610540053987611==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-jsonpointer/python3-jsonpointer: FILELIST: directory renamed /usr/lib/python3.14/site-packages/jsonpointer-3.0.0.dist-info -> /usr/lib/python3.14/site-packages/jsonpointer-3.1.1.dist-info, directory renamed /usr/lib/python3.14/site-packages/jsonpointer-3.0.0.dist-info/licenses -> /usr/lib/python3.14/site-packages/jsonpointer-3.1.1.dist-info/licenses
Changes to packages/x86-64-v3-poky-linux/python3-jsonpointer (sysroot):
  /usr/lib/python3.14/site-packages/jsonpointer-3.0.0.dist-info moved to /usr/lib/python3.14/site-packages/jsonpointer-3.1.1.dist-info

--===============6300610540053987611==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-jsonpointer-upgrade-3.0.0-3.1.1.patch"

RnJvbSA4ZWQyZTU4Yjk4NTZlZTJjMDhlNWViNzU0ZmVkZTBlMmY5YzBjNDYxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTUgQXByIDIwMjYgMDc6NDE6MDAgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLWpzb25wb2ludGVyOiB1cGdyYWRlIDMuMC4wIC0+IDMuMS4xCgotLS0KIC4uLnl0aG9u
My1qc29ucG9pbnRlcl8zLjAuMC5iYiA9PiBweXRob24zLWpzb25wb2ludGVyXzMuMS4xLmJifSB8
IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVu
YW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtanNvbnBvaW50ZXJfMy4w
LjAuYmIgPT4gcHl0aG9uMy1qc29ucG9pbnRlcl8zLjEuMS5iYn0gKDg1JSkKCmRpZmYgLS1naXQg
YS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtanNvbnBvaW50ZXJfMy4wLjAu
YmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtanNvbnBvaW50ZXJfMy4x
LjEuYmIKc2ltaWxhcml0eSBpbmRleCA4NSUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3B5dGhvbi9weXRob24zLWpzb25wb2ludGVyXzMuMC4wLmJiCnJlbmFtZSB0byBtZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtanNvbnBvaW50ZXJfMy4xLjEuYmIKaW5kZXgg
MGEyM2RjMzEwMC4uZGRjOGUyNTZhNCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L3B5dGhvbi9weXRob24zLWpzb25wb2ludGVyXzMuMC4wLmJiCisrKyBiL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9weXRob24vcHl0aG9uMy1qc29ucG9pbnRlcl8zLjEuMS5iYgpAQCAtNSw3ICs1LDcg
QEAgTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRS50eHQ7bWQ1PTMyYjE1Yzg0M2I3
YTMyOTEzMGY0ZTI2NmEyODFlYmIzIgogCiBpbmhlcml0IHB5cGkgcHRlc3Qgc2V0dXB0b29sczMK
IAotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjJiMmQ3MjlmMjA5MTUyMmQ2MWMzYjMxZjgyZTExODcw
ZjYwYjY4ZjQzZmJjNzA1Y2I3NmJmNGI4MzJhZjU5ZWYiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAi
MGI4MDFjN2RiMzNhOTA0MDI0ZjYwMDRkNTI2ZGNjNTNiYmI4YTRhMGY0ZTMyYmZkMTBiZWFkZjYw
YWRmMTkwMCIKIAogU1JDX1VSSSArPSAiIFwKIAlmaWxlOi8vcnVuLXB0ZXN0IFwKLS0gCjIuNDcu
MQoK

--===============6300610540053987611==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-jsonpointer: SRC_URI changed from "https://files.pythonhosted.org/packages/source/j/jsonpointer/jsonpointer-3.0.0.tar.gz;downloadfilename=jsonpointer-3.0.0.tar.gz file://run-ptest" to "https://files.pythonhosted.org/packages/source/j/jsonpointer/jsonpointer-3.1.1.tar.gz;downloadfilename=jsonpointer-3.1.1.tar.gz file://run-ptest"
packages/x86-64-v3-poky-linux/python3-jsonpointer: PV changed from "3.0.0" to "3.1.1"
packages/x86-64-v3-poky-linux/python3-jsonpointer: PKGV changed from 3.0.0 [default] to 3.1.1 [default]
packages/x86-64-v3-poky-linux/python3-jsonpointer/python3-jsonpointer-dbg: PV changed from "3.0.0" to "3.1.1"
packages/x86-64-v3-poky-linux/python3-jsonpointer/python3-jsonpointer-dbg: PKGV changed from 3.0.0 [default] to 3.1.1 [default]
packages/x86-64-v3-poky-linux/python3-jsonpointer/python3-jsonpointer-dev: PV changed from "3.0.0" to "3.1.1"
packages/x86-64-v3-poky-linux/python3-jsonpointer/python3-jsonpointer-dev: PKGV changed from 3.0.0 [default] to 3.1.1 [default]
packages/x86-64-v3-poky-linux/python3-jsonpointer/python3-jsonpointer-doc: PV changed from "3.0.0" to "3.1.1"
packages/x86-64-v3-poky-linux/python3-jsonpointer/python3-jsonpointer-doc: PKGV changed from 3.0.0 [default] to 3.1.1 [default]
packages/x86-64-v3-poky-linux/python3-jsonpointer/python3-jsonpointer-locale: PV changed from "3.0.0" to "3.1.1"
packages/x86-64-v3-poky-linux/python3-jsonpointer/python3-jsonpointer-locale: PKGV changed from 3.0.0 [default] to 3.1.1 [default]
packages/x86-64-v3-poky-linux/python3-jsonpointer/python3-jsonpointer-ptest: PV changed from "3.0.0" to "3.1.1"
packages/x86-64-v3-poky-linux/python3-jsonpointer/python3-jsonpointer-ptest: PKGSIZE changed from 13171 to 12837 (-3%)
packages/x86-64-v3-poky-linux/python3-jsonpointer/python3-jsonpointer-ptest: PKGV changed from 3.0.0 [default] to 3.1.1 [default]
packages/x86-64-v3-poky-linux/python3-jsonpointer/python3-jsonpointer-src: PV changed from "3.0.0" to "3.1.1"
packages/x86-64-v3-poky-linux/python3-jsonpointer/python3-jsonpointer-src: PKGV changed from 3.0.0 [default] to 3.1.1 [default]
packages/x86-64-v3-poky-linux/python3-jsonpointer/python3-jsonpointer-staticdev: PV changed from "3.0.0" to "3.1.1"
packages/x86-64-v3-poky-linux/python3-jsonpointer/python3-jsonpointer-staticdev: PKGV changed from 3.0.0 [default] to 3.1.1 [default]
packages/x86-64-v3-poky-linux/python3-jsonpointer/python3-jsonpointer: PV changed from "3.0.0" to "3.1.1"
packages/x86-64-v3-poky-linux/python3-jsonpointer/python3-jsonpointer: PKGSIZE changed from 29746 to 29602 (-0%)
packages/x86-64-v3-poky-linux/python3-jsonpointer/python3-jsonpointer: FILELIST: directory renamed /usr/lib/python3.14/site-packages/jsonpointer-3.0.0.dist-info -> /usr/lib/python3.14/site-packages/jsonpointer-3.1.1.dist-info, directory renamed /usr/lib/python3.14/site-packages/jsonpointer-3.0.0.dist-info/licenses -> /usr/lib/python3.14/site-packages/jsonpointer-3.1.1.dist-info/licenses
packages/x86-64-v3-poky-linux/python3-jsonpointer/python3-jsonpointer: PKGV changed from 3.0.0 [default] to 3.1.1 [default]
Changes to packages/x86-64-v3-poky-linux/python3-jsonpointer (sysroot):
  /usr/lib/python3.14/site-packages/jsonpointer-3.0.0.dist-info moved to /usr/lib/python3.14/site-packages/jsonpointer-3.1.1.dist-info

--===============6300610540053987611==--

