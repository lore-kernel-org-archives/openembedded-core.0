Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1941.1792480403299451023
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Oct 2026 00:13:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=oUCJikt/;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=qdapNz6w;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 010101a158285b0a-859482a1-ea57-4c8d-9060-a587dcc582a2-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1792480402;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=SorBnxiKY5ECk8KW3E3dvpC4gGhNNCu5bjLk6EhWUWw=;
	b=oUCJikt/rjfGR6hFDJk6zd2t4gR0gLys+wTjvuMWBjGJWDJlJP1BmwHytmq7iS6X
	5JeApGMekZFqHULDjxutPlEB5UksDlmidzRM6Y0ltwqZgDeHO9uJOKjHjh/uZHNILMF
	sZOJGp0/AFIpDLfMAwtyOnddmzes+BIN7CaJSmkw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1792480402;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=SorBnxiKY5ECk8KW3E3dvpC4gGhNNCu5bjLk6EhWUWw=;
	b=qdapNz6wuK6jinf6YyOYn7WN/gAKGVGB5fOSOIgUhda/dqAOAGwGCU1dxTc9xTj8
	nv8RZFsHGV14leSp5mBJxKuhJxzy03IVgqrS/LYfIFNeJAB4We/eVhcgcgEJLsb0fuG
	ZCWGZuT74Jf/F3/iFpXZ1PDupykIXwClq53kukSA=
Content-Type: multipart/mixed; boundary="===============2597081943835969891=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-certifi: upgrading to 2026.10.19 SUCCEEDED
Message-ID: <010101a158285b0a-859482a1-ea57-4c8d-9060-a587dcc582a2-000000@us-west-2.amazonses.com>
Date: Tue, 20 Oct 2026 07:13:22 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.10.20-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 20 Oct 2026 07:13:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248226

--===============2597081943835969891==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-certifi* to *2026.10.19* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-certifi-upgrade-2026.7.22-2026.10.19.patch
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
From 9f42d3bee94b42d4d8189ef953e1e3a675ef2464 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 20 Oct 2026 06:15:27 +0000
Subject: [PATCH] python3-certifi: upgrade 2026.7.22 -> 2026.10.19

---
 ...thon3-certifi_2026.7.22.bb => python3-certifi_2026.10.19.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-certifi_2026.7.22.bb => python3-certifi_2026.10.19.bb} (88%)

diff --git a/meta/recipes-devtools/python/python3-certifi_2026.7.22.bb b/meta/recipes-devtools/python/python3-certifi_2026.10.19.bb
similarity index 88%
rename from meta/recipes-devtools/python/python3-certifi_2026.7.22.bb
rename to meta/recipes-devtools/python/python3-certifi_2026.10.19.bb
index 8f1ba3aa9d..02cdbe9a08 100644
--- a/meta/recipes-devtools/python/python3-certifi_2026.7.22.bb
+++ b/meta/recipes-devtools/python/python3-certifi_2026.10.19.bb
@@ -7,7 +7,7 @@ HOMEPAGE = "http://certifi.io/"
 LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=11618cb6a975948679286b1211bd573c"
 
-SRC_URI[sha256sum] = "741e2c3b351ddf169a738da9f2c048608ff7f2c5cc02f1ebc6b118bb090d5d55"
+SRC_URI[sha256sum] = "035c1e85572b141bf1c3a3eff0e33a8eb74917522f2559075ff8d2fea780a1ae"
 
 inherit pypi python_setuptools_build_meta ptest-python-pytest
 
-- 
2.47.1


