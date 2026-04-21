Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 851EEF327D6
	for <webhook@archiver.kernel.org>; Tue, 21 Apr 2026 09:56:12 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20377.1776765369815592856
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Apr 2026 02:56:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=TC6JR+mM;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1776765371; x=1808301371;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=04p2LUq7BVsRr7EKufl8RXXd1TWOPz8k8EBw5cBGqR8=;
  b=TC6JR+mMKdMh87Dmk1N3hdKbMeYP1CSXgrvSA2rvO2w1YVX+8q+ZSRSB
   q6T82mexxijWPgLL0AxKEQOy5Zbs+d9NPfedJF61rp/zKd37xwfatowRm
   IgTbnDZa2bGnxTV7uitWWuL86FcgycPVFFHnYcPdhhvFYxzHXjKpYhE51
   w9u7YX0VePu/7OYfGvjqsIB7hgRcn9f76mAJ9K007M2RqwmgYrC29v2Fd
   UjyWRvMJayMi5qrUCAsgxVHEcDzRHgIpgtmvPiANzC4XG7KnoHoj+N+sU
   gOwLyi5YZWf/SARVBcuFC8eSE5OdHtkcXUTY/5Z+n+jQdHpf1T0dP/usM
   Q==;
X-CSE-ConnectionGUID: h4/WZYEyQvWaji5ixvBKog==
X-CSE-MsgGUID: JrOhuMd1T6K+5qOuul3D5Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="237630036"
X-IronPort-AV: E=Sophos;i="6.23,191,1770562800"; 
   d="scan'208";a="237630036"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2026 18:56:09 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 06D6642A338
	for <openembedded-core@lists.openembedded.org>; Tue, 21 Apr 2026 09:56:08 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id A36CDC01285
	for <openembedded-core@lists.openembedded.org>; Tue, 21 Apr 2026 09:56:07 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id 5FDDD140025F;
	Tue, 21 Apr 2026 09:56:05 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 02/49] adwaita-icon-theme: upgrade 49.0 -> 50.0
Date: Tue, 21 Apr 2026 17:55:12 +0800
Message-ID: <20260421095559.1856-2-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260421095559.1856-1-wangmy@fujitsu.com>
References: <20260421095559.1856-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Apr 2026 09:56:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235610

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
- use old format of the legacy icons for gtk3
- reintroduce legacy icons because themes
- symbolic:battery icons no longer fuzzy
- build: Windows build

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{adwaita-icon-theme_49.0.bb => adwaita-icon-theme_50.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/gnome/{adwaita-icon-theme_49.0.bb => adwaita-icon-theme_50.0.bb} (91%)

diff --git a/meta/recipes-gnome/gnome/adwaita-icon-theme_49.0.bb b/meta/recipes-gnome/gnome/adwaita-icon-theme_50.0.bb
similarity index 91%
rename from meta/recipes-gnome/gnome/adwaita-icon-theme_49.0.bb
rename to meta/recipes-gnome/gnome/adwaita-icon-theme_50.0.bb
index a12faeb8fd..8d26aae75c 100644
--- a/meta/recipes-gnome/gnome/adwaita-icon-theme_49.0.bb
+++ b/meta/recipes-gnome/gnome/adwaita-icon-theme_50.0.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=c84cac88e46fc07647ea07e6c24eeb7c \
 
 inherit gnomebase allarch gtk-icon-cache
 
-SRC_URI[archive.sha256sum] = "65166461d1b278aa942f59aa8d0fccf1108d71c65f372c6266e172449791755c"
+SRC_URI[archive.sha256sum] = "fac6e0401fca714780561a081b8f7e27c3bc1db34ebda4da175081f26b24d460"
 
 DEPENDS += "librsvg-native"
 
-- 
2.43.0


