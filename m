Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com [195.245.230.67])
 by mx.groups.io with SMTP id smtpd.web09.1412.1627969192462353712
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Aug 2021 22:39:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=Co+22FWh;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.67, mailfrom: zangrc.fnst@fujitsu.com)
Return-Path: <zangrc.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1627969189; i=@fujitsu.com;
	bh=yAo14Zy2cgWbBzJ9n2lXNoOlcuqNkqAlLyfJJDAVJnI=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=Co+22FWhPSISgeHV1ki+964CNtSVtMb2MjwmY5I3MbF2Ue89gZgNez/4rh1KPMYug
	 mIGpe2Y216/tTYBo4HYCnBeRufCYN3IAAC+AupGt6ub5xjZYPBZvN8Fuz1QlxeKn+L
	 tLRk+jey/uwbGUvwm3uKskDvuUceFf579WcD1xCn1rY5YZhQO31rcjUAYuIySr/6nr
	 lesNFUXIoWkme11oaMGx9s95WaietbXgZaZCRtp0MtXIXYJv/iiUOWkkymI/fpE8+W
	 iZA8AYlr4VT001Miz5WbezuApQ51Rfrl2GFuth3fWcMlYkg1D6xx249Qm6Ll2XYAbc
	 oBXSUueOuRvzg==
Received: from [100.112.198.31] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-3.bemta.az-b.eu-west-1.aws.symcld.net id F8/02-07821-5A6D8016; Tue, 03 Aug 2021 05:39:49 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupmkeJIrShJLcpLzFFi42Kxs+GYqrv0Gke
  iwbNudYs7P9+xOzB6nNu4gjGAMYo1My8pvyKBNePqy93MBV85KtbPvsLWwNjJ0cXIxSEkMJNJ
  YuLd+YwQznFGiVsf5jB1MXJysAnoSHS86GbpYuTgEBHQk7j6TxQkLCzgIPF/1RVGEJtFQEXif
  vN8NhCbV8Bd4nzrITBbQkBBYsrD98wQcUGJkzOfsIDYzAISEgdfvGCGqFGU2L7zDAuEXSHx+v
  Al5gmMPLOQtMxC0rKAkWkVo0VSUWZ6RkluYmaOrqGBga6hoZGuoaWFrpGhqV5ilW6SXmqpbnl
  qcYmuoV5iebFecWVuck6KXl5qySZGYBilFBy7voPx6usPeocYJTmYlER5w45zJArxJeWnVGYk
  FmfEF5XmpBYfYpTh4FCS4BW7ApQTLEpNT61Iy8wBhjRMWoKDR0mE9955oDRvcUFibnFmOkTqF
  KOilDivKkifAEgiozQPrg0WR5cYZaWEeRkZGBiEeApSi3IzS1DlXzGKczAqCfOKXQWawpOZVw
  I3/RXQYiagxVMzWEEWlyQipKQamDLdbO8q87XNzLf74ZHTyDKnz7i9e0rA5ZBTbEoLn6zs3d4
  /wT93vVPOTUadGnuvD3sStTnYYy5+nHDlCmu6mtLSL+FHwoIae4IWRJzddOGO1Kz3c071NUqL
  cXw4W/EuefP6LYGidsXXsr2X8nj6iQW+zrnz2cKr6voKv9MJ6py7n85xjv84rdaNoXmndYqF9
  ZTDisWt/3ZwKPTW72ata7n8RTjrzwqvPwu0+IXUeFfPSky/WL59sdziLJfXOq/6t2lsXxvdq5
  gml7d4Q6/aZXerBSz1qxbJuOTbn1o4/Yzcl5XCJ0Un8qmWrnxf8P/y/i/r1Kq3q/ny/M3s/Me
  8alepi07EupUnO01YbD33KrEUZyQaajEXFScCAMXjKfweAwAA
X-Env-Sender: zangrc.fnst@fujitsu.com
X-Msg-Ref: server-10.tower-287.messagelabs.com!1627969189!339242!1
X-Originating-IP: [62.60.8.149]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 691 invoked from network); 3 Aug 2021 05:39:49 -0000
Received: from unknown (HELO mailhost2.uk.fujitsu.com) (62.60.8.149)
  by server-10.tower-287.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 3 Aug 2021 05:39:49 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost2.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 1735dnId031459
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Tue, 3 Aug 2021 06:39:49 +0100
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Tue, 3 Aug 2021 06:39:47 +0100
From: "zangrc" <zangrc.fnst@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core] [PATCH] python3-pip: upgrade 21.1.3 -> 21.2.1
Date: Tue, 3 Aug 2021 13:39:41 +0800
Message-ID: <1627969181-57137-1-git-send-email-zangrc.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Process
The source distribution re-installation feature removal has been delayed to 21.3.

Signed-off-by: Zang Ruochen <zangrc.fnst@fujitsu.com>
---
 .../python/{python3-pip_21.1.3.bb => python3-pip_21.2.1.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pip_21.1.3.bb => python3-pip_21.2.1.bb} (89%)

diff --git a/meta/recipes-devtools/python/python3-pip_21.1.3.bb b/meta/recipes-devtools/python/python3-pip_21.2.1.bb
similarity index 89%
rename from meta/recipes-devtools/python/python3-pip_21.1.3.bb
rename to meta/recipes-devtools/python/python3-pip_21.2.1.bb
index 0f105c2393..333990bb96 100644
--- a/meta/recipes-devtools/python/python3-pip_21.1.3.bb
+++ b/meta/recipes-devtools/python/python3-pip_21.2.1.bb
@@ -10,7 +10,7 @@ inherit pypi distutils3
 
 SRC_URI += "file://0001-change-shebang-to-python3.patch"
 
-SRC_URI[sha256sum] = "b5b1eb91b36894bd01b8e5a56a422c2f3838573da0b0a1c63a096bb454e3b23f"
+SRC_URI[sha256sum] = "303a82aaa24cdc01f7ebbd1afc7d1b871a4aa0a88bb5bedef1fa86a3ee44ca0a"
 
 do_install_append() {
     # Install as pip3 and leave pip2 as default
-- 
2.25.1

