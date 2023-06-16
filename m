Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45691C27C5E
	for <webhook@archiver.kernel.org>; Fri, 16 Jun 2023 03:51:29 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web10.820.1686887482959638911
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Jun 2023 20:51:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=as2gUY7s;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 01010188c2544404-34ee11b9-0f5b-4491-9228-d2c2d6c04cbc-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1686887482;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=y/Bo67LeyVmaj4klX+ORhuTFGN7DrM6DWB0akfxpJjQ=;
	b=as2gUY7stsXxEXLb+g4lCYcgXPWsze5qg20y5gsl0a6fq2Dmh/CXa8q9G8NQQ74W
	xWK8vgEh+XKCuO3ZNxW7PK9vcrpWo/rWLrlfIc3w3Ou16ONMl5IPctAV0DOMG5Z1LHD
	Hd688YnybhfIeyNfP+vRcA96s88FM5Guncqhsv3k=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1686887482;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=y/Bo67LeyVmaj4klX+ORhuTFGN7DrM6DWB0akfxpJjQ=;
	b=BMExB7poAsh4BujkxQH37KjCA5JRi9l7ZftV89OTK5gqBOeILedQFsFmtIHE1vav
	QsojHeRl6op7Zvu1ymGXbgWieQU9OSN4Cp1BWJdcO1nvHsPD2BF3UGekIVDttKDQj66
	jXVR6BOzUika3ny3UGl36N6IAegzOYRr3Y7fiUNs=
Content-Type: multipart/mixed; boundary="===============4199927924855053192=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-certifi: upgrading to 2023.5.7 SUCCEEDED
Message-ID: <01010188c2544404-34ee11b9-0f5b-4491-9228-d2c2d6c04cbc-000000@us-west-2.amazonses.com>
Date: Fri, 16 Jun 2023 03:51:22 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.06.16-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Jun 2023 03:51:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182912

--===============4199927924855053192==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-certifi* to *2023.5.7* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-certifi-upgrade-2022.12.7-2023.5.7.patch
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
From 94454b8e032963c80e637f6ae7eb4df0af30fb34 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 15 Jun 2023 12:07:42 +0000
Subject: [PATCH] python3-certifi: upgrade 2022.12.7 -> 2023.5.7

---
 ...python3-certifi_2022.12.7.bb => python3-certifi_2023.5.7.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-certifi_2022.12.7.bb => python3-certifi_2023.5.7.bb} (86%)

diff --git a/meta/recipes-devtools/python/python3-certifi_2022.12.7.bb b/meta/recipes-devtools/python/python3-certifi_2023.5.7.bb
similarity index 86%
rename from meta/recipes-devtools/python/python3-certifi_2022.12.7.bb
rename to meta/recipes-devtools/python/python3-certifi_2023.5.7.bb
index b2e3ec125a..924b05c12c 100644
--- a/meta/recipes-devtools/python/python3-certifi_2022.12.7.bb
+++ b/meta/recipes-devtools/python/python3-certifi_2023.5.7.bb
@@ -7,7 +7,7 @@ HOMEPAGE = " http://certifi.io/"
 LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3c2b7404369c587c3559afb604fce2f2"
 
-SRC_URI[sha256sum] = "35824b4c3a97115964b408844d64aa14db1cc518f6562e8d7261699d1350a9e3"
+SRC_URI[sha256sum] = "0f0d56dc5a6ad56fd4ba36484d6cc34451e1c6548c61daad8c320169f91eddc7"
 
 inherit pypi setuptools3
 
-- 
2.39.2


