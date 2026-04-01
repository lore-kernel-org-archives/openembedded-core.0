Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E213D10FCAD5
	for <webhook@archiver.kernel.org>; Wed,  1 Apr 2026 14:36:06 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14738.1775054152306804574
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Apr 2026 07:36:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=oXHgsERG;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=hkFgt8+r;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101019d49791322-98eaa3eb-deea-41b0-805b-61fe6816e385-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1775054164;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Iy2dSPcgZEm8IXx+j8LeYAujl40RV7PzawWS8Loxak8=;
	b=oXHgsERG6GbKQ2K/3ZB+wQFejYmekhwNHJACQboW9X9ZH0n/6wFyssoRnLts71rt
	Qbzpgntqx3aZfdcpXMZX9P1oI6Wj2/WSvjO83L0N4cm1GJRgvt8iJmBp9mxY1Hg9UHb
	dqlCXt4e1hoDSBDN5XXX+jzHYa1gmjnkurOOsqCw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1775054164;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Iy2dSPcgZEm8IXx+j8LeYAujl40RV7PzawWS8Loxak8=;
	b=hkFgt8+rGRFSyUtRghduyvQkTKd6jnQ9IJ12tRWQeRrUonRSraeuFYIcWsVGE8PY
	TLFjaMYuRvoqtR6NOKTIYZS3/JiBiirPCyO3hNtQ1U2r9jWBCcw1NQ5R1A08eK63BCb
	lyaZAKKXfJvkxpLulL45Nnf61T+ttCT63hcvxwZk=
Content-Type: multipart/mixed; boundary="===============8730053472978059302=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Benjamin Robin <benjamin.robin@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-sbom-cve-check: upgrading to 1.2.1 SUCCEEDED
Message-ID: <0101019d49791322-98eaa3eb-deea-41b0-805b-61fe6816e385-000000@us-west-2.amazonses.com>
Date: Wed, 1 Apr 2026 14:36:04 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.04.01-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Apr 2026 14:36:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234389

--===============8730053472978059302==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-sbom-cve-check* to *1.2.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-sbom-cve-check-upgrade-1.2.0-1.2.1.patch
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
From 127d51e7c5199ebb43efc7e575d0c6e994db9d55 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 1 Apr 2026 10:26:41 +0000
Subject: [PATCH] python3-sbom-cve-check: upgrade 1.2.0 -> 1.2.1

---
 ...-sbom-cve-check_1.2.0.bb => python3-sbom-cve-check_1.2.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-sbom-cve-check_1.2.0.bb => python3-sbom-cve-check_1.2.1.bb} (82%)

diff --git a/meta/recipes-devtools/python/python3-sbom-cve-check_1.2.0.bb b/meta/recipes-devtools/python/python3-sbom-cve-check_1.2.1.bb
similarity index 82%
rename from meta/recipes-devtools/python/python3-sbom-cve-check_1.2.0.bb
rename to meta/recipes-devtools/python/python3-sbom-cve-check_1.2.1.bb
index 070e878971..e8791b6a3a 100644
--- a/meta/recipes-devtools/python/python3-sbom-cve-check_1.2.0.bb
+++ b/meta/recipes-devtools/python/python3-sbom-cve-check_1.2.1.bb
@@ -5,7 +5,7 @@ LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=570a9b3749dd0463a1778803b12a6dce"
 
 PYPI_PACKAGE = "sbom_cve_check"
-SRC_URI[sha256sum] = "0b01474c541fb4b9d29d36f86fae6d0f27ff2b991fcb59b2fbeb70c1eaa09664"
+SRC_URI[sha256sum] = "d7dfca05cf0cee6b439802fe10689790b9395d436d0d9af6170e23603c2ea5cb"
 
 inherit pypi python_hatchling
 
-- 
2.47.1


--===============8730053472978059302==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-sbom-cve-check/python3-sbom-cve-check: FILELIST: directory renamed /usr/lib/python3.14/site-packages/sbom_cve_check-1.2.0.dist-info/licenses -> /usr/lib/python3.14/site-packages/sbom_cve_check-1.2.1.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/sbom_cve_check-1.2.0.dist-info -> /usr/lib/python3.14/site-packages/sbom_cve_check-1.2.1.dist-info
Changes to packages/x86-64-v3-poky-linux/python3-sbom-cve-check (sysroot):
  /usr/lib/python3.14/site-packages/sbom_cve_check-1.2.0.dist-info moved to /usr/lib/python3.14/site-packages/sbom_cve_check-1.2.1.dist-info

