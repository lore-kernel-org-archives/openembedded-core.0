Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6BD4E776D1
	for <webhook@archiver.kernel.org>; Sun,  1 Oct 2023 18:13:18 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web10.65025.1696183991264877821
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Oct 2023 11:13:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=DZOHqnjN;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=VS52vco/;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101018aec71b961-20122011-f9d7-40ae-8777-88b551409dc9-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1696183990;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=NRpBT6pp5whfNTawFoJXGwka7XgJ/oReLrt9D1gZwGE=;
	b=DZOHqnjNknmiwnSkZZOfM99cTEgNc38kWvhX8v+7M4La7i/SZ6XlhhHSR1Ght6+K
	GJ1IaUyS6Ow+PdHF1pmMBV+gKjmlUMNJUOO0vsZf+eJzWkXp2Gimaq9EV4yIzKhXYKa
	bo6CiCZd8VtWeeG3rAoLzaRy7jqmFv+gao7C/dx0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1696183990;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=NRpBT6pp5whfNTawFoJXGwka7XgJ/oReLrt9D1gZwGE=;
	b=VS52vco/tod3K/aMcEO+5KHm4hVBF+CTZVMYsPrs/ElazJ1/mjLdIbW066mNdve8
	claQ3/xjhMBsUWwbs/n/7LMoZxyAtOeB6Dmd/JynDsQAUaC/5Zw8WOTnoQfgsm5n+HO
	gYPOD++O63ZYYiRrNE4cXwMfCasYIjZkwkWwywtc=
Content-Type: multipart/mixed; boundary="===============8537505112897771332=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-wcwidth: upgrading to 0.2.8 SUCCEEDED
Message-ID: <0101018aec71b961-20122011-f9d7-40ae-8777-88b551409dc9-000000@us-west-2.amazonses.com>
Date: Sun, 1 Oct 2023 18:13:10 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.10.01-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Oct 2023 18:13:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188544

--===============8537505112897771332==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-wcwidth* to *0.2.8* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-wcwidth-upgrade-0.2.6-0.2.8.patch
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
From 5dd6870056ce9d3b1780c39329ca1089bef0668e Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 1 Oct 2023 10:18:30 +0000
Subject: [PATCH] python3-wcwidth: upgrade 0.2.6 -> 0.2.8

---
 .../{python3-wcwidth_0.2.6.bb => python3-wcwidth_0.2.8.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-wcwidth_0.2.6.bb => python3-wcwidth_0.2.8.bb} (87%)

diff --git a/meta/recipes-devtools/python/python3-wcwidth_0.2.6.bb b/meta/recipes-devtools/python/python3-wcwidth_0.2.8.bb
similarity index 87%
rename from meta/recipes-devtools/python/python3-wcwidth_0.2.6.bb
rename to meta/recipes-devtools/python/python3-wcwidth_0.2.8.bb
index fbd008c13d..e906a6d73a 100644
--- a/meta/recipes-devtools/python/python3-wcwidth_0.2.6.bb
+++ b/meta/recipes-devtools/python/python3-wcwidth_0.2.8.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/jquast/wcwidth"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b15979c39a2543892fca8cd86b4b52cb"
 
-SRC_URI[sha256sum] = "a5220780a404dbe3353789870978e472cfe477761f06ee55077256e509b156d0"
+SRC_URI[sha256sum] = "8705c569999ffbb4f6a87c6d1b80f324bd6db952f5eb0b95bc07517f4c1813d4"
 
 inherit pypi setuptools3 ptest
 
-- 
2.39.2


