Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6B82E9413C
	for <webhook@archiver.kernel.org>; Tue, 30 Dec 2025 09:17:49 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.61241.1767086259534644044
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Dec 2025 01:17:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=FDr5Z9si;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1767086260; x=1798622260;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=fvt7BWcJeX+1yeX1xl4oqwZqxT91q6M9ikPgNoO1CvE=;
  b=FDr5Z9si9bIKAKjpK0oWwBKjnmk/jqL3ALz34CpBRJTSMHW76Me7Ifyt
   c0/dXOJD0xnYY2G2GsO+F5wlucnPoCM07TNtmllhfeH3rFAJ5NxYVAUv3
   NgQ9FCVFSuiUR3ZGJo/l6J5nM7ZtO+2Bdn2in3PA3pRy0gZxrA8d62nXb
   rm+geu3wL4GxhxXTL2GgFdd1369lgiStlKO/yNkshh4pBBzZ/PZinUk06
   OQdXMbeGoK1714MsFqCqFA9OF82+0JfZr5LU7mq1FkzVHXdBrRP28Y/Er
   uNT5ouvGX4PSRgTwQyihamrt2jOqfXARV+tGN/TPflpB1QzsE0NKrE3kg
   g==;
X-CSE-ConnectionGUID: rE0JU5olS7KixTsF8dyZoA==
X-CSE-MsgGUID: PynKYk2CSQ2KoCHlOjtFaA==
X-IronPort-AV: E=McAfee;i="6800,10657,11656"; a="224296799"
X-IronPort-AV: E=Sophos;i="6.21,188,1763391600"; 
   d="scan'208";a="224296799"
Received: from unknown (HELO az2uksmgr3.o.css.fujitsu.com) ([52.151.125.19])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2025 18:17:38 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id C72B91002B86
	for <openembedded-core@lists.openembedded.org>; Tue, 30 Dec 2025 09:17:37 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (az2nlsmom2.o.css.fujitsu.com [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 8031D8D72D8
	for <openembedded-core@lists.openembedded.org>; Tue, 30 Dec 2025 09:17:37 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTP id D6191180058C;
	Tue, 30 Dec 2025 09:17:34 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 04/12] ed: upgrade 1.22.2 -> 1.22.3
Date: Tue, 30 Dec 2025 17:17:05 +0800
Message-ID: <20251230091714.1501-4-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251230091714.1501-1-wangmy@fujitsu.com>
References: <20251230091714.1501-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Dec 2025 09:17:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228646

From: Wang Mingyu <wangmy@fujitsu.com>

Changes in version 1.22.3:
- The change to print the file name escaped when replaced into a shell command
  has been reverted.
- When '--unsafe-names' is not specified, only the control characters \a, \b,
  \t, \v, \f, \n, \r, \033, and \177 are now rejected in file names.
- 'make check' now checks file names with non-ASCII characters coded either in
  ISO-8859-1 or in UTF-8.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-extended/ed/{ed_1.22.2.bb => ed_1.22.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/ed/{ed_1.22.2.bb => ed_1.22.3.bb} (93%)

diff --git a/meta/recipes-extended/ed/ed_1.22.2.bb b/meta/recipes-extended/ed/ed_1.22.3.bb
similarity index 93%
rename from meta/recipes-extended/ed/ed_1.22.2.bb
rename to meta/recipes-extended/ed/ed_1.22.3.bb
index 80d4e116ac..1a5a28a039 100644
--- a/meta/recipes-extended/ed/ed_1.22.2.bb
+++ b/meta/recipes-extended/ed/ed_1.22.3.bb
@@ -19,7 +19,7 @@ bindir = "${base_bindir}"
 SRC_URI = "${GNU_MIRROR}/ed/${BP}.tar.lz"
 UPSTREAM_CHECK_URI = "${GNU_MIRROR}/ed/"
 
-SRC_URI[sha256sum] = "f58d15242056e15af76f13f34c60d890fa2a2d5cb0abef91c115e4d83794ffe3"
+SRC_URI[sha256sum] = "47a55ddfc52d4a1ff6f7559fbd00cf948a16b6cf151ec520392761aeae4e97be"
 
 EXTRA_OEMAKE = "-e MAKEFLAGS="
 
-- 
2.43.0


