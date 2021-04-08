Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.1])
 by mx.groups.io with SMTP id smtpd.web09.4092.1617860469622816110
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Apr 2021 22:41:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=uH2VHZCS;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.1, mailfrom: wangmy@fujitsu.com)
Return-Path: <wangmy@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1617860467; i=@fujitsu.com;
	bh=VdYYaJCrgrh7RaeF+d01Y0f8rtgzr9c5x9p95E0Pkg0=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=uH2VHZCSl88XBP3ospJuzDv+MP6/2OPjtvC6wnXzo+8JpKqhn/5PC7oYZJPbMY7AD
	 HqsoQ9QR6DlhNIC7isMir6u6xErXhk5C1PeK9oe1kpCfcfhejceLvtI6H1P0QYYIZX
	 n8foQz7xX1u0o/NuYZGOpJaHCJ14AfQOsdbWo0k/LtN+LKySpXCzTKlP91KGWC0nJT
	 ngOlHiK36lDfk4aKMvtfz5BX95HFgME567CsJKzPDjJ3huomL+GCxJUFj7n/AWFYSW
	 9gNjE0Bq/7hH/atv9shTl434Uwz65rcv8+AqMgupqD4xj83Z8J6J4SNIS/vWeqCM02
	 JRVunq+Od2Tpg==
Received: from [100.113.3.92] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-a.eu-central-1.aws.symcld.net id 09/8E-07430-3779E606; Thu, 08 Apr 2021 05:41:07 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrBIsWRWlGSWpSXmKPExsViZ8MxRbd4el6
  CwU1uizs/37E7MHqc27iCMYAxijUzLym/IoE14/bNJ+wFJzkqjsy7y9LA+Jq9i5GLQ0hgC5PE
  14aLbBDOcUaJY5NesnQxcnKwCahJTL91g7WLkYNDREBP4uo/UZAws4CKxIvfPewgtrCAvcTpk
  9+ZQGwWoPjV3jawcl4BR4kvixVAwhICChJTHr5nBrF5BQQlTs58wgIxRkLi4IsXzBA1ihKzLz
  ezQNhVEp0fjrNNYOSdhaRlFpKWBYxMqxgtk4oy0zNKchMzc3QNDQx0DQ2NdY11DS1N9BKrdBP
  1Ukt1k1PzSooSgbJ6ieXFesWVuck5KXp5qSWbGIHBlVLIfGgH45PXH/QOMUpyMCmJ8mZNyksQ
  4kvKT6nMSCzOiC8qzUktPsQow8GhJMFrNw0oJ1iUmp5akZaZAwx0mLQEB4+SCK87SJq3uCAxt
  zgzHSJ1itGY4+SqJYuYOb6ASCGWvPy8VClxXnOQUgGQ0ozSPLhBsAi8xCgrJczLyMDAIMRTkF
  qUm1mCKv+KUZyDUUmYtwpkCk9mXgncvldApzABnVJyMBfklJJEhJRUA1N0bEYhA5v+vz+hJf5
  Hd7L/0diS3Rwxfc4eVtZarZsx2tusqz408u1xvZfZtUR6x/2mS1d+P+hYX15m2WDibvTk2UOl
  Df1fOVaxbe3Z+G9xM7OxVd6FpVJVL4KOil52W345zcme2UMl7z/DtQ9Ht5Zkh66q/vq8yOzcw
  sSm8uur9ostllw197BwF+93VivWm5e0Zt7bt/fEi4lJb/4Kit/c1xsom7jSkiOsYrlEtX9WcK
  PYz8tnmPIz1pg+fV10fPX+KKenGnMe78l4vKa074GWslji+p1iIvyxnDelhRceefzNVHlKyBf
  fsJtlLGeUN/Lb1fF2Pppq5ilx4fgtiyPvL2slxljKC/THB53bwKPEUpyRaKjFXFScCAAa5Ju9
  OwMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-7.tower-232.messagelabs.com!1617860466!1002611!1
X-Originating-IP: [62.60.8.148]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.60.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 8663 invoked from network); 8 Apr 2021 05:41:06 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
  by server-7.tower-232.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 8 Apr 2021 05:41:06 -0000
Received: from R01UKEXCASM223.r01.fujitsu.local (ex2k13_223.fs.fujitsu.com [10.182.185.121])
	by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 1385f6M6023185
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Thu, 8 Apr 2021 06:41:06 +0100
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 8 Apr 2021 06:41:04 +0100
From: "wangmy" <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] acpica: upgrade 20210105 -> 20210331
Date: Thu, 8 Apr 2021 13:40:48 +0800
Message-ID: <1617860454-5064-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../acpica/{acpica_20210105.bb => acpica_20210331.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/acpica/{acpica_20210105.bb => acpica_20210331.bb} (94%)

diff --git a/meta/recipes-extended/acpica/acpica_20210105.bb b/meta/recipes-extended/acpica/acpica_20210331.bb
similarity index 94%
rename from meta/recipes-extended/acpica/acpica_20210105.bb
rename to meta/recipes-extended/acpica/acpica_20210331.bb
index 0188dc8a1b..e17bc94c39 100644
--- a/meta/recipes-extended/acpica/acpica_20210105.bb
+++ b/meta/recipes-extended/acpica/acpica_20210331.bb
@@ -17,7 +17,7 @@ COMPATIBLE_HOST = "(i.86|x86_64|arm|aarch64).*-linux"
 DEPENDS = "m4-native flex-native bison-native"
 
 SRC_URI = "https://acpica.org/sites/acpica/files/acpica-unix-${PV}.tar.gz"
-SRC_URI[sha256sum] = "a9be7b749025e60f93fde2fe531bfe0d84a33641d3e0c9b0f6049f996dbb1ff8"
+SRC_URI[sha256sum] = "b49237a2c3df58b57310612ec3a6ebee69e1a525b5efeec7152faf32a03b7068"
 
 UPSTREAM_CHECK_URI = "https://acpica.org/downloads"
 
-- 
2.25.1

