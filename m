Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B63F3C04AA7
	for <webhook@archiver.kernel.org>; Sun, 15 Oct 2023 19:45:22 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web10.102664.1697399114050803084
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Oct 2023 12:45:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=f/nJ0dfC;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=hNhGm0gT;
 spf=pass (domain: automation.yoctoproject.org, ip: 54.240.27.30, mailfrom: 0101018b34df0b8e-1056bafb-72a4-4f3a-a936-538b940df315-000000@automation.yoctoproject.org)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1697399114;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=f4MlpnE35w4n5VTvoyL7Hw+MjocfUwxGGLOGL0548KM=;
	b=f/nJ0dfC+FAP7PPkrJZb5I8zrwEOAfWer2FTQNwWUqJDtfnsuSWt9xbOirI07eW8
	Be49j7SnqfEy2V6yCon2ZqZcjB09+GlGKs7xtarZJNProVKidx6TStHSNuO3I6AhCZG
	Z02sUnP4QxhqWaFqqQrxY+UzIrwkSfq47bWv9SW8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1697399114;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=f4MlpnE35w4n5VTvoyL7Hw+MjocfUwxGGLOGL0548KM=;
	b=hNhGm0gTw2MEMplW5z6ASPeyeLaRmWo+dhAsSzyRkvozeoCS1fp4fuAmoqmneEmC
	yY6UHig4HwPjXRVjSrk7TsDvhTXhOUdUw5K2cb3aFeNeE1Qqfg/P4Mjl5U7R2T9h0I1
	mNwjsmIhroobfrqA27gaXmib8/8xgJy0alUtalYQ=
Content-Type: multipart/mixed; boundary="===============1332120372086311171=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] cronie: upgrading to 1.7.0 SUCCEEDED
Message-ID: <0101018b34df0b8e-1056bafb-72a4-4f3a-a936-538b940df315-000000@us-west-2.amazonses.com>
Date: Sun, 15 Oct 2023 19:45:14 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.10.15-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Oct 2023 19:45:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189202

--===============1332120372086311171==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *cronie* to *1.7.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-cronie-upgrade-1.6.1-1.7.0.patch
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
From cfaf0e763ba6941e58aec88d457b30fe1f5a1bed Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 15 Oct 2023 14:07:48 +0000
Subject: [PATCH] cronie: upgrade 1.6.1 -> 1.7.0

---
 .../cronie/{cronie_1.6.1.bb => cronie_1.7.0.bb}                 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/cronie/{cronie_1.6.1.bb => cronie_1.7.0.bb} (97%)

diff --git a/meta/recipes-extended/cronie/cronie_1.6.1.bb b/meta/recipes-extended/cronie/cronie_1.7.0.bb
similarity index 97%
rename from meta/recipes-extended/cronie/cronie_1.6.1.bb
rename to meta/recipes-extended/cronie/cronie_1.7.0.bb
index 1b31bf0db2..24c419b1c5 100644
--- a/meta/recipes-extended/cronie/cronie_1.6.1.bb
+++ b/meta/recipes-extended/cronie/cronie_1.7.0.bb
@@ -25,7 +25,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/cronie-${PV}/cronie-${PV}.tar.gz \
 PAM_SRC_URI = "file://crond_pam_config.patch"
 PAM_DEPS = "libpam libpam-runtime pam-plugin-access pam-plugin-loginuid"
 
-SRC_URI[sha256sum] = "2cd0f0dd1680e6b9c39bf1e3a5e7ad6df76aa940de1ee90a453633aa59984e62"
+SRC_URI[sha256sum] = "6827f5a47760cc64afeef0a60d3cb5376f52569109fc9a73957dd5e9fdae7619"
 
 inherit autotools update-rc.d useradd systemd github-releases
 UPSTREAM_CHECK_REGEX = "releases/tag/cronie-(?P<pver>\d+(\.\d+)+)"
-- 
2.39.2


