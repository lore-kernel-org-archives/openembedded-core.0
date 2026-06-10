Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C579CD98CD
	for <webhook@archiver.kernel.org>; Wed, 10 Jun 2026 09:49:52 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16344.1781084985432073872
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Jun 2026 02:49:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=CiFLP5NC;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1781084992; x=1812620992;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=urhbTIAQVhwCQqVvaDaHb+ou0iQ3AtwfXmfwUkDejFg=;
  b=CiFLP5NCUrFj4TK6F21gHmKNZjAQh9zW/nMbM78UsLrO93+ARwFLejtN
   LNG+xYk+o4Y84tgnK84N1TMteMjvU9+jmj6CSavHp06edbz5IC7it0WU3
   Xu9aoioz7ctaTFbHVJ5DtDJYqryFd8C+kcgtIJyZz9ciE5Rm3TJcV1eiJ
   srAwMPmp4y0ALVBqO8QHqRXo11QlQFrq9UQj4i3CcfeDUP9vKlGqLGNJ+
   CmAkgJRC+PrYXiVM95MwL9KIy98/kF/oGb1sydRVqq7Mk4M2q3acX6zlB
   YxOpOLlqGP45MTV12AOYkt3CuBC1H/JXSjDQfB9IN8pqCM6p/oxhhMiYQ
   w==;
X-CSE-ConnectionGUID: L+Q0tDKxQE21pOb1iH4++w==
X-CSE-MsgGUID: XQ66veC+Q/ule4yfi+Iedw==
X-IronPort-AV: E=McAfee;i="6800,10657,11812"; a="243598904"
X-IronPort-AV: E=Sophos;i="6.24,197,1774278000"; 
   d="scan'208";a="243598904"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2026 18:49:51 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 98ADB1000149
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Jun 2026 09:49:50 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (unknown [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 493171C17445
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Jun 2026 09:49:50 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id 57CD31400270;
	Wed, 10 Jun 2026 09:49:48 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 05/16] dos2unix: upgrade 7.5.5 -> 7.5.6
Date: Wed, 10 Jun 2026 17:49:20 +0800
Message-ID: <20260610094932.2264-5-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260610094932.2264-1-wangmy@fujitsu.com>
References: <20260610094932.2264-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Jun 2026 09:49:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238330

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
 * New homepage https://waterlander.net/dos2unix/
 * Updated translations of the manual.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../dos2unix/{dos2unix_7.5.5.bb => dos2unix_7.5.6.bb}       | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-support/dos2unix/{dos2unix_7.5.5.bb => dos2unix_7.5.6.bb} (88%)

diff --git a/meta/recipes-support/dos2unix/dos2unix_7.5.5.bb b/meta/recipes-support/dos2unix/dos2unix_7.5.6.bb
similarity index 88%
rename from meta/recipes-support/dos2unix/dos2unix_7.5.5.bb
rename to meta/recipes-support/dos2unix/dos2unix_7.5.6.bb
index aa078ed200..8ef1d427e3 100644
--- a/meta/recipes-support/dos2unix/dos2unix_7.5.5.bb
+++ b/meta/recipes-support/dos2unix/dos2unix_7.5.6.bb
@@ -2,16 +2,16 @@ SUMMARY = "Convert text file line endings between CRLF and LF"
 DESCRIPTION = "The Dos2unix package includes utilities dos2unix and \
 unix2dos to convert plain text files in DOS or Mac format to Unix \
 format and vice versa."
-HOMEPAGE = "http://waterlan.home.xs4all.nl/dos2unix.html"
+HOMEPAGE = "https://waterlander.net/dos2unix/"
 SECTION = "support"
 
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://COPYING.txt;md5=af1174fd3d1a254eec3a4a1d1da170a9"
 
-SRC_URI = "git://git.code.sf.net/p/dos2unix/dos2unix;branch=master;protocol=https"
+SRC_URI = "git://git.code.sf.net/p/dos2unix/dos2unix;branch=master;protocol=https;tag=${BPN}-${PV}"
 UPSTREAM_CHECK_GITTAGREGEX = "dos2unix-(?P<pver>(\d+(\.\d+)+))"
 
-SRCREV = "54524999eece4e9ad0dab580c79b02855fc85028"
+SRCREV = "9c2ea173af3bc49324f8288d81c5a2bbfc0884d0"
 
 S = "${UNPACKDIR}/${BP}/dos2unix"
 
-- 
2.43.0


