Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5B0CC5DF72
	for <webhook@archiver.kernel.org>; Fri, 14 Aug 2026 06:36:47 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7572.1786689406601564117
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Aug 2026 23:36:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=X6u0axHw;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=cnXTmgx6;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101019ffefcc38b-7eeecbfa-f877-4e01-bba7-15e8af8cc88f-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1786689406;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=xs5MAHsV1rttCJTNHUErezLy6gh9XM1dFPH2HS44mgQ=;
	b=X6u0axHwlO5yGE9lUDQURZHjElgqLHuvwImCKZIoQ2vvYSUdu4sJtnTTjNoUXt56
	VXGgt9LuW27V9BA7tZ551pOB+vsCq03divyXzOBBd4hdbh7UtEc/Skq4tw1/kqlGin9
	uqoq9VyUSpTn5tLCZ49k1OPTyRpLWV6oSs1RhbzA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1786689406;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=xs5MAHsV1rttCJTNHUErezLy6gh9XM1dFPH2HS44mgQ=;
	b=cnXTmgx6RUXHJ3MVWN1h0JxGugZtaDh5d/+d1an4qLVuSdPJ03Tq2Pen0NJTPNbX
	6pN7xAmw+65yjCHYgK7sr2Bh27pSPeRhGd/6rOwKJEDXdW8dU74MAjupaX+cuj4vw71
	uIUqla2w6SSazyt++GBFLyQWaoTKaFM6BCf5i3xU=
Content-Type: multipart/mixed; boundary="===============2654317090514939131=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] libgit2: upgrading to 1.9.7 SUCCEEDED
Message-ID: <0101019ffefcc38b-7eeecbfa-f877-4e01-bba7-15e8af8cc88f-000000@us-west-2.amazonses.com>
Date: Fri, 14 Aug 2026 06:36:45 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.08.14-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Aug 2026 06:36:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243415

--===============2654317090514939131==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libgit2* to *1.9.7* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libgit2-upgrade-1.9.6-1.9.7.patch
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
From 7f7f9f5b3528f464f3ed56f5b01f1ab1dbabbf41 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 14 Aug 2026 06:36:36 +0000
Subject: [PATCH] libgit2: upgrade 1.9.6 -> 1.9.7

Source: docs/changelog.md

v1.9.7
------

This is an security release with one change.

* Escape remote repository paths in libssh2

  In v1.9.2, we started escaping repository paths in the OpenSSH-based
  exec ssh transport. Bring the same escaping to the libssh2 transport
  to avoid any potential command injection.

In addition, changes have been ported from the main branch to update
CI builds.
---
 ...cmake-mark-system-libraries-are-private-link-librari.patch | 4 +---
 .../libgit2/{libgit2_1.9.6.bb => libgit2_1.9.7.bb}            | 2 +-
 2 files changed, 2 insertions(+), 4 deletions(-)
 rename meta/recipes-support/libgit2/{libgit2_1.9.6.bb => libgit2_1.9.7.bb} (93%)

diff --git a/meta/recipes-support/libgit2/files/0001-cmake-mark-system-libraries-are-private-link-librari.patch b/meta/recipes-support/libgit2/files/0001-cmake-mark-system-libraries-are-private-link-librari.patch
index 267770ae6f..93f1f3a870 100644
--- a/meta/recipes-support/libgit2/files/0001-cmake-mark-system-libraries-are-private-link-librari.patch
+++ b/meta/recipes-support/libgit2/files/0001-cmake-mark-system-libraries-are-private-link-librari.patch
@@ -1,4 +1,4 @@
-From 5670d3eed82f0d64766158809bf3d0c7c631b0ea Mon Sep 17 00:00:00 2001
+From 41048806aec8a4b71f3ccf11fdedbec88080a675 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@arm.com>
 Date: Thu, 23 Jul 2026 17:35:23 +0100
 Subject: [PATCH] cmake: mark system libraries are private link libraries
