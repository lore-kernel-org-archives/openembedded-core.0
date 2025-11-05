Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C4F9CD13D3
	for <webhook@archiver.kernel.org>; Wed,  5 Nov 2025 23:16:24 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2358.1762384582025820205
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Nov 2025 15:16:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=eP05tMk4;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=kI+sBjHz;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101019a564e9379-36193f82-0285-4873-9e08-0fcb98f2474c-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1762384581;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=TlMCv9okHAVwrglmdZzDblnHbHA5Rd0jFQhrogM9Km8=;
	b=eP05tMk4NVcFgOd6uQHGvaxeNR9/fCJ9VSLJU8gmiB+4+YhtcoSJVlQmOBMjeRiV
	NiPrhbfoYolrJR7Qy2CW4ZzGvsuLPAn5TkHsT0PPCMCz+cXATfdLj863vrkj/7SSYrX
	1zjROnHAkhLLAIgSA9SiJ6ly00o5qfJUbyfsJids=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1762384581;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=TlMCv9okHAVwrglmdZzDblnHbHA5Rd0jFQhrogM9Km8=;
	b=kI+sBjHzcU4sbfZlWzW4FCXxNroU36bL24GB07VKahG9CUYI8ATFkXgvi4Tilj0P
	zHsA0xy9Sv8M48WB0wX6Igj/bx7T8VcZHeTAbSlRxID5zm7s76F/LBBXyPuBiy6bEJ5
	OQ043fluPXGW+xZeqsw8YzAfYGEpMKtS5rqKN0g8=
Content-Type: multipart/mixed; boundary="===============6472684920519014338=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-certifi: upgrading to 2025.10.5 SUCCEEDED
Message-ID: <0101019a564e9379-36193f82-0285-4873-9e08-0fcb98f2474c-000000@us-west-2.amazonses.com>
Date: Wed, 5 Nov 2025 23:16:21 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.11.05-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Nov 2025 23:16:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225820

--===============6472684920519014338==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-certifi* to *2025.10.5* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-certifi-upgrade-2025.8.3-2025.10.5.patch
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
From 91d03f82848287274eca6796b76438fe2a9af77e Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 5 Nov 2025 16:44:27 +0000
Subject: [PATCH] python3-certifi: upgrade 2025.8.3 -> 2025.10.5

---
 ...python3-certifi_2025.8.3.bb => python3-certifi_2025.10.5.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-certifi_2025.8.3.bb => python3-certifi_2025.10.5.bb} (87%)

diff --git a/meta/recipes-devtools/python/python3-certifi_2025.8.3.bb b/meta/recipes-devtools/python/python3-certifi_2025.10.5.bb
similarity index 87%
rename from meta/recipes-devtools/python/python3-certifi_2025.8.3.bb
rename to meta/recipes-devtools/python/python3-certifi_2025.10.5.bb
index d3e842b4bd..da93fde793 100644
--- a/meta/recipes-devtools/python/python3-certifi_2025.8.3.bb
+++ b/meta/recipes-devtools/python/python3-certifi_2025.10.5.bb
@@ -7,7 +7,7 @@ HOMEPAGE = " http://certifi.io/"
 LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=11618cb6a975948679286b1211bd573c"
 
-SRC_URI[sha256sum] = "e564105f78ded564e3ae7c923924435e1daa7463faeab5bb932bc53ffae63407"
+SRC_URI[sha256sum] = "47c09d31ccf2acf0be3f701ea53595ee7e0b8fa08801c6624be771df09ae7b43"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.47.1


