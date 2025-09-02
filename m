Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D820DCA1007
	for <webhook@archiver.kernel.org>; Tue,  2 Sep 2025 21:56:41 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web10.89997.1756850183475790001
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Sep 2025 14:56:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=SWQmXyXA;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=IcxN9WSs;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 010101990c6e8033-8ae51b71-8a9c-4299-a84e-a17f85cddb86-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1756850192;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=LbKm1aEBmVWuM/fiVnNE0MEEIK0novGiSpluuT/kPVY=;
	b=SWQmXyXA+0HyNRI5e5vhzh+2k7oLtbfAVxOx87az7AU7CnzqMe6QRO4qJ24+l+/8
	2F5tSX3q+rThpAfT9sq/mG8tK9yO48QOby10irABvX2Nh2zYNo8AAdzzehvNHpW436/
	h66VBNeF7X4/h+1Gpn2ONEQq+rtV26J3xp0uINI0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1756850192;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=LbKm1aEBmVWuM/fiVnNE0MEEIK0novGiSpluuT/kPVY=;
	b=IcxN9WSsTYMDiT+TU8oCLdcW4tBZCZLga1dz2IoGNHf9X/IQh3xCVQRM7H9o/1or
	WBNvPMu18B6rCl+bKgJXuRtF6FrUBfmYZj1ew/SvDFSCQSET3g5fNwAiEJmR+ySePlH
	MQnBXbM5j0J7WSumGjcInyXjKogvxAbOrn+oJN2c=
Content-Type: multipart/mixed; boundary="===============8812384632828560904=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-setuptools-rust: upgrading to 1.12.0 SUCCEEDED
Message-ID: <010101990c6e8033-8ae51b71-8a9c-4299-a84e-a17f85cddb86-000000@us-west-2.amazonses.com>
Date: Tue, 2 Sep 2025 21:56:32 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.09.02-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Sep 2025 21:56:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222785

--===============8812384632828560904==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-setuptools-rust* to *1.12.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-setuptools-rust-upgrade-1.11.1-1.12.0.patch
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
From cb62b2a90295395443bbf71086ebc746441e28bb Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 2 Sep 2025 18:39:14 +0000
Subject: [PATCH] python3-setuptools-rust: upgrade 1.11.1 -> 1.12.0

---
 ...uptools-rust_1.11.1.bb => python3-setuptools-rust_1.12.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-setuptools-rust_1.11.1.bb => python3-setuptools-rust_1.12.0.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-setuptools-rust_1.11.1.bb b/meta/recipes-devtools/python/python3-setuptools-rust_1.12.0.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-setuptools-rust_1.11.1.bb
rename to meta/recipes-devtools/python/python3-setuptools-rust_1.12.0.bb
index 417ded009e..491f512706 100644
--- a/meta/recipes-devtools/python/python3-setuptools-rust_1.11.1.bb
+++ b/meta/recipes-devtools/python/python3-setuptools-rust_1.12.0.bb
@@ -9,7 +9,7 @@ BUGTRACKER = "https://github.com/PyO3/setuptools-rust/issues"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=011cd92e702dd9e6b1a26157b6fd53f5"
 
-SRC_URI[sha256sum] = "7dabc4392252ced314b8050d63276e05fdc5d32398fc7d3cce1f6a6ac35b76c0"
+SRC_URI[sha256sum] = "d94a93f0c97751c17014565f07bdc324bee45d396cd1bba83d8e7af92b945f0c"
 
 PYPI_PACKAGE = "setuptools_rust"
 UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
-- 
2.47.1


--===============8812384632828560904==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-setuptools-rust-upgrade-1.11.1-1.12.0.patch"

RnJvbSBjYjYyYjJhOTAyOTUzOTU0NDNiYmY3MTA4NmViYzc0NjQ0MWUyOGJiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMiBTZXAgMjAyNSAxODozOToxNCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtc2V0dXB0b29scy1ydXN0OiB1cGdyYWRlIDEuMTEuMSAtPiAxLjEyLjAKCi0tLQogLi4u
dXB0b29scy1ydXN0XzEuMTEuMS5iYiA9PiBweXRob24zLXNldHVwdG9vbHMtcnVzdF8xLjEyLjAu
YmJ9IHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0p
CiByZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1zZXR1cHRvb2xz
LXJ1c3RfMS4xMS4xLmJiID0+IHB5dGhvbjMtc2V0dXB0b29scy1ydXN0XzEuMTIuMC5iYn0gKDkx
JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtc2V0
dXB0b29scy1ydXN0XzEuMTEuMS5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0
aG9uMy1zZXR1cHRvb2xzLXJ1c3RfMS4xMi4wLmJiCnNpbWlsYXJpdHkgaW5kZXggOTElCnJlbmFt
ZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1zZXR1cHRvb2xzLXJ1
c3RfMS4xMS4xLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhv
bjMtc2V0dXB0b29scy1ydXN0XzEuMTIuMC5iYgppbmRleCA0MTdkZWQwMDllLi40OTFmNTEyNzA2
IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtc2V0dXB0
b29scy1ydXN0XzEuMTEuMS5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5
dGhvbjMtc2V0dXB0b29scy1ydXN0XzEuMTIuMC5iYgpAQCAtOSw3ICs5LDcgQEAgQlVHVFJBQ0tF
UiA9ICJodHRwczovL2dpdGh1Yi5jb20vUHlPMy9zZXR1cHRvb2xzLXJ1c3QvaXNzdWVzIgogTElD
RU5TRSA9ICJNSVQiCiBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFO21kNT0wMTFj
ZDkyZTcwMmRkOWU2YjFhMjYxNTdiNmZkNTNmNSIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjdk
YWJjNDM5MjI1MmNlZDMxNGI4MDUwZDYzMjc2ZTA1ZmRjNWQzMjM5OGZjN2QzY2NlMWY2YTZhYzM1
Yjc2YzAiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiZDk0YTkzZjBjOTc3NTFjMTcwMTQ1NjVmMDdi
ZGMzMjRiZWU0NWQzOTZjZDFiYmE4M2Q4ZTdhZjkyYjk0NWYwYyIKIAogUFlQSV9QQUNLQUdFID0g
InNldHVwdG9vbHNfcnVzdCIKIFVQU1RSRUFNX0NIRUNLX1BZUElfUEFDS0FHRSA9ICIke1BZUElf
UEFDS0FHRX0iCi0tIAoyLjQ3LjEKCg==

