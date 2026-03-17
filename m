Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3E33F33832
	for <webhook@archiver.kernel.org>; Tue, 17 Mar 2026 09:53:16 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.72448.1773741192967698450
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Mar 2026 02:53:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=myxBRKIR;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1773741191; x=1805277191;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=6kLXamCkX7QFu2i6QjvMbKPLJTIqi8ePgv7j9B+6jAw=;
  b=myxBRKIRsLKqs8eo7yUr0d9CJV/ymH8+yIpB7pbbrDWSN/12+872irqG
   qVVEfJN4iY/0yQpO0YSaSZY3eAQUX/gaH7ayTyPSUxu7IUm8i94/5Sb+i
   h/wzGFXv66dAUvbT0uAMUYW98tAoYjqWqYo8edbS+ePsvqVdRYjzam0aB
   nVgUeCIo++8F/Gp4z+r+MLFDWeHVkvGwSS1n4IzQMzMEnz72/tfki/Dpb
   qKue9KHtiQGNugdXUteSzmOULqY+tF2c836iqWJwkrz/0BXRuSPMHJKPg
   C7p+ZwwziFlRNHTh39ZG0/U6m9ru0aJ+p6d6RgeL53Z4CrLbv0Dx7Wr6k
   g==;
X-CSE-ConnectionGUID: ZjbxrQ94Rcud5zdD1UgJGw==
X-CSE-MsgGUID: u9zSIUlcRxyuZtdu5IMPXQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11731"; a="233577071"
X-IronPort-AV: E=Sophos;i="6.23,124,1770562800"; 
   d="scan'208";a="233577071"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 18:53:10 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 7CCF31000353
	for <openembedded-core@lists.openembedded.org>; Tue, 17 Mar 2026 09:53:11 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (az2nlsmom2.o.css.fujitsu.com [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 289D1C012A2
	for <openembedded-core@lists.openembedded.org>; Tue, 17 Mar 2026 09:53:11 +0000 (UTC)
Received: from G08FNSTD190101.g08.fujitsu.local (unknown [10.193.128.218])
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTP id C326A1800B2B
	for <openembedded-core@lists.openembedded.org>; Tue, 17 Mar 2026 09:53:08 +0000 (UTC)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] libinput: upgrade 1.30.1-> 1.30.2
Date: Tue, 17 Mar 2026 17:53:04 +0800
Message-ID: <20260317095304.10962-1-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Mar 2026 09:53:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233310

1. Changelog
  https://gitlab.freedesktop.org/libinput/libinput/-/releases/1.30.2

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
---
 .../wayland/{libinput_1.30.1.bb => libinput_1.30.2.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/wayland/{libinput_1.30.1.bb => libinput_1.30.2.bb} (97%)

diff --git a/meta/recipes-graphics/wayland/libinput_1.30.1.bb b/meta/recipes-graphics/wayland/libinput_1.30.2.bb
similarity index 97%
rename from meta/recipes-graphics/wayland/libinput_1.30.1.bb
rename to meta/recipes-graphics/wayland/libinput_1.30.2.bb
index 8d80e1ac62..5d9bfafaaa 100644
--- a/meta/recipes-graphics/wayland/libinput_1.30.1.bb
+++ b/meta/recipes-graphics/wayland/libinput_1.30.2.bb
@@ -15,7 +15,7 @@ DEPENDS = "libevdev udev"
 SRC_URI = "git://gitlab.freedesktop.org/libinput/libinput.git;protocol=https;branch=1.30-branch;tag=${PV} \
            file://run-ptest \
            "
-SRCREV = "baf1ceca88b3a668dd263f50bfaddfd205306028"
+SRCREV = "042c5e6fd9cc910307027a1522453794b29f2c72"
 
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+\.\d+\.(?!9\d+)\d+)"
 
-- 
2.43.0


