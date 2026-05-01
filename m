Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37125CD3447
	for <webhook@archiver.kernel.org>; Fri,  1 May 2026 14:25:41 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15606.1777645529533463501
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 May 2026 07:25:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=Z3fHabN/;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=gWIFN3we;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101019de3ee52dd-59fbd8da-74e9-4154-ae0b-1607691a4297-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1777645540;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=7GU3L3e0hTiri5UW5tgRRfBqSGmjo1L4P1aRunUBZYM=;
	b=Z3fHabN/kDu+hO+qtsF40wmZeoFZqkFxM51NdKq4NFNm3sppaTfp0+JZdc4hO7my
	JR44MMKOtdzu349B13A966Iwrkg0Lhl9MmDbH84hbZp1tYdtJSy+b2FM1AspEHsZBXz
	Vn0nQLRhtly8pBqr3brJlPhu5qJmatqQSnNQiFcM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1777645540;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=7GU3L3e0hTiri5UW5tgRRfBqSGmjo1L4P1aRunUBZYM=;
	b=gWIFN3weLIroD1WqfiNY/4yGGWp46ZZTxleSAIHNRUr/GGJRY2zLbO/bAUoU5skX
	witHx6xER1upcm0zHHjkE4gZLGYl2U60TszfQugD/8zSBO1TvfHiRcS77bCnVsw5R8M
	Rtu6CsI1cATKeKgnsKNEPjov1RVEsN3yC7/4eEEk=
Content-Type: multipart/mixed; boundary="===============4888303236221835914=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-mako: upgrading to 1.3.12 SUCCEEDED
Message-ID: <0101019de3ee52dd-59fbd8da-74e9-4154-ae0b-1607691a4297-000000@us-west-2.amazonses.com>
Date: Fri, 1 May 2026 14:25:40 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.05.01-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 May 2026 14:25:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236237

--===============4888303236221835914==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-mako* to *1.3.12* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-mako-upgrade-1.3.10-1.3.12.patch
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
From f05c14445b1aa82e95af76c0941904c235904c91 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 1 May 2026 08:32:34 +0000
Subject: [PATCH] python3-mako: upgrade 1.3.10 -> 1.3.12

---
 .../python/{python3-mako_1.3.10.bb => python3-mako_1.3.12.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-mako_1.3.10.bb => python3-mako_1.3.12.bb} (88%)

diff --git a/meta/recipes-devtools/python/python3-mako_1.3.10.bb b/meta/recipes-devtools/python/python3-mako_1.3.12.bb
similarity index 88%
rename from meta/recipes-devtools/python/python3-mako_1.3.10.bb
rename to meta/recipes-devtools/python/python3-mako_1.3.12.bb
index 2d937dc184..b2c1a8dad8 100644
--- a/meta/recipes-devtools/python/python3-mako_1.3.10.bb
+++ b/meta/recipes-devtools/python/python3-mako_1.3.12.bb
@@ -8,7 +8,7 @@ PYPI_PACKAGE = "mako"
 
 inherit pypi python_setuptools_build_meta ptest-python-pytest
 
-SRC_URI[sha256sum] = "99579a6f39583fa7e5630a28c3c1f440e4e97a414b80372649c0ce338da2ea28"
+SRC_URI[sha256sum] = "9f778e93289bd410bb35daadeb4fc66d95a746f0b75777b942088b7fd7af550a"
 
 RDEPENDS:${PN} = "python3-html \
                   python3-markupsafe \
-- 
2.47.1


--===============4888303236221835914==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-mako/python3-mako: FILELIST: directory renamed /usr/lib/python3.14/site-packages/mako-1.3.10.dist-info -> /usr/lib/python3.14/site-packages/mako-1.3.12.dist-info, directory renamed /usr/lib/python3.14/site-packages/mako-1.3.10.dist-info/licenses -> /usr/lib/python3.14/site-packages/mako-1.3.12.dist-info/licenses
Changes to packages/x86-64-v3-poky-linux/python3-mako (sysroot):
  /usr/lib/python3.14/site-packages/mako-1.3.10.dist-info moved to /usr/lib/python3.14/site-packages/mako-1.3.12.dist-info

--===============4888303236221835914==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-mako-upgrade-1.3.10-1.3.12.patch"

