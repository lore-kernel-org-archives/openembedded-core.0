Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF341C2FC0F
	for <webhook@archiver.kernel.org>; Fri, 16 Jun 2023 03:51:29 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web10.812.1686887482022817994
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Jun 2023 20:51:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=fJKn8tXk;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 01010188c2543ed9-e77ab903-c2b1-4664-8131-451ad7d14741-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1686887481;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=TSOWfU1S01opNJI6bYP4uq6oOdR57FZXvLtuURqodjw=;
	b=fJKn8tXkkPXbwfXTSuUjR4YyM3PMyYQQeq2f5kamu4AsnTQbpWqbcf4vzYVxApKt
	Pp1wKEMqtz8qyCST7lrcXd+BRtUTHmV0Wbps/mMgTJeTR+zrgTSEnJOKN8MkJUT9gel
	kqSfWKYVWKaHqV1NinczbDIe6HJHTbIdjlFfEJfM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1686887481;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=TSOWfU1S01opNJI6bYP4uq6oOdR57FZXvLtuURqodjw=;
	b=V7riRj+S4St4Qn86m99upzw9HaT1XsXEsfa675/ARIp+BeRpvRlLEoyvg6kj9iqu
	GSbgM36eWUMapCC1u4pBg5MBjEv7sFedMyxBjYh8KVIFCcfSAWwSP9ykG796BJ4HtgS
	1o6STG55VmCWCzlwuWNceuh4Dh5ljGhl953EuFBg=
Content-Type: multipart/mixed; boundary="===============0744425447600668889=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] kbd: upgrading to 2.6.0 SUCCEEDED
Message-ID: <01010188c2543ed9-e77ab903-c2b1-4664-8131-451ad7d14741-000000@us-west-2.amazonses.com>
Date: Fri, 16 Jun 2023 03:51:21 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.06.16-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Jun 2023 03:51:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182893

--===============0744425447600668889==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *kbd* to *2.6.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-kbd-upgrade-2.5.1-2.6.0.patch
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
From e914243c23e632e6215960fec879cd644de81df8 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 15 Jun 2023 07:14:26 +0000
Subject: [PATCH] kbd: upgrade 2.5.1 -> 2.6.0

