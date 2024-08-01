Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19B09C52D74
	for <webhook@archiver.kernel.org>; Thu,  1 Aug 2024 18:27:10 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web11.75497.1722536828104115023
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Aug 2024 11:27:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=SuPFYvPT;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=gJC4A0mE;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 010101910f321a4b-f3c15da0-f453-42fe-aba7-ebb50fe07a31-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1722536827;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=f56Xt4SCgdPaEuyjWxdba8H4FkBsXnf989DjUAxAm10=;
	b=SuPFYvPTil/zvADhw4TSTW3F7mk2xMf45F0wqUBMsof7sWruSbaaLf3bx4b3Y55h
	2MUE4WQKVphS0xQL9ct1amPc1IwAkSr//q8d+Q68nSXTvf3Ynd74HYPCUUeODu+Y+4S
	p5rfmdM2d/pLHJLDoaaeU/XQkm9eBggec5BjVBMw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1722536827;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=f56Xt4SCgdPaEuyjWxdba8H4FkBsXnf989DjUAxAm10=;
	b=gJC4A0mEk6RHyY/PdTFsvpaOuOqT6zDNAw7Dlvj6Qu3E+YYukBRw3iHXUQ4Um0ZV
	COkB4oC42K5vwlbqGww/VfmckRaN64mbFFjnBjZUltJ1WQmwvFGqmY07ZU1WheIHNJY
	0ZpmlU010s/dTz59XAYfL6cL9Wtf/ZDUTrp2hkV8=
Content-Type: multipart/mixed; boundary="===============3078520332993113581=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-pytest-subtests: upgrading to 0.13.1 SUCCEEDED
Message-ID: <010101910f321a4b-f3c15da0-f453-42fe-aba7-ebb50fe07a31-000000@us-west-2.amazonses.com>
Date: Thu, 1 Aug 2024 18:27:07 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.08.01-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Aug 2024 18:27:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202810

--===============3078520332993113581==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-pytest-subtests* to *0.13.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-pytest-subtests-upgrade-0.13.0-0.13.1.patch
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
From 03984883abe260d9723cca0b7451d564165de4e6 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 1 Aug 2024 10:55:25 +0000
Subject: [PATCH] python3-pytest-subtests: upgrade 0.13.0 -> 0.13.1

---
 ...est-subtests_0.13.0.bb => python3-pytest-subtests_0.13.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pytest-subtests_0.13.0.bb => python3-pytest-subtests_0.13.1.bb} (87%)

diff --git a/meta/recipes-devtools/python/python3-pytest-subtests_0.13.0.bb b/meta/recipes-devtools/python/python3-pytest-subtests_0.13.1.bb
similarity index 87%
rename from meta/recipes-devtools/python/python3-pytest-subtests_0.13.0.bb
rename to meta/recipes-devtools/python/python3-pytest-subtests_0.13.1.bb
index 7fe074425f..9163f9d3fd 100644
--- a/meta/recipes-devtools/python/python3-pytest-subtests_0.13.0.bb
+++ b/meta/recipes-devtools/python/python3-pytest-subtests_0.13.1.bb
@@ -7,7 +7,7 @@ BUGTRACKER = "https://github.com/pytest-dev/pytest-subtests/issues"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=242b4e17fa287dcf7aef372f6bc3dcb1"
 
-SRC_URI[sha256sum] = "9e02b9d243c0379b02abf3e0887da122bcb2714b021c3608a37f17ce210adce5"
+SRC_URI[sha256sum] = "989e38f0f1c01bc7c6b2e04db7d9fd859db35d77c2c1a430c831a70cbf3fde2d"
 
 PYPI_PACKAGE = "pytest_subtests"
 
-- 
2.44.0


--===============3078520332993113581==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-pytest-subtests-upgrade-0.13.0-0.13.1.patch"

