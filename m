Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0250CECAAD5
	for <webhook@archiver.kernel.org>; Mon,  5 Sep 2022 09:04:02 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.3])
 by mx.groups.io with SMTP id smtpd.web10.22879.1662368631361347472
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Sep 2022 02:03:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=UkgqKQJV;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.3,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1662368629; i=@fujitsu.com;
	bh=vcEecCbtwxNr9b3mA8kAF+W4E0qvY7mmxiznGLXMlXg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=UkgqKQJVyAcBvSUm5kmspJXZCD0lqmgq7uYf/ed2Gn9ugw4MaRCichHUd8EZoG2b1
	 DPUCryvc7qS10yuexXBTmf4/+UpOvttZbPkxyd+oX9/00UMofMNSgL2nq0/7yR0XgL
	 0+f4VTp1IEsbM19N0zxCHMtRkPEkIpi/Wgko7g5i1OjzGMSvMB/aOCeckvxOvDXCSW
	 SjXToH7JwieQ3rPgiv20NRRtTqoPbjxBpCNjrj5ZUusTPglOClotssMRQssmMSkdAh
	 2/vAGJkIM70GDxp/R2X4a5kyZBj8sIRv2uEYzbpeQaPVoIG7AgcIdwiT/zCaj3BfWr
	 D6Dn103KrRTXA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrGIsWRWlGSWpSXmKPExsViZ8ORqFuyWzT
  ZYEavpcWdn+/YHRg9zm1cwRjAGMWamZeUX5HAmnH4yQbmgjscFf/W7GZqYOzg6GLk4hASeMwo
  cXrOUxYI5xqTxOb7z1khnN2MEnde/WLuYuTkYBNQk5h+6wZQgoNDREBP4uo/UZAws4CKxIvfP
  ewgtrCAp0TvxtdgNgtQfM3frWA2r4CTxNHr81lBbAkBBYkpD98zg4zhFHCWOHnSDyQsBFSydO
  9rJohyQYmTM5+wQIyXkDj44gUzRKuixOzLzSwQdoVE4/RDTBC2msTVc5uYJzAKzkLSPgtJ+wJ
  GplWM1klFmekZJbmJmTm6hgYGuoaGprrGprqGFiZ6iVW6iXqppbrlqcUlukZ6ieXFeqnFxXrF
  lbnJOSl6eaklmxiBQZxSrLxjB2Pbqp96hxglOZiURHnfzxFNFuJLyk+pzEgszogvKs1JLT7EK
  MPBoSTBu3IHUE6wKDU9tSItMwcYUTBpCQ4eJRFe/3VAad7igsTc4sx0iNQpRl2OmV/bDjALse
  Tl56VKifNuApkhAFKUUZoHNwIW3ZcYZaWEeRkZGBiEeApSi3IzS1DlXzGKczAqCfNygUzhycw
  rgdv0CugIJqAj7PqEQY4oSURISTUwZcXUdxufCRKb/U46OeVNlM6Nvaq//cJ85ufpJ7cE86V5
  +AkHrX/m9P7us8tKGvf9vj0XUGj/+sVzr1bV1crTl591NxXOqDbfWsDoM3eSULlXMM8fiwMGR
  RdmyP1rXr5tirbT1wtPFBbdmqackWr/c8K6X+wuyxY97sy7d3InV2qi4QV3q/WzKqsTDZyn3G
  ktub353aTKfW4Fjbc+v93eeaj1wcmlnxfZ3T7j5sB+umvXWnct5aenTM7PZVB/Xv7Z+HXvkkV
  R7T2v1/23brtVX3vz509d/fxUHrVVzWz60VMUrz89WP0z4EOud5RArIKrUQabpT17bVmQ61MP
  ae1jtooL7/18Jvpa/Zzvv2lFSizFGYmGWsxFxYkAvSvHlWkDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-14.tower-571.messagelabs.com!1662368628!136150!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 12419 invoked from network); 5 Sep 2022 09:03:48 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-14.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 5 Sep 2022 09:03:48 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id A12B110019A
	for <openembedded-core@lists.openembedded.org>;
 Mon,  5 Sep 2022 10:03:48 +0100 (BST)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121
 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 94EB6100198
	for <openembedded-core@lists.openembedded.org>;
 Mon,  5 Sep 2022 10:03:48 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 5 Sep 2022 10:03:46 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-dtschema: upgrade 2022.8.1 -> 2022.8.3
Date: Mon, 5 Sep 2022 17:03:21 +0800
Message-ID: <1662368601-32265-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1662368601-32265-1-git-send-email-wangmy@fujitsu.com>
References: <1662368601-32265-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 Sep 2022 09:04:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170304

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ython3-dtschema_2022.8.1.bb => python3-dtschema_2022.8.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-dtschema_2022.8.1.bb => python3-dtschema_2022.8.3.bb} (83%)

diff --git a/meta/recipes-devtools/python/python3-dtschema_2022.8.1.bb b/meta/recipes-devtools/python/python3-dtschema_2022.8.3.bb
similarity index 83%
rename from meta/recipes-devtools/python/python3-dtschema_2022.8.1.bb
rename to meta/recipes-devtools/python/python3-dtschema_2022.8.3.bb
index 38f646e50a..bc819c0dd6 100644
--- a/meta/recipes-devtools/python/python3-dtschema_2022.8.1.bb
+++ b/meta/recipes-devtools/python/python3-dtschema_2022.8.3.bb
@@ -7,7 +7,7 @@ inherit pypi setuptools3
 
 PYPI_PACKAGE = "dtschema"
 
-SRC_URI[sha256sum] = "3e56a9920944223d6f93fd51ada19dd8db554ac9182ef52c1c5c9d4966ab30aa"
+SRC_URI[sha256sum] = "128c88a393cd04154cef4d4b10a643e4473ae290b436e8e61d2e97ae8e53255d"
 
 DEPENDS += "python3-setuptools-scm-native"
 RDEPENDS:${PN} += "python3-ruamel-yaml python3-jsonschema python3-rfc3987"
-- 
2.25.1


