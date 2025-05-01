Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5528BC3ABD3
	for <webhook@archiver.kernel.org>; Thu,  1 May 2025 15:33:45 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web11.1803.1746113612621771639
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 May 2025 08:33:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=Zx73jzGX;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=Qwlljp6Q;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 010101968c7b61f9-a5ac75aa-88bd-4631-bb35-30af606c4df8-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1746113618;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=thTityipLXO0CAmZIXc/RhgwDwOoDL1CtivrA+43YH8=;
	b=Zx73jzGX1HpPR2XZFrafznZtqLRe1+V/NfbVhF4Ld5qkK1TnHurIyjS5cVbHOCqJ
	7/5IguU6uatXPx+1QBHe2KQrhd+tNbChL3E7akoybqKidaH7DXZr7Y51GX4SO5IM2XF
	dUadjMiUZRfX8woPGjvFFzLoFuFCyzoB1VCfPNG0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1746113618;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=thTityipLXO0CAmZIXc/RhgwDwOoDL1CtivrA+43YH8=;
	b=Qwlljp6QcqrAKlBK7f3IUnbpidBdumzR7xDBYgC0Bzo1jSCcKsujhj1iy/lsKY6D
	YjpQW7OkQINnQC63qZbz3UIahZON1h7g5aK4x6UijP8zyUBZgFJeyWpDqhXIJqYcUwi
	pNXwf6kea4zSXnXeZXxiHWQPr40PburY97NtI9ho=
Content-Type: multipart/mixed; boundary="===============2937927287396500457=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-jsonschema-specifications: upgrading to 2025.4.1
 SUCCEEDED
Message-ID: <010101968c7b61f9-a5ac75aa-88bd-4631-bb35-30af606c4df8-000000@us-west-2.amazonses.com>
Date: Thu, 1 May 2025 15:33:38 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.05.01-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 May 2025 15:33:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215812

--===============2937927287396500457==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-jsonschema-specifications* to *2025.4.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-jsonschema-specifications-upgrade-2024.10.1-.patch
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
From e973b9a6ccf875132f600657da7badcf88bb9464 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 1 May 2025 08:51:25 +0000
Subject: [PATCH] python3-jsonschema-specifications: upgrade 2024.10.1 ->
 2025.4.1

---
 ...24.10.1.bb => python3-jsonschema-specifications_2025.4.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-jsonschema-specifications_2024.10.1.bb => python3-jsonschema-specifications_2025.4.1.bb} (87%)

diff --git a/meta/recipes-devtools/python/python3-jsonschema-specifications_2024.10.1.bb b/meta/recipes-devtools/python/python3-jsonschema-specifications_2025.4.1.bb
similarity index 87%
rename from meta/recipes-devtools/python/python3-jsonschema-specifications_2024.10.1.bb
rename to meta/recipes-devtools/python/python3-jsonschema-specifications_2025.4.1.bb
index c45e5c25c7..53805b0396 100644
--- a/meta/recipes-devtools/python/python3-jsonschema-specifications_2024.10.1.bb
+++ b/meta/recipes-devtools/python/python3-jsonschema-specifications_2025.4.1.bb
@@ -5,7 +5,7 @@ HOMEPAGE = "https://pypi.org/project/jsonschema-specifications/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=93eb9740964b59e9ba30281255b044e2"
 
-SRC_URI[sha256sum] = "0f38b83639958ce1152d02a7f062902c41c8fd20d558b0c34344292d417ae272"
+SRC_URI[sha256sum] = "630159c9f4dbea161a6a2205c3011cc4f18ff381b189fff48bb39b9bf26ae608"
 
 inherit pypi python_hatchling
 
-- 
2.47.1


