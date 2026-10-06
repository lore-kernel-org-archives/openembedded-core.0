Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4B2DCA6007
	for <webhook@archiver.kernel.org>; Tue,  6 Oct 2026 06:25:06 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.39327.1791267897187285204
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Oct 2026 23:24:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=ZDW1nrab;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=1BV+XKs8;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 010101a10fe2fba4-35f3c481-dac7-4db6-8474-4446fc0e9056-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1791267896;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=uurHsI1uYkM3j3FmyeCeqlkDhAAsUqlr1muGsKpxonA=;
	b=ZDW1nrabv0AUnHMYPnPa5FqxngckSOH9sqIAYxS+TbqcZAw4IHWQwf/XpzrmtAQ7
	lWtf+iT5yIf+CY7J9MLYs4JMKARJAHb7G3pqUyWKS64AOFiFzc0yKvOBu42+nRzITmv
	WSVpR+UVYQVGUHooJRslTi9r0tOVv297uXr+WOZ0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1791267896;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=uurHsI1uYkM3j3FmyeCeqlkDhAAsUqlr1muGsKpxonA=;
	b=1BV+XKs86rx7RFcpLdEvm+QQwm9mvhnMEHpfqif/goHC8t1ac94muzFktELfJmum
	NUydXhvT86i5lV3PFkF1xr44EK1x65y5jPNWhpfkys+ChkD0a5Z4G9aW65U0iIq/sVO
	BE3nNmYZjZCsVdn5Q065DjS+BWv0V+dJWfOzIofo=
Content-Type: multipart/mixed; boundary="===============4668929753245738930=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-more-itertools: upgrading to 11.1.0 SUCCEEDED
Message-ID: <010101a10fe2fba4-35f3c481-dac7-4db6-8474-4446fc0e9056-000000@us-west-2.amazonses.com>
Date: Tue, 6 Oct 2026 06:24:56 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.10.06-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Oct 2026 06:25:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247269

--===============4668929753245738930==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-more-itertools* to *11.1.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-more-itertools-upgrade-10.8.0-11.1.0.patch
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
From 8078adab1caf4302884c5638a9bae51fa927ef77 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 6 Oct 2026 05:46:00 +0000
Subject: [PATCH] python3-more-itertools: upgrade 10.8.0 -> 11.1.0

---
 ...ore-itertools_10.8.0.bb => python3-more-itertools_11.1.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-more-itertools_10.8.0.bb => python3-more-itertools_11.1.0.bb} (82%)

diff --git a/meta/recipes-devtools/python/python3-more-itertools_10.8.0.bb b/meta/recipes-devtools/python/python3-more-itertools_11.1.0.bb
similarity index 82%
rename from meta/recipes-devtools/python/python3-more-itertools_10.8.0.bb
rename to meta/recipes-devtools/python/python3-more-itertools_11.1.0.bb
index 053197ea5c..2ea5af632a 100644
--- a/meta/recipes-devtools/python/python3-more-itertools_10.8.0.bb
+++ b/meta/recipes-devtools/python/python3-more-itertools_11.1.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/erikrose/more-itertools"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3396ea30f9d21389d7857719816f83b5"
 
-SRC_URI[sha256sum] = "f638ddf8a1a0d134181275fb5d58b086ead7c6a72429ad725c67503f13ba30bd"
+SRC_URI[sha256sum] = "48e8f4d9e7e5878571ecf6f2b4e57634f93cd474cc8cfbd2376f2d11b396e30d"
 
 inherit pypi python_flit_core ptest-python-pytest
 
-- 
2.47.1


--===============4668929753245738930==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-more-itertools/python3-more-itertools: FILELIST: directory renamed /usr/lib/python3.14/site-packages/more_itertools-10.8.0.dist-info/licenses -> /usr/lib/python3.14/site-packages/more_itertools-11.1.0.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/more_itertools-10.8.0.dist-info -> /usr/lib/python3.14/site-packages/more_itertools-11.1.0.dist-info
Changes to packages/x86-64-v3-poky-linux/python3-more-itertools (sysroot):
  /usr/lib/python3.14/site-packages/more_itertools-10.8.0.dist-info moved to /usr/lib/python3.14/site-packages/more_itertools-11.1.0.dist-info

