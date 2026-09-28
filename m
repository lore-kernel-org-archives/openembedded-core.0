Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF06BCA5FA1
	for <webhook@archiver.kernel.org>; Mon, 28 Sep 2026 05:17:39 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.50910.1790572653943110134
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Sep 2026 22:17:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=GH1UG/Y5;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=n5JlL2A4;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 010101a0e6726967-4227b568-2ae4-4742-9d5c-4f2575a623e3-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1790572653;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=/yO3lDYIhew37UwikgV2Zg3sb3NnJxANtv67RBxzeak=;
	b=GH1UG/Y5G48zgB96Bz+2ac83Qda/bFSIqahvTfVHZ+z2BiXksy7TkZtxK7WxGPle
	nLVRAn353feIkOes6Mg8vRk6WGdgFEJJBDnPpExFA/RQiMSY28PJSlOPfnLP/ssKUIJ
	ywBjOXN5QNUKS4s6h1kErYlOWJhY+ZDPWaHG9r8Q=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1790572653;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=/yO3lDYIhew37UwikgV2Zg3sb3NnJxANtv67RBxzeak=;
	b=n5JlL2A4rEqXaHsWvljBdQLk5soNZqRLIyruOICmwG1SlbeLgcOz29Ud3ApAbady
	O3RQq27X1TENtLFejBKJ6bzEXo5HLf1xFpWgmaWHw2COb/3LyFcQLoR3Z7H3D4YsGBS
	BaesUVhOUGqCGwjvOrIBxGY94q6H1YEmDwaSrchU=
Content-Type: multipart/mixed; boundary="===============8144723851644875045=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Sumanth Gavini <sumanth.gavini@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] ccache: upgrading to 4.14.1 SUCCEEDED
Message-ID: <010101a0e6726967-4227b568-2ae4-4742-9d5c-4f2575a623e3-000000@us-west-2.amazonses.com>
Date: Mon, 28 Sep 2026 05:17:32 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.09.28-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Sep 2026 05:17:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246726

--===============8144723851644875045==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *ccache* to *4.14.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-ccache-upgrade-4.14-4.14.1.patch
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
From 8e78fb4de0d5a8aaf824ac088c0a66e9afbf8f28 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 28 Sep 2026 05:12:18 +0000
Subject: [PATCH] ccache: upgrade 4.14 -> 4.14.1

== Ccache 4.14.1
Release date: 2026-09-27
=== New deliverables

- Added musl static binary release for Linux s390x. +
  [small]#_[contributed by Ludovic Henry]_#

=== Bug fixes

- Restored storage helper lock compatibility with ccache versions earlier than
  4.14. +
  [small]#_[contributed by Joel Rosdahl]_#

- Fixed lookup of GCC 9+ profile data for object files in subdirectories and
  added support for GCC's `-fprofile-partial-training` option. +
  [small]#_[contributed by Yichen Yan]_#

- Fixed the output location of files produced by GCC's `-fdump-ipa-clones`
  option. +
  [small]#_[contributed by Jiri Slaby]_#

- Fixed hashing of C++20 module files found via Clang's `-fprebuilt-module-path`
  option, preventing false cache hits when a module changes. +
  [small]#_[contributed by Gareth Andrew Lloyd]_#

- Made ccache reject clang-cl's `/clang:` option and MSVC's `/FA` and `/Fa`
  options instead of potentially caching compilations incorrectly. +
  [small]#_[contributed by Joel Rosdahl]_#

- Fixed cleanup of temporary response files on Windows. +
  [small]#_[contributed by Joel Rosdahl]_#

=== Build improvements

- Avoided passing a superfluous `-include` option when building with MSVC. +
  [small]#_[contributed by Joel Rosdahl]_#

=== Test improvements

- Made the `remote_file` and `remote_only` test suites work on Windows. +
  [small]#_[contributed by Joel Rosdahl]_#

- Improved MSVC test failure diagnostics. +
  [small]#_[contributed by Joel Rosdahl]_#

