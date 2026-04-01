Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3FEF10FCAE6
	for <webhook@archiver.kernel.org>; Wed,  1 Apr 2026 14:36:07 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14755.1775054162312399014
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Apr 2026 07:36:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=W8GuLFdS;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=vX8+fi8L;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101019d497908cd-21a4e0b0-c52e-4a03-8ede-9fa0dde9f381-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1775054162;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=EiEgEiauyDRCU8dBXGXYB5+1b4VO8JWdZUqmVr2Ge+c=;
	b=W8GuLFdSBQ3OoWzqyD4Bl9QR6ZjAd+OXcHNcKhb2xjXvQlp5MKtgcP2IRbMYM0AX
	zY8Bp7+nrXRm96HaYKSpWLB4jIrNzqQR5+1dkhn1mCGRY5vETk3crWkYFtEmZK4/0cC
	w+gCzt04YDvB+ANCGvGgavlI5H0CmLcIMgGk3pcY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1775054162;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=EiEgEiauyDRCU8dBXGXYB5+1b4VO8JWdZUqmVr2Ge+c=;
	b=vX8+fi8L7ODbdrmkkY3dXWMpeAtjuo5nl0hNKskgHnIv9TIxxcWaGbwuLtFX6Q0O
	ZWCfHRBOEinlghBiBtMAa93QnDNg0JjF8qaEsrMP/r3828WR2h8SUnmFwXVn5JcQBXH
	HbHMh1Yemc6F8/EM3psQWfOu5q4h83IvBliYvQ+U=
Content-Type: multipart/mixed; boundary="===============2369559292146221764=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-pyasn1: upgrading to 0.6.3 SUCCEEDED
Message-ID: <0101019d497908cd-21a4e0b0-c52e-4a03-8ede-9fa0dde9f381-000000@us-west-2.amazonses.com>
Date: Wed, 1 Apr 2026 14:36:02 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.04.01-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Apr 2026 14:36:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234381

--===============2369559292146221764==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-pyasn1* to *0.6.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-pyasn1-upgrade-0.6.2-0.6.3.patch
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
From 6474fea688bcfa58546bd38306372f5de22b6a3e Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 1 Apr 2026 10:12:57 +0000
Subject: [PATCH] python3-pyasn1: upgrade 0.6.2 -> 0.6.3

---
 .../python/{python3-pyasn1_0.6.2.bb => python3-pyasn1_0.6.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pyasn1_0.6.2.bb => python3-pyasn1_0.6.3.bb} (82%)

diff --git a/meta/recipes-devtools/python/python3-pyasn1_0.6.2.bb b/meta/recipes-devtools/python/python3-pyasn1_0.6.3.bb
similarity index 82%
rename from meta/recipes-devtools/python/python3-pyasn1_0.6.2.bb
rename to meta/recipes-devtools/python/python3-pyasn1_0.6.3.bb
index 01157e251e..fb572d9da4 100644
--- a/meta/recipes-devtools/python/python3-pyasn1_0.6.2.bb
+++ b/meta/recipes-devtools/python/python3-pyasn1_0.6.3.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://pyasn1.sourceforge.net/"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=190f79253908c986e6cacf380c3a5f6d"
 
-SRC_URI[sha256sum] = "9b59a2b25ba7e4f8197db7686c09fb33e658b98339fadb826e9512629017833b"
+SRC_URI[sha256sum] = "697a8ecd6d98891189184ca1fa05d1bb00e2f84b5977c481452050549c8a72cf"
 
 inherit pypi python_setuptools_build_meta ptest-python-pytest
 
-- 
2.47.1


--===============2369559292146221764==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-pyasn1/python3-pyasn1: FILELIST: directory renamed /usr/lib/python3.14/site-packages/pyasn1-0.6.2.dist-info/licenses -> /usr/lib/python3.14/site-packages/pyasn1-0.6.3.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/pyasn1-0.6.2.dist-info -> /usr/lib/python3.14/site-packages/pyasn1-0.6.3.dist-info
Changes to packages/x86-64-v3-poky-linux/python3-pyasn1 (sysroot):
  /usr/lib/python3.14/site-packages/pyasn1-0.6.2.dist-info moved to /usr/lib/python3.14/site-packages/pyasn1-0.6.3.dist-info

--===============2369559292146221764==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-pyasn1-upgrade-0.6.2-0.6.3.patch"