--===============8812384632828560904==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-setuptools-rust: SRC_URI changed from "https://files.pythonhosted.org/packages/source/s/setuptools_rust/setuptools_rust-1.11.1.tar.gz;downloadfilename=setuptools_rust-1.11.1.tar.gz" to "https://files.pythonhosted.org/packages/source/s/setuptools_rust/setuptools_rust-1.12.0.tar.gz;downloadfilename=setuptools_rust-1.12.0.tar.gz"
packages/x86-64-v3-poky-linux/python3-setuptools-rust: PV changed from "1.11.1" to "1.12.0"
packages/x86-64-v3-poky-linux/python3-setuptools-rust: PKGV changed from 1.11.1 [default] to 1.12.0 [default]
packages/x86-64-v3-poky-linux/python3-setuptools-rust/python3-setuptools-rust-dbg: PV changed from "1.11.1" to "1.12.0"
packages/x86-64-v3-poky-linux/python3-setuptools-rust/python3-setuptools-rust-dbg: PKGV changed from 1.11.1 [default] to 1.12.0 [default]
packages/x86-64-v3-poky-linux/python3-setuptools-rust/python3-setuptools-rust-dev: PV changed from "1.11.1" to "1.12.0"
packages/x86-64-v3-poky-linux/python3-setuptools-rust/python3-setuptools-rust-dev: PKGV changed from 1.11.1 [default] to 1.12.0 [default]
packages/x86-64-v3-poky-linux/python3-setuptools-rust/python3-setuptools-rust-doc: PV changed from "1.11.1" to "1.12.0"
packages/x86-64-v3-poky-linux/python3-setuptools-rust/python3-setuptools-rust-doc: PKGV changed from 1.11.1 [default] to 1.12.0 [default]
packages/x86-64-v3-poky-linux/python3-setuptools-rust/python3-setuptools-rust-locale: PV changed from "1.11.1" to "1.12.0"
packages/x86-64-v3-poky-linux/python3-setuptools-rust/python3-setuptools-rust-locale: PKGV changed from 1.11.1 [default] to 1.12.0 [default]
packages/x86-64-v3-poky-linux/python3-setuptools-rust/python3-setuptools-rust-src: PV changed from "1.11.1" to "1.12.0"
packages/x86-64-v3-poky-linux/python3-setuptools-rust/python3-setuptools-rust-src: PKGV changed from 1.11.1 [default] to 1.12.0 [default]
packages/x86-64-v3-poky-linux/python3-setuptools-rust/python3-setuptools-rust-staticdev: PV changed from "1.11.1" to "1.12.0"
packages/x86-64-v3-poky-linux/python3-setuptools-rust/python3-setuptools-rust-staticdev: PKGV changed from 1.11.1 [default] to 1.12.0 [default]
packages/x86-64-v3-poky-linux/python3-setuptools-rust/python3-setuptools-rust: PKGSIZE changed from 166806 to 167142 (+0%)
packages/x86-64-v3-poky-linux/python3-setuptools-rust/python3-setuptools-rust: PV changed from "1.11.1" to "1.12.0"
packages/x86-64-v3-poky-linux/python3-setuptools-rust/python3-setuptools-rust: PKGV changed from 1.11.1 [default] to 1.12.0 [default]
Changes to packages/x86-64-v3-poky-linux/python3-setuptools-rust (sysroot):
  /usr/lib/python3.13/site-packages/setuptools_rust-1.11.1.dist-info moved to /usr/lib/python3.13/site-packages/setuptools_rust-1.12.0.dist-info

--===============8812384632828560904==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/x86-64-v3-poky-linux/python3-setuptools-rust (sysroot):
  /usr/lib/python3.13/site-packages/setuptools_rust-1.11.1.dist-info moved to /usr/lib/python3.13/site-packages/setuptools_rust-1.12.0.dist-info

--===============8812384632828560904==--