---
 meta/recipes-core/kbd/{kbd_2.5.1.bb => kbd_2.6.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/kbd/{kbd_2.5.1.bb => kbd_2.6.0.bb} (94%)

diff --git a/meta/recipes-core/kbd/kbd_2.5.1.bb b/meta/recipes-core/kbd/kbd_2.6.0.bb
similarity index 94%
rename from meta/recipes-core/kbd/kbd_2.5.1.bb
rename to meta/recipes-core/kbd/kbd_2.6.0.bb
index 7662b8f685..9a3e0a7476 100644
--- a/meta/recipes-core/kbd/kbd_2.5.1.bb
+++ b/meta/recipes-core/kbd/kbd_2.6.0.bb
@@ -16,7 +16,7 @@ RCONFLICTS:${PN} = "console-tools"
 SRC_URI = "${KERNELORG_MIRROR}/linux/utils/${BPN}/${BP}.tar.xz \
            "
 
-SRC_URI[sha256sum] = "ccdf452387a6380973d2927363e9cbb939fa2068915a6f937ff9d24522024683"
+SRC_URI[sha256sum] = "9c159433db5df8ef31d86b42f5b09d32311bdda2ed35107fb1926243da60b28a"
 
 EXTRA_OECONF = "--disable-tests"
 PACKAGECONFIG ?= "${@bb.utils.filter('DISTRO_FEATURES', 'pam', d)} \
-- 
2.39.2


--===============0744425447600668889==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="0001-kbd-upgrade-2.5.1-2.6.0.patch"

RnJvbSBlOTE0MjQzYzIzZTYzMmU2MjE1OTYwZmVjODc5Y2Q2NDRkZTgxZGY4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgSnVuIDIwMjMgMDc6MTQ6MjYgKzAwMDAKU3ViamVjdDogW1BBVENIXSBr
YmQ6IHVwZ3JhZGUgMi41LjEgLT4gMi42LjAKCi0tLQogbWV0YS9yZWNpcGVzLWNvcmUva2JkL3tr
YmRfMi41LjEuYmIgPT4ga2JkXzIuNi4wLmJifSB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGlu
c2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1jb3JlL2tiZC97
a2JkXzIuNS4xLmJiID0+IGtiZF8yLjYuMC5iYn0gKDk0JSkKCmRpZmYgLS1naXQgYS9tZXRhL3Jl
Y2lwZXMtY29yZS9rYmQva2JkXzIuNS4xLmJiIGIvbWV0YS9yZWNpcGVzLWNvcmUva2JkL2tiZF8y
LjYuMC5iYgpzaW1pbGFyaXR5IGluZGV4IDk0JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtY29y
ZS9rYmQva2JkXzIuNS4xLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtY29yZS9rYmQva2JkXzIu
Ni4wLmJiCmluZGV4IDc2NjJiOGY2ODUuLjlhM2UwYTc0NzYgMTAwNjQ0Ci0tLSBhL21ldGEvcmVj
aXBlcy1jb3JlL2tiZC9rYmRfMi41LjEuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWNvcmUva2JkL2ti
ZF8yLjYuMC5iYgpAQCAtMTYsNyArMTYsNyBAQCBSQ09ORkxJQ1RTOiR7UE59ID0gImNvbnNvbGUt
dG9vbHMiCiBTUkNfVVJJID0gIiR7S0VSTkVMT1JHX01JUlJPUn0vbGludXgvdXRpbHMvJHtCUE59
LyR7QlB9LnRhci54eiBcCiAgICAgICAgICAgICIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gImNj
ZGY0NTIzODdhNjM4MDk3M2QyOTI3MzYzZTljYmI5MzlmYTIwNjg5MTVhNmY5MzdmZjlkMjQ1MjIw
MjQ2ODMiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiOWMxNTk0MzNkYjVkZjhlZjMxZDg2YjQyZjVi
MDlkMzIzMTFiZGRhMmVkMzUxMDdmYjE5MjYyNDNkYTYwYjI4YSIKIAogRVhUUkFfT0VDT05GID0g
Ii0tZGlzYWJsZS10ZXN0cyIKIFBBQ0tBR0VDT05GSUcgPz0gIiR7QGJiLnV0aWxzLmZpbHRlcign
RElTVFJPX0ZFQVRVUkVTJywgJ3BhbScsIGQpfSBcCi0tIAoyLjM5LjIKCg==

--===============0744425447600668889==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/kbd/kbd-consolefonts: PKGV changed from 2.5.1 [default] to 2.6.0 [default]
packages/core2-32-poky-linux/kbd/kbd-consolefonts: PV changed from "2.5.1" to "2.6.0"
packages/core2-32-poky-linux/kbd/kbd-consoletrans: PKGV changed from 2.5.1 [default] to 2.6.0 [default]
packages/core2-32-poky-linux/kbd/kbd-consoletrans: PV changed from "2.5.1" to "2.6.0"
packages/core2-32-poky-linux/kbd/kbd-dbg: PKGSIZE changed from 1125172 to 1127140 (+0%)
packages/core2-32-poky-linux/kbd/kbd-dbg: PKGV changed from 2.5.1 [default] to 2.6.0 [default]
packages/core2-32-poky-linux/kbd/kbd-dbg: PV changed from "2.5.1" to "2.6.0"
packages/core2-32-poky-linux/kbd/kbd-dev: PKGV changed from 2.5.1 [default] to 2.6.0 [default]
packages/core2-32-poky-linux/kbd/kbd-dev: PV changed from "2.5.1" to "2.6.0"
packages/core2-32-poky-linux/kbd/kbd-doc: PKGV changed from 2.5.1 [default] to 2.6.0 [default]
packages/core2-32-poky-linux/kbd/kbd-doc: PV changed from "2.5.1" to "2.6.0"
packages/core2-32-poky-linux/kbd/kbd-keymaps: PKGSIZE changed from 546987 to 551061 (+1%)
packages/core2-32-poky-linux/kbd/kbd-keymaps: PKGV changed from 2.5.1 [default] to 2.6.0 [default]
packages/core2-32-poky-linux/kbd/kbd-keymaps: FILELIST: added "/usr/share/keymaps/i386/dvorak/dvorak-de.map.gz"
packages/core2-32-poky-linux/kbd/kbd-keymaps: PV changed from "2.5.1" to "2.6.0"
packages/core2-32-poky-linux/kbd/kbd-locale-cs: PKGSIZE changed from 41719 to 41875 (+0%)
packages/core2-32-poky-linux/kbd/kbd-locale-cs: PKGV changed from 2.5.1 [default] to 2.6.0 [default]
packages/core2-32-poky-linux/kbd/kbd-locale-cs: PV changed from "2.5.1" to "2.6.0"
packages/core2-32-poky-linux/kbd/kbd-locale-da: PKGV changed from 2.5.1 [default] to 2.6.0 [default]
packages/core2-32-poky-linux/kbd/kbd-locale-da: PV changed from "2.5.1" to "2.6.0"
packages/core2-32-poky-linux/kbd/kbd-locale-de: PKGSIZE changed from 42460 to 42609 (+0%)
packages/core2-32-poky-linux/kbd/kbd-locale-de: PKGV changed from 2.5.1 [default] to 2.6.0 [default]
packages/core2-32-poky-linux/kbd/kbd-locale-de: PV changed from "2.5.1" to "2.6.0"
packages/core2-32-poky-linux/kbd/kbd-locale-el: PKGSIZE changed from 50810 to 52624 (+4%)
packages/core2-32-poky-linux/kbd/kbd-locale-el: PKGV changed from 2.5.1 [default] to 2.6.0 [default]
packages/core2-32-poky-linux/kbd/kbd-locale-el: PV changed from "2.5.1" to "2.6.0"
packages/core2-32-poky-linux/kbd/kbd-locale-eo: PKGSIZE changed from 38485 to 38223 (-1%)
packages/core2-32-poky-linux/kbd/kbd-locale-eo: PKGV changed from 2.5.1 [default] to 2.6.0 [default]
packages/core2-32-poky-linux/kbd/kbd-locale-eo: PV changed from "2.5.1" to "2.6.0"
packages/core2-32-poky-linux/kbd/kbd-locale-es: PKGSIZE changed from 42900 to 43068 (+0%)
packages/core2-32-poky-linux/kbd/kbd-locale-es: PKGV changed from 2.5.1 [default] to 2.6.0 [default]
packages/core2-32-poky-linux/kbd/kbd-locale-es: PV changed from "2.5.1" to "2.6.0"
packages/core2-32-poky-linux/kbd/kbd-locale-fr: PKGSIZE changed from 37881 to 37579 (-1%)
packages/core2-32-poky-linux/kbd/kbd-locale-fr: PKGV changed from 2.5.1 [default] to 2.6.0 [default]
packages/core2-32-poky-linux/kbd/kbd-locale-fr: PV changed from "2.5.1" to "2.6.0"
packages/core2-32-poky-linux/kbd/kbd-locale-gr: PKGV changed from 2.5.1 [default] to 2.6.0 [default]
packages/core2-32-poky-linux/kbd/kbd-locale-gr: PV changed from "2.5.1" to "2.6.0"
packages/core2-32-poky-linux/kbd/kbd-locale-id: PKGV changed from 2.5.1 [default] to 2.6.0 [default]
packages/core2-32-poky-linux/kbd/kbd-locale-id: PV changed from "2.5.1" to "2.6.0"
packages/core2-32-poky-linux/kbd/kbd-locale-it: PKGV changed from 2.5.1 [default] to 2.6.0 [default]
packages/core2-32-poky-linux/kbd/kbd-locale-it: PV changed from "2.5.1" to "2.6.0"
packages/core2-32-poky-linux/kbd/kbd-locale-nl: PKGV changed from 2.5.1 [default] to 2.6.0 [default]
packages/core2-32-poky-linux/kbd/kbd-locale-nl: PV changed from "2.5.1" to "2.6.0"
packages/core2-32-poky-linux/kbd/kbd-locale-pl: PKGSIZE changed from 41596 to 41746 (+0%)
packages/core2-32-poky-linux/kbd/kbd-locale-pl: PKGV changed from 2.5.1 [default] to 2.6.0 [default]
packages/core2-32-poky-linux/kbd/kbd-locale-pl: PV changed from "2.5.1" to "2.6.0"
packages/core2-32-poky-linux/kbd/kbd-locale-pt-br: PKGSIZE changed from 40318 to 40028 (-1%)
packages/core2-32-poky-linux/kbd/kbd-locale-pt-br: PKGV changed from 2.5.1 [default] to 2.6.0 [default]
packages/core2-32-poky-linux/kbd/kbd-locale-pt-br: PV changed from "2.5.1" to "2.6.0"
packages/core2-32-poky-linux/kbd/kbd-locale-pt: PKGSIZE changed from 38996 to 38725 (-1%)
packages/core2-32-poky-linux/kbd/kbd-locale-pt: PKGV changed from 2.5.1 [default] to 2.6.0 [default]
packages/core2-32-poky-linux/kbd/kbd-locale-pt: PV changed from "2.5.1" to "2.6.0"
packages/core2-32-poky-linux/kbd/kbd-locale-ro: PKGSIZE changed from 43906 to 44085 (+0%)
packages/core2-32-poky-linux/kbd/kbd-locale-ro: PKGV changed from 2.5.1 [default] to 2.6.0 [default]
packages/core2-32-poky-linux/kbd/kbd-locale-ro: PV changed from "2.5.1" to "2.6.0"
packages/core2-32-poky-linux/kbd/kbd-locale-ru: PKGSIZE changed from 54720 to 54910 (+0%)
packages/core2-32-poky-linux/kbd/kbd-locale-ru: PKGV changed from 2.5.1 [default] to 2.6.0 [default]
packages/core2-32-poky-linux/kbd/kbd-locale-ru: PV changed from "2.5.1" to "2.6.0"
packages/core2-32-poky-linux/kbd/kbd-locale-sr: PKGSIZE changed from 50998 to 53234 (+4%)
packages/core2-32-poky-linux/kbd/kbd-locale-sr: PKGV changed from 2.5.1 [default] to 2.6.0 [default]
packages/core2-32-poky-linux/kbd/kbd-locale-sr: PV changed from "2.5.1" to "2.6.0"
packages/core2-32-poky-linux/kbd/kbd-locale-sv: PKGSIZE changed from 40882 to 41033 (+0%)
packages/core2-32-poky-linux/kbd/kbd-locale-sv: PKGV changed from 2.5.1 [default] to 2.6.0 [default]
packages/core2-32-poky-linux/kbd/kbd-locale-sv: PV changed from "2.5.1" to "2.6.0"
packages/core2-32-poky-linux/kbd/kbd-locale-tr: PKGV changed from 2.5.1 [default] to 2.6.0 [default]
packages/core2-32-poky-linux/kbd/kbd-locale-tr: PV changed from "2.5.1" to "2.6.0"
packages/core2-32-poky-linux/kbd/kbd-locale-uk: PKGSIZE changed from 54728 to 54930 (+0%)
packages/core2-32-poky-linux/kbd/kbd-locale-uk: PKGV changed from 2.5.1 [default] to 2.6.0 [default]
packages/core2-32-poky-linux/kbd/kbd-locale-uk: PV changed from "2.5.1" to "2.6.0"
packages/core2-32-poky-linux/kbd/kbd-locale-vi: PKGV changed from 2.5.1 [default] to 2.6.0 [default]
packages/core2-32-poky-linux/kbd/kbd-locale-vi: PV changed from "2.5.1" to "2.6.0"
packages/core2-32-poky-linux/kbd/kbd-locale-zh-cn: PKGSIZE changed from 18393 to 18264 (-1%)
packages/core2-32-poky-linux/kbd/kbd-locale-zh-cn: PKGV changed from 2.5.1 [default] to 2.6.0 [default]
packages/core2-32-poky-linux/kbd/kbd-locale-zh-cn: PV changed from "2.5.1" to "2.6.0"
packages/core2-32-poky-linux/kbd/kbd-src: PKGSIZE changed from 580287 to 582312 (+0%)
packages/core2-32-poky-linux/kbd/kbd-src: PKGV changed from 2.5.1 [default] to 2.6.0 [default]
packages/core2-32-poky-linux/kbd/kbd-src: PV changed from "2.5.1" to "2.6.0"
packages/core2-32-poky-linux/kbd/kbd-staticdev: PKGV changed from 2.5.1 [default] to 2.6.0 [default]
packages/core2-32-poky-linux/kbd/kbd-staticdev: PV changed from "2.5.1" to "2.6.0"
packages/core2-32-poky-linux/kbd/kbd-unimaps: PKGSIZE changed from 221956 to 222173 (+0%)
packages/core2-32-poky-linux/kbd/kbd-unimaps: PKGV changed from 2.5.1 [default] to 2.6.0 [default]
packages/core2-32-poky-linux/kbd/kbd-unimaps: PV changed from "2.5.1" to "2.6.0"
packages/core2-32-poky-linux/kbd/kbd: PKGV changed from 2.5.1 [default] to 2.6.0 [default]
packages/core2-32-poky-linux/kbd/kbd: PV changed from "2.5.1" to "2.6.0"
packages/core2-32-poky-linux/kbd: SRC_URI changed from "https://cdn.kernel.org/pub/linux/utils/kbd/kbd-2.5.1.tar.xz" to "https://cdn.kernel.org/pub/linux/utils/kbd/kbd-2.6.0.tar.xz"
packages/core2-32-poky-linux/kbd: PKGV changed from 2.5.1 [default] to 2.6.0 [default]
packages/core2-32-poky-linux/kbd: PV changed from "2.5.1" to "2.6.0"
Changes to packages/core2-32-poky-linux/kbd (sysroot):
  /usr/share/keymaps/i386/dvorak/dvorak-de.map.gz was added

--===============0744425447600668889==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/kbd/kbd-keymaps: FILELIST: added "/usr/share/keymaps/i386/dvorak/dvorak-de.map.gz"
Changes to packages/core2-32-poky-linux/kbd (sysroot):
  /usr/share/keymaps/i386/dvorak/dvorak-de.map.gz was added

--===============0744425447600668889==--

