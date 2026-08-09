Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 120E5C5AC80
	for <webhook@archiver.kernel.org>; Sun,  9 Aug 2026 06:00:03 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4683.1786255202167525709
 for <openembedded-core@lists.openembedded.org>;
 Sat, 08 Aug 2026 23:00:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=MYJnFBr2;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=ss4qF0Ch;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101019fe51b5410-7eca0686-9f15-4e57-b53f-2fc29b8f1529-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1786255201;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=gOzK7OK7ucKdmt26jpskenTIv78AMuQ4LdLxrbGpvVA=;
	b=MYJnFBr2piFvzTN1/4bX0IvdRTcCjPf1GoEFSo0hVLv+E9Fr/JmrbttTVcV+dGgI
	AwA8k9AtlgosMOIALBHESixhn4SLK3qd7p3XG3byrfZfp42ZUQeZtXT5I5pLn2DYaWq
	bylHSkLDX5ibX5RuLiqj2RTEgtdeV/HAYkhACSRY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1786255201;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=gOzK7OK7ucKdmt26jpskenTIv78AMuQ4LdLxrbGpvVA=;
	b=ss4qF0Ch3eRAiVp5Dbkwlai4VSNHu/3uPmJF87fYu/Jc34IdUx8+ak+pDluymI6Q
	1Sbjd4/umjlYNkt3gfwtmj5Bhd3OYyttjhtUddRCsU2B7SLJce+rrTxVS3zF5uKcXan
	Nc11qC6mLSGIptjl8IHKP8FCv59nOl2gVkm1ihMA=
Content-Type: multipart/mixed; boundary="===============0314431102584663397=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] libmicrohttpd: upgrading to 1.0.10 SUCCEEDED
Message-ID: <0101019fe51b5410-7eca0686-9f15-4e57-b53f-2fc29b8f1529-000000@us-west-2.amazonses.com>
Date: Sun, 9 Aug 2026 06:00:01 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.08.09-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 09 Aug 2026 06:00:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243060

--===============0314431102584663397==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libmicrohttpd* to *1.0.10* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libmicrohttpd-upgrade-1.0.9-1.0.10.patch
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
From e2d8bd1cf4fd84b3052451a2b62007ae8ef4c43f Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 9 Aug 2026 05:59:55 +0000
Subject: [PATCH] libmicrohttpd: upgrade 1.0.9 -> 1.0.10

Source: ChangeLog

Fri Aug  7 10:15:01 PM CEST 2026
    Fix race in thread-per-connection mode on wake-up signal
    between daemon and thread that could result in lost wake-ups
    and thus connections that did not finish processing.
    Fix rare assertion failure in relation to suspend-and-resume
    processing (harmless if assertions were turned off).
    Releasing GNU libmicrohttpd 1.0.10. -CG
