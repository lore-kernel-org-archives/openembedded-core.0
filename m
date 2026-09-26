Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24028C9831E
	for <webhook@archiver.kernel.org>; Sat, 26 Sep 2026 05:25:22 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14310.1790400311127389709
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Sep 2026 22:25:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=IeuD13K1;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=HwthGz73;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 010101a0dc2cb574-5cd8fedf-fa0a-4090-bd7b-b7f4fb1a91ba-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1790400313;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=CgwnglgsM0NqIAunoAy6nVuQ3xxiHqZNYHJy6N2ubnU=;
	b=IeuD13K17k1yJ3a7Ho5pvub9WoJvDaMxGbUWm4y1cMQB0W7Oqw7HtofUebor94zi
	Q3ky1YJWOH0l4V7+jy34XvGiDKQzlf4+aigCwTBuiLqvR9CIhN0/1rC47L0+G87VTE6
	v6YJdGPL9EUYs2gM5o7DKzVdmfuQJTp7b6txv3G4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1790400313;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=CgwnglgsM0NqIAunoAy6nVuQ3xxiHqZNYHJy6N2ubnU=;
	b=HwthGz7354ByeCqZ9dxm47QCS5ALiE4/PBlaV8sFh3bi5l+xt2x4LlyRPoGwZZ4l
	vba7J5tOiXvLkEXeoUgLt+LJ5q/YdYNYNYLExi8Kkgv7yVr6i2LwF23b0gKDIspSrqZ
	aaVu7qZvmGQMxc9LE8vfJHQvBdc0g4q/SfYARVCQ=
Content-Type: multipart/mixed; boundary="===============9020329049478053745=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-pbr: upgrading to 7.1.2 SUCCEEDED
Message-ID: <010101a0dc2cb574-5cd8fedf-fa0a-4090-bd7b-b7f4fb1a91ba-000000@us-west-2.amazonses.com>
Date: Sat, 26 Sep 2026 05:25:12 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.09.26-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 26 Sep 2026 05:25:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246630

--===============9020329049478053745==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-pbr* to *7.1.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-pbr-upgrade-7.1.0-7.1.2.patch
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
From 0b3b697dc9bebf506c00c396fddeb822c553bc2c Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 26 Sep 2026 05:18:24 +0000
Subject: [PATCH] python3-pbr: upgrade 7.1.0 -> 7.1.2

7.1.2
-----

7.1.1
-----
---
 .../python/{python3-pbr_7.1.0.bb => python3-pbr_7.1.2.bb}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pbr_7.1.0.bb => python3-pbr_7.1.2.bb} (83%)

diff --git a/meta/recipes-devtools/python/python3-pbr_7.1.0.bb b/meta/recipes-devtools/python/python3-pbr_7.1.2.bb
similarity index 83%
rename from meta/recipes-devtools/python/python3-pbr_7.1.0.bb
rename to meta/recipes-devtools/python/python3-pbr_7.1.2.bb
index 7fc227e6bb..9aeb50268d 100644
--- a/meta/recipes-devtools/python/python3-pbr_7.1.0.bb
+++ b/meta/recipes-devtools/python/python3-pbr_7.1.2.bb
@@ -13,4 +13,4 @@ RDEPENDS:${PN} += "python3-setuptools"
 
 BBCLASSEXTEND = "native nativesdk"
 
-SRC_URI[sha256sum] = "66ece3a2f5c4f05e5f37569213e755193f6e00b8aa361bfb190533ea8ee8b10c"
+SRC_URI[sha256sum] = "4639b87cc91d0d58471b7bda1f28b7d0849ba43d7935c4c482f3c74fef719804"
-- 
2.47.1


--===============9020329049478053745==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-pbr-upgrade-7.1.0-7.1.2.patch"

RnJvbSAwYjNiNjk3ZGM5YmViZjUwNmMwMGMzOTZmZGRlYjgyMmM1NTNiYzJjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMjYgU2VwIDIwMjYgMDU6MTg6MjQgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXBicjogdXBncmFkZSA3LjEuMCAtPiA3LjEuMgoKNy4xLjIKLS0tLS0KCjcuMS4xCi0t
LS0tCi0tLQogLi4uL3B5dGhvbi97cHl0aG9uMy1wYnJfNy4xLjAuYmIgPT4gcHl0aG9uMy1wYnJf
Ny4xLjIuYmJ9ICAgICAgIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAx
IGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9u
My1wYnJfNy4xLjAuYmIgPT4gcHl0aG9uMy1wYnJfNy4xLjIuYmJ9ICg4MyUpCgpkaWZmIC0tZ2l0
IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXBicl83LjEuMC5iYiBiL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1wYnJfNy4xLjIuYmIKc2ltaWxhcml0
eSBpbmRleCA4MyUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRo
b24zLXBicl83LjEuMC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9w
eXRob24zLXBicl83LjEuMi5iYgppbmRleCA3ZmMyMjdlNmJiLi45YWViNTAyNjhkIDEwMDY0NAot
LS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcGJyXzcuMS4wLmJiCisr
KyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1wYnJfNy4xLjIuYmIKQEAg
LTEzLDQgKzEzLDQgQEAgUkRFUEVORFM6JHtQTn0gKz0gInB5dGhvbjMtc2V0dXB0b29scyIKIAog
QkJDTEFTU0VYVEVORCA9ICJuYXRpdmUgbmF0aXZlc2RrIgogCi1TUkNfVVJJW3NoYTI1NnN1bV0g
PSAiNjZlY2UzYTJmNWM0ZjA1ZTVmMzc1NjkyMTNlNzU1MTkzZjZlMDBiOGFhMzYxYmZiMTkwNTMz
ZWE4ZWU4YjEwYyIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICI0NjM5Yjg3Y2M5MWQwZDU4NDcxYjdi
ZGExZjI4YjdkMDg0OWJhNDNkNzkzNWM0YzQ4MmYzYzc0ZmVmNzE5ODA0IgotLSAKMi40Ny4xCgo=