--===============2937927287396500457==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-jsonschema-specifications: SRC_URI changed from "https://files.pythonhosted.org/packages/source/j/jsonschema_specifications/jsonschema_specifications-2024.10.1.tar.gz;downloadfilename=jsonschema_specifications-2024.10.1.tar.gz" to "https://files.pythonhosted.org/packages/source/j/jsonschema_specifications/jsonschema_specifications-2025.4.1.tar.gz;downloadfilename=jsonschema_specifications-2025.4.1.tar.gz"
packages/core2-64-poky-linux/python3-jsonschema-specifications: PV changed from "2024.10.1" to "2025.4.1"
packages/core2-64-poky-linux/python3-jsonschema-specifications: PKGV changed from 2024.10.1 [default] to 2025.4.1 [default]
packages/core2-64-poky-linux/python3-jsonschema-specifications/python3-jsonschema-specifications-dbg: PV changed from "2024.10.1" to "2025.4.1"
packages/core2-64-poky-linux/python3-jsonschema-specifications/python3-jsonschema-specifications-dbg: PKGV changed from 2024.10.1 [default] to 2025.4.1 [default]
packages/core2-64-poky-linux/python3-jsonschema-specifications/python3-jsonschema-specifications-dev: PV changed from "2024.10.1" to "2025.4.1"
packages/core2-64-poky-linux/python3-jsonschema-specifications/python3-jsonschema-specifications-dev: PKGV changed from 2024.10.1 [default] to 2025.4.1 [default]
packages/core2-64-poky-linux/python3-jsonschema-specifications/python3-jsonschema-specifications-doc: PV changed from "2024.10.1" to "2025.4.1"
packages/core2-64-poky-linux/python3-jsonschema-specifications/python3-jsonschema-specifications-doc: PKGV changed from 2024.10.1 [default] to 2025.4.1 [default]
packages/core2-64-poky-linux/python3-jsonschema-specifications/python3-jsonschema-specifications-locale: PV changed from "2024.10.1" to "2025.4.1"
packages/core2-64-poky-linux/python3-jsonschema-specifications/python3-jsonschema-specifications-locale: PKGV changed from 2024.10.1 [default] to 2025.4.1 [default]
packages/core2-64-poky-linux/python3-jsonschema-specifications/python3-jsonschema-specifications-src: PV changed from "2024.10.1" to "2025.4.1"
packages/core2-64-poky-linux/python3-jsonschema-specifications/python3-jsonschema-specifications-src: PKGV changed from 2024.10.1 [default] to 2025.4.1 [default]
packages/core2-64-poky-linux/python3-jsonschema-specifications/python3-jsonschema-specifications-staticdev: PV changed from "2024.10.1" to "2025.4.1"
packages/core2-64-poky-linux/python3-jsonschema-specifications/python3-jsonschema-specifications-staticdev: PKGV changed from 2024.10.1 [default] to 2025.4.1 [default]
packages/core2-64-poky-linux/python3-jsonschema-specifications/python3-jsonschema-specifications: PKGSIZE changed from 48206 to 48128 (-0%)
packages/core2-64-poky-linux/python3-jsonschema-specifications/python3-jsonschema-specifications: PV changed from "2024.10.1" to "2025.4.1"
packages/core2-64-poky-linux/python3-jsonschema-specifications/python3-jsonschema-specifications: PKGV changed from 2024.10.1 [default] to 2025.4.1 [default]
Changes to packages/core2-64-poky-linux/python3-jsonschema-specifications (sysroot):
  /usr/lib/python3.13/site-packages/jsonschema_specifications-2025.4.1.dist-info was added
  /usr/lib/python3.13/site-packages/jsonschema_specifications-2025.4.1.dist-info/licenses was added
  /usr/lib/python3.13/site-packages/jsonschema_specifications-2025.4.1.dist-info/licenses/COPYING was added
  /usr/lib/python3.13/site-packages/jsonschema_specifications-2025.4.1.dist-info/METADATA was added
  /usr/lib/python3.13/site-packages/jsonschema_specifications-2025.4.1.dist-info/WHEEL was added
  /usr/lib/python3.13/site-packages/jsonschema_specifications-2024.10.1.dist-info was removed
  /usr/lib/python3.13/site-packages/jsonschema_specifications-2024.10.1.dist-info/licenses was removed
  /usr/lib/python3.13/site-packages/jsonschema_specifications-2024.10.1.dist-info/licenses/COPYING was removed
  /usr/lib/python3.13/site-packages/jsonschema_specifications-2024.10.1.dist-info/METADATA was removed
  /usr/lib/python3.13/site-packages/jsonschema_specifications-2024.10.1.dist-info/WHEEL was removed

