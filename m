Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 958DDC3DA4A
	for <webhook@archiver.kernel.org>; Wed, 16 Aug 2023 22:19:13 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web10.174026.1692224343416766716
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Aug 2023 15:19:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=UHIaXYqW;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=Hid+7U2d;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101018a006e4972-8fbca3af-d048-4fb3-a505-17c85ede52b2-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1692224342;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=INKxz34B5xEsGahDrDg6TzRWa9IdTOAEWy/vHVhEU7Q=;
	b=UHIaXYqW8Q3S0rSUtQYHRwTcCrq4Gw4kj0/WpjCqgfsjGrHHU8B5ECsqluB7PlgI
	a3h/MnYQ48VEMMTIhSSslWvxBlRcKzUUvOJP0bfBDeX69moJvhWiiBCw3F6ITpx2D67
	sQHsssS9ThIBUIsGUfEYo05sWaLKRATKk6osLAxc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1692224342;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=INKxz34B5xEsGahDrDg6TzRWa9IdTOAEWy/vHVhEU7Q=;
	b=Hid+7U2dkGE5lMOJEfcEFsrwqrISaZQ/d10jCQ3fvC7k51PKvNuOivrwse8aEVne
	78+K40gXJp6PHo8tL7RjIc4H3Gt6UQLFbP6exbKs+7XEMIh86h2Gaf3N7RdiJjS80eX
	KpZUB4KvP87qqNTKyIfy+x9QB2l3XfjQB/Y0NyyM=
Content-Type: multipart/mixed; boundary="===============4858487181835525035=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] kbd: upgrading to 2.6.2 SUCCEEDED
Message-ID: <0101018a006e4972-8fbca3af-d048-4fb3-a505-17c85ede52b2-000000@us-west-2.amazonses.com>
Date: Wed, 16 Aug 2023 22:19:02 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.08.16-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Aug 2023 22:19:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186160

--===============4858487181835525035==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *kbd* to *2.6.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-kbd-upgrade-2.6.1-2.6.2.patch
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
From b8262bf11c836afe1516aa0856af8f2fcf4a65df Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 16 Aug 2023 00:36:29 +0000
Subject: [PATCH] kbd: upgrade 2.6.1 -> 2.6.2

