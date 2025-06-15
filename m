Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86978C7EE2A
	for <webhook@archiver.kernel.org>; Sun, 15 Jun 2025 13:14:52 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web10.8865.1749993282805079589
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Jun 2025 06:14:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=qYpzEmLU;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=hg3maLCi;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101019773ba6836-f8a23537-d10a-4a6f-9e71-9001790dc9dd-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1749993285;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=scPVW9/X3F78S/M1hwvwk99t54BKVo3qYUtBasybM4Q=;
	b=qYpzEmLUakuXCfCN4PALonqCiToOsqIYgD4W40y2hQmV0A1dkwyA3XDW4fKj9wss
	iiS2eG/UkAb6fgTCW+n6VeMr7DSCS8/ZuwHFKFtz4Zk/qcmhd6HttVCvcnJuapkJD+j
	OOmjlvwC0yf6wU0Vk8F1WBaIiC/rY/poPSSneYEM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1749993285;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=scPVW9/X3F78S/M1hwvwk99t54BKVo3qYUtBasybM4Q=;
	b=hg3maLCikoWecKc30RRkJ+B0ug8e0xkUqLYgmoc8IWysBw7JTH47YNxv/gCxE4Ob
	3yWUXgkmiqEOlvw6GJyF7enqXJmPjeibVz5rkkioHvXNnZVmyZWrNAIrbYruFNDSZS7
	9c7/zR1pFLZ7xDFOwauxdUMKlX3fJJAQU8RxqgHQ=
Content-Type: multipart/mixed; boundary="===============1419238431521978984=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Wang Mingyu <wangmy@fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-click: upgrading to 8.2.1 SUCCEEDED
Message-ID: <0101019773ba6836-f8a23537-d10a-4a6f-9e71-9001790dc9dd-000000@us-west-2.amazonses.com>
Date: Sun, 15 Jun 2025 13:14:45 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.06.15-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Jun 2025 13:14:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218677

--===============1419238431521978984==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-click* to *8.2.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-click-upgrade-8.1.8-8.2.1.patch
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
From 920a1d2102f48b19780960500504001a20bff6bb Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 15 Jun 2025 08:09:37 +0000
Subject: [PATCH] python3-click: upgrade 8.1.8 -> 8.2.1

---
 .../python/{python3-click_8.1.8.bb => python3-click_8.2.1.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-click_8.1.8.bb => python3-click_8.2.1.bb} (90%)

diff --git a/meta/recipes-devtools/python/python3-click_8.1.8.bb b/meta/recipes-devtools/python/python3-click_8.2.1.bb
similarity index 90%
rename from meta/recipes-devtools/python/python3-click_8.1.8.bb
rename to meta/recipes-devtools/python/python3-click_8.2.1.bb
index 7be3d73546..05be963309 100644
--- a/meta/recipes-devtools/python/python3-click_8.1.8.bb
+++ b/meta/recipes-devtools/python/python3-click_8.2.1.bb
@@ -8,7 +8,7 @@ HOMEPAGE = "http://click.pocoo.org/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=1fa98232fd645608937a0fdc82e999b8"
 
-SRC_URI[sha256sum] = "ed53c9d8990d83c2a27deae68e4ee337473f6330c040a31d4225c9574d16096a"
+SRC_URI[sha256sum] = "27c491cc05d968d271d5a1db13e3b5a184636d9d930f148c50b038f0d0646202"
 
 inherit pypi python_flit_core ptest-python-pytest
 
-- 
2.47.1


--===============1419238431521978984==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-click: PKGV changed from 8.1.8 [default] to 8.2.1 [default]
packages/core2-64-poky-linux/python3-click: SRC_URI changed from "https://files.pythonhosted.org/packages/source/c/click/click-8.1.8.tar.gz;downloadfilename=click-8.1.8.tar.gz" to "https://files.pythonhosted.org/packages/source/c/click/click-8.2.1.tar.gz;downloadfilename=click-8.2.1.tar.gz"
packages/core2-64-poky-linux/python3-click: PV changed from "8.1.8" to "8.2.1"
packages/core2-64-poky-linux/python3-click/python3-click-dbg: PKGV changed from 8.1.8 [default] to 8.2.1 [default]
packages/core2-64-poky-linux/python3-click/python3-click-dbg: PV changed from "8.1.8" to "8.2.1"
packages/core2-64-poky-linux/python3-click/python3-click-dev: PKGV changed from 8.1.8 [default] to 8.2.1 [default]
packages/core2-64-poky-linux/python3-click/python3-click-dev: PV changed from "8.1.8" to "8.2.1"
packages/core2-64-poky-linux/python3-click/python3-click-doc: PKGV changed from 8.1.8 [default] to 8.2.1 [default]
packages/core2-64-poky-linux/python3-click/python3-click-doc: PV changed from "8.1.8" to "8.2.1"
packages/core2-64-poky-linux/python3-click/python3-click-locale: PKGV changed from 8.1.8 [default] to 8.2.1 [default]
packages/core2-64-poky-linux/python3-click/python3-click-locale: PV changed from "8.1.8" to "8.2.1"
packages/core2-64-poky-linux/python3-click/python3-click-ptest: PKGSIZE changed from 389066 to 418448 (+8%)
packages/core2-64-poky-linux/python3-click/python3-click-ptest: PKGV changed from 8.1.8 [default] to 8.2.1 [default]
packages/core2-64-poky-linux/python3-click/python3-click-ptest: FILELIST: removed "/usr/lib/python3-click/ptest/docs/testing.rst /usr/lib/python3-click/ptest/docs/upgrading.rst /usr/lib/python3-click/ptest/docs/options.rst", added "/usr/lib/python3-click/ptest/docs/commands-and-groups.rst /usr/lib/python3-click/ptest/docs/parameter-types.rst /usr/lib/python3-click/ptest/tests/typing/typing_progressbar.py /usr/lib/python3-click/ptest/docs/faqs.md /usr/lib/python3-click/ptest/docs/entry-points.rst /usr/lib/python3-click/ptest/docs/options.md /usr/lib/python3-click/ptest/docs/click-concepts.rst /usr/lib/python3-click/ptest/docs/option-decorators.rst /usr/lib/python3-click/ptest/docs/testing.md /usr/lib/python3-click/ptest/docs/extending-click.rst"
packages/core2-64-poky-linux/python3-click/python3-click-ptest: PV changed from "8.1.8" to "8.2.1"
packages/core2-64-poky-linux/python3-click/python3-click-src: PKGV changed from 8.1.8 [default] to 8.2.1 [default]
packages/core2-64-poky-linux/python3-click/python3-click-src: PV changed from "8.1.8" to "8.2.1"
packages/core2-64-poky-linux/python3-click/python3-click-staticdev: PKGV changed from 8.1.8 [default] to 8.2.1 [default]
packages/core2-64-poky-linux/python3-click/python3-click-staticdev: PV changed from "8.1.8" to "8.2.1"
packages/core2-64-poky-linux/python3-click/python3-click: PKGSIZE changed from 799119 to 801209 (+0%)
packages/core2-64-poky-linux/python3-click/python3-click: PKGV changed from 8.1.8 [default] to 8.2.1 [default]
packages/core2-64-poky-linux/python3-click/python3-click: PV changed from "8.1.8" to "8.2.1"
Changes to packages/core2-64-poky-linux/python3-click (sysroot):
  /usr/lib/python3.13/site-packages/click-8.1.8.dist-info moved to /usr/lib/python3.13/site-packages/click-8.2.1.dist-info