--===============4199927924855053192==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-certifi: PV changed from "2022.12.7" to "2023.5.7"
packages/core2-32-poky-linux/python3-certifi: SRC_URI changed from "https://files.pythonhosted.org/packages/source/c/certifi/certifi-2022.12.7.tar.gz;downloadfilename=certifi-2022.12.7.tar.gz" to "https://files.pythonhosted.org/packages/source/c/certifi/certifi-2023.5.7.tar.gz;downloadfilename=certifi-2023.5.7.tar.gz"
packages/core2-32-poky-linux/python3-certifi: PKGV changed from 2022.12.7 [default] to 2023.5.7 [default]
packages/core2-32-poky-linux/python3-certifi/python3-certifi-dbg: PV changed from "2022.12.7" to "2023.5.7"
packages/core2-32-poky-linux/python3-certifi/python3-certifi-dbg: PKGV changed from 2022.12.7 [default] to 2023.5.7 [default]
packages/core2-32-poky-linux/python3-certifi/python3-certifi-dev: PV changed from "2022.12.7" to "2023.5.7"
packages/core2-32-poky-linux/python3-certifi/python3-certifi-dev: PKGV changed from 2022.12.7 [default] to 2023.5.7 [default]
packages/core2-32-poky-linux/python3-certifi/python3-certifi-doc: PV changed from "2022.12.7" to "2023.5.7"
packages/core2-32-poky-linux/python3-certifi/python3-certifi-doc: PKGV changed from 2022.12.7 [default] to 2023.5.7 [default]
packages/core2-32-poky-linux/python3-certifi/python3-certifi-locale: PV changed from "2022.12.7" to "2023.5.7"
packages/core2-32-poky-linux/python3-certifi/python3-certifi-locale: PKGV changed from 2022.12.7 [default] to 2023.5.7 [default]
packages/core2-32-poky-linux/python3-certifi/python3-certifi-src: PV changed from "2022.12.7" to "2023.5.7"
packages/core2-32-poky-linux/python3-certifi/python3-certifi-src: PKGV changed from 2022.12.7 [default] to 2023.5.7 [default]
packages/core2-32-poky-linux/python3-certifi/python3-certifi-staticdev: PV changed from "2022.12.7" to "2023.5.7"
packages/core2-32-poky-linux/python3-certifi/python3-certifi-staticdev: PKGV changed from 2022.12.7 [default] to 2023.5.7 [default]
packages/core2-32-poky-linux/python3-certifi/python3-certifi: PV changed from "2022.12.7" to "2023.5.7"
packages/core2-32-poky-linux/python3-certifi/python3-certifi: PKGV changed from 2022.12.7 [default] to 2023.5.7 [default]
packages/core2-32-poky-linux/python3-certifi/python3-certifi: PKGSIZE changed from 288912 to 291905 (+1%)
Changes to packages/core2-32-poky-linux/python3-certifi (sysroot):
  /usr/lib/python3.11/site-packages/certifi-2023.5.7.dist-info was added
  /usr/lib/python3.11/site-packages/certifi-2023.5.7.dist-info/LICENSE was added
  /usr/lib/python3.11/site-packages/certifi-2023.5.7.dist-info/METADATA was added
  /usr/lib/python3.11/site-packages/certifi-2023.5.7.dist-info/RECORD was added
  /usr/lib/python3.11/site-packages/certifi-2023.5.7.dist-info/top_level.txt was added
  /usr/lib/python3.11/site-packages/certifi-2023.5.7.dist-info/WHEEL was added
  /usr/lib/python3.11/site-packages/certifi-2022.12.7.dist-info was removed
  /usr/lib/python3.11/site-packages/certifi-2022.12.7.dist-info/LICENSE was removed
  /usr/lib/python3.11/site-packages/certifi-2022.12.7.dist-info/METADATA was removed
  /usr/lib/python3.11/site-packages/certifi-2022.12.7.dist-info/RECORD was removed
  /usr/lib/python3.11/site-packages/certifi-2022.12.7.dist-info/top_level.txt was removed
  /usr/lib/python3.11/site-packages/certifi-2022.12.7.dist-info/WHEEL was removed

--===============4199927924855053192==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-certifi-upgrade-2022.12.7-2023.5.7.patch"

