Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.3])
 by mx.groups.io with SMTP id smtpd.web11.627.1614401331788563141
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Feb 2021 20:48:52 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 85.158.142.3, mailfrom: wangmy@fujitsu.com)
Return-Path: <wangmy@fujitsu.com>
Received: from [100.113.0.194] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-3.bemta.az-a.eu-central-1.aws.symcld.net id D1/40-41911-72FC9306; Sat, 27 Feb 2021 04:48:39 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrHIsWRWlGSWpSXmKPExsViZ8MRoqt23jL
  BoHuRpcWdn+/YHRg9zm1cwRjAGMWamZeUX5HAmrH730v2gjUcFfuer2NvYDzB3sXIxSEkMINJ
  4vDhY2wQznFGiQefPgBlODnYBDQlerdsYexi5OAQEdCTuPpPFCTMLKAucWldCwuILSxgKbHmx
  iZ2kBIWAVWJG9fMQcK8Aq4Sl3+cYwSxJQQUJKY8fM8MYnMKuEmsvzABLC4EVNN9ehcjRL2gxM
  mZT1ggxktIHHzxghmiV1Fi9uVmFgi7UmLP5oesExj5ZyFpmYWkZQEj0ypGi6SizPSMktzEzBx
  dQwMDXUNDY11DXVNDvcQq3US91FLd5NS8kqJEoKReYnmxXnFlbnJOil5easkmRmAwphQyGu9g
  PPj6g94hRkkOJiVRXsdmywQhvqT8lMqMxOKM+KLSnNTiQ4wyHBxKErzzzgLlBItS01Mr0jJzg
  JEBk5bg4FES4V1+CijNW1yQmFucmQ6ROsWoKCXOGw3SJwCSyCjNg2uDReMlRlkpYV5GBgYGIZ
  6C1KLczBJU+VeM4hyMSsK8PiBTeDLzSuCmvwJazAS0+EqMGcjikkSElFQDk6Xli4iTF56YNl9
  su1f3Q+M0w5f1hl/9Fk9tUXy/+2XxJ5lPk3q04oV59t8JTVZOEDcpU8m7vNpWiVN+u1XQ/Lii
  40p+Ey85c3vV6H6PyLFz3HWty6Uw4txVvmWBjFohDJ/2Kp/992CCcbyNpcH7UivuHueN6z14P
  0gVt6x+p/772KyEPxfruu9u7V1ozunOZ5IctebCRLnNElNnZ4U3/bO+ZXIseKqsdqLVEtUi3+
  UBVwOeHFZWuFtbFGx6dWdxNGut37xdqze79jjd6kqQnX2gWtto5Z8sp2MsL2rkf6qdd1/sGmx
  y0qim4/i9G188HE3vz2Rw5BfcXnNX+4NqkG7RI9Gcldzhyby5z4KVWIozEg21mIuKEwEzl0u9
  QQMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-21.tower-226.messagelabs.com!1614401318!141163!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=fail
X-StarScan-Received: 
X-StarScan-Version: 9.60.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 22963 invoked from network); 27 Feb 2021 04:48:38 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-21.tower-226.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 27 Feb 2021 04:48:38 -0000
Received: from r01ukexcasm111.r01.fujitsu.local ([10.183.43.167])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 11R4ma3X020984
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Sat, 27 Feb 2021 04:48:38 GMT
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM111.r01.fujitsu.local (10.183.43.167) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Sat, 27 Feb 2021 04:48:34 +0000
From: "Wang Mingyu" <wangmy@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [OE-core] [PATCH] eudev: upgrade 3.2.9 -> 3.2.10
Date: Sat, 27 Feb 2021 12:48:14 +0800
Message-ID: <1614401296-27095-2-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1614401296-27095-1-git-send-email-wangmy@cn.fujitsu.com>
References: <1614401296-27095-1-git-send-email-wangmy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 R01UKEXCASM111.r01.fujitsu.local (10.183.43.167)
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 meta/recipes-core/udev/{eudev_3.2.9.bb => eudev_3.2.10.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-core/udev/{eudev_3.2.9.bb => eudev_3.2.10.bb} (95%)

diff --git a/meta/recipes-core/udev/eudev_3.2.9.bb b/meta/recipes-core/udev/eudev_3.2.10.bb
similarity index 95%
rename from meta/recipes-core/udev/eudev_3.2.9.bb
rename to meta/recipes-core/udev/eudev_3.2.10.bb
index f96f8cbe78..156fafa201 100644
--- a/meta/recipes-core/udev/eudev_3.2.9.bb
+++ b/meta/recipes-core/udev/eudev_3.2.10.bb
@@ -20,8 +20,8 @@ SRC_URI = "https://dev.gentoo.org/~blueness/${BPN}/${BP}.tar.gz \
            file://udev.rules \
 "
 
-SRC_URI[md5sum] = "dedfb1964f6098fe9320de827957331f"
-SRC_URI[sha256sum] = "89618619084a19e1451d373c43f141b469c9fd09767973d73dd268b92074d4fc"
+SRC_URI[md5sum] = "60b135a189523f333cea5f71a3345c8d"
+SRC_URI[sha256sum] = "87bb028d470fd1b85169349b44c55d5b733733dc2d50ddf1196e026725ead034"
 
 inherit autotools update-rc.d qemu pkgconfig features_check
 
-- 
2.25.1

