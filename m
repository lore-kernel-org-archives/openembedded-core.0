Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49B11CD98CF
	for <webhook@archiver.kernel.org>; Thu, 11 Jun 2026 16:31:48 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.50420.1781195502294183022
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Jun 2026 09:31:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=q3v2+nY8;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=R7lzlc82;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101019eb786856c-1aba3178-68b5-479f-a2da-8229a4376fc3-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1781195507;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=sT5qb72Rz2CFsvUkvzhgrxMozEv5xAjnxnjoFxRpinU=;
	b=q3v2+nY8Iv+7MW5nu+0q6NDXx0TbIHY6KlWt4VeS5VPtlhqkvc8SkBXGH2qXREn5
	zRrh5JZnqRmGObPsbIZkPLsI2exUeJnAGzdCeObB8WHpWX8iAUmQKdF7GuiHJtTvnL5
	N0/5TdUglUX3T42FnXN0jZr9pAgiuY89BnTLxss0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1781195507;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=sT5qb72Rz2CFsvUkvzhgrxMozEv5xAjnxnjoFxRpinU=;
	b=R7lzlc82K+WJ1BH29V82BvsppkSTD2tf3ThecJyWM2prHjYFW4tENP4gM2004DZh
	7tmW2qTSY1wfxpEilLdwz+T/6lsGH1h5nsGJYmD5SLoZ+rHt1VIKqA9W2VXPm/YSQSX
	JuG3wCZql3vIgTtYPo/p8Vb4aUlDJJTW2z/Cm0FA=
Content-Type: multipart/mixed; boundary="===============6090591901112312930=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Benjamin Robin <benjamin.robin@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-shacl2code: upgrading to 1.1.0 SUCCEEDED
Message-ID: <0101019eb786856c-1aba3178-68b5-479f-a2da-8229a4376fc3-000000@us-west-2.amazonses.com>
Date: Thu, 11 Jun 2026 16:31:47 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.06.11-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Jun 2026 16:31:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238503

--===============6090591901112312930==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-shacl2code* to *1.1.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-shacl2code-upgrade-1.0.1-1.1.0.patch
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
From b6eabc7778bed6075482e772eccb2e32bc2a0296 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 11 Jun 2026 10:10:01 +0000
Subject: [PATCH] python3-shacl2code: upgrade 1.0.1 -> 1.1.0

---
 ...{python3-shacl2code_1.0.1.bb => python3-shacl2code_1.1.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-shacl2code_1.0.1.bb => python3-shacl2code_1.1.0.bb} (81%)

diff --git a/meta/recipes-devtools/python/python3-shacl2code_1.0.1.bb b/meta/recipes-devtools/python/python3-shacl2code_1.1.0.bb
similarity index 81%
rename from meta/recipes-devtools/python/python3-shacl2code_1.0.1.bb
rename to meta/recipes-devtools/python/python3-shacl2code_1.1.0.bb
index 904940926f..a9c8bec84f 100644
--- a/meta/recipes-devtools/python/python3-shacl2code_1.0.1.bb
+++ b/meta/recipes-devtools/python/python3-shacl2code_1.1.0.bb
@@ -5,7 +5,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=0582f358628f299f29c23bf5fb2f73c9"
 
 PYPI_PACKAGE = "shacl2code"
-SRC_URI[sha256sum] = "c856822b40c330452b8b31e94a658ad4595a5ef03cdb75ea432ea9c73d0cf7d9"
+SRC_URI[sha256sum] = "0f3a243c6482a0f95c5a793288d304908506b51b82dc6133de22be477cd75c24"
 
 inherit pypi python_hatchling
 
-- 
2.47.1