@@ -38,5 +38,3 @@ index 8045ddef9..fafdb09ec 100644
  target_include_directories(libgit2package SYSTEM PRIVATE ${LIBGIT2_INCLUDES})
  target_include_directories(libgit2package INTERFACE $<INSTALL_INTERFACE:${CMAKE_INSTALL_INCLUDEDIR}>)
  
--- 
-2.43.0
diff --git a/meta/recipes-support/libgit2/libgit2_1.9.6.bb b/meta/recipes-support/libgit2/libgit2_1.9.7.bb
similarity index 93%
rename from meta/recipes-support/libgit2/libgit2_1.9.6.bb
rename to meta/recipes-support/libgit2/libgit2_1.9.7.bb
index b17b22c63e..2de3503aac 100644
--- a/meta/recipes-support/libgit2/libgit2_1.9.6.bb
+++ b/meta/recipes-support/libgit2/libgit2_1.9.7.bb
@@ -8,7 +8,7 @@ DEPENDS = "curl openssl zlib libssh2 libgcrypt libpcre2"
 SRC_URI = "git://github.com/libgit2/libgit2.git;branch=maint/v1.9;protocol=https;tag=v${PV} \
            file://0001-cmake-mark-system-libraries-are-private-link-librari.patch"
 
-SRCREV = "26055f5af74ab1cf636d272e8a34315496d3f06f"
+SRCREV = "49e408b3208bc3093757a1c2db938d3590f3f412"
 
 inherit cmake
 
-- 
2.47.1


--===============2654317090514939131==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/libgit2/libgit2: FILELIST: removed "/usr/lib/libgit2.so.1.9.6", added "/usr/lib/libgit2.so.1.9.7"
Changes to packages/x86-64-v3-poky-linux/libgit2 (sysroot):
  /usr/lib/libgit2.so.1.9 changed symlink target from libgit2.so.1.9.6 to libgit2.so.1.9.7
  /usr/lib/libgit2.so.1.9.6 moved to /usr/lib/libgit2.so.1.9.7

--===============2654317090514939131==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="libgit2-changelog.txt"

Changelog for libgit2: 1.9.6 -> 1.9.7
Source: docs/changelog.md

v1.9.7
------

This is an security release with one change.

* Escape remote repository paths in libssh2

  In v1.9.2, we started escaping repository paths in the OpenSSH-based
  exec ssh transport. Bring the same escaping to the libssh2 transport
  to avoid any potential command injection.

In addition, changes have been ported from the main branch to update
CI builds.

--===============2654317090514939131==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libgit2-upgrade-1.9.6-1.9.7.patch"