- Improved skip messages for test suites known to fail on Windows. +
  [small]#_[contributed by Joel Rosdahl]_#
---
 .../ccache/{ccache_4.14.bb => ccache_4.14.1.bb}                 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/ccache/{ccache_4.14.bb => ccache_4.14.1.bb} (93%)

diff --git a/meta/recipes-devtools/ccache/ccache_4.14.bb b/meta/recipes-devtools/ccache/ccache_4.14.1.bb
similarity index 93%
rename from meta/recipes-devtools/ccache/ccache_4.14.bb
rename to meta/recipes-devtools/ccache/ccache_4.14.1.bb
index 6d922d8514..4dd8da212c 100644
--- a/meta/recipes-devtools/ccache/ccache_4.14.bb
+++ b/meta/recipes-devtools/ccache/ccache_4.14.1.bb
@@ -16,7 +16,7 @@ DEPENDS = "zstd fmt xxhash"
 
 SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/${BP}.tar.gz"
 
-SRC_URI[sha256sum] = "fca63f36a83fb2f4b3cc4c01b2c7a1cd6e3629e7f7bd1e01a2eb8810f947c5ab"
+SRC_URI[sha256sum] = "dfd2b9e446b2cf68e83e21b25317d8f868de6f1b246c7e99e04d07f4e1b0b97e"
 
 inherit cmake github-releases
 
-- 
2.47.1


--===============8144723851644875045==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="ccache-changelog.txt"

== Ccache 4.14.1
Release date: 2026-09-27
=== New deliverables

- Added musl static binary release for Linux s390x. +
  [small]#_[contributed by Ludovic Henry]_#

=== Bug fixes

- Restored storage helper lock compatibility with ccache versions earlier than
  4.14. +
  [small]#_[contributed by Joel Rosdahl]_#

- Fixed lookup of GCC 9+ profile data for object files in subdirectories and
  added support for GCC's `-fprofile-partial-training` option. +
  [small]#_[contributed by Yichen Yan]_#

- Fixed the output location of files produced by GCC's `-fdump-ipa-clones`
  option. +
  [small]#_[contributed by Jiri Slaby]_#

- Fixed hashing of C++20 module files found via Clang's `-fprebuilt-module-path`
  option, preventing false cache hits when a module changes. +
  [small]#_[contributed by Gareth Andrew Lloyd]_#

- Made ccache reject clang-cl's `/clang:` option and MSVC's `/FA` and `/Fa`
  options instead of potentially caching compilations incorrectly. +
  [small]#_[contributed by Joel Rosdahl]_#

- Fixed cleanup of temporary response files on Windows. +
  [small]#_[contributed by Joel Rosdahl]_#

=== Build improvements

- Avoided passing a superfluous `-include` option when building with MSVC. +
  [small]#_[contributed by Joel Rosdahl]_#

=== Test improvements

- Made the `remote_file` and `remote_only` test suites work on Windows. +
  [small]#_[contributed by Joel Rosdahl]_#

- Improved MSVC test failure diagnostics. +
  [small]#_[contributed by Joel Rosdahl]_#

- Improved skip messages for test suites known to fail on Windows. +
  [small]#_[contributed by Joel Rosdahl]_#

--===============8144723851644875045==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-ccache-upgrade-4.14-4.14.1.patch"