--===============8730053472978059302==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-sbom-cve-check: SRC_URI changed from "https://files.pythonhosted.org/packages/source/s/sbom_cve_check/sbom_cve_check-1.2.0.tar.gz;downloadfilename=sbom_cve_check-1.2.0.tar.gz" to "https://files.pythonhosted.org/packages/source/s/sbom_cve_check/sbom_cve_check-1.2.1.tar.gz;downloadfilename=sbom_cve_check-1.2.1.tar.gz"
packages/x86-64-v3-poky-linux/python3-sbom-cve-check: PKGV changed from 1.2.0 [default] to 1.2.1 [default]
packages/x86-64-v3-poky-linux/python3-sbom-cve-check: PV changed from "1.2.0" to "1.2.1"
packages/x86-64-v3-poky-linux/python3-sbom-cve-check/python3-sbom-cve-check-dbg: PKGV changed from 1.2.0 [default] to 1.2.1 [default]
packages/x86-64-v3-poky-linux/python3-sbom-cve-check/python3-sbom-cve-check-dbg: PV changed from "1.2.0" to "1.2.1"
packages/x86-64-v3-poky-linux/python3-sbom-cve-check/python3-sbom-cve-check-dev: PKGV changed from 1.2.0 [default] to 1.2.1 [default]
packages/x86-64-v3-poky-linux/python3-sbom-cve-check/python3-sbom-cve-check-dev: PV changed from "1.2.0" to "1.2.1"
packages/x86-64-v3-poky-linux/python3-sbom-cve-check/python3-sbom-cve-check-doc: PKGV changed from 1.2.0 [default] to 1.2.1 [default]
packages/x86-64-v3-poky-linux/python3-sbom-cve-check/python3-sbom-cve-check-doc: PV changed from "1.2.0" to "1.2.1"
packages/x86-64-v3-poky-linux/python3-sbom-cve-check/python3-sbom-cve-check-locale: PKGV changed from 1.2.0 [default] to 1.2.1 [default]
packages/x86-64-v3-poky-linux/python3-sbom-cve-check/python3-sbom-cve-check-locale: PV changed from "1.2.0" to "1.2.1"
packages/x86-64-v3-poky-linux/python3-sbom-cve-check/python3-sbom-cve-check-src: PKGV changed from 1.2.0 [default] to 1.2.1 [default]
packages/x86-64-v3-poky-linux/python3-sbom-cve-check/python3-sbom-cve-check-src: PV changed from "1.2.0" to "1.2.1"
packages/x86-64-v3-poky-linux/python3-sbom-cve-check/python3-sbom-cve-check-staticdev: PKGV changed from 1.2.0 [default] to 1.2.1 [default]
packages/x86-64-v3-poky-linux/python3-sbom-cve-check/python3-sbom-cve-check-staticdev: PV changed from "1.2.0" to "1.2.1"
packages/x86-64-v3-poky-linux/python3-sbom-cve-check/python3-sbom-cve-check: FILELIST: directory renamed /usr/lib/python3.14/site-packages/sbom_cve_check-1.2.0.dist-info/licenses -> /usr/lib/python3.14/site-packages/sbom_cve_check-1.2.1.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/sbom_cve_check-1.2.0.dist-info -> /usr/lib/python3.14/site-packages/sbom_cve_check-1.2.1.dist-info
packages/x86-64-v3-poky-linux/python3-sbom-cve-check/python3-sbom-cve-check: PKGV changed from 1.2.0 [default] to 1.2.1 [default]
packages/x86-64-v3-poky-linux/python3-sbom-cve-check/python3-sbom-cve-check: PKGSIZE changed from 1044022 to 1049538 (+1%)
packages/x86-64-v3-poky-linux/python3-sbom-cve-check/python3-sbom-cve-check: PV changed from "1.2.0" to "1.2.1"
Changes to packages/x86-64-v3-poky-linux/python3-sbom-cve-check (sysroot):
  /usr/lib/python3.14/site-packages/sbom_cve_check-1.2.0.dist-info moved to /usr/lib/python3.14/site-packages/sbom_cve_check-1.2.1.dist-info

--===============8730053472978059302==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-sbom-cve-check-upgrade-1.2.0-1.2.1.patch"

RnJvbSAxMjdkNTFlN2M1MTk5ZWJiNDNlZmM3ZTU3NWQwYzZlOTk0ZGI5ZDU1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBBcHIgMjAyNiAxMDoyNjo0MSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtc2JvbS1jdmUtY2hlY2s6IHVwZ3JhZGUgMS4yLjAgLT4gMS4yLjEKCi0tLQogLi4uLXNi
b20tY3ZlLWNoZWNrXzEuMi4wLmJiID0+IHB5dGhvbjMtc2JvbS1jdmUtY2hlY2tfMS4yLjEuYmJ9
IHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiBy
ZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1zYm9tLWN2ZS1jaGVj
a18xLjIuMC5iYiA9PiBweXRob24zLXNib20tY3ZlLWNoZWNrXzEuMi4xLmJifSAoODIlKQoKZGlm
ZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1zYm9tLWN2ZS1j
aGVja18xLjIuMC5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1zYm9t
LWN2ZS1jaGVja18xLjIuMS5iYgpzaW1pbGFyaXR5IGluZGV4IDgyJQpyZW5hbWUgZnJvbSBtZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtc2JvbS1jdmUtY2hlY2tfMS4yLjAuYmIK
cmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1zYm9tLWN2ZS1j
aGVja18xLjIuMS5iYgppbmRleCAwNzBlODc4OTcxLi5lODc5MWI2YTNhIDEwMDY0NAotLS0gYS9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtc2JvbS1jdmUtY2hlY2tfMS4yLjAu
YmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXNib20tY3ZlLWNo
ZWNrXzEuMi4xLmJiCkBAIC01LDcgKzUsNyBAQCBMSUNFTlNFID0gIkdQTC0yLjAtb25seSIKIExJ
Q19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0U7bWQ1PTU3MGE5YjM3NDlkZDA0NjNhMTc3
ODgwM2IxMmE2ZGNlIgogCiBQWVBJX1BBQ0tBR0UgPSAic2JvbV9jdmVfY2hlY2siCi1TUkNfVVJJ
W3NoYTI1NnN1bV0gPSAiMGIwMTQ3NGM1NDFmYjRiOWQyOWQzNmY4NmZhZTZkMGYyN2ZmMmI5OTFm
Y2I1OWIyZmJlYjcwYzFlYWEwOTY2NCIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICJkN2RmY2EwNWNm
MGNlZTZiNDM5ODAyZmUxMDY4OTc5MGI5Mzk1ZDQzNmQwZDlhZjYxNzBlMjM2MDNjMmVhNWNiIgog
CiBpbmhlcml0IHB5cGkgcHl0aG9uX2hhdGNobGluZwogCi0tIAoyLjQ3LjEKCg==

--===============8730053472978059302==--

