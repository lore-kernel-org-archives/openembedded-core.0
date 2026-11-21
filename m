Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12030.1795238990061556772
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Nov 2026 21:29:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=UbxCg3OY;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=ZFApmbqw;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 010101a1fc950cff-5d74188d-dbb0-4b00-bb44-8bfb18ee37ef-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1795238989;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=okaNSCUJsLCdN2r1gXq/2Td76FM0gBcV9UJlv8NB6dA=;
	b=UbxCg3OYLlHXHHEpnKyr1Yh8ZXpCcX6jzvBqlVCOf8QkoGDJ817zjqn7cp1zO68P
	kr/HQ8s9/XBk8Lo4V5Q+lcBX51HIXf5KLBxp4Afb/0vJKhiLxKHxfk4xqR/q4ATw6ba
	+NON7bK3cyAneWceEofTCl7p+8j1QB3lRErfTl2M=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1795238989;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=okaNSCUJsLCdN2r1gXq/2Td76FM0gBcV9UJlv8NB6dA=;
	b=ZFApmbqwEFoU128f1U7BcGvlvgxHpkyelxxe+dDFXwhYZIMG6qLuoxomRwA+yWVo
	Xvd+RfZtwc8n0UHnGgbLIXK3ZFKVciy02KZspT7rwc6iEgCg6rfcys5aBwgDQk72GAa
	CX3lNXeXsIXnN+o4vD8rVUoDYrt9QCX+2mEsb7aA=
Content-Type: multipart/mixed; boundary="===============0540597804355271724=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-certifi: upgrading to 2026.11.20 SUCCEEDED
Message-ID: <010101a1fc950cff-5d74188d-dbb0-4b00-bb44-8bfb18ee37ef-000000@us-west-2.amazonses.com>
Date: Sat, 21 Nov 2026 05:29:49 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.11.21-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sat, 21 Nov 2026 05:29:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250830

--===============0540597804355271724==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-certifi* to *2026.11.20* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-certifi-upgrade-2026.10.23-2026.11.20.patch
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
From a14736635cf8e494d3188fa79638ab89383b7464 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 21 Nov 2026 05:07:56 +0000
Subject: [PATCH] python3-certifi: upgrade 2026.10.23 -> 2026.11.20

---
 ...hon3-certifi_2026.10.23.bb => python3-certifi_2026.11.20.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-certifi_2026.10.23.bb => python3-certifi_2026.11.20.bb} (88%)

diff --git a/meta/recipes-devtools/python/python3-certifi_2026.10.23.bb b/meta/recipes-devtools/python/python3-certifi_2026.11.20.bb
similarity index 88%
rename from meta/recipes-devtools/python/python3-certifi_2026.10.23.bb
rename to meta/recipes-devtools/python/python3-certifi_2026.11.20.bb
index 29e213ef22..8b2449fb1b 100644
--- a/meta/recipes-devtools/python/python3-certifi_2026.10.23.bb
+++ b/meta/recipes-devtools/python/python3-certifi_2026.11.20.bb
@@ -7,7 +7,7 @@ HOMEPAGE = "http://certifi.io/"
 LICENSE = "MPL-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=11618cb6a975948679286b1211bd573c"
 
-SRC_URI[sha256sum] = "a9895e6e2758b371e0545e321a3a8fd1fcfd9829ada8824a936dfb16aaaf36cd"
+SRC_URI[sha256sum] = "af1cb240a8133f105aa52684a3a3258339d7f2fd0bd4e2812698ff5cf5588c4e"
 
 inherit pypi python_setuptools_build_meta ptest-python-pytest
 
-- 
2.47.1


--===============0540597804355271724==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-certifi/python3-certifi: FILELIST: directory renamed /usr/lib/python3.15/site-packages/certifi-2026.10.23.dist-info/licenses -> /usr/lib/python3.15/site-packages/certifi-2026.11.20.dist-info/licenses, directory renamed /usr/lib/python3.15/site-packages/certifi-2026.10.23.dist-info -> /usr/lib/python3.15/site-packages/certifi-2026.11.20.dist-info
Changes to packages/x86-64-v3-poky-linux/python3-certifi (sysroot):
  /usr/lib/python3.15/site-packages/certifi-2026.10.23.dist-info moved to /usr/lib/python3.15/site-packages/certifi-2026.11.20.dist-info

--===============0540597804355271724==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-certifi-upgrade-2026.10.23-2026.11.20.patch"

