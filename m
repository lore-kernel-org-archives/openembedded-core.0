Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD837D5C0E7
	for <webhook@archiver.kernel.org>; Tue, 16 Dec 2025 08:02:26 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17382.1765872127684878873
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Dec 2025 00:02:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=DryYVtIQ;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=Rz7dqkF7;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101019b262e73c6-36956005-121f-4d62-a0d0-4e780cb7a889-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1765872137;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=skVxnMaR8PqwdWZrs7eCRL+Ak/+/jyPf57f2/bebweQ=;
	b=DryYVtIQGFBkl/6ZG+HrtO1PKIncwjjW+IBI6DMsyWZzZeAKQJBJI3W1XZY4MYUU
	5lgsqa3RjEy/nzdA7RMYvVmJcoAkR7WhMaMQXDjA/8n5rZzrvD8hZTnCrlgyqc7g6cg
	LeccfTgDKBMGfLLzlZ8UnMpdbIQ3gxSBM8PwKDak=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1765872137;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=skVxnMaR8PqwdWZrs7eCRL+Ak/+/jyPf57f2/bebweQ=;
	b=Rz7dqkF7Z6FxW8bC4Dp1luQnw2X3pNn2leJIgg3B0Ox7qNxb/ITghmOp3lpxt7M3
	2xd0x/rA2K7I7OHptLxAnDe1NVWVcN8rXHsuE7HgDGv1aJt1TbnFMeBqm3SDOzCCotu
	nl2i5zvu3G4/06TmYUZ9giUxTt6QmvpzA2tTid60=
Content-Type: multipart/mixed; boundary="===============6249842304553985565=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] ninja: upgrading to 1.13.2 SUCCEEDED
Message-ID: <0101019b262e73c6-36956005-121f-4d62-a0d0-4e780cb7a889-000000@us-west-2.amazonses.com>
Date: Tue, 16 Dec 2025 08:02:17 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.12.16-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Dec 2025 08:02:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227790

--===============6249842304553985565==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *ninja* to *1.13.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-ninja-upgrade-1.13.1-1.13.2.patch
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
From c6674bdb81931dcd35fc2c9f764f4fbe4811e694 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 15 Dec 2025 23:03:27 +0000
Subject: [PATCH] ninja: upgrade 1.13.1 -> 1.13.2

---
 .../recipes-devtools/ninja/{ninja_1.13.1.bb => ninja_1.13.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/ninja/{ninja_1.13.1.bb => ninja_1.13.2.bb} (94%)

diff --git a/meta/recipes-devtools/ninja/ninja_1.13.1.bb b/meta/recipes-devtools/ninja/ninja_1.13.2.bb
similarity index 94%
rename from meta/recipes-devtools/ninja/ninja_1.13.1.bb
rename to meta/recipes-devtools/ninja/ninja_1.13.2.bb
index dcaa889c04..e750c78c46 100644
--- a/meta/recipes-devtools/ninja/ninja_1.13.1.bb
+++ b/meta/recipes-devtools/ninja/ninja_1.13.2.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a81586a64ad4e476c791cda7e2f2c52e"
 
 DEPENDS = "re2c-native ninja-native"
 
-SRCREV = "79feac0f3e3bc9da9effc586cd5fea41e7550051"
+SRCREV = "3441b633c2fe2c494e958780ba0f4227b1327634"
 
 SRC_URI = "git://github.com/ninja-build/ninja.git;branch=release;protocol=https;tag=v${PV}"
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>.*)"
-- 
2.47.1


--===============6249842304553985565==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-ninja-upgrade-1.13.1-1.13.2.patch"

