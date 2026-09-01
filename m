Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 465A3C61DD6
	for <webhook@archiver.kernel.org>; Tue,  1 Sep 2026 05:53:22 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1379.1788241992117500022
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Aug 2026 22:53:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=SfN8GFGb;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=POZQ3mh6;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 010101a05b8755ef-cf7e0a8c-503d-4690-a419-c3f9802e8d22-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1788241991;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=GPbyqjo5/81O7Gkusr8ewOV7XhHrCQO7c6qVS2aROd0=;
	b=SfN8GFGbmEqnzqi3f9CJI7sCdM22XmgF5s3J8AWooLn8nftP4EXfnM2SgbXd1JkW
	GAnZWQMpwmAxEncv0/Bqxji32P2RsGAG2Gj4AgiQKBWEGMg8DuM5Sd+nvR3WZ8wq4yI
	RuYqXR4y6F8WAOiQRh9HZMbjM0kPoUIeB0unqwEU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1788241991;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=GPbyqjo5/81O7Gkusr8ewOV7XhHrCQO7c6qVS2aROd0=;
	b=POZQ3mh6w8GojCPvITCs6De+ROS9/wcx/zKHZbVUkZfwhEM3Oec0Xj87eCt561hx
	3rE6AzIMsOVtDtVgJovk5dSr/kBHQ9vwcFKvEJ6yekGRPRWHmNp2w6S07x13NPCKejy
	QTLmbn52vJJ9bUIcAg7pOr4HrvoxoGy6/GALTavE=
Content-Type: multipart/mixed; boundary="===============7630524407755219440=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] libpcre2: upgrading to 10.48 SUCCEEDED
Message-ID: <010101a05b8755ef-cf7e0a8c-503d-4690-a419-c3f9802e8d22-000000@us-west-2.amazonses.com>
Date: Tue, 1 Sep 2026 05:53:11 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.09.01-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Sep 2026 05:53:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244791

--===============7630524407755219440==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libpcre2* to *10.48* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libpcre2-upgrade-10.47-10.48.patch
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
From ed7805f84d67056b98061858cf40202238c35dde Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 1 Sep 2026 05:53:04 +0000
Subject: [PATCH] libpcre2: upgrade 10.47 -> 10.48

Source: ChangeLog

Version 10.48 31-August-2026
----------------------------

