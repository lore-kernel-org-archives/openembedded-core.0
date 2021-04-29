Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com [195.245.230.66])
 by mx.groups.io with SMTP id smtpd.web08.6155.1619700186950823491
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Apr 2021 05:43:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=HovqJzpE;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.66, mailfrom: zhengrq.fnst@fujitsu.com)
Return-Path: <zhengrq.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1619700184; i=@fujitsu.com;
	bh=/xEiDPa4fF1TNukGyw9oTrb/bJj98yeMnkQTSoKBZGY=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=HovqJzpEM05ATYMgBggbHH52Pt4fIGtEu40nGT8o92u951TcZwM667V2Fsq+OYSST
	 Mj293D59FMCbjvRxkzf6zGwaSuFIOwJ3j5UWSTN3ZnD1qlnYSooS7+jc+phCmAOpWK
	 zZReYUk0adAqOdmETb5MG2tCwhsUAV2Od7W97yCzKXdQqaWdgIiGwktDZyHDHUKUBL
	 UeHrNrAqNUxHLjX9vJ/Xf0R2IsyyodVHJrA1fkYoQZx8/6+PJgEwcw0TjWsXhv1nwk
	 BdsCytPdGQmKLD3S7uAm/LjKEMRpodOi76q1uwPnSXQg/XimVCGh3g+LXsv2yPzYiN
	 MqM8QLY/ve68w==
Received: from [100.112.198.228] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-2.bemta.az-b.eu-west-1.aws.symcld.net id 38/DF-60958-8D9AA806; Thu, 29 Apr 2021 12:43:04 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrLIsWRWlGSWpSXmKPExsViZ8MRqntjZVe
  CwdS/0hZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8bZiRwF2zkrZkw6zdbAeIOji5GLQ0hgFpNE
  69+VTBDObkaJI61v2bsYOTnYBHQlzj1eC2RzcIgI6Elc/ScKEhYWcJI4cPsdWAmLgKrE7f6jr
  CA2r4C7xMc9fUwgtoSAgsSUh++ZIeKCEidnPmEBsZkFJCQOvnjBDDJSQkBRYvZ0eYjySont08
  4yTmDkmYWkYxaSjgWMTKsYLZKKMtMzSnITM3N0DQ0MdA0NjXQNLc10jQyN9RKrdJP0Ukt1y1O
  LS3QN9RLLi/WKK3OTc1L08lJLNjECQyil4MjVHYzdbz7oHWKU5GBSEuXd0tmZIMSXlJ9SmZFY
  nBFfVJqTWnyIUYaDQ0mCd8OKrgQhwaLU9NSKtMwcYDjDpCU4eJREeIuAIS3EW1yQmFucmQ6RO
  sXoyvFs7ZJFzBwb5i0Fkv/v3gWS/QsOrmbmuNl+aDWzEEtefl6qlDjvTJDZAiDNGaV5cKNhsX
  iJUVZKmJeRgYFBiKcgtSg3swRV/hWjOAejkjBvB8gUnsy8ErgLXgEdxwR03LLzbSDHlSQipKQ
  amA4x34tftXyVuL7Qv0/ZPztnWFeU1rkHKH9e9uSE0VXZdve3Jfr5fDnLq58s/f5C9Ns0Z+HQ
  /PagKy1bK5R2CS7k+GVSnj2Tf7v+UbO83xP2TXxRXZmr/971gqxQzCTWa3MqWQXyu2P4uII8H
  BJO+a52fam1dT9z8DmWtQrxJkfOHOcPZzktK32L5eVCn/Knl6K/3pp5UCFJY0bhXIW4rSf6P5
  7YtXiuo9utidH/P71VmFjGUFZbEFWff6R/bfgHQ9bAJ43dMW439BMyXXJeNBbL1LBVTHm+//+
  0dw55DFdmp1xbNofRUmXThoojf1Uc3/GIFab4P99RbDvvrn9hVedv3yWz4qd4Bqos8Ji7S4ml
  OCPRUIu5qDgRAO2hWGFAAwAA
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-5.tower-291.messagelabs.com!1619700184!78762!1
X-Originating-IP: [62.60.8.85]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.75.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 22500 invoked from network); 29 Apr 2021 12:43:04 -0000
Received: from unknown (HELO mailhost4.uk.fujitsu.com) (62.60.8.85)
  by server-5.tower-291.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 29 Apr 2021 12:43:04 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost4.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 13TCh4v2024708
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Thu, 29 Apr 2021 13:43:04 +0100
Received: from localhost.localdomain (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 29 Apr 2021 13:43:02 +0100
From: "zhengruoqin" <zhengrq.fnst@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core] [PATCH] libmicrohttpd: upgrade 0.9.72 -> 0.9.73
Date: Thu, 29 Apr 2021 20:42:53 +0800
Message-ID: <1619700173-5440-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 .../{libmicrohttpd_0.9.72.bb => libmicrohttpd_0.9.73.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/libmicrohttpd/{libmicrohttpd_0.9.72.bb => libmicrohttpd_0.9.73.bb} (87%)

diff --git a/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.72.bb b/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.73.bb
similarity index 87%
rename from meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.72.bb
rename to meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.73.bb
index 66c48da3b7..219f0c44d6 100644
--- a/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.72.bb
+++ b/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.73.bb
@@ -7,8 +7,8 @@ SECTION = "net"
 DEPENDS = "file"
 
 SRC_URI = "${GNU_MIRROR}/libmicrohttpd/${BPN}-${PV}.tar.gz"
-SRC_URI[md5sum] = "2a286193af88ab2ae3149748d4b46187"
-SRC_URI[sha256sum] = "0ae825f8e0d7f41201fd44a0df1cf454c1cb0bc50fe9d59c26552260264c2ff8"
+SRC_URI[md5sum] = "2b15949b1633e4fa487e08cdcc97f0e3"
+SRC_URI[sha256sum] = "a37b2f1b88fd1bfe74109586be463a434d34e773530fc2a74364cfcf734c032e"
 
 inherit autotools lib_package pkgconfig gettext
 
-- 
2.25.1

