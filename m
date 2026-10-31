Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1613.1793425335879849607
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Oct 2026 22:42:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=gpXVrjtb;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=iSx++08d;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 010101a1907ae204-af156731-4653-4b0b-80df-5f7d704fd71c-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1793425334;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=KksTU1G/iuti8FMrGTmzo+4n9spJY1uQzP3iMvkS74s=;
	b=gpXVrjtb35pCGgNPOhRbNiBPi9oukznUNfuACWWLO8bNG0llN+Tp+oKsNJd/UusZ
	P0jFeIxhPWPbLpt3Nb6gSTMh8iD11qeiWz5XTZ6BRoFLgmz09A51s9r01dfjl12iwwI
	GCnIathV9EDf6b0pkTW0xwaJIjf5lp8o49fn1vBc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1793425334;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=KksTU1G/iuti8FMrGTmzo+4n9spJY1uQzP3iMvkS74s=;
	b=iSx++08d1AKhxS0Na235srXq8JP6VvG3z2yjcOPLLqRVlT/6cFWfQm76kTq4BZnA
	NyX+6fUEww6BqN25Y0wM+cnd9sQqhVwcweKdSwFkiZPRCno/QwhYkr1wcizTOkUlb3s
	sYPFAliq+K0Xc6btTdH5a+EXKAHWw8RllwOvh2Pk=
Content-Type: multipart/mixed; boundary="===============8187233536066106778=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] patchelf: upgrading to 0.19.3 SUCCEEDED
Message-ID: <010101a1907ae204-af156731-4653-4b0b-80df-5f7d704fd71c-000000@us-west-2.amazonses.com>
Date: Sat, 31 Oct 2026 05:42:14 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.10.31-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sat, 31 Oct 2026 05:42:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249134

--===============8187233536066106778==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *patchelf* to *0.19.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-patchelf-upgrade-0.19.2-0.19.3.patch
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
From 973638f4b7fbff368efb19988db13863002cb7af Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 31 Oct 2026 05:15:03 +0000
Subject: [PATCH] patchelf: upgrade 0.19.2 -> 0.19.3

## 0.19.3 (October 30, 2026)

A bug fix release for executable rewrites, symbol version definitions, and zsh
completion.

### Bug fixes
---
 meta/recipes-devtools/patchelf/patchelf_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/patchelf/patchelf_git.bb b/meta/recipes-devtools/patchelf/patchelf_git.bb
index a69f3b9d75..9553b21155 100644
--- a/meta/recipes-devtools/patchelf/patchelf_git.bb
+++ b/meta/recipes-devtools/patchelf/patchelf_git.bb
@@ -5,9 +5,9 @@ HOMEPAGE = "https://github.com/NixOS/patchelf"
 LICENSE = "GPL-3.0-only"
 
 SRC_URI = "git://github.com/NixOS/patchelf;protocol=https;branch=master;tag=${PV}"
-SRCREV = "382d8bc12db9e720515da49d9c272ef4a622c3c0"
+SRCREV = "2b4b49d36b62690860414dd127f567be4f1f3208"
 
-PV = "0.19.2"
+PV = "0.19.3"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=c678957b0c8e964aa6c70fd77641a71e"
 
-- 
2.47.1


--===============8187233536066106778==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/patchelf: PKGV changed from 0.19.2 [default] to 0.19.3 [default]
packages/x86-64-v3-poky-linux/patchelf: SRC_URI changed from "git://github.com/NixOS/patchelf;protocol=https;branch=master;tag=0.19.2" to "git://github.com/NixOS/patchelf;protocol=https;branch=master;tag=0.19.3"
packages/x86-64-v3-poky-linux/patchelf: PV changed from "0.19.2" to "0.19.3"
packages/x86-64-v3-poky-linux/patchelf/patchelf-dbg: PV changed from "0.19.2" to "0.19.3"
packages/x86-64-v3-poky-linux/patchelf/patchelf-dbg: PKGSIZE changed from 4033832 to 4059208 (+1%)
packages/x86-64-v3-poky-linux/patchelf/patchelf-dbg: PKGV changed from 0.19.2 [default] to 0.19.3 [default]
packages/x86-64-v3-poky-linux/patchelf/patchelf-dev: PV changed from "0.19.2" to "0.19.3"
packages/x86-64-v3-poky-linux/patchelf/patchelf-dev: PKGV changed from 0.19.2 [default] to 0.19.3 [default]
packages/x86-64-v3-poky-linux/patchelf/patchelf-doc: PV changed from "0.19.2" to "0.19.3"
packages/x86-64-v3-poky-linux/patchelf/patchelf-doc: PKGV changed from 0.19.2 [default] to 0.19.3 [default]
packages/x86-64-v3-poky-linux/patchelf/patchelf-locale: PV changed from "0.19.2" to "0.19.3"
packages/x86-64-v3-poky-linux/patchelf/patchelf-locale: PKGV changed from 0.19.2 [default] to 0.19.3 [default]
packages/x86-64-v3-poky-linux/patchelf/patchelf-src: PV changed from "0.19.2" to "0.19.3"
packages/x86-64-v3-poky-linux/patchelf/patchelf-src: PKGSIZE changed from 321838 to 324207 (+1%)
packages/x86-64-v3-poky-linux/patchelf/patchelf-src: FILELIST: directory renamed /usr/src/debug/patchelf/0.19.2/src -> /usr/src/debug/patchelf/0.19.3/src
packages/x86-64-v3-poky-linux/patchelf/patchelf-src: PKGV changed from 0.19.2 [default] to 0.19.3 [default]
packages/x86-64-v3-poky-linux/patchelf/patchelf-staticdev: PV changed from "0.19.2" to "0.19.3"
packages/x86-64-v3-poky-linux/patchelf/patchelf-staticdev: PKGV changed from 0.19.2 [default] to 0.19.3 [default]
packages/x86-64-v3-poky-linux/patchelf/patchelf-zsh-completion: PV changed from "0.19.2" to "0.19.3"
packages/x86-64-v3-poky-linux/patchelf/patchelf-zsh-completion: PKGSIZE changed from 3709 to 4310 (+16%)
packages/x86-64-v3-poky-linux/patchelf/patchelf-zsh-completion: PKGV changed from 0.19.2 [default] to 0.19.3 [default]
packages/x86-64-v3-poky-linux/patchelf/patchelf: PV changed from "0.19.2" to "0.19.3"
packages/x86-64-v3-poky-linux/patchelf/patchelf: PKGSIZE changed from 309480 to 313576 (+1%)
packages/x86-64-v3-poky-linux/patchelf/patchelf: PKGV changed from 0.19.2 [default] to 0.19.3 [default]

