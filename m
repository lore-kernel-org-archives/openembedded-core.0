Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B227D25B54
	for <webhook@archiver.kernel.org>; Thu, 29 Jan 2026 03:54:24 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7879.1769658854251724248
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Jan 2026 19:54:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=PEBV4WH/;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1769658854; x=1801194854;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=B07DQXMVzGZUUnuoJr8jNVu3BaiYAdrG718WqsLcJVQ=;
  b=PEBV4WH/Bk90Wh84kE4+ROA4hs09WIkmsDSZpy3+gHgvU4ryWzpoeKOL
   hN3PFIApuXcCeuXBQZoNIsN5xjFu7hSF03LUmzxeQiDIDJsYZ2l3iBkz6
   s1wY1Uedt9J+ZP0j82a4y8jdN/AWltdW8TtKReuGUc2P0XLcdEso2Cvg2
   3yXiYwOZZkZh5dhGkeroLXqVbWpQqoiJprloNSsIap/jPKACK+LwDjQ2K
   I4cKCjK0gWhNb5oLifNUR1N9o6aXX+4Twhw9m7uCM5NubYr4Ij2LRGJnm
   dsfMsf6YFBPu9TiRVGf9Oq65Ui0Zgfv1uPkZ8i4t/GjIv43oN7UMcOoMO
   A==;
X-CSE-ConnectionGUID: fLlIp8uaTTyjeWay+gtQMQ==
X-CSE-MsgGUID: Kuj31jDrQau4pDmZSx83uQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11685"; a="227674395"
X-IronPort-AV: E=Sophos;i="6.21,260,1763391600"; 
   d="scan'208";a="227674395"
Received: from unknown (HELO az2uksmgr1.o.css.fujitsu.com) ([52.151.125.19])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2026 12:54:12 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id 84C351C1C727
	for <openembedded-core@lists.openembedded.org>; Thu, 29 Jan 2026 03:54:12 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 3DC6F926775
	for <openembedded-core@lists.openembedded.org>; Thu, 29 Jan 2026 03:54:12 +0000 (UTC)
Received: from G08FNSTD190101.g08.fujitsu.local (unknown [10.193.135.3])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id 04CA3140769E
	for <openembedded-core@lists.openembedded.org>; Thu, 29 Jan 2026 03:54:09 +0000 (UTC)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 4/6 v2] python3-wheezy-template: Add new recipe
Date: Thu, 29 Jan 2026 11:53:51 +0800
Message-ID: <20260129035353.8982-5-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260129035353.8982-1-liuyd.fnst@fujitsu.com>
References: <20260129035353.8982-1-liuyd.fnst@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 Jan 2026 03:54:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230116

Add this new recipe for runtime dependence of hotdoc.

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
---
 .../python/python3-wheezy-template_3.2.4.bb         | 13 +++++++++++++
 1 file changed, 13 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-wheezy-template_3.2.4.bb

diff --git a/meta/recipes-devtools/python/python3-wheezy-template_3.2.4.bb b/meta/recipes-devtools/python/python3-wheezy-template_3.2.4.bb
new file mode 100644
index 0000000000..9386b0ca2f
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-wheezy-template_3.2.4.bb
@@ -0,0 +1,13 @@
+SUMMARY = "a lightweight template library"
+HOMEPAGE = "https://github.com/akornatskyy/wheezy.template"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=fa10554c46b94944529c6a886cf85631"
+
+PYPI_PACKAGE = "wheezy_template"
+UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
+
+SRC_URI[sha256sum] = "465b9ac52e1c38bc9fc30127ae90bd232ce8df07fc2ac53383cb784f238b144f"
+
+inherit pypi python_setuptools_build_meta
+
+BBCLASSEXTEND = "native"
-- 
2.43.0