RnJvbSA4ZTc4ZmI0ZGUwZDVhOGFhZjgyNGFjMDg4YzBhNjZlOWFmYmY4ZjI4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMjggU2VwIDIwMjYgMDU6MTI6MTggKzAwMDAKU3ViamVjdDogW1BBVENIXSBj
Y2FjaGU6IHVwZ3JhZGUgNC4xNCAtPiA0LjE0LjEKCj09IENjYWNoZSA0LjE0LjEKUmVsZWFzZSBk
YXRlOiAyMDI2LTA5LTI3Cj09PSBOZXcgZGVsaXZlcmFibGVzCgotIEFkZGVkIG11c2wgc3RhdGlj
IGJpbmFyeSByZWxlYXNlIGZvciBMaW51eCBzMzkweC4gKwogIFtzbWFsbF0jX1tjb250cmlidXRl
ZCBieSBMdWRvdmljIEhlbnJ5XV8jCgo9PT0gQnVnIGZpeGVzCgotIFJlc3RvcmVkIHN0b3JhZ2Ug
aGVscGVyIGxvY2sgY29tcGF0aWJpbGl0eSB3aXRoIGNjYWNoZSB2ZXJzaW9ucyBlYXJsaWVyIHRo
YW4KICA0LjE0LiArCiAgW3NtYWxsXSNfW2NvbnRyaWJ1dGVkIGJ5IEpvZWwgUm9zZGFobF1fIwoK
LSBGaXhlZCBsb29rdXAgb2YgR0NDIDkrIHByb2ZpbGUgZGF0YSBmb3Igb2JqZWN0IGZpbGVzIGlu
IHN1YmRpcmVjdG9yaWVzIGFuZAogIGFkZGVkIHN1cHBvcnQgZm9yIEdDQydzIGAtZnByb2ZpbGUt
cGFydGlhbC10cmFpbmluZ2Agb3B0aW9uLiArCiAgW3NtYWxsXSNfW2NvbnRyaWJ1dGVkIGJ5IFlp
Y2hlbiBZYW5dXyMKCi0gRml4ZWQgdGhlIG91dHB1dCBsb2NhdGlvbiBvZiBmaWxlcyBwcm9kdWNl
ZCBieSBHQ0MncyBgLWZkdW1wLWlwYS1jbG9uZXNgCiAgb3B0aW9uLiArCiAgW3NtYWxsXSNfW2Nv
bnRyaWJ1dGVkIGJ5IEppcmkgU2xhYnldXyMKCi0gRml4ZWQgaGFzaGluZyBvZiBDKysyMCBtb2R1
bGUgZmlsZXMgZm91bmQgdmlhIENsYW5nJ3MgYC1mcHJlYnVpbHQtbW9kdWxlLXBhdGhgCiAgb3B0
aW9uLCBwcmV2ZW50aW5nIGZhbHNlIGNhY2hlIGhpdHMgd2hlbiBhIG1vZHVsZSBjaGFuZ2VzLiAr
CiAgW3NtYWxsXSNfW2NvbnRyaWJ1dGVkIGJ5IEdhcmV0aCBBbmRyZXcgTGxveWRdXyMKCi0gTWFk
ZSBjY2FjaGUgcmVqZWN0IGNsYW5nLWNsJ3MgYC9jbGFuZzpgIG9wdGlvbiBhbmQgTVNWQydzIGAv
RkFgIGFuZCBgL0ZhYAogIG9wdGlvbnMgaW5zdGVhZCBvZiBwb3RlbnRpYWxseSBjYWNoaW5nIGNv
bXBpbGF0aW9ucyBpbmNvcnJlY3RseS4gKwogIFtzbWFsbF0jX1tjb250cmlidXRlZCBieSBKb2Vs
IFJvc2RhaGxdXyMKCi0gRml4ZWQgY2xlYW51cCBvZiB0ZW1wb3JhcnkgcmVzcG9uc2UgZmlsZXMg
b24gV2luZG93cy4gKwogIFtzbWFsbF0jX1tjb250cmlidXRlZCBieSBKb2VsIFJvc2RhaGxdXyMK
Cj09PSBCdWlsZCBpbXByb3ZlbWVudHMKCi0gQXZvaWRlZCBwYXNzaW5nIGEgc3VwZXJmbHVvdXMg
YC1pbmNsdWRlYCBvcHRpb24gd2hlbiBidWlsZGluZyB3aXRoIE1TVkMuICsKICBbc21hbGxdI19b
Y29udHJpYnV0ZWQgYnkgSm9lbCBSb3NkYWhsXV8jCgo9PT0gVGVzdCBpbXByb3ZlbWVudHMKCi0g
TWFkZSB0aGUgYHJlbW90ZV9maWxlYCBhbmQgYHJlbW90ZV9vbmx5YCB0ZXN0IHN1aXRlcyB3b3Jr
IG9uIFdpbmRvd3MuICsKICBbc21hbGxdI19bY29udHJpYnV0ZWQgYnkgSm9lbCBSb3NkYWhsXV8j
CgotIEltcHJvdmVkIE1TVkMgdGVzdCBmYWlsdXJlIGRpYWdub3N0aWNzLiArCiAgW3NtYWxsXSNf
W2NvbnRyaWJ1dGVkIGJ5IEpvZWwgUm9zZGFobF1fIwoKLSBJbXByb3ZlZCBza2lwIG1lc3NhZ2Vz
IGZvciB0ZXN0IHN1aXRlcyBrbm93biB0byBmYWlsIG9uIFdpbmRvd3MuICsKICBbc21hbGxdI19b
Y29udHJpYnV0ZWQgYnkgSm9lbCBSb3NkYWhsXV8jCi0tLQogLi4uL2NjYWNoZS97Y2NhY2hlXzQu
MTQuYmIgPT4gY2NhY2hlXzQuMTQuMS5iYn0gICAgICAgICAgICAgICAgIHwgMiArLQogMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNp
cGVzLWRldnRvb2xzL2NjYWNoZS97Y2NhY2hlXzQuMTQuYmIgPT4gY2NhY2hlXzQuMTQuMS5iYn0g
KDkzJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvY2NhY2hlL2NjYWNoZV80
LjE0LmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2NjYWNoZS9jY2FjaGVfNC4xNC4xLmJiCnNp
bWlsYXJpdHkgaW5kZXggOTMlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9jY2Fj
aGUvY2NhY2hlXzQuMTQuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9jY2FjaGUv
Y2NhY2hlXzQuMTQuMS5iYgppbmRleCA2ZDkyMmQ4NTE0Li40ZGQ4ZGEyMTJjIDEwMDY0NAotLS0g
YS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvY2NhY2hlL2NjYWNoZV80LjE0LmJiCisrKyBiL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9jY2FjaGUvY2NhY2hlXzQuMTQuMS5iYgpAQCAtMTYsNyArMTYsNyBA
QCBERVBFTkRTID0gInpzdGQgZm10IHh4aGFzaCIKIAogU1JDX1VSSSA9ICIke0dJVEhVQl9CQVNF
X1VSSX0vZG93bmxvYWQvdiR7UFZ9LyR7QlB9LnRhci5neiIKIAotU1JDX1VSSVtzaGEyNTZzdW1d
ID0gImZjYTYzZjM2YTgzZmIyZjRiM2NjNGMwMWIyYzdhMWNkNmUzNjI5ZTdmN2JkMWUwMWEyZWI4
ODEwZjk0N2M1YWIiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiZGZkMmI5ZTQ0NmIyY2Y2OGU4M2Uy
MWIyNTMxN2Q4Zjg2OGRlNmYxYjI0NmM3ZTk5ZTA0ZDA3ZjRlMWIwYjk3ZSIKIAogaW5oZXJpdCBj
bWFrZSBnaXRodWItcmVsZWFzZXMKIAotLSAKMi40Ny4xCgo=