---
 meta/recipes-core/kbd/{kbd_2.6.1.bb => kbd_2.6.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/kbd/{kbd_2.6.1.bb => kbd_2.6.2.bb} (94%)

diff --git a/meta/recipes-core/kbd/kbd_2.6.1.bb b/meta/recipes-core/kbd/kbd_2.6.2.bb
similarity index 94%
rename from meta/recipes-core/kbd/kbd_2.6.1.bb
rename to meta/recipes-core/kbd/kbd_2.6.2.bb
index 112039b919..abd039f7a9 100644
--- a/meta/recipes-core/kbd/kbd_2.6.1.bb
+++ b/meta/recipes-core/kbd/kbd_2.6.2.bb
@@ -16,7 +16,7 @@ RCONFLICTS:${PN} = "console-tools"
 SRC_URI = "${KERNELORG_MIRROR}/linux/utils/${BPN}/${BP}.tar.xz \
            "
 
-SRC_URI[sha256sum] = "2eb6c6c972be9589bab733275bf020beb5f644d5f9439737920e701af6cf3485"
+SRC_URI[sha256sum] = "33e3bb3c3f55933b10f053b14b5f69a2e24c28543e9ec7690246fe47628dd94f"
 
 EXTRA_OECONF = "--disable-tests"
 PACKAGECONFIG ?= "${@bb.utils.filter('DISTRO_FEATURES', 'pam', d)} \
-- 
2.39.2


--===============4858487181835525035==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/kbd/kbd-consolefonts: PV changed from "2.6.1" to "2.6.2"
packages/core2-32-poky-linux/kbd/kbd-consolefonts: PKGV changed from 2.6.1 [default] to 2.6.2 [default]
packages/core2-32-poky-linux/kbd/kbd-consoletrans: PV changed from "2.6.1" to "2.6.2"
packages/core2-32-poky-linux/kbd/kbd-consoletrans: PKGV changed from 2.6.1 [default] to 2.6.2 [default]
packages/core2-32-poky-linux/kbd/kbd-dbg: PV changed from "2.6.1" to "2.6.2"
packages/core2-32-poky-linux/kbd/kbd-dbg: PKGSIZE changed from 1131540 to 1131564 (+0%)
packages/core2-32-poky-linux/kbd/kbd-dbg: PKGV changed from 2.6.1 [default] to 2.6.2 [default]
packages/core2-32-poky-linux/kbd/kbd-dev: PV changed from "2.6.1" to "2.6.2"
packages/core2-32-poky-linux/kbd/kbd-dev: PKGV changed from 2.6.1 [default] to 2.6.2 [default]
packages/core2-32-poky-linux/kbd/kbd-doc: PV changed from "2.6.1" to "2.6.2"
packages/core2-32-poky-linux/kbd/kbd-doc: PKGV changed from 2.6.1 [default] to 2.6.2 [default]
packages/core2-32-poky-linux/kbd/kbd-keymaps: PV changed from "2.6.1" to "2.6.2"
packages/core2-32-poky-linux/kbd/kbd-keymaps: PKGSIZE changed from 556775 to 570294 (+2%)
packages/core2-32-poky-linux/kbd/kbd-keymaps: PKGV changed from 2.6.1 [default] to 2.6.2 [default]
packages/core2-32-poky-linux/kbd/kbd-keymaps: FILELIST: added "/usr/share/keymaps/i386/colemak/mod-dh-ansi-us.map.gz /usr/share/keymaps/i386/colemak/mod-dh-ansi-us-fatz-wide.map.gz /usr/share/keymaps/i386/colemak/mod-dh-iso-uk-wide.map.gz /usr/share/keymaps/i386/colemak/mod-dh-ansi-us-awing.map.gz /usr/share/keymaps/i386/colemak/mod-dh-iso-uk.map.gz /usr/share/keymaps/i386/colemak/mod-dh-iso-us.map.gz /usr/share/keymaps/i386/colemak/mod-dh-iso-us-wide.map.gz /usr/share/keymaps/i386/colemak/mod-dh-ansi-us-fatz.map.gz /usr/share/keymaps/i386/colemak/mod-dh-matrix-us.map.gz /usr/share/keymaps/i386/colemak/mod-dh-ansi-us-wide.map.gz"
packages/core2-32-poky-linux/kbd/kbd-locale-cs: PV changed from "2.6.1" to "2.6.2"
packages/core2-32-poky-linux/kbd/kbd-locale-cs: PKGV changed from 2.6.1 [default] to 2.6.2 [default]
packages/core2-32-poky-linux/kbd/kbd-locale-da: PV changed from "2.6.1" to "2.6.2"
packages/core2-32-poky-linux/kbd/kbd-locale-da: PKGV changed from 2.6.1 [default] to 2.6.2 [default]
packages/core2-32-poky-linux/kbd/kbd-locale-de: PV changed from "2.6.1" to "2.6.2"
packages/core2-32-poky-linux/kbd/kbd-locale-de: PKGV changed from 2.6.1 [default] to 2.6.2 [default]
packages/core2-32-poky-linux/kbd/kbd-locale-el: PV changed from "2.6.1" to "2.6.2"
packages/core2-32-poky-linux/kbd/kbd-locale-el: PKGV changed from 2.6.1 [default] to 2.6.2 [default]
packages/core2-32-poky-linux/kbd/kbd-locale-eo: PV changed from "2.6.1" to "2.6.2"
packages/core2-32-poky-linux/kbd/kbd-locale-eo: PKGV changed from 2.6.1 [default] to 2.6.2 [default]
packages/core2-32-poky-linux/kbd/kbd-locale-es: PV changed from "2.6.1" to "2.6.2"
packages/core2-32-poky-linux/kbd/kbd-locale-es: PKGV changed from 2.6.1 [default] to 2.6.2 [default]
packages/core2-32-poky-linux/kbd/kbd-locale-fr: PV changed from "2.6.1" to "2.6.2"
packages/core2-32-poky-linux/kbd/kbd-locale-fr: PKGV changed from 2.6.1 [default] to 2.6.2 [default]
packages/core2-32-poky-linux/kbd/kbd-locale-gr: PV changed from "2.6.1" to "2.6.2"
packages/core2-32-poky-linux/kbd/kbd-locale-gr: PKGV changed from 2.6.1 [default] to 2.6.2 [default]
packages/core2-32-poky-linux/kbd/kbd-locale-id: PV changed from "2.6.1" to "2.6.2"
packages/core2-32-poky-linux/kbd/kbd-locale-id: PKGV changed from 2.6.1 [default] to 2.6.2 [default]
packages/core2-32-poky-linux/kbd/kbd-locale-it: PV changed from "2.6.1" to "2.6.2"
packages/core2-32-poky-linux/kbd/kbd-locale-it: PKGV changed from 2.6.1 [default] to 2.6.2 [default]
packages/core2-32-poky-linux/kbd/kbd-locale-nl: PV changed from "2.6.1" to "2.6.2"
packages/core2-32-poky-linux/kbd/kbd-locale-nl: PKGV changed from 2.6.1 [default] to 2.6.2 [default]
packages/core2-32-poky-linux/kbd/kbd-locale-pl: PV changed from "2.6.1" to "2.6.2"
packages/core2-32-poky-linux/kbd/kbd-locale-pl: PKGV changed from 2.6.1 [default] to 2.6.2 [default]
packages/core2-32-poky-linux/kbd/kbd-locale-pt-br: PV changed from "2.6.1" to "2.6.2"
packages/core2-32-poky-linux/kbd/kbd-locale-pt-br: PKGV changed from 2.6.1 [default] to 2.6.2 [default]
packages/core2-32-poky-linux/kbd/kbd-locale-pt: PV changed from "2.6.1" to "2.6.2"
packages/core2-32-poky-linux/kbd/kbd-locale-pt: PKGV changed from 2.6.1 [default] to 2.6.2 [default]
packages/core2-32-poky-linux/kbd/kbd-locale-ro: PV changed from "2.6.1" to "2.6.2"
packages/core2-32-poky-linux/kbd/kbd-locale-ro: PKGV changed from 2.6.1 [default] to 2.6.2 [default]
packages/core2-32-poky-linux/kbd/kbd-locale-ru: PV changed from "2.6.1" to "2.6.2"
packages/core2-32-poky-linux/kbd/kbd-locale-ru: PKGV changed from 2.6.1 [default] to 2.6.2 [default]
packages/core2-32-poky-linux/kbd/kbd-locale-sr: PV changed from "2.6.1" to "2.6.2"
packages/core2-32-poky-linux/kbd/kbd-locale-sr: PKGV changed from 2.6.1 [default] to 2.6.2 [default]
packages/core2-32-poky-linux/kbd/kbd-locale-sv: PV changed from "2.6.1" to "2.6.2"
packages/core2-32-poky-linux/kbd/kbd-locale-sv: PKGV changed from 2.6.1 [default] to 2.6.2 [default]
packages/core2-32-poky-linux/kbd/kbd-locale-tr: PV changed from "2.6.1" to "2.6.2"
packages/core2-32-poky-linux/kbd/kbd-locale-tr: PKGV changed from 2.6.1 [default] to 2.6.2 [default]
packages/core2-32-poky-linux/kbd/kbd-locale-uk: PV changed from "2.6.1" to "2.6.2"
packages/core2-32-poky-linux/kbd/kbd-locale-uk: PKGV changed from 2.6.1 [default] to 2.6.2 [default]
packages/core2-32-poky-linux/kbd/kbd-locale-vi: PV changed from "2.6.1" to "2.6.2"
packages/core2-32-poky-linux/kbd/kbd-locale-vi: PKGV changed from 2.6.1 [default] to 2.6.2 [default]
packages/core2-32-poky-linux/kbd/kbd-locale-zh-cn: PV changed from "2.6.1" to "2.6.2"
packages/core2-32-poky-linux/kbd/kbd-locale-zh-cn: PKGV changed from 2.6.1 [default] to 2.6.2 [default]
packages/core2-32-poky-linux/kbd/kbd-src: PV changed from "2.6.1" to "2.6.2"
packages/core2-32-poky-linux/kbd/kbd-src: PKGSIZE changed from 583574 to 583569 (-0%)
packages/core2-32-poky-linux/kbd/kbd-src: PKGV changed from 2.6.1 [default] to 2.6.2 [default]
packages/core2-32-poky-linux/kbd/kbd-staticdev: PV changed from "2.6.1" to "2.6.2"
packages/core2-32-poky-linux/kbd/kbd-staticdev: PKGV changed from 2.6.1 [default] to 2.6.2 [default]
packages/core2-32-poky-linux/kbd/kbd-unimaps: PV changed from "2.6.1" to "2.6.2"
packages/core2-32-poky-linux/kbd/kbd-unimaps: PKGV changed from 2.6.1 [default] to 2.6.2 [default]
packages/core2-32-poky-linux/kbd/kbd: PV changed from "2.6.1" to "2.6.2"
packages/core2-32-poky-linux/kbd/kbd: PKGV changed from 2.6.1 [default] to 2.6.2 [default]
packages/core2-32-poky-linux/kbd: PV changed from "2.6.1" to "2.6.2"
packages/core2-32-poky-linux/kbd: SRC_URI changed from "https://cdn.kernel.org/pub/linux/utils/kbd/kbd-2.6.1.tar.xz" to "https://cdn.kernel.org/pub/linux/utils/kbd/kbd-2.6.2.tar.xz"
packages/core2-32-poky-linux/kbd: PKGV changed from 2.6.1 [default] to 2.6.2 [default]
Changes to packages/core2-32-poky-linux/kbd (sysroot):
  /usr/share/keymaps/i386/colemak/mod-dh-ansi-us-awing.map.gz was added
  /usr/share/keymaps/i386/colemak/mod-dh-ansi-us-fatz.map.gz was added
  /usr/share/keymaps/i386/colemak/mod-dh-ansi-us-fatz-wide.map.gz was added
  /usr/share/keymaps/i386/colemak/mod-dh-ansi-us.map.gz was added
  /usr/share/keymaps/i386/colemak/mod-dh-ansi-us-wide.map.gz was added
  /usr/share/keymaps/i386/colemak/mod-dh-iso-uk.map.gz was added
  /usr/share/keymaps/i386/colemak/mod-dh-iso-uk-wide.map.gz was added
  /usr/share/keymaps/i386/colemak/mod-dh-iso-us.map.gz was added
  /usr/share/keymaps/i386/colemak/mod-dh-iso-us-wide.map.gz was added
  /usr/share/keymaps/i386/colemak/mod-dh-matrix-us.map.gz was added

--===============4858487181835525035==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/kbd/kbd-keymaps: FILELIST: added "/usr/share/keymaps/i386/colemak/mod-dh-ansi-us.map.gz /usr/share/keymaps/i386/colemak/mod-dh-matrix-us.map.gz /usr/share/keymaps/i386/colemak/mod-dh-iso-uk-wide.map.gz /usr/share/keymaps/i386/colemak/mod-dh-iso-us-wide.map.gz /usr/share/keymaps/i386/colemak/mod-dh-iso-uk.map.gz /usr/share/keymaps/i386/colemak/mod-dh-ansi-us-fatz.map.gz /usr/share/keymaps/i386/colemak/mod-dh-ansi-us-wide.map.gz /usr/share/keymaps/i386/colemak/mod-dh-ansi-us-awing.map.gz /usr/share/keymaps/i386/colemak/mod-dh-iso-us.map.gz /usr/share/keymaps/i386/colemak/mod-dh-ansi-us-fatz-wide.map.gz"
Changes to packages/core2-32-poky-linux/kbd (sysroot):
  /usr/share/keymaps/i386/colemak/mod-dh-ansi-us-awing.map.gz was added
  /usr/share/keymaps/i386/colemak/mod-dh-ansi-us-fatz.map.gz was added
  /usr/share/keymaps/i386/colemak/mod-dh-ansi-us-fatz-wide.map.gz was added
  /usr/share/keymaps/i386/colemak/mod-dh-ansi-us.map.gz was added
  /usr/share/keymaps/i386/colemak/mod-dh-ansi-us-wide.map.gz was added
  /usr/share/keymaps/i386/colemak/mod-dh-iso-uk.map.gz was added
  /usr/share/keymaps/i386/colemak/mod-dh-iso-uk-wide.map.gz was added
  /usr/share/keymaps/i386/colemak/mod-dh-iso-us.map.gz was added
  /usr/share/keymaps/i386/colemak/mod-dh-iso-us-wide.map.gz was added
  /usr/share/keymaps/i386/colemak/mod-dh-matrix-us.map.gz was added

--===============4858487181835525035==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="0001-kbd-upgrade-2.6.1-2.6.2.patch"

RnJvbSBiODI2MmJmMTFjODM2YWZlMTUxNmFhMDg1NmFmOGYyZmNmNGE2NWRmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTYgQXVnIDIwMjMgMDA6MzY6MjkgKzAwMDAKU3ViamVjdDogW1BBVENIXSBr
YmQ6IHVwZ3JhZGUgMi42LjEgLT4gMi42LjIKCi0tLQogbWV0YS9yZWNpcGVzLWNvcmUva2JkL3tr
YmRfMi42LjEuYmIgPT4ga2JkXzIuNi4yLmJifSB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGlu
c2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1jb3JlL2tiZC97
a2JkXzIuNi4xLmJiID0+IGtiZF8yLjYuMi5iYn0gKDk0JSkKCmRpZmYgLS1naXQgYS9tZXRhL3Jl
Y2lwZXMtY29yZS9rYmQva2JkXzIuNi4xLmJiIGIvbWV0YS9yZWNpcGVzLWNvcmUva2JkL2tiZF8y
LjYuMi5iYgpzaW1pbGFyaXR5IGluZGV4IDk0JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtY29y
ZS9rYmQva2JkXzIuNi4xLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtY29yZS9rYmQva2JkXzIu
Ni4yLmJiCmluZGV4IDExMjAzOWI5MTkuLmFiZDAzOWY3YTkgMTAwNjQ0Ci0tLSBhL21ldGEvcmVj
aXBlcy1jb3JlL2tiZC9rYmRfMi42LjEuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWNvcmUva2JkL2ti
ZF8yLjYuMi5iYgpAQCAtMTYsNyArMTYsNyBAQCBSQ09ORkxJQ1RTOiR7UE59ID0gImNvbnNvbGUt
dG9vbHMiCiBTUkNfVVJJID0gIiR7S0VSTkVMT1JHX01JUlJPUn0vbGludXgvdXRpbHMvJHtCUE59
LyR7QlB9LnRhci54eiBcCiAgICAgICAgICAgICIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjJl
YjZjNmM5NzJiZTk1ODliYWI3MzMyNzViZjAyMGJlYjVmNjQ0ZDVmOTQzOTczNzkyMGU3MDFhZjZj
ZjM0ODUiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiMzNlM2JiM2MzZjU1OTMzYjEwZjA1M2IxNGI1
ZjY5YTJlMjRjMjg1NDNlOWVjNzY5MDI0NmZlNDc2MjhkZDk0ZiIKIAogRVhUUkFfT0VDT05GID0g
Ii0tZGlzYWJsZS10ZXN0cyIKIFBBQ0tBR0VDT05GSUcgPz0gIiR7QGJiLnV0aWxzLmZpbHRlcign
RElTVFJPX0ZFQVRVUkVTJywgJ3BhbScsIGQpfSBcCi0tIAoyLjM5LjIKCg==

--===============4858487181835525035==--

