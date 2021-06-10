Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.1])
 by mx.groups.io with SMTP id smtpd.web12.7069.1623312243450754129
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Jun 2021 01:04:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=MFTj1gk8;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.1, mailfrom: wangmy@fujitsu.com)
Return-Path: <wangmy@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1623312241; i=@fujitsu.com;
	bh=TroLYMnYM+JTD/Wwe8THjxot0zVPZwy7MRLgchq7k8I=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=MFTj1gk8eKorY8pQFFdBP4ZLJ76/2NgGbswoCWCPoAuh3kPAtY0oGDBvx258XR5kx
	 EwuyYLgoethXNu6vT4mhPv8NlvB7vCUcJCVWSpommT/BccVioAbMQQWomMe+g3AuYi
	 IMJhNbim93RZSOJopaOtDaErmXrGsDIVZVjUqM9vzmpHBydAHpN4gbXOLUJGtKsU6Y
	 qIckDbCH+WBAT/WLKO8wqDibCoVQQ/KvqK4Ee8JMiARVUfGKUlzBr54EDHM4J/gYB+
	 08hlNhhqqroRgzq/pLsUMzUIzxBdRAYShhSfcd1188SdPLlZ2TVkS7tvwrHRWxsVN0
	 xhRy8fsWQxpzw==
Received: from [100.113.2.110] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-a.eu-central-1.aws.symcld.net id 2C/01-37841-177C1C06; Thu, 10 Jun 2021 08:04:01 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprOIsWRWlGSWpSXmKPExsViZ8MRqltw/GC
  CwYpJJhZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa0bnhYWMBTc5Ki63bmNtYPzJ3sXIxSEkMItJ
  YmX/TtYuRk4g5wSjxIfVQSA2m4CaxPRbN4DiHBwiAnoSV/+JgoSZBVQkXvzuYQexhQUsJK6v6
  2YBsVkEVCV6/m0EG8Mr4CTxc90BRhBbQkBBYsrD98wQcUGJkzOfsEDMkZA4+OIFM0SNosTsy8
  0sEHaFxOvDl5gnMPLOQtIyC0nLAkamVYyWSUWZ6RkluYmZObqGBga6hobGuoZA0lwvsUo3US+
  1VDc5Na+kKBEoq5dYXqxXXJmbnJOil5dasokRGF4phYylOxinvfmgd4hRkoNJSZT39oKDCUJ8
  SfkplRmJxRnxRaU5qcWHGGU4OJQkeNOPAuUEi1LTUyvSMnOAoQ6TluDgURLhdTgAlOYtLkjML
  c5Mh0idYlSUEudtB+kTAElklObBtcHi6xKjrJQwLyMDA4MQT0FqUW5mCar8K0ZxDkYlYd6FIF
  N4MvNK4Ka/AlrMBLTY0XgfyOKSRISUVAOTpKzEzkmaszi/Ns+L+bmKK+qeuv6CFfpHpl/N+HX
  ZVoFxlfOG+EUbmeMfWVU+V1pod1N4vZAJH9OFDX/vCSa2m27JXx98Zc/tW5Zvj8qfXvu7c13k
  pcwYuWvZFXy2v580pT2frqRW9mTPzt6l8UwxOyoWvfjpMMeCv63P6kbInv5zDo7nOL+7iQgkL
  WAU26Jkwc/68PavlEtFc5f/8G6saWXXZqpkqXzhxxp9/tMux5xZnDIp+2a5rYtgXjq58smfvB
  XbC5pve05c9VTK0Chn25bnaqtUTapkps5IerleQyvJs3feI+PHM0ItJ2Tqttz/4VHzwSfDNjn
  XJFfKJLgs++zuK1H/Q3a15+213eGvxFKckWioxVxUnAgAr1xM7CoDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-10.tower-226.messagelabs.com!1623312240!37663!1
X-Originating-IP: [62.60.8.85]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.75.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 24896 invoked from network); 10 Jun 2021 08:04:00 -0000
Received: from unknown (HELO mailhost4.uk.fujitsu.com) (62.60.8.85)
  by server-10.tower-226.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 10 Jun 2021 08:04:00 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost4.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 15A83r72016246
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Thu, 10 Jun 2021 09:04:00 +0100
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Thu, 10 Jun 2021 09:03:51 +0100
From: "wangmy" <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] git: upgrade 2.31.1 -> 2.32.0
Date: Thu, 10 Jun 2021 16:03:36 +0800
Message-ID: <1623312216-45515-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-devtools/git/{git_2.31.1.bb => git_2.32.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/git/{git_2.31.1.bb => git_2.32.0.bb} (51%)

diff --git a/meta/recipes-devtools/git/git_2.31.1.bb b/meta/recipes-devtools/git/git_2.32.0.bb
similarity index 51%
rename from meta/recipes-devtools/git/git_2.31.1.bb
rename to meta/recipes-devtools/git/git_2.32.0.bb
index 6bfa1f7a1e..f45737b096 100644
--- a/meta/recipes-devtools/git/git_2.31.1.bb
+++ b/meta/recipes-devtools/git/git_2.32.0.bb
@@ -5,5 +5,5 @@ EXTRA_OECONF += "ac_cv_snprintf_returns_bogus=no \
                  "
 EXTRA_OEMAKE += "NO_GETTEXT=1"
 
-SRC_URI[tarball.sha256sum] = "46d37c229e9d786510e0c53b60065704ce92d5aedc16f2c5111e3ed35093bfa7"
-SRC_URI[manpages.sha256sum] = "d330498aaaea6928b0abbbbb896f6f605efd8d35f23cbbb2de38c87a737d4543"
+SRC_URI[tarball.sha256sum] = "6038f06d396ba9dab2eee541c7db6e7f9f847f181ec62f3d8441893f8c469398"
+SRC_URI[manpages.sha256sum] = "b5533c40ea1688231c0e2df51cc0d1c0272e17fe78a45ba6e60cb8f61fa4a53c"
-- 
2.25.1