--===============6090591901112312930==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-shacl2code: SRC_URI changed from "https://files.pythonhosted.org/packages/source/s/shacl2code/shacl2code-1.0.1.tar.gz;downloadfilename=shacl2code-1.0.1.tar.gz" to "https://files.pythonhosted.org/packages/source/s/shacl2code/shacl2code-1.1.0.tar.gz;downloadfilename=shacl2code-1.1.0.tar.gz"
packages/x86-64-v3-poky-linux/python3-shacl2code: PV changed from "1.0.1" to "1.1.0"
packages/x86-64-v3-poky-linux/python3-shacl2code: PKGV changed from 1.0.1 [default] to 1.1.0 [default]
packages/x86-64-v3-poky-linux/python3-shacl2code/python3-shacl2code-dbg: PKGV changed from 1.0.1 [default] to 1.1.0 [default]
packages/x86-64-v3-poky-linux/python3-shacl2code/python3-shacl2code-dbg: PV changed from "1.0.1" to "1.1.0"
packages/x86-64-v3-poky-linux/python3-shacl2code/python3-shacl2code-dev: PKGV changed from 1.0.1 [default] to 1.1.0 [default]
packages/x86-64-v3-poky-linux/python3-shacl2code/python3-shacl2code-dev: PV changed from "1.0.1" to "1.1.0"
packages/x86-64-v3-poky-linux/python3-shacl2code/python3-shacl2code-doc: PKGV changed from 1.0.1 [default] to 1.1.0 [default]
packages/x86-64-v3-poky-linux/python3-shacl2code/python3-shacl2code-doc: PV changed from "1.0.1" to "1.1.0"
packages/x86-64-v3-poky-linux/python3-shacl2code/python3-shacl2code-locale: PKGV changed from 1.0.1 [default] to 1.1.0 [default]
packages/x86-64-v3-poky-linux/python3-shacl2code/python3-shacl2code-locale: PV changed from "1.0.1" to "1.1.0"
packages/x86-64-v3-poky-linux/python3-shacl2code/python3-shacl2code-src: PKGV changed from 1.0.1 [default] to 1.1.0 [default]
packages/x86-64-v3-poky-linux/python3-shacl2code/python3-shacl2code-src: PV changed from "1.0.1" to "1.1.0"
packages/x86-64-v3-poky-linux/python3-shacl2code/python3-shacl2code-staticdev: PKGV changed from 1.0.1 [default] to 1.1.0 [default]
packages/x86-64-v3-poky-linux/python3-shacl2code/python3-shacl2code-staticdev: PV changed from "1.0.1" to "1.1.0"
packages/x86-64-v3-poky-linux/python3-shacl2code/python3-shacl2code: PKGSIZE changed from 1607336 to 1610517 (+0%)
packages/x86-64-v3-poky-linux/python3-shacl2code/python3-shacl2code: FILELIST: directory renamed /usr/lib/python3.14/site-packages/shacl2code-1.0.1.dist-info/licenses -> /usr/lib/python3.14/site-packages/shacl2code-1.1.0.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/shacl2code-1.0.1.dist-info -> /usr/lib/python3.14/site-packages/shacl2code-1.1.0.dist-info
packages/x86-64-v3-poky-linux/python3-shacl2code/python3-shacl2code: PKGV changed from 1.0.1 [default] to 1.1.0 [default]
packages/x86-64-v3-poky-linux/python3-shacl2code/python3-shacl2code: PV changed from "1.0.1" to "1.1.0"
Changes to packages/x86-64-v3-poky-linux/python3-shacl2code (sysroot):
  /usr/lib/python3.14/site-packages/shacl2code-1.0.1.dist-info moved to /usr/lib/python3.14/site-packages/shacl2code-1.1.0.dist-info

--===============6090591901112312930==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-shacl2code-upgrade-1.0.1-1.1.0.patch"

RnJvbSBiNmVhYmM3Nzc4YmVkNjA3NTQ4MmU3NzJlY2NiMmUzMmJjMmEwMjk2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTEgSnVuIDIwMjYgMTA6MTA6MDEgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXNoYWNsMmNvZGU6IHVwZ3JhZGUgMS4wLjEgLT4gMS4xLjAKCi0tLQogLi4ue3B5dGhv
bjMtc2hhY2wyY29kZV8xLjAuMS5iYiA9PiBweXRob24zLXNoYWNsMmNvZGVfMS4xLjAuYmJ9IHwg
MiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5h
bWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1zaGFjbDJjb2RlXzEuMC4x
LmJiID0+IHB5dGhvbjMtc2hhY2wyY29kZV8xLjEuMC5iYn0gKDgxJSkKCmRpZmYgLS1naXQgYS9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtc2hhY2wyY29kZV8xLjAuMS5iYiBi
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1zaGFjbDJjb2RlXzEuMS4wLmJi
CnNpbWlsYXJpdHkgaW5kZXggODElCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9w
eXRob24vcHl0aG9uMy1zaGFjbDJjb2RlXzEuMC4xLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtc2hhY2wyY29kZV8xLjEuMC5iYgppbmRleCA5MDQ5NDA5
MjZmLi5hOWM4YmVjODRmIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9u
L3B5dGhvbjMtc2hhY2wyY29kZV8xLjAuMS5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
cHl0aG9uL3B5dGhvbjMtc2hhY2wyY29kZV8xLjEuMC5iYgpAQCAtNSw3ICs1LDcgQEAgTElDRU5T
RSA9ICJNSVQiCiBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFO21kNT0wNTgyZjM1
ODYyOGYyOTlmMjljMjNiZjVmYjJmNzNjOSIKIAogUFlQSV9QQUNLQUdFID0gInNoYWNsMmNvZGUi
Ci1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiYzg1NjgyMmI0MGMzMzA0NTJiOGIzMWU5NGE2NThhZDQ1
OTVhNWVmMDNjZGI3NWVhNDMyZWE5YzczZDBjZjdkOSIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICIw
ZjNhMjQzYzY0ODJhMGY5NWM1YTc5MzI4OGQzMDQ5MDg1MDZiNTFiODJkYzYxMzNkZTIyYmU0Nzdj
ZDc1YzI0IgogCiBpbmhlcml0IHB5cGkgcHl0aG9uX2hhdGNobGluZwogCi0tIAoyLjQ3LjEKCg==

--===============6090591901112312930==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-shacl2code/python3-shacl2code: FILELIST: directory renamed /usr/lib/python3.14/site-packages/shacl2code-1.0.1.dist-info -> /usr/lib/python3.14/site-packages/shacl2code-1.1.0.dist-info, directory renamed /usr/lib/python3.14/site-packages/shacl2code-1.0.1.dist-info/licenses -> /usr/lib/python3.14/site-packages/shacl2code-1.1.0.dist-info/licenses
Changes to packages/x86-64-v3-poky-linux/python3-shacl2code (sysroot):
  /usr/lib/python3.14/site-packages/shacl2code-1.0.1.dist-info moved to /usr/lib/python3.14/site-packages/shacl2code-1.1.0.dist-info

--===============6090591901112312930==--

