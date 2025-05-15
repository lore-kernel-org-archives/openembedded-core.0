Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2781C5B545
	for <webhook@archiver.kernel.org>; Thu, 15 May 2025 12:32:00 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web10.11252.1747312304866832164
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 May 2025 05:31:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=fCYcib8U;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=Pr7vJSDS;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 01010196d3ee0526-1af38b2a-5377-4591-b489-e500771db049-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1747312313;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=XXUCImp5q6/EMjV24O77AZgjnb+Cde7lOLdT3fZfI3c=;
	b=fCYcib8UWwvhBrarWBNFB0uGc4QnbpJVTTJMYQvLXONUOBOFyQ2eyPUbSrEYGko9
	V7ZlQFzO0ZHi5/qYcwdMyB1Vm8oYhr8LfdlbBfH15XEESTCyIEsZ4IIDJ/4N74QkBL3
	Di39+8PY9E/jKZy/nu2O8ym4loMaJbfCONYyOZGY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1747312313;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=XXUCImp5q6/EMjV24O77AZgjnb+Cde7lOLdT3fZfI3c=;
	b=Pr7vJSDS3C2/RHL7uwVHdgSfa58i393y14C/ZwakmpAT2oexkCKCTHRhVtX4r4Yf
	6NRznAiu68VTPVefgzBOA/pW6G0qi8mtW/klWjaBA046reywyrRwHftcxwF1rxSEPFT
	ycpeVNO3Tk2nJ7r9QGxrZ2dZuLEt5SB4MPvEe4ZA=
Content-Type: multipart/mixed; boundary="===============4863434191239313136=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Wang Mingyu <wangmy@fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-click: upgrading to 8.2.0 SUCCEEDED
Message-ID: <01010196d3ee0526-1af38b2a-5377-4591-b489-e500771db049-000000@us-west-2.amazonses.com>
Date: Thu, 15 May 2025 12:31:53 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.05.15-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 May 2025 12:32:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216608

--===============4863434191239313136==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-click* to *8.2.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-click-upgrade-8.1.8-8.2.0.patch
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
From 259d8ddcb4e3c993e47d17e967edf129398aa78b Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 15 May 2025 07:51:50 +0000
Subject: [PATCH] python3-click: upgrade 8.1.8 -> 8.2.0

---
 .../python/{python3-click_8.1.8.bb => python3-click_8.2.0.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-click_8.1.8.bb => python3-click_8.2.0.bb} (90%)

diff --git a/meta/recipes-devtools/python/python3-click_8.1.8.bb b/meta/recipes-devtools/python/python3-click_8.2.0.bb
similarity index 90%
rename from meta/recipes-devtools/python/python3-click_8.1.8.bb
rename to meta/recipes-devtools/python/python3-click_8.2.0.bb
index 7be3d73546..d066f2b7b9 100644
--- a/meta/recipes-devtools/python/python3-click_8.1.8.bb
+++ b/meta/recipes-devtools/python/python3-click_8.2.0.bb
@@ -8,7 +8,7 @@ HOMEPAGE = "http://click.pocoo.org/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=1fa98232fd645608937a0fdc82e999b8"
 
-SRC_URI[sha256sum] = "ed53c9d8990d83c2a27deae68e4ee337473f6330c040a31d4225c9574d16096a"
+SRC_URI[sha256sum] = "f5452aeddd9988eefa20f90f05ab66f17fce1ee2a36907fd30b05bbb5953814d"
 
 inherit pypi python_flit_core ptest-python-pytest
 
-- 
2.47.1


--===============4863434191239313136==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-click-upgrade-8.1.8-8.2.0.patch"

RnJvbSAyNTlkOGRkY2I0ZTNjOTkzZTQ3ZDE3ZTk2N2VkZjEyOTM5OGFhNzhiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgTWF5IDIwMjUgMDc6NTE6NTAgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLWNsaWNrOiB1cGdyYWRlIDguMS44IC0+IDguMi4wCgotLS0KIC4uLi9weXRob24ve3B5
dGhvbjMtY2xpY2tfOC4xLjguYmIgPT4gcHl0aG9uMy1jbGlja184LjIuMC5iYn0gICB8IDIgKy0K
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1l
dGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtY2xpY2tfOC4xLjguYmIgPT4gcHl0
aG9uMy1jbGlja184LjIuMC5iYn0gKDkwJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvcHl0aG9uL3B5dGhvbjMtY2xpY2tfOC4xLjguYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcHl0aG9uL3B5dGhvbjMtY2xpY2tfOC4yLjAuYmIKc2ltaWxhcml0eSBpbmRleCA5MCUKcmVu
YW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWNsaWNrXzguMS44
LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtY2xpY2tf
OC4yLjAuYmIKaW5kZXggN2JlM2Q3MzU0Ni4uZDA2NmYyYjdiOSAxMDA2NDQKLS0tIGEvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWNsaWNrXzguMS44LmJiCisrKyBiL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1jbGlja184LjIuMC5iYgpAQCAtOCw3ICs4
LDcgQEAgSE9NRVBBR0UgPSAiaHR0cDovL2NsaWNrLnBvY29vLm9yZy8iCiBMSUNFTlNFID0gIkJT
RC0zLUNsYXVzZSIKIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0UudHh0O21kNT0x
ZmE5ODIzMmZkNjQ1NjA4OTM3YTBmZGM4MmU5OTliOCIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0g
ImVkNTNjOWQ4OTkwZDgzYzJhMjdkZWFlNjhlNGVlMzM3NDczZjYzMzBjMDQwYTMxZDQyMjVjOTU3
NGQxNjA5NmEiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiZjU0NTJhZWRkZDk5ODhlZWZhMjBmOTBm
MDVhYjY2ZjE3ZmNlMWVlMmEzNjkwN2ZkMzBiMDViYmI1OTUzODE0ZCIKIAogaW5oZXJpdCBweXBp
IHB5dGhvbl9mbGl0X2NvcmUgcHRlc3QtcHl0aG9uLXB5dGVzdAogCi0tIAoyLjQ3LjEKCg==