--===============8144723851644875045==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/ccache/ccache-dbg: PKGV changed from 4.14 [default] to 4.14.1 [default]
packages/x86-64-v3-poky-linux/ccache/ccache-dbg: PV changed from "4.14" to "4.14.1"
packages/x86-64-v3-poky-linux/ccache/ccache-dbg: PKGSIZE changed from 42017296 to 42233328 (+1%)
packages/x86-64-v3-poky-linux/ccache/ccache-dev: PKGV changed from 4.14 [default] to 4.14.1 [default]
packages/x86-64-v3-poky-linux/ccache/ccache-dev: PV changed from "4.14" to "4.14.1"
packages/x86-64-v3-poky-linux/ccache/ccache-doc: PKGV changed from 4.14 [default] to 4.14.1 [default]
packages/x86-64-v3-poky-linux/ccache/ccache-doc: PV changed from "4.14" to "4.14.1"
packages/x86-64-v3-poky-linux/ccache/ccache-locale: PKGV changed from 4.14 [default] to 4.14.1 [default]
packages/x86-64-v3-poky-linux/ccache/ccache-locale: PV changed from "4.14" to "4.14.1"
packages/x86-64-v3-poky-linux/ccache/ccache-src: PKGV changed from 4.14 [default] to 4.14.1 [default]
packages/x86-64-v3-poky-linux/ccache/ccache-src: PV changed from "4.14" to "4.14.1"
packages/x86-64-v3-poky-linux/ccache/ccache-src: FILELIST: directory renamed /usr/src/debug/ccache/4.14/src/ccache/storage/remote -> /usr/src/debug/ccache/4.14.1/src/ccache/storage/remote, directory renamed /usr/src/debug/ccache/4.14/src/ccache/compiler -> /usr/src/debug/ccache/4.14.1/src/ccache/compiler, directory renamed /usr/src/debug/ccache/4.14/src/ccache/storage -> /usr/src/debug/ccache/4.14.1/src/ccache/storage, directory renamed /usr/src/debug/ccache/4.14/src/ccache/storage/local -> /usr/src/debug/ccache/4.14.1/src/ccache/storage/local, directory renamed /usr/src/debug/ccache/4.14/src/third_party/cpp-httplib -> /usr/src/debug/ccache/4.14.1/src/third_party/cpp-httplib, directory renamed /usr/src/debug/ccache/4.14/src/ccache/util -> /usr/src/debug/ccache/4.14.1/src/ccache/util, directory renamed /usr/src/debug/ccache/4.14/src/third_party/cxxurl/cxxurl -> /usr/src/debug/ccache/4.14.1/src/third_party/cxxurl/cxxurl, directory renamed /usr/src/debug/ccache/4.14/src/ccache/core -> /
 usr/src/debug/ccache/4.14.1/src/ccache/core, directory renamed /usr/src/debug/ccache/4.14/src/third_party/tl-expected/tl -> /usr/src/debug/ccache/4.14.1/src/third_party/tl-expected/tl, directory renamed /usr/src/debug/ccache/4.14/src/ccache -> /usr/src/debug/ccache/4.14.1/src/ccache, directory renamed /usr/src/debug/ccache/4.14/src/third_party/blake3/blake3 -> /usr/src/debug/ccache/4.14.1/src/third_party/blake3/blake3