--===============2937927287396500457==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/python3-jsonschema-specifications (sysroot):
  /usr/lib/python3.13/site-packages/jsonschema_specifications-2025.4.1.dist-info was added
  /usr/lib/python3.13/site-packages/jsonschema_specifications-2025.4.1.dist-info/licenses was added
  /usr/lib/python3.13/site-packages/jsonschema_specifications-2025.4.1.dist-info/licenses/COPYING was added
  /usr/lib/python3.13/site-packages/jsonschema_specifications-2025.4.1.dist-info/METADATA was added
  /usr/lib/python3.13/site-packages/jsonschema_specifications-2025.4.1.dist-info/WHEEL was added
  /usr/lib/python3.13/site-packages/jsonschema_specifications-2024.10.1.dist-info was removed
  /usr/lib/python3.13/site-packages/jsonschema_specifications-2024.10.1.dist-info/licenses was removed
  /usr/lib/python3.13/site-packages/jsonschema_specifications-2024.10.1.dist-info/licenses/COPYING was removed
  /usr/lib/python3.13/site-packages/jsonschema_specifications-2024.10.1.dist-info/METADATA was removed
  /usr/lib/python3.13/site-packages/jsonschema_specifications-2024.10.1.dist-info/WHEEL was removed

--===============2937927287396500457==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-jsonschema-specifications-upgrade-2024.10.1-.patch"

RnJvbSBlOTczYjlhNmNjZjg3NTEzMmY2MDA2NTdkYTdiYWRjZjg4YmI5NDY0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBNYXkgMjAyNSAwODo1MToyNSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtanNvbnNjaGVtYS1zcGVjaWZpY2F0aW9uczogdXBncmFkZSAyMDI0LjEwLjEgLT4KIDIw
MjUuNC4xCgotLS0KIC4uLjI0LjEwLjEuYmIgPT4gcHl0aG9uMy1qc29uc2NoZW1hLXNwZWNpZmlj
YXRpb25zXzIwMjUuNC4xLmJifSB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigr
KSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5
dGhvbjMtanNvbnNjaGVtYS1zcGVjaWZpY2F0aW9uc18yMDI0LjEwLjEuYmIgPT4gcHl0aG9uMy1q
c29uc2NoZW1hLXNwZWNpZmljYXRpb25zXzIwMjUuNC4xLmJifSAoODclKQoKZGlmZiAtLWdpdCBh
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1qc29uc2NoZW1hLXNwZWNpZmlj
YXRpb25zXzIwMjQuMTAuMS5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9u
My1qc29uc2NoZW1hLXNwZWNpZmljYXRpb25zXzIwMjUuNC4xLmJiCnNpbWlsYXJpdHkgaW5kZXgg
ODclCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1qc29u
c2NoZW1hLXNwZWNpZmljYXRpb25zXzIwMjQuMTAuMS5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3B5dGhvbi9weXRob24zLWpzb25zY2hlbWEtc3BlY2lmaWNhdGlvbnNfMjAyNS40
LjEuYmIKaW5kZXggYzQ1ZTVjMjVjNy4uNTM4MDViMDM5NiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNp
cGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWpzb25zY2hlbWEtc3BlY2lmaWNhdGlvbnNfMjAy
NC4xMC4xLmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1qc29u
c2NoZW1hLXNwZWNpZmljYXRpb25zXzIwMjUuNC4xLmJiCkBAIC01LDcgKzUsNyBAQCBIT01FUEFH
RSA9ICJodHRwczovL3B5cGkub3JnL3Byb2plY3QvanNvbnNjaGVtYS1zcGVjaWZpY2F0aW9ucy8i
CiBMSUNFTlNFID0gIk1JVCIKIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0NPUFlJTkc7bWQ1
PTkzZWI5NzQwOTY0YjU5ZTliYTMwMjgxMjU1YjA0NGUyIgogCi1TUkNfVVJJW3NoYTI1NnN1bV0g
PSAiMGYzOGI4MzYzOTk1OGNlMTE1MmQwMmE3ZjA2MjkwMmM0MWM4ZmQyMGQ1NThiMGMzNDM0NDI5
MmQ0MTdhZTI3MiIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICI2MzAxNTljOWY0ZGJlYTE2MWE2YTIy
MDVjMzAxMWNjNGYxOGZmMzgxYjE4OWZmZjQ4YmIzOWI5YmYyNmFlNjA4IgogCiBpbmhlcml0IHB5
cGkgcHl0aG9uX2hhdGNobGluZwogCi0tIAoyLjQ3LjEKCg==

--===============2937927287396500457==--

