Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60E2BC5DF8C
	for <webhook@archiver.kernel.org>; Mon, 24 Aug 2026 05:36:34 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10368.1787549783898899086
 for <openembedded-core@lists.openembedded.org>;
 Sun, 23 Aug 2026 22:36:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=KbW/vkGc;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=ob8fdOnm;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 010101a03245136c-c5621251-bc42-435f-801d-95976666a05f-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1787549783;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=K6+tBlbWVQ83RH2AiBfJ3mZqHkyLGB5D+0Tb6mgm5UI=;
	b=KbW/vkGcI+QHJfpJvwF7Qj6H0X7/AKFuHwMEnUI4erpMbUMJZps3vzWb1tCKrxqp
	T0i60ANGHJasAVtAqT75UX+dedBjX2bXbRCKTidMyTiqPl/sgc79+sREwkOTniVi1ki
	coLpMbTYce072JQfcRdoUEGwgx1+tQ9w+dI+aPCU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1787549783;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=K6+tBlbWVQ83RH2AiBfJ3mZqHkyLGB5D+0Tb6mgm5UI=;
	b=ob8fdOnmBcIw56kVNLAtaFp4i0GEu1tLT/5CubYPKaBh0qUSiRT4QaonBN2Ohqsl
	oRI0bl41Eh92CWC0x24eTEBt8WfLYeckRmjIpQBdgzeAXqfiT29pAZU7XW/swz5Z1db
	fZafMb7Sqn0EXYtH15LBBpQ6Z9mxY8mrR/EOiwa4=
Content-Type: multipart/mixed; boundary="===============3448660658659649483=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] pkgconf: upgrading to 3.0.6 SUCCEEDED
Message-ID: <010101a03245136c-c5621251-bc42-435f-801d-95976666a05f-000000@us-west-2.amazonses.com>
Date: Mon, 24 Aug 2026 05:36:22 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.08.24-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Aug 2026 05:36:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244061

--===============3448660658659649483==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *pkgconf* to *3.0.6* has Succeeded.

Next steps:
    - apply the patch: git am 0001-pkgconf-upgrade-3.0.5-3.0.6.patch
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
From 222c9c81c5265e577ddf0756927bf2df7c18e583 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 24 Aug 2026 05:33:22 +0000
Subject: [PATCH] pkgconf: upgrade 3.0.5 -> 3.0.6

Source: NEWS

Changes from 3.0.5 to 3.0.6:
----------------------------

* Command-line behavior:
  - --variable accepts multiple modules and prints the requested
    variable's value for each module, in argument order.  --path and
    --print-variables remain limited to a single module.
  - pccritic no longer reports the PC061 style finding for CRLF line endings,
    avoiding a noisy warning for normal Windows files.
    See https://github.com/pkgconf/pkgconf/issues/587.

* Build and portability fixes:
  - Improve OS/2 support by exporting libpkgconf APIs from DLL builds,
    recognizing OS/2 drive letters and path separators, comparing paths without
    case sensitivity, and using binary mode for redirected standard output and
    error.  Patches by KO Myung-Hun.
  - Declare pkgconf long-path-aware in its Windows application manifest,
    allowing paths beyond the traditional MAX_PATH limit when long paths are
    enabled by the operating system.  Patch by moi15moi.
