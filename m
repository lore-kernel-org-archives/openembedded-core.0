Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AD39C83F3A
	for <webhook@archiver.kernel.org>; Tue,  1 Jul 2025 16:20:24 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web10.1425.1751386807795013058
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Jul 2025 09:20:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=u1LZT3HW;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=j1NBRScj;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 01010197c6c9f41e-1f9bc76c-8782-4447-99cd-e8427b6fb3d3-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1751386813;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=mYkUGYauljI2EybcW4lPybuQW2LEWu/L9e047I/iRng=;
	b=u1LZT3HW4Mzn+OWCNIpu2UKHsZZRigZZrgi3GVR/eAIXmkfNXMgSuW0jBohlx4AT
	0gKROMPqP5P1mgDzIsnY2uxnGWqx934oT7e2lgyD8oyyC4D6n0/RCyKuA3iKfo/vEqg
	AiW5cdTkstWx4FW4YaloVjQ3v/vmFAPhXT2DsLVU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1751386813;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=mYkUGYauljI2EybcW4lPybuQW2LEWu/L9e047I/iRng=;
	b=j1NBRScjW7c7aRLhlZMMUt6nPfJ+n7F3b98HrWMgUwl+PZxCYDl7tTvnuuRsezWM
	6taM+Rneg13cqW0XcjIUsU6fj83cJ9sNkCOMgntBd/HhIKCovKA7XLkc8QQHAgR1VgP
	YcWNrl4/7VTVctVDdOSAlUAyEEuStzdjScAV/yMc=
Content-Type: multipart/mixed; boundary="===============7949841637134253930=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-hatch-vcs: upgrading to 0.5.0 SUCCEEDED
Message-ID: <01010197c6c9f41e-1f9bc76c-8782-4447-99cd-e8427b6fb3d3-000000@us-west-2.amazonses.com>
Date: Tue, 1 Jul 2025 16:20:13 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.07.01-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Jul 2025 16:20:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219636

--===============7949841637134253930==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-hatch-vcs* to *0.5.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-hatch-vcs-upgrade-0.4.0-0.5.0.patch
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
From b119b52eeca522d8ca8837589a073884cb102b3d Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 1 Jul 2025 08:56:28 +0000
Subject: [PATCH] python3-hatch-vcs: upgrade 0.4.0 -> 0.5.0

---
 .../{python3-hatch-vcs_0.4.0.bb => python3-hatch-vcs_0.5.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-hatch-vcs_0.4.0.bb => python3-hatch-vcs_0.5.0.bb} (79%)

diff --git a/meta/recipes-devtools/python/python3-hatch-vcs_0.4.0.bb b/meta/recipes-devtools/python/python3-hatch-vcs_0.5.0.bb
similarity index 79%
rename from meta/recipes-devtools/python/python3-hatch-vcs_0.4.0.bb
rename to meta/recipes-devtools/python/python3-hatch-vcs_0.5.0.bb
index ac70295f45..011e28eb81 100644
--- a/meta/recipes-devtools/python/python3-hatch-vcs_0.4.0.bb
+++ b/meta/recipes-devtools/python/python3-hatch-vcs_0.5.0.bb
@@ -8,6 +8,6 @@ inherit pypi python_hatchling
 PYPI_PACKAGE = "hatch_vcs"
 UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
-SRC_URI[sha256sum] = "093810748fe01db0d451fabcf2c1ac2688caefd232d4ede967090b1c1b07d9f7"
+SRC_URI[sha256sum] = "0395fa126940340215090c344a2bf4e2a77bcbe7daab16f41b37b98c95809ff9"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.47.1


--===============7949841637134253930==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/python3-hatch-vcs (sysroot):
  /usr/lib/python3.13/site-packages/hatch_vcs-0.4.0.dist-info moved to /usr/lib/python3.13/site-packages/hatch_vcs-0.5.0.dist-info

