Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A45CE78D49
	for <webhook@archiver.kernel.org>; Mon,  9 Feb 2026 09:03:35 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.43586.1770627811113719524
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Feb 2026 01:03:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=kCnGX7Ky;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1770627811; x=1802163811;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=IvjH8HW+kRm2uKUHkz9Mb2EbDR6DcWTmUPvsJKhBdIc=;
  b=kCnGX7KyFg2jOU8gbKUCR29xQl2AwdRCLTFSWpHtWCeo83Z+ky/1b8/d
   f+yg/5tgrRNALEwJvMJOZJQIRSb7zIJQaCh9+Qs+LP06HtYQjbIWtqGXx
   QCBIr+zcJYiJDeKEC5liv4/jVWRh7geOOECsJuip0rCexD8C4zZfogMbQ
   t0Sg4B9VHwOlXEi2OCCtEJreF430fIwuhX/X1BZTiEzR69RRR9ap8p0wM
   nD7Vk2iDvYomXqWZ8j3Tz0+9aElemeB2jyGxwRk1mQXKWXFAeaJUHOat/
   OGsOdOos7G+9J3jIUXeCXXfdX3G0AocQfswpaRL4LccgaAzMVt+z3nPSy
   g==;
X-CSE-ConnectionGUID: UFs+B+2RSJiuU8pmSSSarA==
X-CSE-MsgGUID: dXx5MRdhRAGCwVIpn3KMAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11695"; a="216965203"
X-IronPort-AV: E=Sophos;i="6.21,281,1763391600"; 
   d="scan'208";a="216965203"
Received: from unknown (HELO mail.fujitsu.com) ([20.61.8.234])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2026 18:03:29 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr4.fujitsu.com (Postfix) with ESMTPS id 6FAFC42A31A
	for <openembedded-core@lists.openembedded.org>; Mon,  9 Feb 2026 09:03:29 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id 2644D1800085
	for <openembedded-core@lists.openembedded.org>; Mon,  9 Feb 2026 09:03:29 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id 9247F101A412;
	Mon,  9 Feb 2026 09:03:26 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 03/39] dos2unix: upgrade 7.5.3 -> 7.5.4
Date: Mon,  9 Feb 2026 17:02:41 +0800
Message-ID: <20260209090317.1468-3-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260209090317.1468-1-wangmy@fujitsu.com>
References: <20260209090317.1468-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Feb 2026 09:03:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230714

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: Copyright year updated to 2026

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../dos2unix/{dos2unix_7.5.3.bb => dos2unix_7.5.4.bb}         | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/dos2unix/{dos2unix_7.5.3.bb => dos2unix_7.5.4.bb} (88%)

diff --git a/meta/recipes-support/dos2unix/dos2unix_7.5.3.bb b/meta/recipes-support/dos2unix/dos2unix_7.5.4.bb
similarity index 88%
rename from meta/recipes-support/dos2unix/dos2unix_7.5.3.bb
rename to meta/recipes-support/dos2unix/dos2unix_7.5.4.bb
index ae69110c39..87d51574cc 100644
--- a/meta/recipes-support/dos2unix/dos2unix_7.5.3.bb
+++ b/meta/recipes-support/dos2unix/dos2unix_7.5.4.bb
@@ -6,12 +6,12 @@ HOMEPAGE = "http://waterlan.home.xs4all.nl/dos2unix.html"
 SECTION = "support"
 
 LICENSE = "BSD-2-Clause"
-LIC_FILES_CHKSUM = "file://COPYING.txt;md5=0802ff257bfeb9bb07ae4e4de04e3223"
+LIC_FILES_CHKSUM = "file://COPYING.txt;md5=af1174fd3d1a254eec3a4a1d1da170a9"
 
 SRC_URI = "git://git.code.sf.net/p/dos2unix/dos2unix;branch=master;protocol=https"
 UPSTREAM_CHECK_GITTAGREGEX = "dos2unix-(?P<pver>(\d+(\.\d+)+))"
 
-SRCREV = "9df44447947a7b311c62ea0383be94080edcaf85"
+SRCREV = "dd37537e5fe03ac123aca9a9c944ef87fb998dcd"
 
 S = "${UNPACKDIR}/${BP}/dos2unix"
 
-- 
2.43.0


