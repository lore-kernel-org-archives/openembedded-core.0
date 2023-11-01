Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A11CC07EBE
	for <webhook@archiver.kernel.org>; Wed,  1 Nov 2023 14:25:14 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web10.8647.1698848703568689614
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Nov 2023 07:25:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=f+haSQAu;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=Wx0aQBod;
 spf=pass (domain: automation.yoctoproject.org, ip: 54.240.27.192, mailfrom: 0101018b8b4608b3-350b986c-118f-4785-b552-0b9d7f4e1ef7-000000@automation.yoctoproject.org)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1698848704;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=yh2vCG73gyJSg0cdJkTNUP95hlPRQdTqW2o0HYWe7sw=;
	b=f+haSQAu+VKNeZB4bkUgfRAtdgTE3Qu/pMPajrSml8J9/BjUauOnu3s0VWUfSC6j
	USRrIk3Ofywi5ylMEEIAisp86g8TNHpV70TqiUZnZrAwfiD1C/+ikbHC2AVG2vfyB7q
	gxTSL+jRZBNk0kto5uWnJw93bSDN9UHq+JJR4LaQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1698848704;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=yh2vCG73gyJSg0cdJkTNUP95hlPRQdTqW2o0HYWe7sw=;
	b=Wx0aQBodv62o/f7Dq7KoiAbQh9xuJuRZm1DZyQ3Q+HcFqjLZcWB88Ed75i4LraeM
	tNrLNL2bT+S92U1srkU/f3tMOiPNNKUPPENJJbJudzXjFQOcjOOhV70bkCN1kv/Lh7k
	2AZ74IGh6jAQWmnWIHPZaa8kqaYT9lW02tntE5Ew=
Content-Type: multipart/mixed; boundary="===============1459951625055196828=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] cronie: upgrading to 1.7.0 SUCCEEDED
Message-ID: <0101018b8b4608b3-350b986c-118f-4785-b552-0b9d7f4e1ef7-000000@us-west-2.amazonses.com>
Date: Wed, 1 Nov 2023 14:25:04 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.01-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Nov 2023 14:25:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189985

--===============1459951625055196828==
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
From 46dc7d92a8856fd21c80e77a8f98d943128a5e04 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 1 Nov 2023 11:07:54 +0000
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


--===============1459951625055196828==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/cronie/cronie-dbg: PV changed from "1.6.1" to "1.7.0"
packages/core2-64-poky-linux/cronie/cronie-dbg: PKGSIZE changed from 421616 to 430632 (+2%)
packages/core2-64-poky-linux/cronie/cronie-dbg: PKGV changed from 1.6.1 [default] to 1.7.0 [default]
packages/core2-64-poky-linux/cronie/cronie-dev: PV changed from "1.6.1" to "1.7.0"
packages/core2-64-poky-linux/cronie/cronie-dev: PKGV changed from 1.6.1 [default] to 1.7.0 [default]
packages/core2-64-poky-linux/cronie/cronie-doc: PV changed from "1.6.1" to "1.7.0"
packages/core2-64-poky-linux/cronie/cronie-doc: PKGSIZE changed from 30759 to 31997 (+4%)
packages/core2-64-poky-linux/cronie/cronie-doc: PKGV changed from 1.6.1 [default] to 1.7.0 [default]
packages/core2-64-poky-linux/cronie/cronie-locale: PV changed from "1.6.1" to "1.7.0"
packages/core2-64-poky-linux/cronie/cronie-locale: PKGV changed from 1.6.1 [default] to 1.7.0 [default]
packages/core2-64-poky-linux/cronie/cronie-src: PV changed from "1.6.1" to "1.7.0"
packages/core2-64-poky-linux/cronie/cronie-src: PKGSIZE changed from 183093 to 188710 (+3%)
packages/core2-64-poky-linux/cronie/cronie-src: PKGV changed from 1.6.1 [default] to 1.7.0 [default]
packages/core2-64-poky-linux/cronie/cronie-staticdev: PV changed from "1.6.1" to "1.7.0"
packages/core2-64-poky-linux/cronie/cronie-staticdev: PKGV changed from 1.6.1 [default] to 1.7.0 [default]
packages/core2-64-poky-linux/cronie/cronie: PV changed from "1.6.1" to "1.7.0"
packages/core2-64-poky-linux/cronie/cronie: PKGSIZE changed from 166417 to 174609 (+5%)
packages/core2-64-poky-linux/cronie/cronie: PKGV changed from 1.6.1 [default] to 1.7.0 [default]
packages/core2-64-poky-linux/cronie: PV changed from "1.6.1" to "1.7.0"
packages/core2-64-poky-linux/cronie: SRC_URI changed from "https://github.com/cronie-crond/cronie/releases//download/cronie-1.6.1/cronie-1.6.1.tar.gz file://crond.init file://crontab file://crond.service file://crond_pam_config.patch" to "https://github.com/cronie-crond/cronie/releases//download/cronie-1.7.0/cronie-1.7.0.tar.gz file://crond.init file://crontab file://crond.service file://crond_pam_config.patch"
packages/core2-64-poky-linux/cronie: PKGV changed from 1.6.1 [default] to 1.7.0 [default]