--===============4863434191239313136==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-click: PV changed from "8.1.8" to "8.2.0"
packages/core2-64-poky-linux/python3-click: SRC_URI changed from "https://files.pythonhosted.org/packages/source/c/click/click-8.1.8.tar.gz;downloadfilename=click-8.1.8.tar.gz" to "https://files.pythonhosted.org/packages/source/c/click/click-8.2.0.tar.gz;downloadfilename=click-8.2.0.tar.gz"
packages/core2-64-poky-linux/python3-click: PKGV changed from 8.1.8 [default] to 8.2.0 [default]
packages/core2-64-poky-linux/python3-click/python3-click-dbg: PV changed from "8.1.8" to "8.2.0"
packages/core2-64-poky-linux/python3-click/python3-click-dbg: PKGV changed from 8.1.8 [default] to 8.2.0 [default]
packages/core2-64-poky-linux/python3-click/python3-click-dev: PV changed from "8.1.8" to "8.2.0"
packages/core2-64-poky-linux/python3-click/python3-click-dev: PKGV changed from 8.1.8 [default] to 8.2.0 [default]
packages/core2-64-poky-linux/python3-click/python3-click-doc: PV changed from "8.1.8" to "8.2.0"
packages/core2-64-poky-linux/python3-click/python3-click-doc: PKGV changed from 8.1.8 [default] to 8.2.0 [default]
packages/core2-64-poky-linux/python3-click/python3-click-locale: PV changed from "8.1.8" to "8.2.0"
packages/core2-64-poky-linux/python3-click/python3-click-locale: PKGV changed from 8.1.8 [default] to 8.2.0 [default]
packages/core2-64-poky-linux/python3-click/python3-click-ptest: PV changed from "8.1.8" to "8.2.0"
packages/core2-64-poky-linux/python3-click/python3-click-ptest: PKGV changed from 8.1.8 [default] to 8.2.0 [default]
packages/core2-64-poky-linux/python3-click/python3-click-ptest: FILELIST: removed "/usr/lib/python3-click/ptest/docs/upgrading.rst /usr/lib/python3-click/ptest/docs/testing.rst", added "/usr/lib/python3-click/ptest/docs/option-decorators.rst /usr/lib/python3-click/ptest/docs/testing.md /usr/lib/python3-click/ptest/docs/commands-and-groups.rst /usr/lib/python3-click/ptest/docs/entry-points.rst /usr/lib/python3-click/ptest/tests/typing/typing_progressbar.py /usr/lib/python3-click/ptest/docs/parameter-types.rst"
packages/core2-64-poky-linux/python3-click/python3-click-ptest: PKGSIZE changed from 389066 to 410818 (+6%)
packages/core2-64-poky-linux/python3-click/python3-click-src: PV changed from "8.1.8" to "8.2.0"
packages/core2-64-poky-linux/python3-click/python3-click-src: PKGV changed from 8.1.8 [default] to 8.2.0 [default]
packages/core2-64-poky-linux/python3-click/python3-click-staticdev: PV changed from "8.1.8" to "8.2.0"
packages/core2-64-poky-linux/python3-click/python3-click-staticdev: PKGV changed from 8.1.8 [default] to 8.2.0 [default]
packages/core2-64-poky-linux/python3-click/python3-click: PV changed from "8.1.8" to "8.2.0"
packages/core2-64-poky-linux/python3-click/python3-click: PKGV changed from 8.1.8 [default] to 8.2.0 [default]
packages/core2-64-poky-linux/python3-click/python3-click: PKGSIZE changed from 799194 to 800571 (+0%)
Changes to packages/core2-64-poky-linux/python3-click (sysroot):
  /usr/lib/python3.13/site-packages/click-8.1.8.dist-info moved to /usr/lib/python3.13/site-packages/click-8.2.0.dist-info

--===============4863434191239313136==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/python3-click/python3-click-ptest: FILELIST: removed "/usr/lib/python3-click/ptest/docs/upgrading.rst /usr/lib/python3-click/ptest/docs/testing.rst", added "/usr/lib/python3-click/ptest/docs/entry-points.rst /usr/lib/python3-click/ptest/docs/commands-and-groups.rst /usr/lib/python3-click/ptest/docs/parameter-types.rst /usr/lib/python3-click/ptest/docs/option-decorators.rst /usr/lib/python3-click/ptest/docs/testing.md /usr/lib/python3-click/ptest/tests/typing/typing_progressbar.py"
Changes to packages/core2-64-poky-linux/python3-click (sysroot):
  /usr/lib/python3.13/site-packages/click-8.1.8.dist-info moved to /usr/lib/python3.13/site-packages/click-8.2.0.dist-info

--===============4863434191239313136==--

