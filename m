Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com [195.245.230.68])
 by mx.groups.io with SMTP id smtpd.web11.7737.1623318601049198807
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Jun 2021 02:50:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=uObch6py;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.68, mailfrom: zhengrq.fnst@fujitsu.com)
Return-Path: <zhengrq.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1623318599; i=@fujitsu.com;
	bh=UrkeV9Xdep/dsF67OfxUT8xING2/rqUxTz+7geG+9hQ=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=uObch6pyEW3TXJck7Y7LzHYJBzZy2G/DGn7PBEJQC9WTvfYZDzxZyKRdVkY2tBIOq
	 4uY4Fe0UxaUwCe6njdDU491RVOXBFdtcHZEsJ5DIwVbad9JfdzaKpBFA8FZCZSrYNe
	 lXLhxKw0rcTEIOLOnwT0e02VqjyYDYip8YsZ9xMAvsYm/mgDTXkpKNV4Pawl8AysV/
	 nmCPNFVmA1Yi2Lah5+V1QJNWJvPq8vp3RWTJyn4WwTF/riVXhc5KMx3wmv9qqmLLI7
	 /asZcHmyC24mjIeyGC/qhcJd3+dS1Z37wBsvDNmEDlxSuI/sEc79yQzd66HusoCstA
	 PZOJt8TZ9568w==
Received: from [100.112.199.60] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-4.bemta.az-b.eu-west-1.aws.symcld.net id 50/F5-62504-640E1C06; Thu, 10 Jun 2021 09:49:58 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprKIsWRWlGSWpSXmKPExsViZ8MxRdftwcE
  Eg1MfNCzu/HzH7sDocW7jCsYAxijWzLyk/IoE1oymk39ZC75yVEx+1srUwDiJo4uRi0NIYBaT
  xPmrD9ggnD2MEmfX7WTvYuTkYBPQlTj3eC2QzcEhIqAncfWfKEhYWMBS4v30E8wgNouAqsSRV
  RdZQUp4BdwllrSDdUoIKEhMefgerIRXQFDi5MwnLCA2s4CExMEXL5hByiUEFCVmT5eHKK+QmD
  FjG9sERp5ZSDpmIelYwMi0itEiqSgzPaMkNzEzR9fQwEDX0NBI19DSUtfIyFwvsUo3SS+1VLc
  8tbhE11AvsbxYr7gyNzknRS8vtWQTIzCEUgqOP97BuOLNB71DjJIcTEqivO1XDyYI8SXlp1Rm
  JBZnxBeV5qQWH2KU4eBQkuC1ugeUEyxKTU+tSMvMAYYzTFqCg0dJhJf/BlCat7ggMbc4Mx0id
  YpRl+Py9XmLmIVY8vLzUqXEeTlAZgiAFGWU5sGNgMXWJUZZKWFeRgYGBiGegtSi3MwSVPlXjO
  IcjErCvEkgU3gy80rgNr0COoIJ6AhH430gR5QkIqSkGphajHRqeCa1vNlS15SlESMbk3b8dMA
  aTq+G9c2bM2tq8/+efNsnF7x5fcf58u1bzkpvebU0peA6T+D8K/Zl7HoGetY1N5hXfvmZftN7
  DUucva1rUYVOdHx9NculGV+LWmv/XE/l3xXFdrfz6Y/39sLHtYt3LNJYLfcqvsiwZdMe/vplq
  /61RNky/ZxXdn/G5Z8p0kqpZS4cLH8bGiPXvJSd3Nf3a9YjOc0HM3um+R7eUnCr3fpoTb/dVk
  VVjcX8xVsdxL9tldB594xnudRcg2e75fctXu98mpV37XND7wnHrom1G1syvbgkzfDlkvzS4mu
  PNx/7NivsGTtj8vO5E8t3t3ydJFeXcWfJ3tUW/J+UWIozEg21mIuKEwHrQbeKKAMAAA==
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-13.tower-287.messagelabs.com!1623318598!22784!1
X-Originating-IP: [62.60.8.148]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.75.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 14956 invoked from network); 10 Jun 2021 09:49:58 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
  by server-13.tower-287.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 10 Jun 2021 09:49:58 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 15A9nYhA014013
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Thu, 10 Jun 2021 10:49:58 +0100
Received: from localhost.localdomain (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Thu, 10 Jun 2021 10:49:39 +0100
From: "zhengruoqin" <zhengrq.fnst@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core] [PATCH] libogg: upgrade 1.3.4 -> 1.3.5
Date: Fri, 11 Jun 2021 02:49:19 +0800
Message-ID: <1623350959-4495-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 .../libogg/{libogg_1.3.4.bb => libogg_1.3.5.bb}               | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/libogg/{libogg_1.3.4.bb => libogg_1.3.5.bb} (80%)

diff --git a/meta/recipes-multimedia/libogg/libogg_1.3.4.bb b/meta/recipes-multimedia/libogg/libogg_1.3.5.bb
similarity index 80%
rename from meta/recipes-multimedia/libogg/libogg_1.3.4.bb
rename to meta/recipes-multimedia/libogg/libogg_1.3.5.bb
index c4004619b9..b4f02e404c 100644
--- a/meta/recipes-multimedia/libogg/libogg_1.3.4.bb
+++ b/meta/recipes-multimedia/libogg/libogg_1.3.5.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=db1b7a668b2a6f47b2af88fb008ad555 \
 
 SRC_URI = "http://downloads.xiph.org/releases/ogg/${BP}.tar.xz"
 
-SRC_URI[md5sum] = "eadef24aad6e3e8379ba0d14971fd64a"
-SRC_URI[sha256sum] = "c163bc12bc300c401b6aa35907ac682671ea376f13ae0969a220f7ddf71893fe"
+SRC_URI[md5sum] = "3178c98341559657a15b185bf5d700a5"
+SRC_URI[sha256sum] = "c4d91be36fc8e54deae7575241e03f4211eb102afb3fc0775fbbc1b740016705"
 
 inherit autotools pkgconfig
-- 
2.25.1