RnJvbSA2NDc0ZmVhNjg4YmNmYTU4NTQ2YmQzODMwNjM3MmY1ZGUyMmI2YTNlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBBcHIgMjAyNiAxMDoxMjo1NyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtcHlhc24xOiB1cGdyYWRlIDAuNi4yIC0+IDAuNi4zCgotLS0KIC4uLi9weXRob24ve3B5
dGhvbjMtcHlhc24xXzAuNi4yLmJiID0+IHB5dGhvbjMtcHlhc24xXzAuNi4zLmJifSB8IDIgKy0K
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1l
dGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtcHlhc24xXzAuNi4yLmJiID0+IHB5
dGhvbjMtcHlhc24xXzAuNi4zLmJifSAoODIlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9weXRob24vcHl0aG9uMy1weWFzbjFfMC42LjIuYmIgYi9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvcHl0aG9uL3B5dGhvbjMtcHlhc24xXzAuNi4zLmJiCnNpbWlsYXJpdHkgaW5kZXggODIl
CnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1weWFzbjFf
MC42LjIuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1w
eWFzbjFfMC42LjMuYmIKaW5kZXggMDExNTdlMjUxZS4uZmI1NzJkOWRhNCAxMDA2NDQKLS0tIGEv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXB5YXNuMV8wLjYuMi5iYgorKysg
Yi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcHlhc24xXzAuNi4zLmJiCkBA
IC0zLDcgKzMsNyBAQCBIT01FUEFHRSA9ICJodHRwOi8vcHlhc24xLnNvdXJjZWZvcmdlLm5ldC8i
CiBMSUNFTlNFID0gIkJTRC0yLUNsYXVzZSIKIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJ
Q0VOU0UucnN0O21kNT0xOTBmNzkyNTM5MDhjOTg2ZTZjYWNmMzgwYzNhNWY2ZCIKIAotU1JDX1VS
SVtzaGEyNTZzdW1dID0gIjliNTlhMmIyNWJhN2U0ZjgxOTdkYjc2ODZjMDlmYjMzZTY1OGI5ODMz
OWZhZGI4MjZlOTUxMjYyOTAxNzgzM2IiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiNjk3YThlY2Q2
ZDk4ODkxMTg5MTg0Y2ExZmEwNWQxYmIwMGUyZjg0YjU5NzdjNDgxNDUyMDUwNTQ5YzhhNzJjZiIK
IAogaW5oZXJpdCBweXBpIHB5dGhvbl9zZXR1cHRvb2xzX2J1aWxkX21ldGEgcHRlc3QtcHl0aG9u
LXB5dGVzdAogCi0tIAoyLjQ3LjEKCg==

--===============2369559292146221764==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-pyasn1: PV changed from "0.6.2" to "0.6.3"
packages/x86-64-v3-poky-linux/python3-pyasn1: SRC_URI changed from "https://files.pythonhosted.org/packages/source/p/pyasn1/pyasn1-0.6.2.tar.gz;downloadfilename=pyasn1-0.6.2.tar.gz" to "https://files.pythonhosted.org/packages/source/p/pyasn1/pyasn1-0.6.3.tar.gz;downloadfilename=pyasn1-0.6.3.tar.gz"
packages/x86-64-v3-poky-linux/python3-pyasn1: PKGV changed from 0.6.2 [default] to 0.6.3 [default]
packages/x86-64-v3-poky-linux/python3-pyasn1/python3-pyasn1-dbg: PV changed from "0.6.2" to "0.6.3"
packages/x86-64-v3-poky-linux/python3-pyasn1/python3-pyasn1-dbg: PKGV changed from 0.6.2 [default] to 0.6.3 [default]
packages/x86-64-v3-poky-linux/python3-pyasn1/python3-pyasn1-dev: PV changed from "0.6.2" to "0.6.3"
packages/x86-64-v3-poky-linux/python3-pyasn1/python3-pyasn1-dev: PKGV changed from 0.6.2 [default] to 0.6.3 [default]
packages/x86-64-v3-poky-linux/python3-pyasn1/python3-pyasn1-doc: PV changed from "0.6.2" to "0.6.3"
packages/x86-64-v3-poky-linux/python3-pyasn1/python3-pyasn1-doc: PKGV changed from 0.6.2 [default] to 0.6.3 [default]
packages/x86-64-v3-poky-linux/python3-pyasn1/python3-pyasn1-locale: PV changed from "0.6.2" to "0.6.3"
packages/x86-64-v3-poky-linux/python3-pyasn1/python3-pyasn1-locale: PKGV changed from 0.6.2 [default] to 0.6.3 [default]
packages/x86-64-v3-poky-linux/python3-pyasn1/python3-pyasn1-ptest: PV changed from "0.6.2" to "0.6.3"
packages/x86-64-v3-poky-linux/python3-pyasn1/python3-pyasn1-ptest: PKGV changed from 0.6.2 [default] to 0.6.3 [default]
packages/x86-64-v3-poky-linux/python3-pyasn1/python3-pyasn1-ptest: PKGSIZE changed from 323993 to 334694 (+3%)
packages/x86-64-v3-poky-linux/python3-pyasn1/python3-pyasn1-src: PV changed from "0.6.2" to "0.6.3"
packages/x86-64-v3-poky-linux/python3-pyasn1/python3-pyasn1-src: PKGV changed from 0.6.2 [default] to 0.6.3 [default]
packages/x86-64-v3-poky-linux/python3-pyasn1/python3-pyasn1-staticdev: PV changed from "0.6.2" to "0.6.3"
packages/x86-64-v3-poky-linux/python3-pyasn1/python3-pyasn1-staticdev: PKGV changed from 0.6.2 [default] to 0.6.3 [default]
packages/x86-64-v3-poky-linux/python3-pyasn1/python3-pyasn1: PV changed from "0.6.2" to "0.6.3"
packages/x86-64-v3-poky-linux/python3-pyasn1/python3-pyasn1: FILELIST: directory renamed /usr/lib/python3.14/site-packages/pyasn1-0.6.2.dist-info -> /usr/lib/python3.14/site-packages/pyasn1-0.6.3.dist-info, directory renamed /usr/lib/python3.14/site-packages/pyasn1-0.6.2.dist-info/licenses -> /usr/lib/python3.14/site-packages/pyasn1-0.6.3.dist-info/licenses
packages/x86-64-v3-poky-linux/python3-pyasn1/python3-pyasn1: PKGV changed from 0.6.2 [default] to 0.6.3 [default]
packages/x86-64-v3-poky-linux/python3-pyasn1/python3-pyasn1: PKGSIZE changed from 828548 to 830153 (+0%)
Changes to packages/x86-64-v3-poky-linux/python3-pyasn1 (sysroot):
  /usr/lib/python3.14/site-packages/pyasn1-0.6.2.dist-info moved to /usr/lib/python3.14/site-packages/pyasn1-0.6.3.dist-info

--===============2369559292146221764==--