--===============8537505112897771332==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-wcwidth: SRC_URI changed from "https://files.pythonhosted.org/packages/source/w/wcwidth/wcwidth-0.2.6.tar.gz;downloadfilename=wcwidth-0.2.6.tar.gz file://run-ptest" to "https://files.pythonhosted.org/packages/source/w/wcwidth/wcwidth-0.2.8.tar.gz;downloadfilename=wcwidth-0.2.8.tar.gz file://run-ptest"
packages/core2-32-poky-linux/python3-wcwidth: PKGV changed from 0.2.6 [default] to 0.2.8 [default]
packages/core2-32-poky-linux/python3-wcwidth: PV changed from "0.2.6" to "0.2.8"
packages/core2-32-poky-linux/python3-wcwidth/python3-wcwidth-dbg: PKGV changed from 0.2.6 [default] to 0.2.8 [default]
packages/core2-32-poky-linux/python3-wcwidth/python3-wcwidth-dbg: PV changed from "0.2.6" to "0.2.8"
packages/core2-32-poky-linux/python3-wcwidth/python3-wcwidth-dev: PKGV changed from 0.2.6 [default] to 0.2.8 [default]
packages/core2-32-poky-linux/python3-wcwidth/python3-wcwidth-dev: PV changed from "0.2.6" to "0.2.8"
packages/core2-32-poky-linux/python3-wcwidth/python3-wcwidth-doc: PKGV changed from 0.2.6 [default] to 0.2.8 [default]
packages/core2-32-poky-linux/python3-wcwidth/python3-wcwidth-doc: PV changed from "0.2.6" to "0.2.8"
packages/core2-32-poky-linux/python3-wcwidth/python3-wcwidth-locale: PKGV changed from 0.2.6 [default] to 0.2.8 [default]
packages/core2-32-poky-linux/python3-wcwidth/python3-wcwidth-locale: PV changed from "0.2.6" to "0.2.8"
packages/core2-32-poky-linux/python3-wcwidth/python3-wcwidth-ptest: FILELIST: removed "/usr/lib/python3-wcwidth/ptest/tests/__init__.py"
packages/core2-32-poky-linux/python3-wcwidth/python3-wcwidth-ptest: PKGV changed from 0.2.6 [default] to 0.2.8 [default]
packages/core2-32-poky-linux/python3-wcwidth/python3-wcwidth-ptest: PKGSIZE changed from 8627 to 8585 (-0%)
packages/core2-32-poky-linux/python3-wcwidth/python3-wcwidth-ptest: PV changed from "0.2.6" to "0.2.8"
packages/core2-32-poky-linux/python3-wcwidth/python3-wcwidth-src: PKGV changed from 0.2.6 [default] to 0.2.8 [default]
packages/core2-32-poky-linux/python3-wcwidth/python3-wcwidth-src: PV changed from "0.2.6" to "0.2.8"
packages/core2-32-poky-linux/python3-wcwidth/python3-wcwidth-staticdev: PKGV changed from 0.2.6 [default] to 0.2.8 [default]
packages/core2-32-poky-linux/python3-wcwidth/python3-wcwidth-staticdev: PV changed from "0.2.6" to "0.2.8"
packages/core2-32-poky-linux/python3-wcwidth/python3-wcwidth: PKGV changed from 0.2.6 [default] to 0.2.8 [default]
packages/core2-32-poky-linux/python3-wcwidth/python3-wcwidth: PKGSIZE changed from 498153 to 534989 (+7%)
packages/core2-32-poky-linux/python3-wcwidth/python3-wcwidth: PV changed from "0.2.6" to "0.2.8"
Changes to packages/core2-32-poky-linux/python3-wcwidth (sysroot):
  /usr/lib/python3.11/site-packages/wcwidth-0.2.6.dist-info moved to /usr/lib/python3.11/site-packages/wcwidth-0.2.8.dist-info

--===============8537505112897771332==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-wcwidth-upgrade-0.2.6-0.2.8.patch"

RnJvbSA1ZGQ2ODcwMDU2Y2U5ZDNiMTc4MGMzOTMyOWNhMTA4OWJlZjA2NjhlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMSBPY3QgMjAyMyAxMDoxODozMCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtd2N3aWR0aDogdXBncmFkZSAwLjIuNiAtPiAwLjIuOAoKLS0tCiAuLi4ve3B5dGhvbjMt
d2N3aWR0aF8wLjIuNi5iYiA9PiBweXRob24zLXdjd2lkdGhfMC4yLjguYmJ9ICAgICAgfCAyICst
CiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBt
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLXdjd2lkdGhfMC4yLjYuYmIgPT4g
cHl0aG9uMy13Y3dpZHRoXzAuMi44LmJifSAoODclKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBl
cy1kZXZ0b29scy9weXRob24vcHl0aG9uMy13Y3dpZHRoXzAuMi42LmJiIGIvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3B5dGhvbi9weXRob24zLXdjd2lkdGhfMC4yLjguYmIKc2ltaWxhcml0eSBpbmRl
eCA4NyUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXdj
d2lkdGhfMC4yLjYuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0
aG9uMy13Y3dpZHRoXzAuMi44LmJiCmluZGV4IGZiZDAwOGMxM2QuLmU5MDZhNmQ3M2EgMTAwNjQ0
Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy13Y3dpZHRoXzAuMi42
LmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy13Y3dpZHRoXzAu
Mi44LmJiCkBAIC00LDcgKzQsNyBAQCBIT01FUEFHRSA9ICJodHRwczovL2dpdGh1Yi5jb20vanF1
YXN0L3djd2lkdGgiCiBMSUNFTlNFID0gIk1JVCIKIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTov
L0xJQ0VOU0U7bWQ1PWIxNTk3OWMzOWEyNTQzODkyZmNhOGNkODZiNGI1MmNiIgogCi1TUkNfVVJJ
W3NoYTI1NnN1bV0gPSAiYTUyMjA3ODBhNDA0ZGJlMzM1Mzc4OTg3MDk3OGU0NzJjZmU0Nzc3NjFm
MDZlZTU1MDc3MjU2ZTUwOWIxNTZkMCIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICI4NzA1YzU2OTk5
OWZmYmI0ZjZhODdjNmQxYjgwZjMyNGJkNmRiOTUyZjVlYjBiOTViYzA3NTE3ZjRjMTgxM2Q0Igog
CiBpbmhlcml0IHB5cGkgc2V0dXB0b29sczMgcHRlc3QKIAotLSAKMi4zOS4yCgo=

--===============8537505112897771332==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/python3-wcwidth/python3-wcwidth-ptest: FILELIST: removed "/usr/lib/python3-wcwidth/ptest/tests/__init__.py"
Changes to packages/core2-32-poky-linux/python3-wcwidth (sysroot):
  /usr/lib/python3.11/site-packages/wcwidth-0.2.6.dist-info moved to /usr/lib/python3.11/site-packages/wcwidth-0.2.8.dist-info

--===============8537505112897771332==--

