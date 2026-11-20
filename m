Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1165.1795158390666771370
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Nov 2026 23:06:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=SOP1YHdY;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=HKDuZS8d;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 010101a1f7c733be-cf82fdfc-113a-406f-9c90-300d4a8d5a98-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1795158389;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=tMtgvtCeoEHtL4v800LhCOoo48OHPFzXKvoMJ7avkUQ=;
	b=SOP1YHdY1PdUdKNZVN6pAnkrIrvfCO8zRUGa9fjwQRjuVAV4xqLamyTKM7UxSiyi
	qkIvm0iD5fQXI0ju47NhqQgn0/RPvxt6Tf4kykG1uieQzQwDrOx+ygZBg32O1nY6A2x
	K1dpspNYz+06oSuopRXJCzU73h6ozPpaJzPNZsqA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1795158389;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=tMtgvtCeoEHtL4v800LhCOoo48OHPFzXKvoMJ7avkUQ=;
	b=HKDuZS8dfh6Zeu6oZYlB3thOUWoSpVBiCVoRn64bsUljUaDb84VpOXR/FwKfQtsk
	RNoJtgpZpZK9m/vdSWh3G3I7Iuc6Kx/vSnE2gohPjspTUe/V9iX4dthi8CbfORW0IB6
	RAGEz4vGDrcqjtnPfpJtBRP77C80EZkmtZNlwoDU=
Content-Type: multipart/mixed; boundary="===============0987175510860123740=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Marta Rybczynska <marta.rybczynska@ygreky.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-uritools: upgrading to 7.0.1 SUCCEEDED
Message-ID: <010101a1f7c733be-cf82fdfc-113a-406f-9c90-300d4a8d5a98-000000@us-west-2.amazonses.com>
Date: Fri, 20 Nov 2026 07:06:29 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.11.20-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 20 Nov 2026 07:06:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250733

--===============0987175510860123740==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-uritools* to *7.0.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-uritools-upgrade-7.0.0-7.0.1.patch
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
From 0aec0cf8d8e49920141cf51de5e5a9ea86239057 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 20 Nov 2026 05:57:38 +0000
Subject: [PATCH] python3-uritools: upgrade 7.0.0 -> 7.0.1

v7.0.1 (2026-11-19)
===================

- Remove percent-encoded dot-segments in ``SplitResult.getpath()``.
- Minor performance improvements.
- Update build environment.

- Add URI classification methods and functions.
  objects from ``SplitResult.gethost()`` instead.
- Add ``SplitResult.getquerylist()`` and
  ``SplitResult.getquerydict()``.
---
 .../{python3-uritools_7.0.0.bb => python3-uritools_7.0.1.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-uritools_7.0.0.bb => python3-uritools_7.0.1.bb} (79%)

diff --git a/meta/recipes-devtools/python/python3-uritools_7.0.0.bb b/meta/recipes-devtools/python/python3-uritools_7.0.1.bb
similarity index 79%
rename from meta/recipes-devtools/python/python3-uritools_7.0.0.bb
rename to meta/recipes-devtools/python/python3-uritools_7.0.1.bb
index a19949c721..bbec6607a3 100644
--- a/meta/recipes-devtools/python/python3-uritools_7.0.0.bb
+++ b/meta/recipes-devtools/python/python3-uritools_7.0.1.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/tkem/uritools/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=079933dfba36eb60b5e3512ca0ab61ae"
 
-SRC_URI[sha256sum] = "110b773e3f8fbaebcdcbe1377d04e418b1985adf69deeca4ed569f3e328cbf48"
+SRC_URI[sha256sum] = "abf09f899b925fad05407d7f39061318c6be62cce065db727a024daadf96eebf"
 
 inherit pypi python_setuptools_build_meta ptest-python-pytest
 
-- 
2.47.1