--===============1459951625055196828==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-cronie-upgrade-1.6.1-1.7.0.patch"

RnJvbSA0NmRjN2Q5MmE4ODU2ZmQyMWM4MGU3N2E4Zjk4ZDk0MzEyOGE1ZTA0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBOb3YgMjAyMyAxMTowNzo1NCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGNy
b25pZTogdXBncmFkZSAxLjYuMSAtPiAxLjcuMAoKLS0tCiAuLi4vY3JvbmllL3tjcm9uaWVfMS42
LjEuYmIgPT4gY3JvbmllXzEuNy4wLmJifSAgICAgICAgICAgICAgICAgfCAyICstCiAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3JlY2lw
ZXMtZXh0ZW5kZWQvY3JvbmllL3tjcm9uaWVfMS42LjEuYmIgPT4gY3JvbmllXzEuNy4wLmJifSAo
OTclKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9jcm9uaWUvY3JvbmllXzEu
Ni4xLmJiIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2Nyb25pZS9jcm9uaWVfMS43LjAuYmIKc2lt
aWxhcml0eSBpbmRleCA5NyUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2Nyb25p
ZS9jcm9uaWVfMS42LjEuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1leHRlbmRlZC9jcm9uaWUv
Y3JvbmllXzEuNy4wLmJiCmluZGV4IDFiMzFiZjBkYjIuLjI0YzQxOWIxYzUgMTAwNjQ0Ci0tLSBh
L21ldGEvcmVjaXBlcy1leHRlbmRlZC9jcm9uaWUvY3JvbmllXzEuNi4xLmJiCisrKyBiL21ldGEv
cmVjaXBlcy1leHRlbmRlZC9jcm9uaWUvY3JvbmllXzEuNy4wLmJiCkBAIC0yNSw3ICsyNSw3IEBA
IFNSQ19VUkkgPSAiJHtHSVRIVUJfQkFTRV9VUkl9L2Rvd25sb2FkL2Nyb25pZS0ke1BWfS9jcm9u
aWUtJHtQVn0udGFyLmd6IFwKIFBBTV9TUkNfVVJJID0gImZpbGU6Ly9jcm9uZF9wYW1fY29uZmln
LnBhdGNoIgogUEFNX0RFUFMgPSAibGlicGFtIGxpYnBhbS1ydW50aW1lIHBhbS1wbHVnaW4tYWNj
ZXNzIHBhbS1wbHVnaW4tbG9naW51aWQiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICIyY2QwZjBk
ZDE2ODBlNmI5YzM5YmYxZTNhNWU3YWQ2ZGY3NmFhOTQwZGUxZWU5MGE0NTM2MzNhYTU5OTg0ZTYy
IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjY4MjdmNWE0Nzc2MGNjNjRhZmVlZjBhNjBkM2NiNTM3
NmY1MjU2OTEwOWZjOWE3Mzk1N2RkNWU5ZmRhZTc2MTkiCiAKIGluaGVyaXQgYXV0b3Rvb2xzIHVw
ZGF0ZS1yYy5kIHVzZXJhZGQgc3lzdGVtZCBnaXRodWItcmVsZWFzZXMKIFVQU1RSRUFNX0NIRUNL
X1JFR0VYID0gInJlbGVhc2VzL3RhZy9jcm9uaWUtKD9QPHB2ZXI+XGQrKFwuXGQrKSspIgotLSAK
Mi4zOS4yCgo=

--===============1459951625055196828==--