--===============1332120372086311171==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/cronie/cronie-dbg: PKGSIZE changed from 358940 to 363064 (+1%)
packages/core2-32-poky-linux/cronie/cronie-dbg: PV changed from "1.6.1" to "1.7.0"
packages/core2-32-poky-linux/cronie/cronie-dbg: PKGV changed from 1.6.1 [default] to 1.7.0 [default]
packages/core2-32-poky-linux/cronie/cronie-dev: PV changed from "1.6.1" to "1.7.0"
packages/core2-32-poky-linux/cronie/cronie-dev: PKGV changed from 1.6.1 [default] to 1.7.0 [default]
packages/core2-32-poky-linux/cronie/cronie-doc: PKGSIZE changed from 30759 to 31997 (+4%)
packages/core2-32-poky-linux/cronie/cronie-doc: PV changed from "1.6.1" to "1.7.0"
packages/core2-32-poky-linux/cronie/cronie-doc: PKGV changed from 1.6.1 [default] to 1.7.0 [default]
packages/core2-32-poky-linux/cronie/cronie-locale: PV changed from "1.6.1" to "1.7.0"
packages/core2-32-poky-linux/cronie/cronie-locale: PKGV changed from 1.6.1 [default] to 1.7.0 [default]
packages/core2-32-poky-linux/cronie/cronie-src: PKGSIZE changed from 183093 to 188710 (+3%)
packages/core2-32-poky-linux/cronie/cronie-src: PV changed from "1.6.1" to "1.7.0"
packages/core2-32-poky-linux/cronie/cronie-src: PKGV changed from 1.6.1 [default] to 1.7.0 [default]
packages/core2-32-poky-linux/cronie/cronie-staticdev: PV changed from "1.6.1" to "1.7.0"
packages/core2-32-poky-linux/cronie/cronie-staticdev: PKGV changed from 1.6.1 [default] to 1.7.0 [default]
packages/core2-32-poky-linux/cronie/cronie: PV changed from "1.6.1" to "1.7.0"
packages/core2-32-poky-linux/cronie/cronie: PKGV changed from 1.6.1 [default] to 1.7.0 [default]
packages/core2-32-poky-linux/cronie: PV changed from "1.6.1" to "1.7.0"
packages/core2-32-poky-linux/cronie: SRC_URI changed from "https://github.com/cronie-crond/cronie/releases//download/cronie-1.6.1/cronie-1.6.1.tar.gz file://crond.init file://crontab file://crond.service file://crond_pam_config.patch" to "https://github.com/cronie-crond/cronie/releases//download/cronie-1.7.0/cronie-1.7.0.tar.gz file://crond.init file://crontab file://crond.service file://crond_pam_config.patch"
packages/core2-32-poky-linux/cronie: PKGV changed from 1.6.1 [default] to 1.7.0 [default]

--===============1332120372086311171==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-cronie-upgrade-1.6.1-1.7.0.patch"

RnJvbSBjZmFmMGU3NjNiYTY5NDFlNThhZWM4OGQ0NTdiMzBmZTFmNWExYmVkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMTUgT2N0IDIwMjMgMTQ6MDc6NDggKzAwMDAKU3ViamVjdDogW1BBVENIXSBj
cm9uaWU6IHVwZ3JhZGUgMS42LjEgLT4gMS43LjAKCi0tLQogLi4uL2Nyb25pZS97Y3JvbmllXzEu
Ni4xLmJiID0+IGNyb25pZV8xLjcuMC5iYn0gICAgICAgICAgICAgICAgIHwgMiArLQogMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNp
cGVzLWV4dGVuZGVkL2Nyb25pZS97Y3JvbmllXzEuNi4xLmJiID0+IGNyb25pZV8xLjcuMC5iYn0g
KDk3JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvY3JvbmllL2Nyb25pZV8x
LjYuMS5iYiBiL21ldGEvcmVjaXBlcy1leHRlbmRlZC9jcm9uaWUvY3JvbmllXzEuNy4wLmJiCnNp
bWlsYXJpdHkgaW5kZXggOTclCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1leHRlbmRlZC9jcm9u
aWUvY3JvbmllXzEuNi4xLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZXh0ZW5kZWQvY3Jvbmll
L2Nyb25pZV8xLjcuMC5iYgppbmRleCAxYjMxYmYwZGIyLi4yNGM0MTliMWM1IDEwMDY0NAotLS0g
YS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvY3JvbmllL2Nyb25pZV8xLjYuMS5iYgorKysgYi9tZXRh
L3JlY2lwZXMtZXh0ZW5kZWQvY3JvbmllL2Nyb25pZV8xLjcuMC5iYgpAQCAtMjUsNyArMjUsNyBA
QCBTUkNfVVJJID0gIiR7R0lUSFVCX0JBU0VfVVJJfS9kb3dubG9hZC9jcm9uaWUtJHtQVn0vY3Jv
bmllLSR7UFZ9LnRhci5neiBcCiBQQU1fU1JDX1VSSSA9ICJmaWxlOi8vY3JvbmRfcGFtX2NvbmZp
Zy5wYXRjaCIKIFBBTV9ERVBTID0gImxpYnBhbSBsaWJwYW0tcnVudGltZSBwYW0tcGx1Z2luLWFj
Y2VzcyBwYW0tcGx1Z2luLWxvZ2ludWlkIgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiMmNkMGYw
ZGQxNjgwZTZiOWMzOWJmMWUzYTVlN2FkNmRmNzZhYTk0MGRlMWVlOTBhNDUzNjMzYWE1OTk4NGU2
MiIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICI2ODI3ZjVhNDc3NjBjYzY0YWZlZWYwYTYwZDNjYjUz
NzZmNTI1NjkxMDlmYzlhNzM5NTdkZDVlOWZkYWU3NjE5IgogCiBpbmhlcml0IGF1dG90b29scyB1
cGRhdGUtcmMuZCB1c2VyYWRkIHN5c3RlbWQgZ2l0aHViLXJlbGVhc2VzCiBVUFNUUkVBTV9DSEVD
S19SRUdFWCA9ICJyZWxlYXNlcy90YWcvY3JvbmllLSg/UDxwdmVyPlxkKyhcLlxkKykrKSIKLS0g
CjIuMzkuMgoK

--===============1332120372086311171==--

