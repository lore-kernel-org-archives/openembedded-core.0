Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 998B8CD584E
	for <webhook@archiver.kernel.org>; Wed,  7 Jan 2026 10:31:44 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3124.1767781900850667673
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Jan 2026 02:31:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=MgqGVDAO;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1767781901; x=1799317901;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=4k9dwsqP8lI9uZcBsmos72Y5dWw7vwjaoWFpfMnLBJI=;
  b=MgqGVDAOqiDPMv9s75YN0fdpdEe4Yzgq52HMr0thOLJ5Jxn9AdaM0eX+
   yT9H0GhHUR27mmW+/FaqqL1rcwQd3BnaDq4CN38zqdzcVVrBpNp4KnqkB
   glcOYtWC3HGq/gEsdFawEM/68QoSsF4VEg1bjciJB02DqL7sYIUq2mJIJ
   avYrjxuIxA5KTltI6aL0PHANEGoyDu0aePwcyx/KDeu5rBCgtKm12iFiA
   0plM9/XQ9uz+gVtfPRcWqLEPENm3zHqUUHmLaAS52QE9OtpgVsMLFYD1N
   pkwQ/H92+TpMQYebjQldaIzPeE6J8EZrgucRCoD0VpVMxj3NPVuAdp84T
   Q==;
X-CSE-ConnectionGUID: G+5Egu7MQ1yhLAJQvrU8vw==
X-CSE-MsgGUID: jmB5JGwnQo2R88Ig7pYLbg==
X-IronPort-AV: E=McAfee;i="6800,10657,11663"; a="225696403"
X-IronPort-AV: E=Sophos;i="6.21,207,1763391600"; 
   d="scan'208";a="225696403"
Received: from unknown (HELO az2nlsmgr1.o.css.fujitsu.com) ([20.61.8.234])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2026 19:31:39 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id 718A21C00081
	for <openembedded-core@lists.openembedded.org>; Wed,  7 Jan 2026 10:31:39 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 1FE131C0CAEC
	for <openembedded-core@lists.openembedded.org>; Wed,  7 Jan 2026 10:31:39 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.191])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id 68237101BB61;
	Wed,  7 Jan 2026 10:31:36 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 12/15] python3-ruamel-yaml: upgrade 0.18.17 -> 0.19.1
Date: Wed,  7 Jan 2026 18:30:59 +0800
Message-ID: <20260107103102.458-12-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260107103102.458-1-wangmy@fujitsu.com>
References: <20260107103102.458-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Jan 2026 10:31:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228982

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: Copyright year updated to 2026.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...3-ruamel-yaml_0.18.17.bb => python3-ruamel-yaml_0.19.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-ruamel-yaml_0.18.17.bb => python3-ruamel-yaml_0.19.1.bb} (74%)

diff --git a/meta/recipes-devtools/python/python3-ruamel-yaml_0.18.17.bb b/meta/recipes-devtools/python/python3-ruamel-yaml_0.19.1.bb
similarity index 74%
rename from meta/recipes-devtools/python/python3-ruamel-yaml_0.18.17.bb
rename to meta/recipes-devtools/python/python3-ruamel-yaml_0.19.1.bb
index a513a9e957..6129bcae13 100644
--- a/meta/recipes-devtools/python/python3-ruamel-yaml_0.18.17.bb
+++ b/meta/recipes-devtools/python/python3-ruamel-yaml_0.19.1.bb
@@ -2,7 +2,7 @@ SUMMARY = "YAML parser/emitter that supports roundtrip preservation of comments,
 HOMEPAGE = "https://pypi.org/project/ruamel.yaml/"
 
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=5cc5d45e8a30c81dade6ca1928caa515"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=fae78348fee46c087389813e0ebf5ed7"
 
 PYPI_PACKAGE = "ruamel_yaml"
 UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
@@ -10,7 +10,7 @@ UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 inherit pypi python_setuptools_build_meta
 
 S = "${UNPACKDIR}/ruamel.yaml-${PV}"
-SRC_URI[sha256sum] = "9091cd6e2d93a3a4b157ddb8fabf348c3de7f1fb1381346d985b6b247dcd8d3c"
+SRC_URI[sha256sum] = "53eb66cd27849eff968ebf8f0bf61f46cdac2da1d1f3576dd4ccee9b25c31993"
 
 RDEPENDS:${PN} += "\
     python3-shell \
-- 
2.43.0


