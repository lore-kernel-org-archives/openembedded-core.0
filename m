Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81901C9830B
	for <webhook@archiver.kernel.org>; Wed, 23 Sep 2026 06:27:59 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1209.1790144866655590448
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Sep 2026 23:27:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=IFlStduB;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=FNVcG70F;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 010101a0ccf2f4af-854211bb-c6fb-45ad-aa3a-4d850d9046d4-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1790144869;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Xq+qpwrmKQNLBvFZv5r2VSGWmLiuMMk7aJMe3yBqGSs=;
	b=IFlStduBkEd2rRTq9Vys2SBeVKeY/AQQA8dVnMUBx1Z+Tj4vmLj7gDy3E6jvT+cH
	4Br/xDPXQQkoWvxtkxzmiBXsu8knHW/5cUr/t4Uwz5oCL6c6/ZYOU2NceUMLUNHaMcF
	cT7I80UzLkvOG+8tFMkL6ZQVisVgW5WBExNb1r8E=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1790144869;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Xq+qpwrmKQNLBvFZv5r2VSGWmLiuMMk7aJMe3yBqGSs=;
	b=FNVcG70FfD/cGoj62s2gMm+XEd+Bcg+QLLy+JUMlf53rZGX0Oq0bZXwv7niB1yWh
	WokGPJ0tZnNsO3nv6cy0XH71tO27XD3gqiEuRKl3Ldp8CZrkOSI1hq3KYQsO7QSsDcy
	0l+SVL54YdVP949KhyUEFld6LeFIIqkdtrxwa9HM=
Content-Type: multipart/mixed; boundary="===============0770971716908242099=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gpgme: upgrading to 2.2.0 SUCCEEDED
Message-ID: <010101a0ccf2f4af-854211bb-c6fb-45ad-aa3a-4d850d9046d4-000000@us-west-2.amazonses.com>
Date: Wed, 23 Sep 2026 06:27:49 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.09.23-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Sep 2026 06:27:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246446

--===============0770971716908242099==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *gpgme* to *2.2.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-gpgme-upgrade-2.1.2-2.2.0.patch
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
From 3ae7e17f9a7dbf8188854f6b4ff2908efc982eef Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 23 Sep 2026 06:27:38 +0000
Subject: [PATCH] gpgme: upgrade 2.1.2 -> 2.2.0

Release 2.2.0.
tests: Add test to check issuer serial number and issuer name.
Fix handling of missing timestamp in SIGINFO status.
Provide serial number and issuer of unknown S/MIME signing certificates.
Add helper to decode percent-plus encoded strings.
Handle new SIGINFO status line.
Ignore TRUST_ status lines if no NEWSIG was seen.
---
 ...Revert-build-Make-gpgme.m4-use-gpgrt-config-with-.pc.patch | 2 +-
 .../gpgme/0001-autogen.sh-remove-unknown-in-version.patch     | 2 +-
 meta/recipes-support/gpgme/gpgme/0001-pkgconfig.patch         | 4 ++--
 .../gpgme/0001-posix-io.c-Use-off_t-instead-of-off64_t.patch  | 2 +-
 .../gpgme/0001-use-closefrom-on-linux-and-glibc-2.34.patch    | 2 +-
 ...gpgme-config-skip-all-lib-or-usr-lib-directories-in-.patch | 2 +-
 meta/recipes-support/gpgme/{gpgme_2.1.2.bb => gpgme_2.2.0.bb} | 2 +-
 7 files changed, 8 insertions(+), 8 deletions(-)
 rename meta/recipes-support/gpgme/{gpgme_2.1.2.bb => gpgme_2.2.0.bb} (96%)

diff --git a/meta/recipes-support/gpgme/gpgme/0001-Revert-build-Make-gpgme.m4-use-gpgrt-config-with-.pc.patch b/meta/recipes-support/gpgme/gpgme/0001-Revert-build-Make-gpgme.m4-use-gpgrt-config-with-.pc.patch
index ec0c423961..01b932279d 100644
--- a/meta/recipes-support/gpgme/gpgme/0001-Revert-build-Make-gpgme.m4-use-gpgrt-config-with-.pc.patch
+++ b/meta/recipes-support/gpgme/gpgme/0001-Revert-build-Make-gpgme.m4-use-gpgrt-config-with-.pc.patch
@@ -1,4 +1,4 @@
-From 11991439661faba92e2a3966084d40fc8757557f Mon Sep 17 00:00:00 2001
+From 8eb66a734947d1f50d4e0a7450c0816bc6e15532 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Tue, 14 Oct 2025 14:12:55 +0800
 Subject: [PATCH] Revert "build: Make gpgme.m4 use gpgrt-config with *.pc."
