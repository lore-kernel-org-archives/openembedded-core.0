Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99FC3D172B9
	for <webhook@archiver.kernel.org>; Sun,  1 Feb 2026 13:12:56 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.29193.1769951570445539798
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Feb 2026 05:12:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=gpP3NSTl;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=SsCvPN1j;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101019c1955a7fe-9083cc74-4e47-425f-9e59-1638d61261e8-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1769951570;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=TUcj2KjZH85nTdIonXGr4boScaZxWU6hifUYHGE+Sx8=;
	b=gpP3NSTlRZ4jMwsnRMxEdY1DgJ6AcbiEgk9JcvFwTBVde68aZfDbTX1vrkDENhz8
	3B4H1cquC22va4F1v2MCUy/oeFVZY9cvAHllf1M4ZLcsPewCEYeiMCPMsmtpuCRL51I
	rnZqaRLa95E+ss4j+M6VM4ajgAlWdLRPC95mXKNA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1769951570;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=TUcj2KjZH85nTdIonXGr4boScaZxWU6hifUYHGE+Sx8=;
	b=SsCvPN1joxFHDEbFZ9kUMLXI5xoStljHAFeiHupFmZeSuyOitspVEXlzpTi3ZK4+
	r6SYfsOrfUBYDvUWnPzHbVmYSogOJ4bS4keqoKMkBrbUCQeU7uu94q2VrQrHcSMEZg2
	TeyT/o9qjlQsMJlp0T6gVrlEcjSFYzCqgd5zAAs0=
Content-Type: multipart/mixed; boundary="===============4896349526170942726=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-psutil: upgrading to 7.2.2 SUCCEEDED
Message-ID: <0101019c1955a7fe-9083cc74-4e47-425f-9e59-1638d61261e8-000000@us-west-2.amazonses.com>
Date: Sun, 1 Feb 2026 13:12:49 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.02.01-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Feb 2026 13:12:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230285

--===============4896349526170942726==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-psutil* to *7.2.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-psutil-upgrade-7.2.1-7.2.2.patch
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
From a681a0778dedbdd2769ce8d2890f5ec5267f8c0d Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 1 Feb 2026 09:11:03 +0000
Subject: [PATCH] python3-psutil: upgrade 7.2.1 -> 7.2.2

---
 .../python/{python3-psutil_7.2.1.bb => python3-psutil_7.2.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-psutil_7.2.1.bb => python3-psutil_7.2.2.bb} (90%)

diff --git a/meta/recipes-devtools/python/python3-psutil_7.2.1.bb b/meta/recipes-devtools/python/python3-psutil_7.2.2.bb
similarity index 90%
rename from meta/recipes-devtools/python/python3-psutil_7.2.1.bb
rename to meta/recipes-devtools/python/python3-psutil_7.2.2.bb
index 0a9b073855..98270defab 100644
--- a/meta/recipes-devtools/python/python3-psutil_7.2.1.bb
+++ b/meta/recipes-devtools/python/python3-psutil_7.2.2.bb
@@ -3,7 +3,7 @@ LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a9c72113a843d0d732a0ac1c200d81b1"
 HOMEPAGE = "https://pypi.org/project/psutil/"
 
-SRC_URI[sha256sum] = "f7583aec590485b43ca601dd9cea0dcd65bd7bb21d30ef4ddbf4ea6b5ed1bdd3"
+SRC_URI[sha256sum] = "0746f5f8d406af344fd547f1c8daa5f5c33dbc293bb8d6a16d80b4bb88f59372"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.47.1


--===============4896349526170942726==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-psutil/python3-psutil: FILELIST: directory renamed /usr/lib/python3.14/site-packages/psutil-7.2.1.dist-info -> /usr/lib/python3.14/site-packages/psutil-7.2.2.dist-info, directory renamed /usr/lib/python3.14/site-packages/psutil-7.2.1.dist-info/licenses -> /usr/lib/python3.14/site-packages/psutil-7.2.2.dist-info/licenses
Changes to packages/x86-64-v3-poky-linux/python3-psutil (sysroot):
  /usr/lib/python3.14/site-packages/psutil-7.2.1.dist-info moved to /usr/lib/python3.14/site-packages/psutil-7.2.2.dist-info

