Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9B78C43334
	for <webhook@archiver.kernel.org>; Fri, 17 Jun 2022 06:25:58 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.4])
 by mx.groups.io with SMTP id smtpd.web12.27660.1655447148761220899
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Jun 2022 23:25:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=v+YqroSY;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.4,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1655447147; i=@fujitsu.com;
	bh=V0cbXCEJnPpXLSVnOMySdjnkQTs8RPk9TZ5eb3UmAoQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=v+YqroSYtumfsj4hWJkv4Vuh9ByHp2xJhl1NuYE4sr16NH2BbTLuXLWpSgWGbeEjX
	 7L3NPnltFLNyWhrtDGqbfT7aYRrg76rv954fnSZOVQWhODZss8MckAPii8U+pD9Mee
	 /MZs7pqFKsjwekgd6E7RqeD4eibvaFET2r4yd9mrQlrLm9j8R/159EbrwSNo/ieVoQ
	 U9a2C8fQNdNPk1NBKNBl1iNWkxvLsFYditnIYPOIwJ9hIioK7yyspR7fxXXSPgahul
	 EyHgOFPOqfP/jggP/LCx6WllftE/63gVRhfodE/fzaj1d8MU0hL73+PiFcmkimN13N
	 L2IndQNRUKeTQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrKIsWRWlGSWpSXmKPExsViZ8ORpJsltyb
  JYNl9JYs7P9+xOzB6nNu4gjGAMYo1My8pvyKBNWPB2TvsBb/ZK17+7WVtYJzP3sXIxSEk8IBR
  4lnbDDYI5wyTxJfzC4AcTiBnD6PE/a+sIDabgJrE9Fs3gGwODhEBPYmr/0RBwswCKhIvfvewg
  9jCAnYS55ffBWtlEVCVuP+qA8zmFXCSON9zmhHElhBQkJjy8D0ziM0p4Cyxb8sRqFVOEl92fW
  CBqBeUODnzCQvEfAmJgy9eMEP0KkrMvtzMAmFXSMyYsY0NwlaTuHpuE/MERsFZSNpnIWlfwMi
  0itEqqSgzPaMkNzEzR9fQwEDX0NBU19hI19BEL7FKN1EvtVS3PLW4RNdIL7G8WC+1uFivuDI3
  OSdFLy+1ZBMjMIRTihX4djA2r/qpd4hRkoNJSZTXnWVNkhBfUn5KZUZicUZ8UWlOavEhRhkOD
  iUJ3kfSQDnBotT01Iq0zBxgPMGkJTh4lER4P8oCpXmLCxJzizPTIVKnGHU5ps7+t59ZiCUvPy
  9VSpw3CKRIAKQoozQPbgQsti8xykoJ8zIyMDAI8RSkFuVmlqDKv2IU52BUEuadAzKFJzOvBG7
  TK6AjmICOaNy3AuSIkkSElFQDk1bjnLAff6Ub9jv0JYbYL+qv9zl+knfvU6GjHS4M/zs0dhR/
  veacsa5ovWR32vGF5TxrArasnr+wSL74f9CRN0sztNb6vKvWWqedvmW9V983nco+x8bKs2q9r
  Nq2X650HHobsHq7DWvP3ZK91yffvanL+GaHWUyyeZDRrb4uVQWJ7cVr9NzDkr8Jn190wSmn9b
  Tmu3XZp42qDm4673g1zoCp8F9swRMWFauYh+KbOT23LXKfNO1le4/UnKkSPYb+yorfJhQbTCv
  jnii+P1r6Lc/9HuZL+tL+fnctZnzfUv7rituv6PBrO+cxny6a8XtdZwTb17lbltwpcZcquWXn
  XdL0LCCdd6v3Tf+Le4UfKbEUZyQaajEXFScCADPQ5GdoAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-6.tower-571.messagelabs.com!1655447146!316429!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 1790 invoked from network); 17 Jun 2022 06:25:46 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-6.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 17 Jun 2022 06:25:46 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 3A2431B4
	for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Jun 2022 07:25:46 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 2A7EA1AE
	for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Jun 2022 07:25:46 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Fri, 17 Jun 2022 07:25:27 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-exceptiongroup : add recipe
Date: Fri, 17 Jun 2022 14:25:08 +0800
Message-ID: <1655447108-20329-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1655447108-20329-1-git-send-email-wangmy@fujitsu.com>
References: <1655447108-20329-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Jun 2022 06:25:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167017

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/python3-exceptiongroup_1.0.0rc8.bb         | 11 +++++++++++
 1 file changed, 11 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-exceptiongroup_1.0.0rc8.bb

diff --git a/meta/recipes-devtools/python/python3-exceptiongroup_1.0.0rc8.bb b/meta/recipes-devtools/python/python3-exceptiongroup_1.0.0rc8.bb
new file mode 100644
index 0000000000..adf530a6e5
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-exceptiongroup_1.0.0rc8.bb
@@ -0,0 +1,11 @@
+DESCRIPTION = "This is a backport of the BaseExceptionGroup and ExceptionGroup classes from Python 3.11."
+HOMEPAGE = "https://pypi.org/project/exceptiongroup"
+SECTION = "devel/python"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=d5caa317463c433575efff1d2fe206d7"
+
+SRC_URI[sha256sum] = "6990c24f06b8d33c8065cfe43e5e8a4bfa384e0358be036af9cc60b6321bd11a"
+
+#RDEPENDS:${PN} += "python3-profile python3-logging"
+
+inherit pypi python_setuptools_build_meta
-- 
2.25.1