RnJvbSAwMzk4NDg4M2FiZTI2MGQ5NzIzY2NhMGI3NDUxZDU2NDE2NWRlNGU2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBBdWcgMjAyNCAxMDo1NToyNSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtcHl0ZXN0LXN1YnRlc3RzOiB1cGdyYWRlIDAuMTMuMCAtPiAwLjEzLjEKCi0tLQogLi4u
ZXN0LXN1YnRlc3RzXzAuMTMuMC5iYiA9PiBweXRob24zLXB5dGVzdC1zdWJ0ZXN0c18wLjEzLjEu
YmJ9IHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0p
CiByZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1weXRlc3Qtc3Vi
dGVzdHNfMC4xMy4wLmJiID0+IHB5dGhvbjMtcHl0ZXN0LXN1YnRlc3RzXzAuMTMuMS5iYn0gKDg3
JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcHl0
ZXN0LXN1YnRlc3RzXzAuMTMuMC5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0
aG9uMy1weXRlc3Qtc3VidGVzdHNfMC4xMy4xLmJiCnNpbWlsYXJpdHkgaW5kZXggODclCnJlbmFt
ZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1weXRlc3Qtc3VidGVz
dHNfMC4xMy4wLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhv
bjMtcHl0ZXN0LXN1YnRlc3RzXzAuMTMuMS5iYgppbmRleCA3ZmUwNzQ0MjVmLi45MTYzZjlkM2Zk
IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcHl0ZXN0
LXN1YnRlc3RzXzAuMTMuMC5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5
dGhvbjMtcHl0ZXN0LXN1YnRlc3RzXzAuMTMuMS5iYgpAQCAtNyw3ICs3LDcgQEAgQlVHVFJBQ0tF
UiA9ICJodHRwczovL2dpdGh1Yi5jb20vcHl0ZXN0LWRldi9weXRlc3Qtc3VidGVzdHMvaXNzdWVz
IgogTElDRU5TRSA9ICJNSVQiCiBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFO21k
NT0yNDJiNGUxN2ZhMjg3ZGNmN2FlZjM3MmY2YmMzZGNiMSIKIAotU1JDX1VSSVtzaGEyNTZzdW1d
ID0gIjllMDJiOWQyNDNjMDM3OWIwMmFiZjNlMDg4N2RhMTIyYmNiMjcxNGIwMjFjMzYwOGEzN2Yx
N2NlMjEwYWRjZTUiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiOTg5ZTM4ZjBmMWMwMWJjN2M2YjJl
MDRkYjdkOWZkODU5ZGIzNWQ3N2MyYzFhNDMwYzgzMWE3MGNiZjNmZGUyZCIKIAogUFlQSV9QQUNL
QUdFID0gInB5dGVzdF9zdWJ0ZXN0cyIKIAotLSAKMi40NC4wCgo=

--===============3078520332993113581==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/python3-pytest-subtests (sysroot):
  /usr/lib/python3.12/site-packages/pytest_subtests-0.13.0.dist-info moved to /usr/lib/python3.12/site-packages/pytest_subtests-0.13.1.dist-info

--===============3078520332993113581==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-pytest-subtests: PKGV changed from 0.13.0 [default] to 0.13.1 [default]
packages/core2-64-poky-linux/python3-pytest-subtests: SRC_URI changed from "https://files.pythonhosted.org/packages/source/p/pytest_subtests/pytest_subtests-0.13.0.tar.gz;downloadfilename=pytest_subtests-0.13.0.tar.gz" to "https://files.pythonhosted.org/packages/source/p/pytest_subtests/pytest_subtests-0.13.1.tar.gz;downloadfilename=pytest_subtests-0.13.1.tar.gz"
packages/core2-64-poky-linux/python3-pytest-subtests: PV changed from "0.13.0" to "0.13.1"
packages/core2-64-poky-linux/python3-pytest-subtests/python3-pytest-subtests-dbg: PKGV changed from 0.13.0 [default] to 0.13.1 [default]
packages/core2-64-poky-linux/python3-pytest-subtests/python3-pytest-subtests-dbg: PV changed from "0.13.0" to "0.13.1"
packages/core2-64-poky-linux/python3-pytest-subtests/python3-pytest-subtests-dev: PKGV changed from 0.13.0 [default] to 0.13.1 [default]
packages/core2-64-poky-linux/python3-pytest-subtests/python3-pytest-subtests-dev: PV changed from "0.13.0" to "0.13.1"
packages/core2-64-poky-linux/python3-pytest-subtests/python3-pytest-subtests-doc: PKGV changed from 0.13.0 [default] to 0.13.1 [default]
packages/core2-64-poky-linux/python3-pytest-subtests/python3-pytest-subtests-doc: PV changed from "0.13.0" to "0.13.1"
packages/core2-64-poky-linux/python3-pytest-subtests/python3-pytest-subtests-locale: PKGV changed from 0.13.0 [default] to 0.13.1 [default]
packages/core2-64-poky-linux/python3-pytest-subtests/python3-pytest-subtests-locale: PV changed from "0.13.0" to "0.13.1"
packages/core2-64-poky-linux/python3-pytest-subtests/python3-pytest-subtests-src: PKGV changed from 0.13.0 [default] to 0.13.1 [default]
packages/core2-64-poky-linux/python3-pytest-subtests/python3-pytest-subtests-src: PV changed from "0.13.0" to "0.13.1"
packages/core2-64-poky-linux/python3-pytest-subtests/python3-pytest-subtests-staticdev: PKGV changed from 0.13.0 [default] to 0.13.1 [default]
packages/core2-64-poky-linux/python3-pytest-subtests/python3-pytest-subtests-staticdev: PV changed from "0.13.0" to "0.13.1"
packages/core2-64-poky-linux/python3-pytest-subtests/python3-pytest-subtests: PKGV changed from 0.13.0 [default] to 0.13.1 [default]
packages/core2-64-poky-linux/python3-pytest-subtests/python3-pytest-subtests: PKGSIZE changed from 42134 to 42085 (-0%)
packages/core2-64-poky-linux/python3-pytest-subtests/python3-pytest-subtests: PV changed from "0.13.0" to "0.13.1"
Changes to packages/core2-64-poky-linux/python3-pytest-subtests (sysroot):
  /usr/lib/python3.12/site-packages/pytest_subtests-0.13.0.dist-info moved to /usr/lib/python3.12/site-packages/pytest_subtests-0.13.1.dist-info

--===============3078520332993113581==--

