Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53734D6CFD0
	for <webhook@archiver.kernel.org>; Fri, 23 Jan 2026 05:22:55 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.61512.1769145771568196873
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Jan 2026 21:22:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=tpqvTdWR;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1769145773; x=1800681773;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=SFfdaarvqIkdYR/hODeny6GNFlnIi/w1Qu/u8e58LOc=;
  b=tpqvTdWRZLP1K23vF7dkJupyBayAUujsPPK/Kdc+ctMGdKuh5YmwPdOR
   UnuBHEOZB08Nsvy1cPKfoOdWyiujejP1gtqKuFH2GtPk6DlaVrI/USRDj
   rV3FTGreDvobOQMAOMlPNxSN2kCg7m+WOqM4TR6YzN3IverOzV8h8Qfju
   kiq3+nUDbpgdXLeqlNrMCgdz0RqKVcAo4PXph6RgvXpDZhvDw/jIVjSZN
   d7wrGfFd/NZ2ML9BlqnrtCk9PK/wYHtCx9uFk6VzZUFCfcVViFvhK4Ahy
   7tiSR3HtY3KI+KxOtK+CdF3drW2/rhpwoUsxzwAFoiE4fgkf4s2pmCJXA
   w==;
X-CSE-ConnectionGUID: hwfUZi+aT8SjJx3rEtnSxg==
X-CSE-MsgGUID: NrXRsBLRQ6SAJrISvi2qRw==
X-IronPort-AV: E=McAfee;i="6800,10657,11679"; a="226820937"
X-IronPort-AV: E=Sophos;i="6.21,247,1763391600"; 
   d="scan'208";a="226820937"
Received: from unknown (HELO az2uksmgr1.o.css.fujitsu.com) ([52.151.125.128])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2026 14:22:52 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id 584E51C1C702
	for <openembedded-core@lists.openembedded.org>; Fri, 23 Jan 2026 05:22:51 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id 10F8E14042CD
	for <openembedded-core@lists.openembedded.org>; Fri, 23 Jan 2026 05:22:51 +0000 (UTC)
Received: from G08FNSTD190101.g08.fujitsu.local (unknown [10.193.135.3])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id CCE761400131
	for <openembedded-core@lists.openembedded.org>; Fri, 23 Jan 2026 05:22:48 +0000 (UTC)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 4/5] python3-wheezy-template: Add new recipe
Date: Fri, 23 Jan 2026 13:22:33 +0800
Message-ID: <20260123052234.970-5-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260123052234.970-1-liuyd.fnst@fujitsu.com>
References: <20260123052234.970-1-liuyd.fnst@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 23 Jan 2026 05:22:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229864

Add this new recipe for runtime dependence of hotdoc.

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
---
 .../python/python3-wheezy-template_3.2.4.bb         | 13 +++++++++++++
 1 file changed, 13 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-wheezy-template_3.2.4.bb

diff --git a/meta/recipes-devtools/python/python3-wheezy-template_3.2.4.bb b/meta/recipes-devtools/python/python3-wheezy-template_3.2.4.bb
new file mode 100644
index 0000000000..a15e756aa4
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
+inherit pypi setuptools3
+
+BBCLASSEXTEND = "native"
-- 
2.43.0


