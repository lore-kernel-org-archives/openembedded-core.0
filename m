Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.115])
 by mx.groups.io with SMTP id smtpd.web12.1840.1614817620582074384
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Mar 2021 16:27:01 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 85.158.142.115, mailfrom: wangmy@fujitsu.com)
Return-Path: <wangmy@fujitsu.com>
Received: from [100.113.4.174] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-4.bemta.az-b.eu-central-1.aws.symcld.net id 7D/57-44603-25920406; Thu, 04 Mar 2021 00:26:58 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprGIsWRWlGSWpSXmKPExsViZ8MxVTdQ0yH
  B4N0FU4s7P9+xOzB6nNu4gjGAMYo1My8pvyKBNWP2xBdsBUs5K2adfMnawLiZo4uRi0NIYBOT
  xKTTU5khnOOMEvduHWXtYuTkYBPQlOjdsoWxi5GDQ0RAT+LqP1GQMLOAusSldS0sILawgIfE7
  I2bmUBKWARUJP6sjgQJ8wq4Svz8cApsioSAgsSUh++ZIeKCEidnPmGBGCMhcfDFC2aIGkWJ2Z
  ebWSDsKok1HdPYJjDyzkLSMgtJywJGplWMFklFmekZJbmJmTm6hgYGuoaGxrpmQJZeYpVukl5
  qqW5yal5JUSJQUi+xvFivuDI3OSdFLy+1ZBMjMLhSCtm4djA+ff1B7xCjJAeTkijvgS/2CUJ8
  SfkplRmJxRnxRaU5qcWHGGU4OJQkeCU0HBKEBItS01Mr0jJzgIEOk5bg4FES4VVTA0rzFhck5
  hZnpkOkTjEqSonzHgPpEwBJZJTmwbXBousSo6yUMC8jAwODEE9BalFuZgmq/CtGcQ5GJWFeTn
  WgKTyZeSVw018BLWYCWjzLzQ5kcUkiQkqqgWnf9JMHP5WfqTA2sg33mqnT2WGrxGA2PSHyoWb
  NZNOiRL8jX69qOKkWT+1aYdpXu8Us+g//CdstB/eZNKVoH/j+v8qigbH5ZKpK67sj7rG36u2e
  L7vAevrSY5ZMw9Vftrb9VHzvoVFgkX8gnnVzu5GaoKXV5ZRF1h+l3i3duFvLMp87+OveD9s/G
  C7lWy09K/TdlfN1Aj9KX57d/PSvdvnL5RxfZyYkfOe1fM8Q0r/k1vyrTB675gqtj1pTJRnroP
  3d1E9WLCsnevkx5v6D1hpacgf9tz67wKPZJ37cmYXtj/X95lcuFu8FHdvdDwQ1Rc6YkMJy90u
  +ueXlPc7LZzZc+m/2y8qWTXfmKXfTnUosxRmJhlrMRcWJALYiazQpAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-26.tower-238.messagelabs.com!1614817616!1848859!1
X-Originating-IP: [62.60.8.149]
X-SYMC-ESS-Client-Auth: outbound-route-from=fail
X-StarScan-Received: 
X-StarScan-Version: 9.60.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 15752 invoked from network); 4 Mar 2021 00:26:57 -0000
Received: from unknown (HELO mailhost2.uk.fujitsu.com) (62.60.8.149)
  by server-26.tower-238.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 4 Mar 2021 00:26:57 -0000
Received: from r01ukexcasm214.r01.fujitsu.local (ex2k13_214.fs.fujitsu.com [10.182.185.116])
	by mailhost2.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 1240QpsB013595
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Thu, 4 Mar 2021 00:26:56 GMT
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 r01ukexcasm214.r01.fujitsu.local (10.182.185.116) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 4 Mar 2021 00:26:49 +0000
From: "Wang Mingyu" <wangmy@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [OE-core] [PATCH] libedit: upgrade 20191231-3.1 -> 20210216-3.1
Date: Thu, 4 Mar 2021 08:26:34 +0800
Message-ID: <1614817602-40383-1-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 r01ukexcasm214.r01.fujitsu.local (10.182.185.116)
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../{libedit_20191231-3.1.bb => libedit_20210216-3.1.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/libedit/{libedit_20191231-3.1.bb => libedit_20210216-3.1.bb} (82%)

diff --git a/meta/recipes-devtools/libedit/libedit_20191231-3.1.bb b/meta/recipes-devtools/libedit/libedit_20210216-3.1.bb
similarity index 82%
rename from meta/recipes-devtools/libedit/libedit_20191231-3.1.bb
rename to meta/recipes-devtools/libedit/libedit_20210216-3.1.bb
index 8d2d57a930..f62d621c11 100644
--- a/meta/recipes-devtools/libedit/libedit_20191231-3.1.bb
+++ b/meta/recipes-devtools/libedit/libedit_20210216-3.1.bb
@@ -13,8 +13,8 @@ inherit autotools
 SRC_URI = "http://www.thrysoee.dk/editline/${BP}.tar.gz \
            file://stdc-predef.patch \
           "
-SRC_URI[md5sum] = "2e22a51131de94ff2df24901f7cfe416"
-SRC_URI[sha256sum] = "dbb82cb7e116a5f8025d35ef5b4f7d4a3cdd0a3909a146a39112095a2d229071"
+SRC_URI[md5sum] = "e1ccc7a5f67eedf1fb69db66315f8bd7"
+SRC_URI[sha256sum] = "2283f741d2aab935c8c52c04b57bf952d02c2c02e651172f8ac811f77b1fc77a"
 
 BBCLASSEXTEND = "native nativesdk"
 
-- 
2.25.1

