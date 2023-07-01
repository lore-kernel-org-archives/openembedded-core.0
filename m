Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D389C00528
	for <webhook@archiver.kernel.org>; Sat,  1 Jul 2023 16:02:06 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web10.10497.1688227322901975789
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Jul 2023 09:02:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=Bk7nsPwZ;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 010101891230a09e-8967d1d0-247d-4147-9964-6dd5324687ae-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1688227324;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=oLu8UNvPj95btPw6an/Faq5XqJHUOB4H2XUG8FlsdsM=;
	b=Bk7nsPwZY3HZLsE5Mp6gkSnttVLCsCv32jX303KPBL8zro9VoS72Yxx+TiYivfoU
	+LIncQ3Tbw6sV0wYGdJByfuH+QsC/ohWQ38qoXbplVhvsvRH5JN4lGxXjDuKEwqMVUx
	7ly41feVvaBjDmfPHvEitywW8IMDiIhkuvmTlAK8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1688227324;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=oLu8UNvPj95btPw6an/Faq5XqJHUOB4H2XUG8FlsdsM=;
	b=ms045/Kw9tQ2Iz7kQ2GGb7uN1zcOEGDOM9pYpu5YSAQHMFepppCCuYTYDON25hmY
	ieshClS6fWu1NMjylal0WNUNgQUuHm/HtJ1Fdu51LveuG1QTUt1VRBZzVwbwWyWRQdN
	AYM1f73EmABhrJL6i0Ijby6Z88/BWD+S9CZP7JCM=
Content-Type: multipart/mixed; boundary="===============1073493642838458987=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] p11-kit: upgrading to 0.25.0 SUCCEEDED
Message-ID: <010101891230a09e-8967d1d0-247d-4147-9964-6dd5324687ae-000000@us-west-2.amazonses.com>
Date: Sat, 1 Jul 2023 16:02:04 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.07.01-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Jul 2023 16:02:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183762

--===============1073493642838458987==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *p11-kit* to *0.25.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-p11-kit-upgrade-0.24.1-0.25.0.patch
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
From c1cf4fc17eb1af6b52dac2dd4f729a33aaeba0f9 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 1 Jul 2023 15:22:05 +0000
Subject: [PATCH] p11-kit: upgrade 0.24.1 -> 0.25.0