RnJvbSBmMDVjMTQ0NDViMWFhODJlOTVhZjc2YzA5NDE5MDRjMjM1OTA0YzkxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMSBNYXkgMjAyNiAwODozMjozNCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtbWFrbzogdXBncmFkZSAxLjMuMTAgLT4gMS4zLjEyCgotLS0KIC4uLi9weXRob24ve3B5
dGhvbjMtbWFrb18xLjMuMTAuYmIgPT4gcHl0aG9uMy1tYWtvXzEuMy4xMi5iYn0gICB8IDIgKy0K
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1l
dGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtbWFrb18xLjMuMTAuYmIgPT4gcHl0
aG9uMy1tYWtvXzEuMy4xMi5iYn0gKDg4JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvcHl0aG9uL3B5dGhvbjMtbWFrb18xLjMuMTAuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcHl0aG9uL3B5dGhvbjMtbWFrb18xLjMuMTIuYmIKc2ltaWxhcml0eSBpbmRleCA4OCUKcmVu
YW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLW1ha29fMS4zLjEw
LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtbWFrb18x
LjMuMTIuYmIKaW5kZXggMmQ5MzdkYzE4NC4uYjJjMWE4ZGFkOCAxMDA2NDQKLS0tIGEvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLW1ha29fMS4zLjEwLmJiCisrKyBiL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1tYWtvXzEuMy4xMi5iYgpAQCAtOCw3ICs4
LDcgQEAgUFlQSV9QQUNLQUdFID0gIm1ha28iCiAKIGluaGVyaXQgcHlwaSBweXRob25fc2V0dXB0
b29sc19idWlsZF9tZXRhIHB0ZXN0LXB5dGhvbi1weXRlc3QKIAotU1JDX1VSSVtzaGEyNTZzdW1d
ID0gIjk5NTc5YTZmMzk1ODNmYTdlNTYzMGEyOGMzYzFmNDQwZTRlOTdhNDE0YjgwMzcyNjQ5YzBj
ZTMzOGRhMmVhMjgiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiOWY3NzhlOTMyODliZDQxMGJiMzVk
YWFkZWI0ZmM2NmQ5NWE3NDZmMGI3NTc3N2I5NDIwODhiN2ZkN2FmNTUwYSIKIAogUkRFUEVORFM6
JHtQTn0gPSAicHl0aG9uMy1odG1sIFwKICAgICAgICAgICAgICAgICAgIHB5dGhvbjMtbWFya3Vw
c2FmZSBcCi0tIAoyLjQ3LjEKCg==

--===============4888303236221835914==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-mako: SRC_URI changed from "https://files.pythonhosted.org/packages/source/m/mako/mako-1.3.10.tar.gz;downloadfilename=mako-1.3.10.tar.gz" to "https://files.pythonhosted.org/packages/source/m/mako/mako-1.3.12.tar.gz;downloadfilename=mako-1.3.12.tar.gz"
packages/x86-64-v3-poky-linux/python3-mako: PV changed from "1.3.10" to "1.3.12"
packages/x86-64-v3-poky-linux/python3-mako: PKGV changed from 1.3.10 [default] to 1.3.12 [default]
packages/x86-64-v3-poky-linux/python3-mako/python3-mako-dbg: PV changed from "1.3.10" to "1.3.12"
packages/x86-64-v3-poky-linux/python3-mako/python3-mako-dbg: PKGV changed from 1.3.10 [default] to 1.3.12 [default]
packages/x86-64-v3-poky-linux/python3-mako/python3-mako-dev: PV changed from "1.3.10" to "1.3.12"
packages/x86-64-v3-poky-linux/python3-mako/python3-mako-dev: PKGV changed from 1.3.10 [default] to 1.3.12 [default]
packages/x86-64-v3-poky-linux/python3-mako/python3-mako-doc: PV changed from "1.3.10" to "1.3.12"
packages/x86-64-v3-poky-linux/python3-mako/python3-mako-doc: PKGV changed from 1.3.10 [default] to 1.3.12 [default]
packages/x86-64-v3-poky-linux/python3-mako/python3-mako-locale: PV changed from "1.3.10" to "1.3.12"
packages/x86-64-v3-poky-linux/python3-mako/python3-mako-locale: PKGV changed from 1.3.10 [default] to 1.3.12 [default]
packages/x86-64-v3-poky-linux/python3-mako/python3-mako-ptest: PKGSIZE changed from 352365 to 355474 (+1%)
packages/x86-64-v3-poky-linux/python3-mako/python3-mako-ptest: PV changed from "1.3.10" to "1.3.12"
packages/x86-64-v3-poky-linux/python3-mako/python3-mako-ptest: PKGV changed from 1.3.10 [default] to 1.3.12 [default]
packages/x86-64-v3-poky-linux/python3-mako/python3-mako-src: PV changed from "1.3.10" to "1.3.12"
packages/x86-64-v3-poky-linux/python3-mako/python3-mako-src: PKGV changed from 1.3.10 [default] to 1.3.12 [default]
packages/x86-64-v3-poky-linux/python3-mako/python3-mako-staticdev: PV changed from "1.3.10" to "1.3.12"
packages/x86-64-v3-poky-linux/python3-mako/python3-mako-staticdev: PKGV changed from 1.3.10 [default] to 1.3.12 [default]
packages/x86-64-v3-poky-linux/python3-mako/python3-mako: PKGSIZE changed from 648724 to 648756 (+0%)
packages/x86-64-v3-poky-linux/python3-mako/python3-mako: PV changed from "1.3.10" to "1.3.12"
packages/x86-64-v3-poky-linux/python3-mako/python3-mako: FILELIST: directory renamed /usr/lib/python3.14/site-packages/mako-1.3.10.dist-info -> /usr/lib/python3.14/site-packages/mako-1.3.12.dist-info, directory renamed /usr/lib/python3.14/site-packages/mako-1.3.10.dist-info/licenses -> /usr/lib/python3.14/site-packages/mako-1.3.12.dist-info/licenses
packages/x86-64-v3-poky-linux/python3-mako/python3-mako: PKGV changed from 1.3.10 [default] to 1.3.12 [default]
Changes to packages/x86-64-v3-poky-linux/python3-mako (sysroot):
  /usr/lib/python3.14/site-packages/mako-1.3.10.dist-info moved to /usr/lib/python3.14/site-packages/mako-1.3.12.dist-info

--===============4888303236221835914==--

