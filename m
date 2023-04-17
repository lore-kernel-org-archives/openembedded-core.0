Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9F62C77B77
	for <webhook@archiver.kernel.org>; Mon, 17 Apr 2023 06:47:10 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com [195.245.230.81])
 by mx.groups.io with SMTP id smtpd.web11.47712.1681714021214283492
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Apr 2023 23:47:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=Nq2sayyV;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.81, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1681714019; i=@fujitsu.com;
	bh=O9A08LsC/wF5P5yqCxHKRrwYKYqQQMkU79Je19Fo/vQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=Nq2sayyVBYxUH8Ep58INsN4P63ivukvn1p0nc5CGikQNuI3faBq2BwbtvackVeumD
	 DrxpTASSr+iM5Go94tHI8FezAju2irmgH0xeK7QxpfaHyLyAW53GDAGA/9AtDmfLyS
	 N8GwZQAD4quQIok5iKsnEjRLHIUxso5Tqlq76egeuoUJGhCCIYiJEYwmkdUUA/mLaE
	 6QoDLa3LJaWwEw+SZJpXQLNSlAXdM1esNLE5UVD9nf6OI6tvxnIz0yrkoyWj4pkIyd
	 2y3FW9WprYGKeBgqAO8Pjvcaz+s4XtGR5+AKjctPQzc59qc8cEaruDJp7UhVm4dfCa
	 dKeYx2WxPIvCw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrIIsWRWlGSWpSXmKPExsViZ8ORpJv02ib
  F4OIhDYs7P9+xOzB6nNu4gjGAMYo1My8pvyKBNeP9sXdMBWs4Kx6fnczWwHiFo4uRi0NI4AGj
  xKdPS9ghnMtMEuunrGbsYuQEcvYySvx+kAZiswlISdy4/5+ti5GDQ0RAT+LqP1GQMLOAisSL3
  z3sILawgK/Ewb7XYDaLgKrE64fn2EBsXgEniemTZ7KC2BICChJTHr5nBrE5BZwl9p/8wQSxyk
  ni7u1PTBD1ghInZz5hgZgvIXHwxQtmiF5FidmXm1kg7EqJ1g+/oGw1iavnNjFPYBSchaR9FpL
  2BYxMqxjNilOLylKLdA3N9JKKMtMzSnITM3P0Eqt0E/VSS3XLU4tLdA31EsuL9VKLi/WKK3OT
  c1L08lJLNjECQzelmPnlDsYTfX/1DjFKcjApifK+SLVOEeJLyk+pzEgszogvKs1JLT7EKMPBo
  STBG/DcJkVIsCg1PbUiLTMHGEcwaQkOHiURXuNnQGne4oLE3OLMdIjUKUZdjvbtXQeYhVjy8v
  NSpcR5JV4BFQmAFGWU5sGNgMX0JUZZKWFeRgYGBiGegtSi3MwSVPlXjOIcjErCvNdeAE3hycw
  rgdv0CugIJqAj5JTAjihJREhJNTCVzHsw+Uyz1onTYnkxuSnOWd+jfFsW7goKOLT7QdQa1w4D
  hcudsY7hAds6A2b9tTBXX5aTujytKDLJJeDyHd6XT/7zml/IfBXU1OrO7PYzUERyL8fTl54fX
  a/u3L5n17Q7F4yFrRx2hCsoM9afDVg+ybo4U68iW0zK3/HN0+/1LEliZ2wuWux/e4M3x+Blnc
  du1Uvb7cU05lnsX5S1x9Zon2CeQmp2SPal2jlmf3hPV1xZzfct2tLq28/S1HXfUq6aXnnQv5v
  J/4PCq6Isqa8f1nJNuHv6lNK5BEsfFZFsK5tpulf+eDOyyix+uSr40QRv0RkvL7yzWBRissP+
  bKRf3d5wkddV56atrN5bYafEUpyRaKjFXFScCADcujHHZAMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-3.tower-585.messagelabs.com!1681714018!733772!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 26496 invoked from network); 17 Apr 2023 06:46:58 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-3.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 17 Apr 2023 06:46:58 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 4340F1AC
	for <openembedded-core@lists.openembedded.org>; Mon, 17 Apr 2023 07:46:58 +0100 (BST)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 373D47B
	for <openembedded-core@lists.openembedded.org>; Mon, 17 Apr 2023 07:46:58 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 17 Apr 2023 07:46:56 +0100
From: <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-diskcache: upgrade 5.4.0 -> 5.5.1
Date: Mon, 17 Apr 2023 14:46:31 +0800
Message-ID: <1681713993-18603-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1681713993-18603-1-git-send-email-wangmy@fujitsu.com>
References: <1681713993-18603-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Apr 2023 06:47:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180128

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-diskcache_5.4.0.bb => python3-diskcache_5.5.1.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-diskcache_5.4.0.bb => python3-diskcache_5.5.1.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-diskcache_5.4.0.bb b/meta-python/recipes-devtools/python/python3-diskcache_5.5.1.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-diskcache_5.4.0.bb
rename to meta-python/recipes-devtools/python/python3-diskcache_5.5.1.bb
index 84d42e572..50e3c12d8 100644
--- a/meta-python/recipes-devtools/python/python3-diskcache_5.4.0.bb
+++ b/meta-python/recipes-devtools/python/python3-diskcache_5.5.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://www.grantjenks.com/docs/diskcache/"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c60ef82f0f40155453f6d5f2c94b6e8e"
 
-SRC_URI[sha256sum] = "8879eb8c9b4a2509a5e633d2008634fb2b0b35c2b36192d89655dbde02419644"
+SRC_URI[sha256sum] = "8685515584cc110a463d0728d98beaba56c7e2803b60a19cb8983a4c9e341d91"
 
 PYPI_PACKAGE = "diskcache"
 
-- 
2.34.1


