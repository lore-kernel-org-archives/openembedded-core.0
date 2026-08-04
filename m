Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4858CC55ABF
	for <webhook@archiver.kernel.org>; Tue,  4 Aug 2026 04:05:34 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9673.1785816321585526856
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Aug 2026 21:05:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=XDSuQNaK;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1785816321; x=1817352321;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=nV4aO3ZDONlLOS1dLCz8n+LMNXixyRE7qzlltQp57bc=;
  b=XDSuQNaK2Mkque2blMANUm0ZaY0xgXr/gq4Sz6YkMFLtD4sNEqItV9C7
   QlOii56NQ6XiLMHS3ZW+MmJn7LYNYxMxOxzPd2+/KWwn9Dfjl4sZMYNTA
   FYHMTLAJprvS6CyHA7VeE7tA4xpA62d8iemID8Im0eLA3XbQgXnhx+vJf
   pm+jEDnpBFxf3gcobJTTCtmV/wjmmLioGun90Exo9DyN0+GsOi8PTpWQp
   uScUTaqcOoj13OHLZeZWNsb6zIEZOCBdXZlRr4fFYp3zmOXZLLWBmUCx7
   YKSCzKBsX+44Kc53Utpx+eDEAnPeii77dhgjv6iRQmiC/TAflQIsevpCb
   Q==;
X-CSE-ConnectionGUID: tNjqGL2wQam1Ogs3K7c/NA==
X-CSE-MsgGUID: lOYywZNGRKalXl8Mb7Emgg==
X-IronPort-AV: E=McAfee;i="6800,10657,11864"; a="249615338"
X-IronPort-AV: E=Sophos;i="6.25,203,1779116400"; 
   d="scan'208";a="249615338"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2026 13:05:19 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 9500BC006C4
	for <openembedded-core@lists.openembedded.org>; Tue,  4 Aug 2026 04:05:19 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (unknown [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id 4AB1BC08A62
	for <openembedded-core@lists.openembedded.org>; Tue,  4 Aug 2026 04:05:19 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTP id 5D0771800B07;
	Tue,  4 Aug 2026 04:05:17 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 3/8] libgit2: upgrade 1.9.4 -> 1.9.6
Date: Tue,  4 Aug 2026 12:05:03 +0800
Message-ID: <20260804040509.1454-3-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20260804040509.1454-1-wangmy@fujitsu.com>
References: <20260804040509.1454-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Aug 2026 04:05:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242679

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: update COPYING to include PCRE2 copyright notice
                Remove the original PCRE copyright notice; replace it with PCRE2.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libgit2/{libgit2_1.9.4.bb => libgit2_1.9.6.bb}            | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/libgit2/{libgit2_1.9.4.bb => libgit2_1.9.6.bb} (83%)

diff --git a/meta/recipes-support/libgit2/libgit2_1.9.4.bb b/meta/recipes-support/libgit2/libgit2_1.9.6.bb
similarity index 83%
rename from meta/recipes-support/libgit2/libgit2_1.9.4.bb
rename to meta/recipes-support/libgit2/libgit2_1.9.6.bb
index 999ad6b05c..b6bce9acfa 100644
--- a/meta/recipes-support/libgit2/libgit2_1.9.4.bb
+++ b/meta/recipes-support/libgit2/libgit2_1.9.6.bb
@@ -1,14 +1,14 @@
 SUMMARY = "the Git linkable library"
 HOMEPAGE = "http://libgit2.github.com/"
 LICENSE = "GPL-2.0-only WITH GCC-exception-2.0 AND MIT AND OpenSSL AND BSD-3-Clause AND Zlib AND ISC AND LGPL-2.1-or-later AND CC0-1.0 AND BSD-2-Clause"
-LIC_FILES_CHKSUM = "file://COPYING;md5=8eacfdc17c8f4d219e131a073973b97d"
+LIC_FILES_CHKSUM = "file://COPYING;md5=8289345c8713c385f45ec0c6c8a0d080"
 
 DEPENDS = "curl openssl zlib libssh2 libgcrypt libpcre2"
 
 SRC_URI = "git://github.com/libgit2/libgit2.git;branch=maint/v1.9;protocol=https;tag=v${PV} \
            file://0001-cmake-mark-system-libraries-are-private-link-librari.patch"
 
-SRCREV = "f7164261c9bc0a7e0ebf767c584e5192810a8b24"
+SRCREV = "26055f5af74ab1cf636d272e8a34315496d3f06f"
 
 inherit cmake
 
-- 
2.43.0


