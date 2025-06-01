Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03B26C7EE2F
	for <webhook@archiver.kernel.org>; Sun,  1 Jun 2025 13:55:46 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web11.27780.1748786137465764476
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Jun 2025 06:55:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=1d3HOkN8;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=XIN2N67S;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 010101972bc6c552-a335d738-43c7-4c55-ab4d-bf1e3f791e76-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1748786136;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=OFPEUyIo3yaz2phS6J/VG1CsFOqmDDGZ6jtjJMTuWrM=;
	b=1d3HOkN8nTKNv5J7uegT5ep7CAElLTr98fICVthdizXuSBvEcxNOc1DJrNtt7ZFp
	wJ/NHuk1iX3N3Pm3rTmkVABXIw6qisnHZ6RG4tEkACYJpo9ZZo5NLVA60YDM5zWJqey
	URbugc3JuQlJgWM7SFBLpoSjhH4IOHv0IEns5SyE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1748786136;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=OFPEUyIo3yaz2phS6J/VG1CsFOqmDDGZ6jtjJMTuWrM=;
	b=XIN2N67SqViWdVNlxeLtF7cPg4rrqBOqIKarrpf136NXD/ZPY0PVOdoK1j3MJhyk
	JcJroCdmFT/69XN5+B/s2HK4W5HzNw064e5WQNfj9HDjgZPw2mUwcSTTXqGR++GH0gW
	Mmya+HA29EzygAJ9XFrS1fFofq84ekv0YFhQdeWo=
Content-Type: multipart/mixed; boundary="===============7662254933122853574=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-setuptools-rust: upgrading to 1.11.1 SUCCEEDED
Message-ID: <010101972bc6c552-a335d738-43c7-4c55-ab4d-bf1e3f791e76-000000@us-west-2.amazonses.com>
Date: Sun, 1 Jun 2025 13:55:36 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.06.01-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Jun 2025 13:55:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217609

--===============7662254933122853574==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-setuptools-rust* to *1.11.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-setuptools-rust-upgrade-1.11.0-1.11.1.patch
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
From 05b81cb8496bd108d75414b4d23a00056c961da8 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 1 Jun 2025 09:48:05 +0000
Subject: [PATCH] python3-setuptools-rust: upgrade 1.11.0 -> 1.11.1

---
 ...uptools-rust_1.11.0.bb => python3-setuptools-rust_1.11.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-setuptools-rust_1.11.0.bb => python3-setuptools-rust_1.11.1.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-setuptools-rust_1.11.0.bb b/meta/recipes-devtools/python/python3-setuptools-rust_1.11.1.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-setuptools-rust_1.11.0.bb
rename to meta/recipes-devtools/python/python3-setuptools-rust_1.11.1.bb
index fd6ebf2f61..417ded009e 100644
--- a/meta/recipes-devtools/python/python3-setuptools-rust_1.11.0.bb
+++ b/meta/recipes-devtools/python/python3-setuptools-rust_1.11.1.bb
@@ -9,7 +9,7 @@ BUGTRACKER = "https://github.com/PyO3/setuptools-rust/issues"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=011cd92e702dd9e6b1a26157b6fd53f5"
 
-SRC_URI[sha256sum] = "f765d66f3def6fdc85e1e6d889c6a812aea1430c8dadcf1c7b6779b45f874fb2"
+SRC_URI[sha256sum] = "7dabc4392252ced314b8050d63276e05fdc5d32398fc7d3cce1f6a6ac35b76c0"
 
 PYPI_PACKAGE = "setuptools_rust"
 UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
-- 
2.47.1


--===============7662254933122853574==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-setuptools-rust-upgrade-1.11.0-1.11.1.patch"

RnJvbSAwNWI4MWNiODQ5NmJkMTA4ZDc1NDE0YjRkMjNhMDAwNTZjOTYxZGE4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMSBKdW4gMjAyNSAwOTo0ODowNSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtc2V0dXB0b29scy1ydXN0OiB1cGdyYWRlIDEuMTEuMCAtPiAxLjExLjEKCi0tLQogLi4u
dXB0b29scy1ydXN0XzEuMTEuMC5iYiA9PiBweXRob24zLXNldHVwdG9vbHMtcnVzdF8xLjExLjEu
YmJ9IHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0p
CiByZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1zZXR1cHRvb2xz
LXJ1c3RfMS4xMS4wLmJiID0+IHB5dGhvbjMtc2V0dXB0b29scy1ydXN0XzEuMTEuMS5iYn0gKDkx
JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtc2V0
dXB0b29scy1ydXN0XzEuMTEuMC5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0
aG9uMy1zZXR1cHRvb2xzLXJ1c3RfMS4xMS4xLmJiCnNpbWlsYXJpdHkgaW5kZXggOTElCnJlbmFt
ZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1zZXR1cHRvb2xzLXJ1
c3RfMS4xMS4wLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhv
bjMtc2V0dXB0b29scy1ydXN0XzEuMTEuMS5iYgppbmRleCBmZDZlYmYyZjYxLi40MTdkZWQwMDll
IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtc2V0dXB0
b29scy1ydXN0XzEuMTEuMC5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5
dGhvbjMtc2V0dXB0b29scy1ydXN0XzEuMTEuMS5iYgpAQCAtOSw3ICs5LDcgQEAgQlVHVFJBQ0tF
UiA9ICJodHRwczovL2dpdGh1Yi5jb20vUHlPMy9zZXR1cHRvb2xzLXJ1c3QvaXNzdWVzIgogTElD
RU5TRSA9ICJNSVQiCiBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFO21kNT0wMTFj
ZDkyZTcwMmRkOWU2YjFhMjYxNTdiNmZkNTNmNSIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gImY3
NjVkNjZmM2RlZjZmZGM4NWUxZTZkODg5YzZhODEyYWVhMTQzMGM4ZGFkY2YxYzdiNjc3OWI0NWY4
NzRmYjIiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiN2RhYmM0MzkyMjUyY2VkMzE0YjgwNTBkNjMy
NzZlMDVmZGM1ZDMyMzk4ZmM3ZDNjY2UxZjZhNmFjMzViNzZjMCIKIAogUFlQSV9QQUNLQUdFID0g
InNldHVwdG9vbHNfcnVzdCIKIFVQU1RSRUFNX0NIRUNLX1BZUElfUEFDS0FHRSA9ICIke1BZUElf
UEFDS0FHRX0iCi0tIAoyLjQ3LjEKCg==

