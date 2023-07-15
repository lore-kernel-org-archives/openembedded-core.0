Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DD4CC2FC1D
	for <webhook@archiver.kernel.org>; Sat, 15 Jul 2023 21:27:40 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web10.5938.1689456454145348965
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Jul 2023 14:27:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=ZgqMtc3U;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 010101895b73a611-0ba2fc87-2691-41f9-a41b-38cdf02b6ec6-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1689456453;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=HnqCPOTqPPU687E8yO/tVm9UwhVWfLvTfHkNiINezRE=;
	b=ZgqMtc3UFXBRjNAgfwRv9pYFe+l3pmBcwiSRw3k7f0z80E1ZGfjX7j51jHcMzWOQ
	JYT4PaeySfkOfS+sJ/7GrCXPPMFk8VyzVFqaPMbOHooZBdFJUVVU6L4Zh7G6t3Gboqw
	3qSApFZC1r2EeR7Tt9Eqpzj9FxoAJywfes8k7Ytw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1689456453;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=HnqCPOTqPPU687E8yO/tVm9UwhVWfLvTfHkNiINezRE=;
	b=pRwrgUBCz3eJzKATSX61Nsih2PdsPx233tXlMlpWjF0IVrgFTMX8Ex9Sfy3Vb49E
	UyI4cSHw9IPYfJor/IYN1Kgk0vk2E8B3eulo/54R209BOoOmJIHPsfGPY4fZRgjvndI
	j7nLeVJMEvMJ6jxQheI4YW3y/HYGSqnzeT9mmdps=
Content-Type: multipart/mixed; boundary="===============8241943394870669136=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] kbd: upgrading to 2.6.1 SUCCEEDED
Message-ID: <010101895b73a611-0ba2fc87-2691-41f9-a41b-38cdf02b6ec6-000000@us-west-2.amazonses.com>
Date: Sat, 15 Jul 2023 21:27:33 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.07.15-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Jul 2023 21:27:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184322

--===============8241943394870669136==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *kbd* to *2.6.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-kbd-upgrade-2.6.0-2.6.1.patch
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
From b068a4ca2b2251a04de258d8966918cec5ab81f1 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 15 Jul 2023 10:07:03 +0000
Subject: [PATCH] kbd: upgrade 2.6.0 -> 2.6.1