--===============2597081943835969891==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-certifi: PV changed from "2026.7.22" to "2026.10.19"
packages/x86-64-v3-poky-linux/python3-certifi: PKGV changed from 2026.7.22 [default] to 2026.10.19 [default]
packages/x86-64-v3-poky-linux/python3-certifi: SRC_URI changed from "https://files.pythonhosted.org/packages/source/c/certifi/certifi-2026.7.22.tar.gz" to "https://files.pythonhosted.org/packages/source/c/certifi/certifi-2026.10.19.tar.gz"
packages/x86-64-v3-poky-linux/python3-certifi/python3-certifi-dbg: PV changed from "2026.7.22" to "2026.10.19"
packages/x86-64-v3-poky-linux/python3-certifi/python3-certifi-dbg: PKGV changed from 2026.7.22 [default] to 2026.10.19 [default]
packages/x86-64-v3-poky-linux/python3-certifi/python3-certifi-dev: PV changed from "2026.7.22" to "2026.10.19"
packages/x86-64-v3-poky-linux/python3-certifi/python3-certifi-dev: PKGV changed from 2026.7.22 [default] to 2026.10.19 [default]
packages/x86-64-v3-poky-linux/python3-certifi/python3-certifi-doc: PV changed from "2026.7.22" to "2026.10.19"
packages/x86-64-v3-poky-linux/python3-certifi/python3-certifi-doc: PKGV changed from 2026.7.22 [default] to 2026.10.19 [default]
packages/x86-64-v3-poky-linux/python3-certifi/python3-certifi-locale: PV changed from "2026.7.22" to "2026.10.19"
packages/x86-64-v3-poky-linux/python3-certifi/python3-certifi-locale: PKGV changed from 2026.7.22 [default] to 2026.10.19 [default]
packages/x86-64-v3-poky-linux/python3-certifi/python3-certifi-ptest: PV changed from "2026.7.22" to "2026.10.19"
packages/x86-64-v3-poky-linux/python3-certifi/python3-certifi-ptest: PKGV changed from 2026.7.22 [default] to 2026.10.19 [default]
packages/x86-64-v3-poky-linux/python3-certifi/python3-certifi-src: PV changed from "2026.7.22" to "2026.10.19"
packages/x86-64-v3-poky-linux/python3-certifi/python3-certifi-src: PKGV changed from 2026.7.22 [default] to 2026.10.19 [default]
packages/x86-64-v3-poky-linux/python3-certifi/python3-certifi-staticdev: PV changed from "2026.7.22" to "2026.10.19"
packages/x86-64-v3-poky-linux/python3-certifi/python3-certifi-staticdev: PKGV changed from 2026.7.22 [default] to 2026.10.19 [default]
packages/x86-64-v3-poky-linux/python3-certifi/python3-certifi: PV changed from "2026.7.22" to "2026.10.19"
packages/x86-64-v3-poky-linux/python3-certifi/python3-certifi: FILELIST: directory renamed /usr/lib/python3.14/site-packages/certifi-2026.7.22.dist-info -> /usr/lib/python3.14/site-packages/certifi-2026.10.19.dist-info, directory renamed /usr/lib/python3.14/site-packages/certifi-2026.7.22.dist-info/licenses -> /usr/lib/python3.14/site-packages/certifi-2026.10.19.dist-info/licenses
packages/x86-64-v3-poky-linux/python3-certifi/python3-certifi: PKGV changed from 2026.7.22 [default] to 2026.10.19 [default]
packages/x86-64-v3-poky-linux/python3-certifi/python3-certifi: PKGSIZE changed from 253830 to 252522 (-1%)
Changes to packages/x86-64-v3-poky-linux/python3-certifi (sysroot):
  /usr/lib/python3.14/site-packages/certifi-2026.10.19.dist-info was added
  /usr/lib/python3.14/site-packages/certifi-2026.10.19.dist-info/licenses was added
  /usr/lib/python3.14/site-packages/certifi-2026.10.19.dist-info/licenses/LICENSE was added
  /usr/lib/python3.14/site-packages/certifi-2026.10.19.dist-info/METADATA was added
  /usr/lib/python3.14/site-packages/certifi-2026.10.19.dist-info/top_level.txt was added
  /usr/lib/python3.14/site-packages/certifi-2026.10.19.dist-info/WHEEL was added
  /usr/lib/python3.14/site-packages/certifi-2026.7.22.dist-info was removed
  /usr/lib/python3.14/site-packages/certifi-2026.7.22.dist-info/licenses was removed
  /usr/lib/python3.14/site-packages/certifi-2026.7.22.dist-info/licenses/LICENSE was removed
  /usr/lib/python3.14/site-packages/certifi-2026.7.22.dist-info/METADATA was removed
  /usr/lib/python3.14/site-packages/certifi-2026.7.22.dist-info/top_level.txt was removed
  /usr/lib/python3.14/site-packages/certifi-2026.7.22.dist-info/WHEEL was removed

--===============2597081943835969891==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-certifi-upgrade-2026.7.22-2026.10.19.patch"

