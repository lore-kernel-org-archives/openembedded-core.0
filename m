Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 714DEF8922B
	for <webhook@archiver.kernel.org>; Tue, 21 Apr 2026 09:57:14 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20402.1776765412223009380
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Apr 2026 02:57:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=FUz5eOO/;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1776765427; x=1808301427;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=nGdnwKTEamMUJZqfqmAsLjYcy4JijYk9tpwVddqlBZY=;
  b=FUz5eOO/bEAkTPCzcQ7r5QZLufcMW4aZvY1pKNCrAE/XZXCK9jW0nf88
   5Vj+xwbDt7o+JRkR6d5yljQZkTvAgDTwta8CgfeHra9it29JYSqlxz/Rq
   6y0mMTtQBXjbUG01wNseaKkiZ3aX+9xIdUWpouZVeswTs3VNaGdWWsrnM
   8X9RWsKJb6rzdEAur1PKyU7My2p2Glt8gJhsqZ/BedlXpWBfZjNKy2sKE
   LQnHooh6RIXm+AGISlzrrIdH/okkCg8xpixrhh46rpaJw9oFV8VEkGTTr
   zYX2T55DygBriRtrZpTbN3RT91XjDjW+D2F+7b3K/W/aq2ueQnP578o6i
   Q==;
X-CSE-ConnectionGUID: d4BErK4LRyC0kNgReV+oHw==
X-CSE-MsgGUID: xS7sRKhpQCer/U+MKc+Cbw==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="216474340"
X-IronPort-AV: E=Sophos;i="6.23,191,1770562800"; 
   d="scan'208";a="216474340"
Received: from gmgwnl01.global.fujitsu.com (HELO mgmgwnl01.global.fujitsu.com) ([52.143.17.124])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2026 18:57:06 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mgmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id D417E1540
	for <openembedded-core@lists.openembedded.org>; Tue, 21 Apr 2026 09:57:06 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 7C1ACC00FE7
	for <openembedded-core@lists.openembedded.org>; Tue, 21 Apr 2026 09:57:06 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id 02E4D14002C3;
	Tue, 21 Apr 2026 09:57:03 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 34/49] python3-pygobject: upgrade 3.56.1 -> 3.56.2
Date: Tue, 21 Apr 2026 17:55:44 +0800
Message-ID: <20260421095559.1856-34-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260421095559.1856-1-wangmy@fujitsu.com>
References: <20260421095559.1856-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Apr 2026 09:57:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235642

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
* ci: drop obsolete mingw environments, add UCRT64 and clang64 (backport)
* Leave floating state intact for get/set property (backport)
* Only call do_dispose if it's implemented on the class (backport)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{python3-pygobject_3.56.1.bb => python3-pygobject_3.56.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pygobject_3.56.1.bb => python3-pygobject_3.56.2.bb} (93%)

diff --git a/meta/recipes-devtools/python/python3-pygobject_3.56.1.bb b/meta/recipes-devtools/python/python3-pygobject_3.56.2.bb
similarity index 93%
rename from meta/recipes-devtools/python/python3-pygobject_3.56.1.bb
rename to meta/recipes-devtools/python/python3-pygobject_3.56.2.bb
index c17df1a9d1..24a58adee6 100644
--- a/meta/recipes-devtools/python/python3-pygobject_3.56.1.bb
+++ b/meta/recipes-devtools/python/python3-pygobject_3.56.2.bb
@@ -19,7 +19,7 @@ DEPENDS += "python3 glib-2.0"
 GNOME_COMPRESS_TYPE = "gz"
 GNOMEBN = "pygobject"
 
-SRC_URI[archive.sha256sum] = "2ec1cc8c55c7ffeebb97e58a9bba7aa1e74611f1173628084685446804a8881a"
+SRC_URI[archive.sha256sum] = "b816098969544081de9eecedb94ad6ac59c77e4d571fe7051f18bebcec074313"
 
 S = "${UNPACKDIR}/${GNOMEBN}-${PV}"
 
-- 
2.43.0


