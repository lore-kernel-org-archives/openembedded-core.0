Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CD42C43458
	for <webhook@archiver.kernel.org>; Fri, 10 Jul 2026 07:49:33 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8004.1783669772987550930
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Jul 2026 00:49:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=fopO0CQz;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=DmyXYhVP;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101019f4b00cf5a-243107a1-9ce4-4dac-9d7e-b78916f6a130-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1783669772;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=cxO/BTQRN93a4448YyDoY3VtFBQBla1eX4KuAw/O4BA=;
	b=fopO0CQzuvjFJ4lFao2Hlx1EPZmmahQx1GmALsT8p7VxbdNLAgXMACRucbAqDg3l
	oNZgtKtJyowaUyq7dAqsCj6C1t28p5mrZCV7akTsyOlWpf+Fu4abB1YRtID93xWDfUy
	Mtvw85AvKRtKerhoD5qF1ttInnRD+uYIOsFq3PDc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1783669772;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=cxO/BTQRN93a4448YyDoY3VtFBQBla1eX4KuAw/O4BA=;
	b=DmyXYhVPO7Iw9UJD+KKeCsgYPf9KKcOtJTvnvOJlxgpmtldfRs8pE+L++B3OYdh2
	Dwj8EjBYdWGh6++zYrEd0S9ky1z9M2/1GYJGbvaovH20G3TON/6KKRsOb5JzqzWEx9F
	zlEfn880BpaljRjyxBRNgDkseEGFSbjsZkTU3WZg=
Content-Type: multipart/mixed; boundary="===============4366394569089518814=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] libmicrohttpd: upgrading to 1.0.6 SUCCEEDED
Message-ID: <0101019f4b00cf5a-243107a1-9ce4-4dac-9d7e-b78916f6a130-000000@us-west-2.amazonses.com>
Date: Fri, 10 Jul 2026 07:49:32 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.07.10-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Jul 2026 07:49:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240613

--===============4366394569089518814==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libmicrohttpd* to *1.0.6* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libmicrohttpd-upgrade-1.0.5-1.0.6.patch
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
From db40aded33aafc7dab57af519b647696cc653637 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 10 Jul 2026 07:49:22 +0000
Subject: [PATCH] libmicrohttpd: upgrade 1.0.5 -> 1.0.6

