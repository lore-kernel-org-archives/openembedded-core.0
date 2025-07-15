Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A40F5C83F22
	for <webhook@archiver.kernel.org>; Tue, 15 Jul 2025 08:08:35 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web11.2950.1752566910226179785
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Jul 2025 01:08:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=ARC+4nCK;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1752566910; x=1784102910;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=/6FZdjj3cXxgB3xT1/3dwfeT72NiZ1OZmSITrdhX0+o=;
  b=ARC+4nCKV6KD/ef2AFb1cFcn6omaSfP/R/LQgEWEzPHY8e1JklTf+OFk
   jYcUSjE+EVIVC9Hww6qqxsL4428F07D78OwESfnD6JallIwZy9VP2tlCa
   vrIfyUhKKttg2HQQTje+oVAnjH4Hz7mlPJ+dUZ2OxxkFI/1G3F0tmBW1P
   g4cSYroliqNzXzpAB00PnqLtCkzbPHg5kZaRfeKPomSTYV94yTlbsKjJm
   1u2EN7ntoR25uVz3Iq38f838Y0UgmBg4rK3YHwSxgLDSFoDMwOopxQGDz
   VyzmZ1JDQwFAPiqYyvDEIzuy8RWiaoo7X3322u5pddZvWl5iRPNTxX+z4
   A==;
X-CSE-ConnectionGUID: e7LJPK58TRC06/aF07JMqQ==
X-CSE-MsgGUID: bjCGGd6BSjCyTnQDZCt/6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="193782247"
X-IronPort-AV: E=Sophos;i="6.16,313,1744038000"; 
   d="scan'208";a="193782247"
Received: from unknown (HELO az2nlsmgr2.o.css.fujitsu.com) ([51.138.80.169])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2025 17:08:28 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id 7C3251547
	for <openembedded-core@lists.openembedded.org>; Tue, 15 Jul 2025 08:08:28 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id CA1C7C00FF6
	for <openembedded-core@lists.openembedded.org>; Tue, 15 Jul 2025 08:08:27 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.161.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 2DDFB1A0078;
	Tue, 15 Jul 2025 16:08:24 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 04/19] gnutls: upgrade 3.8.9 -> 3.8.10
Date: Tue, 15 Jul 2025 16:08:04 +0800
Message-ID: <20250715080819.622-4-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250715080819.622-1-wangmy@fujitsu.com>
References: <20250715080819.622-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Jul 2025 08:08:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220273

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../gnutls/{gnutls_3.8.9.bb => gnutls_3.8.10.bb}                | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/gnutls/{gnutls_3.8.9.bb => gnutls_3.8.10.bb} (97%)

diff --git a/meta/recipes-support/gnutls/gnutls_3.8.9.bb b/meta/recipes-support/gnutls/gnutls_3.8.10.bb
similarity index 97%
rename from meta/recipes-support/gnutls/gnutls_3.8.9.bb
rename to meta/recipes-support/gnutls/gnutls_3.8.10.bb
index f2b7ac7bb8..600f23683e 100644
--- a/meta/recipes-support/gnutls/gnutls_3.8.9.bb
+++ b/meta/recipes-support/gnutls/gnutls_3.8.10.bb
@@ -25,7 +25,7 @@ SRC_URI = "https://www.gnupg.org/ftp/gcrypt/gnutls/v${SHRT_VER}/gnutls-${PV}.tar
            file://Add-ptest-support.patch \
            "
 
-SRC_URI[sha256sum] = "69e113d802d1670c4d5ac1b99040b1f2d5c7c05daec5003813c049b5184820ed"
+SRC_URI[sha256sum] = "db7fab7cce791e7727ebbef2334301c821d79a550ec55c9ef096b610b03eb6b7"
 
 inherit autotools texinfo pkgconfig gettext lib_package gtk-doc ptest
 
-- 
2.43.0


