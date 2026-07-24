Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4DA4C531C9
	for <webhook@archiver.kernel.org>; Fri, 24 Jul 2026 05:43:12 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13275.1784871785175004703
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Jul 2026 22:43:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=UdK9ygqm;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=4LUgF+jc;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101019f92a60f27-69dd66e7-71f2-4f0c-9ba5-20d4c0bf7238-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1784871784;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=gn9PVwUoAcZLozWL2hRc6A4BWCAMk4D4UkEr3Xr4cek=;
	b=UdK9ygqmvI9/0b75oVaXQjMtmDXaRZdqWSM8CvC/hZzgcZsu9q8TrPJA4ogKA5fo
	bcvlAPg8uBPv0QvZnCCDlxvDqaq2LzwxuOU6C9YzySdNqxbMYlqbxY/hAEpc92b1ZrJ
	2kgqCpqqYDgNqFcjLAtm9y01ZKi6SOq+98Lgl3JI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1784871784;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=gn9PVwUoAcZLozWL2hRc6A4BWCAMk4D4UkEr3Xr4cek=;
	b=4LUgF+jcwJX/gStccBzYZfGNooeJIlecWdxHW/9/Yf35h0x0HWoNXrHE7ljqL9AP
	VHmbvrhEfdViiW/6bLPXtXcUYir8kNS63+HO6AeajUetdzi6jf6XxNtAR+xAtASR2t0
	uFkZG2gyZ1L4A0uSPv103bAygidAPSSW0OVEq43U=
Content-Type: multipart/mixed; boundary="===============6390005602871563457=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Hiago De Franco <hfranco@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libdisplay-info: upgrading to 0.4.0 SUCCEEDED
Message-ID: <0101019f92a60f27-69dd66e7-71f2-4f0c-9ba5-20d4c0bf7238-000000@us-west-2.amazonses.com>
Date: Fri, 24 Jul 2026 05:43:04 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.07.24-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Jul 2026 05:43:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241894

--===============6390005602871563457==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libdisplay-info* to *0.4.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libdisplay-info-upgrade-0.3.0-0.4.0.patch
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
From 0144f19975328941b365aeb0c4b24d7b7ae6cd4c Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 24 Jul 2026 05:42:57 +0000
Subject: [PATCH] libdisplay-info: upgrade 0.3.0 -> 0.4.0