--===============6472684920519014338==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/x86-64-v3-poky-linux/python3-certifi (sysroot):
  /usr/lib/python3.13/site-packages/certifi-2025.10.5.dist-info was added
  /usr/lib/python3.13/site-packages/certifi-2025.10.5.dist-info/licenses was added
  /usr/lib/python3.13/site-packages/certifi-2025.10.5.dist-info/licenses/LICENSE was added
  /usr/lib/python3.13/site-packages/certifi-2025.10.5.dist-info/METADATA was added
  /usr/lib/python3.13/site-packages/certifi-2025.10.5.dist-info/top_level.txt was added
  /usr/lib/python3.13/site-packages/certifi-2025.10.5.dist-info/WHEEL was added
  /usr/lib/python3.13/site-packages/certifi-2025.8.3.dist-info was removed
  /usr/lib/python3.13/site-packages/certifi-2025.8.3.dist-info/licenses was removed
  /usr/lib/python3.13/site-packages/certifi-2025.8.3.dist-info/licenses/LICENSE was removed
  /usr/lib/python3.13/site-packages/certifi-2025.8.3.dist-info/METADATA was removed
  /usr/lib/python3.13/site-packages/certifi-2025.8.3.dist-info/top_level.txt was removed
  /usr/lib/python3.13/site-packages/certifi-2025.8.3.dist-info/WHEEL was removed

--===============6472684920519014338==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-certifi-upgrade-2025.8.3-2025.10.5.patch"

RnJvbSA5MWQwM2Y4Mjg0ODI4NzI3NGVjYTY3OTZiNzY0MzhmZTJhOWFmNzdlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgNSBOb3YgMjAyNSAxNjo0NDoyNyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtY2VydGlmaTogdXBncmFkZSAyMDI1LjguMyAtPiAyMDI1LjEwLjUKCi0tLQogLi4ucHl0
aG9uMy1jZXJ0aWZpXzIwMjUuOC4zLmJiID0+IHB5dGhvbjMtY2VydGlmaV8yMDI1LjEwLjUuYmJ9
IHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiBy
ZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1jZXJ0aWZpXzIwMjUu
OC4zLmJiID0+IHB5dGhvbjMtY2VydGlmaV8yMDI1LjEwLjUuYmJ9ICg4NyUpCgpkaWZmIC0tZ2l0
IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWNlcnRpZmlfMjAyNS44LjMu
YmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtY2VydGlmaV8yMDI1LjEw
LjUuYmIKc2ltaWxhcml0eSBpbmRleCA4NyUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3B5dGhvbi9weXRob24zLWNlcnRpZmlfMjAyNS44LjMuYmIKcmVuYW1lIHRvIG1ldGEvcmVj
aXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1jZXJ0aWZpXzIwMjUuMTAuNS5iYgppbmRleCBk
M2U4NDJiNGJkLi5kYTkzZmRlNzkzIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
cHl0aG9uL3B5dGhvbjMtY2VydGlmaV8yMDI1LjguMy5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvcHl0aG9uL3B5dGhvbjMtY2VydGlmaV8yMDI1LjEwLjUuYmIKQEAgLTcsNyArNyw3IEBA
IEhPTUVQQUdFID0gIiBodHRwOi8vY2VydGlmaS5pby8iCiBMSUNFTlNFID0gIklTQyIKIExJQ19G
SUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0U7bWQ1PTExNjE4Y2I2YTk3NTk0ODY3OTI4NmIx
MjExYmQ1NzNjIgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiZTU2NDEwNWY3OGRlZDU2NGUzYWU3
YzkyMzkyNDQzNWUxZGFhNzQ2M2ZhZWFiNWJiOTMyYmM1M2ZmYWU2MzQwNyIKK1NSQ19VUklbc2hh
MjU2c3VtXSA9ICI0N2MwOWQzMWNjZjJhY2YwYmUzZjcwMWVhNTM1OTVlZTdlMGI4ZmEwODgwMWM2
NjI0YmU3NzFkZjA5YWU3YjQzIgogCiBpbmhlcml0IHB5cGkgcHl0aG9uX3NldHVwdG9vbHNfYnVp
bGRfbWV0YQogCi0tIAoyLjQ3LjEKCg==

