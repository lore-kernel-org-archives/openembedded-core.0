Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B28D5C2FC0E
	for <webhook@archiver.kernel.org>; Fri, 16 Jun 2023 03:51:29 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web10.816.1686887482516053385
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Jun 2023 20:51:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=aoyBukmH;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 01010188c25443d0-6a67f9ec-efb3-4ee4-8b8a-cc695843772b-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1686887482;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=xuyEQkxIP7x8h+vWztASnjS0AFqFtbbu/maQtIrS5k8=;
	b=aoyBukmHrFjY08jVf4Hb7o/SkDD+Yt/FcVcHZardVEw5AycUGYGyQzmBE1NXAc6S
	zgGbtu0Sq21dApCeLpVIqeBqGmO9tP5eg1g30KI2+5pUPfWl2AozGwTw7b+800FsvUi
	JYBkedas7NWCdMswtyLRyzXp/EZg8cBSMo2dSGbo=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1686887482;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=xuyEQkxIP7x8h+vWztASnjS0AFqFtbbu/maQtIrS5k8=;
	b=mjE6N8RGgG8tQ4Vlzf1/VJoqRfJ8UvvBPkS9SWGHIw6DCnD2dEzENdgwvO39efzr
	M7PIGMQD/BSMSmb4OipH4tzuZNSlbsmS1lvQimmd9ixe/4ZRODhMc02Za/AuSEJLTNB
	A/VhqWdJmYqcHQLEzTzPOaHbqIP+ouEoRbQ0pWg8=
Content-Type: multipart/mixed; boundary="===============5150558360861730720=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] meson: upgrading to 1.1.1 SUCCEEDED
Message-ID: <01010188c25443d0-6a67f9ec-efb3-4ee4-8b8a-cc695843772b-000000@us-west-2.amazonses.com>
Date: Fri, 16 Jun 2023 03:51:22 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.06.16-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Jun 2023 03:51:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182910

--===============5150558360861730720==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *meson* to *1.1.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-meson-upgrade-1.1.0-1.1.1.patch
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
From 41cb2438c1c0f3f5288b4a7b9c2af7ad36058b07 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 15 Jun 2023 11:56:18 +0000
Subject: [PATCH] meson: upgrade 1.1.0 -> 1.1.1

