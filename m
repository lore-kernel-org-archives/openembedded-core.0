Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D722F483F4
	for <webhook@archiver.kernel.org>; Mon, 23 Mar 2026 20:07:48 +0000 (UTC)
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4411.1774296462563851899
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Mar 2026 13:07:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=fa1Ym/w3;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-256628-2026032320074313386d3dca000207a3-9idt2f@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 2026032320074313386d3dca000207a3
        for <openembedded-core@lists.openembedded.org>;
        Mon, 23 Mar 2026 21:07:43 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=8drfzXRXYPYfXskVH6hboknbhxuJY8xl6P57JutUGGA=;
 b=fa1Ym/w3SZ0nqFNCNbqlJBXBUibIMJIM6Og27fi9CBP5zgTUXEuAJ7Bl9PML05fmMcs+XI
 Eow2H7cgDpbCcEnZl67dA0TkfaD0lJWJoC3jVze9smVE4mcj8qhqSWVv9CfYddN37Y8hlhWc
 JoFAiS6IY7Vyqwp+xwEvkZMDzeGMz6Dbxn3DACsIkaoTUtNGT2ZK8OHWwvXqn+D7v3jOIOUX
 3N4gnzlNWidWJqykK1+M/ZFoeKvHtgVs0jA0cP9D3qDtuhcD+Iz6cfUQpVA/gtGizDTKKQiR
 O/IareZZv0BCKbrKhF2TOyRzWUG/O95Aowb2u12mxtQ7sqHnVOrdN8uQ==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-oe][PATCH v2 3/3] jsoncpp: upgrade 1.9.6 -> 1.9.7
Date: Mon, 23 Mar 2026 21:07:15 +0100
Message-Id: <20260323200715.11652-3-peter.marko@siemens.com>
In-Reply-To: <20260323200715.11652-1-peter.marko@siemens.com>
References: <20260323200715.11652-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Mar 2026 20:07:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233759

From: Peter Marko <peter.marko@siemens.com>

Added tag to SRC_URI.

Release information [1]:

1.9.7: Bugfixes, build system cleanups
What's Changed
* Fixes PreventInSourceBuilds.cmake to work with add_subdirectory by @morbo84 in #1383
* json_value.cpp bug in the edges of uint/int by @YaalLek in #1519
* Release 1.9.6 and move versions to 1.9.7 by @baylesj in #1566
* Fixed work secure_allocator on old compiers by @TsynkPavel in #1478
* Fix flag -DJSONCPP_USE_SECURE_MEMORY:BOOL=TRUE by @tfc in #1567
* fix(build): remove check_required_components for meson build by @chenrui333 in #1570
* the cgi module was removed from Python3.13 by @a-detiste in #1578
* Fix name of static library when targeting MinGW. by @mmuetzel in #1579
* Fix comparison warnings caused by 54fc4e2 by @JensMertelmeyer in #1575
* Drop pre-C++11 alternatives by @BillyDonahue in #1593
* feat: support std::string_view in Value API by @evalon32 in #1584
* Added Value::findType with String key by @SwintonStreet in #1574
* Set up for Bazel module builds. by @bcsgh in #1597
* Add a BUILD.bazel file for //example. by @bcsgh in #1602
* Fix "include what you use" issue by @victorvianna in #1625
* Make the build configuration under Bazel more correct. by @bcsgh in #1600
* Add Bazel tests by @bcsgh in #1601
* Return false in Reader::readValue when stack limit is exceeded by @xuhdev in #1619
* Remove deprecated/removed clang-tidy key AnalyzeTemporaryDtors (#1614) by @bmagistro in #1615
* [docs] Consuming JSONCpp via Conan package manager by @uilianries in #1622
* Cleanup README.md, fix broken link. by @baylesj in #1633
* Add gcovr.cfg to fix CI coverage merge errors by @baylesj in #1635
* Remove build directory exclusion from gcovr config by @baylesj in #1640
* Add test for allowDroppedNullPlaceholders by @baylesj in #1648
* Prevent test colision when running in parallel via RESOURCE_LOCK by @marty1885 in #1637
* fixup project version updater by @baylesj in #1649
* Update README with project status and focus by @baylesj in #1639
* Adding a cmake option to exclude the jsoncpp files from install. by @nv-jdeligiannis in #1596
* Change stack depth limit to 256 by @baylesj in #1657
* Fix uninitialized CMake variable in version.in by @baylesj in #1658
* Fix CMake deprecation warning for compatibility with CMake < 3.10 by @baylesj in #1659
* Scope JSON_DLL_BUILD to shared lib target only by @baylesj in #1660
* Fix number parsing failing under non-C locales by @baylesj in #1662
* Reject unescaped control characters in JSON strings by @baylesj in #1663
* Fix MSAN issue in #1626 by @baylesj in #1654
* Fix string_view ABI mismatch between library and consumers by @baylesj in #1661
* Revert "Fix number parsing failing under non-C locales" by @baylesj in #1664
* Fix use-after-free in Reader::parse(std::istream&) by @baylesj in #1665
* Update bazel config for 9.x by @keith in #1655

[1] https://github.com/open-source-parsers/jsoncpp/releases/tag/1.9.7

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../jsoncpp/{jsoncpp_1.9.6.bb => jsoncpp_1.9.7.bb}            | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-devtools/jsoncpp/{jsoncpp_1.9.6.bb => jsoncpp_1.9.7.bb} (90%)

diff --git a/meta-oe/recipes-devtools/jsoncpp/jsoncpp_1.9.6.bb b/meta-oe/recipes-devtools/jsoncpp/jsoncpp_1.9.7.bb
similarity index 90%
rename from meta-oe/recipes-devtools/jsoncpp/jsoncpp_1.9.6.bb
rename to meta-oe/recipes-devtools/jsoncpp/jsoncpp_1.9.7.bb
index f68ffd2c0f..b70a84304f 100644
--- a/meta-oe/recipes-devtools/jsoncpp/jsoncpp_1.9.6.bb
+++ b/meta-oe/recipes-devtools/jsoncpp/jsoncpp_1.9.7.bb
@@ -13,8 +13,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=5d73c165a0f9e86a1342f32d19ec5926"
 
 PE = "1"
 
-SRCREV = "89e2973c754a9c02a49974d839779b151e95afd6"
-SRC_URI = "git://github.com/open-source-parsers/jsoncpp;branch=master;protocol=https"
+SRCREV = "3455302847cf1e4671f1d8f5fa953fd46a7b1404"
+SRC_URI = "git://github.com/open-source-parsers/jsoncpp;branch=master;protocol=https;tag=${PV}"
 
 
 inherit cmake

