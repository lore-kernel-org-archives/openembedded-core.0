Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7873410FCAD2
	for <webhook@archiver.kernel.org>; Wed,  1 Apr 2026 14:36:06 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14758.1775054165341412693
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Apr 2026 07:36:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=3u4s9lCC;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=y4/gnxz9;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101019d4979130f-81ac6e35-fdbf-4b45-955d-c5c9fd7e05d4-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1775054164;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=t67KC7DZGilAKCMigHblNOtH9ghB5cKvrM/+ioVGr8Y=;
	b=3u4s9lCCc+AcTqlgM2Zvd9o4hjvBp8L+Oe7QxyFkZAT0ngbZte+PRLNyIuTDcoF+
	zaKazRcfpCXOBgQqKhWL7WwUUCJA9+NM1Q01VPAOg03+MHhjJnX6nkaWZ38F5LMnjJD
	BStDSUWGycRa1deOv0IDdNfoJeuFAydzRRQEHNcY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1775054164;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=t67KC7DZGilAKCMigHblNOtH9ghB5cKvrM/+ioVGr8Y=;
	b=y4/gnxz9PGZx37rfIhq3nokG3Y8EMApWRtfG3lUIO1o++dtyw1EVsvdKsmIdtoTv
	fSmglKcuxIrBapywaJjI8orGePj/r4jfCqj0mzwv4N/HgTLs5R1QLWALQUTwtar4M7p
	Gycp76CJ8JgNlySPradXVXA0oD5J3V7cfHu+N7eM=
Content-Type: multipart/mixed; boundary="===============1494662617242566806=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-setuptools-rust: upgrading to 1.12.1 SUCCEEDED
Message-ID: <0101019d4979130f-81ac6e35-fdbf-4b45-955d-c5c9fd7e05d4-000000@us-west-2.amazonses.com>
Date: Wed, 1 Apr 2026 14:36:04 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.04.01-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Apr 2026 14:36:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234390

--===============1494662617242566806==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-setuptools-rust* to *1.12.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-setuptools-rust-upgrade-1.12.0-1.12.1.patch
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
From fdaa7a9396ead964ba1b7b6757dc68c49b3ee639 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 1 Apr 2026 10:29:38 +0000
Subject: [PATCH] python3-setuptools-rust: upgrade 1.12.0 -> 1.12.1

---
 ...uptools-rust_1.12.0.bb => python3-setuptools-rust_1.12.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-setuptools-rust_1.12.0.bb => python3-setuptools-rust_1.12.1.bb} (90%)

diff --git a/meta/recipes-devtools/python/python3-setuptools-rust_1.12.0.bb b/meta/recipes-devtools/python/python3-setuptools-rust_1.12.1.bb
similarity index 90%
rename from meta/recipes-devtools/python/python3-setuptools-rust_1.12.0.bb
rename to meta/recipes-devtools/python/python3-setuptools-rust_1.12.1.bb
index 062e97083d..a1135794ba 100644
--- a/meta/recipes-devtools/python/python3-setuptools-rust_1.12.0.bb
+++ b/meta/recipes-devtools/python/python3-setuptools-rust_1.12.1.bb
@@ -9,7 +9,7 @@ BUGTRACKER = "https://github.com/PyO3/setuptools-rust/issues"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=011cd92e702dd9e6b1a26157b6fd53f5"
 
-SRC_URI[sha256sum] = "d94a93f0c97751c17014565f07bdc324bee45d396cd1bba83d8e7af92b945f0c"
+SRC_URI[sha256sum] = "85ae70989d96c9cfeb5ef79cf3bac2d5200bc5564f720a06edceedbdf6664640"
 
 PYPI_PACKAGE = "setuptools_rust"
 
-- 
2.47.1


--===============1494662617242566806==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-setuptools-rust/python3-setuptools-rust: FILELIST: directory renamed /usr/lib/python3.14/site-packages/setuptools_rust-1.12.0.dist-info -> /usr/lib/python3.14/site-packages/setuptools_rust-1.12.1.dist-info, directory renamed /usr/lib/python3.14/site-packages/setuptools_rust-1.12.0.dist-info/licenses -> /usr/lib/python3.14/site-packages/setuptools_rust-1.12.1.dist-info/licenses
Changes to packages/x86-64-v3-poky-linux/python3-setuptools-rust (sysroot):
  /usr/lib/python3.14/site-packages/setuptools_rust-1.12.0.dist-info moved to /usr/lib/python3.14/site-packages/setuptools_rust-1.12.1.dist-info

--===============1494662617242566806==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-setuptools-rust-upgrade-1.12.0-1.12.1.patch"