--===============9020329049478053745==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-pbr/python3-pbr: FILELIST: directory renamed /usr/lib/python3.14/site-packages/pbr-7.1.0.dist-info/licenses -> /usr/lib/python3.14/site-packages/pbr-7.1.2.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/pbr-7.1.0.dist-info -> /usr/lib/python3.14/site-packages/pbr-7.1.2.dist-info
Changes to packages/x86-64-v3-poky-linux/python3-pbr (sysroot):
  /usr/lib/python3.14/site-packages/pbr-7.1.0.dist-info moved to /usr/lib/python3.14/site-packages/pbr-7.1.2.dist-info

--===============9020329049478053745==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-pbr: SRC_URI changed from "https://files.pythonhosted.org/packages/source/p/pbr/pbr-7.1.0.tar.gz" to "https://files.pythonhosted.org/packages/source/p/pbr/pbr-7.1.2.tar.gz"
packages/x86-64-v3-poky-linux/python3-pbr: PKGV changed from 7.1.0 [default] to 7.1.2 [default]
packages/x86-64-v3-poky-linux/python3-pbr: PV changed from "7.1.0" to "7.1.2"
packages/x86-64-v3-poky-linux/python3-pbr/python3-pbr-dbg: PKGV changed from 7.1.0 [default] to 7.1.2 [default]
packages/x86-64-v3-poky-linux/python3-pbr/python3-pbr-dbg: PV changed from "7.1.0" to "7.1.2"
packages/x86-64-v3-poky-linux/python3-pbr/python3-pbr-dev: PKGV changed from 7.1.0 [default] to 7.1.2 [default]
packages/x86-64-v3-poky-linux/python3-pbr/python3-pbr-dev: PV changed from "7.1.0" to "7.1.2"
packages/x86-64-v3-poky-linux/python3-pbr/python3-pbr-doc: PKGV changed from 7.1.0 [default] to 7.1.2 [default]
packages/x86-64-v3-poky-linux/python3-pbr/python3-pbr-doc: PV changed from "7.1.0" to "7.1.2"
packages/x86-64-v3-poky-linux/python3-pbr/python3-pbr-locale: PKGV changed from 7.1.0 [default] to 7.1.2 [default]
packages/x86-64-v3-poky-linux/python3-pbr/python3-pbr-locale: PV changed from "7.1.0" to "7.1.2"
packages/x86-64-v3-poky-linux/python3-pbr/python3-pbr-src: PKGV changed from 7.1.0 [default] to 7.1.2 [default]
packages/x86-64-v3-poky-linux/python3-pbr/python3-pbr-src: PV changed from "7.1.0" to "7.1.2"
packages/x86-64-v3-poky-linux/python3-pbr/python3-pbr-staticdev: PKGV changed from 7.1.0 [default] to 7.1.2 [default]
packages/x86-64-v3-poky-linux/python3-pbr/python3-pbr-staticdev: PV changed from "7.1.0" to "7.1.2"
packages/x86-64-v3-poky-linux/python3-pbr/python3-pbr: PKGV changed from 7.1.0 [default] to 7.1.2 [default]
packages/x86-64-v3-poky-linux/python3-pbr/python3-pbr: PKGSIZE changed from 740280 to 740476 (+0%)
packages/x86-64-v3-poky-linux/python3-pbr/python3-pbr: PV changed from "7.1.0" to "7.1.2"
packages/x86-64-v3-poky-linux/python3-pbr/python3-pbr: FILELIST: directory renamed /usr/lib/python3.14/site-packages/pbr-7.1.0.dist-info -> /usr/lib/python3.14/site-packages/pbr-7.1.2.dist-info, directory renamed /usr/lib/python3.14/site-packages/pbr-7.1.0.dist-info/licenses -> /usr/lib/python3.14/site-packages/pbr-7.1.2.dist-info/licenses
Changes to packages/x86-64-v3-poky-linux/python3-pbr (sysroot):
  /usr/lib/python3.14/site-packages/pbr-7.1.0.dist-info moved to /usr/lib/python3.14/site-packages/pbr-7.1.2.dist-info

--===============9020329049478053745==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="python3-pbr-changelog.txt"

7.1.2
-----

7.1.1
-----

--===============9020329049478053745==--