--===============0987175510860123740==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-uritools: SRC_URI changed from "https://files.pythonhosted.org/packages/source/u/uritools/uritools-7.0.0.tar.gz" to "https://files.pythonhosted.org/packages/source/u/uritools/uritools-7.0.1.tar.gz"
packages/x86-64-v3-poky-linux/python3-uritools: PKGV changed from 7.0.0 [default] to 7.0.1 [default]
packages/x86-64-v3-poky-linux/python3-uritools: PV changed from "7.0.0" to "7.0.1"
packages/x86-64-v3-poky-linux/python3-uritools/python3-uritools-dbg: PKGV changed from 7.0.0 [default] to 7.0.1 [default]
packages/x86-64-v3-poky-linux/python3-uritools/python3-uritools-dbg: PV changed from "7.0.0" to "7.0.1"
packages/x86-64-v3-poky-linux/python3-uritools/python3-uritools-dev: PKGV changed from 7.0.0 [default] to 7.0.1 [default]
packages/x86-64-v3-poky-linux/python3-uritools/python3-uritools-dev: PV changed from "7.0.0" to "7.0.1"
packages/x86-64-v3-poky-linux/python3-uritools/python3-uritools-doc: PKGV changed from 7.0.0 [default] to 7.0.1 [default]
packages/x86-64-v3-poky-linux/python3-uritools/python3-uritools-doc: PV changed from "7.0.0" to "7.0.1"
packages/x86-64-v3-poky-linux/python3-uritools/python3-uritools-locale: PKGV changed from 7.0.0 [default] to 7.0.1 [default]
packages/x86-64-v3-poky-linux/python3-uritools/python3-uritools-locale: PV changed from "7.0.0" to "7.0.1"
packages/x86-64-v3-poky-linux/python3-uritools/python3-uritools-ptest: PKGV changed from 7.0.0 [default] to 7.0.1 [default]
packages/x86-64-v3-poky-linux/python3-uritools/python3-uritools-ptest: PV changed from "7.0.0" to "7.0.1"
packages/x86-64-v3-poky-linux/python3-uritools/python3-uritools-ptest: PKGSIZE changed from 58857 to 59293 (+1%)
packages/x86-64-v3-poky-linux/python3-uritools/python3-uritools-src: PKGV changed from 7.0.0 [default] to 7.0.1 [default]
packages/x86-64-v3-poky-linux/python3-uritools/python3-uritools-src: PV changed from "7.0.0" to "7.0.1"
packages/x86-64-v3-poky-linux/python3-uritools/python3-uritools-staticdev: PKGV changed from 7.0.0 [default] to 7.0.1 [default]
packages/x86-64-v3-poky-linux/python3-uritools/python3-uritools-staticdev: PV changed from "7.0.0" to "7.0.1"
packages/x86-64-v3-poky-linux/python3-uritools/python3-uritools: PKGV changed from 7.0.0 [default] to 7.0.1 [default]
packages/x86-64-v3-poky-linux/python3-uritools/python3-uritools: FILELIST: directory renamed /usr/lib/python3.15/site-packages/uritools-7.0.0.dist-info -> /usr/lib/python3.15/site-packages/uritools-7.0.1.dist-info, directory renamed /usr/lib/python3.15/site-packages/uritools-7.0.0.dist-info/licenses -> /usr/lib/python3.15/site-packages/uritools-7.0.1.dist-info/licenses
packages/x86-64-v3-poky-linux/python3-uritools/python3-uritools: PV changed from "7.0.0" to "7.0.1"
packages/x86-64-v3-poky-linux/python3-uritools/python3-uritools: PKGSIZE changed from 76377 to 79163 (+4%)
Changes to packages/x86-64-v3-poky-linux/python3-uritools (sysroot):
  /usr/lib/python3.15/site-packages/uritools-7.0.0.dist-info moved to /usr/lib/python3.15/site-packages/uritools-7.0.1.dist-info

--===============0987175510860123740==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-uritools-upgrade-7.0.0-7.0.1.patch"

