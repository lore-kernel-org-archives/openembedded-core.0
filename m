Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF1E8CA5FA1
	for <webhook@archiver.kernel.org>; Tue, 29 Sep 2026 06:18:40 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1847.1790662718319919061
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Sep 2026 23:18:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=FWUVUxH3;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=jXChoFsA;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 010101a0ebd0af1c-d1da2134-7d02-458f-b0e0-14f65b8f6946-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1790662717;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=uGQhxZrh3gw+ve5IVa3KbAIahufPqYp94H1aCkZ+riE=;
	b=FWUVUxH3hH+MpUlHxyaY5N5K6iQaV8EC7r4gAdtMIMY/9xvJDZ+pvmJ1jYMxLoNV
	2LHq96R9LS+Vhnf2vkx6foKAQHvKl9C2cYWSh3fLnxJ6O/9bPhu0Zc9WFQ72gJpDGTy
	hTIpXw3BqrNvSgAKN1mkBtZnxumXC75yFX7Ew6IE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1790662717;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=uGQhxZrh3gw+ve5IVa3KbAIahufPqYp94H1aCkZ+riE=;
	b=jXChoFsAx4Pwt60obm9O+9rpmu3V+WLhdGe62pg0kkGy0DLc+baqZdv5vxS8Lvum
	aU6np55LuPdu7sKWJwOxOS0h5z9RaYfZm9HrHCd2OryhjNPKPmilNCHUrcn4lsOKI8z
	VSmvkBs4oGuYoTSrnpYRK/2NETO7odrp5ahWOpiQ=
Content-Type: multipart/mixed; boundary="===============7251217299511087262=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Sumanth Gavini <sumanth.gavini@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] git: upgrading to 2.56.0 SUCCEEDED
Message-ID: <010101a0ebd0af1c-d1da2134-7d02-458f-b0e0-14f65b8f6946-000000@us-west-2.amazonses.com>
Date: Tue, 29 Sep 2026 06:18:37 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.09.29-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 29 Sep 2026 06:18:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246823

--===============7251217299511087262==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *git* to *2.56.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-git-upgrade-2.55.0-2.56.0.patch
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
From 0441d06bd25ed00d50757c07986085ea0f8d1c41 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 29 Sep 2026 05:14:03 +0000
Subject: [PATCH] git: upgrade 2.55.0 -> 2.56.0

Git v2.55 Release Notes
=======================

UI, Workflows & Features
------------------------

Performance, Internal Implementation, Development Support etc.
--------------------------------------------------------------

Fixes since v2.54
-----------------

Git v2.56 Release Notes
=======================

UI, Workflows & Features
------------------------

Performance, Internal Implementation, Development Support etc.
--------------------------------------------------------------

Fixes since v2.55
-----------------
---
 meta/recipes-devtools/git/git/fixsort.patch                | 4 ++--
 meta/recipes-devtools/git/{git_2.55.0.bb => git_2.56.0.bb} | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-devtools/git/{git_2.55.0.bb => git_2.56.0.bb} (98%)

diff --git a/meta/recipes-devtools/git/git/fixsort.patch b/meta/recipes-devtools/git/git/fixsort.patch
index 86b41fd819..6dda82dbde 100644
--- a/meta/recipes-devtools/git/git/fixsort.patch
+++ b/meta/recipes-devtools/git/git/fixsort.patch
@@ -1,4 +1,4 @@
-From e3bdf5adc50b12d8625e70415c81402e0e938b68 Mon Sep 17 00:00:00 2001
+From dbc552db68ca945a24d3cd15f39c6f9982cc317c Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Wed, 17 Feb 2021 17:57:13 +0000
 Subject: [PATCH] generate-configlist.sh: Fix determinism issue
