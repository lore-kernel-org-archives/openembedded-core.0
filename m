Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAD03CA0FE1
	for <webhook@archiver.kernel.org>; Fri, 15 Aug 2025 13:07:11 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web11.11320.1755263215402384407
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Aug 2025 06:07:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=m6Hqugb9;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=djzfz83a;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 01010198add74b4b-a634d63b-b09a-4d4d-bd6b-03bef413adb3-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1755263224;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=yWE/KsRIqGWugM1zUzwXjTaSiqbAb0EJgARoe2cQP1I=;
	b=m6Hqugb9Dlhugumid/k9PDxovfrThBGAFqiJJ6hZQI3HHzsKY1m7YM/6hpgBHLUf
	Py4Abe8k5s58eWHSVmlPMzpXMgGClhcUimanfk9c+7O2p/vFXvmCvuZ95GKosPoosrH
	9dZZrDhwEF+Ny7mEmnsQDhTdcBVRuHytVaQtEij0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1755263224;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=yWE/KsRIqGWugM1zUzwXjTaSiqbAb0EJgARoe2cQP1I=;
	b=djzfz83a1CPDwk+ku+5sCQROqmVaoAYmigB4wiJK8Ubs2q717nMLZxL+cNICdPn5
	0aVvBEAjPiVTMsoHWtMb/B89MKexSaDhBwQjhr3ZxngUo0X0dBDskfQh29ToJjueqN1
	EmkeSFgkaEWXUmfbE0AAmWLFbJwSH7PozzdzYnN4=
Content-Type: multipart/mixed; boundary="===============6712011220940456595=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Wang Mingyu <wangmy@fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-click: upgrading to 8.2.2 SUCCEEDED
Message-ID: <01010198add74b4b-a634d63b-b09a-4d4d-bd6b-03bef413adb3-000000@us-west-2.amazonses.com>
Date: Fri, 15 Aug 2025 13:07:04 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.08.15-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Aug 2025 13:07:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221905

--===============6712011220940456595==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-click* to *8.2.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-click-upgrade-8.2.1-8.2.2.patch
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
From 89d9a4da883e4fa86883f365026cf0e2fe3bc015 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 15 Aug 2025 08:55:34 +0000
Subject: [PATCH] python3-click: upgrade 8.2.1 -> 8.2.2