RnJvbSAwYWVjMGNmOGQ4ZTQ5OTIwMTQxY2Y1MWRlNWU1YTllYTg2MjM5MDU3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMjAgTm92IDIwMjYgMDU6NTc6MzggKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXVyaXRvb2xzOiB1cGdyYWRlIDcuMC4wIC0+IDcuMC4xCgp2Ny4wLjEgKDIwMjYtMTEt
MTkpCj09PT09PT09PT09PT09PT09PT0KCi0gUmVtb3ZlIHBlcmNlbnQtZW5jb2RlZCBkb3Qtc2Vn
bWVudHMgaW4gYGBTcGxpdFJlc3VsdC5nZXRwYXRoKClgYC4KLSBNaW5vciBwZXJmb3JtYW5jZSBp
bXByb3ZlbWVudHMuCi0gVXBkYXRlIGJ1aWxkIGVudmlyb25tZW50LgoKLSBBZGQgVVJJIGNsYXNz
aWZpY2F0aW9uIG1ldGhvZHMgYW5kIGZ1bmN0aW9ucy4KICBvYmplY3RzIGZyb20gYGBTcGxpdFJl
c3VsdC5nZXRob3N0KClgYCBpbnN0ZWFkLgotIEFkZCBgYFNwbGl0UmVzdWx0LmdldHF1ZXJ5bGlz
dCgpYGAgYW5kCiAgYGBTcGxpdFJlc3VsdC5nZXRxdWVyeWRpY3QoKWBgLgotLS0KIC4uLi97cHl0
aG9uMy11cml0b29sc183LjAuMC5iYiA9PiBweXRob24zLXVyaXRvb2xzXzcuMC4xLmJifSAgICB8
IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVu
YW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtdXJpdG9vbHNfNy4wLjAu
YmIgPT4gcHl0aG9uMy11cml0b29sc183LjAuMS5iYn0gKDc5JSkKCmRpZmYgLS1naXQgYS9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtdXJpdG9vbHNfNy4wLjAuYmIgYi9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtdXJpdG9vbHNfNy4wLjEuYmIKc2ltaWxh
cml0eSBpbmRleCA3OSUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9w
eXRob24zLXVyaXRvb2xzXzcuMC4wLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMv
cHl0aG9uL3B5dGhvbjMtdXJpdG9vbHNfNy4wLjEuYmIKaW5kZXggYTE5OTQ5YzcyMS4uYmJlYzY2
MDdhMyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXVy
aXRvb2xzXzcuMC4wLmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9u
My11cml0b29sc183LjAuMS5iYgpAQCAtNCw3ICs0LDcgQEAgSE9NRVBBR0UgPSAiaHR0cHM6Ly9n
aXRodWIuY29tL3RrZW0vdXJpdG9vbHMvIgogTElDRU5TRSA9ICJNSVQiCiBMSUNfRklMRVNfQ0hL
U1VNID0gImZpbGU6Ly9MSUNFTlNFO21kNT0wNzk5MzNkZmJhMzZlYjYwYjVlMzUxMmNhMGFiNjFh
ZSIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjExMGI3NzNlM2Y4ZmJhZWJjZGNiZTEzNzdkMDRl
NDE4YjE5ODVhZGY2OWRlZWNhNGVkNTY5ZjNlMzI4Y2JmNDgiCitTUkNfVVJJW3NoYTI1NnN1bV0g
PSAiYWJmMDlmODk5YjkyNWZhZDA1NDA3ZDdmMzkwNjEzMThjNmJlNjJjY2UwNjVkYjcyN2EwMjRk
YWFkZjk2ZWViZiIKIAogaW5oZXJpdCBweXBpIHB5dGhvbl9zZXR1cHRvb2xzX2J1aWxkX21ldGEg
cHRlc3QtcHl0aG9uLXB5dGVzdAogCi0tIAoyLjQ3LjEKCg==

--===============0987175510860123740==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="python3-uritools-changelog.txt"

v7.0.1 (2026-11-19)
===================

- Remove percent-encoded dot-segments in ``SplitResult.getpath()``.
- Minor performance improvements.
- Update build environment.

- Add URI classification methods and functions.
  objects from ``SplitResult.gethost()`` instead.
- Add ``SplitResult.getquerylist()`` and
  ``SplitResult.getquerydict()``.

--===============0987175510860123740==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-uritools/python3-uritools: FILELIST: directory renamed /usr/lib/python3.15/site-packages/uritools-7.0.0.dist-info/licenses -> /usr/lib/python3.15/site-packages/uritools-7.0.1.dist-info/licenses, directory renamed /usr/lib/python3.15/site-packages/uritools-7.0.0.dist-info -> /usr/lib/python3.15/site-packages/uritools-7.0.1.dist-info
Changes to packages/x86-64-v3-poky-linux/python3-uritools (sysroot):
  /usr/lib/python3.15/site-packages/uritools-7.0.0.dist-info moved to /usr/lib/python3.15/site-packages/uritools-7.0.1.dist-info

--===============0987175510860123740==--