RnJvbSA3ZjdmOWY1YjM1MjhmNDY0ZjNlZDU2ZjViMDFmMWFiMWRiYWJiZjQxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMTQgQXVnIDIwMjYgMDY6MzY6MzYgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJnaXQyOiB1cGdyYWRlIDEuOS42IC0+IDEuOS43CgpTb3VyY2U6IGRvY3MvY2hhbmdlbG9nLm1k
Cgp2MS45LjcKLS0tLS0tCgpUaGlzIGlzIGFuIHNlY3VyaXR5IHJlbGVhc2Ugd2l0aCBvbmUgY2hh
bmdlLgoKKiBFc2NhcGUgcmVtb3RlIHJlcG9zaXRvcnkgcGF0aHMgaW4gbGlic3NoMgoKICBJbiB2
MS45LjIsIHdlIHN0YXJ0ZWQgZXNjYXBpbmcgcmVwb3NpdG9yeSBwYXRocyBpbiB0aGUgT3BlblNT
SC1iYXNlZAogIGV4ZWMgc3NoIHRyYW5zcG9ydC4gQnJpbmcgdGhlIHNhbWUgZXNjYXBpbmcgdG8g
dGhlIGxpYnNzaDIgdHJhbnNwb3J0CiAgdG8gYXZvaWQgYW55IHBvdGVudGlhbCBjb21tYW5kIGlu
amVjdGlvbi4KCkluIGFkZGl0aW9uLCBjaGFuZ2VzIGhhdmUgYmVlbiBwb3J0ZWQgZnJvbSB0aGUg
bWFpbiBicmFuY2ggdG8gdXBkYXRlCkNJIGJ1aWxkcy4KLS0tCiAuLi5jbWFrZS1tYXJrLXN5c3Rl
bS1saWJyYXJpZXMtYXJlLXByaXZhdGUtbGluay1saWJyYXJpLnBhdGNoIHwgNCArLS0tCiAuLi4v
bGliZ2l0Mi97bGliZ2l0Ml8xLjkuNi5iYiA9PiBsaWJnaXQyXzEuOS43LmJifSAgICAgICAgICAg
IHwgMiArLQogMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0p
CiByZW5hbWUgbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGliZ2l0Mi97bGliZ2l0Ml8xLjkuNi5iYiA9
PiBsaWJnaXQyXzEuOS43LmJifSAoOTMlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1zdXBw
b3J0L2xpYmdpdDIvZmlsZXMvMDAwMS1jbWFrZS1tYXJrLXN5c3RlbS1saWJyYXJpZXMtYXJlLXBy
aXZhdGUtbGluay1saWJyYXJpLnBhdGNoIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGliZ2l0Mi9m
aWxlcy8wMDAxLWNtYWtlLW1hcmstc3lzdGVtLWxpYnJhcmllcy1hcmUtcHJpdmF0ZS1saW5rLWxp
YnJhcmkucGF0Y2gKaW5kZXggMjY3NzcwYWU2Zi4uOTNmMWYzYTg3MCAxMDA2NDQKLS0tIGEvbWV0
YS9yZWNpcGVzLXN1cHBvcnQvbGliZ2l0Mi9maWxlcy8wMDAxLWNtYWtlLW1hcmstc3lzdGVtLWxp
YnJhcmllcy1hcmUtcHJpdmF0ZS1saW5rLWxpYnJhcmkucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVz
LXN1cHBvcnQvbGliZ2l0Mi9maWxlcy8wMDAxLWNtYWtlLW1hcmstc3lzdGVtLWxpYnJhcmllcy1h
cmUtcHJpdmF0ZS1saW5rLWxpYnJhcmkucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDU2NzBk
M2VlZDgyZjBkNjQ3NjYxNTg4MDliZjNkMGM3YzYzMWIwZWEgTW9uIFNlcCAxNyAwMDowMDowMCAy
MDAxCitGcm9tIDQxMDQ4ODA2YWVjOGE0YjcxZjNjY2YxMWZkZWRiZWM4ODA4MGE2NzUgTW9uIFNl
cCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBSb3NzIEJ1cnRvbiA8cm9zcy5idXJ0b25AYXJtLmNv
bT4KIERhdGU6IFRodSwgMjMgSnVsIDIwMjYgMTc6MzU6MjMgKzAxMDAKIFN1YmplY3Q6IFtQQVRD
SF0gY21ha2U6IG1hcmsgc3lzdGVtIGxpYnJhcmllcyBhcmUgcHJpdmF0ZSBsaW5rIGxpYnJhcmll
cwpAQCAtMzgsNSArMzgsMyBAQCBpbmRleCA4MDQ1ZGRlZjkuLmZhZmRiMDllYyAxMDA2NDQKICB0
YXJnZXRfaW5jbHVkZV9kaXJlY3RvcmllcyhsaWJnaXQycGFja2FnZSBTWVNURU0gUFJJVkFURSAk
e0xJQkdJVDJfSU5DTFVERVN9KQogIHRhcmdldF9pbmNsdWRlX2RpcmVjdG9yaWVzKGxpYmdpdDJw
YWNrYWdlIElOVEVSRkFDRSAkPElOU1RBTExfSU5URVJGQUNFOiR7Q01BS0VfSU5TVEFMTF9JTkNM
VURFRElSfT4pCiAgCi0tLSAKLTIuNDMuMApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBv
cnQvbGliZ2l0Mi9saWJnaXQyXzEuOS42LmJiIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGliZ2l0
Mi9saWJnaXQyXzEuOS43LmJiCnNpbWlsYXJpdHkgaW5kZXggOTMlCnJlbmFtZSBmcm9tIG1ldGEv
cmVjaXBlcy1zdXBwb3J0L2xpYmdpdDIvbGliZ2l0Ml8xLjkuNi5iYgpyZW5hbWUgdG8gbWV0YS9y
ZWNpcGVzLXN1cHBvcnQvbGliZ2l0Mi9saWJnaXQyXzEuOS43LmJiCmluZGV4IGIxN2IyMmM2M2Uu
LjJkZTM1MDNhYWMgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYmdpdDIvbGli
Z2l0Ml8xLjkuNi5iYgorKysgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJnaXQyL2xpYmdpdDJf
MS45LjcuYmIKQEAgLTgsNyArOCw3IEBAIERFUEVORFMgPSAiY3VybCBvcGVuc3NsIHpsaWIgbGli
c3NoMiBsaWJnY3J5cHQgbGlicGNyZTIiCiBTUkNfVVJJID0gImdpdDovL2dpdGh1Yi5jb20vbGli
Z2l0Mi9saWJnaXQyLmdpdDticmFuY2g9bWFpbnQvdjEuOTtwcm90b2NvbD1odHRwczt0YWc9diR7
UFZ9IFwKICAgICAgICAgICAgZmlsZTovLzAwMDEtY21ha2UtbWFyay1zeXN0ZW0tbGlicmFyaWVz
LWFyZS1wcml2YXRlLWxpbmstbGlicmFyaS5wYXRjaCIKIAotU1JDUkVWID0gIjI2MDU1ZjVhZjc0
YWIxY2Y2MzZkMjcyZThhMzQzMTU0OTZkM2YwNmYiCitTUkNSRVYgPSAiNDllNDA4YjMyMDhiYzMw
OTM3NTdhMWMyZGI5MzhkMzU5MGYzZjQxMiIKIAogaW5oZXJpdCBjbWFrZQogCi0tIAoyLjQ3LjEK
Cg==