--===============4896349526170942726==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-psutil: PKGV changed from 7.2.1 [default] to 7.2.2 [default]
packages/x86-64-v3-poky-linux/python3-psutil: PV changed from "7.2.1" to "7.2.2"
packages/x86-64-v3-poky-linux/python3-psutil: SRC_URI changed from "https://files.pythonhosted.org/packages/source/p/psutil/psutil-7.2.1.tar.gz;downloadfilename=psutil-7.2.1.tar.gz" to "https://files.pythonhosted.org/packages/source/p/psutil/psutil-7.2.2.tar.gz;downloadfilename=psutil-7.2.2.tar.gz"
packages/x86-64-v3-poky-linux/python3-psutil/python3-psutil-dbg: PKGV changed from 7.2.1 [default] to 7.2.2 [default]
packages/x86-64-v3-poky-linux/python3-psutil/python3-psutil-dbg: PV changed from "7.2.1" to "7.2.2"
packages/x86-64-v3-poky-linux/python3-psutil/python3-psutil-dev: PKGV changed from 7.2.1 [default] to 7.2.2 [default]
packages/x86-64-v3-poky-linux/python3-psutil/python3-psutil-dev: PV changed from "7.2.1" to "7.2.2"
packages/x86-64-v3-poky-linux/python3-psutil/python3-psutil-doc: PKGV changed from 7.2.1 [default] to 7.2.2 [default]
packages/x86-64-v3-poky-linux/python3-psutil/python3-psutil-doc: PV changed from "7.2.1" to "7.2.2"
packages/x86-64-v3-poky-linux/python3-psutil/python3-psutil-locale: PKGV changed from 7.2.1 [default] to 7.2.2 [default]
packages/x86-64-v3-poky-linux/python3-psutil/python3-psutil-locale: PV changed from "7.2.1" to "7.2.2"
packages/x86-64-v3-poky-linux/python3-psutil/python3-psutil-src: PKGV changed from 7.2.1 [default] to 7.2.2 [default]
packages/x86-64-v3-poky-linux/python3-psutil/python3-psutil-src: PV changed from "7.2.1" to "7.2.2"
packages/x86-64-v3-poky-linux/python3-psutil/python3-psutil-src: FILELIST: directory renamed /usr/src/debug/python3-psutil/7.2.1/psutil/arch/linux -> /usr/src/debug/python3-psutil/7.2.2/psutil/arch/linux, directory renamed /usr/src/debug/python3-psutil/7.2.1/psutil -> /usr/src/debug/python3-psutil/7.2.2/psutil, directory renamed /usr/src/debug/python3-psutil/7.2.1/psutil/arch/all -> /usr/src/debug/python3-psutil/7.2.2/psutil/arch/all, directory renamed /usr/src/debug/python3-psutil/7.2.1/psutil/arch/posix -> /usr/src/debug/python3-psutil/7.2.2/psutil/arch/posix
packages/x86-64-v3-poky-linux/python3-psutil/python3-psutil-staticdev: PKGV changed from 7.2.1 [default] to 7.2.2 [default]
packages/x86-64-v3-poky-linux/python3-psutil/python3-psutil-staticdev: PV changed from "7.2.1" to "7.2.2"
packages/x86-64-v3-poky-linux/python3-psutil/python3-psutil-tests: PKGV changed from 7.2.1 [default] to 7.2.2 [default]
packages/x86-64-v3-poky-linux/python3-psutil/python3-psutil-tests: PV changed from "7.2.1" to "7.2.2"
packages/x86-64-v3-poky-linux/python3-psutil/python3-psutil: PKGV changed from 7.2.1 [default] to 7.2.2 [default]
packages/x86-64-v3-poky-linux/python3-psutil/python3-psutil: PKGSIZE changed from 787283 to 798803 (+1%)
packages/x86-64-v3-poky-linux/python3-psutil/python3-psutil: PV changed from "7.2.1" to "7.2.2"
packages/x86-64-v3-poky-linux/python3-psutil/python3-psutil: FILELIST: directory renamed /usr/lib/python3.14/site-packages/psutil-7.2.1.dist-info/licenses -> /usr/lib/python3.14/site-packages/psutil-7.2.2.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/psutil-7.2.1.dist-info -> /usr/lib/python3.14/site-packages/psutil-7.2.2.dist-info
Changes to packages/x86-64-v3-poky-linux/python3-psutil (sysroot):
  /usr/lib/python3.14/site-packages/psutil-7.2.1.dist-info moved to /usr/lib/python3.14/site-packages/psutil-7.2.2.dist-info

