Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA6EBC52D73
	for <webhook@archiver.kernel.org>; Mon, 29 Jul 2024 01:10:31 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web11.46935.1722215428043659149
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Jul 2024 18:10:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=RAWzdhH4;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1722215428; x=1753751428;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=n2cgRtsdQSrydLsiAIiXvCzkY4+dbuQznbSpYcVW7Og=;
  b=RAWzdhH4E1qE7lsMhyfyluXrnDYpHYDQ0DmOXAJgG55H/8i3W4CkrPAy
   z3TSfZ9Fi7QyVoVQdTbm8sGJHqNh0ADhCZjTCL52HoPxVGEobX0pRUZua
   YpOP0j5x/pIIbM4l58r/J+mfYepMdhdIh/rQqcasHbgEzsqDwMiiBbHXp
   TeKMOZyDVNn+rCOzjnRB9tpG4C5gxwijLzkCMZHrr0CCaAluQJdqcBWFg
   k7CsuImKInb+E7cVUqzXs2b2qT09IT/VDhTEqCA/1LtyL742k7UxeN7J+
   pQc3Vi0Zh+8takHikcRrw9p6+DBUw8rRa2eqPrAuJ5+HXo1FCrCKOzEoz
   A==;
X-IronPort-AV: E=McAfee;i="6700,10204,11147"; a="168988746"
X-IronPort-AV: E=Sophos;i="6.09,245,1716217200"; 
   d="scan'208";a="168988746"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2024 10:10:25 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 26C1CC2ABD
	for <openembedded-core@lists.openembedded.org>; Mon, 29 Jul 2024 10:10:23 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 4DE12D21AC
	for <openembedded-core@lists.openembedded.org>; Mon, 29 Jul 2024 10:10:22 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id C1A7A20071A1D
	for <openembedded-core@lists.openembedded.org>; Mon, 29 Jul 2024 10:10:16 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.161.161])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 77CB11A0002;
	Mon, 29 Jul 2024 09:10:16 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 03/33] glslang: upgrade 1.3.283.0 -> 1.3.290.0
Date: Mon, 29 Jul 2024 09:09:38 +0800
Message-Id: <1722215408-27541-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1722215408-27541-1-git-send-email-wangmy@fujitsu.com>
References: <1722215408-27541-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28560.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28560.004
X-TMASE-Result: 10--4.697100-10.000000
X-TMASE-MatchedRID: eWs1WpfTtqCjz0nOeth/yTo39wOA02LhpxAd6mi1Ga1GQgIVrmBL5Gdv
	IBM8UuLSVulqAdpodfm9/WPq9U7FIk1QH6PUk2DD+GYt8f/VhTu009crc0KdpNP7VmP7Drr69S1
	IIZo1c6uxPRD4jEJEVxK4lG1JTzijf0ldgFoF/O78dMpK2wMYwkc1DwKoQo7YwLkNMQzGl5AUfQ
	gp6GFqhq2Fv4TmNgU814NVx5HwHdVx9EmrVy1N/CsIuzCLc2mNp+wtGYBuRS71FNU5pHs+BJFjQ
	nJ9F0Di59thHEq0AZ0SJVWAqoVeTh8TzIzimOwPC24oEZ6SpSkgbhiVsIMQK2u5XqFPzjITvUAK
	OtKcH0XdCJrQCt3Z/CHD+kLjXBslmp+xME2PEfkJNqVLcxcCjpecbRht8EQ9sqEd5rqQoomYt6q
	9J4Ng18UqM9Md8X8Tf84eq1+5uVaCvqWrFsheUcLe0zBjeZrbFQOP52BRBXJMTsKj18q/fA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Jul 2024 01:10:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202582

From: Wang Mingyu <wangmy@fujitsu.com>

0001-generate-glslang-pkg-config.patch
refreshed for 1.3.290.0

Changelog:
===========
* Generate vector constructions more efficiently when sizes match
* Skip identity conversions for 8-bit and 16-bit types
* Add cmake aliases for public libraries
* Support ARM extended matrix layout
* Emit debug info for buffer references
* Add support for OpExtInstWithForwardRefsKHR
* Generate SPV_EXT_replicated_compisites when requested by pragma
* Reuse loads generated for repeated function arguments
* Fix gl_HitT alias of gl_RayTmax
* Fix some cases where invalid SPIR-V was being generated when using separate samplers
* Add back layoutLocation to public API

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../glslang/glslang/0001-generate-glslang-pkg-config.patch  | 6 +++---
 .../glslang/{glslang_1.3.283.0.bb => glslang_1.3.290.0.bb}  | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-graphics/glslang/{glslang_1.3.283.0.bb => glslang_1.3.290.0.bb} (96%)

diff --git a/meta/recipes-graphics/glslang/glslang/0001-generate-glslang-pkg-config.patch b/meta/recipes-graphics/glslang/glslang/0001-generate-glslang-pkg-config.patch
index 5001d63144..f8c0fc64c8 100644
--- a/meta/recipes-graphics/glslang/glslang/0001-generate-glslang-pkg-config.patch
+++ b/meta/recipes-graphics/glslang/glslang/0001-generate-glslang-pkg-config.patch
@@ -1,4 +1,4 @@
-From fc33f1cf032a15c07044ef932bc991c346d62d62 Mon Sep 17 00:00:00 2001
+From 0311dfd63ea41abb45aaf0f4ccc674f574ce639e Mon Sep 17 00:00:00 2001
 From: Jose Quaresma <quaresma.jose@gmail.com>
 Date: Sun, 7 Feb 2021 01:30:39 +0000
 Subject: [PATCH] generate glslang pkg-config
@@ -15,10 +15,10 @@ Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
  create mode 100644 glslang/glslang.pc.cmake.in
 
 diff --git a/glslang/CMakeLists.txt b/glslang/CMakeLists.txt
-index e4690f09..8e660bc5 100644
+index 8d4b1e9c..717c6d47 100644
 --- a/glslang/CMakeLists.txt
 +++ b/glslang/CMakeLists.txt
-@@ -233,6 +233,8 @@ if(GLSLANG_ENABLE_INSTALL)
+@@ -235,6 +235,8 @@ if(GLSLANG_ENABLE_INSTALL)
          install(TARGETS MachineIndependent EXPORT glslang-targets)
          install(TARGETS GenericCodeGen EXPORT glslang-targets)
      endif()
diff --git a/meta/recipes-graphics/glslang/glslang_1.3.283.0.bb b/meta/recipes-graphics/glslang/glslang_1.3.290.0.bb
similarity index 96%
rename from meta/recipes-graphics/glslang/glslang_1.3.283.0.bb
rename to meta/recipes-graphics/glslang/glslang_1.3.290.0.bb
index b58bd1e956..d6ee46de1e 100644
--- a/meta/recipes-graphics/glslang/glslang_1.3.283.0.bb
+++ b/meta/recipes-graphics/glslang/glslang_1.3.290.0.bb
@@ -8,7 +8,7 @@ HOMEPAGE = "https://www.khronos.org/opengles/sdk/tools/Reference-Compiler"
 LICENSE = "BSD-3-Clause & BSD-2-Clause & MIT & Apache-2.0 & GPL-3-with-bison-exception"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=2a2b5acd7bc4844964cfda45fe807dc3"
 
-SRCREV = "e8dd0b6903b34f1879520b444634c75ea2deedf5"
+SRCREV = "fa9c3deb49e035a8abcabe366f26aac010f6cbfb"
 SRC_URI = "git://github.com/KhronosGroup/glslang.git;protocol=https;branch=main \
            file://0001-generate-glslang-pkg-config.patch \
            "
-- 
2.34.1