RnJvbSA5ZjQyZDNiZWU5NGI0MmQ0ZDgxODllZjk1M2UxZTNhNjc1ZWYyNDY0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMjAgT2N0IDIwMjYgMDY6MTU6MjcgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLWNlcnRpZmk6IHVwZ3JhZGUgMjAyNi43LjIyIC0+IDIwMjYuMTAuMTkKCi0tLQogLi4u
dGhvbjMtY2VydGlmaV8yMDI2LjcuMjIuYmIgPT4gcHl0aG9uMy1jZXJ0aWZpXzIwMjYuMTAuMTku
YmJ9IHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0p
CiByZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1jZXJ0aWZpXzIw
MjYuNy4yMi5iYiA9PiBweXRob24zLWNlcnRpZmlfMjAyNi4xMC4xOS5iYn0gKDg4JSkKCmRpZmYg
LS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtY2VydGlmaV8yMDI2
LjcuMjIuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtY2VydGlmaV8y
MDI2LjEwLjE5LmJiCnNpbWlsYXJpdHkgaW5kZXggODglCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBl
cy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1jZXJ0aWZpXzIwMjYuNy4yMi5iYgpyZW5hbWUgdG8g
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWNlcnRpZmlfMjAyNi4xMC4xOS5i
YgppbmRleCA4ZjFiYTNhYTlkLi4wMmNkYmU5YTA4IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtY2VydGlmaV8yMDI2LjcuMjIuYmIKKysrIGIvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWNlcnRpZmlfMjAyNi4xMC4xOS5iYgpAQCAt
Nyw3ICs3LDcgQEAgSE9NRVBBR0UgPSAiaHR0cDovL2NlcnRpZmkuaW8vIgogTElDRU5TRSA9ICJJ
U0MiCiBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFO21kNT0xMTYxOGNiNmE5NzU5
NDg2NzkyODZiMTIxMWJkNTczYyIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjc0MWUyYzNiMzUx
ZGRmMTY5YTczOGRhOWYyYzA0ODYwOGZmN2YyYzVjYzAyZjFlYmM2YjExOGJiMDkwZDVkNTUiCitT
UkNfVVJJW3NoYTI1NnN1bV0gPSAiMDM1YzFlODU1NzJiMTQxYmYxYzNhM2VmZjBlMzNhOGViNzQ5
MTc1MjJmMjU1OTA3NWZmOGQyZmVhNzgwYTFhZSIKIAogaW5oZXJpdCBweXBpIHB5dGhvbl9zZXR1
cHRvb2xzX2J1aWxkX21ldGEgcHRlc3QtcHl0aG9uLXB5dGVzdAogCi0tIAoyLjQ3LjEKCg==

--===============2597081943835969891==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-certifi/python3-certifi: FILELIST: directory renamed /usr/lib/python3.14/site-packages/certifi-2026.7.22.dist-info/licenses -> /usr/lib/python3.14/site-packages/certifi-2026.10.19.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/certifi-2026.7.22.dist-info -> /usr/lib/python3.14/site-packages/certifi-2026.10.19.dist-info
Changes to packages/x86-64-v3-poky-linux/python3-certifi (sysroot):
  /usr/lib/python3.14/site-packages/certifi-2026.10.19.dist-info was added
  /usr/lib/python3.14/site-packages/certifi-2026.10.19.dist-info/licenses was added
  /usr/lib/python3.14/site-packages/certifi-2026.10.19.dist-info/licenses/LICENSE was added
  /usr/lib/python3.14/site-packages/certifi-2026.10.19.dist-info/METADATA was added
  /usr/lib/python3.14/site-packages/certifi-2026.10.19.dist-info/top_level.txt was added
  /usr/lib/python3.14/site-packages/certifi-2026.10.19.dist-info/WHEEL was added
  /usr/lib/python3.14/site-packages/certifi-2026.7.22.dist-info was removed
  /usr/lib/python3.14/site-packages/certifi-2026.7.22.dist-info/licenses was removed
  /usr/lib/python3.14/site-packages/certifi-2026.7.22.dist-info/licenses/LICENSE was removed
  /usr/lib/python3.14/site-packages/certifi-2026.7.22.dist-info/METADATA was removed
  /usr/lib/python3.14/site-packages/certifi-2026.7.22.dist-info/top_level.txt was removed
  /usr/lib/python3.14/site-packages/certifi-2026.7.22.dist-info/WHEEL was removed

--===============2597081943835969891==--
