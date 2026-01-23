Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46A0BD6CFCB
	for <webhook@archiver.kernel.org>; Fri, 23 Jan 2026 05:22:55 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.61511.1769145768581900359
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Jan 2026 21:22:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=QrKceqlz;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1769145769; x=1800681769;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=qwhYitjKvEHZNNmraGe1dFJu/oNl3L0tKz/1eYJi83c=;
  b=QrKceqlzLrO3Yq9WopKPHZHsOQOJ7Hz3a4xS8/yir8Jx9Xo4rJVBNkJr
   M42KkQf3tJ4EtD+MIdyYja3MVtmK3n8mGZHTdSsbo0R16e2YYHGnfLTNk
   +gB/7Dc/x++Go+YuQWIgvHk2EGK+egR5n+inyzUE6SNHKcS36FNJJq2Ms
   SISDmuyaBpLGbJ8zMhi+U0Bn0h6oZaQ6tGwoSTR0GK+EsFEQO3Bhi2GQB
   vXP360m8+c7+/1jhk/m+BPNswv89d57GXAM2tGSaUhCx5+Qwvp2lIpPy8
   hmZWhkHens7oWiznYyOXmSkTrb484fp4oBYwX+WXHJyII01jfCxMSnLXg
   g==;
X-CSE-ConnectionGUID: UuGiSZ1HTFKEhcqHVg9Bwg==
X-CSE-MsgGUID: J0WTIj+YQjiwLcmx+P2TdA==
X-IronPort-AV: E=McAfee;i="6800,10657,11679"; a="226205964"
X-IronPort-AV: E=Sophos;i="6.21,247,1763391600"; 
   d="scan'208";a="226205964"
Received: from unknown (HELO az2uksmgr2.o.css.fujitsu.com) ([52.151.125.128])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2026 14:22:47 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id D8C3C820C24
	for <openembedded-core@lists.openembedded.org>; Fri, 23 Jan 2026 05:22:46 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 91CBD180A304
	for <openembedded-core@lists.openembedded.org>; Fri, 23 Jan 2026 05:22:46 +0000 (UTC)
Received: from G08FNSTD190101.g08.fujitsu.local (unknown [10.193.135.3])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id 4FBEF14001F8
	for <openembedded-core@lists.openembedded.org>; Fri, 23 Jan 2026 05:22:44 +0000 (UTC)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 1/5] python3-appdirs: Add new recipe 
Date: Fri, 23 Jan 2026 13:22:30 +0800
Message-ID: <20260123052234.970-2-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260123052234.970-1-liuyd.fnst@fujitsu.com>
References: <20260123052234.970-1-liuyd.fnst@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 23 Jan 2026 05:22:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229861

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


