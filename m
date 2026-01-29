Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 411F9D46C01
	for <webhook@archiver.kernel.org>; Thu, 29 Jan 2026 03:54:14 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7875.1769658849600391404
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Jan 2026 19:54:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Eb49vFdt;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1769658849; x=1801194849;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=qwhYitjKvEHZNNmraGe1dFJu/oNl3L0tKz/1eYJi83c=;
  b=Eb49vFdterfCkf9yvfyIF0OnPGBYa88GjSQ7PnJkrmEWsbo9g17B5/cV
   ttUksbezppt7D/BFWuzZuqRAntoJbQJOBvc+abWA1iBt84jj9i8E5EW47
   5QbXBFb0aDgwSCExAKQXdgZucR6RvLcpTnDy94iX1yVaK/7D/rVnx4kws
   wwEu7kxXSM96HKWFePLzInXm5x7dUt1XK5FAkCgVTkdXXRJ79B9+EHt0+
   QCxX8jdaPZmxsV2lEHjsz4xxYI2bCcA0AdQIXtv41WV1gB5sBsehwKi37
   VWd1v/RocXKWxUkGHM0pjx0TE9Kk4D49M9uMGocG4bkxEhZ1YaOqM5XhZ
   w==;
X-CSE-ConnectionGUID: ufj8t08NQESvKoHGuM/Mrg==
X-CSE-MsgGUID: d2V38agBSyeTnTZfCLwRcA==
X-IronPort-AV: E=McAfee;i="6800,10657,11685"; a="216257430"
X-IronPort-AV: E=Sophos;i="6.21,260,1763391600"; 
   d="scan'208";a="216257430"
Received: from unknown (HELO az2uksmgr4.o.css.fujitsu.com) ([52.151.125.128])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2026 12:54:08 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id 1B6A0C01B07
	for <openembedded-core@lists.openembedded.org>; Thu, 29 Jan 2026 03:54:08 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id C7676C06D65
	for <openembedded-core@lists.openembedded.org>; Thu, 29 Jan 2026 03:54:07 +0000 (UTC)
Received: from G08FNSTD190101.g08.fujitsu.local (unknown [10.193.135.3])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id 9099514076A5
	for <openembedded-core@lists.openembedded.org>; Thu, 29 Jan 2026 03:54:05 +0000 (UTC)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 1/6] python3-appdirs: Add new recipe
Date: Thu, 29 Jan 2026 11:53:48 +0800
Message-ID: <20260129035353.8982-2-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260129035353.8982-1-liuyd.fnst@fujitsu.com>
References: <20260129035353.8982-1-liuyd.fnst@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 Jan 2026 03:54:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230113

Move it from meta-openembedded to openembedded-core as it is required by hotdoc 0.17.4.

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
---
 meta/recipes-devtools/python/python3-appdirs_1.4.4.bb | 11 +++++++++++
 1 file changed, 11 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-appdirs_1.4.4.bb

diff --git a/meta/recipes-devtools/python/python3-appdirs_1.4.4.bb b/meta/recipes-devtools/python/python3-appdirs_1.4.4.bb
new file mode 100644
index 0000000000..bee0b7d815
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-appdirs_1.4.4.bb
@@ -0,0 +1,11 @@
+SUMMARY = "A small Python module for determining appropriate + platform-specific dirs, e.g. a user data dir."
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=31625363c45eb0c67c630a2f73e438e4"
+
+SRC_URI[sha256sum] = "7d5d0167b2b1ba821647616af46a749d1c653740dd0d2415100fe26e27afdf41"
+
+inherit pypi setuptools3 ptest-python-pytest
+
+PTEST_PYTEST_DIR = "test"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.43.0


