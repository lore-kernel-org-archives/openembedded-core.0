Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E2AFC433EF
	for <webhook@archiver.kernel.org>; Tue, 29 Mar 2022 00:34:15 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.66])
 by mx.groups.io with SMTP id smtpd.web11.1042.1648514054458405747
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Mar 2022 17:34:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=wNBN3kET;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.66,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1648514052; i=@fujitsu.com;
	bh=Q68TEWUU1ftzTpaWP5AquPFQDSR9yNthRH0QlDlqlM8=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=wNBN3kETPnOhSWYlHJof0/2lAPT+0bQAo+4geA99zjAczXFfep8Rqoxr862im7sfA
	 rNn99aGLaRSB09Fwh1s4CiJcO/BgV1BADZHA+Irbzo0++LYzOWXXLPQzjfRIetmnWQ
	 K5PuKSNt5O/Z/CspuStP7tgF6dfCy1lSe2atHiT0A3SmUAPRig7O21OAXNueFRWu/A
	 HD4y7qwRGA5V9xtIr56DKBl2F9Syp+n4JatFmrIcccRU2oB+zfY1nQ7VD3LJoEnmD4
	 xoOyW46maBdWNcBzR3c92GinlO8OcS1z7BwAwQctuleo2EEUgG4Q9hQ/Fbo6SgaGXS
	 Vg1OpEpAYH9fg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrEIsWRWlGSWpSXmKPExsViZ8ORqMsc4pR
  k8Oa2tcWdn+/YHRg9zm1cwRjAGMWamZeUX5HAmrHt7VvWgomcFbtOXGdqYNzK0cXIxSEk8JhR
  Yvqag+wQznkmiTNTPjBDOHsYJZ4+7wVyODnYBNQkpt+6wdrFyMEhIqAncfWfKEiYWUBF4sXvH
  nYQW1jAVaJhxkomEJtFQFVi58aFYHFeASeJNceXsoLYEgIKElMevmeGiAtKnJz5hAVijoTEwR
  cvmCFqFCVmX25mgbArJGbNamOCsNUkrp7bxDyBkX8WkvZZSNoXMDKtYrRKKspMzyjJTczM0TU
  0MNA1NDTVNdY1tLTUS6zSTdRLLdUtTy0u0TXUSywv1kstLtYrrsxNzknRy0st2cQIDMqUYubj
  Oxin9P3UO8QoycGkJMp7QdMpSYgvKT+lMiOxOCO+qDQntfgQowwHh5IE7+5AoJxgUWp6akVaZ
  g4wQmDSEhw8SiK8Od5Aad7igsTc4sx0iNQpRkUpcd49QUAJAZBERmkeXBssKi8xykoJ8zIyMD
  AI8RSkFuVmlqDKv2IU52BUEuaNBpnCk5lXAjf9FdBiJqDFdY8dQRaXJCKkpBqY2FaFnTxyP+f
  C5gcnVGfu6Os3l545OfVosbDQjoVMiuEpax7NymCvLQq2E7q8dXP+qYTHZj9dA78XT54uZKG7
  x6pxWrJ0Uunu1czT78Y/quIKv3F+y5X1E3niYk7kcUv8ui4ipLFGvmkv79Rb+5/oOzo5vBB+1
  Pzu7XZWG36Olve+16f6MH/VFfH7JBvGeSWuuv9rk8u5kCML65NTjPlsF/e03GVvVb5r/tdmX/
  zt28UZ7eUVD5d8Phw63evU+t6sY48y/0/U6KrKNy4+b//7XX1Mwp73u7oCOb68WqapWDu5Lzr
  i3dMvCkvmvjrUmxZpfvbu/vn3Nf4HqS0/wOAp/VpGuym27QT3nFOPz8p8U2Ipzkg01GIuKk4E
  ABnlPopFAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-8.tower-591.messagelabs.com!1648514051!4319!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.85.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 7542 invoked from network); 29 Mar 2022 00:34:11 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-8.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 29 Mar 2022 00:34:11 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 86AFC10018B
	for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Mar 2022 01:34:11 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 7A98C10004D
	for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Mar 2022 01:34:11 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 29 Mar 2022 01:33:49 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-dbusmock: upgrade 0.26.1 -> 0.27.3
Date: Tue, 29 Mar 2022 08:33:38 +0800
Message-ID: <1648514018-20626-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 29 Mar 2022 00:34:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163723

Changelog:
=========
packit: Fix file name to sync

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-dbusmock_0.26.1.bb => python3-dbusmock_0.27.3.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-dbusmock_0.26.1.bb => python3-dbusmock_0.27.3.bb} (83%)

diff --git a/meta/recipes-devtools/python/python3-dbusmock_0.26.1.bb b/meta/recipes-devtools/python/python3-dbusmock_0.27.3.bb
similarity index 83%
rename from meta/recipes-devtools/python/python3-dbusmock_0.26.1.bb
rename to meta/recipes-devtools/python/python3-dbusmock_0.27.3.bb
index dc98810726..5febdae1bd 100644
--- a/meta/recipes-devtools/python/python3-dbusmock_0.26.1.bb
+++ b/meta/recipes-devtools/python/python3-dbusmock_0.27.3.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://pypi.org/project/python-dbusmock/"
 LICENSE = "GPL-3.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=e6a600fd5e1d9cbde2d983680233ad02"
 
-SRC_URI[sha256sum] = "0e95ef6ec1e6b58aeb0e08839a76972debea94184570f09e29e5f12551399e55"
+SRC_URI[sha256sum] = "24feaa524e0631854a7f0529ef757c1e4c542adef89cf04e1d4248bc512a006f"
 
 PYPI_PACKAGE = "python-dbusmock"
 
-- 
2.25.1