--===============8187233536066106778==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-patchelf-upgrade-0.19.2-0.19.3.patch"

RnJvbSA5NzM2MzhmNGI3ZmJmZjM2OGVmYjE5OTg4ZGIxMzg2MzAwMmNiN2FmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMzEgT2N0IDIwMjYgMDU6MTU6MDMgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
YXRjaGVsZjogdXBncmFkZSAwLjE5LjIgLT4gMC4xOS4zCgojIyAwLjE5LjMgKE9jdG9iZXIgMzAs
IDIwMjYpCgpBIGJ1ZyBmaXggcmVsZWFzZSBmb3IgZXhlY3V0YWJsZSByZXdyaXRlcywgc3ltYm9s
IHZlcnNpb24gZGVmaW5pdGlvbnMsIGFuZCB6c2gKY29tcGxldGlvbi4KCiMjIyBCdWcgZml4ZXMK
LS0tCiBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcGF0Y2hlbGYvcGF0Y2hlbGZfZ2l0LmJiIHwgNCAr
Ky0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlm
ZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9wYXRjaGVsZi9wYXRjaGVsZl9naXQuYmIg
Yi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcGF0Y2hlbGYvcGF0Y2hlbGZfZ2l0LmJiCmluZGV4IGE2
OWYzYjlkNzUuLjk1NTNiMjExNTUgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9w
YXRjaGVsZi9wYXRjaGVsZl9naXQuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3BhdGNo
ZWxmL3BhdGNoZWxmX2dpdC5iYgpAQCAtNSw5ICs1LDkgQEAgSE9NRVBBR0UgPSAiaHR0cHM6Ly9n
aXRodWIuY29tL05peE9TL3BhdGNoZWxmIgogTElDRU5TRSA9ICJHUEwtMy4wLW9ubHkiCiAKIFNS
Q19VUkkgPSAiZ2l0Oi8vZ2l0aHViLmNvbS9OaXhPUy9wYXRjaGVsZjtwcm90b2NvbD1odHRwczti
cmFuY2g9bWFzdGVyO3RhZz0ke1BWfSIKLVNSQ1JFViA9ICIzODJkOGJjMTJkYjllNzIwNTE1ZGE0
OWQ5YzI3MmVmNGE2MjJjM2MwIgorU1JDUkVWID0gIjJiNGI0OWQzNmI2MjY5MDg2MDQxNGRkMTI3
ZjU2N2JlNGYxZjMyMDgiCiAKLVBWID0gIjAuMTkuMiIKK1BWID0gIjAuMTkuMyIKIAogTElDX0ZJ
TEVTX0NIS1NVTSA9ICJmaWxlOi8vQ09QWUlORzttZDU9YzY3ODk1N2IwYzhlOTY0YWE2YzcwZmQ3
NzY0MWE3MWUiCiAKLS0gCjIuNDcuMQoK

--===============8187233536066106778==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/patchelf/patchelf-zsh-completion: PKGSIZE changed from 3709 to 4310 (+16%)

--===============8187233536066106778==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="patchelf-changelog.txt"

## 0.19.3 (October 30, 2026)

A bug fix release for executable rewrites, symbol version definitions, and zsh
completion.

### Bug fixes

--===============8187233536066106778==--