RnJvbSBhMTQ3MzY2MzVjZjhlNDk0ZDMxODhmYTc5NjM4YWI4OTM4M2I3NDY0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMjEgTm92IDIwMjYgMDU6MDc6NTYgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLWNlcnRpZmk6IHVwZ3JhZGUgMjAyNi4xMC4yMyAtPiAyMDI2LjExLjIwCgotLS0KIC4u
LmhvbjMtY2VydGlmaV8yMDI2LjEwLjIzLmJiID0+IHB5dGhvbjMtY2VydGlmaV8yMDI2LjExLjIw
LmJifSB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigt
KQogcmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtY2VydGlmaV8y
MDI2LjEwLjIzLmJiID0+IHB5dGhvbjMtY2VydGlmaV8yMDI2LjExLjIwLmJifSAoODglKQoKZGlm
ZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1jZXJ0aWZpXzIw
MjYuMTAuMjMuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtY2VydGlm
aV8yMDI2LjExLjIwLmJiCnNpbWlsYXJpdHkgaW5kZXggODglCnJlbmFtZSBmcm9tIG1ldGEvcmVj
aXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1jZXJ0aWZpXzIwMjYuMTAuMjMuYmIKcmVuYW1l
IHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1jZXJ0aWZpXzIwMjYuMTEu
MjAuYmIKaW5kZXggMjllMjEzZWYyMi4uOGIyNDQ5ZmIxYiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNp
cGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWNlcnRpZmlfMjAyNi4xMC4yMy5iYgorKysgYi9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtY2VydGlmaV8yMDI2LjExLjIwLmJi
CkBAIC03LDcgKzcsNyBAQCBIT01FUEFHRSA9ICJodHRwOi8vY2VydGlmaS5pby8iCiBMSUNFTlNF
ID0gIk1QTC0yLjAiCiBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFO21kNT0xMTYx
OGNiNmE5NzU5NDg2NzkyODZiMTIxMWJkNTczYyIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gImE5
ODk1ZTZlMjc1OGIzNzFlMDU0NWUzMjFhM2E4ZmQxZmNmZDk4MjlhZGE4ODI0YTkzNmRmYjE2YWFh
ZjM2Y2QiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiYWYxY2IyNDBhODEzM2YxMDVhYTUyNjg0YTNh
MzI1ODMzOWQ3ZjJmZDBiZDRlMjgxMjY5OGZmNWNmNTU4OGM0ZSIKIAogaW5oZXJpdCBweXBpIHB5
dGhvbl9zZXR1cHRvb2xzX2J1aWxkX21ldGEgcHRlc3QtcHl0aG9uLXB5dGVzdAogCi0tIAoyLjQ3
LjEKCg==

--===============0540597804355271724==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-certifi: SRC_URI changed from "https://files.pythonhosted.org/packages/source/c/certifi/certifi-2026.10.23.tar.gz" to "https://files.pythonhosted.org/packages/source/c/certifi/certifi-2026.11.20.tar.gz"
packages/x86-64-v3-poky-linux/python3-certifi: PKGV changed from 2026.10.23 [default] to 2026.11.20 [default]
packages/x86-64-v3-poky-linux/python3-certifi: PV changed from "2026.10.23" to "2026.11.20"
packages/x86-64-v3-poky-linux/python3-certifi/python3-certifi-dbg: PKGV changed from 2026.10.23 [default] to 2026.11.20 [default]
packages/x86-64-v3-poky-linux/python3-certifi/python3-certifi-dbg: PV changed from "2026.10.23" to "2026.11.20"
packages/x86-64-v3-poky-linux/python3-certifi/python3-certifi-dev: PKGV changed from 2026.10.23 [default] to 2026.11.20 [default]
packages/x86-64-v3-poky-linux/python3-certifi/python3-certifi-dev: PV changed from "2026.10.23" to "2026.11.20"
packages/x86-64-v3-poky-linux/python3-certifi/python3-certifi-doc: PKGV changed from 2026.10.23 [default] to 2026.11.20 [default]
packages/x86-64-v3-poky-linux/python3-certifi/python3-certifi-doc: PV changed from "2026.10.23" to "2026.11.20"
packages/x86-64-v3-poky-linux/python3-certifi/python3-certifi-locale: PKGV changed from 2026.10.23 [default] to 2026.11.20 [default]
packages/x86-64-v3-poky-linux/python3-certifi/python3-certifi-locale: PV changed from "2026.10.23" to "2026.11.20"
packages/x86-64-v3-poky-linux/python3-certifi/python3-certifi-ptest: PKGV changed from 2026.10.23 [default] to 2026.11.20 [default]
packages/x86-64-v3-poky-linux/python3-certifi/python3-certifi-ptest: PV changed from "2026.10.23" to "2026.11.20"
packages/x86-64-v3-poky-linux/python3-certifi/python3-certifi-src: PKGV changed from 2026.10.23 [default] to 2026.11.20 [default]
packages/x86-64-v3-poky-linux/python3-certifi/python3-certifi-src: PV changed from "2026.10.23" to "2026.11.20"
packages/x86-64-v3-poky-linux/python3-certifi/python3-certifi-staticdev: PKGV changed from 2026.10.23 [default] to 2026.11.20 [default]
packages/x86-64-v3-poky-linux/python3-certifi/python3-certifi-staticdev: PV changed from "2026.10.23" to "2026.11.20"
packages/x86-64-v3-poky-linux/python3-certifi/python3-certifi: PKGV changed from 2026.10.23 [default] to 2026.11.20 [default]
packages/x86-64-v3-poky-linux/python3-certifi/python3-certifi: FILELIST: directory renamed /usr/lib/python3.15/site-packages/certifi-2026.10.23.dist-info -> /usr/lib/python3.15/site-packages/certifi-2026.11.20.dist-info, directory renamed /usr/lib/python3.15/site-packages/certifi-2026.10.23.dist-info/licenses -> /usr/lib/python3.15/site-packages/certifi-2026.11.20.dist-info/licenses
packages/x86-64-v3-poky-linux/python3-certifi/python3-certifi: PKGSIZE changed from 249718 to 237501 (-5%)
packages/x86-64-v3-poky-linux/python3-certifi/python3-certifi: PV changed from "2026.10.23" to "2026.11.20"
Changes to packages/x86-64-v3-poky-linux/python3-certifi (sysroot):
  /usr/lib/python3.15/site-packages/certifi-2026.10.23.dist-info moved to /usr/lib/python3.15/site-packages/certifi-2026.11.20.dist-info

--===============0540597804355271724==--