1. (#826) [GHSA-q7rw-r7qq-2hx6] Initialized alignment padding in serialized
character lists so that pcre2_serialize_encode() does not expose two
uninitialised bytes from malloc().

2. (#825) Fixed the casing of CMake package variables and corrected
Readline/ncurses linkage.

3. (#830) Updated Unicode support to Unicode 17.0, including new scripts,
characters, properties, case mappings, and emoji data.

4. (a9d4a748) Renamed the default development branch from master to main.

5. (574f5683) Allowed PCRE2_NO_UTF_CHECK to differ between an existing match
and pcre2_substitute() with PCRE2_SUBSTITUTE_MATCHED, instead of returning
PCRE2_ERROR_DIFFSUBSOPTIONS.

6. (#841) Fixed incorrect compilation and matching of character classes that
combine characters from multiple internal ranges, including characters at or
below U+00FF together with characters at U+0100 and U+8000 or above.

7. (#849) Reduced the memory used by each pcre2_match() heap frame by shrinking
temporary fields.

8. (#852) Added interpreter and JIT support for possessive repeats of
backreferences.

9. (#857) Fixed a regression in pcre2_substitute() that mishandled repeated
backslash escapes in extended replacement strings.

10. (#858) Added improvements to pcre2_substitute(). Support for partial matches
with PCRE2_SUBSTITUTE_REPLACEMENT_ONLY added, and added
PCRE2_ERROR_PARTIALSUBS for replacements containing $' or $_ which cannot be
expanded for partial matches.

11. (#859, 30c9faa4) Expanded pcre2-config's recognition of system library
directories on Linux (multilib and multiarch), and AIX and Solaris, avoiding
unnecessary -L options.

12. (#875) Fixed a stale repeat value while constructing JIT scan prefixes,
which could cause missed matches when a prefix was followed by a bounded
character-class repeat with a zero minimum.

13. (#879) Fixed build warnings in pcre2grep with C23 and glibc 2.43, by retaining
const qualifiers from strstr() and strchr().

14. (#883) Prevented generator expressions inherited from a parent CMake
project from entering CMAKE_REQUIRED_DEFINITIONS during configuration checks.

15. (#884, #880) Made symbol-version scripts platform-specific, fixing Solaris SPARC
symbol versioning.

16. (#888) Fixed memory leaks and stale-pointer double frees when
pcre2_deserialize_decode() rejects an invalid block size.

17. (#894) Updated Zig's build.zig, including exported headers, hidden symbol
visibility, and sanitizer support.

18. (#893) Changed pcre2test builds to detect setrlimit() instead of relying on
a hard-coded platform list.

19. (#907) Added support for installing PCRE2 directly with `zig fetch`,
including a Zig package manifest and release integration.

20. (#912) Fixed a JIT-specific bug in variable-length lookbehinds which caused
incorrect match results during backtracking.

21. (#863) Added a five-year support lifecycle policy and publication of backport
patches for security and high-s

[Changelog truncated as it exceeds 3000 characters;
the full changelog can be found in an attachment to the AUH email]
---
 .../libpcre/{libpcre2_10.47.bb => libpcre2_10.48.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/libpcre/{libpcre2_10.47.bb => libpcre2_10.48.bb} (96%)

diff --git a/meta/recipes-support/libpcre/libpcre2_10.47.bb b/meta/recipes-support/libpcre/libpcre2_10.48.bb
similarity index 96%
rename from meta/recipes-support/libpcre/libpcre2_10.47.bb
rename to meta/recipes-support/libpcre/libpcre2_10.48.bb
index 35330845d1..d5daff03c0 100644
--- a/meta/recipes-support/libpcre/libpcre2_10.47.bb
+++ b/meta/recipes-support/libpcre/libpcre2_10.48.bb
@@ -19,7 +19,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/pcre2-${PV}/pcre2-${PV}.tar.bz2 \
 GITHUB_BASE_URI = "https://github.com/PCRE2Project/pcre2/releases"
 UPSTREAM_CHECK_REGEX = "releases/tag/pcre2-(?P<pver>\d+(\.\d+)+)$"
 
-SRC_URI[sha256sum] = "47fe8c99461250d42f89e6e8fdaeba9da057855d06eb7fc08d9ca03fd08d7bc7"
+SRC_URI[sha256sum] = "b6c68fdf6f3ac31388b50aa89ff0fc49c00c987c16e7b5146491d12003f2c8ed"
 
 CVE_PRODUCT = "pcre2"
 
-- 
2.47.1


--===============7630524407755219440==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/libpcre2: PV changed from "10.47" to "10.48"
packages/x86-64-v3-poky-linux/libpcre2: PKGV changed from 10.47 [default] to 10.48 [default]
packages/x86-64-v3-poky-linux/libpcre2: SRC_URI changed from "https://github.com/PCRE2Project/pcre2/releases/download/pcre2-10.47/pcre2-10.47.tar.bz2 file://run-ptest" to "https://github.com/PCRE2Project/pcre2/releases/download/pcre2-10.48/pcre2-10.48.tar.bz2 file://run-ptest"
packages/x86-64-v3-poky-linux/libpcre2/libpcre2-16: PV changed from "10.47" to "10.48"
packages/x86-64-v3-poky-linux/libpcre2/libpcre2-16: PKGV changed from 10.47 [default] to 10.48 [default]
packages/x86-64-v3-poky-linux/libpcre2/libpcre2-16: FILELIST: removed "/usr/lib/libpcre2-16.so.0.15.0", added "/usr/lib/libpcre2-16.so.0.16.0"
packages/x86-64-v3-poky-linux/libpcre2/libpcre2-32: PV changed from "10.47" to "10.48"
packages/x86-64-v3-poky-linux/libpcre2/libpcre2-32: PKGV changed from 10.47 [default] to 10.48 [default]
packages/x86-64-v3-poky-linux/libpcre2/libpcre2-32: FILELIST: removed "/usr/lib/libpcre2-32.so.0.15.0", added "/usr/lib/libpcre2-32.so.0.16.0"
packages/x86-64-v3-poky-linux/libpcre2/libpcre2-dbg: PV changed from "10.47" to "10.48"
packages/x86-64-v3-poky-linux/libpcre2/libpcre2-dbg: PKGV changed from 10.47 [default] to 10.48 [default]
packages/x86-64-v3-poky-linux/libpcre2/libpcre2-dbg: PKGSIZE changed from 4361872 to 4418400 (+1%)
packages/x86-64-v3-poky-linux/libpcre2/libpcre2-dbg: FILELIST: removed "/usr/lib/.debug/libpcre2-16.so.0.15.0 /usr/lib/.debug/libpcre2-8.so.0.15.0 /usr/lib/.debug/libpcre2-32.so.0.15.0 /usr/lib/.debug/libpcre2-posix.so.3.0.7", added "/usr/lib/.debug/libpcre2-posix.so.3.0.8 /usr/lib/.debug/libpcre2-32.so.0.16.0 /usr/lib/.debug/libpcre2-16.so.0.16.0 /usr/lib/.debug/libpcre2-8.so.0.16.0"
packages/x86-64-v3-poky-linux/libpcre2/libpcre2-dev: PV changed from "10.47" to "10.48"
packages/x86-64-v3-poky-linux/libpcre2/libpcre2-dev: PKGV changed from 10.47 [default] to 10.48 [default]
packages/x86-64-v3-poky-linux/libpcre2/libpcre2-dev: PKGSIZE changed from 60872 to 60916 (+0%)
packages/x86-64-v3-poky-linux/libpcre2/libpcre2-doc: PV changed from "10.47" to "10.48"
packages/x86-64-v3-poky-linux/libpcre2/libpcre2-doc: PKGV changed from 10.47 [default] to 10.48 [default]
packages/x86-64-v3-poky-linux/libpcre2/libpcre2-doc: PKGSIZE changed from 2827983 to 2865434 (+1%)
packages/x86-64-v3-poky-linux/libpcre2/libpcre2-doc: FILELIST: added "/usr/share/doc/pcre2/SUPPORT-LIFECYCLE.md"
packages/x86-64-v3-poky-linux/libpcre2/libpcre2-locale: PV changed from "10.47" to "10.48"
packages/x86-64-v3-poky-linux/libpcre2/libpcre2-locale: PKGV changed from 10.47 [default] to 10.48 [default]
packages/x86-64-v3-poky-linux/libpcre2/libpcre2-ptest: PV changed from "10.47" to "10.48"
packages/x86-64-v3-poky-linux/libpcre2/libpcre2-ptest: PKGV changed from 10.47 [default] to 10.48 [default]
packages/x86-64-v3-poky-linux/libpcre2/libpcre2-ptest: PKGSIZE changed from 3390317 to 3421873 (+1%)
packages/x86-64-v3-poky-linux/libpcre2/libpcre2-src: PV changed from "10.47" to "10.48"
packages/x86-64-v3-poky-linux/libpcre2/libpcre2-src: PKGV changed from 10.47 [default] to 10.48 [default]
packages/x86-64-v3-poky-linux/libpcre2/libpcre2-src: PKGSIZE changed from 2894984 to 2925848 (+1%)
packages/x86-64-v3-poky-linux/libpcre2/libpcre2-src: FILELIST: directory renamed /usr/src/debug/libpcre2/10.47/src -> /usr/src/debug/libpcre2/10.48/src
packages/x86-64-v3-poky-linux/libpcre2/libpcre2-staticdev: PV changed from "10.47" to "10.48"
packages/x86-64-v3-poky-linux/libpcre2/libpcre2-staticdev: PKGV changed from 10.47 [default] to 10.48 [default]
packages/x86-64-v3-poky-linux/libpcre2/libpcre2: PV changed from "10.47" to "10.48"
packages/x86-64-v3-poky-linux/libpcre2/libpcre2: PKGV changed from 10.47 [default] to 10.48 [default]
packages/x86-64-v3-poky-linux/libpcre2/libpcre2: FILELIST: removed "/usr/lib/libpcre2-8.so.0.15.0 /usr/lib/libpcre2-posix.so.3.0.7", added "/usr/lib/libpcre2-posix.so.3.0.8 /usr/lib/libpcre2-8.so.0.16.0"
packages/x86-64-v3-poky-linux/libpcre2/pcre2grep-doc: PV changed from "10.47" to "10.48"
packages/x86-64-v3-poky-linux/libpcre2/pcre2grep-doc: PKGV changed from 10.47 [default] to 10.48 [default]
packages/x86-64-v3-poky-linux/libpcre2/pcre2grep: PV changed from "10.47" to "10.48"
packages/x86-64-v3-poky-linux/libpcre2/pcre2grep: PKGV changed from 10.47 [default] to 10.48 [default]
packages/x86-64-v3-poky-linux/libpcre2/pcre2test-doc: PV changed from "10.47" to "10.48"
packages/x86-64-v3-poky-linux/libpcre2/pcre2test-doc: PKGV changed from 10.47 [default] to 10.48 [default]
packages/x86-64-v3-poky-linux/libpcre2/pcre2test-doc: PKGSIZE changed from 97211 to 97354 (+0%)
packages/x86-64-v3-poky-linux/libpcre2/pcre2test: PV changed from "10.47" to "10.48"
packages/x86-64-v3-poky-linux/libpcre2/pcre2test: PKGV changed from 10.47 [default] to 10.48 [default]
packages/x86-64-v3-poky-linux/libpcre2/pcre2test: PKGSIZE changed from 292848 to 296944 (+1%)
Changes to packages/x86-64-v3-poky-linux/libpcre2 (sysroot):
  /usr/lib/libpcre2-16.so.0 changed symlink target from libpcre2-16.so.0.15.0 to libpcre2-16.so.0.16.0
  /usr/lib/libpcre2-16.so changed symlink target from libpcre2-16.so.0.15.0 to libpcre2-16.so.0.16.0
  /usr/lib/libpcre2-32.so.0 changed symlink target from libpcre2-32.so.0.15.0 to libpcre2-32.so.0.16.0
  /usr/lib/libpcre2-32.so changed symlink target from libpcre2-32.so.0.15.0 to libpcre2-32.so.0.16.0
  /usr/lib/libpcre2-8.so.0 changed symlink target from libpcre2-8.so.0.15.0 to libpcre2-8.so.0.16.0
  /usr/lib/libpcre2-8.so changed symlink target from libpcre2-8.so.0.15.0 to libpcre2-8.so.0.16.0
  /usr/lib/libpcre2-posix.so.3 changed symlink target from libpcre2-posix.so.3.0.7 to libpcre2-posix.so.3.0.8
  /usr/lib/libpcre2-posix.so changed symlink target from libpcre2-posix.so.3.0.7 to libpcre2-posix.so.3.0.8
  /usr/lib/libpcre2-8.so.0.15.0 moved to /usr/lib/libpcre2-8.so.0.16.0
  /usr/lib/libpcre2-posix.so.3.0.7 moved to /usr/lib/libpcre2-posix.so.3.0.8
  /usr/lib/libpcre2-16.so.0.16.0 was added
  /usr/lib/libpcre2-32.so.0.16.0 was added
  /usr/lib/libpcre2-16.so.0.15.0 was removed
  /usr/lib/libpcre2-32.so.0.15.0 was removed
Changes to packages/x86_64-linux/libpcre2-native (sysroot):
  /usr/lib/libpcre2-16.so.0 changed symlink target from libpcre2-16.so.0.15.0 to libpcre2-16.so.0.16.0
  /usr/lib/libpcre2-16.so changed symlink target from libpcre2-16.so.0.15.0 to libpcre2-16.so.0.16.0
  /usr/lib/libpcre2-32.so.0 changed symlink target from libpcre2-32.so.0.15.0 to libpcre2-32.so.0.16.0
  /usr/lib/libpcre2-32.so changed symlink target from libpcre2-32.so.0.15.0 to libpcre2-32.so.0.16.0
  /usr/lib/libpcre2-8.so.0 changed symlink target from libpcre2-8.so.0.15.0 to libpcre2-8.so.0.16.0
  /usr/lib/libpcre2-8.so changed symlink target from libpcre2-8.so.0.15.0 to libpcre2-8.so.0.16.0
  /usr/lib/libpcre2-posix.so.3 changed symlink target from libpcre2-posix.so.3.0.7 to libpcre2-posix.so.3.0.8
  /usr/lib/libpcre2-posix.so changed symlink target from libpcre2-posix.so.3.0.7 to libpcre2-posix.so.3.0.8
  /usr/lib/libpcre2-8.so.0.15.0 moved to /usr/lib/libpcre2-8.so.0.16.0
  /usr/lib/libpcre2-posix.so.3.0.7 moved to /usr/lib/libpcre2-posix.so.3.0.8
  /usr/lib/libpcre2-16.so.0.16.0 was added
  /usr/lib/libpcre2-32.so.0.16.0 was added
  /usr/lib/libpcre2-16.so.0.15.0 was removed
  /usr/lib/libpcre2-32.so.0.15.0 was removed

--===============7630524407755219440==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libpcre2-upgrade-10.47-10.48.patch"

RnJvbSBlZDc4MDVmODRkNjcwNTZiOTgwNjE4NThjZjQwMjAyMjM4YzM1ZGRlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMSBTZXAgMjAyNiAwNTo1MzowNCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGxp
YnBjcmUyOiB1cGdyYWRlIDEwLjQ3IC0+IDEwLjQ4CgpTb3VyY2U6IENoYW5nZUxvZwoKVmVyc2lv
biAxMC40OCAzMS1BdWd1c3QtMjAyNgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCgoxLiAo
IzgyNikgW0dIU0EtcTdydy1yN3FxLTJoeDZdIEluaXRpYWxpemVkIGFsaWdubWVudCBwYWRkaW5n
IGluIHNlcmlhbGl6ZWQKY2hhcmFjdGVyIGxpc3RzIHNvIHRoYXQgcGNyZTJfc2VyaWFsaXplX2Vu
Y29kZSgpIGRvZXMgbm90IGV4cG9zZSB0d28KdW5pbml0aWFsaXNlZCBieXRlcyBmcm9tIG1hbGxv
YygpLgoKMi4gKCM4MjUpIEZpeGVkIHRoZSBjYXNpbmcgb2YgQ01ha2UgcGFja2FnZSB2YXJpYWJs
ZXMgYW5kIGNvcnJlY3RlZApSZWFkbGluZS9uY3Vyc2VzIGxpbmthZ2UuCgozLiAoIzgzMCkgVXBk
YXRlZCBVbmljb2RlIHN1cHBvcnQgdG8gVW5pY29kZSAxNy4wLCBpbmNsdWRpbmcgbmV3IHNjcmlw
dHMsCmNoYXJhY3RlcnMsIHByb3BlcnRpZXMsIGNhc2UgbWFwcGluZ3MsIGFuZCBlbW9qaSBkYXRh
LgoKNC4gKGE5ZDRhNzQ4KSBSZW5hbWVkIHRoZSBkZWZhdWx0IGRldmVsb3BtZW50IGJyYW5jaCBm
cm9tIG1hc3RlciB0byBtYWluLgoKNS4gKDU3NGY1NjgzKSBBbGxvd2VkIFBDUkUyX05PX1VURl9D
SEVDSyB0byBkaWZmZXIgYmV0d2VlbiBhbiBleGlzdGluZyBtYXRjaAphbmQgcGNyZTJfc3Vic3Rp
dHV0ZSgpIHdpdGggUENSRTJfU1VCU1RJVFVURV9NQVRDSEVELCBpbnN0ZWFkIG9mIHJldHVybmlu
ZwpQQ1JFMl9FUlJPUl9ESUZGU1VCU09QVElPTlMuCgo2LiAoIzg0MSkgRml4ZWQgaW5jb3JyZWN0
IGNvbXBpbGF0aW9uIGFuZCBtYXRjaGluZyBvZiBjaGFyYWN0ZXIgY2xhc3NlcyB0aGF0CmNvbWJp
bmUgY2hhcmFjdGVycyBmcm9tIG11bHRpcGxlIGludGVybmFsIHJhbmdlcywgaW5jbHVkaW5nIGNo
YXJhY3RlcnMgYXQgb3IKYmVsb3cgVSswMEZGIHRvZ2V0aGVyIHdpdGggY2hhcmFjdGVycyBhdCBV
KzAxMDAgYW5kIFUrODAwMCBvciBhYm92ZS4KCjcuICgjODQ5KSBSZWR1Y2VkIHRoZSBtZW1vcnkg
dXNlZCBieSBlYWNoIHBjcmUyX21hdGNoKCkgaGVhcCBmcmFtZSBieSBzaHJpbmtpbmcKdGVtcG9y
YXJ5IGZpZWxkcy4KCjguICgjODUyKSBBZGRlZCBpbnRlcnByZXRlciBhbmQgSklUIHN1cHBvcnQg
Zm9yIHBvc3Nlc3NpdmUgcmVwZWF0cyBvZgpiYWNrcmVmZXJlbmNlcy4KCjkuICgjODU3KSBGaXhl
ZCBhIHJlZ3Jlc3Npb24gaW4gcGNyZTJfc3Vic3RpdHV0ZSgpIHRoYXQgbWlzaGFuZGxlZCByZXBl
YXRlZApiYWNrc2xhc2ggZXNjYXBlcyBpbiBleHRlbmRlZCByZXBsYWNlbWVudCBzdHJpbmdzLgoK
MTAuICgjODU4KSBBZGRlZCBpbXByb3ZlbWVudHMgdG8gcGNyZTJfc3Vic3RpdHV0ZSgpLiBTdXBw
b3J0IGZvciBwYXJ0aWFsIG1hdGNoZXMKd2l0aCBQQ1JFMl9TVUJTVElUVVRFX1JFUExBQ0VNRU5U
X09OTFkgYWRkZWQsIGFuZCBhZGRlZApQQ1JFMl9FUlJPUl9QQVJUSUFMU1VCUyBmb3IgcmVwbGFj
ZW1lbnRzIGNvbnRhaW5pbmcgJCcgb3IgJF8gd2hpY2ggY2Fubm90IGJlCmV4cGFuZGVkIGZvciBw
YXJ0aWFsIG1hdGNoZXMuCgoxMS4gKCM4NTksIDMwYzlmYWE0KSBFeHBhbmRlZCBwY3JlMi1jb25m
aWcncyByZWNvZ25pdGlvbiBvZiBzeXN0ZW0gbGlicmFyeQpkaXJlY3RvcmllcyBvbiBMaW51eCAo
bXVsdGlsaWIgYW5kIG11bHRpYXJjaCksIGFuZCBBSVggYW5kIFNvbGFyaXMsIGF2b2lkaW5nCnVu
bmVjZXNzYXJ5IC1MIG9wdGlvbnMuCgoxMi4gKCM4NzUpIEZpeGVkIGEgc3RhbGUgcmVwZWF0IHZh
bHVlIHdoaWxlIGNvbnN0cnVjdGluZyBKSVQgc2NhbiBwcmVmaXhlcywKd2hpY2ggY291bGQgY2F1
c2UgbWlzc2VkIG1hdGNoZXMgd2hlbiBhIHByZWZpeCB3YXMgZm9sbG93ZWQgYnkgYSBib3VuZGVk
CmNoYXJhY3Rlci1jbGFzcyByZXBlYXQgd2l0aCBhIHplcm8gbWluaW11bS4KCjEzLiAoIzg3OSkg
Rml4ZWQgYnVpbGQgd2FybmluZ3MgaW4gcGNyZTJncmVwIHdpdGggQzIzIGFuZCBnbGliYyAyLjQz
LCBieSByZXRhaW5pbmcKY29uc3QgcXVhbGlmaWVycyBmcm9tIHN0cnN0cigpIGFuZCBzdHJjaHIo
KS4KCjE0LiAoIzg4MykgUHJldmVudGVkIGdlbmVyYXRvciBleHByZXNzaW9ucyBpbmhlcml0ZWQg
ZnJvbSBhIHBhcmVudCBDTWFrZQpwcm9qZWN0IGZyb20gZW50ZXJpbmcgQ01BS0VfUkVRVUlSRURf
REVGSU5JVElPTlMgZHVyaW5nIGNvbmZpZ3VyYXRpb24gY2hlY2tzLgoKMTUuICgjODg0LCAjODgw
KSBNYWRlIHN5bWJvbC12ZXJzaW9uIHNjcmlwdHMgcGxhdGZvcm0tc3BlY2lmaWMsIGZpeGluZyBT
b2xhcmlzIFNQQVJDCnN5bWJvbCB2ZXJzaW9uaW5nLgoKMTYuICgjODg4KSBGaXhlZCBtZW1vcnkg
bGVha3MgYW5kIHN0YWxlLXBvaW50ZXIgZG91YmxlIGZyZWVzIHdoZW4KcGNyZTJfZGVzZXJpYWxp
emVfZGVjb2RlKCkgcmVqZWN0cyBhbiBpbnZhbGlkIGJsb2NrIHNpemUuCgoxNy4gKCM4OTQpIFVw
ZGF0ZWQgWmlnJ3MgYnVpbGQuemlnLCBpbmNsdWRpbmcgZXhwb3J0ZWQgaGVhZGVycywgaGlkZGVu
IHN5bWJvbAp2aXNpYmlsaXR5LCBhbmQgc2FuaXRpemVyIHN1cHBvcnQuCgoxOC4gKCM4OTMpIENo
YW5nZWQgcGNyZTJ0ZXN0IGJ1aWxkcyB0byBkZXRlY3Qgc2V0cmxpbWl0KCkgaW5zdGVhZCBvZiBy
ZWx5aW5nIG9uCmEgaGFyZC1jb2RlZCBwbGF0Zm9ybSBsaXN0LgoKMTkuICgjOTA3KSBBZGRlZCBz
dXBwb3J0IGZvciBpbnN0YWxsaW5nIFBDUkUyIGRpcmVjdGx5IHdpdGggYHppZyBmZXRjaGAsCmlu
Y2x1ZGluZyBhIFppZyBwYWNrYWdlIG1hbmlmZXN0IGFuZCByZWxlYXNlIGludGVncmF0aW9uLgoK
MjAuICgjOTEyKSBGaXhlZCBhIEpJVC1zcGVjaWZpYyBidWcgaW4gdmFyaWFibGUtbGVuZ3RoIGxv
b2tiZWhpbmRzIHdoaWNoIGNhdXNlZAppbmNvcnJlY3QgbWF0Y2ggcmVzdWx0cyBkdXJpbmcgYmFj
a3RyYWNraW5nLgoKMjEuICgjODYzKSBBZGRlZCBhIGZpdmUteWVhciBzdXBwb3J0IGxpZmVjeWNs
ZSBwb2xpY3kgYW5kIHB1YmxpY2F0aW9uIG9mIGJhY2twb3J0CnBhdGNoZXMgZm9yIHNlY3VyaXR5
IGFuZCBoaWdoLXMKCltDaGFuZ2Vsb2cgdHJ1bmNhdGVkIGFzIGl0IGV4Y2VlZHMgMzAwMCBjaGFy
YWN0ZXJzOwp0aGUgZnVsbCBjaGFuZ2Vsb2cgY2FuIGJlIGZvdW5kIGluIGFuIGF0dGFjaG1lbnQg
dG8gdGhlIEFVSCBlbWFpbF0KLS0tCiAuLi4vbGlicGNyZS97bGlicGNyZTJfMTAuNDcuYmIgPT4g
bGlicGNyZTJfMTAuNDguYmJ9ICAgICAgICAgICAgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBp
bnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtc3VwcG9ydC9s
aWJwY3JlL3tsaWJwY3JlMl8xMC40Ny5iYiA9PiBsaWJwY3JlMl8xMC40OC5iYn0gKDk2JSkKCmRp
ZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJwY3JlL2xpYnBjcmUyXzEwLjQ3LmJi
IGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGlicGNyZS9saWJwY3JlMl8xMC40OC5iYgpzaW1pbGFy
aXR5IGluZGV4IDk2JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJwY3JlL2xp
YnBjcmUyXzEwLjQ3LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJwY3JlL2xp
YnBjcmUyXzEwLjQ4LmJiCmluZGV4IDM1MzMwODQ1ZDEuLmQ1ZGFmZjAzYzAgMTAwNjQ0Ci0tLSBh
L21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYnBjcmUvbGlicGNyZTJfMTAuNDcuYmIKKysrIGIvbWV0
YS9yZWNpcGVzLXN1cHBvcnQvbGlicGNyZS9saWJwY3JlMl8xMC40OC5iYgpAQCAtMTksNyArMTks
NyBAQCBTUkNfVVJJID0gIiR7R0lUSFVCX0JBU0VfVVJJfS9kb3dubG9hZC9wY3JlMi0ke1BWfS9w
Y3JlMi0ke1BWfS50YXIuYnoyIFwKIEdJVEhVQl9CQVNFX1VSSSA9ICJodHRwczovL2dpdGh1Yi5j
b20vUENSRTJQcm9qZWN0L3BjcmUyL3JlbGVhc2VzIgogVVBTVFJFQU1fQ0hFQ0tfUkVHRVggPSAi
cmVsZWFzZXMvdGFnL3BjcmUyLSg/UDxwdmVyPlxkKyhcLlxkKykrKSQiCiAKLVNSQ19VUklbc2hh
MjU2c3VtXSA9ICI0N2ZlOGM5OTQ2MTI1MGQ0MmY4OWU2ZThmZGFlYmE5ZGEwNTc4NTVkMDZlYjdm
YzA4ZDljYTAzZmQwOGQ3YmM3IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gImI2YzY4ZmRmNmYzYWMz
MTM4OGI1MGFhODlmZjBmYzQ5YzAwYzk4N2MxNmU3YjUxNDY0OTFkMTIwMDNmMmM4ZWQiCiAKIENW
RV9QUk9EVUNUID0gInBjcmUyIgogCi0tIAoyLjQ3LjEKCg==

--===============7630524407755219440==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/libpcre2/libpcre2-16: FILELIST: removed "/usr/lib/libpcre2-16.so.0.15.0", added "/usr/lib/libpcre2-16.so.0.16.0"
packages/x86-64-v3-poky-linux/libpcre2/libpcre2-32: FILELIST: removed "/usr/lib/libpcre2-32.so.0.15.0", added "/usr/lib/libpcre2-32.so.0.16.0"
packages/x86-64-v3-poky-linux/libpcre2/libpcre2-doc: FILELIST: added "/usr/share/doc/pcre2/SUPPORT-LIFECYCLE.md"
packages/x86-64-v3-poky-linux/libpcre2/libpcre2: FILELIST: removed "/usr/lib/libpcre2-posix.so.3.0.7 /usr/lib/libpcre2-8.so.0.15.0", added "/usr/lib/libpcre2-8.so.0.16.0 /usr/lib/libpcre2-posix.so.3.0.8"
Changes to packages/x86-64-v3-poky-linux/libpcre2 (sysroot):
  /usr/lib/libpcre2-16.so.0 changed symlink target from libpcre2-16.so.0.15.0 to libpcre2-16.so.0.16.0
  /usr/lib/libpcre2-16.so changed symlink target from libpcre2-16.so.0.15.0 to libpcre2-16.so.0.16.0
  /usr/lib/libpcre2-32.so.0 changed symlink target from libpcre2-32.so.0.15.0 to libpcre2-32.so.0.16.0
  /usr/lib/libpcre2-32.so changed symlink target from libpcre2-32.so.0.15.0 to libpcre2-32.so.0.16.0
  /usr/lib/libpcre2-8.so.0 changed symlink target from libpcre2-8.so.0.15.0 to libpcre2-8.so.0.16.0
  /usr/lib/libpcre2-8.so changed symlink target from libpcre2-8.so.0.15.0 to libpcre2-8.so.0.16.0
  /usr/lib/libpcre2-posix.so.3 changed symlink target from libpcre2-posix.so.3.0.7 to libpcre2-posix.so.3.0.8
  /usr/lib/libpcre2-posix.so changed symlink target from libpcre2-posix.so.3.0.7 to libpcre2-posix.so.3.0.8
  /usr/lib/libpcre2-8.so.0.15.0 moved to /usr/lib/libpcre2-8.so.0.16.0
  /usr/lib/libpcre2-posix.so.3.0.7 moved to /usr/lib/libpcre2-posix.so.3.0.8
  /usr/lib/libpcre2-16.so.0.16.0 was added
  /usr/lib/libpcre2-32.so.0.16.0 was added
  /usr/lib/libpcre2-16.so.0.15.0 was removed
  /usr/lib/libpcre2-32.so.0.15.0 was removed
Changes to packages/x86_64-linux/libpcre2-native (sysroot):
  /usr/lib/libpcre2-16.so.0 changed symlink target from libpcre2-16.so.0.15.0 to libpcre2-16.so.0.16.0
  /usr/lib/libpcre2-16.so changed symlink target from libpcre2-16.so.0.15.0 to libpcre2-16.so.0.16.0
  /usr/lib/libpcre2-32.so.0 changed symlink target from libpcre2-32.so.0.15.0 to libpcre2-32.so.0.16.0
  /usr/lib/libpcre2-32.so changed symlink target from libpcre2-32.so.0.15.0 to libpcre2-32.so.0.16.0
  /usr/lib/libpcre2-8.so.0 changed symlink target from libpcre2-8.so.0.15.0 to libpcre2-8.so.0.16.0
  /usr/lib/libpcre2-8.so changed symlink target from libpcre2-8.so.0.15.0 to libpcre2-8.so.0.16.0
  /usr/lib/libpcre2-posix.so.3 changed symlink target from libpcre2-posix.so.3.0.7 to libpcre2-posix.so.3.0.8
  /usr/lib/libpcre2-posix.so changed symlink target from libpcre2-posix.so.3.0.7 to libpcre2-posix.so.3.0.8
  /usr/lib/libpcre2-8.so.0.15.0 moved to /usr/lib/libpcre2-8.so.0.16.0
  /usr/lib/libpcre2-posix.so.3.0.7 moved to /usr/lib/libpcre2-posix.so.3.0.8
  /usr/lib/libpcre2-16.so.0.16.0 was added
  /usr/lib/libpcre2-32.so.0.16.0 was added
  /usr/lib/libpcre2-16.so.0.15.0 was removed
  /usr/lib/libpcre2-32.so.0.15.0 was removed

--===============7630524407755219440==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="libpcre2-changelog.txt"

Changelog for libpcre2: 10.47 -> 10.48
Source: ChangeLog

Version 10.48 31-August-2026
----------------------------

1. (#826) [GHSA-q7rw-r7qq-2hx6] Initialized alignment padding in serialized
character lists so that pcre2_serialize_encode() does not expose two
uninitialised bytes from malloc().

2. (#825) Fixed the casing of CMake package variables and corrected
Readline/ncurses linkage.

3. (#830) Updated Unicode support to Unicode 17.0, including new scripts,
characters, properties, case mappings, and emoji data.

4. (a9d4a748) Renamed the default development branch from master to main.

5. (574f5683) Allowed PCRE2_NO_UTF_CHECK to differ between an existing match
and pcre2_substitute() with PCRE2_SUBSTITUTE_MATCHED, instead of returning
PCRE2_ERROR_DIFFSUBSOPTIONS.

6. (#841) Fixed incorrect compilation and matching of character classes that
combine characters from multiple internal ranges, including characters at or
below U+00FF together with characters at U+0100 and U+8000 or above.

7. (#849) Reduced the memory used by each pcre2_match() heap frame by shrinking
temporary fields.

8. (#852) Added interpreter and JIT support for possessive repeats of
backreferences.

9. (#857) Fixed a regression in pcre2_substitute() that mishandled repeated
backslash escapes in extended replacement strings.

10. (#858) Added improvements to pcre2_substitute(). Support for partial matches
with PCRE2_SUBSTITUTE_REPLACEMENT_ONLY added, and added
PCRE2_ERROR_PARTIALSUBS for replacements containing $' or $_ which cannot be
expanded for partial matches.

11. (#859, 30c9faa4) Expanded pcre2-config's recognition of system library
directories on Linux (multilib and multiarch), and AIX and Solaris, avoiding
unnecessary -L options.

12. (#875) Fixed a stale repeat value while constructing JIT scan prefixes,
which could cause missed matches when a prefix was followed by a bounded
character-class repeat with a zero minimum.

13. (#879) Fixed build warnings in pcre2grep with C23 and glibc 2.43, by retaining
const qualifiers from strstr() and strchr().

14. (#883) Prevented generator expressions inherited from a parent CMake
project from entering CMAKE_REQUIRED_DEFINITIONS during configuration checks.

15. (#884, #880) Made symbol-version scripts platform-specific, fixing Solaris SPARC
symbol versioning.

16. (#888) Fixed memory leaks and stale-pointer double frees when
pcre2_deserialize_decode() rejects an invalid block size.

17. (#894) Updated Zig's build.zig, including exported headers, hidden symbol
visibility, and sanitizer support.

18. (#893) Changed pcre2test builds to detect setrlimit() instead of relying on
a hard-coded platform list.

19. (#907) Added support for installing PCRE2 directly with `zig fetch`,
including a Zig package manifest and release integration.

20. (#912) Fixed a JIT-specific bug in variable-length lookbehinds which caused
incorrect match results during backtracking.

21. (#863) Added a five-year support lifecycle policy and publication of backport
patches for security and high-severity fixes in older releases.

22. (#937) Fixed a leak and later invalid free when calling the fast-path
pcre2_jit_match() function with a match data object previously used with
pcre2_match() and PCRE2_COPY_MATCHED_SUBJECT. No security advisory, as this is
considered unlikely to affect applications.

23. (#936) Made pcre2grep recognize -- during positional argument processing,
for improved compatibility with GNU grep.

24. (#922) Added support for Zig JIT builds to fetch SLJIT through the Zig
package manager when the Git submodule is absent. The minimum Zig version
is raised to 0.16.0.

25. (#926) [GHSA-2p8c-ff85-vh9x] If pcre2_jit_compile() is called with options
for some match modes, and then pcre2_match() is used to perform a match for a
different match mode, an out-of-bounds read can occur if the match is attempted
against invalid UTF input. The interpreter fallback now performs its own UTF
validation correctly when some JIT match modes have been compiled, but not the
requested mode.

26. (#909) [GHSA-q8g2-wprr-34m9] If pcre2_convert() is called on untrusted input
on platforms with 32-bit size_t, an out-of-bounds heap write can occur.
Additionally, the allocation made was larger than required in common cases.
Added overflow checks for allocations in pattern conversion and substring APIs.

27. (#945) Fixed JIT character advancement with PCRE2_MATCH_INVALID_UTF in
UTF-8 and UTF-16 modes. Valid multi-code-unit characters are now advanced as a
unit, while invalid characters advance by one code unit, preventing adjacent
characters from being skipped.

28. (#948) Fixed one-past-the-end compile error offsets for incomplete \x{,
\o{, and \N{U+ escapes at the end of a pattern.

29. (#947) Clarified documentation for PCRE2_DFA_RESTART, which does not remove
the requirement to retain previously supplied subject data, including sufficient
history for nested lookbehinds.

30. (#942, #954) Fixed pcre2grep handling for \K matches whose end offset precedes
their start offset. Such ranges could previously cause an unsigned match-length
underflow.

31. (#956) Fixed an integer overflow in pcre2grep when advancing multiline
output state, and preserved pending output when crossing lines.

32. (#957) Updated bundled SLJIT with architecture-specific code-generation and
portability fixes.

33. (#958) Fixed CMake installation of MSVC PDB files when
CMAKE_SHARED_LIBRARY_PREFIX_C is customized.

34. (#961, #962) Fixed two compilation issues preventing use of extended
(Boolean) character classes before a lookbehind, or inside a lookaround.

35. (GHSA-3r4p-g7gg-ppmf) Fixed an out-of-bounds write in DFA matching when
using a heap limit; also fixed possible integer overflows which could cause
under-allocation of the workspace.

36. (GHSA-fmgr-6ggq-9859) Added bounds checks for several integer overflows
while compiling patterns on 32-bit CPUs, which could cause under-allocation
followed by out-of-bounds writes.

37. (GHSA-9qww-pwc4-77qq) Applied lower buffer bound to prevent two
out-of-bounds reads while scanning backwards through invalid UTF data with
PCRE2_MATCH_INVALID_UTF.

--===============7630524407755219440==--