c67a3e9 build: bump version to 0.4.0
772d506 build: disable most v4l-utils options by default
d77a2e5 cta: switch error handling to negative error number away from errno
8057b29 edid: fix potential overflow in shift operation
99d8394 cta: add a few missing return on failures
c5d86fe cta: do not fail when there's a bad Data Block in a CTA extension
d18dd43 cta: cosmetic changes to _di_cta_data_block_parse()
824bb14 cta: document that _di_cta_data_block_destroy() accepts zeroed tag
636f24f cta: set errno when we don't have a fatal failure
fd31752 displayid: make _di_displayid_parse_type_1_7_timing() return void
c8f09c0 cta: do not fail when HDMI Vendor Specific Data Block has error
cb5e3ed vic: avoid out-of-bounds array access
baa0e52 di-edid-decode: Avoid crash when printing unknown DMT code
70855b1 ci: Use gcc's static analyzer functionality in the build-gcc job
c61b4b3 edid: Release all resources when parsing a display descriptor fails
53b1009 displayid: Handle failed allocations
84026a7 di-edid-decode: Initialize variables to zero to help analyzers
76f133a cta: Initialize speaker location coordinates to zero
73ec53d info: search CTA blocks in DisplayID v2 extensions
73ab82d info: don't use di_ prefix for static helpers
6feabfe di-edid-decode: add support for DisplayID v2 CTA-861 data blocks
80caacc di-edid-decode: introduce print_cta_data_block()
7324cca displayid2: add support for CTA-861 data blocks
4713505 cta: expose _di_cta_data_block_{parse,destroy}
34b3635 cta: make di_cta.flags optional
d535192 cta: introduce struct di_cta
91c3b83 di-edid-decode: Fix printing unknown DMT codes
ccf012e displayid: Fix double free of cta_vics
d828f86 cta-vic-table: re-generate from CTA-861-I
5a12f3a tool/gen-cta-vic: update for CTA-861-I
e4e0986 displayid: Add support for type IV timings
d3b62b6 displayid: Move checking for reserved header flags to own function
bca559d dmt: Wrap the uint8_t DMT code in struct for type safety
2d98815 di-edid-decode: Move some timing printing to a shared file
9ff243b vic: Wrap the uint8_t HDMI and CTA vic codes in structs for type safety
e5c6fc1 timing: Add reverse lookup from timing definitions to codes
0af6d1d edid: Return DMT codes for Established timings III
0fd2b6b edid: Split out more DMT timing
7899041 cta: Split out HDMI and CTA VIC lookup
788c056 displayid2: decode data blocks structure
0dee020 test: add asus-ux3405
55b45d4 displayid: drop logger_add_failure()
84e8da3 cta: include sys/types.h
4daae7d ci: disable require-allow-collaboration check
69d12ff build: bump version to 0.4.0-dev
---
 .../{libdisplay-info_0.3.0.bb => libdisplay-info_0.4.0.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/libdisplay-info/{libdisplay-info_0.3.0.bb => libdisplay-info_0.4.0.bb} (92%)

diff --git a/meta/recipes-support/libdisplay-info/libdisplay-info_0.3.0.bb b/meta/recipes-support/libdisplay-info/libdisplay-info_0.4.0.bb
similarity index 92%
rename from meta/recipes-support/libdisplay-info/libdisplay-info_0.3.0.bb
rename to meta/recipes-support/libdisplay-info/libdisplay-info_0.4.0.bb
index 380c12b867..d993bf1061 100644
--- a/meta/recipes-support/libdisplay-info/libdisplay-info_0.3.0.bb
+++ b/meta/recipes-support/libdisplay-info/libdisplay-info_0.4.0.bb
@@ -9,6 +9,6 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=e4426409957080ee0352128354cea2de"
 DEPENDS = "hwdata-native"
 
 SRC_URI = "git://gitlab.freedesktop.org/emersion/libdisplay-info.git;branch=main;protocol=https;tag=${PV}"
-SRCREV = "47a5590e9c4eb35d67651b8c05a55f1a48259329"
+SRCREV = "c67a3e9bedb05ab61c7443704a1a107e76254595"
 
 inherit meson pkgconfig lib_package
-- 
2.47.1


--===============6390005602871563457==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/libdisplay-info: SRC_URI changed from "git://gitlab.freedesktop.org/emersion/libdisplay-info.git;branch=main;protocol=https;tag=0.3.0" to "git://gitlab.freedesktop.org/emersion/libdisplay-info.git;branch=main;protocol=https;tag=0.4.0"
packages/x86-64-v3-poky-linux/libdisplay-info: PV changed from "0.3.0" to "0.4.0"
packages/x86-64-v3-poky-linux/libdisplay-info: PKGV changed from 0.3.0 [default] to 0.4.0 [default]
packages/x86-64-v3-poky-linux/libdisplay-info/libdisplay-info-bin: PV changed from "0.3.0" to "0.4.0"
packages/x86-64-v3-poky-linux/libdisplay-info/libdisplay-info-bin: PKGV changed from 0.3.0 [default] to 0.4.0 [default]
packages/x86-64-v3-poky-linux/libdisplay-info/libdisplay-info-dbg: PV changed from "0.3.0" to "0.4.0"
packages/x86-64-v3-poky-linux/libdisplay-info/libdisplay-info-dbg: PKGSIZE changed from 781376 to 812376 (+4%)
packages/x86-64-v3-poky-linux/libdisplay-info/libdisplay-info-dbg: FILELIST: removed "/usr/lib/.debug/libdisplay-info.so.0.3.0", added "/usr/lib/.debug/libdisplay-info.so.0.4.0"
packages/x86-64-v3-poky-linux/libdisplay-info/libdisplay-info-dbg: PKGV changed from 0.3.0 [default] to 0.4.0 [default]
packages/x86-64-v3-poky-linux/libdisplay-info/libdisplay-info-dev: PV changed from "0.3.0" to "0.4.0"
packages/x86-64-v3-poky-linux/libdisplay-info/libdisplay-info-dev: PKGSIZE changed from 104854 to 110459 (+5%)
packages/x86-64-v3-poky-linux/libdisplay-info/libdisplay-info-dev: FILELIST: added "/usr/include/libdisplay-info/hdmi-vic.h /usr/include/libdisplay-info/cta-vic.h"
packages/x86-64-v3-poky-linux/libdisplay-info/libdisplay-info-dev: PKGV changed from 0.3.0 [default] to 0.4.0 [default]
packages/x86-64-v3-poky-linux/libdisplay-info/libdisplay-info-doc: PV changed from "0.3.0" to "0.4.0"
packages/x86-64-v3-poky-linux/libdisplay-info/libdisplay-info-doc: PKGV changed from 0.3.0 [default] to 0.4.0 [default]
packages/x86-64-v3-poky-linux/libdisplay-info/libdisplay-info-locale: PV changed from "0.3.0" to "0.4.0"
packages/x86-64-v3-poky-linux/libdisplay-info/libdisplay-info-locale: PKGV changed from 0.3.0 [default] to 0.4.0 [default]
packages/x86-64-v3-poky-linux/libdisplay-info/libdisplay-info-src: PV changed from "0.3.0" to "0.4.0"
packages/x86-64-v3-poky-linux/libdisplay-info/libdisplay-info-src: PKGSIZE changed from 633321 to 664494 (+5%)
packages/x86-64-v3-poky-linux/libdisplay-info/libdisplay-info-src: FILELIST: removed "/usr/src/debug/libdisplay-info/0.3.0/displayid.c /usr/src/debug/libdisplay-info/0.3.0/include/libdisplay-info/displayid2.h /usr/src/debug/libdisplay-info/0.3.0/di-edid-decode/displayid2.c /usr/src/debug/libdisplay-info/0.3.0/include/bits.h /usr/src/debug/libdisplay-info/0.3.0/include/libdisplay-info/displayid.h /usr/src/debug/libdisplay-info/0.3.0/include/di-edid-decode.h /usr/src/debug/libdisplay-info/0.3.0/include/libdisplay-info/cvt.h /usr/src/debug/libdisplay-info/0.3.0/include/libdisplay-info/dmt.h /usr/src/debug/libdisplay-info/0.3.0/include/libdisplay-info/gtf.h /usr/src/debug/libdisplay-info/0.3.0/include/libdisplay-info/cta.h /usr/src/debug/libdisplay-info/0.3.0/include/displayid.h /usr/src/debug/libdisplay-info/0.3.0/cta-vic-table.c /usr/src/debug/libdisplay-info/0.3.0/hdmi-vic-table.c /usr/src/debug/libdisplay-info/0.3.0/displayid2.c /usr/src/debug/libdisplay-info/0.3.0/include/info.h /us
 r/src/debug/libdisplay-info/0.3.0/pnp-id-table.c /usr/src/debug/libdisplay-info/0.3.0/di-edid-decode/displayid.c /usr/src/debug/libdisplay-info/0.3.0/info.c /usr/src/debug/libdisplay-info/0.3.0/include/cta.h /usr/src/debug/libdisplay-info/0.3.0/di-edid-decode/edid.c /usr/src/debug/libdisplay-info/0.3.0/di-edid-decode/main.c /usr/src/debug/libdisplay-info/0.3.0/di-edid-decode/util.c /usr/src/debug/libdisplay-info/0.3.0/include/dmt.h /usr/src/debug/libdisplay-info/0.3.0/include/log.h /usr/src/debug/libdisplay-info/0.3.0/memory-stream.c /usr/src/debug/libdisplay-info/0.3.0/include/edid.h /usr/src/debug/libdisplay-info/0.3.0/include/displayid2.h /usr/src/debug/libdisplay-info/0.3.0/include/libdisplay-info/edid.h /usr/src/debug/libdisplay-info/0.3.0/edid.c /usr/src/debug/libdisplay-info/0.3.0/dmt-table.c /usr/src/debug/libdisplay-info/0.3.0/di-edid-decode/cta.c /usr/src/debug/libdisplay-info/0.3.0/cvt.c /usr/src/debug/libdisplay-info/0.3.0/cta.c /usr/src/debug/libdisplay-info/0.3.0/gtf.c
  /usr/src/debug/libdisplay-info/0.3.0/log.c /usr/src/debug/libdisplay-info/0.3.0/include/libdisplay-info/info.h /usr/src/debug/libdisplay-info/0.3.0/include/memory-stream.h", added "/usr/src/debug/libdisplay-info/0.4.0/displayid.c /usr/src/debug/libdisplay-info/0.4.0/include/libdisplay-info/displayid2.h /usr/src/debug/libdisplay-info/0.4.0/di-edid-decode/displayid2.c /usr/src/debug/libdisplay-info/0.4.0/include/bits.h /usr/src/debug/libdisplay-info/0.4.0/include/libdisplay-info/displayid.h /usr/src/debug/libdisplay-info/0.4.0/include/di-edid-decode.h /usr/src/debug/libdisplay-info/0.4.0/include/libdisplay-info/cvt.h /usr/src/debug/libdisplay-info/0.4.0/include/libdisplay-info/dmt.h /usr/src/debug/libdisplay-info/0.4.0/include/libdisplay-info/gtf.h /usr/src/debug/libdisplay-info/0.4.0/include/libdisplay-info/cta.h /usr/src/debug/libdisplay-info/0.4.0/include/displayid.h /usr/src/debug/libdisplay-info/0.4.0/cta-vic-table.c /usr/src/debug/libdisplay-info/0.4.0/include/libdisplay-info/c
 ta-vic.h /usr/src/debug/libdisplay-info/0.4.0/displayid2.c /usr/src/debug/libdisplay-info/0.4.0/di-edid-decode/timing.c /usr/src/debug/libdisplay-info/0.4.0/include/info.h /usr/src/debug/libdisplay-info/0.4.0/pnp-id-table.c /usr/src/debug/libdisplay-info/0.4.0/di-edid-decode/displayid.c /usr/src/debug/libdisplay-info/0.4.0/info.c /usr/src/debug/libdisplay-info/0.4.0/include/cta.h /usr/src/debug/libdisplay-info/0.4.0/di-edid-decode/edid.c /usr/src/debug/libdisplay-info/0.4.0/di-edid-decode/main.c /usr/src/debug/libdisplay-info/0.4.0/di-edid-decode/util.c /usr/src/debug/libdisplay-info/0.4.0/include/log.h /usr/src/debug/libdisplay-info/0.4.0/memory-stream.c /usr/src/debug/libdisplay-info/0.4.0/hdmi-vic.c /usr/src/debug/libdisplay-info/0.4.0/include/edid.h /usr/src/debug/libdisplay-info/0.4.0/include/displayid2.h /usr/src/debug/libdisplay-info/0.4.0/include/libdisplay-info/edid.h /usr/src/debug/libdisplay-info/0.4.0/edid.c /usr/src/debug/libdisplay-info/0.4.0/cta-vic.c /usr/src/debug/l
 ibdisplay-info/0.4.0/dmt-table.c /usr/src/debug/libdisplay-info/0.4.0/di-edid-decode/cta.c /usr/src/debug/libdisplay-info/0.4.0/cvt.c /usr/src/debug/libdisplay-info/0.4.0/cta.c /usr/src/debug/libdisplay-info/0.4.0/dmt.c /usr/src/debug/libdisplay-info/0.4.0/gtf.c /usr/src/debug/libdisplay-info/0.4.0/log.c /usr/src/debug/libdisplay-info/0.4.0/include/libdisplay-info/info.h /usr/src/debug/libdisplay-info/0.4.0/include/libdisplay-info/hdmi-vic.h /usr/src/debug/libdisplay-info/0.4.0/include/memory-stream.h"
packages/x86-64-v3-poky-linux/libdisplay-info/libdisplay-info-src: PKGV changed from 0.3.0 [default] to 0.4.0 [default]
packages/x86-64-v3-poky-linux/libdisplay-info/libdisplay-info-staticdev: PV changed from "0.3.0" to "0.4.0"
packages/x86-64-v3-poky-linux/libdisplay-info/libdisplay-info-staticdev: PKGV changed from 0.3.0 [default] to 0.4.0 [default]
packages/x86-64-v3-poky-linux/libdisplay-info/libdisplay-info: PV changed from "0.3.0" to "0.4.0"
packages/x86-64-v3-poky-linux/libdisplay-info/libdisplay-info: PKGSIZE changed from 231352 to 235448 (+2%)
packages/x86-64-v3-poky-linux/libdisplay-info/libdisplay-info: PKG changed from libdisplay-info3 to libdisplay-info4
packages/x86-64-v3-poky-linux/libdisplay-info/libdisplay-info: FILELIST: removed "/usr/lib/libdisplay-info.so.0.3.0 /usr/lib/libdisplay-info.so.3", added "/usr/lib/libdisplay-info.so.4 /usr/lib/libdisplay-info.so.0.4.0"
packages/x86-64-v3-poky-linux/libdisplay-info/libdisplay-info: PKGV changed from 0.3.0 [default] to 0.4.0 [default]
Changes to packages/x86-64-v3-poky-linux/libdisplay-info (sysroot):
  /usr/lib/libdisplay-info.so changed symlink target from libdisplay-info.so.3 to libdisplay-info.so.4
  /usr/lib/libdisplay-info.so.0.3.0 moved to /usr/lib/libdisplay-info.so.0.4.0
  /usr/lib/libdisplay-info.so.3 moved to /usr/lib/libdisplay-info.so.4
  /usr/include/libdisplay-info/cta-vic.h was added
  /usr/include/libdisplay-info/hdmi-vic.h was added

--===============6390005602871563457==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="libdisplay-info-changelog.txt"

Changelog for libdisplay-info: 0.3.0 -> 0.4.0

c67a3e9 build: bump version to 0.4.0
772d506 build: disable most v4l-utils options by default
d77a2e5 cta: switch error handling to negative error number away from errno
8057b29 edid: fix potential overflow in shift operation
99d8394 cta: add a few missing return on failures
c5d86fe cta: do not fail when there's a bad Data Block in a CTA extension
d18dd43 cta: cosmetic changes to _di_cta_data_block_parse()
824bb14 cta: document that _di_cta_data_block_destroy() accepts zeroed tag
636f24f cta: set errno when we don't have a fatal failure
fd31752 displayid: make _di_displayid_parse_type_1_7_timing() return void
c8f09c0 cta: do not fail when HDMI Vendor Specific Data Block has error
cb5e3ed vic: avoid out-of-bounds array access
baa0e52 di-edid-decode: Avoid crash when printing unknown DMT code
70855b1 ci: Use gcc's static analyzer functionality in the build-gcc job
c61b4b3 edid: Release all resources when parsing a display descriptor fails
53b1009 displayid: Handle failed allocations
84026a7 di-edid-decode: Initialize variables to zero to help analyzers
76f133a cta: Initialize speaker location coordinates to zero
73ec53d info: search CTA blocks in DisplayID v2 extensions
73ab82d info: don't use di_ prefix for static helpers
6feabfe di-edid-decode: add support for DisplayID v2 CTA-861 data blocks
80caacc di-edid-decode: introduce print_cta_data_block()
7324cca displayid2: add support for CTA-861 data blocks
4713505 cta: expose _di_cta_data_block_{parse,destroy}
34b3635 cta: make di_cta.flags optional
d535192 cta: introduce struct di_cta
91c3b83 di-edid-decode: Fix printing unknown DMT codes
ccf012e displayid: Fix double free of cta_vics
d828f86 cta-vic-table: re-generate from CTA-861-I
5a12f3a tool/gen-cta-vic: update for CTA-861-I
e4e0986 displayid: Add support for type IV timings
d3b62b6 displayid: Move checking for reserved header flags to own function
bca559d dmt: Wrap the uint8_t DMT code in struct for type safety
2d98815 di-edid-decode: Move some timing printing to a shared file
9ff243b vic: Wrap the uint8_t HDMI and CTA vic codes in structs for type safety
e5c6fc1 timing: Add reverse lookup from timing definitions to codes
0af6d1d edid: Return DMT codes for Established timings III
0fd2b6b edid: Split out more DMT timing
7899041 cta: Split out HDMI and CTA VIC lookup
788c056 displayid2: decode data blocks structure
0dee020 test: add asus-ux3405
55b45d4 displayid: drop logger_add_failure()
84e8da3 cta: include sys/types.h
4daae7d ci: disable require-allow-collaboration check
69d12ff build: bump version to 0.4.0-dev

--===============6390005602871563457==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/libdisplay-info/libdisplay-info-dev: FILELIST: added "/usr/include/libdisplay-info/cta-vic.h /usr/include/libdisplay-info/hdmi-vic.h"
packages/x86-64-v3-poky-linux/libdisplay-info/libdisplay-info: FILELIST: removed "/usr/lib/libdisplay-info.so.3 /usr/lib/libdisplay-info.so.0.3.0", added "/usr/lib/libdisplay-info.so.4 /usr/lib/libdisplay-info.so.0.4.0"
packages/x86-64-v3-poky-linux/libdisplay-info/libdisplay-info: PKG changed from libdisplay-info3 to libdisplay-info4
Changes to packages/x86-64-v3-poky-linux/libdisplay-info (sysroot):
  /usr/lib/libdisplay-info.so changed symlink target from libdisplay-info.so.3 to libdisplay-info.so.4
  /usr/lib/libdisplay-info.so.0.3.0 moved to /usr/lib/libdisplay-info.so.0.4.0
  /usr/lib/libdisplay-info.so.3 moved to /usr/lib/libdisplay-info.so.4
  /usr/include/libdisplay-info/cta-vic.h was added
  /usr/include/libdisplay-info/hdmi-vic.h was added

--===============6390005602871563457==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libdisplay-info-upgrade-0.3.0-0.4.0.patch"

RnJvbSAwMTQ0ZjE5OTc1MzI4OTQxYjM2NWFlYjBjNGIyNGQ3YjdhZTZjZDRjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMjQgSnVsIDIwMjYgMDU6NDI6NTcgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJkaXNwbGF5LWluZm86IHVwZ3JhZGUgMC4zLjAgLT4gMC40LjAKCmM2N2EzZTkgYnVpbGQ6IGJ1
bXAgdmVyc2lvbiB0byAwLjQuMAo3NzJkNTA2IGJ1aWxkOiBkaXNhYmxlIG1vc3QgdjRsLXV0aWxz
IG9wdGlvbnMgYnkgZGVmYXVsdApkNzdhMmU1IGN0YTogc3dpdGNoIGVycm9yIGhhbmRsaW5nIHRv
IG5lZ2F0aXZlIGVycm9yIG51bWJlciBhd2F5IGZyb20gZXJybm8KODA1N2IyOSBlZGlkOiBmaXgg
cG90ZW50aWFsIG92ZXJmbG93IGluIHNoaWZ0IG9wZXJhdGlvbgo5OWQ4Mzk0IGN0YTogYWRkIGEg
ZmV3IG1pc3NpbmcgcmV0dXJuIG9uIGZhaWx1cmVzCmM1ZDg2ZmUgY3RhOiBkbyBub3QgZmFpbCB3
aGVuIHRoZXJlJ3MgYSBiYWQgRGF0YSBCbG9jayBpbiBhIENUQSBleHRlbnNpb24KZDE4ZGQ0MyBj
dGE6IGNvc21ldGljIGNoYW5nZXMgdG8gX2RpX2N0YV9kYXRhX2Jsb2NrX3BhcnNlKCkKODI0YmIx
NCBjdGE6IGRvY3VtZW50IHRoYXQgX2RpX2N0YV9kYXRhX2Jsb2NrX2Rlc3Ryb3koKSBhY2NlcHRz
IHplcm9lZCB0YWcKNjM2ZjI0ZiBjdGE6IHNldCBlcnJubyB3aGVuIHdlIGRvbid0IGhhdmUgYSBm
YXRhbCBmYWlsdXJlCmZkMzE3NTIgZGlzcGxheWlkOiBtYWtlIF9kaV9kaXNwbGF5aWRfcGFyc2Vf
dHlwZV8xXzdfdGltaW5nKCkgcmV0dXJuIHZvaWQKYzhmMDljMCBjdGE6IGRvIG5vdCBmYWlsIHdo
ZW4gSERNSSBWZW5kb3IgU3BlY2lmaWMgRGF0YSBCbG9jayBoYXMgZXJyb3IKY2I1ZTNlZCB2aWM6
IGF2b2lkIG91dC1vZi1ib3VuZHMgYXJyYXkgYWNjZXNzCmJhYTBlNTIgZGktZWRpZC1kZWNvZGU6
IEF2b2lkIGNyYXNoIHdoZW4gcHJpbnRpbmcgdW5rbm93biBETVQgY29kZQo3MDg1NWIxIGNpOiBV
c2UgZ2NjJ3Mgc3RhdGljIGFuYWx5emVyIGZ1bmN0aW9uYWxpdHkgaW4gdGhlIGJ1aWxkLWdjYyBq
b2IKYzYxYjRiMyBlZGlkOiBSZWxlYXNlIGFsbCByZXNvdXJjZXMgd2hlbiBwYXJzaW5nIGEgZGlz
cGxheSBkZXNjcmlwdG9yIGZhaWxzCjUzYjEwMDkgZGlzcGxheWlkOiBIYW5kbGUgZmFpbGVkIGFs
bG9jYXRpb25zCjg0MDI2YTcgZGktZWRpZC1kZWNvZGU6IEluaXRpYWxpemUgdmFyaWFibGVzIHRv
IHplcm8gdG8gaGVscCBhbmFseXplcnMKNzZmMTMzYSBjdGE6IEluaXRpYWxpemUgc3BlYWtlciBs
b2NhdGlvbiBjb29yZGluYXRlcyB0byB6ZXJvCjczZWM1M2QgaW5mbzogc2VhcmNoIENUQSBibG9j
a3MgaW4gRGlzcGxheUlEIHYyIGV4dGVuc2lvbnMKNzNhYjgyZCBpbmZvOiBkb24ndCB1c2UgZGlf
IHByZWZpeCBmb3Igc3RhdGljIGhlbHBlcnMKNmZlYWJmZSBkaS1lZGlkLWRlY29kZTogYWRkIHN1
cHBvcnQgZm9yIERpc3BsYXlJRCB2MiBDVEEtODYxIGRhdGEgYmxvY2tzCjgwY2FhY2MgZGktZWRp
ZC1kZWNvZGU6IGludHJvZHVjZSBwcmludF9jdGFfZGF0YV9ibG9jaygpCjczMjRjY2EgZGlzcGxh
eWlkMjogYWRkIHN1cHBvcnQgZm9yIENUQS04NjEgZGF0YSBibG9ja3MKNDcxMzUwNSBjdGE6IGV4
cG9zZSBfZGlfY3RhX2RhdGFfYmxvY2tfe3BhcnNlLGRlc3Ryb3l9CjM0YjM2MzUgY3RhOiBtYWtl
IGRpX2N0YS5mbGFncyBvcHRpb25hbApkNTM1MTkyIGN0YTogaW50cm9kdWNlIHN0cnVjdCBkaV9j
dGEKOTFjM2I4MyBkaS1lZGlkLWRlY29kZTogRml4IHByaW50aW5nIHVua25vd24gRE1UIGNvZGVz
CmNjZjAxMmUgZGlzcGxheWlkOiBGaXggZG91YmxlIGZyZWUgb2YgY3RhX3ZpY3MKZDgyOGY4NiBj
dGEtdmljLXRhYmxlOiByZS1nZW5lcmF0ZSBmcm9tIENUQS04NjEtSQo1YTEyZjNhIHRvb2wvZ2Vu
LWN0YS12aWM6IHVwZGF0ZSBmb3IgQ1RBLTg2MS1JCmU0ZTA5ODYgZGlzcGxheWlkOiBBZGQgc3Vw
cG9ydCBmb3IgdHlwZSBJViB0aW1pbmdzCmQzYjYyYjYgZGlzcGxheWlkOiBNb3ZlIGNoZWNraW5n
IGZvciByZXNlcnZlZCBoZWFkZXIgZmxhZ3MgdG8gb3duIGZ1bmN0aW9uCmJjYTU1OWQgZG10OiBX
cmFwIHRoZSB1aW50OF90IERNVCBjb2RlIGluIHN0cnVjdCBmb3IgdHlwZSBzYWZldHkKMmQ5ODgx
NSBkaS1lZGlkLWRlY29kZTogTW92ZSBzb21lIHRpbWluZyBwcmludGluZyB0byBhIHNoYXJlZCBm
aWxlCjlmZjI0M2IgdmljOiBXcmFwIHRoZSB1aW50OF90IEhETUkgYW5kIENUQSB2aWMgY29kZXMg
aW4gc3RydWN0cyBmb3IgdHlwZSBzYWZldHkKZTVjNmZjMSB0aW1pbmc6IEFkZCByZXZlcnNlIGxv
b2t1cCBmcm9tIHRpbWluZyBkZWZpbml0aW9ucyB0byBjb2RlcwowYWY2ZDFkIGVkaWQ6IFJldHVy
biBETVQgY29kZXMgZm9yIEVzdGFibGlzaGVkIHRpbWluZ3MgSUlJCjBmZDJiNmIgZWRpZDogU3Bs
aXQgb3V0IG1vcmUgRE1UIHRpbWluZwo3ODk5MDQxIGN0YTogU3BsaXQgb3V0IEhETUkgYW5kIENU
QSBWSUMgbG9va3VwCjc4OGMwNTYgZGlzcGxheWlkMjogZGVjb2RlIGRhdGEgYmxvY2tzIHN0cnVj
dHVyZQowZGVlMDIwIHRlc3Q6IGFkZCBhc3VzLXV4MzQwNQo1NWI0NWQ0IGRpc3BsYXlpZDogZHJv
cCBsb2dnZXJfYWRkX2ZhaWx1cmUoKQo4NGU4ZGEzIGN0YTogaW5jbHVkZSBzeXMvdHlwZXMuaAo0
ZGFhZTdkIGNpOiBkaXNhYmxlIHJlcXVpcmUtYWxsb3ctY29sbGFib3JhdGlvbiBjaGVjawo2OWQx
MmZmIGJ1aWxkOiBidW1wIHZlcnNpb24gdG8gMC40LjAtZGV2Ci0tLQogLi4uL3tsaWJkaXNwbGF5
LWluZm9fMC4zLjAuYmIgPT4gbGliZGlzcGxheS1pbmZvXzAuNC4wLmJifSAgICAgIHwgMiArLQog
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0
YS9yZWNpcGVzLXN1cHBvcnQvbGliZGlzcGxheS1pbmZvL3tsaWJkaXNwbGF5LWluZm9fMC4zLjAu
YmIgPT4gbGliZGlzcGxheS1pbmZvXzAuNC4wLmJifSAoOTIlKQoKZGlmZiAtLWdpdCBhL21ldGEv
cmVjaXBlcy1zdXBwb3J0L2xpYmRpc3BsYXktaW5mby9saWJkaXNwbGF5LWluZm9fMC4zLjAuYmIg
Yi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJkaXNwbGF5LWluZm8vbGliZGlzcGxheS1pbmZvXzAu
NC4wLmJiCnNpbWlsYXJpdHkgaW5kZXggOTIlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1zdXBw
b3J0L2xpYmRpc3BsYXktaW5mby9saWJkaXNwbGF5LWluZm9fMC4zLjAuYmIKcmVuYW1lIHRvIG1l
dGEvcmVjaXBlcy1zdXBwb3J0L2xpYmRpc3BsYXktaW5mby9saWJkaXNwbGF5LWluZm9fMC40LjAu
YmIKaW5kZXggMzgwYzEyYjg2Ny4uZDk5M2JmMTA2MSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVz
LXN1cHBvcnQvbGliZGlzcGxheS1pbmZvL2xpYmRpc3BsYXktaW5mb18wLjMuMC5iYgorKysgYi9t
ZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJkaXNwbGF5LWluZm8vbGliZGlzcGxheS1pbmZvXzAuNC4w
LmJiCkBAIC05LDYgKzksNiBAQCBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFO21k
NT1lNDQyNjQwOTk1NzA4MGVlMDM1MjEyODM1NGNlYTJkZSIKIERFUEVORFMgPSAiaHdkYXRhLW5h
dGl2ZSIKIAogU1JDX1VSSSA9ICJnaXQ6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL2VtZXJzaW9u
L2xpYmRpc3BsYXktaW5mby5naXQ7YnJhbmNoPW1haW47cHJvdG9jb2w9aHR0cHM7dGFnPSR7UFZ9
IgotU1JDUkVWID0gIjQ3YTU1OTBlOWM0ZWIzNWQ2NzY1MWI4YzA1YTU1ZjFhNDgyNTkzMjkiCitT
UkNSRVYgPSAiYzY3YTNlOWJlZGIwNWFiNjFjNzQ0MzcwNGExYTEwN2U3NjI1NDU5NSIKIAogaW5o
ZXJpdCBtZXNvbiBwa2djb25maWcgbGliX3BhY2thZ2UKLS0gCjIuNDcuMQoK

--===============6390005602871563457==--

