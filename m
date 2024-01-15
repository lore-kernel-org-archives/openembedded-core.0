Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 287B0C48299
	for <webhook@archiver.kernel.org>; Mon, 15 Jan 2024 17:34:00 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web10.88863.1705340030528803922
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jan 2024 09:33:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=T7NIpiaw;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=fgtMkv2+;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101018d0e2fcb28-b9578ab1-da70-4199-9b33-5f943d28d527-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1705340029;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=bR61JqGYqXMPLc1tTNIWej3CaQ4yBXIiy2ZEBTFW/nw=;
	b=T7NIpiaw0fPs3TqTM+IDRePp4WLeYY+qWLtJS/eke7ytqQKr+wxWd8wAkBGSsXIn
	ZuMYKs32eeETuvL+VZqNSPNgHTzkPeyevz+KyxrZoXwE3VnNS2iC44/l7QOh17ZGSip
	TASefg81OvyIkcoagt5B3eXmcYYrSZ3Q7opWcTYQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1705340029;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=bR61JqGYqXMPLc1tTNIWej3CaQ4yBXIiy2ZEBTFW/nw=;
	b=fgtMkv2+2ZwVsgMYLV35Exmxs2riGmLouh/HuAwG5yvRpG5hFyacQiog7iu549As
	OrgTkRVkt3QZfJeH37if+/nu/1NeMD8Agaczfh3m9YTQ+inGjm1hMFr5aRqt8cOWZTT
	StXL2mNpFPUA+9isXpG16lMME4hWbHLrEgWO9W0Y=
Content-Type: multipart/mixed; boundary="===============3357880133008701454=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-sphinxcontrib-htmlhelp: upgrading to 2.0.5 SUCCEEDED
Message-ID: <0101018d0e2fcb28-b9578ab1-da70-4199-9b33-5f943d28d527-000000@us-west-2.amazonses.com>
Date: Mon, 15 Jan 2024 17:33:49 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.01.15-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Jan 2024 17:34:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193745

--===============3357880133008701454==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-sphinxcontrib-htmlhelp* to *2.0.5* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-sphinxcontrib-htmlhelp-upgrade-2.0.4-2.0.5.patch
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
From 0a2666596afc15cc1110008aa95b3802c9ab5ee2 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 15 Jan 2024 08:09:13 +0000
Subject: [PATCH] python3-sphinxcontrib-htmlhelp: upgrade 2.0.4 -> 2.0.5

---
 ...tmlhelp_2.0.4.bb => python3-sphinxcontrib-htmlhelp_2.0.5.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-sphinxcontrib-htmlhelp_2.0.4.bb => python3-sphinxcontrib-htmlhelp_2.0.5.bb} (83%)

diff --git a/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.4.bb b/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.5.bb
similarity index 83%
rename from meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.4.bb
rename to meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.5.bb
index a0a4b4496f..532d1fc22a 100644
--- a/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.4.bb
+++ b/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.5.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://www.sphinx-doc.org"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=24dce5ef6a13563241c24bc366f48886"
 
-SRC_URI[sha256sum] = "6c26a118a05b76000738429b724a0568dbde5b72391a688577da08f11891092a"
+SRC_URI[sha256sum] = "0dc87637d5de53dd5eec3a6a01753b1ccf99494bd756aafecd74b4fa9e729015"
 
 PYPI_PACKAGE = "sphinxcontrib-htmlhelp"
 
-- 
2.42.0


--===============3357880133008701454==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-sphinxcontrib-htmlhelp-upgrade-2.0.4-2.0.5.patch"

RnJvbSAwYTI2NjY1OTZhZmMxNWNjMTExMDAwOGFhOTViMzgwMmM5YWI1ZWUyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTUgSmFuIDIwMjQgMDg6MDk6MTMgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXNwaGlueGNvbnRyaWItaHRtbGhlbHA6IHVwZ3JhZGUgMi4wLjQgLT4gMi4wLjUKCi0t
LQogLi4udG1saGVscF8yLjAuNC5iYiA9PiBweXRob24zLXNwaGlueGNvbnRyaWItaHRtbGhlbHBf
Mi4wLjUuYmJ9IHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0
aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1zcGhp
bnhjb250cmliLWh0bWxoZWxwXzIuMC40LmJiID0+IHB5dGhvbjMtc3BoaW54Y29udHJpYi1odG1s
aGVscF8yLjAuNS5iYn0gKDgzJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
cHl0aG9uL3B5dGhvbjMtc3BoaW54Y29udHJpYi1odG1saGVscF8yLjAuNC5iYiBiL21ldGEvcmVj
aXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1zcGhpbnhjb250cmliLWh0bWxoZWxwXzIuMC41
LmJiCnNpbWlsYXJpdHkgaW5kZXggODMlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29s
cy9weXRob24vcHl0aG9uMy1zcGhpbnhjb250cmliLWh0bWxoZWxwXzIuMC40LmJiCnJlbmFtZSB0
byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtc3BoaW54Y29udHJpYi1odG1s
aGVscF8yLjAuNS5iYgppbmRleCBhMGE0YjQ0OTZmLi41MzJkMWZjMjJhIDEwMDY0NAotLS0gYS9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtc3BoaW54Y29udHJpYi1odG1saGVs
cF8yLjAuNC5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtc3Bo
aW54Y29udHJpYi1odG1saGVscF8yLjAuNS5iYgpAQCAtMyw3ICszLDcgQEAgSE9NRVBBR0UgPSAi
aHR0cHM6Ly93d3cuc3BoaW54LWRvYy5vcmciCiBMSUNFTlNFID0gIkJTRC0yLUNsYXVzZSIKIExJ
Q19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0U7bWQ1PTI0ZGNlNWVmNmExMzU2MzI0MWMy
NGJjMzY2ZjQ4ODg2IgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiNmMyNmExMThhMDViNzYwMDA3
Mzg0MjliNzI0YTA1NjhkYmRlNWI3MjM5MWE2ODg1NzdkYTA4ZjExODkxMDkyYSIKK1NSQ19VUklb
c2hhMjU2c3VtXSA9ICIwZGM4NzYzN2Q1ZGU1M2RkNWVlYzNhNmEwMTc1M2IxY2NmOTk0OTRiZDc1
NmFhZmVjZDc0YjRmYTllNzI5MDE1IgogCiBQWVBJX1BBQ0tBR0UgPSAic3BoaW54Y29udHJpYi1o
dG1saGVscCIKIAotLSAKMi40Mi4wCgo=

