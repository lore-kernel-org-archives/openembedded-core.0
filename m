Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7AB9CCF2E4
	for <webhook@archiver.kernel.org>; Mon, 19 Oct 2026 06:03:02 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.28428.1792389776589550877
 for <openembedded-core@lists.openembedded.org>;
 Sun, 18 Oct 2026 23:02:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=AixOvFA5;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=ks81dKsc;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 010101a152c18117-727906d0-c603-49ab-85df-289c5c120f40-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1792389775;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=m86jMd4WGv7JGPwGwhcr+iP3/yn/ZlJe9XSnmMZVIPk=;
	b=AixOvFA56F+/4ODbh4UUumg8K57B1KTlBHDlPhPnamJYalkJjXa7B3rlyG6WB9eX
	eM5U4Nfsx3l1ux0z5wbi8nE8ZbOqxXLQmeRdhPhWKh59icJ+b8hLSf0LYXPFIDTlVm5
	mlbpDeYbqRA3wmHcFmrIjwozwBjJSndOHyob+XL0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1792389775;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=m86jMd4WGv7JGPwGwhcr+iP3/yn/ZlJe9XSnmMZVIPk=;
	b=ks81dKscMsfo7TITBgv/Rz29AtA9ow4za4SKFGR9uJKnqKhIQSo6vvhtzbP8aNAx
	ib96NIO03QFzvPfUoNTa9NA8mNutcKEcZ81RBkcpWP9aDcdVDnl8qgWuvtAP+p7W1gS
	0iPFKkYg+KhOVBXa1QCTMBY/XPNegnyBgX9jgYnw=
Content-Type: multipart/mixed; boundary="===============5228521025307644305=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-certifi: upgrading to 2026.10.18 SUCCEEDED
Message-ID: <010101a152c18117-727906d0-c603-49ab-85df-289c5c120f40-000000@us-west-2.amazonses.com>
Date: Mon, 19 Oct 2026 06:02:55 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.10.19-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Oct 2026 06:03:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248123

--===============5228521025307644305==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-certifi* to *2026.10.18* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-certifi-upgrade-2026.7.22-2026.10.18.patch
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
From ab666abc75cbd5e378f9374b1eba6b4df55d5659 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 19 Oct 2026 05:31:37 +0000
Subject: [PATCH] python3-certifi: upgrade 2026.7.22 -> 2026.10.18

---
 ...thon3-certifi_2026.7.22.bb => python3-certifi_2026.10.18.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-certifi_2026.7.22.bb => python3-certifi_2026.10.18.bb} (88%)

diff --git a/meta/recipes-devtools/python/python3-certifi_2026.7.22.bb b/meta/recipes-devtools/python/python3-certifi_2026.10.18.bb
similarity index 88%
rename from meta/recipes-devtools/python/python3-certifi_2026.7.22.bb
rename to meta/recipes-devtools/python/python3-certifi_2026.10.18.bb
index 8f1ba3aa9d..cffd70cc4e 100644
--- a/meta/recipes-devtools/python/python3-certifi_2026.7.22.bb
+++ b/meta/recipes-devtools/python/python3-certifi_2026.10.18.bb
@@ -7,7 +7,7 @@ HOMEPAGE = "http://certifi.io/"
 LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=11618cb6a975948679286b1211bd573c"
 
-SRC_URI[sha256sum] = "741e2c3b351ddf169a738da9f2c048608ff7f2c5cc02f1ebc6b118bb090d5d55"
+SRC_URI[sha256sum] = "b9995d97b64d0431a5af837d8ca8cd6238104d1f319f04bd93ea43124d6c861e"
 
 inherit pypi python_setuptools_build_meta ptest-python-pytest
 
-- 
2.47.1


