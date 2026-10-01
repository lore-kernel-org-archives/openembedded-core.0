Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61E10CA5FCF
	for <webhook@archiver.kernel.org>; Thu,  1 Oct 2026 06:31:52 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5428.1790836306432622688
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Sep 2026 23:31:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=FJvDeRet;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=bTxmFezF;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 010101a0f6296e0c-2a7964c5-d818-4d35-a2f6-9bcbb31be1db-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1790836305;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=KcZR4/6Aseowq0wLcz+lqNRkJ5ppaYV6m1ViJ+iHFDw=;
	b=FJvDeRetD3iMj9iEC7pYWI6ZorXol8adbmTyhOFUtRgBOZSo12cwYl/eaplC8MEE
	Sudkv6dUkdiJu2OCXmn9Ve8BoEr4Qv6DbR5oV+aCnXXTm3NQFn1EQKudiWau0ZXJZgD
	Bh5s6zJy1byKSj1FgmBGEQAvb05vZe1xQVqHr0sw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1790836305;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=KcZR4/6Aseowq0wLcz+lqNRkJ5ppaYV6m1ViJ+iHFDw=;
	b=bTxmFezFsEmWdQPtVBfFKB5/DsboW4dFtLHtePMjHVrmDBAN0f6La9Mr+pZ7oKwE
	4ssWvHZny9g8Y+P173mshaq4lJNTvEzYqxQHm6G/BLq1ccXItnRaMrki1EybOujzKaI
	pFr2s3kD4DrY2ArdXZjUE2oLfyxw4e03goJgKZMU=
Content-Type: multipart/mixed; boundary="===============7112130057257519101=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] libmd: upgrading to 1.3.0 SUCCEEDED
Message-ID: <010101a0f6296e0c-2a7964c5-d818-4d35-a2f6-9bcbb31be1db-000000@us-west-2.amazonses.com>
Date: Thu, 1 Oct 2026 06:31:45 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.10.01-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Oct 2026 06:31:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247011

--===============7112130057257519101==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libmd* to *1.3.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libmd-upgrade-1.2.0-1.3.0.patch
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
From cdd092874115d70994f7831ce3db0c5ee980a4a1 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 1 Oct 2026 06:29:41 +0000
Subject: [PATCH] libmd: upgrade 1.2.0 -> 1.3.0