--===============3357880133008701454==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/python3-sphinxcontrib-htmlhelp (sysroot):
  /usr/lib/python3.11/site-packages/sphinxcontrib_htmlhelp-2.0.4.dist-info moved to /usr/lib/python3.11/site-packages/sphinxcontrib_htmlhelp-2.0.5.dist-info

--===============3357880133008701454==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-sphinxcontrib-htmlhelp: PV changed from "2.0.4" to "2.0.5"
packages/core2-64-poky-linux/python3-sphinxcontrib-htmlhelp: SRC_URI changed from "https://files.pythonhosted.org/packages/source/s/sphinxcontrib-htmlhelp/sphinxcontrib_htmlhelp-2.0.4.tar.gz;downloadfilename=sphinxcontrib_htmlhelp-2.0.4.tar.gz" to "https://files.pythonhosted.org/packages/source/s/sphinxcontrib-htmlhelp/sphinxcontrib_htmlhelp-2.0.5.tar.gz;downloadfilename=sphinxcontrib_htmlhelp-2.0.5.tar.gz"
packages/core2-64-poky-linux/python3-sphinxcontrib-htmlhelp: PKGV changed from 2.0.4 [default] to 2.0.5 [default]
packages/core2-64-poky-linux/python3-sphinxcontrib-htmlhelp/python3-sphinxcontrib-htmlhelp-dbg: PV changed from "2.0.4" to "2.0.5"
packages/core2-64-poky-linux/python3-sphinxcontrib-htmlhelp/python3-sphinxcontrib-htmlhelp-dbg: PKGV changed from 2.0.4 [default] to 2.0.5 [default]
packages/core2-64-poky-linux/python3-sphinxcontrib-htmlhelp/python3-sphinxcontrib-htmlhelp-dev: PV changed from "2.0.4" to "2.0.5"
packages/core2-64-poky-linux/python3-sphinxcontrib-htmlhelp/python3-sphinxcontrib-htmlhelp-dev: PKGV changed from 2.0.4 [default] to 2.0.5 [default]
packages/core2-64-poky-linux/python3-sphinxcontrib-htmlhelp/python3-sphinxcontrib-htmlhelp-doc: PV changed from "2.0.4" to "2.0.5"
packages/core2-64-poky-linux/python3-sphinxcontrib-htmlhelp/python3-sphinxcontrib-htmlhelp-doc: PKGV changed from 2.0.4 [default] to 2.0.5 [default]
packages/core2-64-poky-linux/python3-sphinxcontrib-htmlhelp/python3-sphinxcontrib-htmlhelp-locale: PV changed from "2.0.4" to "2.0.5"
packages/core2-64-poky-linux/python3-sphinxcontrib-htmlhelp/python3-sphinxcontrib-htmlhelp-locale: PKGV changed from 2.0.4 [default] to 2.0.5 [default]
packages/core2-64-poky-linux/python3-sphinxcontrib-htmlhelp/python3-sphinxcontrib-htmlhelp-src: PV changed from "2.0.4" to "2.0.5"
packages/core2-64-poky-linux/python3-sphinxcontrib-htmlhelp/python3-sphinxcontrib-htmlhelp-src: PKGV changed from 2.0.4 [default] to 2.0.5 [default]
packages/core2-64-poky-linux/python3-sphinxcontrib-htmlhelp/python3-sphinxcontrib-htmlhelp-staticdev: PV changed from "2.0.4" to "2.0.5"
packages/core2-64-poky-linux/python3-sphinxcontrib-htmlhelp/python3-sphinxcontrib-htmlhelp-staticdev: PKGV changed from 2.0.4 [default] to 2.0.5 [default]
packages/core2-64-poky-linux/python3-sphinxcontrib-htmlhelp/python3-sphinxcontrib-htmlhelp: PV changed from "2.0.4" to "2.0.5"
packages/core2-64-poky-linux/python3-sphinxcontrib-htmlhelp/python3-sphinxcontrib-htmlhelp: PKGV changed from 2.0.4 [default] to 2.0.5 [default]
packages/core2-64-poky-linux/python3-sphinxcontrib-htmlhelp/python3-sphinxcontrib-htmlhelp: PKGSIZE changed from 161915 to 162079 (+0%)
Changes to packages/core2-64-poky-linux/python3-sphinxcontrib-htmlhelp (sysroot):
  /usr/lib/python3.11/site-packages/sphinxcontrib_htmlhelp-2.0.4.dist-info moved to /usr/lib/python3.11/site-packages/sphinxcontrib_htmlhelp-2.0.5.dist-info

--===============3357880133008701454==--