packages/x86-64-v3-poky-linux/ccache/ccache-src: PKGSIZE changed from 1871899 to 1876310 (+0%)
packages/x86-64-v3-poky-linux/ccache/ccache-staticdev: PKGV changed from 4.14 [default] to 4.14.1 [default]
packages/x86-64-v3-poky-linux/ccache/ccache-staticdev: PV changed from "4.14" to "4.14.1"
packages/x86-64-v3-poky-linux/ccache/ccache: PKGV changed from 4.14 [default] to 4.14.1 [default]
packages/x86-64-v3-poky-linux/ccache/ccache: PV changed from "4.14" to "4.14.1"
packages/x86-64-v3-poky-linux/ccache/ccache: PKGSIZE changed from 2107944 to 2120232 (+1%)
packages/x86-64-v3-poky-linux/ccache: PKGV changed from 4.14 [default] to 4.14.1 [default]
packages/x86-64-v3-poky-linux/ccache: PV changed from "4.14" to "4.14.1"
packages/x86-64-v3-poky-linux/ccache: SRC_URI changed from "https://github.com/ccache/ccache/releases//download/v4.14/ccache-4.14.tar.gz" to "https://github.com/ccache/ccache/releases//download/v4.14.1/ccache-4.14.1.tar.gz"

--===============8144723851644875045==--