---
 meta/recipes-core/kbd/{kbd_2.6.0.bb => kbd_2.6.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/kbd/{kbd_2.6.0.bb => kbd_2.6.1.bb} (94%)

diff --git a/meta/recipes-core/kbd/kbd_2.6.0.bb b/meta/recipes-core/kbd/kbd_2.6.1.bb
similarity index 94%
rename from meta/recipes-core/kbd/kbd_2.6.0.bb
rename to meta/recipes-core/kbd/kbd_2.6.1.bb
index 9a3e0a7476..112039b919 100644
--- a/meta/recipes-core/kbd/kbd_2.6.0.bb
+++ b/meta/recipes-core/kbd/kbd_2.6.1.bb
@@ -16,7 +16,7 @@ RCONFLICTS:${PN} = "console-tools"
 SRC_URI = "${KERNELORG_MIRROR}/linux/utils/${BPN}/${BP}.tar.xz \
            "
 
-SRC_URI[sha256sum] = "9c159433db5df8ef31d86b42f5b09d32311bdda2ed35107fb1926243da60b28a"
+SRC_URI[sha256sum] = "2eb6c6c972be9589bab733275bf020beb5f644d5f9439737920e701af6cf3485"
 
 EXTRA_OECONF = "--disable-tests"
 PACKAGECONFIG ?= "${@bb.utils.filter('DISTRO_FEATURES', 'pam', d)} \
-- 
2.39.2


--===============8241943394870669136==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/kbd/kbd-consolefonts: PKGV changed from 2.6.0 [default] to 2.6.1 [default]
packages/core2-32-poky-linux/kbd/kbd-consolefonts: PV changed from "2.6.0" to "2.6.1"
packages/core2-32-poky-linux/kbd/kbd-consoletrans: PKGV changed from 2.6.0 [default] to 2.6.1 [default]
packages/core2-32-poky-linux/kbd/kbd-consoletrans: PV changed from "2.6.0" to "2.6.1"
packages/core2-32-poky-linux/kbd/kbd-dbg: PKGV changed from 2.6.0 [default] to 2.6.1 [default]
packages/core2-32-poky-linux/kbd/kbd-dbg: PKGSIZE changed from 1129884 to 1132392 (+0%)
packages/core2-32-poky-linux/kbd/kbd-dbg: PV changed from "2.6.0" to "2.6.1"
packages/core2-32-poky-linux/kbd/kbd-dev: PKGV changed from 2.6.0 [default] to 2.6.1 [default]
packages/core2-32-poky-linux/kbd/kbd-dev: PV changed from "2.6.0" to "2.6.1"
packages/core2-32-poky-linux/kbd/kbd-doc: PKGV changed from 2.6.0 [default] to 2.6.1 [default]
packages/core2-32-poky-linux/kbd/kbd-doc: PV changed from "2.6.0" to "2.6.1"
packages/core2-32-poky-linux/kbd/kbd-keymaps: PKGV changed from 2.6.0 [default] to 2.6.1 [default]
packages/core2-32-poky-linux/kbd/kbd-keymaps: PKGSIZE changed from 551061 to 556775 (+1%)
packages/core2-32-poky-linux/kbd/kbd-keymaps: PV changed from "2.6.0" to "2.6.1"
packages/core2-32-poky-linux/kbd/kbd-keymaps: FILELIST: added "/usr/share/keymaps/mac/all/mac-fr-legacy.map.gz"
packages/core2-32-poky-linux/kbd/kbd-locale-cs: PKGV changed from 2.6.0 [default] to 2.6.1 [default]
packages/core2-32-poky-linux/kbd/kbd-locale-cs: PV changed from "2.6.0" to "2.6.1"
packages/core2-32-poky-linux/kbd/kbd-locale-da: PKGV changed from 2.6.0 [default] to 2.6.1 [default]
packages/core2-32-poky-linux/kbd/kbd-locale-da: PV changed from "2.6.0" to "2.6.1"
packages/core2-32-poky-linux/kbd/kbd-locale-de: PKGV changed from 2.6.0 [default] to 2.6.1 [default]
packages/core2-32-poky-linux/kbd/kbd-locale-de: PV changed from "2.6.0" to "2.6.1"
packages/core2-32-poky-linux/kbd/kbd-locale-el: PKGV changed from 2.6.0 [default] to 2.6.1 [default]
packages/core2-32-poky-linux/kbd/kbd-locale-el: PV changed from "2.6.0" to "2.6.1"
packages/core2-32-poky-linux/kbd/kbd-locale-eo: PKGV changed from 2.6.0 [default] to 2.6.1 [default]
packages/core2-32-poky-linux/kbd/kbd-locale-eo: PV changed from "2.6.0" to "2.6.1"
packages/core2-32-poky-linux/kbd/kbd-locale-es: PKGV changed from 2.6.0 [default] to 2.6.1 [default]
packages/core2-32-poky-linux/kbd/kbd-locale-es: PV changed from "2.6.0" to "2.6.1"
packages/core2-32-poky-linux/kbd/kbd-locale-fr: PKGV changed from 2.6.0 [default] to 2.6.1 [default]
packages/core2-32-poky-linux/kbd/kbd-locale-fr: PV changed from "2.6.0" to "2.6.1"
packages/core2-32-poky-linux/kbd/kbd-locale-gr: PKGV changed from 2.6.0 [default] to 2.6.1 [default]
packages/core2-32-poky-linux/kbd/kbd-locale-gr: PV changed from "2.6.0" to "2.6.1"
packages/core2-32-poky-linux/kbd/kbd-locale-id: PKGV changed from 2.6.0 [default] to 2.6.1 [default]
packages/core2-32-poky-linux/kbd/kbd-locale-id: PV changed from "2.6.0" to "2.6.1"
packages/core2-32-poky-linux/kbd/kbd-locale-it: PKGV changed from 2.6.0 [default] to 2.6.1 [default]
packages/core2-32-poky-linux/kbd/kbd-locale-it: PV changed from "2.6.0" to "2.6.1"
packages/core2-32-poky-linux/kbd/kbd-locale-nl: PKGV changed from 2.6.0 [default] to 2.6.1 [default]
packages/core2-32-poky-linux/kbd/kbd-locale-nl: PV changed from "2.6.0" to "2.6.1"
packages/core2-32-poky-linux/kbd/kbd-locale-pl: PKGV changed from 2.6.0 [default] to 2.6.1 [default]
packages/core2-32-poky-linux/kbd/kbd-locale-pl: PV changed from "2.6.0" to "2.6.1"
packages/core2-32-poky-linux/kbd/kbd-locale-pt-br: PKGV changed from 2.6.0 [default] to 2.6.1 [default]
packages/core2-32-poky-linux/kbd/kbd-locale-pt-br: PV changed from "2.6.0" to "2.6.1"
packages/core2-32-poky-linux/kbd/kbd-locale-pt: PKGV changed from 2.6.0 [default] to 2.6.1 [default]
packages/core2-32-poky-linux/kbd/kbd-locale-pt: PV changed from "2.6.0" to "2.6.1"
packages/core2-32-poky-linux/kbd/kbd-locale-ro: PKGV changed from 2.6.0 [default] to 2.6.1 [default]
packages/core2-32-poky-linux/kbd/kbd-locale-ro: PV changed from "2.6.0" to "2.6.1"
packages/core2-32-poky-linux/kbd/kbd-locale-ru: PKGV changed from 2.6.0 [default] to 2.6.1 [default]
packages/core2-32-poky-linux/kbd/kbd-locale-ru: PV changed from "2.6.0" to "2.6.1"
packages/core2-32-poky-linux/kbd/kbd-locale-sr: PKGV changed from 2.6.0 [default] to 2.6.1 [default]
packages/core2-32-poky-linux/kbd/kbd-locale-sr: PV changed from "2.6.0" to "2.6.1"
packages/core2-32-poky-linux/kbd/kbd-locale-sv: PKGV changed from 2.6.0 [default] to 2.6.1 [default]
packages/core2-32-poky-linux/kbd/kbd-locale-sv: PV changed from "2.6.0" to "2.6.1"
packages/core2-32-poky-linux/kbd/kbd-locale-tr: PKGV changed from 2.6.0 [default] to 2.6.1 [default]
packages/core2-32-poky-linux/kbd/kbd-locale-tr: PV changed from "2.6.0" to "2.6.1"
packages/core2-32-poky-linux/kbd/kbd-locale-uk: PKGV changed from 2.6.0 [default] to 2.6.1 [default]
packages/core2-32-poky-linux/kbd/kbd-locale-uk: PV changed from "2.6.0" to "2.6.1"
packages/core2-32-poky-linux/kbd/kbd-locale-vi: PKGV changed from 2.6.0 [default] to 2.6.1 [default]
packages/core2-32-poky-linux/kbd/kbd-locale-vi: PV changed from "2.6.0" to "2.6.1"
packages/core2-32-poky-linux/kbd/kbd-locale-zh-cn: PKGV changed from 2.6.0 [default] to 2.6.1 [default]
packages/core2-32-poky-linux/kbd/kbd-locale-zh-cn: PV changed from "2.6.0" to "2.6.1"
packages/core2-32-poky-linux/kbd/kbd-src: PKGV changed from 2.6.0 [default] to 2.6.1 [default]
packages/core2-32-poky-linux/kbd/kbd-src: PKGSIZE changed from 582312 to 583574 (+0%)
packages/core2-32-poky-linux/kbd/kbd-src: PV changed from "2.6.0" to "2.6.1"
packages/core2-32-poky-linux/kbd/kbd-staticdev: PKGV changed from 2.6.0 [default] to 2.6.1 [default]
packages/core2-32-poky-linux/kbd/kbd-staticdev: PV changed from "2.6.0" to "2.6.1"
packages/core2-32-poky-linux/kbd/kbd-unimaps: PKGV changed from 2.6.0 [default] to 2.6.1 [default]
packages/core2-32-poky-linux/kbd/kbd-unimaps: PV changed from "2.6.0" to "2.6.1"
packages/core2-32-poky-linux/kbd/kbd: PKGV changed from 2.6.0 [default] to 2.6.1 [default]
packages/core2-32-poky-linux/kbd/kbd: PKGSIZE changed from 704920 to 709016 (+1%)
packages/core2-32-poky-linux/kbd/kbd: PV changed from "2.6.0" to "2.6.1"
packages/core2-32-poky-linux/kbd: PKGV changed from 2.6.0 [default] to 2.6.1 [default]
packages/core2-32-poky-linux/kbd: SRC_URI changed from "https://cdn.kernel.org/pub/linux/utils/kbd/kbd-2.6.0.tar.xz" to "https://cdn.kernel.org/pub/linux/utils/kbd/kbd-2.6.1.tar.xz"
packages/core2-32-poky-linux/kbd: PV changed from "2.6.0" to "2.6.1"
Changes to packages/core2-32-poky-linux/kbd (sysroot):
  /usr/share/keymaps/mac/all/mac-fr-legacy.map.gz was added

--===============8241943394870669136==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/kbd/kbd-keymaps: FILELIST: added "/usr/share/keymaps/mac/all/mac-fr-legacy.map.gz"
Changes to packages/core2-32-poky-linux/kbd (sysroot):
  /usr/share/keymaps/mac/all/mac-fr-legacy.map.gz was added

--===============8241943394870669136==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="0001-kbd-upgrade-2.6.0-2.6.1.patch"

RnJvbSBiMDY4YTRjYTJiMjI1MWEwNGRlMjU4ZDg5NjY5MThjZWM1YWI4MWYxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgSnVsIDIwMjMgMTA6MDc6MDMgKzAwMDAKU3ViamVjdDogW1BBVENIXSBr
YmQ6IHVwZ3JhZGUgMi42LjAgLT4gMi42LjEKCi0tLQogbWV0YS9yZWNpcGVzLWNvcmUva2JkL3tr
YmRfMi42LjAuYmIgPT4ga2JkXzIuNi4xLmJifSB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGlu
c2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1jb3JlL2tiZC97
a2JkXzIuNi4wLmJiID0+IGtiZF8yLjYuMS5iYn0gKDk0JSkKCmRpZmYgLS1naXQgYS9tZXRhL3Jl
Y2lwZXMtY29yZS9rYmQva2JkXzIuNi4wLmJiIGIvbWV0YS9yZWNpcGVzLWNvcmUva2JkL2tiZF8y
LjYuMS5iYgpzaW1pbGFyaXR5IGluZGV4IDk0JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtY29y
ZS9rYmQva2JkXzIuNi4wLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtY29yZS9rYmQva2JkXzIu
Ni4xLmJiCmluZGV4IDlhM2UwYTc0NzYuLjExMjAzOWI5MTkgMTAwNjQ0Ci0tLSBhL21ldGEvcmVj
aXBlcy1jb3JlL2tiZC9rYmRfMi42LjAuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWNvcmUva2JkL2ti
ZF8yLjYuMS5iYgpAQCAtMTYsNyArMTYsNyBAQCBSQ09ORkxJQ1RTOiR7UE59ID0gImNvbnNvbGUt
dG9vbHMiCiBTUkNfVVJJID0gIiR7S0VSTkVMT1JHX01JUlJPUn0vbGludXgvdXRpbHMvJHtCUE59
LyR7QlB9LnRhci54eiBcCiAgICAgICAgICAgICIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjlj
MTU5NDMzZGI1ZGY4ZWYzMWQ4NmI0MmY1YjA5ZDMyMzExYmRkYTJlZDM1MTA3ZmIxOTI2MjQzZGE2
MGIyOGEiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiMmViNmM2Yzk3MmJlOTU4OWJhYjczMzI3NWJm
MDIwYmViNWY2NDRkNWY5NDM5NzM3OTIwZTcwMWFmNmNmMzQ4NSIKIAogRVhUUkFfT0VDT05GID0g
Ii0tZGlzYWJsZS10ZXN0cyIKIFBBQ0tBR0VDT05GSUcgPz0gIiR7QGJiLnV0aWxzLmZpbHRlcign
RElTVFJPX0ZFQVRVUkVTJywgJ3BhbScsIGQpfSBcCi0tIAoyLjM5LjIKCg==

--===============8241943394870669136==--