--===============2654317090514939131==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/libgit2: PV changed from "1.9.6" to "1.9.7"
packages/x86-64-v3-poky-linux/libgit2: SRC_URI changed from "git://github.com/libgit2/libgit2.git;branch=maint/v1.9;protocol=https;tag=v1.9.6 file://0001-cmake-mark-system-libraries-are-private-link-librari.patch" to "git://github.com/libgit2/libgit2.git;branch=maint/v1.9;protocol=https;tag=v1.9.7 file://0001-cmake-mark-system-libraries-are-private-link-librari.patch"
packages/x86-64-v3-poky-linux/libgit2: PKGV changed from 1.9.6 [default] to 1.9.7 [default]
packages/x86-64-v3-poky-linux/libgit2/libgit2-dbg: PV changed from "1.9.6" to "1.9.7"
packages/x86-64-v3-poky-linux/libgit2/libgit2-dbg: FILELIST: removed "/usr/lib/.debug/libgit2.so.1.9.6", added "/usr/lib/.debug/libgit2.so.1.9.7"
packages/x86-64-v3-poky-linux/libgit2/libgit2-dbg: PKGV changed from 1.9.6 [default] to 1.9.7 [default]
packages/x86-64-v3-poky-linux/libgit2/libgit2-dev: PV changed from "1.9.6" to "1.9.7"
packages/x86-64-v3-poky-linux/libgit2/libgit2-dev: PKGV changed from 1.9.6 [default] to 1.9.7 [default]
packages/x86-64-v3-poky-linux/libgit2/libgit2-doc: PV changed from "1.9.6" to "1.9.7"
packages/x86-64-v3-poky-linux/libgit2/libgit2-doc: PKGV changed from 1.9.6 [default] to 1.9.7 [default]
packages/x86-64-v3-poky-linux/libgit2/libgit2-locale: PV changed from "1.9.6" to "1.9.7"
packages/x86-64-v3-poky-linux/libgit2/libgit2-locale: PKGV changed from 1.9.6 [default] to 1.9.7 [default]
packages/x86-64-v3-poky-linux/libgit2/libgit2-src: PKGSIZE changed from 4630110 to 4630136 (+0%)
packages/x86-64-v3-poky-linux/libgit2/libgit2-src: PV changed from "1.9.6" to "1.9.7"
packages/x86-64-v3-poky-linux/libgit2/libgit2-src: FILELIST: directory renamed /usr/src/debug/libgit2/1.9.6/src/libgit2/streams -> /usr/src/debug/libgit2/1.9.7/src/libgit2/streams, directory renamed /usr/src/debug/libgit2/1.9.6/deps/ntlmclient -> /usr/src/debug/libgit2/1.9.7/deps/ntlmclient, directory renamed /usr/src/debug/libgit2/1.9.6/src/util/allocators -> /usr/src/debug/libgit2/1.9.7/src/util/allocators, directory renamed /usr/src/debug/libgit2/1.9.6/src/cli/unix -> /usr/src/debug/libgit2/1.9.7/src/cli/unix, directory renamed /usr/src/debug/libgit2/1.9.6/include/git2/sys -> /usr/src/debug/libgit2/1.9.7/include/git2/sys, directory renamed /usr/src/debug/libgit2/1.9.6/include/git2 -> /usr/src/debug/libgit2/1.9.7/include/git2, directory renamed /usr/src/debug/libgit2/1.9.6/deps/xdiff -> /usr/src/debug/libgit2/1.9.7/deps/xdiff, directory renamed /usr/src/debug/libgit2/1.9.6/src/util/unix -> /usr/src/debug/libgit2/1.9.7/src/util/unix, directory renamed /usr/src/debug/libgit2/1.9.6/sr
 c/util/hash -> /usr/src/debug/libgit2/1.9.7/src/util/hash, directory renamed /usr/src/debug/libgit2/1.9.6/src/util -> /usr/src/debug/libgit2/1.9.7/src/util, directory renamed /usr/src/debug/libgit2/1.9.6/src/libgit2 -> /usr/src/debug/libgit2/1.9.7/src/libgit2, directory renamed /usr/src/debug/libgit2/1.9.6/src/cli -> /usr/src/debug/libgit2/1.9.7/src/cli, directory renamed /usr/src/debug/libgit2/1.9.6/deps/llhttp -> /usr/src/debug/libgit2/1.9.7/deps/llhttp, directory renamed /usr/src/debug/libgit2/1.9.6/src/util/hash/sha1dc -> /usr/src/debug/libgit2/1.9.7/src/util/hash/sha1dc, directory renamed /usr/src/debug/libgit2/1.9.6/src/libgit2/transports -> /usr/src/debug/libgit2/1.9.7/src/libgit2/transports
packages/x86-64-v3-poky-linux/libgit2/libgit2-src: PKGV changed from 1.9.6 [default] to 1.9.7 [default]
packages/x86-64-v3-poky-linux/libgit2/libgit2-staticdev: PV changed from "1.9.6" to "1.9.7"
packages/x86-64-v3-poky-linux/libgit2/libgit2-staticdev: PKGV changed from 1.9.6 [default] to 1.9.7 [default]
packages/x86-64-v3-poky-linux/libgit2/libgit2: PV changed from "1.9.6" to "1.9.7"
packages/x86-64-v3-poky-linux/libgit2/libgit2: FILELIST: removed "/usr/lib/libgit2.so.1.9.6", added "/usr/lib/libgit2.so.1.9.7"
packages/x86-64-v3-poky-linux/libgit2/libgit2: PKGV changed from 1.9.6 [default] to 1.9.7 [default]
Changes to packages/x86-64-v3-poky-linux/libgit2 (sysroot):
  /usr/lib/libgit2.so.1.9 changed symlink target from libgit2.so.1.9.6 to libgit2.so.1.9.7
  /usr/lib/libgit2.so.1.9.6 moved to /usr/lib/libgit2.so.1.9.7

--===============2654317090514939131==--