--===============7949841637134253930==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-hatch-vcs: PKGV changed from 0.4.0 [default] to 0.5.0 [default]
packages/core2-64-poky-linux/python3-hatch-vcs: SRC_URI changed from "https://files.pythonhosted.org/packages/source/h/hatch_vcs/hatch_vcs-0.4.0.tar.gz;downloadfilename=hatch_vcs-0.4.0.tar.gz" to "https://files.pythonhosted.org/packages/source/h/hatch_vcs/hatch_vcs-0.5.0.tar.gz;downloadfilename=hatch_vcs-0.5.0.tar.gz"
packages/core2-64-poky-linux/python3-hatch-vcs: PV changed from "0.4.0" to "0.5.0"
packages/core2-64-poky-linux/python3-hatch-vcs/python3-hatch-vcs-dbg: PKGV changed from 0.4.0 [default] to 0.5.0 [default]
packages/core2-64-poky-linux/python3-hatch-vcs/python3-hatch-vcs-dbg: PV changed from "0.4.0" to "0.5.0"
packages/core2-64-poky-linux/python3-hatch-vcs/python3-hatch-vcs-dev: PKGV changed from 0.4.0 [default] to 0.5.0 [default]
packages/core2-64-poky-linux/python3-hatch-vcs/python3-hatch-vcs-dev: PV changed from "0.4.0" to "0.5.0"
packages/core2-64-poky-linux/python3-hatch-vcs/python3-hatch-vcs-doc: PKGV changed from 0.4.0 [default] to 0.5.0 [default]
packages/core2-64-poky-linux/python3-hatch-vcs/python3-hatch-vcs-doc: PV changed from "0.4.0" to "0.5.0"
packages/core2-64-poky-linux/python3-hatch-vcs/python3-hatch-vcs-locale: PKGV changed from 0.4.0 [default] to 0.5.0 [default]
packages/core2-64-poky-linux/python3-hatch-vcs/python3-hatch-vcs-locale: PV changed from "0.4.0" to "0.5.0"
packages/core2-64-poky-linux/python3-hatch-vcs/python3-hatch-vcs-src: PKGV changed from 0.4.0 [default] to 0.5.0 [default]
packages/core2-64-poky-linux/python3-hatch-vcs/python3-hatch-vcs-src: PV changed from "0.4.0" to "0.5.0"
packages/core2-64-poky-linux/python3-hatch-vcs/python3-hatch-vcs-staticdev: PKGV changed from 0.4.0 [default] to 0.5.0 [default]
packages/core2-64-poky-linux/python3-hatch-vcs/python3-hatch-vcs-staticdev: PV changed from "0.4.0" to "0.5.0"
packages/core2-64-poky-linux/python3-hatch-vcs/python3-hatch-vcs: PKGV changed from 0.4.0 [default] to 0.5.0 [default]
packages/core2-64-poky-linux/python3-hatch-vcs/python3-hatch-vcs: PV changed from "0.4.0" to "0.5.0"
packages/core2-64-poky-linux/python3-hatch-vcs/python3-hatch-vcs: PKGSIZE changed from 26221 to 26637 (+2%)
Changes to packages/core2-64-poky-linux/python3-hatch-vcs (sysroot):
  /usr/lib/python3.13/site-packages/hatch_vcs-0.4.0.dist-info moved to /usr/lib/python3.13/site-packages/hatch_vcs-0.5.0.dist-info

--===============7949841637134253930==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-hatch-vcs-upgrade-0.4.0-0.5.0.patch"

RnJvbSBiMTE5YjUyZWVjYTUyMmQ4Y2E4ODM3NTg5YTA3Mzg4NGNiMTAyYjNkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMSBKdWwgMjAyNSAwODo1NjoyOCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtaGF0Y2gtdmNzOiB1cGdyYWRlIDAuNC4wIC0+IDAuNS4wCgotLS0KIC4uLi97cHl0aG9u
My1oYXRjaC12Y3NfMC40LjAuYmIgPT4gcHl0aG9uMy1oYXRjaC12Y3NfMC41LjAuYmJ9ICB8IDIg
Ky0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1l
IG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtaGF0Y2gtdmNzXzAuNC4wLmJi
ID0+IHB5dGhvbjMtaGF0Y2gtdmNzXzAuNS4wLmJifSAoNzklKQoKZGlmZiAtLWdpdCBhL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1oYXRjaC12Y3NfMC40LjAuYmIgYi9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtaGF0Y2gtdmNzXzAuNS4wLmJiCnNpbWls
YXJpdHkgaW5kZXggNzklCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24v
cHl0aG9uMy1oYXRjaC12Y3NfMC40LjAuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29s
cy9weXRob24vcHl0aG9uMy1oYXRjaC12Y3NfMC41LjAuYmIKaW5kZXggYWM3MDI5NWY0NS4uMDEx
ZTI4ZWI4MSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24z
LWhhdGNoLXZjc18wLjQuMC5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5
dGhvbjMtaGF0Y2gtdmNzXzAuNS4wLmJiCkBAIC04LDYgKzgsNiBAQCBpbmhlcml0IHB5cGkgcHl0
aG9uX2hhdGNobGluZwogUFlQSV9QQUNLQUdFID0gImhhdGNoX3ZjcyIKIFVQU1RSRUFNX0NIRUNL
X1BZUElfUEFDS0FHRSA9ICIke1BZUElfUEFDS0FHRX0iCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9
ICIwOTM4MTA3NDhmZTAxZGIwZDQ1MWZhYmNmMmMxYWMyNjg4Y2FlZmQyMzJkNGVkZTk2NzA5MGIx
YzFiMDdkOWY3IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjAzOTVmYTEyNjk0MDM0MDIxNTA5MGMz
NDRhMmJmNGUyYTc3YmNiZTdkYWFiMTZmNDFiMzdiOThjOTU4MDlmZjkiCiAKIEJCQ0xBU1NFWFRF
TkQgPSAibmF0aXZlIG5hdGl2ZXNkayIKLS0gCjIuNDcuMQoK

--===============7949841637134253930==--

