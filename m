Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4B5DF327DA
	for <webhook@archiver.kernel.org>; Tue, 21 Apr 2026 09:56:12 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.20434.1776765368034551035
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Apr 2026 02:56:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=s3JlDMoO;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1776765367; x=1808301367;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=yESRRCj7MMvJA+oqI5Pjvch1fjQwYjjf9rZDpc7yBE8=;
  b=s3JlDMoO6XH3I2UzQ4B8PiscRc4b+tZOsjxm5qaxvV7y5duPNw67HyRI
   k+zvoVQ06KPbNg+QszOKbTz3Ol8plv0USFRPFxrF4TBfASgrV7OScVY5Q
   VnO0JDOq2Ma2gMiqx1GurBoWanQd86QtesGNLK7dbmnZybMkhCbPVe0/3
   +1Ecf2D9R/Rz/8gJmQb1hfI3Ig2w9HRyW/JvcIBQ67VjJp2SwyqJCuMKi
   5QHYb3uzikcj1gfZbksvAt/ldR2QNjrOgI9ewUwGBMDcDSLClIWphH7YQ
   rDZuaSjQsHwkVZdRbV4prw95YelfmKhriYgKMm1J8NmTjLIf/HWTSlw/F
   w==;
X-CSE-ConnectionGUID: ZNpuCWGSQ4WDZQPkRiAJvQ==
X-CSE-MsgGUID: e/K0ni4rSb+cI4D997b5dg==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="216474265"
X-IronPort-AV: E=Sophos;i="6.23,191,1770562800"; 
   d="scan'208";a="216474265"
Received: from gmgwnl01.global.fujitsu.com (HELO mgmgwnl01.global.fujitsu.com) ([52.143.17.124])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2026 18:56:06 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mgmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 2137821FE
	for <openembedded-core@lists.openembedded.org>; Tue, 21 Apr 2026 09:56:06 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id BE3ABC00FCD
	for <openembedded-core@lists.openembedded.org>; Tue, 21 Apr 2026 09:56:05 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id 3A44714000E6;
	Tue, 21 Apr 2026 09:56:02 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 01/49] acpica: upgrade 20251212 -> 20260408
Date: Tue, 21 Apr 2026 17:55:11 +0800
Message-ID: <20260421095559.1856-1-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Apr 2026 09:56:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235609

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: Copyright year updated to 2026

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../acpica/{acpica_20251212.bb => acpica_20260408.bb}         | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/acpica/{acpica_20251212.bb => acpica_20260408.bb} (93%)

diff --git a/meta/recipes-extended/acpica/acpica_20251212.bb b/meta/recipes-extended/acpica/acpica_20260408.bb
similarity index 93%
rename from meta/recipes-extended/acpica/acpica_20251212.bb
rename to meta/recipes-extended/acpica/acpica_20260408.bb
index 812a62547b..4c65630015 100644
--- a/meta/recipes-extended/acpica/acpica_20251212.bb
+++ b/meta/recipes-extended/acpica/acpica_20260408.bb
@@ -10,14 +10,14 @@ HOMEPAGE = "https://www.intel.com/content/www/us/en/developer/topic-technology/o
 SECTION = "console/tools"
 
 LICENSE = "Intel | BSD-3-Clause | GPL-2.0-only"
-LIC_FILES_CHKSUM = "file://source/compiler/aslcompile.c;beginline=7;endline=150;md5=8566a414d226d05b68e41f30698f9624"
+LIC_FILES_CHKSUM = "file://source/compiler/aslcompile.c;beginline=7;endline=150;md5=4877caee45a613e9706946c3205a6fb9"
 
 COMPATIBLE_HOST = "(i.86|x86_64|arm|aarch64).*-linux"
 
 DEPENDS = "m4-native flex-native bison-native"
 
 SRC_URI = "git://github.com/acpica/acpica;protocol=https;branch=master;tag=${PV}"
-SRCREV = "446be438238e9d339eed5182b807ac5f82df56c9"
+SRCREV = "232ff3f8ae1a4da11c709f61d9154482cfe8e6df"
 
 inherit update-alternatives
 
-- 
2.43.0


