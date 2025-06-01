Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C23AC7113D
	for <webhook@archiver.kernel.org>; Sun,  1 Jun 2025 13:55:34 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web10.27791.1748786130237396639
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Jun 2025 06:55:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=uJfgdO2S;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=d+iGrZeL;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 010101972bc6aa29-da379bf5-1835-4a7c-b48e-0ad94bf5a022-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1748786129;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=971H+LDdzlJ74ebBfarQOdpVpsHDj8brRAZjTQzhfxk=;
	b=uJfgdO2SKX0wySCEt8T/BaxkYTAgSsLcK8sEk85cZlKp61F8Ho4Kf70RbDceps1d
	tkNh3t8l/ozeXEfGZrSfl9fqBpVl8hl/AItFLkiFEUtCvRAYO75D1wdJ6FLYpYXgV1T
	WuLr8RbquSS/ZW5z2tSrBvviBSHiiLxwsGCvIgu4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1748786129;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=971H+LDdzlJ74ebBfarQOdpVpsHDj8brRAZjTQzhfxk=;
	b=d+iGrZeLvOU20c/VwluWAF9Mxpva3Wl91WKVlVhxkI6ONK94xHi/eCnR/a//405O
	ikHgNh52TynnYP/ZL2KaxyJBLY1FJWS+6gJmbOBVoIbQ6qF/wKiQbgOpB79Zw4/bGnX
	SxHGfUTIiZrG3Go2nDKFUYjSugLGmuBwQcFDrZa8=
Content-Type: multipart/mixed; boundary="===============8719545460638311110=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] kbd: upgrading to 2.8.0 SUCCEEDED
Message-ID: <010101972bc6aa29-da379bf5-1835-4a7c-b48e-0ad94bf5a022-000000@us-west-2.amazonses.com>
Date: Sun, 1 Jun 2025 13:55:29 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.06.01-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Jun 2025 13:55:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217584

--===============8719545460638311110==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *kbd* to *2.8.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-kbd-upgrade-2.7.1-2.8.0.patch
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
From 2d6e416476cd6d94be1a126ed348b5209951b908 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 1 Jun 2025 08:20:55 +0000
Subject: [PATCH] kbd: upgrade 2.7.1 -> 2.8.0

