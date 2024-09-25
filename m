Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 286E0CF9C79
	for <webhook@archiver.kernel.org>; Wed, 25 Sep 2024 06:49:54 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web10.9317.1727246987009092835
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Sep 2024 23:49:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=OuywvIKc;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1727246987; x=1758782987;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=AMO0mC7S4gjFwZifo0pcklh5YMhyHPFnMcTe0QaMAr8=;
  b=OuywvIKcTI5rjaonVHq4cqRt1qxHCpJ7vTHtsOyHwHHykR7Oc1WVTYF/
   Y8q1Ce0vBP0IIPop8OtauHHtORf5RcywsmDdi1nSLy0LZVNiQCqVpUPN6
   en3yWAuBQOMzZD3f+pCQIw+zDdJSzjxe10CDksz38kpDkGd/8XUm/xvy8
   U69oO1KXTkBsf5Uz5djY2Q4Gf5WdZBVFPZisnHsvoIC2jTf5g9d4xJOJa
   qBtpfjhaHcY7nL6KiMuYTk7rWhemPS/WoUx2Qw8jIEJVmdl6EOgYWkBT0
   s5kXydLi28apgO+wB5DtHZrwCTsR+vfm1J2Z61FgTprAgDV2yHuuccTOo
   w==;
X-CSE-ConnectionGUID: pauqXQoVSAqyR73N2U/Ycg==
X-CSE-MsgGUID: j7InLWixTdiGLY5UgVXJ+g==
X-IronPort-AV: E=McAfee;i="6700,10204,11205"; a="174735936"
X-IronPort-AV: E=Sophos;i="6.10,256,1719846000"; 
   d="scan'208";a="174735936"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2024 15:49:45 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 6EC7EE8525
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Sep 2024 15:49:42 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id B3EBDCFBB1
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Sep 2024 15:49:41 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 45AC26B5C3
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Sep 2024 15:49:41 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id E969D1A01E9;
	Wed, 25 Sep 2024 14:49:40 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 21/47] meson: upgrade 1.5.1 -> 1.5.2
Date: Wed, 25 Sep 2024 14:48:54 +0800
Message-Id: <1727246960-20665-21-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1727246960-20665-1-git-send-email-wangmy@fujitsu.com>
References: <1727246960-20665-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28686.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28686.005
X-TMASE-Result: 10--6.650800-10.000000
X-TMASE-MatchedRID: FBE0XpCroJijz0nOeth/yWQYj6+BFPEw2I8NUKi360YyKRnX9xPs4K4r
	mQIDoB6ScA6Je1CctfDQQFefgqreC/l6M0RiHQVPAxFf86Rcir3kwFzTzcgzhEdoHm/1kbIO//p
	HCuZ/a9TfRErNIuznJC1CERt/2AkfRI4jmK1DSKnG+nS24MzHeQGo1vhC/pWj6Mw4RnkAvRLv5t
	G5qQwjQFSZHlAHrcAQkOYLv6jrn7rDmO1DJUuxWV/ZJ0h1vLl1CZa9cSpBObkXY+gNTubOQDMNH
	6OCg5w1sTJbpnc+TiFcZ9U2jb2BaBLmJd2F/yFuP0HVIeixJdA3l2plwgrtWCD1HdXyqDnEvwUe
	vDt+uW74Xkcr5uQiO3S6qfMYqUrO4Mu+9Uvd4HgDfgpjSDkFNwRryDXHx6oXpS6t4C9cuqajxYy
	RBa/qJcFwgTvxipFa9xS3mVzWUuA4wHSyGpeEehKGeCkIY3RZWiOZ8Xp/ciIEXgEiRSg0gKw2xV
	SlBXmnwxyIGo7dH5M=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Sep 2024 06:49:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204911

From: Wang Mingyu <wangmy@fujitsu.com>

0001-Make-CPU-family-warnings-fatal.patch
refreshed for 1.5.2