RnJvbSBmZGFhN2E5Mzk2ZWFkOTY0YmExYjdiNjc1N2RjNjhjNDliM2VlNjM5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBBcHIgMjAyNiAxMDoyOTozOCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtc2V0dXB0b29scy1ydXN0OiB1cGdyYWRlIDEuMTIuMCAtPiAxLjEyLjEKCi0tLQogLi4u
dXB0b29scy1ydXN0XzEuMTIuMC5iYiA9PiBweXRob24zLXNldHVwdG9vbHMtcnVzdF8xLjEyLjEu
YmJ9IHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0p
CiByZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1zZXR1cHRvb2xz
LXJ1c3RfMS4xMi4wLmJiID0+IHB5dGhvbjMtc2V0dXB0b29scy1ydXN0XzEuMTIuMS5iYn0gKDkw
JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtc2V0
dXB0b29scy1ydXN0XzEuMTIuMC5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0
aG9uMy1zZXR1cHRvb2xzLXJ1c3RfMS4xMi4xLmJiCnNpbWlsYXJpdHkgaW5kZXggOTAlCnJlbmFt
ZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1zZXR1cHRvb2xzLXJ1
c3RfMS4xMi4wLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhv
bjMtc2V0dXB0b29scy1ydXN0XzEuMTIuMS5iYgppbmRleCAwNjJlOTcwODNkLi5hMTEzNTc5NGJh
IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtc2V0dXB0
b29scy1ydXN0XzEuMTIuMC5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5
dGhvbjMtc2V0dXB0b29scy1ydXN0XzEuMTIuMS5iYgpAQCAtOSw3ICs5LDcgQEAgQlVHVFJBQ0tF
UiA9ICJodHRwczovL2dpdGh1Yi5jb20vUHlPMy9zZXR1cHRvb2xzLXJ1c3QvaXNzdWVzIgogTElD
RU5TRSA9ICJNSVQiCiBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFO21kNT0wMTFj
ZDkyZTcwMmRkOWU2YjFhMjYxNTdiNmZkNTNmNSIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gImQ5
NGE5M2YwYzk3NzUxYzE3MDE0NTY1ZjA3YmRjMzI0YmVlNDVkMzk2Y2QxYmJhODNkOGU3YWY5MmI5
NDVmMGMiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiODVhZTcwOTg5ZDk2YzljZmViNWVmNzljZjNi
YWMyZDUyMDBiYzU1NjRmNzIwYTA2ZWRjZWVkYmRmNjY2NDY0MCIKIAogUFlQSV9QQUNLQUdFID0g
InNldHVwdG9vbHNfcnVzdCIKIAotLSAKMi40Ny4xCgo=

--===============1494662617242566806==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-setuptools-rust: SRC_URI changed from "https://files.pythonhosted.org/packages/source/s/setuptools_rust/setuptools_rust-1.12.0.tar.gz;downloadfilename=setuptools_rust-1.12.0.tar.gz" to "https://files.pythonhosted.org/packages/source/s/setuptools_rust/setuptools_rust-1.12.1.tar.gz;downloadfilename=setuptools_rust-1.12.1.tar.gz"
packages/x86-64-v3-poky-linux/python3-setuptools-rust: PKGV changed from 1.12.0 [default] to 1.12.1 [default]
packages/x86-64-v3-poky-linux/python3-setuptools-rust: PV changed from "1.12.0" to "1.12.1"
packages/x86-64-v3-poky-linux/python3-setuptools-rust/python3-setuptools-rust-dbg: PKGV changed from 1.12.0 [default] to 1.12.1 [default]
packages/x86-64-v3-poky-linux/python3-setuptools-rust/python3-setuptools-rust-dbg: PV changed from "1.12.0" to "1.12.1"
packages/x86-64-v3-poky-linux/python3-setuptools-rust/python3-setuptools-rust-dev: PKGV changed from 1.12.0 [default] to 1.12.1 [default]
packages/x86-64-v3-poky-linux/python3-setuptools-rust/python3-setuptools-rust-dev: PV changed from "1.12.0" to "1.12.1"
packages/x86-64-v3-poky-linux/python3-setuptools-rust/python3-setuptools-rust-doc: PKGV changed from 1.12.0 [default] to 1.12.1 [default]
packages/x86-64-v3-poky-linux/python3-setuptools-rust/python3-setuptools-rust-doc: PV changed from "1.12.0" to "1.12.1"
packages/x86-64-v3-poky-linux/python3-setuptools-rust/python3-setuptools-rust-locale: PKGV changed from 1.12.0 [default] to 1.12.1 [default]
packages/x86-64-v3-poky-linux/python3-setuptools-rust/python3-setuptools-rust-locale: PV changed from "1.12.0" to "1.12.1"
packages/x86-64-v3-poky-linux/python3-setuptools-rust/python3-setuptools-rust-src: PKGV changed from 1.12.0 [default] to 1.12.1 [default]
packages/x86-64-v3-poky-linux/python3-setuptools-rust/python3-setuptools-rust-src: PV changed from "1.12.0" to "1.12.1"
packages/x86-64-v3-poky-linux/python3-setuptools-rust/python3-setuptools-rust-staticdev: PKGV changed from 1.12.0 [default] to 1.12.1 [default]
packages/x86-64-v3-poky-linux/python3-setuptools-rust/python3-setuptools-rust-staticdev: PV changed from "1.12.0" to "1.12.1"
packages/x86-64-v3-poky-linux/python3-setuptools-rust/python3-setuptools-rust: FILELIST: directory renamed /usr/lib/python3.14/site-packages/setuptools_rust-1.12.0.dist-info/licenses -> /usr/lib/python3.14/site-packages/setuptools_rust-1.12.1.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/setuptools_rust-1.12.0.dist-info -> /usr/lib/python3.14/site-packages/setuptools_rust-1.12.1.dist-info
packages/x86-64-v3-poky-linux/python3-setuptools-rust/python3-setuptools-rust: PKGSIZE changed from 179827 to 186550 (+4%)
packages/x86-64-v3-poky-linux/python3-setuptools-rust/python3-setuptools-rust: PKGV changed from 1.12.0 [default] to 1.12.1 [default]
packages/x86-64-v3-poky-linux/python3-setuptools-rust/python3-setuptools-rust: PV changed from "1.12.0" to "1.12.1"
Changes to packages/x86-64-v3-poky-linux/python3-setuptools-rust (sysroot):
  /usr/lib/python3.14/site-packages/setuptools_rust-1.12.0.dist-info moved to /usr/lib/python3.14/site-packages/setuptools_rust-1.12.1.dist-info

--===============1494662617242566806==--

