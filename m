Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E5EDCCFA0D
	for <webhook@archiver.kernel.org>; Wed,  5 Nov 2025 23:48:11 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3005.1762386481292584448
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Nov 2025 15:48:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=BTeVRvCX;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1762386481; x=1793922481;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=4gtcYVi3hRqvfzYaU2egHnYN6+Dt1eGWobzGggG0YtE=;
  b=BTeVRvCXIzAe6QIa+o+DwDL5O4PDVRbqw7JAyw8abg/Hn9fq40BkgGsd
   KikwpnlTJbFqwk96/5fcYcm1xIvQk7WTqNhMhSsXsX3WMxmUZcWQm/DwV
   i4+Q8W1N07cYIJBHNURuyD8rWjJzhOn+F19n58wb/JHgBttpteulVbcMM
   gzQn80UVSTqivJrLGDUyPVYOdJNS5NEnLTUk3l/0maqOeXYrgsuxjfPi1
   7gMgluZamH61JLJgrUwVhN++lx0lTBo+Y2BzKom7fXK9KGL2Qw9Sa9JQW
   8nwfG1X3Kfjh25/Vmg5i6b0VquOlIJ7J3eA/5/CYPVWNgNd/88xlPbcWt
   g==;
X-CSE-ConnectionGUID: mO1IubDbSoqd5aDoWcjJig==
X-CSE-MsgGUID: Ir+gMPBZSvS8VUIrXnrgqg==
X-IronPort-AV: E=McAfee;i="6800,10657,11604"; a="197192518"
X-IronPort-AV: E=Sophos;i="6.19,283,1754924400"; 
   d="scan'208";a="197192518"
Received: from unknown (HELO az2uksmgr1.o.css.fujitsu.com) ([52.151.125.19])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2025 08:48:00 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id C585C1C1C73A
	for <openembedded-core@lists.openembedded.org>; Wed,  5 Nov 2025 23:47:59 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 818E68D65D2
	for <openembedded-core@lists.openembedded.org>; Wed,  5 Nov 2025 23:47:59 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id 20E19140008B;
	Wed,  5 Nov 2025 23:47:56 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 23/29] gstreamer1.0: upgrade 1.26.5 -> 1.26.7
Date: Thu,  6 Nov 2025 07:47:06 +0800
Message-ID: <20251105234712.446-23-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251105234712.446-1-wangmy@fujitsu.com>
References: <20251105234712.446-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Nov 2025 23:48:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225953

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{gstreamer1.0_1.26.5.bb => gstreamer1.0_1.26.7.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0_1.26.5.bb => gstreamer1.0_1.26.7.bb} (97%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.5.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.7.bb
similarity index 97%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.5.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.7.bb
index 4c800c22d4..444165a869 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.5.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.7.bb
@@ -22,7 +22,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gstreamer/gstreamer-${PV}.tar.x
            file://0003-tests-use-a-dictionaries-for-environment.patch \
            file://0004-tests-add-helper-script-to-run-the-installed_tests.patch \
            "
-SRC_URI[sha256sum] = "0a7edb0e7b42dbe6b575fce61a4808a3f6b20e085a1eaecbc025d0ec21f1e774"
+SRC_URI[sha256sum] = "18a5e214114dc501407697dd458514bba62cadd5414c60f793cf70141a4d0bb3"
 
 PACKAGECONFIG ??= "${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '', d)} \
                    check \
-- 
2.43.0