Changelog:
============
- nasm: Use different test sources for x86 and x86_64
- mdist: correctly detect dirty hg repos with non-English locale, redux
- backend/ninja: Generate sysroot in rust-project.json
- mdist: detect pathological git repo cases and show a slightly better error
- compilers: Pass mode to determine_args, not its string value
- CI: mark arch as skipping frameworks/libgcrypt
- When configuring fails in Github Actions, print folded logs
- Prevent raw exception during project()
- compilers: avoid -Wunused-value compiler warning in CLikeCompiler.has_type()
- compilers: avoid -Wunused-value compiler warning in CLikeCompiler.has_members()
- mformat: better handling of continuation lines
- mformat: detect invalid config
- tests: handle uncommon architecture format for nm
- mformat: regenerate long lines even if they're already multiline
- Add support for LLVM 19 in Debian.
- mformat: provide nice error message instead of backtrace for invalid value
- mformat: A triple string with a ' in it cannot be simplified
- tests/format: Make the compare script more useful
- linkers: skip -export_dynamic flag before MacOS 10.7
- format: fix indentation of comments
- mformat: correctly handle editorconfig files without the root setting
- cargo: Ignore Cargo.lock if toml implementation is missing
- compilers: do not strip '-isystem' from C build arguments
- Fix compiling ObjC/ObjC++ on Windows/MinGW
- mformat: fix formatting of empty build file
- tests: nasm: make it easier to debug generator() style build
- mdist: correctly detect dirty hg repos with non-English locale

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../meson/meson/0001-Make-CPU-family-warnings-fatal.patch   | 6 +++---
 .../meson/{meson_1.5.1.bb => meson_1.5.2.bb}                | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/meson/{meson_1.5.1.bb => meson_1.5.2.bb} (98%)

diff --git a/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-warnings-fatal.patch b/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-warnings-fatal.patch
index 04abb8b314..b272fd45b0 100644
--- a/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-warnings-fatal.patch
+++ b/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-warnings-fatal.patch
@@ -1,4 +1,4 @@
-From 33bc81d5a262e0fa1a346ac1667a3679a17c0997 Mon Sep 17 00:00:00 2001
+From 13e05ca933a572c1caf93372df808a30976f99cd Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Tue, 3 Jul 2018 13:59:09 +0100
 Subject: [PATCH] Make CPU family warnings fatal
@@ -26,10 +26,10 @@ index 86bad9b..9703315 100644
          endian = literal['endian']
          if endian not in ('little', 'big'):
 diff --git a/mesonbuild/environment.py b/mesonbuild/environment.py
-index 5bccb90..6aa4b15 100644
+index 484ef45..cf4a3ba 100644
 --- a/mesonbuild/environment.py
 +++ b/mesonbuild/environment.py
-@@ -387,10 +387,8 @@ def detect_cpu_family(compilers: CompilersDict) -> str:
+@@ -389,10 +389,8 @@ def detect_cpu_family(compilers: CompilersDict) -> str:
          if compilers and not any_compiler_has_define(compilers, '__mips64'):
              trial = 'mips'
  
diff --git a/meta/recipes-devtools/meson/meson_1.5.1.bb b/meta/recipes-devtools/meson/meson_1.5.2.bb
similarity index 98%
rename from meta/recipes-devtools/meson/meson_1.5.1.bb
rename to meta/recipes-devtools/meson/meson_1.5.2.bb
index 4f68a22fa9..beb1751e6f 100644
--- a/meta/recipes-devtools/meson/meson_1.5.1.bb
+++ b/meta/recipes-devtools/meson/meson_1.5.2.bb
@@ -15,7 +15,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/meson-${PV}.tar.gz \
            file://0001-Make-CPU-family-warnings-fatal.patch \
            file://0002-Support-building-allarch-recipes-again.patch \
            "
-SRC_URI[sha256sum] = "567e533adf255de73a2de35049b99923caf872a455af9ce03e01077e0d384bed"
+SRC_URI[sha256sum] = "f955e09ab0d71ef180ae85df65991d58ed8430323de7d77a37e11c9ea630910b"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)$"
 
 inherit python_setuptools_build_meta github-releases
-- 
2.34.1


