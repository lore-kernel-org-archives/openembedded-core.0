Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1830.1792822999115358177
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Oct 2026 23:23:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=XgO7VVYi;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=2pJB2AsO;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 010101a16c93f3f0-67c65606-6bec-4e75-8eb8-825727fe2f88-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1792822998;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=+frxt/AtkTfDz+GssQNcOGJT6qQ/rLX2IW95FNPQH9U=;
	b=XgO7VVYitWRsnQWcaXGw4LLCChv2F/LGOdThyDhvzOAvsbwzsxlFnfGcluO9HKko
	gF9VyA7sYMe1WMFUAIcRmQ93wiqMiz5Q/BjhZQELicIyeRq7IaMriJNz8Wrej4ZUGPO
	7raLoDpOIgA3a4MVzvIBX56W6kA0/6SKsN+wJGFw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1792822998;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=+frxt/AtkTfDz+GssQNcOGJT6qQ/rLX2IW95FNPQH9U=;
	b=2pJB2AsO3qKowWEXOMb0iuNsy87MfLx9dEMLO7hgf0c3ZdU9pfNUpoo5x6PAvhUC
	8W5GLOH93DIhavAkTpA+IxB2yUJvcHpwvMOzRjOATYVgvSrSGeB5etpoPS+hTKgP8Et
	GJTiNaniyGSgBHit2Y5XLcYuS6wDmgvNzhFA5dh8=
Content-Type: multipart/mixed; boundary="===============0758335435283338759=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-certifi: upgrading to 2026.10.23 SUCCEEDED
Message-ID: <010101a16c93f3f0-67c65606-6bec-4e75-8eb8-825727fe2f88-000000@us-west-2.amazonses.com>
Date: Sat, 24 Oct 2026 06:23:18 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.10.24-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sat, 24 Oct 2026 06:23:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248577

--===============0758335435283338759==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-certifi* to *2026.10.23* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-certifi-upgrade-2026.10.19-2026.10.23.patch
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
From 9cf32c0798230fdc21ab7acf8f968b6707fe2379 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 24 Oct 2026 05:17:56 +0000
Subject: [PATCH] python3-certifi: upgrade 2026.10.19 -> 2026.10.23

---
 ...hon3-certifi_2026.10.19.bb => python3-certifi_2026.10.23.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-certifi_2026.10.19.bb => python3-certifi_2026.10.23.bb} (88%)

diff --git a/meta/recipes-devtools/python/python3-certifi_2026.10.19.bb b/meta/recipes-devtools/python/python3-certifi_2026.10.23.bb
similarity index 88%
rename from meta/recipes-devtools/python/python3-certifi_2026.10.19.bb
rename to meta/recipes-devtools/python/python3-certifi_2026.10.23.bb
index 02cdbe9a08..670b96b006 100644
--- a/meta/recipes-devtools/python/python3-certifi_2026.10.19.bb
+++ b/meta/recipes-devtools/python/python3-certifi_2026.10.23.bb
@@ -7,7 +7,7 @@ HOMEPAGE = "http://certifi.io/"
 LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=11618cb6a975948679286b1211bd573c"
 
-SRC_URI[sha256sum] = "035c1e85572b141bf1c3a3eff0e33a8eb74917522f2559075ff8d2fea780a1ae"
+SRC_URI[sha256sum] = "a9895e6e2758b371e0545e321a3a8fd1fcfd9829ada8824a936dfb16aaaf36cd"
 
 inherit pypi python_setuptools_build_meta ptest-python-pytest
 
-- 
2.47.1


