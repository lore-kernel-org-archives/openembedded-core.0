Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 874EFC47DDB
	for <webhook@archiver.kernel.org>; Thu,  1 Feb 2024 05:20:49 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web11.9064.1706764839837071021
 for <openembedded-core@lists.openembedded.org>;
 Wed, 31 Jan 2024 21:20:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=SmvX9LCx;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1706764840; x=1738300840;
  h=from:to:cc:subject:date:message-id;
  bh=4GLiSUYwaoCrkvorkE8R+QRRjw2cqEyMyDfgqUB8eic=;
  b=SmvX9LCx8wl2YcSWhGkhFgW04LfesIDKPIijK8jG2QxLzenL5g66N33+
   Zsz93OkWxRfywwrQgaPO8gFjpiqVzDI78pRAp1aSM06AYBHgfXuVzRa0V
   B2UB1wiBSXgf6rplw/F5JdBWTgSRLCuh0PfyIqhSfWWE85QQJA6VWzCZT
   Ea2nzjzXT2blITDSywJEpFtqxyymMMF3J0TQhTuzcnnt8DdanCB5QHPqy
   /EHWEBvk5vgZEKneXuQROBCKOo0KeCS3TBG/Z7uqZcAgGBkFGM+RLywh1
   RwtcHfBDOGvh5CN7qAbpkVyUqu5rf52Z5uRPg1vAAPA+AbZL3Xido/R7b
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="127311069"
X-IronPort-AV: E=Sophos;i="6.05,234,1701097200"; 
   d="scan'208";a="127311069"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2024 14:20:37 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 046A3D4806
	for <openembedded-core@lists.openembedded.org>; Thu,  1 Feb 2024 14:20:35 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 345DAD5303
	for <openembedded-core@lists.openembedded.org>; Thu,  1 Feb 2024 14:20:34 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id A5CE56B4D9
	for <openembedded-core@lists.openembedded.org>; Thu,  1 Feb 2024 14:20:33 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 2BD431A006A;
	Thu,  1 Feb 2024 13:20:33 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] libpng: upgrade 1.6.40 -> 1.6.41
Date: Thu,  1 Feb 2024 13:18:30 +0800
Message-Id: <1706764710-12596-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28156.000
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28156.000
X-TMASE-Result: 10-1.931500-10.000000
X-TMASE-MatchedRID: bwTBD8UNLVWjz0nOeth/yUIIxwDaU5mrajzNTFMlQCMtorPLNYrwZCmF
	OYJJbPqple1SEYlyiKRUwnRxdSxtg67L5ELdZx3rCRsJ4lFzPjNiWBZa0oBo6FSOymiJfTYXxJQ
	rKK8r4nc9WRvbmI8erPS2RzG22s++uIyoVyyka/dZNYSHk3Zr0fG6GRFYrbYYRQ0dAChl/lyLcY
	4IaAaI5i0Z2IlORVSLenmD2BglYMsbAxBQtNeYriAWHOR37+ATa9qiaDSLgo3g+IOnD53pQr6px
	bTOjavy+7QcRaVoa8nGKIf6hBf7VaGGOyqBK41vEXjPIvKd74CbQfYveSNCCg3lqQV07qgTssbE
	kSX6c0lrLf3+bsA/g4sO0CwAwPo6mHmoWTamhgtvTnqYKYXTRlXgGeVUh3WdmyiLZetSf8lBgw5
	G4NYCZN9pjzubZ2rHJ0RPnyOnrZIMyIWoNdHy0rwOsKf0TI9XZHthtp8M1G7LajZEe2ssIFDxgq
	6sCUOm/5tUQvrPQ1Rn9aMvIyQLHtPYrl6VAbPoWGBLcJ4xEx5Lv5Eyr/YIrqsDhztRXZ9Cm+LY9
	A78UVCLPa6Os9XH3IQhTU20ySbR
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Feb 2024 05:20:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194567

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Added SIMD-optimized code for the Loongarch LSX hardware.
- Fixed the run-time discovery of MIPS MSA hardware.
- Fixed an off-by-one error in the function 'png_do_check_palette_indexes',
  which failed to recognize errors that might have existed in the first
  column of a broken palette-encoded image. This was a benign regression
  accidentally introduced in libpng-1.6.33. No pixel was harmed.
- Fixed, improved and modernized the contrib/pngminus programs, i.e.,
  png2pnm.c and pnm2png.c
- Removed old and peculiar portability hacks that were meant to silence
  warnings issued by gcc version 7.1 alone.
- Fixed and modernized the CMake file, and raised the minimum required
  CMake version from 3.1 to 3.6.
- Allowed the configure script to disable the building of auxiliary tools
  and tests, thus catching up with the CMake file.
- Fixed a build issue on Mac.
- Moved the Autoconf macro files to scripts/autoconf.
- Moved the CMake files (except for the main CMakeLists.txt) to
  scripts/cmake and moved the list of their contributing authors to
  scripts/cmake/AUTHORS.md
- Updated the CI configurations and scripts.
- Relicensed the CI scripts to the MIT License.
- Improved the test coverage.

License-Update: Copyright year updated to 2024.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libpng/{libpng_1.6.40.bb => libpng_1.6.41.bb}             | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/libpng/{libpng_1.6.40.bb => libpng_1.6.41.bb} (87%)

diff --git a/meta/recipes-multimedia/libpng/libpng_1.6.40.bb b/meta/recipes-multimedia/libpng/libpng_1.6.41.bb
similarity index 87%
rename from meta/recipes-multimedia/libpng/libpng_1.6.40.bb
rename to meta/recipes-multimedia/libpng/libpng_1.6.41.bb
index 293bf2858d..59d3db8efd 100644
--- a/meta/recipes-multimedia/libpng/libpng_1.6.40.bb
+++ b/meta/recipes-multimedia/libpng/libpng_1.6.41.bb
@@ -5,13 +5,13 @@ library for use in applications that read, create, and manipulate PNG \
 HOMEPAGE = "http://www.libpng.org/"
 SECTION = "libs"
 LICENSE = "Libpng"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=8f533bc367bfd43f556b6f782234c076"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=0fdbfbe10fc294a6fca24dc76134222a"
 DEPENDS = "zlib"
 
 LIBV = "16"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}${LIBV}/${BP}.tar.xz"
-SRC_URI[sha256sum] = "535b479b2467ff231a3ec6d92a525906fb8ef27978be4f66dbe05d3f3a01b3a1"
+SRC_URI[sha256sum] = "d6a49a7a4abca7e44f72542030e53319c081fea508daccf4ecc7c6d9958d190f"
 
 MIRRORS += "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}${LIBV}/ ${SOURCEFORGE_MIRROR}/${BPN}/${BPN}${LIBV}/older-releases/"
 
-- 
2.34.1


