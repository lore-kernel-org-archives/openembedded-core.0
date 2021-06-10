Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com [195.245.230.3])
 by mx.groups.io with SMTP id smtpd.web12.7155.1623312954172000750
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Jun 2021 01:15:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=iMKPhXkL;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.3, mailfrom: wangmy@fujitsu.com)
Return-Path: <wangmy@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1623312951; i=@fujitsu.com;
	bh=HBbcbw0i2BU9LEJDayxDegJGwu486Xg6Y5Cq4IQnjgQ=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=iMKPhXkLj/nKtPTgRcs0E377DQTEcPpe7F7iXKYuG1bripKs9hkMndwbTWxESMsh7
	 wzW+ybtpH9Ddo627vTBIb6Thi37beY+RRSOR59vQpu3REEAsDmzJS5OR0HWGWyGclm
	 EfJ97vGrqzL4A4fPU3Zicpz151idwnEJXcl98wcXtD3lD0bgRIXPzvhkWIN1oL7B18
	 iWvEQ52Ti7SCiigm8QWj3sVqiyFYzbRHnGDbAHqcxK79EL89OFVPc8d1w9GmJ/LHZ3
	 PRzW+U5ZoBK+3xec12X0H/LDzO/yxRABAb93O+Y56pe9piuz4ghIam+o+qwgBjeGQH
	 Bghx5gWZ7n3FA==
Received: from [100.112.193.7] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-3.bemta.az-a.eu-west-1.aws.symcld.net id A4/32-45475-73AC1C06; Thu, 10 Jun 2021 08:15:51 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprGIsWRWlGSWpSXmKPExsViZ8MRomt26mC
  CwZXjFhZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8aht2kF7RwVDdtaWBsY57F3MXJxCAnMYpK4
  sWwXE4RzglHi5o7vLF2MnBxsAmoS02/dYO1i5OAQEdCTuPpPFCTMLKAi8eJ3DzuILSxgKTHt2
  jYmEJtFQFWiZdVpNhCbV8BJov3Ne7C4hICCxJSH75kh4oISJ2c+YYGYIyFx8MULZogaRYnZl5
  tZIOwKideHLzFPYOSdhaRlFpKWBYxMqxgtkooy0zNKchMzc3QNDQx0DQ2NdA0tgdjYVC+xSjd
  RL7VUtzy1uETXUC+xvFivuDI3OSdFLy+1ZBMjMLhSCg6072B89PqD3iFGSQ4mJVHe2wsOJgjx
  JeWnVGYkFmfEF5XmpBYfYpTh4FCS4JU+AZQTLEpNT61Iy8wBBjpMWoKDR0mEVwUkzVtckJhbn
  JkOkTrFqCglzqsAkhAASWSU5sG1waLrEqOslDAvIwMDgxBPQWpRbmYJqvwrRnEORiVhXnOQKT
  yZeSVw018BLWYCWuxovA9kcUkiQkqqgWlabPTDSxncN3d27LByexHu93Fq/7a7D3ZdOl7pY91
  Z69vwOqvTo/HplU1319yyEWRfzxz4hGPz+7rTHG4dluuFX8t8e5D5LyXvbIzjjEOS4adfFr9p
  9JkYaaeT0GkfoNp5PWOfx7buub+u5E1fZqafUtXz4ts3rtolOw6Hfiiev+iKkJ0Q00qnZ41vl
  nwJeJJ4RHX6+18G+qucbfuWW+oqftjm+prN56+XI9O0cwtuyE2oFXLzqD+9csl+Af//8mZX49
  UZA3iYHGbn7lXZvdPkcfAClwC1Ox0hX8wXCwmnr5rz+s/eyiyG1LJJ9vt7mr//23b13t5+KYu
  iDZ+vzvv89eL7w+wW2vNXxYkllD5UYinOSDTUYi4qTgQAJxSrgSkDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-4.tower-265.messagelabs.com!1623312950!281214!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.75.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 32486 invoked from network); 10 Jun 2021 08:15:50 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-4.tower-265.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 10 Jun 2021 08:15:50 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 15A8Fo38028216
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Thu, 10 Jun 2021 09:15:50 +0100
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Thu, 10 Jun 2021 09:15:48 +0100
From: "wangmy" <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] gnutls: upgrade 3.7.1 -> 3.7.2
Date: Thu, 10 Jun 2021 16:15:33 +0800
Message-ID: <1623312933-45596-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-support/gnutls/{gnutls_3.7.1.bb => gnutls_3.7.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/gnutls/{gnutls_3.7.1.bb => gnutls_3.7.2.bb} (96%)

diff --git a/meta/recipes-support/gnutls/gnutls_3.7.1.bb b/meta/recipes-support/gnutls/gnutls_3.7.2.bb
similarity index 96%
rename from meta/recipes-support/gnutls/gnutls_3.7.1.bb
rename to meta/recipes-support/gnutls/gnutls_3.7.2.bb
index 350d0a018b..430d1f2d7d 100644
--- a/meta/recipes-support/gnutls/gnutls_3.7.1.bb
+++ b/meta/recipes-support/gnutls/gnutls_3.7.2.bb
@@ -23,7 +23,7 @@ SRC_URI = "https://www.gnupg.org/ftp/gcrypt/gnutls/v${SHRT_VER}/gnutls-${PV}.tar
            file://arm_eabi.patch \
            "
 
-SRC_URI[sha256sum] = "3777d7963eca5e06eb315686163b7b3f5045e2baac5e54e038ace9835e5cac6f"
+SRC_URI[sha256sum] = "646e6c5a9a185faa4cea796d378a1ba8e1148dbb197ca6605f95986a25af2752"
 
 inherit autotools texinfo pkgconfig gettext lib_package gtk-doc
 
-- 
2.25.1

