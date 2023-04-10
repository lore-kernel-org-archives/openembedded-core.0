Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3985C77B71
	for <webhook@archiver.kernel.org>; Mon, 10 Apr 2023 09:40:28 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.4])
 by mx.groups.io with SMTP id smtpd.web10.41127.1681119627434820094
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Apr 2023 02:40:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=YByDEo/t;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.4, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1681119628; i=@fujitsu.com;
	bh=/OpD6HJKc/R4gzoq+ypnpclewqMQRjmsKHBEwVgZomM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=YByDEo/tFkzfWUA2TPQWwdmst8moH7drT+GfO9yGahWhDfpoE6+a3c4dXQzXmzhVR
	 fR71EySNN2ioLIB63BzqO8e+DSkd386XSKht2agexC2xZMAa3SjnqygF8lysinoZR/
	 RfxHXwsK97GsvaIMAkY3bAW7t5AoV+vvuEVL2gC5aloQslMAj4TZHGsDb1MFjrg/fU
	 4ld5pUBuxdf1fX1osvKQGnBVN1BuLLh7N4U+brk10VExnDKR1oygrkmo38RhayBYvx
	 4u5KObNSmVnTixcNtlFDzlGhhuu/+of/orATbtwJVGJgMJrPzFFE5njC9inl0aI4jr
	 7UTxKXoZqeyNw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrCIsWRWlGSWpSXmKPExsViZ8ORpNt90zj
  F4NNNRYs7P9+xOzB6nNu4gjGAMYo1My8pvyKBNePL027Wgs/cFe3TFzI1ML7k6mLk5BASeMAo
  Mam9touRC8i+zCTxecI/FghnD6NEZ/dbdpAqNgEpiRv3/7N1MXJwiAjoSVz9JwoSZhZQkXjxu
  wesRFjATWLpx1uMIDaLgKrEwQe7mEFsXgEnif7/X1hBbAkBBYkpD9+DxTkFnCWads9mgjjCSa
  Lr5WdWiHpBiZMzn7BAzJeQOPjiBTNEr6LE7MvNLBB2hUTj9ENMELaaxNVzm5gnMArOQtI+C0n
  7AkamVYymxalFZalFusZ6SUWZ6RkluYmZOXqJVbqJeqmluuWpxSW6RnqJ5cV6qcXFesWVuck5
  KXp5qSWbGIGBm1KsJryD8UvvX71DjJIcTEqivF1cxilCfEn5KZUZicUZ8UWlOanFhxhlODiUJ
  HgZLgPlBItS01Mr0jJzgFEEk5bg4FES4ZW4BpTmLS5IzC3OTIdInWJUlBLn5TgPlBAASWSU5s
  G1wSL3EqOslDAvIwMDgxBPQWpRbmYJqvwrRnEORiVh3jMXgabwZOaVwE1/BbSYCWgxl4sByOK
  SRISUVANTY+SSo2/mHtLjCbiT63dAW/pkqYjB3XtRWzz9lquxi/Kbqr1zvWPCHlG7m8dJlNHe
  rqlaQkh0/s7dJueEDqprbFgetkJk/49WN57T/qun2jFs57xvvYK9SOjixpMa/JppATGcU9Mn+
  e/jC7LeI7zSWPn3gjOPnv6cZFLuvrVntoWwhmH2w19Ru+ODuIumsqzWcP3Yb27yWsv7xe75H4
  OnS3b9r992acKV5mXT3hRIaXPnLT0VmB3hsuCm5op9x/2UGtNOv8nude7tkLq2ynnqv30Pzc9
  I1s1lXKa9zu/3We3JZeweU29E3xd6drLA99JuF/47UmsslY9mR0mtb1oeWvs+s+aP3iL/rKy1
  L6OVWIozEg21mIuKEwEs+itDVwMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-7.tower-571.messagelabs.com!1681119627!196911!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 26970 invoked from network); 10 Apr 2023 09:40:27 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-7.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 10 Apr 2023 09:40:27 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 44CC71C7
	for <openembedded-core@lists.openembedded.org>; Mon, 10 Apr 2023 10:40:27 +0100 (BST)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 39C401B9
	for <openembedded-core@lists.openembedded.org>; Mon, 10 Apr 2023 10:40:27 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 10 Apr 2023 10:40:25 +0100
From: <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-pyopenssl: upgrade 23.0.0 -> 23.1.1
Date: Mon, 10 Apr 2023 17:39:55 +0800
Message-ID: <1681119595-25279-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1681119595-25279-1-git-send-email-wangmy@fujitsu.com>
References: <1681119595-25279-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Apr 2023 09:40:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179882

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Worked around an issue in OpenSSL 3.1.0 which caused X509Extension.get_short_name
  to raise an exception when no short name was known to OpenSSL. #1204.
- cryptography maximum version has been increased to 40.0.x.
- Add OpenSSL.SSL.Connection.DTLSv1_get_timeout and
  OpenSSL.SSL.Connection.DTLSv1_handle_timeout to support DTLS timeouts #1180.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{python3-pyopenssl_23.0.0.bb => python3-pyopenssl_23.1.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pyopenssl_23.0.0.bb => python3-pyopenssl_23.1.1.bb} (86%)

diff --git a/meta/recipes-devtools/python/python3-pyopenssl_23.0.0.bb b/meta/recipes-devtools/python/python3-pyopenssl_23.1.1.bb
similarity index 86%
rename from meta/recipes-devtools/python/python3-pyopenssl_23.0.0.bb
rename to meta/recipes-devtools/python/python3-pyopenssl_23.1.1.bb
index 822d21a58a..90a6252f7c 100644
--- a/meta/recipes-devtools/python/python3-pyopenssl_23.0.0.bb
+++ b/meta/recipes-devtools/python/python3-pyopenssl_23.1.1.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 DEPENDS += "openssl ${PYTHON_PN}-cryptography"
 
-SRC_URI[sha256sum] = "c1cc5f86bcacefc84dada7d31175cae1b1518d5f60d3d0bb595a67822a868a6f"
+SRC_URI[sha256sum] = "841498b9bec61623b1b6c47ebbc02367c07d60e0e195f19790817f10cc8db0b7"
 
 PYPI_PACKAGE = "pyOpenSSL"
 inherit pypi setuptools3
-- 
2.34.1