RnJvbSA5NDQ1NGI4ZTAzMjk2M2M4MGU2MzdmNmFlN2ViNGRmMGFmMzBmYjM0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgSnVuIDIwMjMgMTI6MDc6NDIgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLWNlcnRpZmk6IHVwZ3JhZGUgMjAyMi4xMi43IC0+IDIwMjMuNS43CgotLS0KIC4uLnB5
dGhvbjMtY2VydGlmaV8yMDIyLjEyLjcuYmIgPT4gcHl0aG9uMy1jZXJ0aWZpXzIwMjMuNS43LmJi
fSB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQog
cmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtY2VydGlmaV8yMDIy
LjEyLjcuYmIgPT4gcHl0aG9uMy1jZXJ0aWZpXzIwMjMuNS43LmJifSAoODYlKQoKZGlmZiAtLWdp
dCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1jZXJ0aWZpXzIwMjIuMTIu
Ny5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1jZXJ0aWZpXzIwMjMu
NS43LmJiCnNpbWlsYXJpdHkgaW5kZXggODYlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0
b29scy9weXRob24vcHl0aG9uMy1jZXJ0aWZpXzIwMjIuMTIuNy5iYgpyZW5hbWUgdG8gbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWNlcnRpZmlfMjAyMy41LjcuYmIKaW5kZXgg
YjJlM2VjMTI1YS4uOTI0YjA1YzEyYyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L3B5dGhvbi9weXRob24zLWNlcnRpZmlfMjAyMi4xMi43LmJiCisrKyBiL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9weXRob24vcHl0aG9uMy1jZXJ0aWZpXzIwMjMuNS43LmJiCkBAIC03LDcgKzcsNyBA
QCBIT01FUEFHRSA9ICIgaHR0cDovL2NlcnRpZmkuaW8vIgogTElDRU5TRSA9ICJJU0MiCiBMSUNf
RklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFO21kNT0zYzJiNzQwNDM2OWM1ODdjMzU1OWFm
YjYwNGZjZTJmMiIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjM1ODI0YjRjM2E5NzExNTk2NGI0
MDg4NDRkNjRhYTE0ZGIxY2M1MThmNjU2MmU4ZDcyNjE2OTlkMTM1MGE5ZTMiCitTUkNfVVJJW3No
YTI1NnN1bV0gPSAiMGYwZDU2ZGM1YTZhZDU2ZmQ0YmEzNjQ4NGQ2Y2MzNDQ1MWUxYzY1NDhjNjFk
YWFkOGMzMjAxNjlmOTFlZGRjNyIKIAogaW5oZXJpdCBweXBpIHNldHVwdG9vbHMzCiAKLS0gCjIu
MzkuMgoK

--===============4199927924855053192==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/python3-certifi (sysroot):
  /usr/lib/python3.11/site-packages/certifi-2023.5.7.dist-info was added
  /usr/lib/python3.11/site-packages/certifi-2023.5.7.dist-info/LICENSE was added
  /usr/lib/python3.11/site-packages/certifi-2023.5.7.dist-info/METADATA was added
  /usr/lib/python3.11/site-packages/certifi-2023.5.7.dist-info/RECORD was added
  /usr/lib/python3.11/site-packages/certifi-2023.5.7.dist-info/top_level.txt was added
  /usr/lib/python3.11/site-packages/certifi-2023.5.7.dist-info/WHEEL was added
  /usr/lib/python3.11/site-packages/certifi-2022.12.7.dist-info was removed
  /usr/lib/python3.11/site-packages/certifi-2022.12.7.dist-info/LICENSE was removed
  /usr/lib/python3.11/site-packages/certifi-2022.12.7.dist-info/METADATA was removed
  /usr/lib/python3.11/site-packages/certifi-2022.12.7.dist-info/RECORD was removed
  /usr/lib/python3.11/site-packages/certifi-2022.12.7.dist-info/top_level.txt was removed
  /usr/lib/python3.11/site-packages/certifi-2022.12.7.dist-info/WHEEL was removed

--===============4199927924855053192==--