---
 .../python/{python3-click_8.2.1.bb => python3-click_8.2.2.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-click_8.2.1.bb => python3-click_8.2.2.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-click_8.2.1.bb b/meta/recipes-devtools/python/python3-click_8.2.2.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-click_8.2.1.bb
rename to meta/recipes-devtools/python/python3-click_8.2.2.bb
index 0bbc7e8488..9710e8a71c 100644
--- a/meta/recipes-devtools/python/python3-click_8.2.1.bb
+++ b/meta/recipes-devtools/python/python3-click_8.2.2.bb
@@ -8,7 +8,7 @@ HOMEPAGE = "http://click.pocoo.org/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=1fa98232fd645608937a0fdc82e999b8"
 
-SRC_URI[sha256sum] = "27c491cc05d968d271d5a1db13e3b5a184636d9d930f148c50b038f0d0646202"
+SRC_URI[sha256sum] = "068616e6ef9705a07b6db727cb9c248f4eb9dae437a30239f56fa94b18b852ef"
 
 inherit pypi python_flit_core ptest-python-pytest
 
-- 
2.47.1


--===============6712011220940456595==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/python3-click/python3-click-ptest: FILELIST: removed "/usr/lib/python3-click/ptest/docs/contrib.rst /usr/lib/python3-click/ptest/docs/make.bat /usr/lib/python3-click/ptest/docs/virtualenv.rst /usr/lib/python3-click/ptest/docs/_static/click-icon.png /usr/lib/python3-click/ptest/docs/parameters.rst /usr/lib/python3-click/ptest/docs/_static/click-logo.png /usr/lib/python3-click/ptest/docs/documentation.rst /usr/lib/python3-click/ptest/docs/unicode-support.rst /usr/lib/python3-click/ptest/docs/why.rst /usr/lib/python3-click/ptest/docs/utils.rst /usr/lib/python3-click/ptest/docs/wincmd.rst /usr/lib/python3-click/ptest/docs/Makefile /usr/lib/python3-click/ptest/docs/_static/click-logo-sidebar.png", added "/usr/lib/python3-click/ptest/docs/_static/click-icon.svg /usr/lib/python3-click/ptest/docs/unicode-support.md /usr/lib/python3-click/ptest/docs/why.md /usr/lib/python3-click/ptest/docs/support-multiple-versions.md /usr/lib/python3-click/ptest/docs/wincmd.md /u
 sr/lib/python3-click/ptest/docs/_static/click-name.svg /usr/lib/python3-click/ptest/docs/virtualenv.md /usr/lib/python3-click/ptest/docs/documentation.md /usr/lib/python3-click/ptest/docs/contrib.md /usr/lib/python3-click/ptest/docs/utils.md /usr/lib/python3-click/ptest/docs/_static/click-logo.svg /usr/lib/python3-click/ptest/docs/parameters.md"
Changes to packages/core2-64-poky-linux/python3-click (sysroot):
  /usr/lib/python3.13/site-packages/click-8.2.1.dist-info moved to /usr/lib/python3.13/site-packages/click-8.2.2.dist-info

--===============6712011220940456595==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-click: PV changed from "8.2.1" to "8.2.2"
packages/core2-64-poky-linux/python3-click: SRC_URI changed from "https://files.pythonhosted.org/packages/source/c/click/click-8.2.1.tar.gz;downloadfilename=click-8.2.1.tar.gz" to "https://files.pythonhosted.org/packages/source/c/click/click-8.2.2.tar.gz;downloadfilename=click-8.2.2.tar.gz"
packages/core2-64-poky-linux/python3-click: PKGV changed from 8.2.1 [default] to 8.2.2 [default]
packages/core2-64-poky-linux/python3-click/python3-click-dbg: PV changed from "8.2.1" to "8.2.2"
packages/core2-64-poky-linux/python3-click/python3-click-dbg: PKGV changed from 8.2.1 [default] to 8.2.2 [default]
packages/core2-64-poky-linux/python3-click/python3-click-dev: PV changed from "8.2.1" to "8.2.2"
packages/core2-64-poky-linux/python3-click/python3-click-dev: PKGV changed from 8.2.1 [default] to 8.2.2 [default]
packages/core2-64-poky-linux/python3-click/python3-click-doc: PV changed from "8.2.1" to "8.2.2"
packages/core2-64-poky-linux/python3-click/python3-click-doc: PKGV changed from 8.2.1 [default] to 8.2.2 [default]
packages/core2-64-poky-linux/python3-click/python3-click-locale: PV changed from "8.2.1" to "8.2.2"
packages/core2-64-poky-linux/python3-click/python3-click-locale: PKGV changed from 8.2.1 [default] to 8.2.2 [default]
packages/core2-64-poky-linux/python3-click/python3-click-ptest: PV changed from "8.2.1" to "8.2.2"
packages/core2-64-poky-linux/python3-click/python3-click-ptest: PKGSIZE changed from 418448 to 411734 (-2%)
packages/core2-64-poky-linux/python3-click/python3-click-ptest: FILELIST: removed "/usr/lib/python3-click/ptest/docs/why.rst /usr/lib/python3-click/ptest/docs/_static/click-logo-sidebar.png /usr/lib/python3-click/ptest/docs/documentation.rst /usr/lib/python3-click/ptest/docs/virtualenv.rst /usr/lib/python3-click/ptest/docs/parameters.rst /usr/lib/python3-click/ptest/docs/make.bat /usr/lib/python3-click/ptest/docs/contrib.rst /usr/lib/python3-click/ptest/docs/wincmd.rst /usr/lib/python3-click/ptest/docs/Makefile /usr/lib/python3-click/ptest/docs/unicode-support.rst /usr/lib/python3-click/ptest/docs/_static/click-logo.png /usr/lib/python3-click/ptest/docs/utils.rst /usr/lib/python3-click/ptest/docs/_static/click-icon.png", added "/usr/lib/python3-click/ptest/docs/why.md /usr/lib/python3-click/ptest/docs/_static/click-icon.svg /usr/lib/python3-click/ptest/docs/wincmd.md /usr/lib/python3-click/ptest/docs/virtualenv.md /usr/lib/python3-click/ptest/docs/contrib.md /usr/lib/python3-click/pt
 est/docs/parameters.md /usr/lib/python3-click/ptest/docs/support-multiple-versions.md /usr/lib/python3-click/ptest/docs/utils.md /usr/lib/python3-click/ptest/docs/_static/click-name.svg /usr/lib/python3-click/ptest/docs/unicode-support.md /usr/lib/python3-click/ptest/docs/documentation.md /usr/lib/python3-click/ptest/docs/_static/click-logo.svg"
packages/core2-64-poky-linux/python3-click/python3-click-ptest: PKGV changed from 8.2.1 [default] to 8.2.2 [default]
packages/core2-64-poky-linux/python3-click/python3-click-src: PV changed from "8.2.1" to "8.2.2"
packages/core2-64-poky-linux/python3-click/python3-click-src: PKGV changed from 8.2.1 [default] to 8.2.2 [default]
packages/core2-64-poky-linux/python3-click/python3-click-staticdev: PV changed from "8.2.1" to "8.2.2"
packages/core2-64-poky-linux/python3-click/python3-click-staticdev: PKGV changed from 8.2.1 [default] to 8.2.2 [default]
packages/core2-64-poky-linux/python3-click/python3-click: PV changed from "8.2.1" to "8.2.2"
packages/core2-64-poky-linux/python3-click/python3-click: PKGSIZE changed from 801292 to 809363 (+1%)
packages/core2-64-poky-linux/python3-click/python3-click: PKGV changed from 8.2.1 [default] to 8.2.2 [default]
Changes to packages/core2-64-poky-linux/python3-click (sysroot):
  /usr/lib/python3.13/site-packages/click-8.2.1.dist-info moved to /usr/lib/python3.13/site-packages/click-8.2.2.dist-info

--===============6712011220940456595==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-click-upgrade-8.2.1-8.2.2.patch"

RnJvbSA4OWQ5YTRkYTg4M2U0ZmE4Njg4M2YzNjUwMjZjZjBlMmZlM2JjMDE1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMTUgQXVnIDIwMjUgMDg6NTU6MzQgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLWNsaWNrOiB1cGdyYWRlIDguMi4xIC0+IDguMi4yCgotLS0KIC4uLi9weXRob24ve3B5
dGhvbjMtY2xpY2tfOC4yLjEuYmIgPT4gcHl0aG9uMy1jbGlja184LjIuMi5iYn0gICB8IDIgKy0K
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1l
dGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtY2xpY2tfOC4yLjEuYmIgPT4gcHl0
aG9uMy1jbGlja184LjIuMi5iYn0gKDkxJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvcHl0aG9uL3B5dGhvbjMtY2xpY2tfOC4yLjEuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcHl0aG9uL3B5dGhvbjMtY2xpY2tfOC4yLjIuYmIKc2ltaWxhcml0eSBpbmRleCA5MSUKcmVu
YW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWNsaWNrXzguMi4x
LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtY2xpY2tf
OC4yLjIuYmIKaW5kZXggMGJiYzdlODQ4OC4uOTcxMGU4YTcxYyAxMDA2NDQKLS0tIGEvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWNsaWNrXzguMi4xLmJiCisrKyBiL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1jbGlja184LjIuMi5iYgpAQCAtOCw3ICs4
LDcgQEAgSE9NRVBBR0UgPSAiaHR0cDovL2NsaWNrLnBvY29vLm9yZy8iCiBMSUNFTlNFID0gIkJT
RC0zLUNsYXVzZSIKIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0UudHh0O21kNT0x
ZmE5ODIzMmZkNjQ1NjA4OTM3YTBmZGM4MmU5OTliOCIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0g
IjI3YzQ5MWNjMDVkOTY4ZDI3MWQ1YTFkYjEzZTNiNWExODQ2MzZkOWQ5MzBmMTQ4YzUwYjAzOGYw
ZDA2NDYyMDIiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiMDY4NjE2ZTZlZjk3MDVhMDdiNmRiNzI3
Y2I5YzI0OGY0ZWI5ZGFlNDM3YTMwMjM5ZjU2ZmE5NGIxOGI4NTJlZiIKIAogaW5oZXJpdCBweXBp
IHB5dGhvbl9mbGl0X2NvcmUgcHRlc3QtcHl0aG9uLXB5dGVzdAogCi0tIAoyLjQ3LjEKCg==

--===============6712011220940456595==--