---
 meta/recipes-core/kbd/{kbd_2.7.1.bb => kbd_2.8.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/kbd/{kbd_2.7.1.bb => kbd_2.8.0.bb} (96%)

diff --git a/meta/recipes-core/kbd/kbd_2.7.1.bb b/meta/recipes-core/kbd/kbd_2.8.0.bb
similarity index 96%
rename from meta/recipes-core/kbd/kbd_2.7.1.bb
rename to meta/recipes-core/kbd/kbd_2.8.0.bb
index 9b9066e7b0..ababa09918 100644
--- a/meta/recipes-core/kbd/kbd_2.7.1.bb
+++ b/meta/recipes-core/kbd/kbd_2.8.0.bb
@@ -26,7 +26,7 @@ RCONFLICTS:${PN} = "console-tools"
 SRC_URI = "${KERNELORG_MIRROR}/linux/utils/${BPN}/${BP}.tar.xz \
            "
 
-SRC_URI[sha256sum] = "f167d899d92b56ccf12f6f49355173f93870a95f15d8aeebf5fdcd28a621aca8"
+SRC_URI[sha256sum] = "01f5806da7d1d34f594b7b2a6ae1ab23215344cf1064e8edcd3a90fef9776a11"
 
 # 'gzip -n' is set due to https://github.com/legionus/kbd/issues/124
 EXTRA_OECONF = "--disable-tests --enable-compress='gzip -n'"
-- 
2.47.1


--===============8719545460638311110==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/kbd/kbd-consolefonts: PKGSIZE changed from 467463 to 471541 (+1%)
packages/core2-64-poky-linux/kbd/kbd-consolefonts: FILELIST: added "/usr/share/consolefonts/LatCyrHebKa-16_GIA.psfu.gz"
packages/core2-64-poky-linux/kbd/kbd-consolefonts: PKGV changed from 2.7.1 [default] to 2.8.0 [default]
packages/core2-64-poky-linux/kbd/kbd-consolefonts: PV changed from "2.7.1" to "2.8.0"
packages/core2-64-poky-linux/kbd/kbd-consoletrans: PKGV changed from 2.7.1 [default] to 2.8.0 [default]
packages/core2-64-poky-linux/kbd/kbd-consoletrans: PV changed from "2.7.1" to "2.8.0"
packages/core2-64-poky-linux/kbd/kbd-dbg: PKGSIZE changed from 1554216 to 1565496 (+1%)
packages/core2-64-poky-linux/kbd/kbd-dbg: PKGV changed from 2.7.1 [default] to 2.8.0 [default]
packages/core2-64-poky-linux/kbd/kbd-dbg: PV changed from "2.7.1" to "2.8.0"
packages/core2-64-poky-linux/kbd/kbd-dev: PKGV changed from 2.7.1 [default] to 2.8.0 [default]
packages/core2-64-poky-linux/kbd/kbd-dev: PV changed from "2.7.1" to "2.8.0"
packages/core2-64-poky-linux/kbd/kbd-doc: PKGSIZE changed from 71085 to 71648 (+1%)
packages/core2-64-poky-linux/kbd/kbd-doc: PKGV changed from 2.7.1 [default] to 2.8.0 [default]
packages/core2-64-poky-linux/kbd/kbd-doc: PV changed from "2.7.1" to "2.8.0"
packages/core2-64-poky-linux/kbd/kbd-keymaps-pine: PKGV changed from 2.7.1 [default] to 2.8.0 [default]
packages/core2-64-poky-linux/kbd/kbd-keymaps-pine: PV changed from "2.7.1" to "2.8.0"
packages/core2-64-poky-linux/kbd/kbd-keymaps: PKGSIZE changed from 568237 to 572654 (+1%)
packages/core2-64-poky-linux/kbd/kbd-keymaps: FILELIST: added "/usr/share/keymaps/i386/qwerty/ge.map.gz /usr/share/keymaps/i386/azerty/fr-afnor.map.gz"
packages/core2-64-poky-linux/kbd/kbd-keymaps: PKGV changed from 2.7.1 [default] to 2.8.0 [default]
packages/core2-64-poky-linux/kbd/kbd-keymaps: PV changed from "2.7.1" to "2.8.0"
packages/core2-64-poky-linux/kbd/kbd-locale-cs: PKGSIZE changed from 42173 to 41949 (-1%)
packages/core2-64-poky-linux/kbd/kbd-locale-cs: PKGV changed from 2.7.1 [default] to 2.8.0 [default]
packages/core2-64-poky-linux/kbd/kbd-locale-cs: PV changed from "2.7.1" to "2.8.0"
packages/core2-64-poky-linux/kbd/kbd-locale-da: PKGV changed from 2.7.1 [default] to 2.8.0 [default]
packages/core2-64-poky-linux/kbd/kbd-locale-da: PV changed from "2.7.1" to "2.8.0"
packages/core2-64-poky-linux/kbd/kbd-locale-de: PKGSIZE changed from 39539 to 39326 (-1%)
packages/core2-64-poky-linux/kbd/kbd-locale-de: PKGV changed from 2.7.1 [default] to 2.8.0 [default]
packages/core2-64-poky-linux/kbd/kbd-locale-de: PV changed from "2.7.1" to "2.8.0"
packages/core2-64-poky-linux/kbd/kbd-locale-el: PKGSIZE changed from 48663 to 48400 (-1%)
packages/core2-64-poky-linux/kbd/kbd-locale-el: PKGV changed from 2.7.1 [default] to 2.8.0 [default]
packages/core2-64-poky-linux/kbd/kbd-locale-el: PV changed from "2.7.1" to "2.8.0"
packages/core2-64-poky-linux/kbd/kbd-locale-eo: PKGSIZE changed from 36749 to 36529 (-1%)
packages/core2-64-poky-linux/kbd/kbd-locale-eo: PKGV changed from 2.7.1 [default] to 2.8.0 [default]
packages/core2-64-poky-linux/kbd/kbd-locale-eo: PV changed from "2.7.1" to "2.8.0"
packages/core2-64-poky-linux/kbd/kbd-locale-es: PKGSIZE changed from 43398 to 43225 (-0%)
packages/core2-64-poky-linux/kbd/kbd-locale-es: PKGV changed from 2.7.1 [default] to 2.8.0 [default]
packages/core2-64-poky-linux/kbd/kbd-locale-es: PV changed from "2.7.1" to "2.8.0"
packages/core2-64-poky-linux/kbd/kbd-locale-hu: PKGSIZE changed from 14209 to 14061 (-1%)
packages/core2-64-poky-linux/kbd/kbd-locale-hu: PKGV changed from 2.7.1 [default] to 2.8.0 [default]
packages/core2-64-poky-linux/kbd/kbd-locale-hu: PV changed from "2.7.1" to "2.8.0"
packages/core2-64-poky-linux/kbd/kbd-locale-id: PKGSIZE changed from 40545 to 40350 (-0%)
packages/core2-64-poky-linux/kbd/kbd-locale-id: PKGV changed from 2.7.1 [default] to 2.8.0 [default]
packages/core2-64-poky-linux/kbd/kbd-locale-id: PV changed from "2.7.1" to "2.8.0"
packages/core2-64-poky-linux/kbd/kbd-locale-it: PKGV changed from 2.7.1 [default] to 2.8.0 [default]
packages/core2-64-poky-linux/kbd/kbd-locale-it: PV changed from "2.7.1" to "2.8.0"
packages/core2-64-poky-linux/kbd/kbd-locale-ka: PKGSIZE changed from 23399 to 24088 (+3%)
packages/core2-64-poky-linux/kbd/kbd-locale-ka: PKGV changed from 2.7.1 [default] to 2.8.0 [default]
packages/core2-64-poky-linux/kbd/kbd-locale-ka: PV changed from "2.7.1" to "2.8.0"
packages/core2-64-poky-linux/kbd/kbd-locale-nl: PKGSIZE changed from 13984 to 13821 (-1%)
packages/core2-64-poky-linux/kbd/kbd-locale-nl: PKGV changed from 2.7.1 [default] to 2.8.0 [default]
packages/core2-64-poky-linux/kbd/kbd-locale-nl: PV changed from "2.7.1" to "2.8.0"
packages/core2-64-poky-linux/kbd/kbd-locale-pl: PKGSIZE changed from 42159 to 41952 (-0%)
packages/core2-64-poky-linux/kbd/kbd-locale-pl: PKGV changed from 2.7.1 [default] to 2.8.0 [default]
packages/core2-64-poky-linux/kbd/kbd-locale-pl: PV changed from "2.7.1" to "2.8.0"
packages/core2-64-poky-linux/kbd/kbd-locale-pt-br: PKGSIZE changed from 36988 to 36782 (-1%)
packages/core2-64-poky-linux/kbd/kbd-locale-pt-br: PKGV changed from 2.7.1 [default] to 2.8.0 [default]
packages/core2-64-poky-linux/kbd/kbd-locale-pt-br: PV changed from "2.7.1" to "2.8.0"
packages/core2-64-poky-linux/kbd/kbd-locale-pt: PKGSIZE changed from 35724 to 40901 (+14%)
packages/core2-64-poky-linux/kbd/kbd-locale-pt: PKGV changed from 2.7.1 [default] to 2.8.0 [default]
packages/core2-64-poky-linux/kbd/kbd-locale-pt: PV changed from "2.7.1" to "2.8.0"
packages/core2-64-poky-linux/kbd/kbd-locale-ro: PKGSIZE changed from 44534 to 44337 (-0%)
packages/core2-64-poky-linux/kbd/kbd-locale-ro: PKGV changed from 2.7.1 [default] to 2.8.0 [default]
packages/core2-64-poky-linux/kbd/kbd-locale-ro: PV changed from "2.7.1" to "2.8.0"
packages/core2-64-poky-linux/kbd/kbd-locale-ru: PKGSIZE changed from 50972 to 50688 (-1%)
packages/core2-64-poky-linux/kbd/kbd-locale-ru: PKGV changed from 2.7.1 [default] to 2.8.0 [default]
packages/core2-64-poky-linux/kbd/kbd-locale-ru: PV changed from "2.7.1" to "2.8.0"
packages/core2-64-poky-linux/kbd/kbd-locale-sq: PKGSIZE changed from 18042 to 17980 (-0%)
packages/core2-64-poky-linux/kbd/kbd-locale-sq: PKGV changed from 2.7.1 [default] to 2.8.0 [default]
packages/core2-64-poky-linux/kbd/kbd-locale-sq: PV changed from "2.7.1" to "2.8.0"
packages/core2-64-poky-linux/kbd/kbd-locale-sr: PKGSIZE changed from 52226 to 53489 (+2%)
packages/core2-64-poky-linux/kbd/kbd-locale-sr: PKGV changed from 2.7.1 [default] to 2.8.0 [default]
packages/core2-64-poky-linux/kbd/kbd-locale-sr: PV changed from "2.7.1" to "2.8.0"
packages/core2-64-poky-linux/kbd/kbd-locale-sv: PKGSIZE changed from 41690 to 41484 (-0%)
packages/core2-64-poky-linux/kbd/kbd-locale-sv: PKGV changed from 2.7.1 [default] to 2.8.0 [default]
packages/core2-64-poky-linux/kbd/kbd-locale-sv: PV changed from "2.7.1" to "2.8.0"
packages/core2-64-poky-linux/kbd/kbd-locale-tr: PKGV changed from 2.7.1 [default] to 2.8.0 [default]
packages/core2-64-poky-linux/kbd/kbd-locale-tr: PV changed from "2.7.1" to "2.8.0"
packages/core2-64-poky-linux/kbd/kbd-locale-uk: PKGSIZE changed from 55789 to 55495 (-1%)
packages/core2-64-poky-linux/kbd/kbd-locale-uk: PKGV changed from 2.7.1 [default] to 2.8.0 [default]
packages/core2-64-poky-linux/kbd/kbd-locale-uk: PV changed from "2.7.1" to "2.8.0"
packages/core2-64-poky-linux/kbd/kbd-locale-vi: PKGSIZE changed from 15064 to 14906 (-1%)
packages/core2-64-poky-linux/kbd/kbd-locale-vi: PKGV changed from 2.7.1 [default] to 2.8.0 [default]
packages/core2-64-poky-linux/kbd/kbd-locale-vi: PV changed from "2.7.1" to "2.8.0"
packages/core2-64-poky-linux/kbd/kbd-locale-zh-cn: PKGSIZE changed from 20828 to 20709 (-1%)
packages/core2-64-poky-linux/kbd/kbd-locale-zh-cn: PKGV changed from 2.7.1 [default] to 2.8.0 [default]
packages/core2-64-poky-linux/kbd/kbd-locale-zh-cn: PV changed from "2.7.1" to "2.8.0"
packages/core2-64-poky-linux/kbd/kbd-src: PKGSIZE changed from 186507 to 187473 (+1%)
packages/core2-64-poky-linux/kbd/kbd-src: PKGV changed from 2.7.1 [default] to 2.8.0 [default]
packages/core2-64-poky-linux/kbd/kbd-src: PV changed from "2.7.1" to "2.8.0"
packages/core2-64-poky-linux/kbd/kbd-staticdev: PKGV changed from 2.7.1 [default] to 2.8.0 [default]
packages/core2-64-poky-linux/kbd/kbd-staticdev: PV changed from "2.7.1" to "2.8.0"
packages/core2-64-poky-linux/kbd/kbd-unimaps: PKGV changed from 2.7.1 [default] to 2.8.0 [default]
packages/core2-64-poky-linux/kbd/kbd-unimaps: PV changed from "2.7.1" to "2.8.0"
packages/core2-64-poky-linux/kbd/kbd: PKGSIZE changed from 865944 to 865976 (+0%)
packages/core2-64-poky-linux/kbd/kbd: PKGV changed from 2.7.1 [default] to 2.8.0 [default]
packages/core2-64-poky-linux/kbd/kbd: PV changed from "2.7.1" to "2.8.0"
packages/core2-64-poky-linux/kbd: SRC_URI changed from "https://cdn.kernel.org/pub/linux/utils/kbd/kbd-2.7.1.tar.xz" to "https://cdn.kernel.org/pub/linux/utils/kbd/kbd-2.8.0.tar.xz"
packages/core2-64-poky-linux/kbd: PKGV changed from 2.7.1 [default] to 2.8.0 [default]
packages/core2-64-poky-linux/kbd: PV changed from "2.7.1" to "2.8.0"
Changes to packages/core2-64-poky-linux/kbd (sysroot):
  /usr/share/consolefonts/LatCyrHebKa-16_GIA.psfu.gz was added
  /usr/share/keymaps/i386/azerty/fr-afnor.map.gz was added
  /usr/share/keymaps/i386/qwerty/ge.map.gz was added

--===============8719545460638311110==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="0001-kbd-upgrade-2.7.1-2.8.0.patch"

RnJvbSAyZDZlNDE2NDc2Y2Q2ZDk0YmUxYTEyNmVkMzQ4YjUyMDk5NTFiOTA4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMSBKdW4gMjAyNSAwODoyMDo1NSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGti
ZDogdXBncmFkZSAyLjcuMSAtPiAyLjguMAoKLS0tCiBtZXRhL3JlY2lwZXMtY29yZS9rYmQve2ti
ZF8yLjcuMS5iYiA9PiBrYmRfMi44LjAuYmJ9IHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5z
ZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWNvcmUva2JkL3tr
YmRfMi43LjEuYmIgPT4ga2JkXzIuOC4wLmJifSAoOTYlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVj
aXBlcy1jb3JlL2tiZC9rYmRfMi43LjEuYmIgYi9tZXRhL3JlY2lwZXMtY29yZS9rYmQva2JkXzIu
OC4wLmJiCnNpbWlsYXJpdHkgaW5kZXggOTYlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1jb3Jl
L2tiZC9rYmRfMi43LjEuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1jb3JlL2tiZC9rYmRfMi44
LjAuYmIKaW5kZXggOWI5MDY2ZTdiMC4uYWJhYmEwOTkxOCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNp
cGVzLWNvcmUva2JkL2tiZF8yLjcuMS5iYgorKysgYi9tZXRhL3JlY2lwZXMtY29yZS9rYmQva2Jk
XzIuOC4wLmJiCkBAIC0yNiw3ICsyNiw3IEBAIFJDT05GTElDVFM6JHtQTn0gPSAiY29uc29sZS10
b29scyIKIFNSQ19VUkkgPSAiJHtLRVJORUxPUkdfTUlSUk9SfS9saW51eC91dGlscy8ke0JQTn0v
JHtCUH0udGFyLnh6IFwKICAgICAgICAgICAgIgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiZjE2
N2Q4OTlkOTJiNTZjY2YxMmY2ZjQ5MzU1MTczZjkzODcwYTk1ZjE1ZDhhZWViZjVmZGNkMjhhNjIx
YWNhOCIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICIwMWY1ODA2ZGE3ZDFkMzRmNTk0YjdiMmE2YWUx
YWIyMzIxNTM0NGNmMTA2NGU4ZWRjZDNhOTBmZWY5Nzc2YTExIgogCiAjICdnemlwIC1uJyBpcyBz
ZXQgZHVlIHRvIGh0dHBzOi8vZ2l0aHViLmNvbS9sZWdpb251cy9rYmQvaXNzdWVzLzEyNAogRVhU
UkFfT0VDT05GID0gIi0tZGlzYWJsZS10ZXN0cyAtLWVuYWJsZS1jb21wcmVzcz0nZ3ppcCAtbici
Ci0tIAoyLjQ3LjEKCg==

--===============8719545460638311110==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/kbd/kbd-consolefonts: FILELIST: added "/usr/share/consolefonts/LatCyrHebKa-16_GIA.psfu.gz"
packages/core2-64-poky-linux/kbd/kbd-keymaps: FILELIST: added "/usr/share/keymaps/i386/azerty/fr-afnor.map.gz /usr/share/keymaps/i386/qwerty/ge.map.gz"
packages/core2-64-poky-linux/kbd/kbd-locale-pt: PKGSIZE changed from 35724 to 40901 (+14%)
Changes to packages/core2-64-poky-linux/kbd (sysroot):
  /usr/share/consolefonts/LatCyrHebKa-16_GIA.psfu.gz was added
  /usr/share/keymaps/i386/azerty/fr-afnor.map.gz was added
  /usr/share/keymaps/i386/qwerty/ge.map.gz was added

--===============8719545460638311110==--