--===============1419238431521978984==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/python3-click/python3-click-ptest: FILELIST: removed "/usr/lib/python3-click/ptest/docs/testing.rst /usr/lib/python3-click/ptest/docs/upgrading.rst /usr/lib/python3-click/ptest/docs/options.rst", added "/usr/lib/python3-click/ptest/docs/option-decorators.rst /usr/lib/python3-click/ptest/docs/faqs.md /usr/lib/python3-click/ptest/docs/extending-click.rst /usr/lib/python3-click/ptest/tests/typing/typing_progressbar.py /usr/lib/python3-click/ptest/docs/entry-points.rst /usr/lib/python3-click/ptest/docs/click-concepts.rst /usr/lib/python3-click/ptest/docs/commands-and-groups.rst /usr/lib/python3-click/ptest/docs/testing.md /usr/lib/python3-click/ptest/docs/options.md /usr/lib/python3-click/ptest/docs/parameter-types.rst"
Changes to packages/core2-64-poky-linux/python3-click (sysroot):
  /usr/lib/python3.13/site-packages/click-8.1.8.dist-info moved to /usr/lib/python3.13/site-packages/click-8.2.1.dist-info

--===============1419238431521978984==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-click-upgrade-8.1.8-8.2.1.patch"

RnJvbSA5MjBhMWQyMTAyZjQ4YjE5NzgwOTYwNTAwNTA0MDAxYTIwYmZmNmJiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMTUgSnVuIDIwMjUgMDg6MDk6MzcgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLWNsaWNrOiB1cGdyYWRlIDguMS44IC0+IDguMi4xCgotLS0KIC4uLi9weXRob24ve3B5
dGhvbjMtY2xpY2tfOC4xLjguYmIgPT4gcHl0aG9uMy1jbGlja184LjIuMS5iYn0gICB8IDIgKy0K
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1l
dGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtY2xpY2tfOC4xLjguYmIgPT4gcHl0
aG9uMy1jbGlja184LjIuMS5iYn0gKDkwJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvcHl0aG9uL3B5dGhvbjMtY2xpY2tfOC4xLjguYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcHl0aG9uL3B5dGhvbjMtY2xpY2tfOC4yLjEuYmIKc2ltaWxhcml0eSBpbmRleCA5MCUKcmVu
YW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWNsaWNrXzguMS44
LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtY2xpY2tf
OC4yLjEuYmIKaW5kZXggN2JlM2Q3MzU0Ni4uMDViZTk2MzMwOSAxMDA2NDQKLS0tIGEvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWNsaWNrXzguMS44LmJiCisrKyBiL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1jbGlja184LjIuMS5iYgpAQCAtOCw3ICs4
LDcgQEAgSE9NRVBBR0UgPSAiaHR0cDovL2NsaWNrLnBvY29vLm9yZy8iCiBMSUNFTlNFID0gIkJT
RC0zLUNsYXVzZSIKIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0UudHh0O21kNT0x
ZmE5ODIzMmZkNjQ1NjA4OTM3YTBmZGM4MmU5OTliOCIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0g
ImVkNTNjOWQ4OTkwZDgzYzJhMjdkZWFlNjhlNGVlMzM3NDczZjYzMzBjMDQwYTMxZDQyMjVjOTU3
NGQxNjA5NmEiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiMjdjNDkxY2MwNWQ5NjhkMjcxZDVhMWRi
MTNlM2I1YTE4NDYzNmQ5ZDkzMGYxNDhjNTBiMDM4ZjBkMDY0NjIwMiIKIAogaW5oZXJpdCBweXBp
IHB5dGhvbl9mbGl0X2NvcmUgcHRlc3QtcHl0aG9uLXB5dGVzdAogCi0tIAoyLjQ3LjEKCg==

--===============1419238431521978984==--

