Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAF00C54F4C
	for <webhook@archiver.kernel.org>; Tue, 28 Jul 2026 05:33:58 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5260.1785216829664446700
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Jul 2026 22:33:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=Df8YRVX5;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=TnYsg0LV;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101019fa7370513-7b6fb0e8-2dba-4035-afe2-76cedb1bf77c-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1785216828;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=9HBa6C4LehNlkQEFrUUak4tEfOfK07GK6n/XQH6nMnQ=;
	b=Df8YRVX5Z04tWNvWe56jCdK4PxFkCE722F3+y0ECm/vrNMw3g1eSb4jywN3AnjP0
	und8o49OeJzNckDuO+b9q+t/pmNwV0gO7srIih12dCBdj81xb08d8uX1mz3sXzm6/W8
	5seMuEH9tKuxxYbQEZPQOGhUoS/J+EHGwpBvyXbo=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1785216828;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=9HBa6C4LehNlkQEFrUUak4tEfOfK07GK6n/XQH6nMnQ=;
	b=TnYsg0LVwXgyvEoSBaDYzsgZPK/BYW/eI5huvdPA/Xn/pt/AE8n/5x4RSPUg79Ji
	IxXNeP530vGRvCXRqgqOuVVkMGxJw5BPNkYhUUSEaEeHi6cUTwwm7vN35xXSRV81d71
	EEApuGzXCo3E2EqPQM634S9bkHKxGvK2EPXdH6yk=
Content-Type: multipart/mixed; boundary="===============3219017931797014083=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] libmicrohttpd: upgrading to 1.0.7 SUCCEEDED
Message-ID: <0101019fa7370513-7b6fb0e8-2dba-4035-afe2-76cedb1bf77c-000000@us-west-2.amazonses.com>
Date: Tue, 28 Jul 2026 05:33:48 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.07.28-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Jul 2026 05:33:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242161

--===============3219017931797014083==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libmicrohttpd* to *1.0.7* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libmicrohttpd-upgrade-1.0.6-1.0.7.patch
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
From d67b494fcf052aaa0a99b237560dc92e9a118996 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 28 Jul 2026 05:33:45 +0000
Subject: [PATCH] libmicrohttpd: upgrade 1.0.6 -> 1.0.7

Source: ChangeLog

Mon Jul 27 06:12:03 PM CEST 2026
    Fixing various vulnerabilities reported by A. Ramos resulting
    in possible crashes or out-of-bounds stack writes for certain
    requests in specific configurations.
    Releasing GNU libmicrohttpd 1.0.7. -CG