---
 meta/recipes-devtools/meson/{meson_1.1.0.bb => meson_1.1.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/meson/{meson_1.1.0.bb => meson_1.1.1.bb} (98%)

diff --git a/meta/recipes-devtools/meson/meson_1.1.0.bb b/meta/recipes-devtools/meson/meson_1.1.1.bb
similarity index 98%
rename from meta/recipes-devtools/meson/meson_1.1.0.bb
rename to meta/recipes-devtools/meson/meson_1.1.1.bb
index 1190d5c34d..500e13775f 100644
--- a/meta/recipes-devtools/meson/meson_1.1.0.bb
+++ b/meta/recipes-devtools/meson/meson_1.1.1.bb
@@ -15,7 +15,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/meson-${PV}.tar.gz \
            file://0001-Make-CPU-family-warnings-fatal.patch \
            file://0002-Support-building-allarch-recipes-again.patch \
            "
-SRC_URI[sha256sum] = "d9616c44cd6c53689ff8f05fc6958a693f2e17c3472a8daf83cee55dabff829f"
+SRC_URI[sha256sum] = "d04b541f97ca439fb82fab7d0d480988be4bd4e62563a5ca35fadb5400727b1c"
 
 inherit python_setuptools_build_meta github-releases
 
-- 
2.39.2


--===============5150558360861730720==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-meson-upgrade-1.1.0-1.1.1.patch"

RnJvbSA0MWNiMjQzOGMxYzBmM2Y1Mjg4YjRhN2I5YzJhZjdhZDM2MDU4YjA3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgSnVuIDIwMjMgMTE6NTY6MTggKzAwMDAKU3ViamVjdDogW1BBVENIXSBt
ZXNvbjogdXBncmFkZSAxLjEuMCAtPiAxLjEuMQoKLS0tCiBtZXRhL3JlY2lwZXMtZGV2dG9vbHMv
bWVzb24ve21lc29uXzEuMS4wLmJiID0+IG1lc29uXzEuMS4xLmJifSB8IDIgKy0KIDEgZmlsZSBj
aGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEvcmVjaXBl
cy1kZXZ0b29scy9tZXNvbi97bWVzb25fMS4xLjAuYmIgPT4gbWVzb25fMS4xLjEuYmJ9ICg5OCUp
CgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL21lc29uL21lc29uXzEuMS4wLmJi
IGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL21lc29uL21lc29uXzEuMS4xLmJiCnNpbWlsYXJpdHkg
aW5kZXggOTglCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9tZXNvbi9tZXNvbl8x
LjEuMC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL21lc29uL21lc29uXzEuMS4x
LmJiCmluZGV4IDExOTBkNWMzNGQuLjUwMGUxMzc3NWYgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBl
cy1kZXZ0b29scy9tZXNvbi9tZXNvbl8xLjEuMC5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvbWVzb24vbWVzb25fMS4xLjEuYmIKQEAgLTE1LDcgKzE1LDcgQEAgU1JDX1VSSSA9ICIke0dJ
VEhVQl9CQVNFX1VSSX0vZG93bmxvYWQvJHtQVn0vbWVzb24tJHtQVn0udGFyLmd6IFwKICAgICAg
ICAgICAgZmlsZTovLzAwMDEtTWFrZS1DUFUtZmFtaWx5LXdhcm5pbmdzLWZhdGFsLnBhdGNoIFwK
ICAgICAgICAgICAgZmlsZTovLzAwMDItU3VwcG9ydC1idWlsZGluZy1hbGxhcmNoLXJlY2lwZXMt
YWdhaW4ucGF0Y2ggXAogICAgICAgICAgICAiCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiZDk2MTZj
NDRjZDZjNTM2ODlmZjhmMDVmYzY5NThhNjkzZjJlMTdjMzQ3MmE4ZGFmODNjZWU1NWRhYmZmODI5
ZiIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICJkMDRiNTQxZjk3Y2E0MzlmYjgyZmFiN2QwZDQ4MDk4
OGJlNGJkNGU2MjU2M2E1Y2EzNWZhZGI1NDAwNzI3YjFjIgogCiBpbmhlcml0IHB5dGhvbl9zZXR1
cHRvb2xzX2J1aWxkX21ldGEgZ2l0aHViLXJlbGVhc2VzCiAKLS0gCjIuMzkuMgoK

--===============5150558360861730720==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/meson: SRC_URI changed from "https://github.com/mesonbuild/meson/releases//download/1.1.0/meson-1.1.0.tar.gz file://meson-setup.py file://meson-wrapper file://0001-python-module-do-not-manipulate-the-environment-when.patch file://0001-Make-CPU-family-warnings-fatal.patch file://0002-Support-building-allarch-recipes-again.patch" to "https://github.com/mesonbuild/meson/releases//download/1.1.1/meson-1.1.1.tar.gz file://meson-setup.py file://meson-wrapper file://0001-python-module-do-not-manipulate-the-environment-when.patch file://0001-Make-CPU-family-warnings-fatal.patch file://0002-Support-building-allarch-recipes-again.patch"
packages/core2-32-poky-linux/meson: PKGV changed from 1.1.0 [default] to 1.1.1 [default]
packages/core2-32-poky-linux/meson: PV changed from "1.1.0" to "1.1.1"
packages/core2-32-poky-linux/meson/meson-dbg: PKGV changed from 1.1.0 [default] to 1.1.1 [default]
packages/core2-32-poky-linux/meson/meson-dbg: PV changed from "1.1.0" to "1.1.1"
packages/core2-32-poky-linux/meson/meson-dev: PKGV changed from 1.1.0 [default] to 1.1.1 [default]
packages/core2-32-poky-linux/meson/meson-dev: PV changed from "1.1.0" to "1.1.1"
packages/core2-32-poky-linux/meson/meson-doc: PKGV changed from 1.1.0 [default] to 1.1.1 [default]
packages/core2-32-poky-linux/meson/meson-doc: PKGSIZE changed from 5356 to 5354 (-0%)
packages/core2-32-poky-linux/meson/meson-doc: PV changed from "1.1.0" to "1.1.1"
packages/core2-32-poky-linux/meson/meson-locale: PKGV changed from 1.1.0 [default] to 1.1.1 [default]
packages/core2-32-poky-linux/meson/meson-locale: PV changed from "1.1.0" to "1.1.1"
packages/core2-32-poky-linux/meson/meson-src: PKGV changed from 1.1.0 [default] to 1.1.1 [default]
packages/core2-32-poky-linux/meson/meson-src: PV changed from "1.1.0" to "1.1.1"
packages/core2-32-poky-linux/meson/meson-staticdev: PKGV changed from 1.1.0 [default] to 1.1.1 [default]
packages/core2-32-poky-linux/meson/meson-staticdev: PV changed from "1.1.0" to "1.1.1"
packages/core2-32-poky-linux/meson/meson: PKGV changed from 1.1.0 [default] to 1.1.1 [default]
packages/core2-32-poky-linux/meson/meson: PKGSIZE changed from 7964390 to 7977816 (+0%)
packages/core2-32-poky-linux/meson/meson: PV changed from "1.1.0" to "1.1.1"
Changes to packages/core2-32-poky-linux/meson (sysroot):
  /usr/lib/python3.11/site-packages/meson-1.1.0.dist-info moved to /usr/lib/python3.11/site-packages/meson-1.1.1.dist-info

--===============5150558360861730720==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/meson (sysroot):
  /usr/lib/python3.11/site-packages/meson-1.1.0.dist-info moved to /usr/lib/python3.11/site-packages/meson-1.1.1.dist-info

--===============5150558360861730720==--