---
 .../{libmicrohttpd_1.0.5.bb => libmicrohttpd_1.0.6.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/libmicrohttpd/{libmicrohttpd_1.0.5.bb => libmicrohttpd_1.0.6.bb} (91%)

diff --git a/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.5.bb b/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.6.bb
similarity index 91%
rename from meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.5.bb
rename to meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.6.bb
index 935fbfcf89..30344bf13f 100644
--- a/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.5.bb
+++ b/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.6.bb
@@ -7,7 +7,7 @@ SECTION = "net"
 DEPENDS = "file"
 
 SRC_URI = "${GNU_MIRROR}/libmicrohttpd/${BPN}-${PV}.tar.gz"
-SRC_URI[sha256sum] = "b46d00f58efa6f497b97d2e782c4ee66301d412ddd855dd3068518b3a2cd3ea2"
+SRC_URI[sha256sum] = "bb5cfcadfc52dbd5eb512d6e2995e0361351c33e97a87aba426d3a4a7ba6cf70"
 
 inherit autotools lib_package pkgconfig gettext
 
-- 
2.47.1


--===============4366394569089518814==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/libmicrohttpd/libmicrohttpd: FILELIST: removed "/usr/lib/libmicrohttpd.so.12.62.3", added "/usr/lib/libmicrohttpd.so.12.62.4"
Changes to packages/x86-64-v3-poky-linux/libmicrohttpd (sysroot):
  /usr/lib/libmicrohttpd.so.12 changed symlink target from libmicrohttpd.so.12.62.3 to libmicrohttpd.so.12.62.4
  /usr/lib/libmicrohttpd.so changed symlink target from libmicrohttpd.so.12.62.3 to libmicrohttpd.so.12.62.4
  /usr/lib/libmicrohttpd.so.12.62.3 moved to /usr/lib/libmicrohttpd.so.12.62.4
Changes to packages/x86_64-linux/gawk-native (sysroot):
  /usr/bin/gawk-5.4.1 moved to /usr/bin/gawk-5.4.0
Changes to packages/x86_64-linux/libmicrohttpd-native (sysroot):
  /usr/lib/libmicrohttpd.so.12 changed symlink target from libmicrohttpd.so.12.62.3 to libmicrohttpd.so.12.62.4
  /usr/lib/libmicrohttpd.so changed symlink target from libmicrohttpd.so.12.62.3 to libmicrohttpd.so.12.62.4
  /usr/lib/libmicrohttpd.so.12.62.3 moved to /usr/lib/libmicrohttpd.so.12.62.4

--===============4366394569089518814==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libmicrohttpd-upgrade-1.0.5-1.0.6.patch"

RnJvbSBkYjQwYWRlZDMzYWFmYzdkYWI1N2FmNTE5YjY0NzY5NmNjNjUzNjM3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMTAgSnVsIDIwMjYgMDc6NDk6MjIgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJtaWNyb2h0dHBkOiB1cGdyYWRlIDEuMC41IC0+IDEuMC42CgotLS0KIC4uLi97bGlibWljcm9o
dHRwZF8xLjAuNS5iYiA9PiBsaWJtaWNyb2h0dHBkXzEuMC42LmJifSAgICAgICAgICB8IDIgKy0K
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1l
dGEvcmVjaXBlcy1zdXBwb3J0L2xpYm1pY3JvaHR0cGQve2xpYm1pY3JvaHR0cGRfMS4wLjUuYmIg
PT4gbGlibWljcm9odHRwZF8xLjAuNi5iYn0gKDkxJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lw
ZXMtc3VwcG9ydC9saWJtaWNyb2h0dHBkL2xpYm1pY3JvaHR0cGRfMS4wLjUuYmIgYi9tZXRhL3Jl
Y2lwZXMtc3VwcG9ydC9saWJtaWNyb2h0dHBkL2xpYm1pY3JvaHR0cGRfMS4wLjYuYmIKc2ltaWxh
cml0eSBpbmRleCA5MSUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGlibWljcm9o
dHRwZC9saWJtaWNyb2h0dHBkXzEuMC41LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtc3VwcG9y
dC9saWJtaWNyb2h0dHBkL2xpYm1pY3JvaHR0cGRfMS4wLjYuYmIKaW5kZXggOTM1ZmJmY2Y4OS4u
MzAzNDRiZjEzZiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGlibWljcm9odHRw
ZC9saWJtaWNyb2h0dHBkXzEuMC41LmJiCisrKyBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYm1p
Y3JvaHR0cGQvbGlibWljcm9odHRwZF8xLjAuNi5iYgpAQCAtNyw3ICs3LDcgQEAgU0VDVElPTiA9
ICJuZXQiCiBERVBFTkRTID0gImZpbGUiCiAKIFNSQ19VUkkgPSAiJHtHTlVfTUlSUk9SfS9saWJt
aWNyb2h0dHBkLyR7QlBOfS0ke1BWfS50YXIuZ3oiCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiYjQ2
ZDAwZjU4ZWZhNmY0OTdiOTdkMmU3ODJjNGVlNjYzMDFkNDEyZGRkODU1ZGQzMDY4NTE4YjNhMmNk
M2VhMiIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICJiYjVjZmNhZGZjNTJkYmQ1ZWI1MTJkNmUyOTk1
ZTAzNjEzNTFjMzNlOTdhODdhYmE0MjZkM2E0YTdiYTZjZjcwIgogCiBpbmhlcml0IGF1dG90b29s
cyBsaWJfcGFja2FnZSBwa2djb25maWcgZ2V0dGV4dAogCi0tIAoyLjQ3LjEKCg==

--===============4366394569089518814==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/gcc-runtime/gcc-runtime-src: PKGSIZE changed from 11330424 to 11130992 (-2%)
packages/x86-64-v3-poky-linux/libmicrohttpd: SRC_URI changed from "https://ftpmirror.gnu.org/gnu/libmicrohttpd/libmicrohttpd-1.0.5.tar.gz" to "https://ftpmirror.gnu.org/gnu/libmicrohttpd/libmicrohttpd-1.0.6.tar.gz"
packages/x86-64-v3-poky-linux/libmicrohttpd: PV changed from "1.0.5" to "1.0.6"
packages/x86-64-v3-poky-linux/libmicrohttpd: PKGV changed from 1.0.5 [default] to 1.0.6 [default]
packages/x86-64-v3-poky-linux/libmicrohttpd/libmicrohttpd-bin: PV changed from "1.0.5" to "1.0.6"
packages/x86-64-v3-poky-linux/libmicrohttpd/libmicrohttpd-bin: PKGV changed from 1.0.5 [default] to 1.0.6 [default]
packages/x86-64-v3-poky-linux/libmicrohttpd/libmicrohttpd-dbg: FILELIST: removed "/usr/lib/.debug/libmicrohttpd.so.12.62.3", added "/usr/lib/.debug/libmicrohttpd.so.12.62.4"
packages/x86-64-v3-poky-linux/libmicrohttpd/libmicrohttpd-dbg: PKGSIZE changed from 875624 to 874808 (-0%)
packages/x86-64-v3-poky-linux/libmicrohttpd/libmicrohttpd-dbg: PV changed from "1.0.5" to "1.0.6"
packages/x86-64-v3-poky-linux/libmicrohttpd/libmicrohttpd-dbg: PKGV changed from 1.0.5 [default] to 1.0.6 [default]
packages/x86-64-v3-poky-linux/libmicrohttpd/libmicrohttpd-dev: PV changed from "1.0.5" to "1.0.6"
packages/x86-64-v3-poky-linux/libmicrohttpd/libmicrohttpd-dev: PKGV changed from 1.0.5 [default] to 1.0.6 [default]
packages/x86-64-v3-poky-linux/libmicrohttpd/libmicrohttpd-doc: PV changed from "1.0.5" to "1.0.6"
packages/x86-64-v3-poky-linux/libmicrohttpd/libmicrohttpd-doc: PKGV changed from 1.0.5 [default] to 1.0.6 [default]
packages/x86-64-v3-poky-linux/libmicrohttpd/libmicrohttpd-locale: PV changed from "1.0.5" to "1.0.6"
packages/x86-64-v3-poky-linux/libmicrohttpd/libmicrohttpd-locale: PKGV changed from 1.0.5 [default] to 1.0.6 [default]
packages/x86-64-v3-poky-linux/libmicrohttpd/libmicrohttpd-src: FILELIST: directory renamed /usr/src/debug/libmicrohttpd/1.0.5/src/include -> /usr/src/debug/libmicrohttpd/1.0.6/src/include, directory renamed /usr/src/debug/libmicrohttpd/1.0.5/src/microhttpd -> /usr/src/debug/libmicrohttpd/1.0.6/src/microhttpd
packages/x86-64-v3-poky-linux/libmicrohttpd/libmicrohttpd-src: PKGSIZE changed from 1687563 to 1688718 (+0%)
packages/x86-64-v3-poky-linux/libmicrohttpd/libmicrohttpd-src: PV changed from "1.0.5" to "1.0.6"
packages/x86-64-v3-poky-linux/libmicrohttpd/libmicrohttpd-src: PKGV changed from 1.0.5 [default] to 1.0.6 [default]
packages/x86-64-v3-poky-linux/libmicrohttpd/libmicrohttpd-staticdev: PV changed from "1.0.5" to "1.0.6"
packages/x86-64-v3-poky-linux/libmicrohttpd/libmicrohttpd-staticdev: PKGV changed from 1.0.5 [default] to 1.0.6 [default]
packages/x86-64-v3-poky-linux/libmicrohttpd/libmicrohttpd: PKGSIZE changed from 256008 to 251912 (-2%)
packages/x86-64-v3-poky-linux/libmicrohttpd/libmicrohttpd: FILELIST: removed "/usr/lib/libmicrohttpd.so.12.62.3", added "/usr/lib/libmicrohttpd.so.12.62.4"
packages/x86-64-v3-poky-linux/libmicrohttpd/libmicrohttpd: PV changed from "1.0.5" to "1.0.6"
packages/x86-64-v3-poky-linux/libmicrohttpd/libmicrohttpd: PKGV changed from 1.0.5 [default] to 1.0.6 [default]
Changes to packages/x86-64-v3-poky-linux/libmicrohttpd (sysroot):
  /usr/lib/libmicrohttpd.so.12 changed symlink target from libmicrohttpd.so.12.62.3 to libmicrohttpd.so.12.62.4
  /usr/lib/libmicrohttpd.so changed symlink target from libmicrohttpd.so.12.62.3 to libmicrohttpd.so.12.62.4
  /usr/lib/libmicrohttpd.so.12.62.3 moved to /usr/lib/libmicrohttpd.so.12.62.4
Changes to packages/x86_64-linux/gawk-native (sysroot):
  /usr/bin/gawk-5.4.1 moved to /usr/bin/gawk-5.4.0
Changes to packages/x86_64-linux/libmicrohttpd-native (sysroot):
  /usr/lib/libmicrohttpd.so.12 changed symlink target from libmicrohttpd.so.12.62.3 to libmicrohttpd.so.12.62.4
  /usr/lib/libmicrohttpd.so changed symlink target from libmicrohttpd.so.12.62.3 to libmicrohttpd.so.12.62.4
  /usr/lib/libmicrohttpd.so.12.62.3 moved to /usr/lib/libmicrohttpd.so.12.62.4

--===============4366394569089518814==--