---
 .../{libmicrohttpd_1.0.6.bb => libmicrohttpd_1.0.7.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/libmicrohttpd/{libmicrohttpd_1.0.6.bb => libmicrohttpd_1.0.7.bb} (91%)

diff --git a/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.6.bb b/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.7.bb
similarity index 91%
rename from meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.6.bb
rename to meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.7.bb
index 30344bf13f..50f3f2a1e2 100644
--- a/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.6.bb
+++ b/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.7.bb
@@ -7,7 +7,7 @@ SECTION = "net"
 DEPENDS = "file"
 
 SRC_URI = "${GNU_MIRROR}/libmicrohttpd/${BPN}-${PV}.tar.gz"
-SRC_URI[sha256sum] = "bb5cfcadfc52dbd5eb512d6e2995e0361351c33e97a87aba426d3a4a7ba6cf70"
+SRC_URI[sha256sum] = "827250db649546cdb04bea01f5f0560f0edffde9130e256387d1f977242eaf98"
 
 inherit autotools lib_package pkgconfig gettext
 
-- 
2.47.1


--===============3219017931797014083==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/libmicrohttpd: SRC_URI changed from "https://ftpmirror.gnu.org/gnu/libmicrohttpd/libmicrohttpd-1.0.6.tar.gz" to "https://ftpmirror.gnu.org/gnu/libmicrohttpd/libmicrohttpd-1.0.7.tar.gz"
packages/x86-64-v3-poky-linux/libmicrohttpd: PKGV changed from 1.0.6 [default] to 1.0.7 [default]
packages/x86-64-v3-poky-linux/libmicrohttpd: PV changed from "1.0.6" to "1.0.7"
packages/x86-64-v3-poky-linux/libmicrohttpd/libmicrohttpd-bin: PKGV changed from 1.0.6 [default] to 1.0.7 [default]
packages/x86-64-v3-poky-linux/libmicrohttpd/libmicrohttpd-bin: PV changed from "1.0.6" to "1.0.7"
packages/x86-64-v3-poky-linux/libmicrohttpd/libmicrohttpd-dbg: PKGSIZE changed from 874808 to 875184 (+0%)
packages/x86-64-v3-poky-linux/libmicrohttpd/libmicrohttpd-dbg: PKGV changed from 1.0.6 [default] to 1.0.7 [default]
packages/x86-64-v3-poky-linux/libmicrohttpd/libmicrohttpd-dbg: PV changed from "1.0.6" to "1.0.7"
packages/x86-64-v3-poky-linux/libmicrohttpd/libmicrohttpd-dbg: FILELIST: removed "/usr/lib/.debug/libmicrohttpd.so.12.62.4", added "/usr/lib/.debug/libmicrohttpd.so.12.62.5"
packages/x86-64-v3-poky-linux/libmicrohttpd/libmicrohttpd-dev: PKGV changed from 1.0.6 [default] to 1.0.7 [default]
packages/x86-64-v3-poky-linux/libmicrohttpd/libmicrohttpd-dev: PV changed from "1.0.6" to "1.0.7"
packages/x86-64-v3-poky-linux/libmicrohttpd/libmicrohttpd-doc: PKGV changed from 1.0.6 [default] to 1.0.7 [default]
packages/x86-64-v3-poky-linux/libmicrohttpd/libmicrohttpd-doc: PV changed from "1.0.6" to "1.0.7"
packages/x86-64-v3-poky-linux/libmicrohttpd/libmicrohttpd-locale: PKGV changed from 1.0.6 [default] to 1.0.7 [default]
packages/x86-64-v3-poky-linux/libmicrohttpd/libmicrohttpd-locale: PV changed from "1.0.6" to "1.0.7"
packages/x86-64-v3-poky-linux/libmicrohttpd/libmicrohttpd-src: PKGSIZE changed from 1688718 to 1689355 (+0%)
packages/x86-64-v3-poky-linux/libmicrohttpd/libmicrohttpd-src: PKGV changed from 1.0.6 [default] to 1.0.7 [default]
packages/x86-64-v3-poky-linux/libmicrohttpd/libmicrohttpd-src: PV changed from "1.0.6" to "1.0.7"
packages/x86-64-v3-poky-linux/libmicrohttpd/libmicrohttpd-src: FILELIST: directory renamed /usr/src/debug/libmicrohttpd/1.0.6/src/microhttpd -> /usr/src/debug/libmicrohttpd/1.0.7/src/microhttpd, directory renamed /usr/src/debug/libmicrohttpd/1.0.6/src/include -> /usr/src/debug/libmicrohttpd/1.0.7/src/include
packages/x86-64-v3-poky-linux/libmicrohttpd/libmicrohttpd-staticdev: PKGV changed from 1.0.6 [default] to 1.0.7 [default]
packages/x86-64-v3-poky-linux/libmicrohttpd/libmicrohttpd-staticdev: PV changed from "1.0.6" to "1.0.7"
packages/x86-64-v3-poky-linux/libmicrohttpd/libmicrohttpd: PKGV changed from 1.0.6 [default] to 1.0.7 [default]
packages/x86-64-v3-poky-linux/libmicrohttpd/libmicrohttpd: PV changed from "1.0.6" to "1.0.7"
packages/x86-64-v3-poky-linux/libmicrohttpd/libmicrohttpd: FILELIST: removed "/usr/lib/libmicrohttpd.so.12.62.4", added "/usr/lib/libmicrohttpd.so.12.62.5"
Changes to packages/x86-64-v3-poky-linux/libmicrohttpd (sysroot):
  /usr/lib/libmicrohttpd.so.12 changed symlink target from libmicrohttpd.so.12.62.4 to libmicrohttpd.so.12.62.5
  /usr/lib/libmicrohttpd.so changed symlink target from libmicrohttpd.so.12.62.4 to libmicrohttpd.so.12.62.5
  /usr/lib/libmicrohttpd.so.12.62.4 moved to /usr/lib/libmicrohttpd.so.12.62.5
Changes to packages/x86_64-linux/libmicrohttpd-native (sysroot):
  /usr/lib/libmicrohttpd.so.12 changed symlink target from libmicrohttpd.so.12.62.4 to libmicrohttpd.so.12.62.5
  /usr/lib/libmicrohttpd.so changed symlink target from libmicrohttpd.so.12.62.4 to libmicrohttpd.so.12.62.5
  /usr/lib/libmicrohttpd.so.12.62.4 moved to /usr/lib/libmicrohttpd.so.12.62.5

--===============3219017931797014083==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libmicrohttpd-upgrade-1.0.6-1.0.7.patch"

RnJvbSBkNjdiNDk0ZmNmMDUyYWFhMGE5OWIyMzc1NjBkYzkyZTlhMTE4OTk2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMjggSnVsIDIwMjYgMDU6MzM6NDUgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJtaWNyb2h0dHBkOiB1cGdyYWRlIDEuMC42IC0+IDEuMC43CgpTb3VyY2U6IENoYW5nZUxvZwoK
TW9uIEp1bCAyNyAwNjoxMjowMyBQTSBDRVNUIDIwMjYKICAgIEZpeGluZyB2YXJpb3VzIHZ1bG5l
cmFiaWxpdGllcyByZXBvcnRlZCBieSBBLiBSYW1vcyByZXN1bHRpbmcKICAgIGluIHBvc3NpYmxl
IGNyYXNoZXMgb3Igb3V0LW9mLWJvdW5kcyBzdGFjayB3cml0ZXMgZm9yIGNlcnRhaW4KICAgIHJl
cXVlc3RzIGluIHNwZWNpZmljIGNvbmZpZ3VyYXRpb25zLgogICAgUmVsZWFzaW5nIEdOVSBsaWJt
aWNyb2h0dHBkIDEuMC43LiAtQ0cKLS0tCiAuLi4ve2xpYm1pY3JvaHR0cGRfMS4wLjYuYmIgPT4g
bGlibWljcm9odHRwZF8xLjAuNy5iYn0gICAgICAgICAgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwg
MSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtc3VwcG9y
dC9saWJtaWNyb2h0dHBkL3tsaWJtaWNyb2h0dHBkXzEuMC42LmJiID0+IGxpYm1pY3JvaHR0cGRf
MS4wLjcuYmJ9ICg5MSUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGlibWlj
cm9odHRwZC9saWJtaWNyb2h0dHBkXzEuMC42LmJiIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGli
bWljcm9odHRwZC9saWJtaWNyb2h0dHBkXzEuMC43LmJiCnNpbWlsYXJpdHkgaW5kZXggOTElCnJl
bmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYm1pY3JvaHR0cGQvbGlibWljcm9odHRw
ZF8xLjAuNi5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGlibWljcm9odHRwZC9s
aWJtaWNyb2h0dHBkXzEuMC43LmJiCmluZGV4IDMwMzQ0YmYxM2YuLjUwZjNmMmExZTIgMTAwNjQ0
Ci0tLSBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYm1pY3JvaHR0cGQvbGlibWljcm9odHRwZF8x
LjAuNi5iYgorKysgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJtaWNyb2h0dHBkL2xpYm1pY3Jv
aHR0cGRfMS4wLjcuYmIKQEAgLTcsNyArNyw3IEBAIFNFQ1RJT04gPSAibmV0IgogREVQRU5EUyA9
ICJmaWxlIgogCiBTUkNfVVJJID0gIiR7R05VX01JUlJPUn0vbGlibWljcm9odHRwZC8ke0JQTn0t
JHtQVn0udGFyLmd6IgotU1JDX1VSSVtzaGEyNTZzdW1dID0gImJiNWNmY2FkZmM1MmRiZDVlYjUx
MmQ2ZTI5OTVlMDM2MTM1MWMzM2U5N2E4N2FiYTQyNmQzYTRhN2JhNmNmNzAiCitTUkNfVVJJW3No
YTI1NnN1bV0gPSAiODI3MjUwZGI2NDk1NDZjZGIwNGJlYTAxZjVmMDU2MGYwZWRmZmRlOTEzMGUy
NTYzODdkMWY5NzcyNDJlYWY5OCIKIAogaW5oZXJpdCBhdXRvdG9vbHMgbGliX3BhY2thZ2UgcGtn
Y29uZmlnIGdldHRleHQKIAotLSAKMi40Ny4xCgo=

--===============3219017931797014083==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="libmicrohttpd-changelog.txt"

Changelog for libmicrohttpd: 1.0.6 -> 1.0.7
Source: ChangeLog

Mon Jul 27 06:12:03 PM CEST 2026
    Fixing various vulnerabilities reported by A. Ramos resulting
    in possible crashes or out-of-bounds stack writes for certain
    requests in specific configurations.
    Releasing GNU libmicrohttpd 1.0.7. -CG

--===============3219017931797014083==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/libmicrohttpd/libmicrohttpd: FILELIST: removed "/usr/lib/libmicrohttpd.so.12.62.4", added "/usr/lib/libmicrohttpd.so.12.62.5"
Changes to packages/x86-64-v3-poky-linux/libmicrohttpd (sysroot):
  /usr/lib/libmicrohttpd.so.12 changed symlink target from libmicrohttpd.so.12.62.4 to libmicrohttpd.so.12.62.5
  /usr/lib/libmicrohttpd.so changed symlink target from libmicrohttpd.so.12.62.4 to libmicrohttpd.so.12.62.5
  /usr/lib/libmicrohttpd.so.12.62.4 moved to /usr/lib/libmicrohttpd.so.12.62.5
Changes to packages/x86_64-linux/libmicrohttpd-native (sysroot):
  /usr/lib/libmicrohttpd.so.12 changed symlink target from libmicrohttpd.so.12.62.4 to libmicrohttpd.so.12.62.5
  /usr/lib/libmicrohttpd.so changed symlink target from libmicrohttpd.so.12.62.4 to libmicrohttpd.so.12.62.5
  /usr/lib/libmicrohttpd.so.12.62.4 moved to /usr/lib/libmicrohttpd.so.12.62.5

--===============3219017931797014083==--