diff --git a/meta/recipes-support/gpgme/gpgme/0001-autogen.sh-remove-unknown-in-version.patch b/meta/recipes-support/gpgme/gpgme/0001-autogen.sh-remove-unknown-in-version.patch
index 579f47c173..d69e2cb50b 100644
--- a/meta/recipes-support/gpgme/gpgme/0001-autogen.sh-remove-unknown-in-version.patch
+++ b/meta/recipes-support/gpgme/gpgme/0001-autogen.sh-remove-unknown-in-version.patch
@@ -1,4 +1,4 @@
-From 7f374b5827f3d5d7f57e9045259f5aca703fb1d3 Mon Sep 17 00:00:00 2001
+From 9e42f12222d951d4714cb28042d387be228975df Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Tue, 26 Nov 2024 23:23:42 -0800
 Subject: [PATCH] autogen.sh: remove '-unknown' in version
diff --git a/meta/recipes-support/gpgme/gpgme/0001-pkgconfig.patch b/meta/recipes-support/gpgme/gpgme/0001-pkgconfig.patch
index ed3b3db261..69bc380d23 100644
--- a/meta/recipes-support/gpgme/gpgme/0001-pkgconfig.patch
+++ b/meta/recipes-support/gpgme/gpgme/0001-pkgconfig.patch
@@ -1,4 +1,4 @@
-From 04838f9ce25f6964254310b66069ed1b37b019ce Mon Sep 17 00:00:00 2001
+From 2d7720a69180994eac6cff740452aa9f636b7bff Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Mon, 21 Jul 2025 12:43:29 +0800
 Subject: [PATCH] pkgconfig
@@ -29,7 +29,7 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  create mode 100644 src/gpgme-pthread.pc.in
 
 diff --git a/configure.ac b/configure.ac