Release libmd 1.3.0
man: Add a list of supported algorithms to libmd(7)
man: Indent libmd(7) lists
build: Place the CI artifacts YAML directive in the jobs description
build: Keep the CI test suite logs on failures
Fix SHA512_224Final()
Add SHA512/224 support
---
 meta/recipes-support/libmd/{libmd_1.2.0.bb => libmd_1.3.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/libmd/{libmd_1.2.0.bb => libmd_1.3.0.bb} (91%)

diff --git a/meta/recipes-support/libmd/libmd_1.2.0.bb b/meta/recipes-support/libmd/libmd_1.3.0.bb
similarity index 91%
rename from meta/recipes-support/libmd/libmd_1.2.0.bb
rename to meta/recipes-support/libmd/libmd_1.3.0.bb
index b630708961..bed90807f2 100644
--- a/meta/recipes-support/libmd/libmd_1.2.0.bb
+++ b/meta/recipes-support/libmd/libmd_1.3.0.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=261bf22602270e2b29c53930d409a3ca"
 SRC_URI = "https://archive.hadrons.org/software/libmd/libmd-${PV}.tar.xz \
 	   file://run-ptest \
 "
-SRC_URI[sha256sum] = "ac15ffb8430502fbaccdec66c5a82ee0eab0b0f36220df56710feadfeb13d0a0"
+SRC_URI[sha256sum] = "fc0f1eb6b6766470326f2c014693809190e67dba84274a6fbae9d4912d066706"
 
 inherit autotools ptest
 
-- 
2.47.1


--===============7112130057257519101==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="libmd-changelog.txt"

Release libmd 1.3.0
man: Add a list of supported algorithms to libmd(7)
man: Indent libmd(7) lists
build: Place the CI artifacts YAML directive in the jobs description
build: Keep the CI test suite logs on failures
Fix SHA512_224Final()
Add SHA512/224 support

--===============7112130057257519101==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/libmd/libmd: FILELIST: removed "/usr/lib/libmd.so.0.2.0", added "/usr/lib/libmd.so.0.3.0"
Changes to packages/x86-64-v3-poky-linux/libmd (sysroot):
  /usr/lib/libmd.so.0 changed symlink target from libmd.so.0.2.0 to libmd.so.0.3.0
  /usr/lib/libmd.so changed symlink target from libmd.so.0.2.0 to libmd.so.0.3.0
  /usr/lib/libmd.so.0.2.0 moved to /usr/lib/libmd.so.0.3.0
Changes to packages/x86_64-linux/libmd-native (sysroot):
  /usr/lib/libmd.so.0 changed symlink target from libmd.so.0.2.0 to libmd.so.0.3.0
  /usr/lib/libmd.so changed symlink target from libmd.so.0.2.0 to libmd.so.0.3.0
  /usr/lib/libmd.so.0.2.0 moved to /usr/lib/libmd.so.0.3.0

--===============7112130057257519101==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libmd-upgrade-1.2.0-1.3.0.patch"

RnJvbSBjZGQwOTI4NzQxMTVkNzA5OTRmNzgzMWNlM2RiMGM1ZWU5ODBhNGExIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBPY3QgMjAyNiAwNjoyOTo0MSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGxp
Ym1kOiB1cGdyYWRlIDEuMi4wIC0+IDEuMy4wCgpSZWxlYXNlIGxpYm1kIDEuMy4wCm1hbjogQWRk
IGEgbGlzdCBvZiBzdXBwb3J0ZWQgYWxnb3JpdGhtcyB0byBsaWJtZCg3KQptYW46IEluZGVudCBs
aWJtZCg3KSBsaXN0cwpidWlsZDogUGxhY2UgdGhlIENJIGFydGlmYWN0cyBZQU1MIGRpcmVjdGl2
ZSBpbiB0aGUgam9icyBkZXNjcmlwdGlvbgpidWlsZDogS2VlcCB0aGUgQ0kgdGVzdCBzdWl0ZSBs
b2dzIG9uIGZhaWx1cmVzCkZpeCBTSEE1MTJfMjI0RmluYWwoKQpBZGQgU0hBNTEyLzIyNCBzdXBw
b3J0Ci0tLQogbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGlibWQve2xpYm1kXzEuMi4wLmJiID0+IGxp
Ym1kXzEuMy4wLmJifSB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBk
ZWxldGlvbigtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYm1kL3tsaWJtZF8xLjIu
MC5iYiA9PiBsaWJtZF8xLjMuMC5iYn0gKDkxJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMt
c3VwcG9ydC9saWJtZC9saWJtZF8xLjIuMC5iYiBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYm1k
L2xpYm1kXzEuMy4wLmJiCnNpbWlsYXJpdHkgaW5kZXggOTElCnJlbmFtZSBmcm9tIG1ldGEvcmVj
aXBlcy1zdXBwb3J0L2xpYm1kL2xpYm1kXzEuMi4wLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMt
c3VwcG9ydC9saWJtZC9saWJtZF8xLjMuMC5iYgppbmRleCBiNjMwNzA4OTYxLi5iZWQ5MDgwN2Yy
IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJtZC9saWJtZF8xLjIuMC5iYgor
KysgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJtZC9saWJtZF8xLjMuMC5iYgpAQCAtMTEsNyAr
MTEsNyBAQCBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9DT1BZSU5HO21kNT0yNjFiZjIyNjAy
MjcwZTJiMjljNTM5MzBkNDA5YTNjYSIKIFNSQ19VUkkgPSAiaHR0cHM6Ly9hcmNoaXZlLmhhZHJv
bnMub3JnL3NvZnR3YXJlL2xpYm1kL2xpYm1kLSR7UFZ9LnRhci54eiBcCiAJICAgZmlsZTovL3J1
bi1wdGVzdCBcCiAiCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiYWMxNWZmYjg0MzA1MDJmYmFjY2Rl
YzY2YzVhODJlZTBlYWIwYjBmMzYyMjBkZjU2NzEwZmVhZGZlYjEzZDBhMCIKK1NSQ19VUklbc2hh
MjU2c3VtXSA9ICJmYzBmMWViNmI2NzY2NDcwMzI2ZjJjMDE0NjkzODA5MTkwZTY3ZGJhODQyNzRh
NmZiYWU5ZDQ5MTJkMDY2NzA2IgogCiBpbmhlcml0IGF1dG90b29scyBwdGVzdAogCi0tIAoyLjQ3
LjEKCg==

--===============7112130057257519101==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/libmd: PKGV changed from 1.2.0 [default] to 1.3.0 [default]
packages/x86-64-v3-poky-linux/libmd: PV changed from "1.2.0" to "1.3.0"
packages/x86-64-v3-poky-linux/libmd: SRC_URI changed from "https://archive.hadrons.org/software/libmd/libmd-1.2.0.tar.xz file://run-ptest" to "https://archive.hadrons.org/software/libmd/libmd-1.3.0.tar.xz file://run-ptest"
packages/x86-64-v3-poky-linux/libmd/libmd-dbg: PKGV changed from 1.2.0 [default] to 1.3.0 [default]
packages/x86-64-v3-poky-linux/libmd/libmd-dbg: PV changed from "1.2.0" to "1.3.0"
packages/x86-64-v3-poky-linux/libmd/libmd-dbg: FILELIST: removed "/usr/lib/.debug/libmd.so.0.2.0", added "/usr/lib/.debug/libmd.so.0.3.0"
packages/x86-64-v3-poky-linux/libmd/libmd-dbg: PKGSIZE changed from 294992 to 303584 (+3%)
packages/x86-64-v3-poky-linux/libmd/libmd-dev: PKGV changed from 1.2.0 [default] to 1.3.0 [default]
packages/x86-64-v3-poky-linux/libmd/libmd-dev: PV changed from "1.2.0" to "1.3.0"
packages/x86-64-v3-poky-linux/libmd/libmd-dev: PKGSIZE changed from 24824 to 25457 (+3%)
packages/x86-64-v3-poky-linux/libmd/libmd-doc: PKGV changed from 1.2.0 [default] to 1.3.0 [default]
packages/x86-64-v3-poky-linux/libmd/libmd-doc: PV changed from "1.2.0" to "1.3.0"
packages/x86-64-v3-poky-linux/libmd/libmd-doc: PKGSIZE changed from 52458 to 53747 (+2%)
packages/x86-64-v3-poky-linux/libmd/libmd-locale: PKGV changed from 1.2.0 [default] to 1.3.0 [default]
packages/x86-64-v3-poky-linux/libmd/libmd-locale: PV changed from "1.2.0" to "1.3.0"
packages/x86-64-v3-poky-linux/libmd/libmd-ptest: PKGV changed from 1.2.0 [default] to 1.3.0 [default]
packages/x86-64-v3-poky-linux/libmd/libmd-ptest: PV changed from "1.2.0" to "1.3.0"
packages/x86-64-v3-poky-linux/libmd/libmd-src: PKGV changed from 1.2.0 [default] to 1.3.0 [default]
packages/x86-64-v3-poky-linux/libmd/libmd-src: PV changed from "1.2.0" to "1.3.0"
packages/x86-64-v3-poky-linux/libmd/libmd-src: FILELIST: directory renamed /usr/src/debug/libmd/1.2.0/test -> /usr/src/debug/libmd/1.3.0/test, directory renamed /usr/src/debug/libmd/1.2.0/include -> /usr/src/debug/libmd/1.3.0/include, removed "/usr/src/debug/libmd/1.2.0/src/local-endian.h /usr/src/debug/libmd/1.2.0/src/sha224hl.c /usr/src/debug/libmd/1.2.0/src/sha384hl.c /usr/src/debug/libmd/1.2.0/src/sha512hl.c /usr/src/debug/libmd/1.2.0/src/sha256hl.c /usr/src/debug/libmd/1.2.0/src/md4.c /usr/src/debug/libmd/1.2.0/src/sha2.c /usr/src/debug/libmd/1.2.0/src/md4hl.c /usr/src/debug/libmd/1.2.0/src/sha512_256hl.c /usr/src/debug/libmd/1.2.0/src/rmd160hl.c /usr/src/debug/libmd/1.2.0/src/md5.c /usr/src/debug/libmd/1.2.0/src/sha1hl.c /usr/src/debug/libmd/1.2.0/src/keccak.h /usr/src/debug/libmd/1.2.0/src/md2hl.c /usr/src/debug/libmd/1.2.0/src/md5hl.c /usr/src/debug/libmd/1.2.0/src/keccak.c /usr/src/debug/libmd/1.2.0/src/rmd160.c /usr/src/debug/libmd/1.2.0/src/md2.c /usr/src/debug/libmd/1.2.0
 /src/sha1.c /usr/src/debug/libmd/1.2.0/src/sha3.c", added "/usr/src/debug/libmd/1.3.0/src/local-endian.h /usr/src/debug/libmd/1.3.0/src/sha224hl.c /usr/src/debug/libmd/1.3.0/src/sha384hl.c /usr/src/debug/libmd/1.3.0/src/sha512hl.c /usr/src/debug/libmd/1.3.0/src/sha256hl.c /usr/src/debug/libmd/1.3.0/src/md4.c /usr/src/debug/libmd/1.3.0/src/sha2.c /usr/src/debug/libmd/1.3.0/src/md4hl.c /usr/src/debug/libmd/1.3.0/src/sha512_256hl.c /usr/src/debug/libmd/1.3.0/src/rmd160hl.c /usr/src/debug/libmd/1.3.0/src/sha512_224hl.c /usr/src/debug/libmd/1.3.0/src/md5.c /usr/src/debug/libmd/1.3.0/src/sha1hl.c /usr/src/debug/libmd/1.3.0/src/keccak.h /usr/src/debug/libmd/1.3.0/src/md2hl.c /usr/src/debug/libmd/1.3.0/src/md5hl.c /usr/src/debug/libmd/1.3.0/src/keccak.c /usr/src/debug/libmd/1.3.0/src/rmd160.c /usr/src/debug/libmd/1.3.0/src/md2.c /usr/src/debug/libmd/1.3.0/src/sha1.c /usr/src/debug/libmd/1.3.0/src/sha3.c"
packages/x86-64-v3-poky-linux/libmd/libmd-src: PKGSIZE changed from 147543 to 152443 (+3%)
packages/x86-64-v3-poky-linux/libmd/libmd-staticdev: PKGV changed from 1.2.0 [default] to 1.3.0 [default]
packages/x86-64-v3-poky-linux/libmd/libmd-staticdev: PV changed from "1.2.0" to "1.3.0"
packages/x86-64-v3-poky-linux/libmd/libmd: PKGV changed from 1.2.0 [default] to 1.3.0 [default]
packages/x86-64-v3-poky-linux/libmd/libmd: PV changed from "1.2.0" to "1.3.0"
packages/x86-64-v3-poky-linux/libmd/libmd: FILELIST: removed "/usr/lib/libmd.so.0.2.0", added "/usr/lib/libmd.so.0.3.0"
Changes to packages/x86-64-v3-poky-linux/libmd (sysroot):
  /usr/lib/libmd.so.0 changed symlink target from libmd.so.0.2.0 to libmd.so.0.3.0
  /usr/lib/libmd.so changed symlink target from libmd.so.0.2.0 to libmd.so.0.3.0
  /usr/lib/libmd.so.0.2.0 moved to /usr/lib/libmd.so.0.3.0
Changes to packages/x86_64-linux/libmd-native (sysroot):
  /usr/lib/libmd.so.0 changed symlink target from libmd.so.0.2.0 to libmd.so.0.3.0
  /usr/lib/libmd.so changed symlink target from libmd.so.0.2.0 to libmd.so.0.3.0
  /usr/lib/libmd.so.0.2.0 moved to /usr/lib/libmd.so.0.3.0

--===============7112130057257519101==--