--===============0758335435283338759==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-certifi: SRC_URI changed from "https://files.pythonhosted.org/packages/source/c/certifi/certifi-2026.10.19.tar.gz" to "https://files.pythonhosted.org/packages/source/c/certifi/certifi-2026.10.23.tar.gz"
packages/x86-64-v3-poky-linux/python3-certifi: PKGV changed from 2026.10.19 [default] to 2026.10.23 [default]
packages/x86-64-v3-poky-linux/python3-certifi: PV changed from "2026.10.19" to "2026.10.23"
packages/x86-64-v3-poky-linux/python3-certifi/python3-certifi-dbg: PKGV changed from 2026.10.19 [default] to 2026.10.23 [default]
packages/x86-64-v3-poky-linux/python3-certifi/python3-certifi-dbg: PV changed from "2026.10.19" to "2026.10.23"
packages/x86-64-v3-poky-linux/python3-certifi/python3-certifi-dev: PKGV changed from 2026.10.19 [default] to 2026.10.23 [default]
packages/x86-64-v3-poky-linux/python3-certifi/python3-certifi-dev: PV changed from "2026.10.19" to "2026.10.23"
packages/x86-64-v3-poky-linux/python3-certifi/python3-certifi-doc: PKGV changed from 2026.10.19 [default] to 2026.10.23 [default]
packages/x86-64-v3-poky-linux/python3-certifi/python3-certifi-doc: PV changed from "2026.10.19" to "2026.10.23"
packages/x86-64-v3-poky-linux/python3-certifi/python3-certifi-locale: PKGV changed from 2026.10.19 [default] to 2026.10.23 [default]
packages/x86-64-v3-poky-linux/python3-certifi/python3-certifi-locale: PV changed from "2026.10.19" to "2026.10.23"
packages/x86-64-v3-poky-linux/python3-certifi/python3-certifi-ptest: PKGV changed from 2026.10.19 [default] to 2026.10.23 [default]
packages/x86-64-v3-poky-linux/python3-certifi/python3-certifi-ptest: PV changed from "2026.10.19" to "2026.10.23"
packages/x86-64-v3-poky-linux/python3-certifi/python3-certifi-src: PKGV changed from 2026.10.19 [default] to 2026.10.23 [default]
packages/x86-64-v3-poky-linux/python3-certifi/python3-certifi-src: PV changed from "2026.10.19" to "2026.10.23"
packages/x86-64-v3-poky-linux/python3-certifi/python3-certifi-staticdev: PKGV changed from 2026.10.19 [default] to 2026.10.23 [default]
packages/x86-64-v3-poky-linux/python3-certifi/python3-certifi-staticdev: PV changed from "2026.10.19" to "2026.10.23"
packages/x86-64-v3-poky-linux/python3-certifi/python3-certifi: PKGV changed from 2026.10.19 [default] to 2026.10.23 [default]
packages/x86-64-v3-poky-linux/python3-certifi/python3-certifi: PV changed from "2026.10.19" to "2026.10.23"
packages/x86-64-v3-poky-linux/python3-certifi/python3-certifi: FILELIST: directory renamed /usr/lib/python3.14/site-packages/certifi-2026.10.19.dist-info/licenses -> /usr/lib/python3.14/site-packages/certifi-2026.10.23.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/certifi-2026.10.19.dist-info -> /usr/lib/python3.14/site-packages/certifi-2026.10.23.dist-info
packages/x86-64-v3-poky-linux/python3-certifi/python3-certifi: PKGSIZE changed from 252522 to 249529 (-1%)
Changes to packages/x86-64-v3-poky-linux/python3-certifi (sysroot):
  /usr/lib/python3.14/site-packages/certifi-2026.10.19.dist-info moved to /usr/lib/python3.14/site-packages/certifi-2026.10.23.dist-info

--===============0758335435283338759==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-certifi-upgrade-2026.10.19-2026.10.23.patch"

RnJvbSA5Y2YzMmMwNzk4MjMwZmRjMjFhYjdhY2Y4Zjk2OGI2NzA3ZmUyMzc5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMjQgT2N0IDIwMjYgMDU6MTc6NTYgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLWNlcnRpZmk6IHVwZ3JhZGUgMjAyNi4xMC4xOSAtPiAyMDI2LjEwLjIzCgotLS0KIC4u
LmhvbjMtY2VydGlmaV8yMDI2LjEwLjE5LmJiID0+IHB5dGhvbjMtY2VydGlmaV8yMDI2LjEwLjIz
LmJifSB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigt
KQogcmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtY2VydGlmaV8y
MDI2LjEwLjE5LmJiID0+IHB5dGhvbjMtY2VydGlmaV8yMDI2LjEwLjIzLmJifSAoODglKQoKZGlm
ZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1jZXJ0aWZpXzIw
MjYuMTAuMTkuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtY2VydGlm
aV8yMDI2LjEwLjIzLmJiCnNpbWlsYXJpdHkgaW5kZXggODglCnJlbmFtZSBmcm9tIG1ldGEvcmVj
aXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1jZXJ0aWZpXzIwMjYuMTAuMTkuYmIKcmVuYW1l
IHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1jZXJ0aWZpXzIwMjYuMTAu
MjMuYmIKaW5kZXggMDJjZGJlOWEwOC4uNjcwYjk2YjAwNiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNp
cGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWNlcnRpZmlfMjAyNi4xMC4xOS5iYgorKysgYi9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtY2VydGlmaV8yMDI2LjEwLjIzLmJi
CkBAIC03LDcgKzcsNyBAQCBIT01FUEFHRSA9ICJodHRwOi8vY2VydGlmaS5pby8iCiBMSUNFTlNF
ID0gIklTQyIKIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0U7bWQ1PTExNjE4Y2I2
YTk3NTk0ODY3OTI4NmIxMjExYmQ1NzNjIgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiMDM1YzFl
ODU1NzJiMTQxYmYxYzNhM2VmZjBlMzNhOGViNzQ5MTc1MjJmMjU1OTA3NWZmOGQyZmVhNzgwYTFh
ZSIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICJhOTg5NWU2ZTI3NThiMzcxZTA1NDVlMzIxYTNhOGZk
MWZjZmQ5ODI5YWRhODgyNGE5MzZkZmIxNmFhYWYzNmNkIgogCiBpbmhlcml0IHB5cGkgcHl0aG9u
X3NldHVwdG9vbHNfYnVpbGRfbWV0YSBwdGVzdC1weXRob24tcHl0ZXN0CiAKLS0gCjIuNDcuMQoK

--===============0758335435283338759==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-certifi/python3-certifi: FILELIST: directory renamed /usr/lib/python3.14/site-packages/certifi-2026.10.19.dist-info/licenses -> /usr/lib/python3.14/site-packages/certifi-2026.10.23.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/certifi-2026.10.19.dist-info -> /usr/lib/python3.14/site-packages/certifi-2026.10.23.dist-info
Changes to packages/x86-64-v3-poky-linux/python3-certifi (sysroot):
  /usr/lib/python3.14/site-packages/certifi-2026.10.19.dist-info moved to /usr/lib/python3.14/site-packages/certifi-2026.10.23.dist-info

--===============0758335435283338759==--