--===============4668929753245738930==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-more-itertools: PKGV changed from 10.8.0 [default] to 11.1.0 [default]
packages/x86-64-v3-poky-linux/python3-more-itertools: SRC_URI changed from "https://files.pythonhosted.org/packages/source/m/more_itertools/more_itertools-10.8.0.tar.gz" to "https://files.pythonhosted.org/packages/source/m/more_itertools/more_itertools-11.1.0.tar.gz"
packages/x86-64-v3-poky-linux/python3-more-itertools: PV changed from "10.8.0" to "11.1.0"
packages/x86-64-v3-poky-linux/python3-more-itertools/python3-more-itertools-dbg: PKGV changed from 10.8.0 [default] to 11.1.0 [default]
packages/x86-64-v3-poky-linux/python3-more-itertools/python3-more-itertools-dbg: PV changed from "10.8.0" to "11.1.0"
packages/x86-64-v3-poky-linux/python3-more-itertools/python3-more-itertools-dev: PKGV changed from 10.8.0 [default] to 11.1.0 [default]
packages/x86-64-v3-poky-linux/python3-more-itertools/python3-more-itertools-dev: PV changed from "10.8.0" to "11.1.0"
packages/x86-64-v3-poky-linux/python3-more-itertools/python3-more-itertools-doc: PKGV changed from 10.8.0 [default] to 11.1.0 [default]
packages/x86-64-v3-poky-linux/python3-more-itertools/python3-more-itertools-doc: PV changed from "10.8.0" to "11.1.0"
packages/x86-64-v3-poky-linux/python3-more-itertools/python3-more-itertools-locale: PKGV changed from 10.8.0 [default] to 11.1.0 [default]
packages/x86-64-v3-poky-linux/python3-more-itertools/python3-more-itertools-locale: PV changed from "10.8.0" to "11.1.0"
packages/x86-64-v3-poky-linux/python3-more-itertools/python3-more-itertools-ptest: PKGV changed from 10.8.0 [default] to 11.1.0 [default]
packages/x86-64-v3-poky-linux/python3-more-itertools/python3-more-itertools-ptest: PV changed from "10.8.0" to "11.1.0"
packages/x86-64-v3-poky-linux/python3-more-itertools/python3-more-itertools-ptest: PKGSIZE changed from 271392 to 293124 (+8%)
packages/x86-64-v3-poky-linux/python3-more-itertools/python3-more-itertools-src: PKGV changed from 10.8.0 [default] to 11.1.0 [default]
packages/x86-64-v3-poky-linux/python3-more-itertools/python3-more-itertools-src: PV changed from "10.8.0" to "11.1.0"
packages/x86-64-v3-poky-linux/python3-more-itertools/python3-more-itertools-staticdev: PKGV changed from 10.8.0 [default] to 11.1.0 [default]
packages/x86-64-v3-poky-linux/python3-more-itertools/python3-more-itertools-staticdev: PV changed from "10.8.0" to "11.1.0"
packages/x86-64-v3-poky-linux/python3-more-itertools/python3-more-itertools: PKGV changed from 10.8.0 [default] to 11.1.0 [default]
packages/x86-64-v3-poky-linux/python3-more-itertools/python3-more-itertools: FILELIST: directory renamed /usr/lib/python3.14/site-packages/more_itertools-10.8.0.dist-info/licenses -> /usr/lib/python3.14/site-packages/more_itertools-11.1.0.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/more_itertools-10.8.0.dist-info -> /usr/lib/python3.14/site-packages/more_itertools-11.1.0.dist-info
packages/x86-64-v3-poky-linux/python3-more-itertools/python3-more-itertools: PV changed from "10.8.0" to "11.1.0"
packages/x86-64-v3-poky-linux/python3-more-itertools/python3-more-itertools: PKGSIZE changed from 520423 to 547927 (+5%)
Changes to packages/x86-64-v3-poky-linux/python3-more-itertools (sysroot):
  /usr/lib/python3.14/site-packages/more_itertools-10.8.0.dist-info moved to /usr/lib/python3.14/site-packages/more_itertools-11.1.0.dist-info

--===============4668929753245738930==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-more-itertools-upgrade-10.8.0-11.1.0.patch"

RnJvbSA4MDc4YWRhYjFjYWY0MzAyODg0YzU2MzhhOWJhZTUxZmE5MjdlZjc3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgNiBPY3QgMjAyNiAwNTo0NjowMCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtbW9yZS1pdGVydG9vbHM6IHVwZ3JhZGUgMTAuOC4wIC0+IDExLjEuMAoKLS0tCiAuLi5v
cmUtaXRlcnRvb2xzXzEwLjguMC5iYiA9PiBweXRob24zLW1vcmUtaXRlcnRvb2xzXzExLjEuMC5i
Yn0gfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkK
IHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLW1vcmUtaXRlcnRv
b2xzXzEwLjguMC5iYiA9PiBweXRob24zLW1vcmUtaXRlcnRvb2xzXzExLjEuMC5iYn0gKDgyJSkK
CmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtbW9yZS1p
dGVydG9vbHNfMTAuOC4wLmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24z
LW1vcmUtaXRlcnRvb2xzXzExLjEuMC5iYgpzaW1pbGFyaXR5IGluZGV4IDgyJQpyZW5hbWUgZnJv
bSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtbW9yZS1pdGVydG9vbHNfMTAu
OC4wLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtbW9y
ZS1pdGVydG9vbHNfMTEuMS4wLmJiCmluZGV4IDA1MzE5N2VhNWMuLjJlYTVhZjYzMmEgMTAwNjQ0
Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1tb3JlLWl0ZXJ0b29s
c18xMC44LjAuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLW1v
cmUtaXRlcnRvb2xzXzExLjEuMC5iYgpAQCAtMyw3ICszLDcgQEAgSE9NRVBBR0UgPSAiaHR0cHM6
Ly9naXRodWIuY29tL2VyaWtyb3NlL21vcmUtaXRlcnRvb2xzIgogTElDRU5TRSA9ICJNSVQiCiBM
SUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFO21kNT0zMzk2ZWEzMGY5ZDIxMzg5ZDc4
NTc3MTk4MTZmODNiNSIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gImY2MzhkZGY4YTFhMGQxMzQx
ODEyNzVmYjVkNThiMDg2ZWFkN2M2YTcyNDI5YWQ3MjVjNjc1MDNmMTNiYTMwYmQiCitTUkNfVVJJ
W3NoYTI1NnN1bV0gPSAiNDhlOGY0ZDllN2U1ODc4NTcxZWNmNmYyYjRlNTc2MzRmOTNjZDQ3NGNj
OGNmYmQyMzc2ZjJkMTFiMzk2ZTMwZCIKIAogaW5oZXJpdCBweXBpIHB5dGhvbl9mbGl0X2NvcmUg
cHRlc3QtcHl0aG9uLXB5dGVzdAogCi0tIAoyLjQ3LjEKCg==

--===============4668929753245738930==--