@@ -23,7 +23,7 @@ Upstream-Status: Submitted [https://public-inbox.org/git/f029a942dd3d50d85e60bd3
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/tools/generate-configlist.sh b/tools/generate-configlist.sh
-index e28054f..96ddd51 100755
+index d1d2ba4..c259b77 100755
 --- a/tools/generate-configlist.sh
 +++ b/tools/generate-configlist.sh
 @@ -24,7 +24,7 @@ EOF
diff --git a/meta/recipes-devtools/git/git_2.55.0.bb b/meta/recipes-devtools/git/git_2.56.0.bb
similarity index 98%
rename from meta/recipes-devtools/git/git_2.55.0.bb
rename to meta/recipes-devtools/git/git_2.56.0.bb
index 4535f94925..6fc2d5d78e 100644
--- a/meta/recipes-devtools/git/git_2.55.0.bb
+++ b/meta/recipes-devtools/git/git_2.56.0.bb
@@ -175,7 +175,7 @@ EXTRA_OECONF += "ac_cv_snprintf_returns_bogus=no \
                  "
 EXTRA_OEMAKE += "NO_GETTEXT=1"
 
-SRC_URI[tarball.sha256sum] = "0842dc384a23ac33ba3e570c4f3a8ded85963ee4713b1cd21153c3db41813d1e"
+SRC_URI[tarball.sha256sum] = "826817fd3671b8565586d6d49f688298de8354ab11db829c02720e5c74b9b39f"
 
 CVE_STATUS[CVE-2024-32002] = "fixed-version: fixed since v2.46.0"
 CVE_STATUS[CVE-2024-50349] = "fixed-version: fixed since v2.49.0"
-- 
2.47.1


--===============7251217299511087262==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-git-upgrade-2.55.0-2.56.0.patch"

RnJvbSAwNDQxZDA2YmQyNWVkMDBkNTA3NTdjMDc5ODYwODVlYTBmOGQxYzQxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMjkgU2VwIDIwMjYgMDU6MTQ6MDMgKzAwMDAKU3ViamVjdDogW1BBVENIXSBn
aXQ6IHVwZ3JhZGUgMi41NS4wIC0+IDIuNTYuMAoKR2l0IHYyLjU1IFJlbGVhc2UgTm90ZXMKPT09
PT09PT09PT09PT09PT09PT09PT0KClVJLCBXb3JrZmxvd3MgJiBGZWF0dXJlcwotLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0KClBlcmZvcm1hbmNlLCBJbnRlcm5hbCBJbXBsZW1lbnRhdGlvbiwgRGV2
ZWxvcG1lbnQgU3VwcG9ydCBldGMuCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCgpGaXhlcyBzaW5jZSB2Mi41NAotLS0tLS0tLS0t
LS0tLS0tLQoKR2l0IHYyLjU2IFJlbGVhc2UgTm90ZXMKPT09PT09PT09PT09PT09PT09PT09PT0K
ClVJLCBXb3JrZmxvd3MgJiBGZWF0dXJlcwotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KClBlcmZv
cm1hbmNlLCBJbnRlcm5hbCBJbXBsZW1lbnRhdGlvbiwgRGV2ZWxvcG1lbnQgU3VwcG9ydCBldGMu
Ci0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tCgpGaXhlcyBzaW5jZSB2Mi41NQotLS0tLS0tLS0tLS0tLS0tLQotLS0KIG1ldGEvcmVj
aXBlcy1kZXZ0b29scy9naXQvZ2l0L2ZpeHNvcnQucGF0Y2ggICAgICAgICAgICAgICAgfCA0ICsr
LS0KIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9naXQve2dpdF8yLjU1LjAuYmIgPT4gZ2l0XzIuNTYu
MC5iYn0gfCAyICstCiAyIGZpbGVzIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlv
bnMoLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ2l0L3tnaXRfMi41NS4wLmJiID0+
IGdpdF8yLjU2LjAuYmJ9ICg5OCUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L2dpdC9naXQvZml4c29ydC5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9naXQvZ2l0L2Zp
eHNvcnQucGF0Y2gKaW5kZXggODZiNDFmZDgxOS4uNmRkYTgyZGJkZSAxMDA2NDQKLS0tIGEvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL2dpdC9naXQvZml4c29ydC5wYXRjaAorKysgYi9tZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvZ2l0L2dpdC9maXhzb3J0LnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSBl
M2JkZjVhZGM1MGIxMmQ4NjI1ZTcwNDE1YzgxNDAyZTBlOTM4YjY4IE1vbiBTZXAgMTcgMDA6MDA6
MDAgMjAwMQorRnJvbSBkYmM1NTJkYjY4Y2E5NDVhMjRkM2NkMTVmMzljNmY5OTgyY2MzMTdjIE1v
biBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogUmljaGFyZCBQdXJkaWUgPHJpY2hhcmQucHVy
ZGllQGxpbnV4Zm91bmRhdGlvbi5vcmc+CiBEYXRlOiBXZWQsIDE3IEZlYiAyMDIxIDE3OjU3OjEz
ICswMDAwCiBTdWJqZWN0OiBbUEFUQ0hdIGdlbmVyYXRlLWNvbmZpZ2xpc3Quc2g6IEZpeCBkZXRl
cm1pbmlzbSBpc3N1ZQpAQCAtMjMsNyArMjMsNyBAQCBVcHN0cmVhbS1TdGF0dXM6IFN1Ym1pdHRl
ZCBbaHR0cHM6Ly9wdWJsaWMtaW5ib3gub3JnL2dpdC9mMDI5YTk0MmRkM2Q1MGQ4NWU2MGJkMwog
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogCiBkaWZmIC0t
Z2l0IGEvdG9vbHMvZ2VuZXJhdGUtY29uZmlnbGlzdC5zaCBiL3Rvb2xzL2dlbmVyYXRlLWNvbmZp
Z2xpc3Quc2gKLWluZGV4IGUyODA1NGYuLjk2ZGRkNTEgMTAwNzU1CitpbmRleCBkMWQyYmE0Li5j
MjU5Yjc3IDEwMDc1NQogLS0tIGEvdG9vbHMvZ2VuZXJhdGUtY29uZmlnbGlzdC5zaAogKysrIGIv
dG9vbHMvZ2VuZXJhdGUtY29uZmlnbGlzdC5zaAogQEAgLTI0LDcgKzI0LDcgQEAgRU9GCmRpZmYg
LS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ2l0L2dpdF8yLjU1LjAuYmIgYi9tZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvZ2l0L2dpdF8yLjU2LjAuYmIKc2ltaWxhcml0eSBpbmRleCA5OCUKcmVu
YW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL2dpdC9naXRfMi41NS4wLmJiCnJlbmFtZSB0
byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ2l0L2dpdF8yLjU2LjAuYmIKaW5kZXggNDUzNWY5NDky
NS4uNmZjMmQ1ZDc4ZSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2dpdC9naXRf
Mi41NS4wLmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9naXQvZ2l0XzIuNTYuMC5iYgpA
QCAtMTc1LDcgKzE3NSw3IEBAIEVYVFJBX09FQ09ORiArPSAiYWNfY3Zfc25wcmludGZfcmV0dXJu
c19ib2d1cz1ubyBcCiAgICAgICAgICAgICAgICAgICIKIEVYVFJBX09FTUFLRSArPSAiTk9fR0VU
VEVYVD0xIgogCi1TUkNfVVJJW3RhcmJhbGwuc2hhMjU2c3VtXSA9ICIwODQyZGMzODRhMjNhYzMz
YmEzZTU3MGM0ZjNhOGRlZDg1OTYzZWU0NzEzYjFjZDIxMTUzYzNkYjQxODEzZDFlIgorU1JDX1VS
SVt0YXJiYWxsLnNoYTI1NnN1bV0gPSAiODI2ODE3ZmQzNjcxYjg1NjU1ODZkNmQ0OWY2ODgyOThk
ZTgzNTRhYjExZGI4MjljMDI3MjBlNWM3NGI5YjM5ZiIKIAogQ1ZFX1NUQVRVU1tDVkUtMjAyNC0z
MjAwMl0gPSAiZml4ZWQtdmVyc2lvbjogZml4ZWQgc2luY2UgdjIuNDYuMCIKIENWRV9TVEFUVVNb
Q1ZFLTIwMjQtNTAzNDldID0gImZpeGVkLXZlcnNpb246IGZpeGVkIHNpbmNlIHYyLjQ5LjAiCi0t
IAoyLjQ3LjEKCg==

--===============7251217299511087262==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/git/git-bash-completion: PKGSIZE changed from 94846 to 96261 (+1%)
packages/x86-64-v3-poky-linux/git/git-bash-completion: PKGV changed from 2.55.0 [default] to 2.56.0 [default]
packages/x86-64-v3-poky-linux/git/git-bash-completion: PV changed from "2.55.0" to "2.56.0"
packages/x86-64-v3-poky-linux/git/git-dbg: PKGSIZE changed from 107584976 to 114344384 (+6%)
packages/x86-64-v3-poky-linux/git/git-dbg: PKGV changed from 2.55.0 [default] to 2.56.0 [default]
packages/x86-64-v3-poky-linux/git/git-dbg: PV changed from "2.55.0" to "2.56.0"
packages/x86-64-v3-poky-linux/git/git-dev: PKGV changed from 2.55.0 [default] to 2.56.0 [default]
packages/x86-64-v3-poky-linux/git/git-dev: PV changed from "2.55.0" to "2.56.0"
packages/x86-64-v3-poky-linux/git/git-doc: PKGV changed from 2.55.0 [default] to 2.56.0 [default]
packages/x86-64-v3-poky-linux/git/git-doc: PV changed from "2.55.0" to "2.56.0"
packages/x86-64-v3-poky-linux/git/git-locale: PKGV changed from 2.55.0 [default] to 2.56.0 [default]
packages/x86-64-v3-poky-linux/git/git-locale: PV changed from "2.55.0" to "2.56.0"
packages/x86-64-v3-poky-linux/git/git-perltools: PKGSIZE changed from 280274 to 280280 (+0%)
packages/x86-64-v3-poky-linux/git/git-perltools: PKGV changed from 2.55.0 [default] to 2.56.0 [default]
packages/x86-64-v3-poky-linux/git/git-perltools: PV changed from "2.55.0" to "2.56.0"
packages/x86-64-v3-poky-linux/git/git-src: PKGSIZE changed from 10668467 to 10863211 (+2%)
packages/x86-64-v3-poky-linux/git/git-src: FILELIST: directory renamed /usr/src/debug/git/2.55.0/builtin -> /usr/src/debug/git/2.56.0/builtin, directory renamed /usr/src/debug/git/2.55.0/compiler-tricks -> /usr/src/debug/git/2.56.0/compiler-tricks, directory renamed /usr/src/debug/git/2.55.0/compat -> /usr/src/debug/git/2.56.0/compat, directory renamed /usr/src/debug/git/2.55.0/compat/simple-ipc -> /usr/src/debug/git/2.56.0/compat/simple-ipc, directory renamed /usr/src/debug/git/2.55.0/negotiator -> /usr/src/debug/git/2.56.0/negotiator, directory renamed /usr/src/debug/git/2.55.0/ewah -> /usr/src/debug/git/2.56.0/ewah, directory renamed /usr/src/debug/git/2.55.0/reftable -> /usr/src/debug/git/2.56.0/reftable, directory renamed /usr/src/debug/git/2.55.0/refs -> /usr/src/debug/git/2.56.0/refs, directory renamed /usr/src/debug/git/2.55.0/sha1dc -> /usr/src/debug/git/2.56.0/sha1dc, directory renamed /usr/src/debug/git/2.55.0/compat/linux -> /usr/src/debug/git/2.56.0/compat/linux, directo
 ry renamed /usr/src/debug/git/2.55.0/compat/fsmonitor -> /usr/src/debug/git/2.56.0/compat/fsmonitor, directory renamed /usr/src/debug/git/2.55.0/xdiff -> /usr/src/debug/git/2.56.0/xdiff, directory renamed /usr/src/debug/git/2.55.0/trace2 -> /usr/src/debug/git/2.56.0/trace2, directory renamed /usr/src/debug/git/2.55.0/sha256/block -> /usr/src/debug/git/2.56.0/sha256/block, removed "/usr/src/debug/git/2.55.0/odb/transaction.h /usr/src/debug/git/2.55.0/odb/transaction.c /usr/src/debug/git/2.55.0/fetch-pack.h /usr/src/debug/git/2.55.0/fetch-pack.c /usr/src/debug/git/2.55.0/write-or-die.h /usr/src/debug/git/2.55.0/hex-ll.h /usr/src/debug/git/2.55.0/write-or-die.c /usr/src/debug/git/2.55.0/transport-helper.c /usr/src/debug/git/2.55.0/connected.c /usr/src/debug/git/2.55.0/connected.h /usr/src/debug/git/2.55.0/cache-tree.c /usr/src/debug/git/2.55.0/dir-iterator.h /usr/src/debug/git/2.55.0/http.h /usr/src/debug/git/2.55.0/pack-bitmap.c /usr/src/debug/git/2.55.0/unix-stream-server.h /usr/src/
 debug/git/2.55.0/cache-tree.h /usr/src/debug/git/2.55.0/dir-iterator.c /usr/src/debug/git/2.55.0/http.c /usr/src/debug/git/2.55.0/pack-bitmap.h /usr/src/debug/git/2.55.0/unix-stream-server.c /usr/src/debug/git/2.55.0/odb.c /usr/src/debug/git/2.55.0/odb.h /usr/src/debug/git/2.55.0/string-list.c /usr/src/debug/git/2.55.0/object-file.h /usr/src/debug/git/2.55.0/config-list.h /usr/src/debug/git/2.55.0/string-list.h /usr/src/debug/git/2.55.0/object-file.c /usr/src/debug/git/2.55.0/fsmonitor-path-utils.h /usr/src/debug/git/2.55.0/line-log.c /usr/src/debug/git/2.55.0/line-log.h /usr/src/debug/git/2.55.0/shortlog.h /usr/src/debug/git/2.55.0/commit-graph.h /usr/src/debug/git/2.55.0/commit-graph.c /usr/src/debug/git/2.55.0/parallel-checkout.h /usr/src/debug/git/2.55.0/sequencer.c /usr/src/debug/git/2.55.0/parallel-checkout.c /usr/src/debug/git/2.55.0/sequencer.h /usr/src/debug/git/2.55.0/midx.h /usr/src/debug/git/2.55.0/sane-ctype.h /usr/src/debug/git/2.55.0/midx.c /usr/src/debug/git/2.55.0/u
 nicode-width.h /usr/src/debug/git/2.55.0/shallow.c /usr/src/debug/git/2.55.0/dir.c /usr/src/debug/git/2.55.0/shallow.h /usr/src/debug/git/2.55.0/dir.h /usr/src/debug/git/2.55.0/pseudo-merge.c /usr/src/debug/git/2.55.0/odb/source.h /usr/src/debug/git/2.55.0/pseudo-merge.h /usr/src/debug/git/2.55.0/odb/source.c /usr/src/debug/git/2.55.0/blob.c /usr/src/debug/git/2.55.0/sha1dc_git.h /usr/src/debug/git/2.55.0/blob.h /usr/src/debug/git/2.55.0/sha1dc_git.c /usr/src/debug/git/2.55.0/color.h /usr/src/debug/git/2.55.0/blame.h /usr/src/debug/git/2.55.0/bloom.h /usr/src/debug/git/2.55.0/graph.h /usr/src/debug/git/2.55.0/ident.h /usr/src/debug/git/2.55.0/khash.h /usr/src/debug/git/2.55.0/kwset.h /usr/src/debug/git/2.55.0/loose.h /usr/src/debug/git/2.55.0/merge.h /usr/src/debug/git/2.55.0/notes.h /usr/src/debug/git/2.55.0/sideband.c /usr/src/debug/git/2.55.0/sideband.h /usr/src/debug/git/2.55.0/archive-zip.c /usr/src/debug/git/2.55.0/hash.h /usr/src/debug/git/2.55.0/hash.c /usr/src/debug/git/2.5
 5.0/archive.c /usr/src/debug/git/2.55.0/oidtree.c /usr/src/debug/git/2.55.0/pager.c /usr/src/debug/git/2.55.0/graph.c /usr/src/debug/git/2.55.0/trace.c /usr/src/debug/git/2.55.0/ident.c /usr/src/debug/git/2.55.0/color.c /usr/src/debug/git/2.55.0/ctype.c /usr/src/debug/git/2.55.0/quote.c /usr/src/debug/git/2.55.0/usage.c /usr/src/debug/git/2.55.0/alias.c /usr/src/debug/git/2.55.0/alloc.c /usr/src/debug/git/2.55.0/repack-midx.c /usr/src/debug/git/2.55.0/archive.h /usr/src/debug/git/2.55.0/oidtree.h /usr/src/debug/git/2.55.0/attr.c /usr/src/debug/git/2.55.0/ls-refs.h /usr/src/debug/git/2.55.0/pack-check.c /usr/src/debug/git/2.55.0/ls-refs.c /usr/src/debug/git/2.55.0/attr.h /usr/src/debug/git/2.55.0/log-tree.h /usr/src/debug/git/2.55.0/worktree.h /usr/src/debug/git/2.55.0/name-hash.c /usr/src/debug/git/2.55.0/levenshtein.h /usr/src/debug/git/2.55.0/chdir-notify.c /usr/src/debug/git/2.55.0/name-hash.h /usr/src/debug/git/2.55.0/log-tree.c /usr/src/debug/git/2.55.0/worktree.c /usr/src/debu
 g/git/2.55.0/chdir-notify.h /usr/src/debug/git/2.55.0/levenshtein.c /usr/src/debug/git/2.55.0/pack-bitmap-write.c /usr/src/debug/git/2.55.0/linear-assignment.h /usr/src/debug/git/2.55.0/fsmonitor.c /usr/src/debug/git/2.55.0/pathspec.h /usr/src/debug/git/2.55.0/linear-assignment.c /usr/src/debug/git/2.55.0/pathspec.c /usr/src/debug/git/2.55.0/fsmonitor.h /usr/src/debug/git/2.55.0/commit-reach.c /usr/src/debug/git/2.55.0/add-interactive.h /usr/src/debug/git/2.55.0/fmt-merge-msg.h /usr/src/debug/git/2.55.0/refspec.h /usr/src/debug/git/2.55.0/commit-reach.h /usr/src/debug/git/2.55.0/fmt-merge-msg.c /usr/src/debug/git/2.55.0/add-interactive.c /usr/src/debug/git/2.55.0/refspec.c /usr/src/debug/git/2.55.0/repack-promisor.c /usr/src/debug/git/2.55.0/tree.c /usr/src/debug/git/2.55.0/path-walk.h /usr/src/debug/git/2.55.0/tree-walk.h /usr/src/debug/git/2.55.0/trace.h /usr/src/debug/git/2.55.0/list-objects-filter.h /usr/src/debug/git/2.55.0/sh-i18n--envsubst.c /usr/src/debug/git/2.55.0/path-wal
 k.c /usr/src/debug/git/2.55.0/list.h /usr/src/debug/git/2.55.0/tree-walk.c /usr/src/debug/git/2.55.0/tree.h /usr/src/debug/git/2.55.0/list-objects-filter.c /usr/src/debug/git/2.55.0/delta-islands.h /usr/src/debug/git/2.55.0/utf8.h /usr/src/debug/git/2.55.0/symlinks.h /usr/src/debug/git/2.55.0/delta-islands.c /usr/src/debug/git/2.55.0/utf8.c /usr/src/debug/git/2.55.0/symlinks.c /usr/src/debug/git/2.55.0/sub-process.c /usr/src/debug/git/2.55.0/path.h /usr/src/debug/git/2.55.0/bundle-uri.c /usr/src/debug/git/2.55.0/path.c /usr/src/debug/git/2.55.0/userdiff.h /usr/src/debug/git/2.55.0/sub-process.h /usr/src/debug/git/2.55.0/bundle-uri.h /usr/src/debug/git/2.55.0/userdiff.c /usr/src/debug/git/2.55.0/blame.c /usr/src/debug/git/2.55.0/bloom.c /usr/src/debug/git/2.55.0/http-walker.c /usr/src/debug/git/2.55.0/trailer.h /usr/src/debug/git/2.55.0/wrapper.h /usr/src/debug/git/2.55.0/trailer.c /usr/src/debug/git/2.55.0/wrapper.c /usr/src/debug/git/2.55.0/hashmap.h /usr/src/debug/git/2.55.0/mailm
 ap.h /usr/src/debug/git/2.55.0/diff-delta.c /usr/src/debug/git/2.55.0/object-file-convert.c /usr/src/debug/git/2.55.0/object-file-convert.h /usr/src/debug/git/2.55.0/hashmap.c /usr/src/debug/git/2.55.0/mailmap.c /usr/src/debug/git/2.55.0/rebase-interactive.h /usr/src/debug/git/2.55.0/merge-blobs.h /usr/src/debug/git/2.55.0/alias.h /usr/src/debug/git/2.55.0/alloc.h /usr/src/debug/git/2.55.0/apply.h /usr/src/debug/git/2.55.0/serve.h /usr/src/debug/git/2.55.0/setup.h /usr/src/debug/git/2.55.0/parse.h /usr/src/debug/git/2.55.0/merge-blobs.c /usr/src/debug/git/2.55.0/rebase-interactive.c /usr/src/debug/git/2.55.0/entry.h /usr/src/debug/git/2.55.0/serve.c /usr/src/debug/git/2.55.0/setup.c /usr/src/debug/git/2.55.0/shell.c /usr/src/debug/git/2.55.0/parse.c /usr/src/debug/git/2.55.0/kwset.c /usr/src/debug/git/2.55.0/loose.c /usr/src/debug/git/2.55.0/merge.c /usr/src/debug/git/2.55.0/notes.c /usr/src/debug/git/2.55.0/match-trees.h /usr/src/debug/git/2.55.0/match-trees.c /usr/src/debug/git/2.
 55.0/version.c /usr/src/debug/git/2.55.0/builtin.h /usr/src/debug/git/2.55.0/version.h /usr/src/debug/git/2.55.0/oid-array.h /usr/src/debug/git/2.55.0/fsmonitor-settings.c /usr/src/debug/git/2.55.0/json-writer.h /usr/src/debug/git/2.55.0/fsmonitor-settings.h /usr/src/debug/git/2.55.0/oid-array.c /usr/src/debug/git/2.55.0/json-writer.c /usr/src/debug/git/2.55.0/resolve-undo.h /usr/src/debug/git/2.55.0/resolve-undo.c /usr/src/debug/git/2.55.0/replace-object.h /usr/src/debug/git/2.55.0/connect.h /usr/src/debug/git/2.55.0/convert.h /usr/src/debug/git/2.55.0/gettext.h /usr/src/debug/git/2.55.0/replace-object.c /usr/src/debug/git/2.55.0/convert.c /usr/src/debug/git/2.55.0/connect.c /usr/src/debug/git/2.55.0/gettext.c /usr/src/debug/git/2.55.0/versioncmp.c /usr/src/debug/git/2.55.0/daemon.c /usr/src/debug/git/2.55.0/versioncmp.h /usr/src/debug/git/2.55.0/fsmonitor-ll.h /usr/src/debug/git/2.55.0/send-pack.h /usr/src/debug/git/2.55.0/send-pack.c /usr/src/debug/git/2.55.0/repository.c /usr/sr
 c/debug/git/2.55.0/repository.h /usr/src/debug/git/2.55.0/pack-mtimes.h /usr/src/debug/git/2.55.0/apply.c /usr/src/debug/git/2.55.0/pack-mtimes.c /usr/src/debug/git/2.55.0/range-diff.h /usr/src/debug/git/2.55.0/pager.h /usr/src/debug/git/2.55.0/date.h /usr/src/debug/git/2.55.0/range-diff.c /usr/src/debug/git/2.55.0/date.c /usr/src/debug/git/2.55.0/diagnose.c /usr/src/debug/git/2.55.0/common-init.c /usr/src/debug/git/2.55.0/list-objects.c /usr/src/debug/git/2.55.0/pack-objects.c /usr/src/debug/git/2.55.0/urlmatch.h /usr/src/debug/git/2.55.0/repo-settings.c /usr/src/debug/git/2.55.0/list-objects.h /usr/src/debug/git/2.55.0/common-init.h /usr/src/debug/git/2.55.0/pack-objects.h /usr/src/debug/git/2.55.0/diagnose.h /usr/src/debug/git/2.55.0/urlmatch.c /usr/src/debug/git/2.55.0/pack-refs.h /usr/src/debug/git/2.55.0/copy.h /usr/src/debug/git/2.55.0/copy.c /usr/src/debug/git/2.55.0/pack-refs.c /usr/src/debug/git/2.55.0/chunk-format.h /usr/src/debug/git/2.55.0/environment.h /usr/src/debug/g
 it/2.55.0/unix-socket.h /usr/src/debug/git/2.55.0/chunk-format.c /usr/src/debug/git/2.55.0/environment.c /usr/src/debug/git/2.55.0/unix-socket.c /usr/src/debug/git/2.55.0/url.c /usr/src/debug/git/2.55.0/url.h /usr/src/debug/git/2.55.0/promisor-remote.h /usr/src/debug/git/2.55.0/credential.c /usr/src/debug/git/2.55.0/promisor-remote.c /usr/src/debug/git/2.55.0/credential.h /usr/src/debug/git/2.55.0/gpg-interface.h /usr/src/debug/git/2.55.0/imap-send.c /usr/src/debug/git/2.55.0/gpg-interface.c /usr/src/debug/git/2.55.0/run-command.h /usr/src/debug/git/2.55.0/reflog-walk.c /usr/src/debug/git/2.55.0/run-command.c /usr/src/debug/git/2.55.0/reflog-walk.h /usr/src/debug/git/2.55.0/protocol-caps.h /usr/src/debug/git/2.55.0/protocol-caps.c /usr/src/debug/git/2.55.0/add-patch.h /usr/src/debug/git/2.55.0/wildmatch.h /usr/src/debug/git/2.55.0/notes-merge.c /usr/src/debug/git/2.55.0/add-patch.c /usr/src/debug/git/2.55.0/wildmatch.c /usr/src/debug/git/2.55.0/notes-merge.h /usr/src/debug/git/2.55.
 0/hook.c /usr/src/debug/git/2.55.0/progress.c /usr/src/debug/git/2.55.0/hook.h /usr/src/debug/git/2.55.0/progress.h /usr/src/debug/git/2.55.0/prio-queue.h /usr/src/debug/git/2.55.0/prio-queue.c /usr/src/debug/git/2.55.0/wt-status.h /usr/src/debug/git/2.55.0/fsmonitor--daemon.h /usr/src/debug/git/2.55.0/wt-status.c /usr/src/debug/git/2.55.0/tar.h /usr/src/debug/git/2.55.0/revision.h /usr/src/debug/git/2.55.0/thread-utils.h /usr/src/debug/git/2.55.0/revision.c /usr/src/debug/git/2.55.0/hook-list.h /usr/src/debug/git/2.55.0/thread-utils.c /usr/src/debug/git/2.55.0/repack-geometry.c /usr/src/debug/git/2.55.0/simple-ipc.h /usr/src/debug/git/2.55.0/sigchain.h /usr/src/debug/git/2.55.0/notes-cache.c /usr/src/debug/git/2.55.0/notes-cache.h /usr/src/debug/git/2.55.0/sigchain.c /usr/src/debug/git/2.55.0/notes-utils.c /usr/src/debug/git/2.55.0/common-main.c /usr/src/debug/git/2.55.0/notes-utils.h /usr/src/debug/git/2.55.0/editor.c /usr/src/debug/git/2.55.0/diffcore-pickaxe.c /usr/src/debug/git
 /2.55.0/http-fetch.c /usr/src/debug/git/2.55.0/odb/source-files.c /usr/src/debug/git/2.55.0/odb/source-files.h /usr/src/debug/git/2.55.0/mem-pool.h /usr/src/debug/git/2.55.0/protocol.h /usr/src/debug/git/2.55.0/mem-pool.c /usr/src/debug/git/2.55.0/protocol.c /usr/src/debug/git/2.55.0/fsck.h /usr/src/debug/git/2.55.0/http-backend.c /usr/src/debug/git/2.55.0/fsck.c /usr/src/debug/git/2.55.0/reachable.c /usr/src/debug/git/2.55.0/line-range.c /usr/src/debug/git/2.55.0/line-range.h /usr/src/debug/git/2.55.0/reachable.h /usr/src/debug/git/2.55.0/git-compat-util.h /usr/src/debug/git/2.55.0/unpack-trees.c /usr/src/debug/git/2.55.0/git-zlib.h /usr/src/debug/git/2.55.0/upload-pack.c /usr/src/debug/git/2.55.0/upload-pack.h /usr/src/debug/git/2.55.0/diff-lib.c /usr/src/debug/git/2.55.0/git-zlib.c /usr/src/debug/git/2.55.0/unpack-trees.h /usr/src/debug/git/2.55.0/ref-filter.c /usr/src/debug/git/2.55.0/object-name.c /usr/src/debug/git/2.55.0/ref-filter.h /usr/src/debug/git/2.55.0/object-name.h /u
 sr/src/debug/git/2.55.0/patch-delta.c /usr/src/debug/git/2.55.0/repack-filtered.c /usr/src/debug/git/2.55.0/pkt-line.c /usr/src/debug/git/2.55.0/prune-packed.c /usr/src/debug/git/2.55.0/hex.c /usr/src/debug/git/2.55.0/list-objects-filter-options.c /usr/src/debug/git/2.55.0/pkt-line.h /usr/src/debug/git/2.55.0/hex.h /usr/src/debug/git/2.55.0/list-objects-filter-options.h /usr/src/debug/git/2.55.0/prune-packed.h /usr/src/debug/git/2.55.0/varint.c /usr/src/debug/git/2.55.0/walker.c /usr/src/debug/git/2.55.0/cbtree.c /usr/src/debug/git/2.55.0/column.c /usr/src/debug/git/2.55.0/commit.c /usr/src/debug/git/2.55.0/config.c /usr/src/debug/git/2.55.0/advice.c /usr/src/debug/git/2.55.0/varint.h /usr/src/debug/git/2.55.0/walker.h /usr/src/debug/git/2.55.0/base85.c /usr/src/debug/git/2.55.0/prompt.h /usr/src/debug/git/2.55.0/advice.h /usr/src/debug/git/2.55.0/base85.h /usr/src/debug/git/2.55.0/bisect.h /usr/src/debug/git/2.55.0/branch.h /usr/src/debug/git/2.55.0/bundle.h /usr/src/debug/git/2.55
 .0/cbtree.h /usr/src/debug/git/2.55.0/http-push.c /usr/src/debug/git/2.55.0/tree-diff.c /usr/src/debug/git/2.55.0/exec-cmd.h /usr/src/debug/git/2.55.0/exec-cmd.c /usr/src/debug/git/2.55.0/odb/source-inmemory.c /usr/src/debug/git/2.55.0/odb/source-inmemory.h /usr/src/debug/git/2.55.0/fsmonitor-ipc.h /usr/src/debug/git/2.55.0/ws.h /usr/src/debug/git/2.55.0/split-index.c /usr/src/debug/git/2.55.0/ws.c /usr/src/debug/git/2.55.0/fsmonitor-ipc.c /usr/src/debug/git/2.55.0/split-index.h /usr/src/debug/git/2.55.0/reset.h /usr/src/debug/git/2.55.0/merge-ort-wrappers.h /usr/src/debug/git/2.55.0/merge-ort-wrappers.c /usr/src/debug/git/2.55.0/submodule-config.c /usr/src/debug/git/2.55.0/submodule-config.h /usr/src/debug/git/2.55.0/merge-ort.h /usr/src/debug/git/2.55.0/transport.h /usr/src/debug/git/2.55.0/merge-ort.c /usr/src/debug/git/2.55.0/transport.c /usr/src/debug/git/2.55.0/fetch-negotiator.h /usr/src/debug/git/2.55.0/prompt.c /usr/src/debug/git/2.55.0/fetch-negotiator.c /usr/src/debug/git
 /2.55.0/mailinfo.c /usr/src/debug/git/2.55.0/statinfo.c /usr/src/debug/git/2.55.0/mailinfo.h /usr/src/debug/git/2.55.0/statinfo.h /usr/src/debug/git/2.55.0/diff.h /usr/src/debug/git/2.55.0/stable-qsort.c /usr/src/debug/git/2.55.0/diff.c /usr/src/debug/git/2.55.0/midx-write.c /usr/src/debug/git/2.55.0/pack-write.c /usr/src/debug/git/2.55.0/lockfile.h /usr/src/debug/git/2.55.0/packfile.h /usr/src/debug/git/2.55.0/entry.c /usr/src/debug/git/2.55.0/tempfile.h /usr/src/debug/git/2.55.0/rebase.h /usr/src/debug/git/2.55.0/lockfile.c /usr/src/debug/git/2.55.0/packfile.c /usr/src/debug/git/2.55.0/tempfile.c /usr/src/debug/git/2.55.0/delta.h /usr/src/debug/git/2.55.0/object.c /usr/src/debug/git/2.55.0/transport-internal.h /usr/src/debug/git/2.55.0/oidmap.c /usr/src/debug/git/2.55.0/oidset.c /usr/src/debug/git/2.55.0/archive-tar.c /usr/src/debug/git/2.55.0/abspath.c /usr/src/debug/git/2.55.0/bisect.c /usr/src/debug/git/2.55.0/branch.c /usr/src/debug/git/2.55.0/bundle.c /usr/src/debug/git/2.55.
 0/rebase.c /usr/src/debug/git/2.55.0/reflog.c /usr/src/debug/git/2.55.0/remote.c /usr/src/debug/git/2.55.0/repack.c /usr/src/debug/git/2.55.0/replay.c /usr/src/debug/git/2.55.0/rerere.c /usr/src/debug/git/2.55.0/pretty.c /usr/src/debug/git/2.55.0/abspath.h /usr/src/debug/git/2.55.0/pack.h /usr/src/debug/git/2.55.0/repo-settings.h /usr/src/debug/git/2.55.0/parse-options-cb.c /usr/src/debug/git/2.55.0/submodule.c /usr/src/debug/git/2.55.0/reset.c /usr/src/debug/git/2.55.0/column.h /usr/src/debug/git/2.55.0/reflog.h /usr/src/debug/git/2.55.0/remote.h /usr/src/debug/git/2.55.0/repack.h /usr/src/debug/git/2.55.0/replay.h /usr/src/debug/git/2.55.0/rerere.h /usr/src/debug/git/2.55.0/commit.h /usr/src/debug/git/2.55.0/command-list.h /usr/src/debug/git/2.55.0/config.h /usr/src/debug/git/2.55.0/editor.h /usr/src/debug/git/2.55.0/submodule.h /usr/src/debug/git/2.55.0/quote.h /usr/src/debug/git/2.55.0/patch-ids.c /usr/src/debug/git/2.55.0/sparse-index.c /usr/src/debug/git/2.55.0/patch-ids.h /us
 r/src/debug/git/2.55.0/sparse-index.h /usr/src/debug/git/2.55.0/diffcore-rename.c /usr/src/debug/git/2.55.0/diffcore-rotate.c /usr/src/debug/git/2.55.0/combine-diff.c /usr/src/debug/git/2.55.0/pretty.h /usr/src/debug/git/2.55.0/merge-ll.c /usr/src/debug/git/2.55.0/diff-no-index.c /usr/src/debug/git/2.55.0/merge-ll.h /usr/src/debug/git/2.55.0/object.h /usr/src/debug/git/2.55.0/oidmap.h /usr/src/debug/git/2.55.0/oidset.h /usr/src/debug/git/2.55.0/trace2.c /usr/src/debug/git/2.55.0/odb/source-loose.c /usr/src/debug/git/2.55.0/odb/source-loose.h /usr/src/debug/git/2.55.0/server-info.h /usr/src/debug/git/2.55.0/server-info.c /usr/src/debug/git/2.55.0/decorate.c /usr/src/debug/git/2.55.0/decorate.h /usr/src/debug/git/2.55.0/repack-cruft.c /usr/src/debug/git/2.55.0/refs.h /usr/src/debug/git/2.55.0/diff-merges.c /usr/src/debug/git/2.55.0/scalar.c /usr/src/debug/git/2.55.0/strbuf.c /usr/src/debug/git/2.55.0/strmap.c /usr/src/debug/git/2.55.0/strvec.c /usr/src/debug/git/2.55.0/diff-merges.h /
 usr/src/debug/git/2.55.0/refs.c /usr/src/debug/git/2.55.0/grep.h /usr/src/debug/git/2.55.0/grep.c /usr/src/debug/git/2.55.0/tmp-objdir.c /usr/src/debug/git/2.55.0/tmp-objdir.h /usr/src/debug/git/2.55.0/preload-index.h /usr/src/debug/git/2.55.0/diffcore-break.c /usr/src/debug/git/2.55.0/diffcore-delta.c /usr/src/debug/git/2.55.0/common-exit.c /usr/src/debug/git/2.55.0/diffcore-order.c /usr/src/debug/git/2.55.0/xdiff-interface.h /usr/src/debug/git/2.55.0/xdiff-interface.c /usr/src/debug/git/2.55.0/preload-index.c /usr/src/debug/git/2.55.0/for-each-ref.h /usr/src/debug/git/2.55.0/read-cache.h /usr/src/debug/git/2.55.0/diffcore.h /usr/src/debug/git/2.55.0/read-cache.c /usr/src/debug/git/2.55.0/trace2.h /usr/src/debug/git/2.55.0/parse-options.h /usr/src/debug/git/2.55.0/help.c /usr/src/debug/git/2.55.0/iterator.h /usr/src/debug/git/2.55.0/parse-options.c /usr/src/debug/git/2.55.0/help.h /usr/src/debug/git/2.55.0/csum-file.h /usr/src/debug/git/2.55.0/strbuf.h /usr/src/debug/git/2.55.0/str
 map.h /usr/src/debug/git/2.55.0/strvec.h /usr/src/debug/git/2.55.0/csum-file.c /usr/src/debug/git/2.55.0/hex-ll.c /usr/src/debug/git/2.55.0/hash-lookup.c /usr/src/debug/git/2.55.0/hash-lookup.h /usr/src/debug/git/2.55.0/remote-curl.c /usr/src/debug/git/2.55.0/odb/streaming.h /usr/src/debug/git/2.55.0/odb/streaming.c /usr/src/debug/git/2.55.0/tag.c /usr/src/debug/git/2.55.0/read-cache-ll.h /usr/src/debug/git/2.55.0/tag.h /usr/src/debug/git/2.55.0/pack-revindex.c /usr/src/debug/git/2.55.0/git.c /usr/src/debug/git/2.55.0/pack-revindex.h /usr/src/debug/git/2.55.0/checkout.c /usr/src/debug/git/2.55.0/checkout.h", added "/usr/src/debug/git/2.56.0/odb/transaction.h /usr/src/debug/git/2.56.0/odb/transaction.c /usr/src/debug/git/2.56.0/fetch-pack.h /usr/src/debug/git/2.56.0/fetch-pack.c /usr/src/debug/git/2.56.0/write-or-die.h /usr/src/debug/git/2.56.0/write-or-die.c /usr/src/debug/git/2.56.0/transport-helper.c /usr/src/debug/git/2.56.0/connected.c /usr/src/debug/git/2.56.0/connected.h /usr/
 src/debug/git/2.56.0/cache-tree.c /usr/src/debug/git/2.56.0/dir-iterator.h /usr/src/debug/git/2.56.0/http.h /usr/src/debug/git/2.56.0/pack-bitmap.c /usr/src/debug/git/2.56.0/unix-stream-server.h /usr/src/debug/git/2.56.0/cache-tree.h /usr/src/debug/git/2.56.0/dir-iterator.c /usr/src/debug/git/2.56.0/http.c /usr/src/debug/git/2.56.0/pack-bitmap.h /usr/src/debug/git/2.56.0/unix-stream-server.c /usr/src/debug/git/2.56.0/odb.c /usr/src/debug/git/2.56.0/odb.h /usr/src/debug/git/2.56.0/string-list.c /usr/src/debug/git/2.56.0/object-file.h /usr/src/debug/git/2.56.0/config-list.h /usr/src/debug/git/2.56.0/string-list.h /usr/src/debug/git/2.56.0/object-file.c /usr/src/debug/git/2.56.0/fsmonitor-path-utils.h /usr/src/debug/git/2.56.0/line-log.c /usr/src/debug/git/2.56.0/line-log.h /usr/src/debug/git/2.56.0/shortlog.h /usr/src/debug/git/2.56.0/commit-graph.h /usr/src/debug/git/2.56.0/commit-graph.c /usr/src/debug/git/2.56.0/parallel-checkout.h /usr/src/debug/git/2.56.0/sequencer.c /usr/src/deb
 ug/git/2.56.0/parallel-checkout.c /usr/src/debug/git/2.56.0/sequencer.h /usr/src/debug/git/2.56.0/midx.h /usr/src/debug/git/2.56.0/sane-ctype.h /usr/src/debug/git/2.56.0/midx.c /usr/src/debug/git/2.56.0/unicode-width.h /usr/src/debug/git/2.56.0/shallow.c /usr/src/debug/git/2.56.0/dir.c /usr/src/debug/git/2.56.0/shallow.h /usr/src/debug/git/2.56.0/dir.h /usr/src/debug/git/2.56.0/pseudo-merge.c /usr/src/debug/git/2.56.0/odb/source.h /usr/src/debug/git/2.56.0/pseudo-merge.h /usr/src/debug/git/2.56.0/odb/source.c /usr/src/debug/git/2.56.0/blob.c /usr/src/debug/git/2.56.0/sha1dc_git.h /usr/src/debug/git/2.56.0/blob.h /usr/src/debug/git/2.56.0/sha1dc_git.c /usr/src/debug/git/2.56.0/packfile-list.c /usr/src/debug/git/2.56.0/packfile-list.h /usr/src/debug/git/2.56.0/color.h /usr/src/debug/git/2.56.0/blame.h /usr/src/debug/git/2.56.0/bloom.h /usr/src/debug/git/2.56.0/parse.h /usr/src/debug/git/2.56.0/entry.h /usr/src/debug/git/2.56.0/graph.h /usr/src/debug/git/2.56.0/ident.h /usr/src/debug/g
 it/2.56.0/khash.h /usr/src/debug/git/2.56.0/kwset.h /usr/src/debug/git/2.56.0/loose.h /usr/src/debug/git/2.56.0/sideband.c /usr/src/debug/git/2.56.0/sideband.h /usr/src/debug/git/2.56.0/archive-zip.c /usr/src/debug/git/2.56.0/hash.h /usr/src/debug/git/2.56.0/hash.c /usr/src/debug/git/2.56.0/archive.c /usr/src/debug/git/2.56.0/oidtree.c /usr/src/debug/git/2.56.0/pager.c /usr/src/debug/git/2.56.0/graph.c /usr/src/debug/git/2.56.0/trace.c /usr/src/debug/git/2.56.0/ident.c /usr/src/debug/git/2.56.0/color.c /usr/src/debug/git/2.56.0/ctype.c /usr/src/debug/git/2.56.0/quote.c /usr/src/debug/git/2.56.0/usage.c /usr/src/debug/git/2.56.0/alias.c /usr/src/debug/git/2.56.0/alloc.c /usr/src/debug/git/2.56.0/repack-midx.c /usr/src/debug/git/2.56.0/archive.h /usr/src/debug/git/2.56.0/oidtree.h /usr/src/debug/git/2.56.0/attr.c /usr/src/debug/git/2.56.0/ls-refs.h /usr/src/debug/git/2.56.0/pack-check.c /usr/src/debug/git/2.56.0/ls-refs.c /usr/src/debug/git/2.56.0/attr.h /usr/src/debug/git/2.56.0/log-
 tree.h /usr/src/debug/git/2.56.0/worktree.h /usr/src/debug/git/2.56.0/name-hash.c /usr/src/debug/git/2.56.0/levenshtein.h /usr/src/debug/git/2.56.0/chdir-notify.c /usr/src/debug/git/2.56.0/name-hash.h /usr/src/debug/git/2.56.0/log-tree.c /usr/src/debug/git/2.56.0/worktree.c /usr/src/debug/git/2.56.0/chdir-notify.h /usr/src/debug/git/2.56.0/levenshtein.c /usr/src/debug/git/2.56.0/pack-bitmap-write.c /usr/src/debug/git/2.56.0/linear-assignment.h /usr/src/debug/git/2.56.0/fsmonitor.c /usr/src/debug/git/2.56.0/pathspec.h /usr/src/debug/git/2.56.0/linear-assignment.c /usr/src/debug/git/2.56.0/pathspec.c /usr/src/debug/git/2.56.0/fsmonitor.h /usr/src/debug/git/2.56.0/commit-reach.c /usr/src/debug/git/2.56.0/add-interactive.h /usr/src/debug/git/2.56.0/fmt-merge-msg.h /usr/src/debug/git/2.56.0/refspec.h /usr/src/debug/git/2.56.0/commit-reach.h /usr/src/debug/git/2.56.0/fmt-merge-msg.c /usr/src/debug/git/2.56.0/add-interactive.c /usr/src/debug/git/2.56.0/refspec.c /usr/src/debug/git/2.56.0/r
 epack-promisor.c /usr/src/debug/git/2.56.0/tree.c /usr/src/debug/git/2.56.0/path-walk.h /usr/src/debug/git/2.56.0/tree-walk.h /usr/src/debug/git/2.56.0/trace.h /usr/src/debug/git/2.56.0/list-objects-filter.h /usr/src/debug/git/2.56.0/sh-i18n--envsubst.c /usr/src/debug/git/2.56.0/path-walk.c /usr/src/debug/git/2.56.0/list.h /usr/src/debug/git/2.56.0/tree-walk.c /usr/src/debug/git/2.56.0/tree.h /usr/src/debug/git/2.56.0/list-objects-filter.c /usr/src/debug/git/2.56.0/delta-islands.h /usr/src/debug/git/2.56.0/utf8.h /usr/src/debug/git/2.56.0/symlinks.h /usr/src/debug/git/2.56.0/delta-islands.c /usr/src/debug/git/2.56.0/utf8.c /usr/src/debug/git/2.56.0/symlinks.c /usr/src/debug/git/2.56.0/sub-process.c /usr/src/debug/git/2.56.0/path.h /usr/src/debug/git/2.56.0/bundle-uri.c /usr/src/debug/git/2.56.0/path.c /usr/src/debug/git/2.56.0/userdiff.h /usr/src/debug/git/2.56.0/sub-process.h /usr/src/debug/git/2.56.0/bundle-uri.h /usr/src/debug/git/2.56.0/userdiff.c /usr/src/debug/git/2.56.0/blame
 .c /usr/src/debug/git/2.56.0/bloom.c /usr/src/debug/git/2.56.0/http-walker.c /usr/src/debug/git/2.56.0/trailer.h /usr/src/debug/git/2.56.0/wrapper.h /usr/src/debug/git/2.56.0/trailer.c /usr/src/debug/git/2.56.0/wrapper.c /usr/src/debug/git/2.56.0/hashmap.h /usr/src/debug/git/2.56.0/mailmap.h /usr/src/debug/git/2.56.0/diff-delta.c /usr/src/debug/git/2.56.0/object-file-convert.c /usr/src/debug/git/2.56.0/object-file-convert.h /usr/src/debug/git/2.56.0/hashmap.c /usr/src/debug/git/2.56.0/mailmap.c /usr/src/debug/git/2.56.0/rebase-interactive.h /usr/src/debug/git/2.56.0/merge-blobs.h /usr/src/debug/git/2.56.0/alias.h /usr/src/debug/git/2.56.0/alloc.h /usr/src/debug/git/2.56.0/apply.h /usr/src/debug/git/2.56.0/serve.h /usr/src/debug/git/2.56.0/setup.h /usr/src/debug/git/2.56.0/stash.h /usr/src/debug/git/2.56.0/merge-blobs.c /usr/src/debug/git/2.56.0/rebase-interactive.c /usr/src/debug/git/2.56.0/pager.h /usr/src/debug/git/2.56.0/serve.c /usr/src/debug/git/2.56.0/setup.c /usr/src/debug/gi
 t/2.56.0/shell.c /usr/src/debug/git/2.56.0/parse.c /usr/src/debug/git/2.56.0/kwset.c /usr/src/debug/git/2.56.0/loose.c /usr/src/debug/git/2.56.0/merge.c /usr/src/debug/git/2.56.0/notes.c /usr/src/debug/git/2.56.0/match-trees.h /usr/src/debug/git/2.56.0/match-trees.c /usr/src/debug/git/2.56.0/notes.h /usr/src/debug/git/2.56.0/version.c /usr/src/debug/git/2.56.0/builtin.h /usr/src/debug/git/2.56.0/version.h /usr/src/debug/git/2.56.0/oid-array.h /usr/src/debug/git/2.56.0/fsmonitor-settings.c /usr/src/debug/git/2.56.0/json-writer.h /usr/src/debug/git/2.56.0/fsmonitor-settings.h /usr/src/debug/git/2.56.0/oid-array.c /usr/src/debug/git/2.56.0/json-writer.c /usr/src/debug/git/2.56.0/resolve-undo.h /usr/src/debug/git/2.56.0/resolve-undo.c /usr/src/debug/git/2.56.0/replace-object.h /usr/src/debug/git/2.56.0/connect.h /usr/src/debug/git/2.56.0/convert.h /usr/src/debug/git/2.56.0/gettext.h /usr/src/debug/git/2.56.0/replace-object.c /usr/src/debug/git/2.56.0/convert.c /usr/src/debug/git/2.56.0/
 connect.c /usr/src/debug/git/2.56.0/gettext.c /usr/src/debug/git/2.56.0/versioncmp.c /usr/src/debug/git/2.56.0/daemon.c /usr/src/debug/git/2.56.0/versioncmp.h /usr/src/debug/git/2.56.0/fsmonitor-ll.h /usr/src/debug/git/2.56.0/send-pack.h /usr/src/debug/git/2.56.0/send-pack.c /usr/src/debug/git/2.56.0/repository.c /usr/src/debug/git/2.56.0/repository.h /usr/src/debug/git/2.56.0/pack-mtimes.h /usr/src/debug/git/2.56.0/apply.c /usr/src/debug/git/2.56.0/pack-mtimes.c /usr/src/debug/git/2.56.0/range-diff.h /usr/src/debug/git/2.56.0/date.h /usr/src/debug/git/2.56.0/range-diff.c /usr/src/debug/git/2.56.0/date.c /usr/src/debug/git/2.56.0/diagnose.c /usr/src/debug/git/2.56.0/common-init.c /usr/src/debug/git/2.56.0/list-objects.c /usr/src/debug/git/2.56.0/pack-objects.c /usr/src/debug/git/2.56.0/urlmatch.h /usr/src/debug/git/2.56.0/repo-settings.c /usr/src/debug/git/2.56.0/list-objects.h /usr/src/debug/git/2.56.0/common-init.h /usr/src/debug/git/2.56.0/pack-objects.h /usr/src/debug/git/2.56.0
 /diagnose.h /usr/src/debug/git/2.56.0/urlmatch.c /usr/src/debug/git/2.56.0/pack-refs.h /usr/src/debug/git/2.56.0/copy.h /usr/src/debug/git/2.56.0/copy.c /usr/src/debug/git/2.56.0/pack-refs.c /usr/src/debug/git/2.56.0/chunk-format.h /usr/src/debug/git/2.56.0/environment.h /usr/src/debug/git/2.56.0/unix-socket.h /usr/src/debug/git/2.56.0/chunk-format.c /usr/src/debug/git/2.56.0/environment.c /usr/src/debug/git/2.56.0/unix-socket.c /usr/src/debug/git/2.56.0/url.c /usr/src/debug/git/2.56.0/url.h /usr/src/debug/git/2.56.0/promisor-remote.h /usr/src/debug/git/2.56.0/credential.c /usr/src/debug/git/2.56.0/promisor-remote.c /usr/src/debug/git/2.56.0/credential.h /usr/src/debug/git/2.56.0/gpg-interface.h /usr/src/debug/git/2.56.0/imap-send.c /usr/src/debug/git/2.56.0/gpg-interface.c /usr/src/debug/git/2.56.0/run-command.h /usr/src/debug/git/2.56.0/reflog-walk.c /usr/src/debug/git/2.56.0/run-command.c /usr/src/debug/git/2.56.0/reflog-walk.h /usr/src/debug/git/2.56.0/protocol-caps.h /usr/src/d
 ebug/git/2.56.0/protocol-caps.c /usr/src/debug/git/2.56.0/add-patch.h /usr/src/debug/git/2.56.0/wildmatch.h /usr/src/debug/git/2.56.0/notes-merge.c /usr/src/debug/git/2.56.0/add-patch.c /usr/src/debug/git/2.56.0/wildmatch.c /usr/src/debug/git/2.56.0/notes-merge.h /usr/src/debug/git/2.56.0/hook.c /usr/src/debug/git/2.56.0/progress.c /usr/src/debug/git/2.56.0/hook.h /usr/src/debug/git/2.56.0/progress.h /usr/src/debug/git/2.56.0/prio-queue.h /usr/src/debug/git/2.56.0/prio-queue.c /usr/src/debug/git/2.56.0/wt-status.h /usr/src/debug/git/2.56.0/fsmonitor--daemon.h /usr/src/debug/git/2.56.0/wt-status.c /usr/src/debug/git/2.56.0/tar.h /usr/src/debug/git/2.56.0/revision.h /usr/src/debug/git/2.56.0/thread-utils.h /usr/src/debug/git/2.56.0/revision.c /usr/src/debug/git/2.56.0/hook-list.h /usr/src/debug/git/2.56.0/thread-utils.c /usr/src/debug/git/2.56.0/repack-geometry.c /usr/src/debug/git/2.56.0/simple-ipc.h /usr/src/debug/git/2.56.0/sigchain.h /usr/src/debug/git/2.56.0/notes-cache.c /usr/sr
 c/debug/git/2.56.0/notes-cache.h /usr/src/debug/git/2.56.0/sigchain.c /usr/src/debug/git/2.56.0/notes-utils.c /usr/src/debug/git/2.56.0/common-main.c /usr/src/debug/git/2.56.0/notes-utils.h /usr/src/debug/git/2.56.0/editor.c /usr/src/debug/git/2.56.0/diffcore-pickaxe.c /usr/src/debug/git/2.56.0/http-fetch.c /usr/src/debug/git/2.56.0/odb/source-files.c /usr/src/debug/git/2.56.0/odb/source-files.h /usr/src/debug/git/2.56.0/mem-pool.h /usr/src/debug/git/2.56.0/protocol.h /usr/src/debug/git/2.56.0/mem-pool.c /usr/src/debug/git/2.56.0/protocol.c /usr/src/debug/git/2.56.0/fsck.h /usr/src/debug/git/2.56.0/http-backend.c /usr/src/debug/git/2.56.0/fsck.c /usr/src/debug/git/2.56.0/reachable.c /usr/src/debug/git/2.56.0/line-range.c /usr/src/debug/git/2.56.0/line-range.h /usr/src/debug/git/2.56.0/reachable.h /usr/src/debug/git/2.56.0/git-compat-util.h /usr/src/debug/git/2.56.0/unpack-trees.c /usr/src/debug/git/2.56.0/git-zlib.h /usr/src/debug/git/2.56.0/upload-pack.c /usr/src/debug/git/2.56.0/u
 pload-pack.h /usr/src/debug/git/2.56.0/diff-lib.c /usr/src/debug/git/2.56.0/git-zlib.c /usr/src/debug/git/2.56.0/unpack-trees.h /usr/src/debug/git/2.56.0/ref-filter.c /usr/src/debug/git/2.56.0/object-name.c /usr/src/debug/git/2.56.0/ref-filter.h /usr/src/debug/git/2.56.0/object-name.h /usr/src/debug/git/2.56.0/patch-delta.c /usr/src/debug/git/2.56.0/repack-filtered.c /usr/src/debug/git/2.56.0/pkt-line.c /usr/src/debug/git/2.56.0/prune-packed.c /usr/src/debug/git/2.56.0/hex.c /usr/src/debug/git/2.56.0/list-objects-filter-options.c /usr/src/debug/git/2.56.0/pkt-line.h /usr/src/debug/git/2.56.0/hex.h /usr/src/debug/git/2.56.0/list-objects-filter-options.h /usr/src/debug/git/2.56.0/prune-packed.h /usr/src/debug/git/2.56.0/varint.c /usr/src/debug/git/2.56.0/walker.c /usr/src/debug/git/2.56.0/cbtree.c /usr/src/debug/git/2.56.0/column.c /usr/src/debug/git/2.56.0/commit.c /usr/src/debug/git/2.56.0/config.c /usr/src/debug/git/2.56.0/advice.c /usr/src/debug/git/2.56.0/varint.h /usr/src/debug/
 git/2.56.0/walker.h /usr/src/debug/git/2.56.0/base85.c /usr/src/debug/git/2.56.0/advice.h /usr/src/debug/git/2.56.0/base85.h /usr/src/debug/git/2.56.0/bisect.h /usr/src/debug/git/2.56.0/branch.h /usr/src/debug/git/2.56.0/bundle.h /usr/src/debug/git/2.56.0/cbtree.h /usr/src/debug/git/2.56.0/column.h /usr/src/debug/git/2.56.0/http-push.c /usr/src/debug/git/2.56.0/tree-diff.c /usr/src/debug/git/2.56.0/exec-cmd.h /usr/src/debug/git/2.56.0/exec-cmd.c /usr/src/debug/git/2.56.0/fetch-object-info.c /usr/src/debug/git/2.56.0/odb/source-inmemory.c /usr/src/debug/git/2.56.0/fetch-object-info.h /usr/src/debug/git/2.56.0/odb/source-inmemory.h /usr/src/debug/git/2.56.0/fsmonitor-ipc.h /usr/src/debug/git/2.56.0/ws.h /usr/src/debug/git/2.56.0/split-index.c /usr/src/debug/git/2.56.0/ws.c /usr/src/debug/git/2.56.0/fsmonitor-ipc.c /usr/src/debug/git/2.56.0/split-index.h /usr/src/debug/git/2.56.0/reset.h /usr/src/debug/git/2.56.0/merge-ort-wrappers.h /usr/src/debug/git/2.56.0/merge-ort-wrappers.c /usr/
 src/debug/git/2.56.0/submodule-config.c /usr/src/debug/git/2.56.0/submodule-config.h /usr/src/debug/git/2.56.0/merge-ort.h /usr/src/debug/git/2.56.0/transport.h /usr/src/debug/git/2.56.0/merge-ort.c /usr/src/debug/git/2.56.0/transport.c /usr/src/debug/git/2.56.0/fetch-negotiator.h /usr/src/debug/git/2.56.0/odb/source-packed.h /usr/src/debug/git/2.56.0/prompt.c /usr/src/debug/git/2.56.0/fetch-negotiator.c /usr/src/debug/git/2.56.0/odb/source-packed.c /usr/src/debug/git/2.56.0/mailinfo.c /usr/src/debug/git/2.56.0/statinfo.c /usr/src/debug/git/2.56.0/mailinfo.h /usr/src/debug/git/2.56.0/statinfo.h /usr/src/debug/git/2.56.0/diff.h /usr/src/debug/git/2.56.0/stable-qsort.c /usr/src/debug/git/2.56.0/diff.c /usr/src/debug/git/2.56.0/midx-write.c /usr/src/debug/git/2.56.0/pack-write.c /usr/src/debug/git/2.56.0/lockfile.h /usr/src/debug/git/2.56.0/packfile.h /usr/src/debug/git/2.56.0/entry.c /usr/src/debug/git/2.56.0/tempfile.h /usr/src/debug/git/2.56.0/rebase.h /usr/src/debug/git/2.56.0/lock
 file.c /usr/src/debug/git/2.56.0/packfile.c /usr/src/debug/git/2.56.0/tempfile.c /usr/src/debug/git/2.56.0/delta.h /usr/src/debug/git/2.56.0/object.c /usr/src/debug/git/2.56.0/transport-internal.h /usr/src/debug/git/2.56.0/oidmap.c /usr/src/debug/git/2.56.0/oidset.c /usr/src/debug/git/2.56.0/archive-tar.c /usr/src/debug/git/2.56.0/abspath.c /usr/src/debug/git/2.56.0/bisect.c /usr/src/debug/git/2.56.0/branch.c /usr/src/debug/git/2.56.0/bundle.c /usr/src/debug/git/2.56.0/rebase.c /usr/src/debug/git/2.56.0/reflog.c /usr/src/debug/git/2.56.0/remote.c /usr/src/debug/git/2.56.0/repack.c /usr/src/debug/git/2.56.0/replay.c /usr/src/debug/git/2.56.0/rerere.c /usr/src/debug/git/2.56.0/pretty.c /usr/src/debug/git/2.56.0/pack.h /usr/src/debug/git/2.56.0/abspath.h /usr/src/debug/git/2.56.0/repo-settings.h /usr/src/debug/git/2.56.0/parse-options-cb.c /usr/src/debug/git/2.56.0/submodule.c /usr/src/debug/git/2.56.0/reset.c /usr/src/debug/git/2.56.0/commit.h /usr/src/debug/git/2.56.0/reflog.h /usr/s
 rc/debug/git/2.56.0/remote.h /usr/src/debug/git/2.56.0/repack.h /usr/src/debug/git/2.56.0/replay.h /usr/src/debug/git/2.56.0/rerere.h /usr/src/debug/git/2.56.0/config.h /usr/src/debug/git/2.56.0/command-list.h /usr/src/debug/git/2.56.0/editor.h /usr/src/debug/git/2.56.0/hex-ll.h /usr/src/debug/git/2.56.0/submodule.h /usr/src/debug/git/2.56.0/quote.h /usr/src/debug/git/2.56.0/patch-ids.c /usr/src/debug/git/2.56.0/sparse-index.c /usr/src/debug/git/2.56.0/patch-ids.h /usr/src/debug/git/2.56.0/sparse-index.h /usr/src/debug/git/2.56.0/diffcore-rename.c /usr/src/debug/git/2.56.0/diffcore-rotate.c /usr/src/debug/git/2.56.0/combine-diff.c /usr/src/debug/git/2.56.0/pretty.h /usr/src/debug/git/2.56.0/prompt.h /usr/src/debug/git/2.56.0/merge-ll.c /usr/src/debug/git/2.56.0/diff-no-index.c /usr/src/debug/git/2.56.0/merge-ll.h /usr/src/debug/git/2.56.0/object.h /usr/src/debug/git/2.56.0/oidmap.h /usr/src/debug/git/2.56.0/oidset.h /usr/src/debug/git/2.56.0/trace2.c /usr/src/debug/git/2.56.0/odb/so
 urce-loose.c /usr/src/debug/git/2.56.0/odb/source-loose.h /usr/src/debug/git/2.56.0/server-info.h /usr/src/debug/git/2.56.0/server-info.c /usr/src/debug/git/2.56.0/decorate.c /usr/src/debug/git/2.56.0/decorate.h /usr/src/debug/git/2.56.0/repack-cruft.c /usr/src/debug/git/2.56.0/refs.h /usr/src/debug/git/2.56.0/diff-merges.c /usr/src/debug/git/2.56.0/scalar.c /usr/src/debug/git/2.56.0/strbuf.c /usr/src/debug/git/2.56.0/strmap.c /usr/src/debug/git/2.56.0/strvec.c /usr/src/debug/git/2.56.0/diff-merges.h /usr/src/debug/git/2.56.0/refs.c /usr/src/debug/git/2.56.0/grep.h /usr/src/debug/git/2.56.0/grep.c /usr/src/debug/git/2.56.0/tmp-objdir.c /usr/src/debug/git/2.56.0/tmp-objdir.h /usr/src/debug/git/2.56.0/preload-index.h /usr/src/debug/git/2.56.0/diffcore-break.c /usr/src/debug/git/2.56.0/diffcore-delta.c /usr/src/debug/git/2.56.0/common-exit.c /usr/src/debug/git/2.56.0/merge.h /usr/src/debug/git/2.56.0/diffcore-order.c /usr/src/debug/git/2.56.0/xdiff-interface.h /usr/src/debug/git/2.56.0
 /xdiff-interface.c /usr/src/debug/git/2.56.0/preload-index.c /usr/src/debug/git/2.56.0/for-each-ref.h /usr/src/debug/git/2.56.0/read-cache.h /usr/src/debug/git/2.56.0/diffcore.h /usr/src/debug/git/2.56.0/read-cache.c /usr/src/debug/git/2.56.0/trace2.h /usr/src/debug/git/2.56.0/parse-options.h /usr/src/debug/git/2.56.0/help.c /usr/src/debug/git/2.56.0/iterator.h /usr/src/debug/git/2.56.0/parse-options.c /usr/src/debug/git/2.56.0/help.h /usr/src/debug/git/2.56.0/csum-file.h /usr/src/debug/git/2.56.0/strbuf.h /usr/src/debug/git/2.56.0/strmap.h /usr/src/debug/git/2.56.0/strvec.h /usr/src/debug/git/2.56.0/csum-file.c /usr/src/debug/git/2.56.0/hex-ll.c /usr/src/debug/git/2.56.0/hash-lookup.c /usr/src/debug/git/2.56.0/hash-lookup.h /usr/src/debug/git/2.56.0/remote-curl.c /usr/src/debug/git/2.56.0/odb/streaming.h /usr/src/debug/git/2.56.0/odb/streaming.c /usr/src/debug/git/2.56.0/tag.c /usr/src/debug/git/2.56.0/read-cache-ll.h /usr/src/debug/git/2.56.0/tag.h /usr/src/debug/git/2.56.0/pack-r
 evindex.c /usr/src/debug/git/2.56.0/git.c /usr/src/debug/git/2.56.0/pack-revindex.h /usr/src/debug/git/2.56.0/checkout.c /usr/src/debug/git/2.56.0/checkout.h"
packages/x86-64-v3-poky-linux/git/git-src: PKGV changed from 2.55.0 [default] to 2.56.0 [default]
packages/x86-64-v3-poky-linux/git/git-src: PV changed from "2.55.0" to "2.56.0"
packages/x86-64-v3-poky-linux/git/git-staticdev: PKGV changed from 2.55.0 [default] to 2.56.0 [default]
packages/x86-64-v3-poky-linux/git/git-staticdev: PV changed from "2.55.0" to "2.56.0"
packages/x86-64-v3-poky-linux/git/git-tk: PKGV changed from 2.55.0 [default] to 2.56.0 [default]
packages/x86-64-v3-poky-linux/git/git-tk: PV changed from "2.55.0" to "2.56.0"
packages/x86-64-v3-poky-linux/git/git: PKGSIZE changed from 26611500 to 27750132 (+4%)
packages/x86-64-v3-poky-linux/git/git: PKGV changed from 2.55.0 [default] to 2.56.0 [default]
packages/x86-64-v3-poky-linux/git/git: PV changed from "2.55.0" to "2.56.0"
packages/x86-64-v3-poky-linux/git/gitweb: PKGSIZE changed from 314965 to 315133 (+0%)
packages/x86-64-v3-poky-linux/git/gitweb: PKGV changed from 2.55.0 [default] to 2.56.0 [default]
packages/x86-64-v3-poky-linux/git/gitweb: PV changed from "2.55.0" to "2.56.0"
packages/x86-64-v3-poky-linux/git: SRC_URI changed from "https://cdn.kernel.org/pub/software/scm/git/git-2.55.0.tar.gz;name=tarball file://fixsort.patch" to "https://cdn.kernel.org/pub/software/scm/git/git-2.56.0.tar.gz;name=tarball file://fixsort.patch"
packages/x86-64-v3-poky-linux/git: PKGV changed from 2.55.0 [default] to 2.56.0 [default]
packages/x86-64-v3-poky-linux/git: PV changed from "2.55.0" to "2.56.0"

--===============7251217299511087262==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="git-changelog.txt"

Git v2.55 Release Notes
=======================

UI, Workflows & Features
------------------------

Performance, Internal Implementation, Development Support etc.
--------------------------------------------------------------

Fixes since v2.54
-----------------

Git v2.56 Release Notes
=======================

UI, Workflows & Features
------------------------

Performance, Internal Implementation, Development Support etc.
--------------------------------------------------------------

Fixes since v2.55
-----------------

--===============7251217299511087262==--