-index cd0af89..5ee3891 100644
+index ee56d99..51c0598 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -845,6 +845,7 @@ AC_CONFIG_FILES(Makefile src/Makefile
diff --git a/meta/recipes-support/gpgme/gpgme/0001-posix-io.c-Use-off_t-instead-of-off64_t.patch b/meta/recipes-support/gpgme/gpgme/0001-posix-io.c-Use-off_t-instead-of-off64_t.patch
index 16df7fff1b..cd322b05a5 100644
--- a/meta/recipes-support/gpgme/gpgme/0001-posix-io.c-Use-off_t-instead-of-off64_t.patch
+++ b/meta/recipes-support/gpgme/gpgme/0001-posix-io.c-Use-off_t-instead-of-off64_t.patch
@@ -1,4 +1,4 @@
-From c069f75821abe4fa7765556f2bcf3af8b04a6eaf Mon Sep 17 00:00:00 2001
+From b58491dbe443be4d04e1a0ef3f539c5b9c9fc6fc Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 15 Dec 2022 08:44:13 -0800
 Subject: [PATCH] posix-io.c: Use off_t instead of off64_t
diff --git a/meta/recipes-support/gpgme/gpgme/0001-use-closefrom-on-linux-and-glibc-2.34.patch b/meta/recipes-support/gpgme/gpgme/0001-use-closefrom-on-linux-and-glibc-2.34.patch
index 0c00cb00f8..89df2f36f6 100644
--- a/meta/recipes-support/gpgme/gpgme/0001-use-closefrom-on-linux-and-glibc-2.34.patch
+++ b/meta/recipes-support/gpgme/gpgme/0001-use-closefrom-on-linux-and-glibc-2.34.patch
@@ -1,4 +1,4 @@
-From 116b3ecc954387f141f7cf9f5e01185919130f18 Mon Sep 17 00:00:00 2001
+From ac2d6e27bf8cb1e11f1c02ded86bf6e4fc569bbd Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 15 Jul 2021 12:33:13 -0700
 Subject: [PATCH] use closefrom() on linux and glibc 2.34+
diff --git a/meta/recipes-support/gpgme/gpgme/0005-gpgme-config-skip-all-lib-or-usr-lib-directories-in-.patch b/meta/recipes-support/gpgme/gpgme/0005-gpgme-config-skip-all-lib-or-usr-lib-directories-in-.patch
index a71ec8e762..77b55101cb 100644
--- a/meta/recipes-support/gpgme/gpgme/0005-gpgme-config-skip-all-lib-or-usr-lib-directories-in-.patch
+++ b/meta/recipes-support/gpgme/gpgme/0005-gpgme-config-skip-all-lib-or-usr-lib-directories-in-.patch
@@ -1,4 +1,4 @@
-From 101b5ffa3742d7e71e75f5e22aa3efe0f4c283b5 Mon Sep 17 00:00:00 2001
+From 4c439c2b344309f8b20533fdd7186accfab7c707 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Thu, 13 Apr 2017 16:40:27 +0300
 Subject: [PATCH] gpgme-config: skip all /lib* or /usr/lib* directories in
diff --git a/meta/recipes-support/gpgme/gpgme_2.1.2.bb b/meta/recipes-support/gpgme/gpgme_2.2.0.bb
similarity index 96%
rename from meta/recipes-support/gpgme/gpgme_2.1.2.bb
rename to meta/recipes-support/gpgme/gpgme_2.2.0.bb
index 32db75fdfd..bffa0b40e4 100644
--- a/meta/recipes-support/gpgme/gpgme_2.1.2.bb
+++ b/meta/recipes-support/gpgme/gpgme_2.2.0.bb
@@ -24,7 +24,7 @@ SRC_URI = "${GNUPG_MIRROR}/gpgme/${BP}.tar.bz2 \
            file://0001-autogen.sh-remove-unknown-in-version.patch \
            "
 
-SRC_URI[sha256sum] = "0687a95b299871c4141f507c0f740de6b429c9ac067d0fa4e062e3264df5fb77"
+SRC_URI[sha256sum] = "7160e80e84dafd00d956c84891c533bb7ab16a6a54fbe1574b2f3acf0496977b"
 
 DEPENDS = "libgpg-error-native libgpg-error libassuan"
 
-- 
2.47.1


--===============0770971716908242099==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/gpgme/gpgme-dbg: PKGV changed from 2.1.2 [default] to 2.2.0 [default]
packages/x86-64-v3-poky-linux/gpgme/gpgme-dbg: PKGSIZE changed from 2274696 to 2278976 (+0%)
packages/x86-64-v3-poky-linux/gpgme/gpgme-dbg: PV changed from "2.1.2" to "2.2.0"
packages/x86-64-v3-poky-linux/gpgme/gpgme-dbg: FILELIST: removed "/usr/lib/.debug/libgpgme.so.45.1.2", added "/usr/lib/.debug/libgpgme.so.45.2.0"
packages/x86-64-v3-poky-linux/gpgme/gpgme-dev: PKGV changed from 2.1.2 [default] to 2.2.0 [default]
packages/x86-64-v3-poky-linux/gpgme/gpgme-dev: PKGSIZE changed from 106789 to 107049 (+0%)
packages/x86-64-v3-poky-linux/gpgme/gpgme-dev: PV changed from "2.1.2" to "2.2.0"
packages/x86-64-v3-poky-linux/gpgme/gpgme-doc: PKGV changed from 2.1.2 [default] to 2.2.0 [default]
packages/x86-64-v3-poky-linux/gpgme/gpgme-doc: PKGSIZE changed from 476985 to 477384 (+0%)
packages/x86-64-v3-poky-linux/gpgme/gpgme-doc: PV changed from "2.1.2" to "2.2.0"
packages/x86-64-v3-poky-linux/gpgme/gpgme-locale: PKGV changed from 2.1.2 [default] to 2.2.0 [default]
packages/x86-64-v3-poky-linux/gpgme/gpgme-locale: PV changed from "2.1.2" to "2.2.0"
packages/x86-64-v3-poky-linux/gpgme/gpgme-src: PKGV changed from 2.1.2 [default] to 2.2.0 [default]
packages/x86-64-v3-poky-linux/gpgme/gpgme-src: PKGSIZE changed from 1342373 to 1346859 (+0%)
packages/x86-64-v3-poky-linux/gpgme/gpgme-src: PV changed from "2.1.2" to "2.2.0"
packages/x86-64-v3-poky-linux/gpgme/gpgme-src: FILELIST: directory renamed /usr/src/debug/gpgme/2.1.2/src -> /usr/src/debug/gpgme/2.2.0/src, directory renamed /usr/src/debug/gpgme/2.1.2/tools -> /usr/src/debug/gpgme/2.2.0/tools
packages/x86-64-v3-poky-linux/gpgme/gpgme-staticdev: PKGV changed from 2.1.2 [default] to 2.2.0 [default]
packages/x86-64-v3-poky-linux/gpgme/gpgme-staticdev: PV changed from "2.1.2" to "2.2.0"
packages/x86-64-v3-poky-linux/gpgme/gpgme-tool: PKGV changed from 2.1.2 [default] to 2.2.0 [default]
packages/x86-64-v3-poky-linux/gpgme/gpgme-tool: PV changed from "2.1.2" to "2.2.0"
packages/x86-64-v3-poky-linux/gpgme/gpgme: PKGV changed from 2.1.2 [default] to 2.2.0 [default]
packages/x86-64-v3-poky-linux/gpgme/gpgme: PKGSIZE changed from 487650 to 487682 (+0%)
packages/x86-64-v3-poky-linux/gpgme/gpgme: PV changed from "2.1.2" to "2.2.0"
packages/x86-64-v3-poky-linux/gpgme/gpgme: FILELIST: removed "/usr/lib/libgpgme.so.45.1.2", added "/usr/lib/libgpgme.so.45.2.0"
packages/x86-64-v3-poky-linux/gpgme: SRC_URI changed from "https://www.gnupg.org/ftp/gcrypt/gpgme/gpgme-2.1.2.tar.bz2 file://0001-Revert-build-Make-gpgme.m4-use-gpgrt-config-with-.pc.patch file://0001-pkgconfig.patch file://0005-gpgme-config-skip-all-lib-or-usr-lib-directories-in-.patch file://0001-use-closefrom-on-linux-and-glibc-2.34.patch file://0001-posix-io.c-Use-off_t-instead-of-off64_t.patch file://0001-autogen.sh-remove-unknown-in-version.patch" to "https://www.gnupg.org/ftp/gcrypt/gpgme/gpgme-2.2.0.tar.bz2 file://0001-Revert-build-Make-gpgme.m4-use-gpgrt-config-with-.pc.patch file://0001-pkgconfig.patch file://0005-gpgme-config-skip-all-lib-or-usr-lib-directories-in-.patch file://0001-use-closefrom-on-linux-and-glibc-2.34.patch file://0001-posix-io.c-Use-off_t-instead-of-off64_t.patch file://0001-autogen.sh-remove-unknown-in-version.patch"
packages/x86-64-v3-poky-linux/gpgme: PKGV changed from 2.1.2 [default] to 2.2.0 [default]
packages/x86-64-v3-poky-linux/gpgme: PV changed from "2.1.2" to "2.2.0"
Changes to packages/x86-64-v3-poky-linux/gpgme (sysroot):
  /usr/lib/libgpgme.so.45 changed symlink target from libgpgme.so.45.1.2 to libgpgme.so.45.2.0
  /usr/lib/libgpgme.so changed symlink target from libgpgme.so.45.1.2 to libgpgme.so.45.2.0
  /usr/lib/libgpgme.so.45.1.2 moved to /usr/lib/libgpgme.so.45.2.0

--===============0770971716908242099==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="gpgme-changelog.txt"

Release 2.2.0.
tests: Add test to check issuer serial number and issuer name.
Fix handling of missing timestamp in SIGINFO status.
Provide serial number and issuer of unknown S/MIME signing certificates.
Add helper to decode percent-plus encoded strings.
Handle new SIGINFO status line.
Ignore TRUST_ status lines if no NEWSIG was seen.

--===============0770971716908242099==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gpgme-upgrade-2.1.2-2.2.0.patch"

RnJvbSAzYWU3ZTE3ZjlhN2RiZjgxODg4NTRmNmI0ZmYyOTA4ZWZjOTgyZWVmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMjMgU2VwIDIwMjYgMDY6Mjc6MzggKzAwMDAKU3ViamVjdDogW1BBVENIXSBn
cGdtZTogdXBncmFkZSAyLjEuMiAtPiAyLjIuMAoKUmVsZWFzZSAyLjIuMC4KdGVzdHM6IEFkZCB0
ZXN0IHRvIGNoZWNrIGlzc3VlciBzZXJpYWwgbnVtYmVyIGFuZCBpc3N1ZXIgbmFtZS4KRml4IGhh
bmRsaW5nIG9mIG1pc3NpbmcgdGltZXN0YW1wIGluIFNJR0lORk8gc3RhdHVzLgpQcm92aWRlIHNl
cmlhbCBudW1iZXIgYW5kIGlzc3VlciBvZiB1bmtub3duIFMvTUlNRSBzaWduaW5nIGNlcnRpZmlj
YXRlcy4KQWRkIGhlbHBlciB0byBkZWNvZGUgcGVyY2VudC1wbHVzIGVuY29kZWQgc3RyaW5ncy4K
SGFuZGxlIG5ldyBTSUdJTkZPIHN0YXR1cyBsaW5lLgpJZ25vcmUgVFJVU1RfIHN0YXR1cyBsaW5l
cyBpZiBubyBORVdTSUcgd2FzIHNlZW4uCi0tLQogLi4uUmV2ZXJ0LWJ1aWxkLU1ha2UtZ3BnbWUu
bTQtdXNlLWdwZ3J0LWNvbmZpZy13aXRoLS5wYy5wYXRjaCB8IDIgKy0KIC4uLi9ncGdtZS8wMDAx
LWF1dG9nZW4uc2gtcmVtb3ZlLXVua25vd24taW4tdmVyc2lvbi5wYXRjaCAgICAgfCAyICstCiBt
ZXRhL3JlY2lwZXMtc3VwcG9ydC9ncGdtZS9ncGdtZS8wMDAxLXBrZ2NvbmZpZy5wYXRjaCAgICAg
ICAgIHwgNCArKy0tCiAuLi4vZ3BnbWUvMDAwMS1wb3NpeC1pby5jLVVzZS1vZmZfdC1pbnN0ZWFk
LW9mLW9mZjY0X3QucGF0Y2ggIHwgMiArLQogLi4uL2dwZ21lLzAwMDEtdXNlLWNsb3NlZnJvbS1v
bi1saW51eC1hbmQtZ2xpYmMtMi4zNC5wYXRjaCAgICB8IDIgKy0KIC4uLmdwZ21lLWNvbmZpZy1z
a2lwLWFsbC1saWItb3ItdXNyLWxpYi1kaXJlY3Rvcmllcy1pbi0ucGF0Y2ggfCAyICstCiBtZXRh
L3JlY2lwZXMtc3VwcG9ydC9ncGdtZS97Z3BnbWVfMi4xLjIuYmIgPT4gZ3BnbWVfMi4yLjAuYmJ9
IHwgMiArLQogNyBmaWxlcyBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKyksIDggZGVsZXRpb25zKC0p
CiByZW5hbWUgbWV0YS9yZWNpcGVzLXN1cHBvcnQvZ3BnbWUve2dwZ21lXzIuMS4yLmJiID0+IGdw
Z21lXzIuMi4wLmJifSAoOTYlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2dw
Z21lL2dwZ21lLzAwMDEtUmV2ZXJ0LWJ1aWxkLU1ha2UtZ3BnbWUubTQtdXNlLWdwZ3J0LWNvbmZp
Zy13aXRoLS5wYy5wYXRjaCBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2dwZ21lL2dwZ21lLzAwMDEt
UmV2ZXJ0LWJ1aWxkLU1ha2UtZ3BnbWUubTQtdXNlLWdwZ3J0LWNvbmZpZy13aXRoLS5wYy5wYXRj
aAppbmRleCBlYzBjNDIzOTYxLi4wMWI5MzIyNzlkIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMt
c3VwcG9ydC9ncGdtZS9ncGdtZS8wMDAxLVJldmVydC1idWlsZC1NYWtlLWdwZ21lLm00LXVzZS1n
cGdydC1jb25maWctd2l0aC0ucGMucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZ3Bn
bWUvZ3BnbWUvMDAwMS1SZXZlcnQtYnVpbGQtTWFrZS1ncGdtZS5tNC11c2UtZ3BncnQtY29uZmln
LXdpdGgtLnBjLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSAxMTk5MTQzOTY2MWZhYmE5MmUy
YTM5NjYwODRkNDBmYzg3NTc1NTdmIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSA4ZWI2
NmE3MzQ5NDdkMWY1MGQ0ZTBhNzQ1MGMwODE2YmM2ZTE1NTMyIE1vbiBTZXAgMTcgMDA6MDA6MDAg
MjAwMQogRnJvbTogSG9uZ3h1IEppYSA8aG9uZ3h1LmppYUB3aW5kcml2ZXIuY29tPgogRGF0ZTog
VHVlLCAxNCBPY3QgMjAyNSAxNDoxMjo1NSArMDgwMAogU3ViamVjdDogW1BBVENIXSBSZXZlcnQg
ImJ1aWxkOiBNYWtlIGdwZ21lLm00IHVzZSBncGdydC1jb25maWcgd2l0aCAqLnBjLiIKZGlmZiAt
LWdpdCBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2dwZ21lL2dwZ21lLzAwMDEtYXV0b2dlbi5zaC1y
ZW1vdmUtdW5rbm93bi1pbi12ZXJzaW9uLnBhdGNoIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZ3Bn
bWUvZ3BnbWUvMDAwMS1hdXRvZ2VuLnNoLXJlbW92ZS11bmtub3duLWluLXZlcnNpb24ucGF0Y2gK
aW5kZXggNTc5ZjQ3YzE3My4uZDY5ZTJjYjUwYiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLXN1
cHBvcnQvZ3BnbWUvZ3BnbWUvMDAwMS1hdXRvZ2VuLnNoLXJlbW92ZS11bmtub3duLWluLXZlcnNp
b24ucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZ3BnbWUvZ3BnbWUvMDAwMS1hdXRv
Z2VuLnNoLXJlbW92ZS11bmtub3duLWluLXZlcnNpb24ucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1G
cm9tIDdmMzc0YjU4MjdmM2Q1ZDdmNTdlOTA0NTI1OWY1YWNhNzAzZmIxZDMgTW9uIFNlcCAxNyAw
MDowMDowMCAyMDAxCitGcm9tIDllNDJmMTIyMjJkOTUxZDQ3MTRjYjI4MDQyZDM4N2JlMjI4OTc1
ZGYgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBIb25neHUgSmlhIDxob25neHUuamlh
QHdpbmRyaXZlci5jb20+CiBEYXRlOiBUdWUsIDI2IE5vdiAyMDI0IDIzOjIzOjQyIC0wODAwCiBT
dWJqZWN0OiBbUEFUQ0hdIGF1dG9nZW4uc2g6IHJlbW92ZSAnLXVua25vd24nIGluIHZlcnNpb24K
ZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2dwZ21lL2dwZ21lLzAwMDEtcGtnY29u
ZmlnLnBhdGNoIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZ3BnbWUvZ3BnbWUvMDAwMS1wa2djb25m
aWcucGF0Y2gKaW5kZXggZWQzYjNkYjI2MS4uNjliYzM4MGQyMyAxMDA2NDQKLS0tIGEvbWV0YS9y
ZWNpcGVzLXN1cHBvcnQvZ3BnbWUvZ3BnbWUvMDAwMS1wa2djb25maWcucGF0Y2gKKysrIGIvbWV0
YS9yZWNpcGVzLXN1cHBvcnQvZ3BnbWUvZ3BnbWUvMDAwMS1wa2djb25maWcucGF0Y2gKQEAgLTEs
NCArMSw0IEBACi1Gcm9tIDA0ODM4ZjljZTI1ZjY5NjQyNTQzMTBiNjYwNjllZDFiMzdiMDE5Y2Ug
TW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDJkNzcyMGE2OTE4MDk5NGVhYzZjZmY3NDA0
NTJhYTlmNjM2YjdiZmYgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBIb25neHUgSmlh
IDxob25neHUuamlhQHdpbmRyaXZlci5jb20+CiBEYXRlOiBNb24sIDIxIEp1bCAyMDI1IDEyOjQz
OjI5ICswODAwCiBTdWJqZWN0OiBbUEFUQ0hdIHBrZ2NvbmZpZwpAQCAtMjksNyArMjksNyBAQCBT
aWduZWQtb2ZmLWJ5OiBIb25neHUgSmlhIDxob25neHUuamlhQHdpbmRyaXZlci5jb20+CiAgY3Jl
YXRlIG1vZGUgMTAwNjQ0IHNyYy9ncGdtZS1wdGhyZWFkLnBjLmluCiAKIGRpZmYgLS1naXQgYS9j
b25maWd1cmUuYWMgYi9jb25maWd1cmUuYWMKLWluZGV4IGNkMGFmODkuLjVlZTM4OTEgMTAwNjQ0
CitpbmRleCBlZTU2ZDk5Li41MWMwNTk4IDEwMDY0NAogLS0tIGEvY29uZmlndXJlLmFjCiArKysg
Yi9jb25maWd1cmUuYWMKIEBAIC04NDUsNiArODQ1LDcgQEAgQUNfQ09ORklHX0ZJTEVTKE1ha2Vm
aWxlIHNyYy9NYWtlZmlsZQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZ3BnbWUv
Z3BnbWUvMDAwMS1wb3NpeC1pby5jLVVzZS1vZmZfdC1pbnN0ZWFkLW9mLW9mZjY0X3QucGF0Y2gg
Yi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9ncGdtZS9ncGdtZS8wMDAxLXBvc2l4LWlvLmMtVXNlLW9m
Zl90LWluc3RlYWQtb2Ytb2ZmNjRfdC5wYXRjaAppbmRleCAxNmRmN2ZmZjFiLi5jZDMyMmIwNWE1
IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9ncGdtZS9ncGdtZS8wMDAxLXBvc2l4
LWlvLmMtVXNlLW9mZl90LWluc3RlYWQtb2Ytb2ZmNjRfdC5wYXRjaAorKysgYi9tZXRhL3JlY2lw
ZXMtc3VwcG9ydC9ncGdtZS9ncGdtZS8wMDAxLXBvc2l4LWlvLmMtVXNlLW9mZl90LWluc3RlYWQt
b2Ytb2ZmNjRfdC5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gYzA2OWY3NTgyMWFiZTRmYTc3
NjU1NTZmMmJjZjNhZjhiMDRhNmVhZiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gYjU4
NDkxZGJlNDQzYmU0ZDA0ZTFhMGVmM2Y1MzljNWI5YzlmYzZmYyBNb24gU2VwIDE3IDAwOjAwOjAw
IDIwMDEKIEZyb206IEtoZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5jb20+CiBEYXRlOiBUaHUsIDE1
IERlYyAyMDIyIDA4OjQ0OjEzIC0wODAwCiBTdWJqZWN0OiBbUEFUQ0hdIHBvc2l4LWlvLmM6IFVz
ZSBvZmZfdCBpbnN0ZWFkIG9mIG9mZjY0X3QKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1zdXBw
b3J0L2dwZ21lL2dwZ21lLzAwMDEtdXNlLWNsb3NlZnJvbS1vbi1saW51eC1hbmQtZ2xpYmMtMi4z
NC5wYXRjaCBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2dwZ21lL2dwZ21lLzAwMDEtdXNlLWNsb3Nl
ZnJvbS1vbi1saW51eC1hbmQtZ2xpYmMtMi4zNC5wYXRjaAppbmRleCAwYzAwY2IwMGY4Li44OWRm
MmYzNmY2IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9ncGdtZS9ncGdtZS8wMDAx
LXVzZS1jbG9zZWZyb20tb24tbGludXgtYW5kLWdsaWJjLTIuMzQucGF0Y2gKKysrIGIvbWV0YS9y
ZWNpcGVzLXN1cHBvcnQvZ3BnbWUvZ3BnbWUvMDAwMS11c2UtY2xvc2Vmcm9tLW9uLWxpbnV4LWFu
ZC1nbGliYy0yLjM0LnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSAxMTZiM2VjYzk1NDM4N2Yx
NDFmN2NmOWY1ZTAxMTg1OTE5MTMwZjE4IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBh
YzJkNmUyN2JmOGNiMWUxMWYxYzAyZGVkODZiZjZlNGZjNTY5YmJkIE1vbiBTZXAgMTcgMDA6MDA6
MDAgMjAwMQogRnJvbTogS2hlbSBSYWogPHJhai5raGVtQGdtYWlsLmNvbT4KIERhdGU6IFRodSwg
MTUgSnVsIDIwMjEgMTI6MzM6MTMgLTA3MDAKIFN1YmplY3Q6IFtQQVRDSF0gdXNlIGNsb3NlZnJv
bSgpIG9uIGxpbnV4IGFuZCBnbGliYyAyLjM0KwpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1
cHBvcnQvZ3BnbWUvZ3BnbWUvMDAwNS1ncGdtZS1jb25maWctc2tpcC1hbGwtbGliLW9yLXVzci1s
aWItZGlyZWN0b3JpZXMtaW4tLnBhdGNoIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZ3BnbWUvZ3Bn
bWUvMDAwNS1ncGdtZS1jb25maWctc2tpcC1hbGwtbGliLW9yLXVzci1saWItZGlyZWN0b3JpZXMt
aW4tLnBhdGNoCmluZGV4IGE3MWVjOGU3NjIuLjc3YjU1MTAxY2IgMTAwNjQ0Ci0tLSBhL21ldGEv
cmVjaXBlcy1zdXBwb3J0L2dwZ21lL2dwZ21lLzAwMDUtZ3BnbWUtY29uZmlnLXNraXAtYWxsLWxp
Yi1vci11c3ItbGliLWRpcmVjdG9yaWVzLWluLS5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtc3Vw
cG9ydC9ncGdtZS9ncGdtZS8wMDA1LWdwZ21lLWNvbmZpZy1za2lwLWFsbC1saWItb3ItdXNyLWxp
Yi1kaXJlY3Rvcmllcy1pbi0ucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDEwMWI1ZmZhMzc0
MmQ3ZTcxZTc1ZjVlMjJhYTNlZmUwZjRjMjgzYjUgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitG
cm9tIDRjNDM5YzJiMzQ0MzA5ZjhiMjA1MzNmZGQ3MTg2YWNjZmFiN2M3MDcgTW9uIFNlcCAxNyAw
MDowMDowMCAyMDAxCiBGcm9tOiBBbGV4YW5kZXIgS2FuYXZpbiA8YWxleC5rYW5hdmluQGdtYWls
LmNvbT4KIERhdGU6IFRodSwgMTMgQXByIDIwMTcgMTY6NDA6MjcgKzAzMDAKIFN1YmplY3Q6IFtQ
QVRDSF0gZ3BnbWUtY29uZmlnOiBza2lwIGFsbCAvbGliKiBvciAvdXNyL2xpYiogZGlyZWN0b3Jp
ZXMgaW4KZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2dwZ21lL2dwZ21lXzIuMS4y
LmJiIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZ3BnbWUvZ3BnbWVfMi4yLjAuYmIKc2ltaWxhcml0
eSBpbmRleCA5NiUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLXN1cHBvcnQvZ3BnbWUvZ3BnbWVf
Mi4xLjIuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1zdXBwb3J0L2dwZ21lL2dwZ21lXzIuMi4w
LmJiCmluZGV4IDMyZGI3NWZkZmQuLmJmZmEwYjQwZTQgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBl
cy1zdXBwb3J0L2dwZ21lL2dwZ21lXzIuMS4yLmJiCisrKyBiL21ldGEvcmVjaXBlcy1zdXBwb3J0
L2dwZ21lL2dwZ21lXzIuMi4wLmJiCkBAIC0yNCw3ICsyNCw3IEBAIFNSQ19VUkkgPSAiJHtHTlVQ
R19NSVJST1J9L2dwZ21lLyR7QlB9LnRhci5iejIgXAogICAgICAgICAgICBmaWxlOi8vMDAwMS1h
dXRvZ2VuLnNoLXJlbW92ZS11bmtub3duLWluLXZlcnNpb24ucGF0Y2ggXAogICAgICAgICAgICAi
CiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICIwNjg3YTk1YjI5OTg3MWM0MTQxZjUwN2MwZjc0MGRl
NmI0MjljOWFjMDY3ZDBmYTRlMDYyZTMyNjRkZjVmYjc3IgorU1JDX1VSSVtzaGEyNTZzdW1dID0g
IjcxNjBlODBlODRkYWZkMDBkOTU2Yzg0ODkxYzUzM2JiN2FiMTZhNmE1NGZiZTE1NzRiMmYzYWNm
MDQ5Njk3N2IiCiAKIERFUEVORFMgPSAibGliZ3BnLWVycm9yLW5hdGl2ZSBsaWJncGctZXJyb3Ig
bGliYXNzdWFuIgogCi0tIAoyLjQ3LjEKCg==

--===============0770971716908242099==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/gpgme/gpgme: FILELIST: removed "/usr/lib/libgpgme.so.45.1.2", added "/usr/lib/libgpgme.so.45.2.0"
Changes to packages/x86-64-v3-poky-linux/gpgme (sysroot):
  /usr/lib/libgpgme.so.45 changed symlink target from libgpgme.so.45.1.2 to libgpgme.so.45.2.0
  /usr/lib/libgpgme.so changed symlink target from libgpgme.so.45.1.2 to libgpgme.so.45.2.0
  /usr/lib/libgpgme.so.45.1.2 moved to /usr/lib/libgpgme.so.45.2.0

--===============0770971716908242099==--