---
 .../{libmicrohttpd_1.0.9.bb => libmicrohttpd_1.0.10.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/libmicrohttpd/{libmicrohttpd_1.0.9.bb => libmicrohttpd_1.0.10.bb} (91%)

diff --git a/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.9.bb b/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.10.bb
similarity index 91%
rename from meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.9.bb
rename to meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.10.bb
index 4ce99da52a..ba8969d649 100644
--- a/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.9.bb
+++ b/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.10.bb
@@ -7,7 +7,7 @@ SECTION = "net"
 DEPENDS = "file"
 
 SRC_URI = "${GNU_MIRROR}/libmicrohttpd/${BPN}-${PV}.tar.gz"
-SRC_URI[sha256sum] = "6e9adc446b08083ec03d40317fb66ca6f2e03e4f6170aef33a6e59bb08db2012"
+SRC_URI[sha256sum] = "04bfe8ef75db7d629a33de767599765cecadc56274a39822d5d081030d577685"
 
 inherit autotools lib_package pkgconfig gettext
 
-- 
2.47.1


--===============0314431102584663397==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libmicrohttpd-upgrade-1.0.9-1.0.10.patch"

RnJvbSBlMmQ4YmQxY2Y0ZmQ4NGIzMDUyNDUxYTJiNjIwMDdhZThlZjRjNDNmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgOSBBdWcgMjAyNiAwNTo1OTo1NSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGxp
Ym1pY3JvaHR0cGQ6IHVwZ3JhZGUgMS4wLjkgLT4gMS4wLjEwCgpTb3VyY2U6IENoYW5nZUxvZwoK
RnJpIEF1ZyAgNyAxMDoxNTowMSBQTSBDRVNUIDIwMjYKICAgIEZpeCByYWNlIGluIHRocmVhZC1w
ZXItY29ubmVjdGlvbiBtb2RlIG9uIHdha2UtdXAgc2lnbmFsCiAgICBiZXR3ZWVuIGRhZW1vbiBh
bmQgdGhyZWFkIHRoYXQgY291bGQgcmVzdWx0IGluIGxvc3Qgd2FrZS11cHMKICAgIGFuZCB0aHVz
IGNvbm5lY3Rpb25zIHRoYXQgZGlkIG5vdCBmaW5pc2ggcHJvY2Vzc2luZy4KICAgIEZpeCByYXJl
IGFzc2VydGlvbiBmYWlsdXJlIGluIHJlbGF0aW9uIHRvIHN1c3BlbmQtYW5kLXJlc3VtZQogICAg
cHJvY2Vzc2luZyAoaGFybWxlc3MgaWYgYXNzZXJ0aW9ucyB3ZXJlIHR1cm5lZCBvZmYpLgogICAg
UmVsZWFzaW5nIEdOVSBsaWJtaWNyb2h0dHBkIDEuMC4xMC4gLUNHCi0tLQogLi4uL3tsaWJtaWNy
b2h0dHBkXzEuMC45LmJiID0+IGxpYm1pY3JvaHR0cGRfMS4wLjEwLmJifSAgICAgICAgIHwgMiAr
LQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUg
bWV0YS9yZWNpcGVzLXN1cHBvcnQvbGlibWljcm9odHRwZC97bGlibWljcm9odHRwZF8xLjAuOS5i
YiA9PiBsaWJtaWNyb2h0dHBkXzEuMC4xMC5iYn0gKDkxJSkKCmRpZmYgLS1naXQgYS9tZXRhL3Jl
Y2lwZXMtc3VwcG9ydC9saWJtaWNyb2h0dHBkL2xpYm1pY3JvaHR0cGRfMS4wLjkuYmIgYi9tZXRh
L3JlY2lwZXMtc3VwcG9ydC9saWJtaWNyb2h0dHBkL2xpYm1pY3JvaHR0cGRfMS4wLjEwLmJiCnNp
bWlsYXJpdHkgaW5kZXggOTElCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYm1p
Y3JvaHR0cGQvbGlibWljcm9odHRwZF8xLjAuOS5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLXN1
cHBvcnQvbGlibWljcm9odHRwZC9saWJtaWNyb2h0dHBkXzEuMC4xMC5iYgppbmRleCA0Y2U5OWRh
NTJhLi5iYTg5NjlkNjQ5IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJtaWNy
b2h0dHBkL2xpYm1pY3JvaHR0cGRfMS4wLjkuYmIKKysrIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQv
bGlibWljcm9odHRwZC9saWJtaWNyb2h0dHBkXzEuMC4xMC5iYgpAQCAtNyw3ICs3LDcgQEAgU0VD
VElPTiA9ICJuZXQiCiBERVBFTkRTID0gImZpbGUiCiAKIFNSQ19VUkkgPSAiJHtHTlVfTUlSUk9S
fS9saWJtaWNyb2h0dHBkLyR7QlBOfS0ke1BWfS50YXIuZ3oiCi1TUkNfVVJJW3NoYTI1NnN1bV0g
PSAiNmU5YWRjNDQ2YjA4MDgzZWMwM2Q0MDMxN2ZiNjZjYTZmMmUwM2U0ZjYxNzBhZWYzM2E2ZTU5
YmIwOGRiMjAxMiIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICIwNGJmZThlZjc1ZGI3ZDYyOWEzM2Rl
NzY3NTk5NzY1Y2VjYWRjNTYyNzRhMzk4MjJkNWQwODEwMzBkNTc3Njg1IgogCiBpbmhlcml0IGF1
dG90b29scyBsaWJfcGFja2FnZSBwa2djb25maWcgZ2V0dGV4dAogCi0tIAoyLjQ3LjEKCg==

--===============0314431102584663397==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/libmicrohttpd/libmicrohttpd: FILELIST: removed "/usr/lib/libmicrohttpd.so.12.62.7", added "/usr/lib/libmicrohttpd.so.12.62.8"
Changes to packages/x86-64-v3-poky-linux/libmicrohttpd (sysroot):
  /usr/lib/libmicrohttpd.so.12 changed symlink target from libmicrohttpd.so.12.62.7 to libmicrohttpd.so.12.62.8
  /usr/lib/libmicrohttpd.so changed symlink target from libmicrohttpd.so.12.62.7 to libmicrohttpd.so.12.62.8
  /usr/lib/libmicrohttpd.so.12.62.7 moved to /usr/lib/libmicrohttpd.so.12.62.8
Changes to packages/x86_64-linux/libmicrohttpd-native (sysroot):
  /usr/lib/libmicrohttpd.so.12 changed symlink target from libmicrohttpd.so.12.62.7 to libmicrohttpd.so.12.62.8
  /usr/lib/libmicrohttpd.so changed symlink target from libmicrohttpd.so.12.62.7 to libmicrohttpd.so.12.62.8
  /usr/lib/libmicrohttpd.so.12.62.7 moved to /usr/lib/libmicrohttpd.so.12.62.8

--===============0314431102584663397==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/gcc-runtime/gcc-runtime-src: PKGSIZE changed from 11330424 to 11130992 (-2%)
packages/x86-64-v3-poky-linux/libmicrohttpd: SRC_URI changed from "https://ftpmirror.gnu.org/gnu/libmicrohttpd/libmicrohttpd-1.0.9.tar.gz" to "https://ftpmirror.gnu.org/gnu/libmicrohttpd/libmicrohttpd-1.0.10.tar.gz"
packages/x86-64-v3-poky-linux/libmicrohttpd: PV changed from "1.0.9" to "1.0.10"
packages/x86-64-v3-poky-linux/libmicrohttpd: PKGV changed from 1.0.9 [default] to 1.0.10 [default]
packages/x86-64-v3-poky-linux/libmicrohttpd/libmicrohttpd-bin: PV changed from "1.0.9" to "1.0.10"
packages/x86-64-v3-poky-linux/libmicrohttpd/libmicrohttpd-bin: PKGV changed from 1.0.9 [default] to 1.0.10 [default]
packages/x86-64-v3-poky-linux/libmicrohttpd/libmicrohttpd-dbg: PV changed from "1.0.9" to "1.0.10"
packages/x86-64-v3-poky-linux/libmicrohttpd/libmicrohttpd-dbg: PKGSIZE changed from 881624 to 884656 (+0%)
packages/x86-64-v3-poky-linux/libmicrohttpd/libmicrohttpd-dbg: PKGV changed from 1.0.9 [default] to 1.0.10 [default]
packages/x86-64-v3-poky-linux/libmicrohttpd/libmicrohttpd-dbg: FILELIST: removed "/usr/lib/.debug/libmicrohttpd.so.12.62.7", added "/usr/lib/.debug/libmicrohttpd.so.12.62.8"
packages/x86-64-v3-poky-linux/libmicrohttpd/libmicrohttpd-dev: PV changed from "1.0.9" to "1.0.10"
packages/x86-64-v3-poky-linux/libmicrohttpd/libmicrohttpd-dev: PKGSIZE changed from 257846 to 257847 (+0%)
packages/x86-64-v3-poky-linux/libmicrohttpd/libmicrohttpd-dev: PKGV changed from 1.0.9 [default] to 1.0.10 [default]
packages/x86-64-v3-poky-linux/libmicrohttpd/libmicrohttpd-doc: PV changed from "1.0.9" to "1.0.10"
packages/x86-64-v3-poky-linux/libmicrohttpd/libmicrohttpd-doc: PKGSIZE changed from 536237 to 536239 (+0%)
packages/x86-64-v3-poky-linux/libmicrohttpd/libmicrohttpd-doc: PKGV changed from 1.0.9 [default] to 1.0.10 [default]
packages/x86-64-v3-poky-linux/libmicrohttpd/libmicrohttpd-locale: PV changed from "1.0.9" to "1.0.10"
packages/x86-64-v3-poky-linux/libmicrohttpd/libmicrohttpd-locale: PKGV changed from 1.0.9 [default] to 1.0.10 [default]
packages/x86-64-v3-poky-linux/libmicrohttpd/libmicrohttpd-src: PV changed from "1.0.9" to "1.0.10"
packages/x86-64-v3-poky-linux/libmicrohttpd/libmicrohttpd-src: PKGSIZE changed from 1710854 to 1717470 (+0%)
packages/x86-64-v3-poky-linux/libmicrohttpd/libmicrohttpd-src: PKGV changed from 1.0.9 [default] to 1.0.10 [default]
packages/x86-64-v3-poky-linux/libmicrohttpd/libmicrohttpd-src: FILELIST: directory renamed /usr/src/debug/libmicrohttpd/1.0.9/src/include -> /usr/src/debug/libmicrohttpd/1.0.10/src/include, directory renamed /usr/src/debug/libmicrohttpd/1.0.9/src/microhttpd -> /usr/src/debug/libmicrohttpd/1.0.10/src/microhttpd
packages/x86-64-v3-poky-linux/libmicrohttpd/libmicrohttpd-staticdev: PV changed from "1.0.9" to "1.0.10"
packages/x86-64-v3-poky-linux/libmicrohttpd/libmicrohttpd-staticdev: PKGV changed from 1.0.9 [default] to 1.0.10 [default]
packages/x86-64-v3-poky-linux/libmicrohttpd/libmicrohttpd: PV changed from "1.0.9" to "1.0.10"
packages/x86-64-v3-poky-linux/libmicrohttpd/libmicrohttpd: PKGV changed from 1.0.9 [default] to 1.0.10 [default]
packages/x86-64-v3-poky-linux/libmicrohttpd/libmicrohttpd: FILELIST: removed "/usr/lib/libmicrohttpd.so.12.62.7", added "/usr/lib/libmicrohttpd.so.12.62.8"
Changes to packages/x86-64-v3-poky-linux/libmicrohttpd (sysroot):
  /usr/lib/libmicrohttpd.so.12 changed symlink target from libmicrohttpd.so.12.62.7 to libmicrohttpd.so.12.62.8
  /usr/lib/libmicrohttpd.so changed symlink target from libmicrohttpd.so.12.62.7 to libmicrohttpd.so.12.62.8
  /usr/lib/libmicrohttpd.so.12.62.7 moved to /usr/lib/libmicrohttpd.so.12.62.8
Changes to packages/x86_64-linux/libmicrohttpd-native (sysroot):
  /usr/lib/libmicrohttpd.so.12 changed symlink target from libmicrohttpd.so.12.62.7 to libmicrohttpd.so.12.62.8
  /usr/lib/libmicrohttpd.so changed symlink target from libmicrohttpd.so.12.62.7 to libmicrohttpd.so.12.62.8
  /usr/lib/libmicrohttpd.so.12.62.7 moved to /usr/lib/libmicrohttpd.so.12.62.8

--===============0314431102584663397==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="libmicrohttpd-changelog.txt"

Changelog for libmicrohttpd: 1.0.9 -> 1.0.10
Source: ChangeLog

Fri Aug  7 10:15:01 PM CEST 2026
    Fix race in thread-per-connection mode on wake-up signal
    between daemon and thread that could result in lost wake-ups
    and thus connections that did not finish processing.
    Fix rare assertion failure in relation to suspend-and-resume
    processing (harmless if assertions were turned off).
    Releasing GNU libmicrohttpd 1.0.10. -CG

--===============0314431102584663397==--