--===============7662254933122853574==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-setuptools-rust: PV changed from "1.11.0" to "1.11.1"
packages/core2-64-poky-linux/python3-setuptools-rust: SRC_URI changed from "https://files.pythonhosted.org/packages/source/s/setuptools_rust/setuptools_rust-1.11.0.tar.gz;downloadfilename=setuptools_rust-1.11.0.tar.gz" to "https://files.pythonhosted.org/packages/source/s/setuptools_rust/setuptools_rust-1.11.1.tar.gz;downloadfilename=setuptools_rust-1.11.1.tar.gz"
packages/core2-64-poky-linux/python3-setuptools-rust: PKGV changed from 1.11.0 [default] to 1.11.1 [default]
packages/core2-64-poky-linux/python3-setuptools-rust/python3-setuptools-rust-dbg: PV changed from "1.11.0" to "1.11.1"
packages/core2-64-poky-linux/python3-setuptools-rust/python3-setuptools-rust-dbg: PKGV changed from 1.11.0 [default] to 1.11.1 [default]
packages/core2-64-poky-linux/python3-setuptools-rust/python3-setuptools-rust-dev: PV changed from "1.11.0" to "1.11.1"
packages/core2-64-poky-linux/python3-setuptools-rust/python3-setuptools-rust-dev: PKGV changed from 1.11.0 [default] to 1.11.1 [default]
packages/core2-64-poky-linux/python3-setuptools-rust/python3-setuptools-rust-doc: PV changed from "1.11.0" to "1.11.1"
packages/core2-64-poky-linux/python3-setuptools-rust/python3-setuptools-rust-doc: PKGV changed from 1.11.0 [default] to 1.11.1 [default]
packages/core2-64-poky-linux/python3-setuptools-rust/python3-setuptools-rust-locale: PV changed from "1.11.0" to "1.11.1"
packages/core2-64-poky-linux/python3-setuptools-rust/python3-setuptools-rust-locale: PKGV changed from 1.11.0 [default] to 1.11.1 [default]
packages/core2-64-poky-linux/python3-setuptools-rust/python3-setuptools-rust-src: PV changed from "1.11.0" to "1.11.1"
packages/core2-64-poky-linux/python3-setuptools-rust/python3-setuptools-rust-src: PKGV changed from 1.11.0 [default] to 1.11.1 [default]
packages/core2-64-poky-linux/python3-setuptools-rust/python3-setuptools-rust-staticdev: PV changed from "1.11.0" to "1.11.1"
packages/core2-64-poky-linux/python3-setuptools-rust/python3-setuptools-rust-staticdev: PKGV changed from 1.11.0 [default] to 1.11.1 [default]
packages/core2-64-poky-linux/python3-setuptools-rust/python3-setuptools-rust: PV changed from "1.11.0" to "1.11.1"
packages/core2-64-poky-linux/python3-setuptools-rust/python3-setuptools-rust: PKGV changed from 1.11.0 [default] to 1.11.1 [default]
packages/core2-64-poky-linux/python3-setuptools-rust/python3-setuptools-rust: PKGSIZE changed from 165313 to 166806 (+1%)
Changes to packages/core2-64-poky-linux/python3-setuptools-rust (sysroot):
  /usr/lib/python3.13/site-packages/setuptools_rust-1.11.0.dist-info moved to /usr/lib/python3.13/site-packages/setuptools_rust-1.11.1.dist-info

--===============7662254933122853574==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/python3-setuptools-rust (sysroot):
  /usr/lib/python3.13/site-packages/setuptools_rust-1.11.0.dist-info moved to /usr/lib/python3.13/site-packages/setuptools_rust-1.11.1.dist-info

--===============7662254933122853574==--