--===============5228521025307644305==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-certifi/python3-certifi: FILELIST: directory renamed /usr/lib/python3.14/site-packages/certifi-2026.7.22.dist-info -> /usr/lib/python3.14/site-packages/certifi-2026.10.18.dist-info, directory renamed /usr/lib/python3.14/site-packages/certifi-2026.7.22.dist-info/licenses -> /usr/lib/python3.14/site-packages/certifi-2026.10.18.dist-info/licenses
Changes to packages/x86-64-v3-poky-linux/python3-certifi (sysroot):
  /usr/lib/python3.14/site-packages/certifi-2026.10.18.dist-info was added
  /usr/lib/python3.14/site-packages/certifi-2026.10.18.dist-info/licenses was added
  /usr/lib/python3.14/site-packages/certifi-2026.10.18.dist-info/licenses/LICENSE was added
  /usr/lib/python3.14/site-packages/certifi-2026.10.18.dist-info/METADATA was added
  /usr/lib/python3.14/site-packages/certifi-2026.10.18.dist-info/top_level.txt was added
  /usr/lib/python3.14/site-packages/certifi-2026.10.18.dist-info/WHEEL was added
  /usr/lib/python3.14/site-packages/certifi-2026.7.22.dist-info was removed
  /usr/lib/python3.14/site-packages/certifi-2026.7.22.dist-info/licenses was removed
  /usr/lib/python3.14/site-packages/certifi-2026.7.22.dist-info/licenses/LICENSE was removed
  /usr/lib/python3.14/site-packages/certifi-2026.7.22.dist-info/METADATA was removed
  /usr/lib/python3.14/site-packages/certifi-2026.7.22.dist-info/top_level.txt was removed
  /usr/lib/python3.14/site-packages/certifi-2026.7.22.dist-info/WHEEL was removed

--===============5228521025307644305==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-certifi: SRC_URI changed from "https://files.pythonhosted.org/packages/source/c/certifi/certifi-2026.7.22.tar.gz" to "https://files.pythonhosted.org/packages/source/c/certifi/certifi-2026.10.18.tar.gz"
packages/x86-64-v3-poky-linux/python3-certifi: PV changed from "2026.7.22" to "2026.10.18"
packages/x86-64-v3-poky-linux/python3-certifi: PKGV changed from 2026.7.22 [default] to 2026.10.18 [default]
packages/x86-64-v3-poky-linux/python3-certifi/python3-certifi-dbg: PV changed from "2026.7.22" to "2026.10.18"
packages/x86-64-v3-poky-linux/python3-certifi/python3-certifi-dbg: PKGV changed from 2026.7.22 [default] to 2026.10.18 [default]
packages/x86-64-v3-poky-linux/python3-certifi/python3-certifi-dev: PV changed from "2026.7.22" to "2026.10.18"
packages/x86-64-v3-poky-linux/python3-certifi/python3-certifi-dev: PKGV changed from 2026.7.22 [default] to 2026.10.18 [default]
packages/x86-64-v3-poky-linux/python3-certifi/python3-certifi-doc: PV changed from "2026.7.22" to "2026.10.18"
packages/x86-64-v3-poky-linux/python3-certifi/python3-certifi-doc: PKGV changed from 2026.7.22 [default] to 2026.10.18 [default]
packages/x86-64-v3-poky-linux/python3-certifi/python3-certifi-locale: PV changed from "2026.7.22" to "2026.10.18"
packages/x86-64-v3-poky-linux/python3-certifi/python3-certifi-locale: PKGV changed from 2026.7.22 [default] to 2026.10.18 [default]
packages/x86-64-v3-poky-linux/python3-certifi/python3-certifi-ptest: PV changed from "2026.7.22" to "2026.10.18"
packages/x86-64-v3-poky-linux/python3-certifi/python3-certifi-ptest: PKGV changed from 2026.7.22 [default] to 2026.10.18 [default]
packages/x86-64-v3-poky-linux/python3-certifi/python3-certifi-src: PV changed from "2026.7.22" to "2026.10.18"
packages/x86-64-v3-poky-linux/python3-certifi/python3-certifi-src: PKGV changed from 2026.7.22 [default] to 2026.10.18 [default]
packages/x86-64-v3-poky-linux/python3-certifi/python3-certifi-staticdev: PV changed from "2026.7.22" to "2026.10.18"
packages/x86-64-v3-poky-linux/python3-certifi/python3-certifi-staticdev: PKGV changed from 2026.7.22 [default] to 2026.10.18 [default]
packages/x86-64-v3-poky-linux/python3-certifi/python3-certifi: FILELIST: directory renamed /usr/lib/python3.14/site-packages/certifi-2026.7.22.dist-info/licenses -> /usr/lib/python3.14/site-packages/certifi-2026.10.18.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/certifi-2026.7.22.dist-info -> /usr/lib/python3.14/site-packages/certifi-2026.10.18.dist-info
packages/x86-64-v3-poky-linux/python3-certifi/python3-certifi: PV changed from "2026.7.22" to "2026.10.18"
packages/x86-64-v3-poky-linux/python3-certifi/python3-certifi: PKGSIZE changed from 253830 to 247738 (-2%)
packages/x86-64-v3-poky-linux/python3-certifi/python3-certifi: PKGV changed from 2026.7.22 [default] to 2026.10.18 [default]
Changes to packages/x86-64-v3-poky-linux/python3-certifi (sysroot):
  /usr/lib/python3.14/site-packages/certifi-2026.10.18.dist-info was added
  /usr/lib/python3.14/site-packages/certifi-2026.10.18.dist-info/licenses was added
  /usr/lib/python3.14/site-packages/certifi-2026.10.18.dist-info/licenses/LICENSE was added
  /usr/lib/python3.14/site-packages/certifi-2026.10.18.dist-info/METADATA was added
  /usr/lib/python3.14/site-packages/certifi-2026.10.18.dist-info/top_level.txt was added
  /usr/lib/python3.14/site-packages/certifi-2026.10.18.dist-info/WHEEL was added
  /usr/lib/python3.14/site-packages/certifi-2026.7.22.dist-info was removed
  /usr/lib/python3.14/site-packages/certifi-2026.7.22.dist-info/licenses was removed
  /usr/lib/python3.14/site-packages/certifi-2026.7.22.dist-info/licenses/LICENSE was removed
  /usr/lib/python3.14/site-packages/certifi-2026.7.22.dist-info/METADATA was removed
  /usr/lib/python3.14/site-packages/certifi-2026.7.22.dist-info/top_level.txt was removed
  /usr/lib/python3.14/site-packages/certifi-2026.7.22.dist-info/WHEEL was removed

