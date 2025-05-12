Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42687C3ABDC
	for <webhook@archiver.kernel.org>; Mon, 12 May 2025 09:04:02 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web10.45914.1747040638623560703
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 May 2025 02:03:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=cvcKcd2b;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1747040638; x=1778576638;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=L0Jd/Ies7fFOH6/t44OYQtbUY+1IV6UF2ReUfv+5i7g=;
  b=cvcKcd2biITzMFqmTDoTHVTGN8IoPBBcOi/QpoUjSK+6rjByf+ejhO1+
   aMEkIih7/BFuzd+8SVb25288lKj65or0VoBwOTQf7dF0MumjNizTzzh5d
   sDMtB8c9W33I47yFxYo2PSGQRe8AJSBECi5pfBR7vo4MazRUyPbCRMr++
   zWICzNWzZghLu+/ACTNF7SvbUduH9xJE/r+U+0b2EJb8nhLCyAi8+a0BQ
   tMeKN3rAf30ZbIlDOvPmBwfB0keRy2DAdEqybMSCpcHJq0KDkOzBjt/IN
   ttzN45XtoMepZzdGjtlOUuO1q+5qv+GrTAmUQ/ejZywdk3TLNLu8BSDrW
   A==;
X-CSE-ConnectionGUID: V8dpVV0QSo6yt8L+3NPjUQ==
X-CSE-MsgGUID: Wd9Uv08PRW6vU1FVOk155g==
X-IronPort-AV: E=McAfee;i="6700,10204,11430"; a="199533784"
X-IronPort-AV: E=Sophos;i="6.15,281,1739804400"; 
   d="scan'208";a="199533784"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2025 18:03:56 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 14B6DC68A0
	for <openembedded-core@lists.openembedded.org>; Mon, 12 May 2025 18:03:54 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id C1DCBD5040
	for <openembedded-core@lists.openembedded.org>; Mon, 12 May 2025 18:03:53 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 564341A00A0;
	Mon, 12 May 2025 17:03:53 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 06/56] boost: upgrade 1.87.0 -> 1.88.0
Date: Mon, 12 May 2025 17:02:49 +0800
Message-Id: <1747040619-7566-6-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1747040619-7566-1-git-send-email-wangmy@fujitsu.com>
References: <1747040619-7566-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 May 2025 09:04:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216303

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../boost/{boost-1.87.0.inc => boost-1.88.0.inc}                | 2 +-
 meta/recipes-support/boost/{boost_1.87.0.bb => boost_1.88.0.bb} | 0
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/boost/{boost-1.87.0.inc => boost-1.88.0.inc} (90%)
 rename meta/recipes-support/boost/{boost_1.87.0.bb => boost_1.88.0.bb} (100%)

diff --git a/meta/recipes-support/boost/boost-1.87.0.inc b/meta/recipes-support/boost/boost-1.88.0.inc
similarity index 90%
rename from meta/recipes-support/boost/boost-1.87.0.inc
rename to meta/recipes-support/boost/boost-1.88.0.inc
index c6e55b239e..917f1a9600 100644
--- a/meta/recipes-support/boost/boost-1.87.0.inc
+++ b/meta/recipes-support/boost/boost-1.88.0.inc
@@ -12,7 +12,7 @@ BOOST_MAJ = "${@"_".join(d.getVar("PV").split(".")[0:2])}"
 BOOST_P = "boost_${BOOST_VER}"
 
 SRC_URI = "https://archives.boost.io/release/${PV}/source/${BOOST_P}.tar.bz2"
-SRC_URI[sha256sum] = "af57be25cb4c4f4b413ed692fe378affb4352ea50fbe294a11ef548f4d527d89"
+SRC_URI[sha256sum] = "46d9d2c06637b219270877c9e16155cbd015b6dc84349af064c088e9b5b12f7b"
 
 UPSTREAM_CHECK_URI = "http://www.boost.org/users/download/"
 UPSTREAM_CHECK_REGEX = "release/(?P<pver>.*)/source/"
diff --git a/meta/recipes-support/boost/boost_1.87.0.bb b/meta/recipes-support/boost/boost_1.88.0.bb
similarity index 100%
rename from meta/recipes-support/boost/boost_1.87.0.bb
rename to meta/recipes-support/boost/boost_1.88.0.bb
-- 
2.43.0


