Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4BA6C021B2
	for <webhook@archiver.kernel.org>; Sat,  1 Feb 2025 13:21:01 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web10.42710.1738416041887559687
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Feb 2025 05:20:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=NVYsndLs;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=pH1ViNFu;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 01010194c1abd551-6617045c-7c13-494a-8671-46b00cb0042c-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1738416052;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Os1GaoNRDsb+jyCNWqw6w6VohYL9corxYje7GiAwQck=;
	b=NVYsndLs30N30ipa9zXZ9+R2maOp/9OIMtkD2XiDbtEcLM+QxrJTgNb98MwLwwXo
	xV9/xPWj8MS0Swav1Z65whZQE2asbk8QbWnepxc23GZ0Hp60Hif2th/ePhE4qIZYuvr
	Pc4TXYe+zW8x0LQXeCidFHyvfjpHfUQ8Yvs/Y2O4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1738416052;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Os1GaoNRDsb+jyCNWqw6w6VohYL9corxYje7GiAwQck=;
	b=pH1ViNFuIQbIIUaWiFrqzxdoDSHaOB6M+me9deHw/MRkNRIkeD1mkPdAahqlxDKY
	NlTyGk8jCUUywtCPN3P352yv2kTeKzR8c4qVIZzQyI9YxYDlBUItX48OLuD5DHgx/xV
	eGa5g0v//uC+2rp1Ud3qoIAq1NRqkA604QrBZwZc=
Content-Type: multipart/mixed; boundary="===============4776605944768242679=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-more-itertools: upgrading to 10.6.0 SUCCEEDED
Message-ID: <01010194c1abd551-6617045c-7c13-494a-8671-46b00cb0042c-000000@us-west-2.amazonses.com>
Date: Sat, 1 Feb 2025 13:20:51 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.02.01-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Feb 2025 13:21:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210536

--===============4776605944768242679==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-more-itertools* to *10.6.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-more-itertools-upgrade-10.5.0-10.6.0.patch
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
From e1c08e4780edb2b692021024cf241d93cf9a5c22 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 1 Feb 2025 08:12:05 +0000
Subject: [PATCH] python3-more-itertools: upgrade 10.5.0 -> 10.6.0

---
 ...ore-itertools_10.5.0.bb => python3-more-itertools_10.6.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-more-itertools_10.5.0.bb => python3-more-itertools_10.6.0.bb} (82%)

diff --git a/meta/recipes-devtools/python/python3-more-itertools_10.5.0.bb b/meta/recipes-devtools/python/python3-more-itertools_10.6.0.bb
similarity index 82%
rename from meta/recipes-devtools/python/python3-more-itertools_10.5.0.bb
rename to meta/recipes-devtools/python/python3-more-itertools_10.6.0.bb
index eda9bf1004..5447a7af8e 100644
--- a/meta/recipes-devtools/python/python3-more-itertools_10.5.0.bb
+++ b/meta/recipes-devtools/python/python3-more-itertools_10.6.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/erikrose/more-itertools"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3396ea30f9d21389d7857719816f83b5"
 
-SRC_URI[sha256sum] = "5482bfef7849c25dc3c6dd53a6173ae4795da2a41a80faea6700d9f5846c5da6"
+SRC_URI[sha256sum] = "2cd7fad1009c31cc9fb6a035108509e6547547a7a738374f10bd49a09eb3ee3b"
 
 inherit pypi python_flit_core ptest-python-pytest
 
-- 
2.44.1