--===============5228521025307644305==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-certifi-upgrade-2026.7.22-2026.10.18.patch"

RnJvbSBhYjY2NmFiYzc1Y2JkNWUzNzhmOTM3NGIxZWJhNmI0ZGY1NWQ1NjU5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTkgT2N0IDIwMjYgMDU6MzE6MzcgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLWNlcnRpZmk6IHVwZ3JhZGUgMjAyNi43LjIyIC0+IDIwMjYuMTAuMTgKCi0tLQogLi4u
dGhvbjMtY2VydGlmaV8yMDI2LjcuMjIuYmIgPT4gcHl0aG9uMy1jZXJ0aWZpXzIwMjYuMTAuMTgu
YmJ9IHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0p
CiByZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1jZXJ0aWZpXzIw
MjYuNy4yMi5iYiA9PiBweXRob24zLWNlcnRpZmlfMjAyNi4xMC4xOC5iYn0gKDg4JSkKCmRpZmYg
LS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtY2VydGlmaV8yMDI2
LjcuMjIuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtY2VydGlmaV8y
MDI2LjEwLjE4LmJiCnNpbWlsYXJpdHkgaW5kZXggODglCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBl
cy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1jZXJ0aWZpXzIwMjYuNy4yMi5iYgpyZW5hbWUgdG8g
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWNlcnRpZmlfMjAyNi4xMC4xOC5i
YgppbmRleCA4ZjFiYTNhYTlkLi5jZmZkNzBjYzRlIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtY2VydGlmaV8yMDI2LjcuMjIuYmIKKysrIGIvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWNlcnRpZmlfMjAyNi4xMC4xOC5iYgpAQCAt
Nyw3ICs3LDcgQEAgSE9NRVBBR0UgPSAiaHR0cDovL2NlcnRpZmkuaW8vIgogTElDRU5TRSA9ICJJ
U0MiCiBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFO21kNT0xMTYxOGNiNmE5NzU5
NDg2NzkyODZiMTIxMWJkNTczYyIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjc0MWUyYzNiMzUx
ZGRmMTY5YTczOGRhOWYyYzA0ODYwOGZmN2YyYzVjYzAyZjFlYmM2YjExOGJiMDkwZDVkNTUiCitT
UkNfVVJJW3NoYTI1NnN1bV0gPSAiYjk5OTVkOTdiNjRkMDQzMWE1YWY4MzdkOGNhOGNkNjIzODEw
NGQxZjMxOWYwNGJkOTNlYTQzMTI0ZDZjODYxZSIKIAogaW5oZXJpdCBweXBpIHB5dGhvbl9zZXR1
cHRvb2xzX2J1aWxkX21ldGEgcHRlc3QtcHl0aG9uLXB5dGVzdAogCi0tIAoyLjQ3LjEKCg==

--===============5228521025307644305==--