--===============4896349526170942726==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-psutil-upgrade-7.2.1-7.2.2.patch"

RnJvbSBhNjgxYTA3NzhkZWRiZGQyNzY5Y2U4ZDI4OTBmNWVjNTI2N2Y4YzBkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMSBGZWIgMjAyNiAwOToxMTowMyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtcHN1dGlsOiB1cGdyYWRlIDcuMi4xIC0+IDcuMi4yCgotLS0KIC4uLi9weXRob24ve3B5
dGhvbjMtcHN1dGlsXzcuMi4xLmJiID0+IHB5dGhvbjMtcHN1dGlsXzcuMi4yLmJifSB8IDIgKy0K
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1l
dGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtcHN1dGlsXzcuMi4xLmJiID0+IHB5
dGhvbjMtcHN1dGlsXzcuMi4yLmJifSAoOTAlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9weXRob24vcHl0aG9uMy1wc3V0aWxfNy4yLjEuYmIgYi9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvcHl0aG9uL3B5dGhvbjMtcHN1dGlsXzcuMi4yLmJiCnNpbWlsYXJpdHkgaW5kZXggOTAl
CnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1wc3V0aWxf
Ny4yLjEuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1w
c3V0aWxfNy4yLjIuYmIKaW5kZXggMGE5YjA3Mzg1NS4uOTgyNzBkZWZhYiAxMDA2NDQKLS0tIGEv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXBzdXRpbF83LjIuMS5iYgorKysg
Yi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcHN1dGlsXzcuMi4yLmJiCkBA
IC0zLDcgKzMsNyBAQCBMSUNFTlNFID0gIkJTRC0zLUNsYXVzZSIKIExJQ19GSUxFU19DSEtTVU0g
PSAiZmlsZTovL0xJQ0VOU0U7bWQ1PWE5YzcyMTEzYTg0M2QwZDczMmEwYWMxYzIwMGQ4MWIxIgog
SE9NRVBBR0UgPSAiaHR0cHM6Ly9weXBpLm9yZy9wcm9qZWN0L3BzdXRpbC8iCiAKLVNSQ19VUklb
c2hhMjU2c3VtXSA9ICJmNzU4M2FlYzU5MDQ4NWI0M2NhNjAxZGQ5Y2VhMGRjZDY1YmQ3YmIyMWQz
MGVmNGRkYmY0ZWE2YjVlZDFiZGQzIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjA3NDZmNWY4ZDQw
NmFmMzQ0ZmQ1NDdmMWM4ZGFhNWY1YzMzZGJjMjkzYmI4ZDZhMTZkODBiNGJiODhmNTkzNzIiCiAK
IGluaGVyaXQgcHlwaSBweXRob25fc2V0dXB0b29sc19idWlsZF9tZXRhCiAKLS0gCjIuNDcuMQoK

--===============4896349526170942726==--