---
 .../p11-kit/{p11-kit_0.24.1.bb => p11-kit_0.25.0.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/p11-kit/{p11-kit_0.24.1.bb => p11-kit_0.25.0.bb} (96%)

diff --git a/meta/recipes-support/p11-kit/p11-kit_0.24.1.bb b/meta/recipes-support/p11-kit/p11-kit_0.25.0.bb
similarity index 96%
rename from meta/recipes-support/p11-kit/p11-kit_0.24.1.bb
rename to meta/recipes-support/p11-kit/p11-kit_0.25.0.bb
index 72b446204a..ad207d0c9f 100644
--- a/meta/recipes-support/p11-kit/p11-kit_0.24.1.bb
+++ b/meta/recipes-support/p11-kit/p11-kit_0.25.0.bb
@@ -11,7 +11,7 @@ DEPENDS = "libtasn1 libtasn1-native libffi"
 DEPENDS:append = "${@' glib-2.0' if d.getVar('GTKDOC_ENABLED') == 'True' else ''}"
 
 SRC_URI = "git://github.com/p11-glue/p11-kit;branch=master;protocol=https"
-SRCREV = "dd0590d4e583f107e3e9fafe9ed754149da335d0"
+SRCREV = "a8cce8bd8065bbf80bd47219f85f0cd9cf27dd0c"
 S = "${WORKDIR}/git"
 
 PACKAGECONFIG ??= ""
-- 
2.39.2


--===============1073493642838458987==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/p11-kit: PACKAGES: added "p11-kit-locale-si"
packages/core2-32-poky-linux/p11-kit/p11-kit-dbg: PKGSIZE changed from 6784080 to 8909492 (+31%)
packages/core2-32-poky-linux/p11-kit/p11-kit-dev: PKGSIZE changed from 94705 to 108930 (+15%)
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-ast: PKGSIZE changed from 491 to 7964 (+1522%)
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-da: PKGSIZE changed from 7849 to 29232 (+272%)
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-de: PKGSIZE changed from 8572 to 19269 (+125%)
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-es: PKGSIZE changed from 8172 to 30452 (+273%)
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-eu: PKGSIZE changed from 483 to 2175 (+350%)
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-fi: PKGSIZE changed from 8185 to 28617 (+250%)
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-he: PKGSIZE changed from 479 to 556 (+16%)
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-hr: PKGSIZE changed from 7765 to 12578 (+62%)
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-hu: PKGSIZE changed from 7913 to 33175 (+319%)
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-id: PKGSIZE changed from 7454 to 29154 (+291%)
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-ka: PKGSIZE changed from 4310 to 7948 (+84%)
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-ko: PKGSIZE changed from 7917 to 20306 (+156%)
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-lt: PKGSIZE changed from 546 to 2361 (+332%)
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-pa: PKGSIZE changed from 10054 to 11212 (+12%)
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-pl: PKGSIZE changed from 8274 to 10038 (+21%)
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-pt-br: PKGSIZE changed from 8170 to 30916 (+278%)
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-sv: PKGSIZE changed from 7791 to 29402 (+277%)
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-uk: PKGSIZE changed from 10982 to 40946 (+273%)
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-zh-tw: PKGSIZE changed from 548 to 7014 (+1180%)
packages/core2-32-poky-linux/p11-kit/p11-kit-src: PKGSIZE changed from 1487510 to 1683673 (+13%)
packages/core2-32-poky-linux/p11-kit/p11-kit: PKGSIZE changed from 2971875 to 3895319 (+31%)

--===============1073493642838458987==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-p11-kit-upgrade-0.24.1-0.25.0.patch"

RnJvbSBjMWNmNGZjMTdlYjFhZjZiNTJkYWMyZGQ0ZjcyOWEzM2FhZWJhMGY5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMSBKdWwgMjAyMyAxNToyMjowNSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHAx
MS1raXQ6IHVwZ3JhZGUgMC4yNC4xIC0+IDAuMjUuMAoKLS0tCiAuLi4vcDExLWtpdC97cDExLWtp
dF8wLjI0LjEuYmIgPT4gcDExLWtpdF8wLjI1LjAuYmJ9ICAgICAgICAgICAgfCAyICstCiAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3Jl
Y2lwZXMtc3VwcG9ydC9wMTEta2l0L3twMTEta2l0XzAuMjQuMS5iYiA9PiBwMTEta2l0XzAuMjUu
MC5iYn0gKDk2JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9wMTEta2l0L3Ax
MS1raXRfMC4yNC4xLmJiIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvcDExLWtpdC9wMTEta2l0XzAu
MjUuMC5iYgpzaW1pbGFyaXR5IGluZGV4IDk2JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtc3Vw
cG9ydC9wMTEta2l0L3AxMS1raXRfMC4yNC4xLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtc3Vw
cG9ydC9wMTEta2l0L3AxMS1raXRfMC4yNS4wLmJiCmluZGV4IDcyYjQ0NjIwNGEuLmFkMjA3ZDBj
OWYgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L3AxMS1raXQvcDExLWtpdF8wLjI0
LjEuYmIKKysrIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvcDExLWtpdC9wMTEta2l0XzAuMjUuMC5i
YgpAQCAtMTEsNyArMTEsNyBAQCBERVBFTkRTID0gImxpYnRhc24xIGxpYnRhc24xLW5hdGl2ZSBs
aWJmZmkiCiBERVBFTkRTOmFwcGVuZCA9ICIke0AnIGdsaWItMi4wJyBpZiBkLmdldFZhcignR1RL
RE9DX0VOQUJMRUQnKSA9PSAnVHJ1ZScgZWxzZSAnJ30iCiAKIFNSQ19VUkkgPSAiZ2l0Oi8vZ2l0
aHViLmNvbS9wMTEtZ2x1ZS9wMTEta2l0O2JyYW5jaD1tYXN0ZXI7cHJvdG9jb2w9aHR0cHMiCi1T
UkNSRVYgPSAiZGQwNTkwZDRlNTgzZjEwN2UzZTlmYWZlOWVkNzU0MTQ5ZGEzMzVkMCIKK1NSQ1JF
ViA9ICJhOGNjZThiZDgwNjViYmY4MGJkNDcyMTlmODVmMGNkOWNmMjdkZDBjIgogUyA9ICIke1dP
UktESVJ9L2dpdCIKIAogUEFDS0FHRUNPTkZJRyA/Pz0gIiIKLS0gCjIuMzkuMgoK

--===============1073493642838458987==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/p11-kit: PV changed from "0.24.1" to "0.25.0"
packages/core2-32-poky-linux/p11-kit: PKGV changed from 0.24.1 [default] to 0.25.0 [default]
packages/core2-32-poky-linux/p11-kit: PACKAGES: added "p11-kit-locale-si"
packages/core2-32-poky-linux/p11-kit/p11-kit-bash-completion: PV changed from "0.24.1" to "0.25.0"
packages/core2-32-poky-linux/p11-kit/p11-kit-bash-completion: PKGV changed from 0.24.1 [default] to 0.25.0 [default]
packages/core2-32-poky-linux/p11-kit/p11-kit-bash-completion: PKGSIZE changed from 2560 to 2627 (+3%)
packages/core2-32-poky-linux/p11-kit/p11-kit-dbg: PV changed from "0.24.1" to "0.25.0"
packages/core2-32-poky-linux/p11-kit/p11-kit-dbg: PKGV changed from 0.24.1 [default] to 0.25.0 [default]
packages/core2-32-poky-linux/p11-kit/p11-kit-dbg: PKGSIZE changed from 6784080 to 8909492 (+31%)
packages/core2-32-poky-linux/p11-kit/p11-kit-dev: PV changed from "0.24.1" to "0.25.0"
packages/core2-32-poky-linux/p11-kit/p11-kit-dev: PKGV changed from 0.24.1 [default] to 0.25.0 [default]
packages/core2-32-poky-linux/p11-kit/p11-kit-dev: PKGSIZE changed from 94705 to 108930 (+15%)
packages/core2-32-poky-linux/p11-kit/p11-kit-doc: PV changed from "0.24.1" to "0.25.0"
packages/core2-32-poky-linux/p11-kit/p11-kit-doc: PKGV changed from 0.24.1 [default] to 0.25.0 [default]
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-ar: PV changed from "0.24.1" to "0.25.0"
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-ar: PKGV changed from 0.24.1 [default] to 0.25.0 [default]
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-ar: PKGSIZE changed from 562 to 545 (-3%)
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-as: PV changed from "0.24.1" to "0.25.0"
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-as: PKGV changed from 0.24.1 [default] to 0.25.0 [default]
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-as: PKGSIZE changed from 481 to 464 (-4%)
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-ast: PV changed from "0.24.1" to "0.25.0"
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-ast: PKGV changed from 0.24.1 [default] to 0.25.0 [default]
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-ast: PKGSIZE changed from 491 to 7964 (+1522%)
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-az: PV changed from "0.24.1" to "0.25.0"
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-az: PKGV changed from 0.24.1 [default] to 0.25.0 [default]
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-az: PKGSIZE changed from 484 to 467 (-4%)
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-bg: PV changed from "0.24.1" to "0.25.0"
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-bg: PKGV changed from 0.24.1 [default] to 0.25.0 [default]
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-bg: PKGSIZE changed from 486 to 465 (-4%)
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-bn-in: PV changed from "0.24.1" to "0.25.0"
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-bn-in: PKGV changed from 0.24.1 [default] to 0.25.0 [default]
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-bn-in: PKGSIZE changed from 494 to 477 (-3%)
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-ca+valencia: PV changed from "0.24.1" to "0.25.0"
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-ca+valencia: PKGV changed from 0.24.1 [default] to 0.25.0 [default]
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-ca+valencia: PKGSIZE changed from 510 to 493 (-3%)
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-ca: PV changed from "0.24.1" to "0.25.0"
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-ca: PKGV changed from 0.24.1 [default] to 0.25.0 [default]
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-ca: PKGSIZE changed from 8191 to 8182 (-0%)
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-cs: PV changed from "0.24.1" to "0.25.0"
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-cs: PKGV changed from 0.24.1 [default] to 0.25.0 [default]
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-cs: PKGSIZE changed from 7868 to 7910 (+1%)
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-cy: PV changed from "0.24.1" to "0.25.0"
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-cy: PKGV changed from 0.24.1 [default] to 0.25.0 [default]
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-cy: PKGSIZE changed from 523 to 506 (-3%)
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-da: PV changed from "0.24.1" to "0.25.0"
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-da: PKGV changed from 0.24.1 [default] to 0.25.0 [default]
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-da: PKGSIZE changed from 7849 to 29232 (+272%)
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-de: PV changed from "0.24.1" to "0.25.0"
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-de: PKGV changed from 0.24.1 [default] to 0.25.0 [default]
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-de: PKGSIZE changed from 8572 to 19269 (+125%)
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-el: PV changed from "0.24.1" to "0.25.0"
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-el: PKGV changed from 0.24.1 [default] to 0.25.0 [default]
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-el: PKGSIZE changed from 11068 to 11066 (-0%)
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-en-gb: PV changed from "0.24.1" to "0.25.0"
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-en-gb: PKGV changed from 0.24.1 [default] to 0.25.0 [default]
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-en-gb: PKGSIZE changed from 7670 to 7659 (-0%)
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-eo: PV changed from "0.24.1" to "0.25.0"
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-eo: PKGV changed from 0.24.1 [default] to 0.25.0 [default]
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-eo: PKGSIZE changed from 1494 to 1496 (+0%)
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-es: PV changed from "0.24.1" to "0.25.0"
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-es: PKGV changed from 0.24.1 [default] to 0.25.0 [default]
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-es: PKGSIZE changed from 8172 to 30452 (+273%)
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-et: PV changed from "0.24.1" to "0.25.0"
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-et: PKGV changed from 0.24.1 [default] to 0.25.0 [default]
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-et: PKGSIZE changed from 481 to 464 (-4%)
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-eu: PV changed from "0.24.1" to "0.25.0"
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-eu: PKGV changed from 0.24.1 [default] to 0.25.0 [default]
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-eu: PKGSIZE changed from 483 to 2175 (+350%)
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-fa: PV changed from "0.24.1" to "0.25.0"
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-fa: PKGV changed from 0.24.1 [default] to 0.25.0 [default]
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-fa: PKGSIZE changed from 477 to 462 (-3%)
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-fi: PV changed from "0.24.1" to "0.25.0"
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-fi: PKGV changed from 0.24.1 [default] to 0.25.0 [default]
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-fi: PKGSIZE changed from 8185 to 28617 (+250%)
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-fo: PV changed from "0.24.1" to "0.25.0"
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-fo: PKGV changed from 0.24.1 [default] to 0.25.0 [default]
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-fo: PKGSIZE changed from 480 to 463 (-4%)
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-fr: PV changed from "0.24.1" to "0.25.0"
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-fr: PKGV changed from 0.24.1 [default] to 0.25.0 [default]
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-fr: PKGSIZE changed from 8186 to 8227 (+1%)
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-fur: PV changed from "0.24.1" to "0.25.0"
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-fur: PKGV changed from 0.24.1 [default] to 0.25.0 [default]
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-fur: PKGSIZE changed from 8082 to 8071 (-0%)
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-ga: PV changed from "0.24.1" to "0.25.0"
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-ga: PKGV changed from 0.24.1 [default] to 0.25.0 [default]
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-ga: PKGSIZE changed from 516 to 499 (-3%)
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-gl: PV changed from "0.24.1" to "0.25.0"
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-gl: PKGV changed from 0.24.1 [default] to 0.25.0 [default]
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-gl: PKGSIZE changed from 8202 to 8196 (-0%)
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-gu: PV changed from "0.24.1" to "0.25.0"
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-gu: PKGV changed from 0.24.1 [default] to 0.25.0 [default]
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-gu: PKGSIZE changed from 481 to 464 (-4%)
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-he: PV changed from "0.24.1" to "0.25.0"
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-he: PKGV changed from 0.24.1 [default] to 0.25.0 [default]
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-he: PKGSIZE changed from 479 to 556 (+16%)
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-hi: PV changed from "0.24.1" to "0.25.0"
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-hi: PKGV changed from 0.24.1 [default] to 0.25.0 [default]
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-hi: PKGSIZE changed from 478 to 461 (-4%)
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-hr: PV changed from "0.24.1" to "0.25.0"
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-hr: PKGV changed from 0.24.1 [default] to 0.25.0 [default]
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-hr: PKGSIZE changed from 7765 to 12578 (+62%)
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-hu: PV changed from "0.24.1" to "0.25.0"
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-hu: PKGV changed from 0.24.1 [default] to 0.25.0 [default]
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-hu: PKGSIZE changed from 7913 to 33175 (+319%)
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-ia: PV changed from "0.24.1" to "0.25.0"
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-ia: PKGV changed from 0.24.1 [default] to 0.25.0 [default]
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-ia: PKGSIZE changed from 488 to 467 (-4%)
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-id: PV changed from "0.24.1" to "0.25.0"
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-id: PKGV changed from 0.24.1 [default] to 0.25.0 [default]
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-id: PKGSIZE changed from 7454 to 29154 (+291%)
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-it: PV changed from "0.24.1" to "0.25.0"
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-it: PKGV changed from 0.24.1 [default] to 0.25.0 [default]
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-it: PKGSIZE changed from 8208 to 8236 (+0%)
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-ja: PV changed from "0.24.1" to "0.25.0"
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-ja: PKGV changed from 0.24.1 [default] to 0.25.0 [default]
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-ja: PKGSIZE changed from 9027 to 9012 (-0%)
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-ka: PV changed from "0.24.1" to "0.25.0"
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-ka: PKGV changed from 0.24.1 [default] to 0.25.0 [default]
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-ka: PKGSIZE changed from 4310 to 7948 (+84%)
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-kk: PV changed from "0.24.1" to "0.25.0"
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-kk: PKGV changed from 0.24.1 [default] to 0.25.0 [default]
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-kk: PKGSIZE changed from 827 to 821 (-1%)
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-kn: PV changed from "0.24.1" to "0.25.0"
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-kn: PKGV changed from 0.24.1 [default] to 0.25.0 [default]
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-kn: PKGSIZE changed from 473 to 462 (-2%)
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-ko: PV changed from "0.24.1" to "0.25.0"
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-ko: PKGV changed from 0.24.1 [default] to 0.25.0 [default]
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-ko: PKGSIZE changed from 7917 to 20306 (+156%)
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-lt: PV changed from "0.24.1" to "0.25.0"
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-lt: PKGV changed from 0.24.1 [default] to 0.25.0 [default]
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-lt: PKGSIZE changed from 546 to 2361 (+332%)
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-lv: PV changed from "0.24.1" to "0.25.0"
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-lv: PKGV changed from 0.24.1 [default] to 0.25.0 [default]
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-lv: PKGSIZE changed from 7663 to 7661 (-0%)
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-ml: PV changed from "0.24.1" to "0.25.0"
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-ml: PKGV changed from 0.24.1 [default] to 0.25.0 [default]
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-ml: PKGSIZE changed from 482 to 465 (-4%)
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-mr: PV changed from "0.24.1" to "0.25.0"
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-mr: PKGV changed from 0.24.1 [default] to 0.25.0 [default]
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-mr: PKGSIZE changed from 480 to 463 (-4%)
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-ms: PV changed from "0.24.1" to "0.25.0"
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-ms: PKGV changed from 0.24.1 [default] to 0.25.0 [default]
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-ms: PKGSIZE changed from 471 to 454 (-4%)
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-nb: PV changed from "0.24.1" to "0.25.0"
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-nb: PKGV changed from 0.24.1 [default] to 0.25.0 [default]
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-nb: PKGSIZE changed from 490 to 473 (-3%)
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-nl: PV changed from "0.24.1" to "0.25.0"
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-nl: PKGV changed from 0.24.1 [default] to 0.25.0 [default]
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-nl: PKGSIZE changed from 8021 to 8031 (+0%)
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-nn: PV changed from "0.24.1" to "0.25.0"
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-nn: PKGV changed from 0.24.1 [default] to 0.25.0 [default]
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-nn: PKGSIZE changed from 490 to 473 (-3%)
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-oc: PV changed from "0.24.1" to "0.25.0"
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-oc: PKGV changed from 0.24.1 [default] to 0.25.0 [default]
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-oc: PKGSIZE changed from 8072 to 8061 (-0%)
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-or: PV changed from "0.24.1" to "0.25.0"
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-or: PKGV changed from 0.24.1 [default] to 0.25.0 [default]
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-or: PKGSIZE changed from 478 to 460 (-4%)
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-pa: PV changed from "0.24.1" to "0.25.0"
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-pa: PKGV changed from 0.24.1 [default] to 0.25.0 [default]
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-pa: PKGSIZE changed from 10054 to 11212 (+12%)
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-pl: PV changed from "0.24.1" to "0.25.0"
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-pl: PKGV changed from 0.24.1 [default] to 0.25.0 [default]
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-pl: PKGSIZE changed from 8274 to 10038 (+21%)
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-pt-br: PV changed from "0.24.1" to "0.25.0"
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-pt-br: PKGV changed from 0.24.1 [default] to 0.25.0 [default]
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-pt-br: PKGSIZE changed from 8170 to 30916 (+278%)
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-pt: PV changed from "0.24.1" to "0.25.0"
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-pt: PKGV changed from 0.24.1 [default] to 0.25.0 [default]
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-pt: PKGSIZE changed from 7949 to 7995 (+1%)
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-ro: PV changed from "0.24.1" to "0.25.0"
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-ro: PKGV changed from 0.24.1 [default] to 0.25.0 [default]
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-ro: PKGSIZE changed from 522 to 505 (-3%)
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-ru: PV changed from "0.24.1" to "0.25.0"
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-ru: PKGV changed from 0.24.1 [default] to 0.25.0 [default]
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-ru: PKGSIZE changed from 10444 to 10433 (-0%)
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-sk: PV changed from "0.24.1" to "0.25.0"
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-sk: PKGV changed from 0.24.1 [default] to 0.25.0 [default]
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-sk: PKGSIZE changed from 8020 to 8057 (+0%)
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-sl: PV changed from "0.24.1" to "0.25.0"
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-sl: PKGV changed from 0.24.1 [default] to 0.25.0 [default]
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-sl: PKGSIZE changed from 7702 to 7696 (-0%)
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-sq: PV changed from "0.24.1" to "0.25.0"
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-sq: PKGV changed from 0.24.1 [default] to 0.25.0 [default]
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-sq: PKGSIZE changed from 485 to 464 (-4%)
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-sr+latin: PV changed from "0.24.1" to "0.25.0"
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-sr+latin: PKGV changed from 0.24.1 [default] to 0.25.0 [default]
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-sr+latin: PKGSIZE changed from 574 to 557 (-3%)
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-sr: PV changed from "0.24.1" to "0.25.0"
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-sr: PKGV changed from 0.24.1 [default] to 0.25.0 [default]
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-sr: PKGSIZE changed from 9880 to 9874 (-0%)
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-sv: PV changed from "0.24.1" to "0.25.0"
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-sv: PKGV changed from 0.24.1 [default] to 0.25.0 [default]
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-sv: PKGSIZE changed from 7791 to 29402 (+277%)
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-ta: PV changed from "0.24.1" to "0.25.0"
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-ta: PKGV changed from 0.24.1 [default] to 0.25.0 [default]
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-ta: PKGSIZE changed from 478 to 461 (-4%)
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-te: PV changed from "0.24.1" to "0.25.0"
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-te: PKGV changed from 0.24.1 [default] to 0.25.0 [default]
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-te: PKGSIZE changed from 483 to 462 (-4%)
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-th: PV changed from "0.24.1" to "0.25.0"
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-th: PKGV changed from 0.24.1 [default] to 0.25.0 [default]
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-th: PKGSIZE changed from 470 to 453 (-4%)
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-tr: PV changed from "0.24.1" to "0.25.0"
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-tr: PKGV changed from 0.24.1 [default] to 0.25.0 [default]
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-tr: PKGSIZE changed from 7590 to 7524 (-1%)
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-uk: PV changed from "0.24.1" to "0.25.0"
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-uk: PKGV changed from 0.24.1 [default] to 0.25.0 [default]
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-uk: PKGSIZE changed from 10982 to 40946 (+273%)
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-vi: PV changed from "0.24.1" to "0.25.0"
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-vi: PKGV changed from 0.24.1 [default] to 0.25.0 [default]
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-vi: PKGSIZE changed from 476 to 459 (-4%)
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-wa: PV changed from "0.24.1" to "0.25.0"
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-wa: PKGV changed from 0.24.1 [default] to 0.25.0 [default]
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-wa: PKGSIZE changed from 479 to 462 (-4%)
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-zh-cn: PV changed from "0.24.1" to "0.25.0"
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-zh-cn: PKGV changed from 0.24.1 [default] to 0.25.0 [default]
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-zh-cn: PKGSIZE changed from 7013 to 7401 (+6%)
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-zh-hk: PV changed from "0.24.1" to "0.25.0"
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-zh-hk: PKGV changed from 0.24.1 [default] to 0.25.0 [default]
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-zh-hk: PKGSIZE changed from 495 to 474 (-4%)
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-zh-tw: PV changed from "0.24.1" to "0.25.0"
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-zh-tw: PKGV changed from 0.24.1 [default] to 0.25.0 [default]
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-zh-tw: PKGSIZE changed from 548 to 7014 (+1180%)
packages/core2-32-poky-linux/p11-kit/p11-kit-src: PV changed from "0.24.1" to "0.25.0"
packages/core2-32-poky-linux/p11-kit/p11-kit-src: PKGV changed from 0.24.1 [default] to 0.25.0 [default]
packages/core2-32-poky-linux/p11-kit/p11-kit-src: PKGSIZE changed from 1487510 to 1683673 (+13%)
packages/core2-32-poky-linux/p11-kit/p11-kit-src: FILELIST: removed "/usr/src/debug/p11-kit/0.24.1-r0/common/pkcs11.h /usr/src/debug/p11-kit/0.24.1-r0/p11-kit/rpc-server.c /usr/src/debug/p11-kit/0.24.1-r0/p11-kit/client.h /usr/src/debug/p11-kit/0.24.1-r0/trust/extract.c /usr/src/debug/p11-kit/0.24.1-r0/trust/basic.asn.h /usr/src/debug/p11-kit/0.24.1-r0/p11-kit/server.c /usr/src/debug/p11-kit/0.24.1-r0/p11-kit/client.c /usr/src/debug/p11-kit/0.24.1-r0/trust/extract.h /usr/src/debug/p11-kit/0.24.1-r0/p11-kit/lists.c /usr/src/debug/p11-kit/0.24.1-r0/p11-kit/virtual-fixed-generated.h /usr/src/debug/p11-kit/0.24.1-r0/common/path.c /usr/src/debug/p11-kit/0.24.1-r0/common/tool.c /usr/src/debug/p11-kit/0.24.1-r0/common/path.h /usr/src/debug/p11-kit/0.24.1-r0/common/tool.h /usr/src/debug/p11-kit/0.24.1-r0/common/attrs.c /usr/src/debug/p11-kit/0.24.1-r0/common/attrs.h /usr/src/debug/p11-kit/0.24.1-r0/trust/pkix.asn.h /usr/src/debug/p11-kit/0.24.1-r0/common/array.c /usr/src/debug/p11-kit/0.24.1
 -r0/p11-kit/conf.h /usr/src/debug/p11-kit/0.24.1-r0/p11-kit/proxy.c /usr/src/debug/p11-kit/0.24.1-r0/trust/anchor.c /usr/src/debug/p11-kit/0.24.1-r0/trust/anchor.h /usr/src/debug/p11-kit/0.24.1-r0/trust/openssl.asn.h /usr/src/debug/p11-kit/0.24.1-r0/p11-kit/conf.c /usr/src/debug/p11-kit/0.24.1-r0/common/array.h /usr/src/debug/p11-kit/0.24.1-r0/p11-kit/proxy.h /usr/src/debug/p11-kit/0.24.1-r0/trust/index.h /usr/src/debug/p11-kit/0.24.1-r0/p11-kit/rpc-transport.c /usr/src/debug/p11-kit/0.24.1-r0/trust/index.c /usr/src/debug/p11-kit/0.24.1-r0/common/lexer.c /usr/src/debug/p11-kit/0.24.1-r0/p11-kit/modules.h /usr/src/debug/p11-kit/0.24.1-r0/p11-kit/modules.c /usr/src/debug/p11-kit/0.24.1-r0/common/lexer.h /usr/src/debug/p11-kit/0.24.1-r0/trust/extract-pem.c /usr/src/debug/p11-kit/0.24.1-r0/trust/asn1.h /usr/src/debug/p11-kit/0.24.1-r0/trust/asn1.c /usr/src/debug/p11-kit/0.24.1-r0/common/compat.c /usr/src/debug/p11-kit/0.24.1-r0/p11-kit/pin.h /usr/src/debug/p11-kit/0.24.1-r0/trust/list.c
  /usr/src/debug/p11-kit/0.24.1-r0/common/compat.h /usr/src/debug/p11-kit/0.24.1-r0/p11-kit/pin.c /usr/src/debug/p11-kit/0.24.1-r0/trust/list.h /usr/src/debug/p11-kit/0.24.1-r0/trust/save.h /usr/src/debug/p11-kit/0.24.1-r0/trust/dump.h /usr/src/debug/p11-kit/0.24.1-r0/trust/x509.h /usr/src/debug/p11-kit/0.24.1-r0/p11-kit/rpc-client.c /usr/src/debug/p11-kit/0.24.1-r0/trust/save.c /usr/src/debug/p11-kit/0.24.1-r0/common/pkcs11i.h /usr/src/debug/p11-kit/0.24.1-r0/common/pkcs11x.h /usr/src/debug/p11-kit/0.24.1-r0/trust/x509.c /usr/src/debug/p11-kit/0.24.1-r0/trust/dump.c /usr/src/debug/p11-kit/0.24.1-r0/p11-kit/util.c /usr/src/debug/p11-kit/0.24.1-r0/p11-kit/messages.c /usr/src/debug/p11-kit/0.24.1-r0/p11-kit/rpc.h /usr/src/debug/p11-kit/0.24.1-r0/common/init.h /usr/src/debug/p11-kit/0.24.1-r0/trust/session.h /usr/src/debug/p11-kit/0.24.1-r0/common/vsock.c /usr/src/debug/p11-kit/0.24.1-r0/common/vsock.h /usr/src/debug/p11-kit/0.24.1-r0/trust/session.c /usr/src/debug/p11-kit/0.24.1-r0/com
 mon/dict.c /usr/src/debug/p11-kit/0.24.1-r0/common/library.c /usr/src/debug/p11-kit/0.24.1-r0/trust/digest.h /usr/src/debug/p11-kit/0.24.1-r0/common/unix-peer.h /usr/src/debug/p11-kit/0.24.1-r0/common/library.h /usr/src/debug/p11-kit/0.24.1-r0/common/dict.h /usr/src/debug/p11-kit/0.24.1-r0/common/unix-peer.c /usr/src/debug/p11-kit/0.24.1-r0/trust/digest.c /usr/src/debug/p11-kit/0.24.1-r0/p11-kit/filter.h /usr/src/debug/p11-kit/0.24.1-r0/p11-kit/remote.h /usr/src/debug/p11-kit/0.24.1-r0/p11-kit/filter.c /usr/src/debug/p11-kit/0.24.1-r0/p11-kit/remote.c /usr/src/debug/p11-kit/0.24.1-r0/trust/module.h /usr/src/debug/p11-kit/0.24.1-r0/trust/extract-openssl.c /usr/src/debug/p11-kit/0.24.1-r0/trust/persist.h /usr/src/debug/p11-kit/0.24.1-r0/trust/module.c /usr/src/debug/p11-kit/0.24.1-r0/trust/extract-edk2.c /usr/src/debug/p11-kit/0.24.1-r0/trust/persist.c /usr/src/debug/p11-kit/0.24.1-r0/common/runtime.c /usr/src/debug/p11-kit/0.24.1-r0/p11-kit/uri.h /usr/src/debug/p11-kit/0.24.1-r0/comm
 on/constants.c /usr/src/debug/p11-kit/0.24.1-r0/p11-kit/uri.c /usr/src/debug/p11-kit/0.24.1-r0/common/runtime.h /usr/src/debug/p11-kit/0.24.1-r0/common/constants.h /usr/src/debug/p11-kit/0.24.1-r0/trust/base64.c /usr/src/debug/p11-kit/0.24.1-r0/trust/extract-cer.c /usr/src/debug/p11-kit/0.24.1-r0/common/debug.c /usr/src/debug/p11-kit/0.24.1-r0/common/debug.h /usr/src/debug/p11-kit/0.24.1-r0/trust/base64.h /usr/src/debug/p11-kit/0.24.1-r0/p11-kit/iter.h /usr/src/debug/p11-kit/0.24.1-r0/p11-kit/rpc-message.c /usr/src/debug/p11-kit/0.24.1-r0/p11-kit/p11-kit.h /usr/src/debug/p11-kit/0.24.1-r0/p11-kit/private.h /usr/src/debug/p11-kit/0.24.1-r0/p11-kit/virtual.h /usr/src/debug/p11-kit/0.24.1-r0/p11-kit/rpc-message.h /usr/src/debug/p11-kit/0.24.1-r0/p11-kit/iter.c /usr/src/debug/p11-kit/0.24.1-r0/p11-kit/virtual.c /usr/src/debug/p11-kit/0.24.1-r0/p11-kit/p11-kit.c /usr/src/debug/p11-kit/0.24.1-r0/trust/pem.c /usr/src/debug/p11-kit/0.24.1-r0/common/argv.h /usr/src/debug/p11-kit/0.24.1-r0/tr
 ust/oid.c /usr/src/debug/p11-kit/0.24.1-r0/common/argv.c /usr/src/debug/p11-kit/0.24.1-r0/trust/oid.h /usr/src/debug/p11-kit/0.24.1-r0/trust/pem.h /usr/src/debug/p11-kit/0.24.1-r0/common/buffer.h /usr/src/debug/p11-kit/0.24.1-r0/p11-kit/log.h /usr/src/debug/p11-kit/0.24.1-r0/common/buffer.c /usr/src/debug/p11-kit/0.24.1-r0/p11-kit/log.c /usr/src/debug/p11-kit/0.24.1-r0/trust/enumerate.h /usr/src/debug/p11-kit/0.24.1-r0/trust/token.c /usr/src/debug/p11-kit/0.24.1-r0/trust/enumerate.c /usr/src/debug/p11-kit/0.24.1-r0/trust/token.h /usr/src/debug/p11-kit/0.24.1-r0/common/message.c /usr/src/debug/p11-kit/0.24.1-r0/common/message.h /usr/src/debug/p11-kit/0.24.1-r0/trust/extract-jks.c /usr/src/debug/p11-kit/0.24.1-r0/common/hash.c /usr/src/debug/p11-kit/0.24.1-r0/trust/builder.h /usr/src/debug/p11-kit/0.24.1-r0/common/url.c /usr/src/debug/p11-kit/0.24.1-r0/common/hash.h /usr/src/debug/p11-kit/0.24.1-r0/common/url.h /usr/src/debug/p11-kit/0.24.1-r0/trust/builder.c /usr/src/debug/p11-kit/0.
 24.1-r0/trust/parser.c /usr/src/debug/p11-kit/0.24.1-r0/trust/utf8.h /usr/src/debug/p11-kit/0.24.1-r0/trust/trust.c /usr/src/debug/p11-kit/0.24.1-r0/trust/parser.h /usr/src/debug/p11-kit/0.24.1-r0/trust/utf8.c", added "/usr/src/debug/p11-kit/0.25.0-r0/common/pkcs11.h /usr/src/debug/p11-kit/0.25.0-r0/p11-kit/rpc-server.c /usr/src/debug/p11-kit/0.25.0-r0/p11-kit/client.h /usr/src/debug/p11-kit/0.25.0-r0/trust/extract.c /usr/src/debug/p11-kit/0.25.0-r0/trust/basic.asn.h /usr/src/debug/p11-kit/0.25.0-r0/p11-kit/server.c /usr/src/debug/p11-kit/0.25.0-r0/p11-kit/client.c /usr/src/debug/p11-kit/0.25.0-r0/trust/extract.h /usr/src/debug/p11-kit/0.25.0-r0/p11-kit/lists.c /usr/src/debug/p11-kit/0.25.0-r0/p11-kit/virtual-fixed-generated.h /usr/src/debug/p11-kit/0.25.0-r0/common/path.c /usr/src/debug/p11-kit/0.25.0-r0/common/tool.c /usr/src/debug/p11-kit/0.25.0-r0/common/path.h /usr/src/debug/p11-kit/0.25.0-r0/common/tool.h /usr/src/debug/p11-kit/0.25.0-r0/common/attrs.c /usr/src/debug/p11-kit/0
 .25.0-r0/common/attrs.h /usr/src/debug/p11-kit/0.25.0-r0/trust/pkix.asn.h /usr/src/debug/p11-kit/0.25.0-r0/common/array.c /usr/src/debug/p11-kit/0.25.0-r0/p11-kit/conf.h /usr/src/debug/p11-kit/0.25.0-r0/p11-kit/proxy.c /usr/src/debug/p11-kit/0.25.0-r0/trust/anchor.c /usr/src/debug/p11-kit/0.25.0-r0/trust/anchor.h /usr/src/debug/p11-kit/0.25.0-r0/trust/openssl.asn.h /usr/src/debug/p11-kit/0.25.0-r0/p11-kit/conf.c /usr/src/debug/p11-kit/0.25.0-r0/common/array.h /usr/src/debug/p11-kit/0.25.0-r0/p11-kit/proxy.h /usr/src/debug/p11-kit/0.25.0-r0/trust/index.h /usr/src/debug/p11-kit/0.25.0-r0/p11-kit/rpc-transport.c /usr/src/debug/p11-kit/0.25.0-r0/trust/index.c /usr/src/debug/p11-kit/0.25.0-r0/common/lexer.c /usr/src/debug/p11-kit/0.25.0-r0/p11-kit/modules.h /usr/src/debug/p11-kit/0.25.0-r0/p11-kit/modules.c /usr/src/debug/p11-kit/0.25.0-r0/common/lexer.h /usr/src/debug/p11-kit/0.25.0-r0/trust/extract-pem.c /usr/src/debug/p11-kit/0.25.0-r0/trust/asn1.h /usr/src/debug/p11-kit/0.25.0-r0/tru
 st/asn1.c /usr/src/debug/p11-kit/0.25.0-r0/common/compat.c /usr/src/debug/p11-kit/0.25.0-r0/p11-kit/pin.h /usr/src/debug/p11-kit/0.25.0-r0/trust/list.c /usr/src/debug/p11-kit/0.25.0-r0/common/compat.h /usr/src/debug/p11-kit/0.25.0-r0/p11-kit/pin.c /usr/src/debug/p11-kit/0.25.0-r0/p11-kit/add-profile.c /usr/src/debug/p11-kit/0.25.0-r0/trust/list.h /usr/src/debug/p11-kit/0.25.0-r0/trust/save.h /usr/src/debug/p11-kit/0.25.0-r0/trust/dump.h /usr/src/debug/p11-kit/0.25.0-r0/trust/x509.h /usr/src/debug/p11-kit/0.25.0-r0/p11-kit/rpc-client.c /usr/src/debug/p11-kit/0.25.0-r0/trust/save.c /usr/src/debug/p11-kit/0.25.0-r0/common/pkcs11i.h /usr/src/debug/p11-kit/0.25.0-r0/common/pkcs11x.h /usr/src/debug/p11-kit/0.25.0-r0/trust/x509.c /usr/src/debug/p11-kit/0.25.0-r0/trust/dump.c /usr/src/debug/p11-kit/0.25.0-r0/p11-kit/util.c /usr/src/debug/p11-kit/0.25.0-r0/p11-kit/messages.c /usr/src/debug/p11-kit/0.25.0-r0/p11-kit/rpc.h /usr/src/debug/p11-kit/0.25.0-r0/common/init.h /usr/src/debug/p11-kit/0
 .25.0-r0/p11-kit/delete-profile.c /usr/src/debug/p11-kit/0.25.0-r0/trust/session.h /usr/src/debug/p11-kit/0.25.0-r0/common/vsock.c /usr/src/debug/p11-kit/0.25.0-r0/common/vsock.h /usr/src/debug/p11-kit/0.25.0-r0/trust/session.c /usr/src/debug/p11-kit/0.25.0-r0/common/dict.c /usr/src/debug/p11-kit/0.25.0-r0/common/library.c /usr/src/debug/p11-kit/0.25.0-r0/trust/digest.h /usr/src/debug/p11-kit/0.25.0-r0/common/unix-peer.h /usr/src/debug/p11-kit/0.25.0-r0/common/library.h /usr/src/debug/p11-kit/0.25.0-r0/common/dict.h /usr/src/debug/p11-kit/0.25.0-r0/common/unix-peer.c /usr/src/debug/p11-kit/0.25.0-r0/trust/digest.c /usr/src/debug/p11-kit/0.25.0-r0/p11-kit/filter.h /usr/src/debug/p11-kit/0.25.0-r0/p11-kit/remote.h /usr/src/debug/p11-kit/0.25.0-r0/p11-kit/filter.c /usr/src/debug/p11-kit/0.25.0-r0/p11-kit/remote.c /usr/src/debug/p11-kit/0.25.0-r0/trust/module.h /usr/src/debug/p11-kit/0.25.0-r0/trust/extract-openssl.c /usr/src/debug/p11-kit/0.25.0-r0/trust/persist.h /usr/src/debug/p11-ki
 t/0.25.0-r0/trust/module.c /usr/src/debug/p11-kit/0.25.0-r0/trust/extract-edk2.c /usr/src/debug/p11-kit/0.25.0-r0/trust/persist.c /usr/src/debug/p11-kit/0.25.0-r0/p11-kit/print-config.c /usr/src/debug/p11-kit/0.25.0-r0/common/runtime.c /usr/src/debug/p11-kit/0.25.0-r0/p11-kit/uri.h /usr/src/debug/p11-kit/0.25.0-r0/common/constants.c /usr/src/debug/p11-kit/0.25.0-r0/p11-kit/uri.c /usr/src/debug/p11-kit/0.25.0-r0/common/runtime.h /usr/src/debug/p11-kit/0.25.0-r0/common/constants.h /usr/src/debug/p11-kit/0.25.0-r0/trust/base64.c /usr/src/debug/p11-kit/0.25.0-r0/trust/extract-cer.c /usr/src/debug/p11-kit/0.25.0-r0/common/debug.c /usr/src/debug/p11-kit/0.25.0-r0/common/debug.h /usr/src/debug/p11-kit/0.25.0-r0/trust/base64.h /usr/src/debug/p11-kit/0.25.0-r0/p11-kit/iter.h /usr/src/debug/p11-kit/0.25.0-r0/p11-kit/rpc-message.c /usr/src/debug/p11-kit/0.25.0-r0/trust/check-format.h /usr/src/debug/p11-kit/0.25.0-r0/p11-kit/p11-kit.h /usr/src/debug/p11-kit/0.25.0-r0/p11-kit/private.h /usr/src/
 debug/p11-kit/0.25.0-r0/p11-kit/virtual.h /usr/src/debug/p11-kit/0.25.0-r0/p11-kit/rpc-message.h /usr/src/debug/p11-kit/0.25.0-r0/p11-kit/iter.c /usr/src/debug/p11-kit/0.25.0-r0/p11-kit/p11-kit.c /usr/src/debug/p11-kit/0.25.0-r0/p11-kit/virtual.c /usr/src/debug/p11-kit/0.25.0-r0/trust/check-format.c /usr/src/debug/p11-kit/0.25.0-r0/trust/pem.c /usr/src/debug/p11-kit/0.25.0-r0/common/argv.h /usr/src/debug/p11-kit/0.25.0-r0/trust/oid.c /usr/src/debug/p11-kit/0.25.0-r0/common/argv.c /usr/src/debug/p11-kit/0.25.0-r0/trust/oid.h /usr/src/debug/p11-kit/0.25.0-r0/trust/pem.h /usr/src/debug/p11-kit/0.25.0-r0/common/buffer.h /usr/src/debug/p11-kit/0.25.0-r0/p11-kit/log.h /usr/src/debug/p11-kit/0.25.0-r0/common/buffer.c /usr/src/debug/p11-kit/0.25.0-r0/p11-kit/list-profiles.c /usr/src/debug/p11-kit/0.25.0-r0/p11-kit/log.c /usr/src/debug/p11-kit/0.25.0-r0/common/print.c /usr/src/debug/p11-kit/0.25.0-r0/trust/enumerate.h /usr/src/debug/p11-kit/0.25.0-r0/trust/token.c /usr/src/debug/p11-kit/0.25
 .0-r0/trust/enumerate.c /usr/src/debug/p11-kit/0.25.0-r0/common/print.h /usr/src/debug/p11-kit/0.25.0-r0/trust/token.h /usr/src/debug/p11-kit/0.25.0-r0/common/message.c /usr/src/debug/p11-kit/0.25.0-r0/common/message.h /usr/src/debug/p11-kit/0.25.0-r0/trust/extract-jks.c /usr/src/debug/p11-kit/0.25.0-r0/common/hash.c /usr/src/debug/p11-kit/0.25.0-r0/trust/builder.h /usr/src/debug/p11-kit/0.25.0-r0/common/url.c /usr/src/debug/p11-kit/0.25.0-r0/common/hash.h /usr/src/debug/p11-kit/0.25.0-r0/common/url.h /usr/src/debug/p11-kit/0.25.0-r0/trust/builder.c /usr/src/debug/p11-kit/0.25.0-r0/trust/parser.c /usr/src/debug/p11-kit/0.25.0-r0/trust/utf8.h /usr/src/debug/p11-kit/0.25.0-r0/trust/trust.c /usr/src/debug/p11-kit/0.25.0-r0/trust/parser.h /usr/src/debug/p11-kit/0.25.0-r0/trust/utf8.c"
packages/core2-32-poky-linux/p11-kit/p11-kit-staticdev: PV changed from "0.24.1" to "0.25.0"
packages/core2-32-poky-linux/p11-kit/p11-kit-staticdev: PKGV changed from 0.24.1 [default] to 0.25.0 [default]
packages/core2-32-poky-linux/p11-kit/p11-kit: PV changed from "0.24.1" to "0.25.0"
packages/core2-32-poky-linux/p11-kit/p11-kit: PKGV changed from 0.24.1 [default] to 0.25.0 [default]
packages/core2-32-poky-linux/p11-kit/p11-kit: PKGSIZE changed from 2971875 to 3895319 (+31%)

--===============1073493642838458987==--