--===============6472684920519014338==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-certifi: SRC_URI changed from "https://files.pythonhosted.org/packages/source/c/certifi/certifi-2025.8.3.tar.gz;downloadfilename=certifi-2025.8.3.tar.gz" to "https://files.pythonhosted.org/packages/source/c/certifi/certifi-2025.10.5.tar.gz;downloadfilename=certifi-2025.10.5.tar.gz"
packages/x86-64-v3-poky-linux/python3-certifi: PKGV changed from 2025.8.3 [default] to 2025.10.5 [default]
packages/x86-64-v3-poky-linux/python3-certifi: PV changed from "2025.8.3" to "2025.10.5"
packages/x86-64-v3-poky-linux/python3-certifi/python3-certifi-dbg: PKGV changed from 2025.8.3 [default] to 2025.10.5 [default]
packages/x86-64-v3-poky-linux/python3-certifi/python3-certifi-dbg: PV changed from "2025.8.3" to "2025.10.5"
packages/x86-64-v3-poky-linux/python3-certifi/python3-certifi-dev: PKGV changed from 2025.8.3 [default] to 2025.10.5 [default]
packages/x86-64-v3-poky-linux/python3-certifi/python3-certifi-dev: PV changed from "2025.8.3" to "2025.10.5"
packages/x86-64-v3-poky-linux/python3-certifi/python3-certifi-doc: PKGV changed from 2025.8.3 [default] to 2025.10.5 [default]
packages/x86-64-v3-poky-linux/python3-certifi/python3-certifi-doc: PV changed from "2025.8.3" to "2025.10.5"
packages/x86-64-v3-poky-linux/python3-certifi/python3-certifi-locale: PKGV changed from 2025.8.3 [default] to 2025.10.5 [default]
packages/x86-64-v3-poky-linux/python3-certifi/python3-certifi-locale: PV changed from "2025.8.3" to "2025.10.5"
packages/x86-64-v3-poky-linux/python3-certifi/python3-certifi-src: PKGV changed from 2025.8.3 [default] to 2025.10.5 [default]
packages/x86-64-v3-poky-linux/python3-certifi/python3-certifi-src: PV changed from "2025.8.3" to "2025.10.5"
packages/x86-64-v3-poky-linux/python3-certifi/python3-certifi-staticdev: PKGV changed from 2025.8.3 [default] to 2025.10.5 [default]
packages/x86-64-v3-poky-linux/python3-certifi/python3-certifi-staticdev: PV changed from "2025.8.3" to "2025.10.5"
packages/x86-64-v3-poky-linux/python3-certifi/python3-certifi: PKGSIZE changed from 297778 to 301562 (+1%)
packages/x86-64-v3-poky-linux/python3-certifi/python3-certifi: PKGV changed from 2025.8.3 [default] to 2025.10.5 [default]
packages/x86-64-v3-poky-linux/python3-certifi/python3-certifi: PV changed from "2025.8.3" to "2025.10.5"
Changes to packages/x86-64-v3-poky-linux/python3-certifi (sysroot):
  /usr/lib/python3.13/site-packages/certifi-2025.10.5.dist-info was added
  /usr/lib/python3.13/site-packages/certifi-2025.10.5.dist-info/licenses was added
  /usr/lib/python3.13/site-packages/certifi-2025.10.5.dist-info/licenses/LICENSE was added
  /usr/lib/python3.13/site-packages/certifi-2025.10.5.dist-info/METADATA was added
  /usr/lib/python3.13/site-packages/certifi-2025.10.5.dist-info/top_level.txt was added
  /usr/lib/python3.13/site-packages/certifi-2025.10.5.dist-info/WHEEL was added
  /usr/lib/python3.13/site-packages/certifi-2025.8.3.dist-info was removed
  /usr/lib/python3.13/site-packages/certifi-2025.8.3.dist-info/licenses was removed
  /usr/lib/python3.13/site-packages/certifi-2025.8.3.dist-info/licenses/LICENSE was removed
  /usr/lib/python3.13/site-packages/certifi-2025.8.3.dist-info/METADATA was removed
  /usr/lib/python3.13/site-packages/certifi-2025.8.3.dist-info/top_level.txt was removed
  /usr/lib/python3.13/site-packages/certifi-2025.8.3.dist-info/WHEEL was removed

--===============6472684920519014338==--