RnJvbSBjNjY3NGJkYjgxOTMxZGNkMzVmYzJjOWY3NjRmNGZiZTQ4MTFlNjk0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTUgRGVjIDIwMjUgMjM6MDM6MjcgKzAwMDAKU3ViamVjdDogW1BBVENIXSBu
aW5qYTogdXBncmFkZSAxLjEzLjEgLT4gMS4xMy4yCgotLS0KIC4uLi9yZWNpcGVzLWRldnRvb2xz
L25pbmphL3tuaW5qYV8xLjEzLjEuYmIgPT4gbmluamFfMS4xMy4yLmJifSB8IDIgKy0KIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEvcmVj
aXBlcy1kZXZ0b29scy9uaW5qYS97bmluamFfMS4xMy4xLmJiID0+IG5pbmphXzEuMTMuMi5iYn0g
KDk0JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvbmluamEvbmluamFfMS4x
My4xLmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL25pbmphL25pbmphXzEuMTMuMi5iYgpzaW1p
bGFyaXR5IGluZGV4IDk0JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvbmluamEv
bmluamFfMS4xMy4xLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvbmluamEvbmlu
amFfMS4xMy4yLmJiCmluZGV4IGRjYWE4ODljMDQuLmU3NTBjNzhjNDYgMTAwNjQ0Ci0tLSBhL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9uaW5qYS9uaW5qYV8xLjEzLjEuYmIKKysrIGIvbWV0YS9yZWNp
cGVzLWRldnRvb2xzL25pbmphL25pbmphXzEuMTMuMi5iYgpAQCAtMTAsNyArMTAsNyBAQCBMSUNf
RklMRVNfQ0hLU1VNID0gImZpbGU6Ly9DT1BZSU5HO21kNT1hODE1ODZhNjRhZDRlNDc2Yzc5MWNk
YTdlMmYyYzUyZSIKIAogREVQRU5EUyA9ICJyZTJjLW5hdGl2ZSBuaW5qYS1uYXRpdmUiCiAKLVNS
Q1JFViA9ICI3OWZlYWMwZjNlM2JjOWRhOWVmZmM1ODZjZDVmZWE0MWU3NTUwMDUxIgorU1JDUkVW
ID0gIjM0NDFiNjMzYzJmZTJjNDk0ZTk1ODc4MGJhMGY0MjI3YjEzMjc2MzQiCiAKIFNSQ19VUkkg
PSAiZ2l0Oi8vZ2l0aHViLmNvbS9uaW5qYS1idWlsZC9uaW5qYS5naXQ7YnJhbmNoPXJlbGVhc2U7
cHJvdG9jb2w9aHR0cHM7dGFnPXYke1BWfSIKIFVQU1RSRUFNX0NIRUNLX0dJVFRBR1JFR0VYID0g
InYoP1A8cHZlcj4uKikiCi0tIAoyLjQ3LjEKCg==

--===============6249842304553985565==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/gcc-runtime/gcc-runtime-src: PKGSIZE changed from 9685472 to 9883625 (+2%)
packages/x86-64-v3-poky-linux/ninja: PKGV changed from 1.13.1 [default] to 1.13.2 [default]
packages/x86-64-v3-poky-linux/ninja: SRC_URI changed from "git://github.com/ninja-build/ninja.git;branch=release;protocol=https;tag=v1.13.1" to "git://github.com/ninja-build/ninja.git;branch=release;protocol=https;tag=v1.13.2"
packages/x86-64-v3-poky-linux/ninja: PV changed from "1.13.1" to "1.13.2"
packages/x86-64-v3-poky-linux/ninja/ninja-dbg: PKGV changed from 1.13.1 [default] to 1.13.2 [default]
packages/x86-64-v3-poky-linux/ninja/ninja-dbg: PV changed from "1.13.1" to "1.13.2"
packages/x86-64-v3-poky-linux/ninja/ninja-dbg: PKGSIZE changed from 8660656 to 8660616 (-0%)
packages/x86-64-v3-poky-linux/ninja/ninja-dev: PKGV changed from 1.13.1 [default] to 1.13.2 [default]
packages/x86-64-v3-poky-linux/ninja/ninja-dev: PV changed from "1.13.1" to "1.13.2"
packages/x86-64-v3-poky-linux/ninja/ninja-doc: PKGV changed from 1.13.1 [default] to 1.13.2 [default]
packages/x86-64-v3-poky-linux/ninja/ninja-doc: PV changed from "1.13.1" to "1.13.2"
packages/x86-64-v3-poky-linux/ninja/ninja-locale: PKGV changed from 1.13.1 [default] to 1.13.2 [default]
packages/x86-64-v3-poky-linux/ninja/ninja-locale: PV changed from "1.13.1" to "1.13.2"
packages/x86-64-v3-poky-linux/ninja/ninja-src: PKGV changed from 1.13.1 [default] to 1.13.2 [default]
packages/x86-64-v3-poky-linux/ninja/ninja-src: FILELIST: directory renamed /usr/src/debug/ninja/1.13.1/src -> /usr/src/debug/ninja/1.13.2/src, directory renamed /usr/src/debug/ninja/1.13.1/build -> /usr/src/debug/ninja/1.13.2/build, directory renamed /usr/src/debug/ninja/1.13.1/src/third_party/rapidhash -> /usr/src/debug/ninja/1.13.2/src/third_party/rapidhash, directory renamed /usr/src/debug/ninja/1.13.1/src/third_party/emhash -> /usr/src/debug/ninja/1.13.2/src/third_party/emhash
packages/x86-64-v3-poky-linux/ninja/ninja-src: PV changed from "1.13.1" to "1.13.2"
packages/x86-64-v3-poky-linux/ninja/ninja-src: PKGSIZE changed from 557086 to 557129 (+0%)
packages/x86-64-v3-poky-linux/ninja/ninja-staticdev: PKGV changed from 1.13.1 [default] to 1.13.2 [default]
packages/x86-64-v3-poky-linux/ninja/ninja-staticdev: PV changed from "1.13.1" to "1.13.2"
packages/x86-64-v3-poky-linux/ninja/ninja: PKGV changed from 1.13.1 [default] to 1.13.2 [default]
packages/x86-64-v3-poky-linux/ninja/ninja: PV changed from "1.13.1" to "1.13.2"

--===============6249842304553985565==--