--===============4776605944768242679==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-more-itertools: SRC_URI changed from "https://files.pythonhosted.org/packages/source/m/more-itertools/more-itertools-10.5.0.tar.gz;downloadfilename=more-itertools-10.5.0.tar.gz" to "https://files.pythonhosted.org/packages/source/m/more-itertools/more-itertools-10.6.0.tar.gz;downloadfilename=more-itertools-10.6.0.tar.gz"
packages/core2-64-poky-linux/python3-more-itertools: PV changed from "10.5.0" to "10.6.0"
packages/core2-64-poky-linux/python3-more-itertools: PKGV changed from 10.5.0 [default] to 10.6.0 [default]
packages/core2-64-poky-linux/python3-more-itertools/python3-more-itertools-dbg: PV changed from "10.5.0" to "10.6.0"
packages/core2-64-poky-linux/python3-more-itertools/python3-more-itertools-dbg: PKGV changed from 10.5.0 [default] to 10.6.0 [default]
packages/core2-64-poky-linux/python3-more-itertools/python3-more-itertools-dev: PV changed from "10.5.0" to "10.6.0"
packages/core2-64-poky-linux/python3-more-itertools/python3-more-itertools-dev: PKGV changed from 10.5.0 [default] to 10.6.0 [default]
packages/core2-64-poky-linux/python3-more-itertools/python3-more-itertools-doc: PV changed from "10.5.0" to "10.6.0"
packages/core2-64-poky-linux/python3-more-itertools/python3-more-itertools-doc: PKGV changed from 10.5.0 [default] to 10.6.0 [default]
packages/core2-64-poky-linux/python3-more-itertools/python3-more-itertools-locale: PV changed from "10.5.0" to "10.6.0"
packages/core2-64-poky-linux/python3-more-itertools/python3-more-itertools-locale: PKGV changed from 10.5.0 [default] to 10.6.0 [default]
packages/core2-64-poky-linux/python3-more-itertools/python3-more-itertools-ptest: PV changed from "10.5.0" to "10.6.0"
packages/core2-64-poky-linux/python3-more-itertools/python3-more-itertools-ptest: PKGSIZE changed from 241736 to 246980 (+2%)
packages/core2-64-poky-linux/python3-more-itertools/python3-more-itertools-ptest: PKGV changed from 10.5.0 [default] to 10.6.0 [default]
packages/core2-64-poky-linux/python3-more-itertools/python3-more-itertools-src: PV changed from "10.5.0" to "10.6.0"
packages/core2-64-poky-linux/python3-more-itertools/python3-more-itertools-src: PKGV changed from 10.5.0 [default] to 10.6.0 [default]
packages/core2-64-poky-linux/python3-more-itertools/python3-more-itertools-staticdev: PV changed from "10.5.0" to "10.6.0"
packages/core2-64-poky-linux/python3-more-itertools/python3-more-itertools-staticdev: PKGV changed from 10.5.0 [default] to 10.6.0 [default]
packages/core2-64-poky-linux/python3-more-itertools/python3-more-itertools: PV changed from "10.5.0" to "10.6.0"
packages/core2-64-poky-linux/python3-more-itertools/python3-more-itertools: PKGSIZE changed from 460232 to 472003 (+3%)
packages/core2-64-poky-linux/python3-more-itertools/python3-more-itertools: PKGV changed from 10.5.0 [default] to 10.6.0 [default]
Changes to packages/core2-64-poky-linux/python3-more-itertools (sysroot):
  /usr/lib/python3.13/site-packages/more_itertools-10.5.0.dist-info moved to /usr/lib/python3.13/site-packages/more_itertools-10.6.0.dist-info

--===============4776605944768242679==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/python3-more-itertools (sysroot):
  /usr/lib/python3.13/site-packages/more_itertools-10.5.0.dist-info moved to /usr/lib/python3.13/site-packages/more_itertools-10.6.0.dist-info

--===============4776605944768242679==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-more-itertools-upgrade-10.5.0-10.6.0.patch"

RnJvbSBlMWMwOGU0NzgwZWRiMmI2OTIwMjEwMjRjZjI0MWQ5M2NmOWE1YzIyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMSBGZWIgMjAyNSAwODoxMjowNSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtbW9yZS1pdGVydG9vbHM6IHVwZ3JhZGUgMTAuNS4wIC0+IDEwLjYuMAoKLS0tCiAuLi5v
cmUtaXRlcnRvb2xzXzEwLjUuMC5iYiA9PiBweXRob24zLW1vcmUtaXRlcnRvb2xzXzEwLjYuMC5i
Yn0gfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkK
IHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLW1vcmUtaXRlcnRv
b2xzXzEwLjUuMC5iYiA9PiBweXRob24zLW1vcmUtaXRlcnRvb2xzXzEwLjYuMC5iYn0gKDgyJSkK
CmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtbW9yZS1p
dGVydG9vbHNfMTAuNS4wLmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24z
LW1vcmUtaXRlcnRvb2xzXzEwLjYuMC5iYgpzaW1pbGFyaXR5IGluZGV4IDgyJQpyZW5hbWUgZnJv
bSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtbW9yZS1pdGVydG9vbHNfMTAu
NS4wLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtbW9y
ZS1pdGVydG9vbHNfMTAuNi4wLmJiCmluZGV4IGVkYTliZjEwMDQuLjU0NDdhN2FmOGUgMTAwNjQ0
Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1tb3JlLWl0ZXJ0b29s
c18xMC41LjAuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLW1v
cmUtaXRlcnRvb2xzXzEwLjYuMC5iYgpAQCAtMyw3ICszLDcgQEAgSE9NRVBBR0UgPSAiaHR0cHM6
Ly9naXRodWIuY29tL2VyaWtyb3NlL21vcmUtaXRlcnRvb2xzIgogTElDRU5TRSA9ICJNSVQiCiBM
SUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFO21kNT0zMzk2ZWEzMGY5ZDIxMzg5ZDc4
NTc3MTk4MTZmODNiNSIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjU0ODJiZmVmNzg0OWMyNWRj
M2M2ZGQ1M2E2MTczYWU0Nzk1ZGEyYTQxYTgwZmFlYTY3MDBkOWY1ODQ2YzVkYTYiCitTUkNfVVJJ
W3NoYTI1NnN1bV0gPSAiMmNkN2ZhZDEwMDljMzFjYzlmYjZhMDM1MTA4NTA5ZTY1NDc1NDdhN2E3
MzgzNzRmMTBiZDQ5YTA5ZWIzZWUzYiIKIAogaW5oZXJpdCBweXBpIHB5dGhvbl9mbGl0X2NvcmUg
cHRlc3QtcHl0aG9uLXB5dGVzdAogCi0tIAoyLjQ0LjEKCg==

--===============4776605944768242679==--

