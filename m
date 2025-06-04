Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3B3EC678DF
	for <webhook@archiver.kernel.org>; Wed,  4 Jun 2025 08:45:49 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web11.11725.1749026744007325605
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Jun 2025 01:45:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=SF+b2JiI;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1749026745; x=1780562745;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=yyQyU65Iuy/hCarw8a7lVlbgfxBxHO5OvaQ+en2hQW4=;
  b=SF+b2JiIL8BJoB9+zmasY4zzdkqDfeQVi1/ldkM+PmYeNJf1uz/qO+cx
   WKc/0ys6bHBIk2jj9ByPubEDPpv44Da3UYGGL1jssiJMwRzwgWQW32ctB
   7oXSREN1mcn7yPBQf3RbAYod3/MBCOfpoqGYIlXkDU7nRp3IbM0a8t73I
   WkoqT5TJNRaGZugspXyKTjnAVZilFM0Y9y3WWYlkcfSDM0FCW6uOvOep4
   77YZSYhvy6iJT4ttvI7x2O+A10j0IMsBUfJqDZ59DOjaK1kHo3wnAfhPU
   FPqXCKyxTRCFERNABYAo4ba9yqdLUB8Fmjtidp2oVe0FaYCbrXcpWjGud
   w==;
X-CSE-ConnectionGUID: bVs5vQvrQTCY/nqr0lWByQ==
X-CSE-MsgGUID: fsK7r7/cRiGgrlBtj5OLdQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11453"; a="201724472"
X-IronPort-AV: E=Sophos;i="6.16,208,1744038000"; 
   d="scan'208";a="201724472"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2025 17:45:43 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id C39FDE8FDB
	for <openembedded-core@lists.openembedded.org>; Wed,  4 Jun 2025 17:45:39 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 7F36ED4C15
	for <openembedded-core@lists.openembedded.org>; Wed,  4 Jun 2025 17:45:39 +0900 (JST)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 01E231A009A;
	Wed,  4 Jun 2025 16:45:38 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 31/45] msmtp: upgrade 1.8.28 -> 1.8.30
Date: Wed,  4 Jun 2025 16:45:09 +0800
Message-ID: <20250604084524.864-31-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250604084524.864-1-wangmy@fujitsu.com>
References: <20250604084524.864-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Jun 2025 08:45:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217878

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-extended/msmtp/{msmtp_1.8.28.bb => msmtp_1.8.30.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/msmtp/{msmtp_1.8.28.bb => msmtp_1.8.30.bb} (91%)

diff --git a/meta/recipes-extended/msmtp/msmtp_1.8.28.bb b/meta/recipes-extended/msmtp/msmtp_1.8.30.bb
similarity index 91%
rename from meta/recipes-extended/msmtp/msmtp_1.8.28.bb
rename to meta/recipes-extended/msmtp/msmtp_1.8.30.bb
index 48c597de24..83ec83f326 100644
--- a/meta/recipes-extended/msmtp/msmtp_1.8.28.bb
+++ b/meta/recipes-extended/msmtp/msmtp_1.8.30.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 UPSTREAM_CHECK_URI = "https://marlam.de/msmtp/download/"
 
 SRC_URI = "https://marlam.de/${BPN}/releases/${BP}.tar.xz"
-SRC_URI[sha256sum] = "3a57f155f54e4860f7dd42138d9bea1af615b99dfab5ab4cd728fc8c09a647a4"
+SRC_URI[sha256sum] = "f826a3c500c4dfeed814685097cead9b2b3dca5a2ec3897967cb9032570fa9ab"
 
 inherit gettext autotools update-alternatives pkgconfig
 
-- 
2.43.0