---
 .../pkgconf/{pkgconf_3.0.5.bb => pkgconf_3.0.6.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/pkgconf/{pkgconf_3.0.5.bb => pkgconf_3.0.6.bb} (97%)

diff --git a/meta/recipes-devtools/pkgconf/pkgconf_3.0.5.bb b/meta/recipes-devtools/pkgconf/pkgconf_3.0.6.bb
similarity index 97%
rename from meta/recipes-devtools/pkgconf/pkgconf_3.0.5.bb
rename to meta/recipes-devtools/pkgconf/pkgconf_3.0.6.bb
index 79ac3208d3..471433e7b5 100644
--- a/meta/recipes-devtools/pkgconf/pkgconf_3.0.5.bb
+++ b/meta/recipes-devtools/pkgconf/pkgconf_3.0.6.bb
@@ -20,7 +20,7 @@ SRC_URI = "\
     file://pkg-config-native.in \
     file://pkg-config-esdk.in \
 "
-SRC_URI[sha256sum] = "3acd3a8a3cce65a8d620321855d92fb602e026cbe8e13ee36bdec58483b59ace"
+SRC_URI[sha256sum] = "c88a653fbabfa2a5857a30f6b6ad6c40dbacc3b7c72cc066e5c7dc4571cbddaa"
 UPSTREAM_CHECK_REGEX = "pkgconf-(?P<pver>\d+\.\d+\.(?!9\d+)\d+)\.tar"
 
 inherit autotools pkgconfig
-- 
2.47.1


--===============3448660658659649483==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/x86_64-linux/elfutils-native (sysroot):
  /usr/bin/eu-stackprof was added

--===============3448660658659649483==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="pkgconf-changelog.txt"

Changelog for pkgconf: 3.0.5 -> 3.0.6
Source: NEWS

Changes from 3.0.5 to 3.0.6:
----------------------------

* Command-line behavior:
  - --variable accepts multiple modules and prints the requested
    variable's value for each module, in argument order.  --path and
    --print-variables remain limited to a single module.
  - pccritic no longer reports the PC061 style finding for CRLF line endings,
    avoiding a noisy warning for normal Windows files.
    See https://github.com/pkgconf/pkgconf/issues/587.

* Build and portability fixes:
  - Improve OS/2 support by exporting libpkgconf APIs from DLL builds,
    recognizing OS/2 drive letters and path separators, comparing paths without
    case sensitivity, and using binary mode for redirected standard output and
    error.  Patches by KO Myung-Hun.
  - Declare pkgconf long-path-aware in its Windows application manifest,
    allowing paths beyond the traditional MAX_PATH limit when long paths are
    enabled by the operating system.  Patch by moi15moi.

--===============3448660658659649483==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/pkgconf: SRC_URI changed from "https://distfiles.ariadne.space/pkgconf/pkgconf-3.0.5.tar.xz file://pkg-config-wrapper file://pkg-config-native.in file://pkg-config-esdk.in" to "https://distfiles.ariadne.space/pkgconf/pkgconf-3.0.6.tar.xz file://pkg-config-wrapper file://pkg-config-native.in file://pkg-config-esdk.in"
packages/x86-64-v3-poky-linux/pkgconf: PV changed from "3.0.5" to "3.0.6"
packages/x86-64-v3-poky-linux/pkgconf: PKGV changed from 3.0.5 [default] to 3.0.6 [default]
packages/x86-64-v3-poky-linux/pkgconf/pkgconf-dbg: PV changed from "3.0.5" to "3.0.6"
packages/x86-64-v3-poky-linux/pkgconf/pkgconf-dbg: PKGSIZE changed from 792368 to 791752 (-0%)
packages/x86-64-v3-poky-linux/pkgconf/pkgconf-dbg: PKGV changed from 3.0.5 [default] to 3.0.6 [default]
packages/x86-64-v3-poky-linux/pkgconf/pkgconf-dev: PV changed from "3.0.5" to "3.0.6"
packages/x86-64-v3-poky-linux/pkgconf/pkgconf-dev: PKGSIZE changed from 45016 to 45425 (+1%)
packages/x86-64-v3-poky-linux/pkgconf/pkgconf-dev: PKGV changed from 3.0.5 [default] to 3.0.6 [default]
packages/x86-64-v3-poky-linux/pkgconf/pkgconf-doc: PV changed from "3.0.5" to "3.0.6"
packages/x86-64-v3-poky-linux/pkgconf/pkgconf-doc: PKGV changed from 3.0.5 [default] to 3.0.6 [default]
packages/x86-64-v3-poky-linux/pkgconf/pkgconf-locale: PV changed from "3.0.5" to "3.0.6"
packages/x86-64-v3-poky-linux/pkgconf/pkgconf-locale: PKGV changed from 3.0.5 [default] to 3.0.6 [default]
packages/x86-64-v3-poky-linux/pkgconf/pkgconf-src: PV changed from "3.0.5" to "3.0.6"
packages/x86-64-v3-poky-linux/pkgconf/pkgconf-src: PKGSIZE changed from 574086 to 574060 (-0%)
packages/x86-64-v3-poky-linux/pkgconf/pkgconf-src: PKGV changed from 3.0.5 [default] to 3.0.6 [default]
packages/x86-64-v3-poky-linux/pkgconf/pkgconf-src: FILELIST: directory renamed /usr/src/debug/pkgconf/3.0.5/cli -> /usr/src/debug/pkgconf/3.0.6/cli, directory renamed /usr/src/debug/pkgconf/3.0.5/cli/pccritic -> /usr/src/debug/pkgconf/3.0.6/cli/pccritic, directory renamed /usr/src/debug/pkgconf/3.0.5/libpkgconf -> /usr/src/debug/pkgconf/3.0.6/libpkgconf, directory renamed /usr/src/debug/pkgconf/3.0.5/cli/spdxtool -> /usr/src/debug/pkgconf/3.0.6/cli/spdxtool, directory renamed /usr/src/debug/pkgconf/3.0.5/cli/bomtool -> /usr/src/debug/pkgconf/3.0.6/cli/bomtool
packages/x86-64-v3-poky-linux/pkgconf/pkgconf-staticdev: PV changed from "3.0.5" to "3.0.6"
packages/x86-64-v3-poky-linux/pkgconf/pkgconf-staticdev: PKGV changed from 3.0.5 [default] to 3.0.6 [default]
packages/x86-64-v3-poky-linux/pkgconf/pkgconf: PV changed from "3.0.5" to "3.0.6"
packages/x86-64-v3-poky-linux/pkgconf/pkgconf: PKGV changed from 3.0.5 [default] to 3.0.6 [default]
Changes to packages/x86_64-linux/elfutils-native (sysroot):
  /usr/bin/eu-stackprof was added

--===============3448660658659649483==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-pkgconf-upgrade-3.0.5-3.0.6.patch"

RnJvbSAyMjJjOWM4MWM1MjY1ZTU3N2RkZjA3NTY5MjdiZjJkZjdjMThlNTgzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMjQgQXVnIDIwMjYgMDU6MzM6MjIgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
a2djb25mOiB1cGdyYWRlIDMuMC41IC0+IDMuMC42CgpTb3VyY2U6IE5FV1MKCkNoYW5nZXMgZnJv
bSAzLjAuNSB0byAzLjAuNjoKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQoKKiBDb21tYW5k
LWxpbmUgYmVoYXZpb3I6CiAgLSAtLXZhcmlhYmxlIGFjY2VwdHMgbXVsdGlwbGUgbW9kdWxlcyBh
bmQgcHJpbnRzIHRoZSByZXF1ZXN0ZWQKICAgIHZhcmlhYmxlJ3MgdmFsdWUgZm9yIGVhY2ggbW9k
dWxlLCBpbiBhcmd1bWVudCBvcmRlci4gIC0tcGF0aCBhbmQKICAgIC0tcHJpbnQtdmFyaWFibGVz
IHJlbWFpbiBsaW1pdGVkIHRvIGEgc2luZ2xlIG1vZHVsZS4KICAtIHBjY3JpdGljIG5vIGxvbmdl
ciByZXBvcnRzIHRoZSBQQzA2MSBzdHlsZSBmaW5kaW5nIGZvciBDUkxGIGxpbmUgZW5kaW5ncywK
ICAgIGF2b2lkaW5nIGEgbm9pc3kgd2FybmluZyBmb3Igbm9ybWFsIFdpbmRvd3MgZmlsZXMuCiAg
ICBTZWUgaHR0cHM6Ly9naXRodWIuY29tL3BrZ2NvbmYvcGtnY29uZi9pc3N1ZXMvNTg3LgoKKiBC
dWlsZCBhbmQgcG9ydGFiaWxpdHkgZml4ZXM6CiAgLSBJbXByb3ZlIE9TLzIgc3VwcG9ydCBieSBl
eHBvcnRpbmcgbGlicGtnY29uZiBBUElzIGZyb20gRExMIGJ1aWxkcywKICAgIHJlY29nbml6aW5n
IE9TLzIgZHJpdmUgbGV0dGVycyBhbmQgcGF0aCBzZXBhcmF0b3JzLCBjb21wYXJpbmcgcGF0aHMg
d2l0aG91dAogICAgY2FzZSBzZW5zaXRpdml0eSwgYW5kIHVzaW5nIGJpbmFyeSBtb2RlIGZvciBy
ZWRpcmVjdGVkIHN0YW5kYXJkIG91dHB1dCBhbmQKICAgIGVycm9yLiAgUGF0Y2hlcyBieSBLTyBN
eXVuZy1IdW4uCiAgLSBEZWNsYXJlIHBrZ2NvbmYgbG9uZy1wYXRoLWF3YXJlIGluIGl0cyBXaW5k
b3dzIGFwcGxpY2F0aW9uIG1hbmlmZXN0LAogICAgYWxsb3dpbmcgcGF0aHMgYmV5b25kIHRoZSB0
cmFkaXRpb25hbCBNQVhfUEFUSCBsaW1pdCB3aGVuIGxvbmcgcGF0aHMgYXJlCiAgICBlbmFibGVk
IGJ5IHRoZSBvcGVyYXRpbmcgc3lzdGVtLiAgUGF0Y2ggYnkgbW9pMTVtb2kuCi0tLQogLi4uL3Br
Z2NvbmYve3BrZ2NvbmZfMy4wLjUuYmIgPT4gcGtnY29uZl8zLjAuNi5iYn0gICAgICAgICAgICAg
IHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiBy
ZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3BrZ2NvbmYve3BrZ2NvbmZfMy4wLjUuYmIgPT4g
cGtnY29uZl8zLjAuNi5iYn0gKDk3JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcGtnY29uZi9wa2djb25mXzMuMC41LmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3BrZ2Nv
bmYvcGtnY29uZl8zLjAuNi5iYgpzaW1pbGFyaXR5IGluZGV4IDk3JQpyZW5hbWUgZnJvbSBtZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcGtnY29uZi9wa2djb25mXzMuMC41LmJiCnJlbmFtZSB0byBtZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcGtnY29uZi9wa2djb25mXzMuMC42LmJiCmluZGV4IDc5YWMzMjA4
ZDMuLjQ3MTQzM2U3YjUgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9wa2djb25m
L3BrZ2NvbmZfMy4wLjUuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3BrZ2NvbmYvcGtn
Y29uZl8zLjAuNi5iYgpAQCAtMjAsNyArMjAsNyBAQCBTUkNfVVJJID0gIlwKICAgICBmaWxlOi8v
cGtnLWNvbmZpZy1uYXRpdmUuaW4gXAogICAgIGZpbGU6Ly9wa2ctY29uZmlnLWVzZGsuaW4gXAog
IgotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjNhY2QzYThhM2NjZTY1YThkNjIwMzIxODU1ZDkyZmI2
MDJlMDI2Y2JlOGUxM2VlMzZiZGVjNTg0ODNiNTlhY2UiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAi
Yzg4YTY1M2ZiYWJmYTJhNTg1N2EzMGY2YjZhZDZjNDBkYmFjYzNiN2M3MmNjMDY2ZTVjN2RjNDU3
MWNiZGRhYSIKIFVQU1RSRUFNX0NIRUNLX1JFR0VYID0gInBrZ2NvbmYtKD9QPHB2ZXI+XGQrXC5c
ZCtcLig/ITlcZCspXGQrKVwudGFyIgogCiBpbmhlcml0IGF1dG90b29scyBwa2djb25maWcKLS0g
CjIuNDcuMQoK

--===============3448660658659649483==--

