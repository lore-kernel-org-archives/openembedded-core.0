Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com [195.245.230.3])
 by mx.groups.io with SMTP id smtpd.web12.8455.1624868124595429893
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Jun 2021 01:15:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=N2R3okKm;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.3, mailfrom: zangrc.fnst@fujitsu.com)
Return-Path: <zangrc.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1624868122; i=@fujitsu.com;
	bh=A6rvYtuCiiVubpqiK+UWya/8maKkZboOB36y6y6Ysks=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=N2R3okKmb1GLgMiPZiuD9VwhW7iDHiGF5Vl0+jPtbuBAHqDEf9acv8AjswLO9GggR
	 pdyOoFbtK+vq232HLBtN2HQDhfDLKBWTgZdDQTTT4BqpyWGIGndQKfjB1pjHSbQxYk
	 jfmGsYgcG3xUAcXL6iyafOlBe1fzofZrDe6Xwn9OSHO+xRJ2jWsDzNDJsMXqK/qAB8
	 aC+GEqI4CDQoFBCrh/94g6QdnVcLZzLl2aJRhGCGH/d9CLYav/+TNeLkAsnmuM0gHt
	 LEW7jwn5YXb8SWi2WUM+W5p+efxHiDA1wWVGNIUkfPBBMRanNyVkUr7Df4QOPUht9v
	 WpIRl3oWFTVow==
Received: from [100.112.192.137] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-3.bemta.az-a.eu-west-1.aws.symcld.net id 34/1A-11164-A1589D06; Mon, 28 Jun 2021 08:15:22 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupmkeJIrShJLcpLzFFi42Kxs+GYoivZejP
  BYP8fC4s7P9+xOzB6nNu4gjGAMYo1My8pvyKBNWPHu6+sBR2cFcvWP2duYFzK0cXIxSEkMItJ
  4lbvSTYI5wSjxKPJ85m7GDk52AR0JDpedLN0MXJwiAjoSVz9JwoSFhZwkNj64T4biM0ioCrxf
  cl7VhCbV8BDYvOyF2C2hICCxJSH75kh4oISJ2c+YQGxmQUkJA6+eMEMUaMosX3nGRYIu0Jixo
  xtbBMYeWYhaZmFpGUBI9MqRoukosz0jJLcxMwcXUMDA11DQyNdQ0sTIDbSS6zSTdRLLdUtTy0
  u0TXUSywv1iuuzE3OSdHLSy3ZxAgMo5SCQwd2MC5780HvEKMkB5OSKK9L1c0EIb6k/JTKjMTi
  jPii0pzU4kOMMhwcShK8X5uBcoJFqempFWmZOcCQhklLcPAoifCq1wOleYsLEnOLM9MhUqcYF
  aXEeR+C9AmAJDJK8+DaYHF0iVFWSpiXkYGBQYinILUoN7MEVf4VozgHo5Iwb3sL0BSezLwSuO
  mvgBYzAS1W+XAVZHFJIkJKqoFJZ+rZoxlbqz65FH/3+58dssLgjJoTg6nA1oINklr9V6aL2zk
  e8GyvFeuUt3/s1BX76cMvm2+Xjte8uSBl/s955sr1Mx6uUJ/ZoMR+096ycq1WVI+hhefRJwcP
  13qF3puv+uO23E0nvrAj4v+r5qZO7z3vyKh72cL3Zf2v67vOWFcVLm9YLtnX9ILl34V1y9v5Y
  7Y6+yi9ZXFSX9i7UaZsxt1PWc4ZzT8LptlbKSpoLTy26Ib7oavnf77Uaj6wMMFks5FTj7a5yR
  WLnzuemjDVpDW4iX7j3j91guEexu8SZfuayp4VW3++dP8A6+ZQf90ZD5xydm051PvpnF1BQPS
  v431zDjo8aDVgXHZ87ZxWJZbijERDLeai4kQAbYYjzR4DAAA=
X-Env-Sender: zangrc.fnst@fujitsu.com
X-Msg-Ref: server-2.tower-265.messagelabs.com!1624868121!233366!1
X-Originating-IP: [62.60.8.148]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 31393 invoked from network); 28 Jun 2021 08:15:21 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
  by server-2.tower-265.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 28 Jun 2021 08:15:21 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 15S8FGsx013814
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Mon, 28 Jun 2021 09:15:21 +0100
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Mon, 28 Jun 2021 09:15:14 +0100
From: "zangrc" <zangrc.fnst@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core] [PATCH] python3-pip: upgrade 21.1.2 -> 21.1.3
Date: Mon, 28 Jun 2021 16:15:06 +0800
Message-ID: <1624868106-101368-1-git-send-email-zangrc.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@fujitsu.com>
---
 .../python/{python3-pip_21.1.2.bb => python3-pip_21.1.3.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-pip_21.1.2.bb => python3-pip_21.1.3.bb} (83%)

diff --git a/meta/recipes-devtools/python/python3-pip_21.1.2.bb b/meta/recipes-devtools/python/python3-pip_21.1.3.bb
similarity index 83%
rename from meta/recipes-devtools/python/python3-pip_21.1.2.bb
rename to meta/recipes-devtools/python/python3-pip_21.1.3.bb
index 04c6bb587c..239e83fced 100644
--- a/meta/recipes-devtools/python/python3-pip_21.1.2.bb
+++ b/meta/recipes-devtools/python/python3-pip_21.1.3.bb
@@ -10,8 +10,8 @@ inherit pypi distutils3
 
 SRC_URI += "file://0001-change-shebang-to-python3.patch"
 
-SRC_URI[md5sum] = "a867fd51eacfd5293f5b7e0c2e7867a7"
-SRC_URI[sha256sum] = "eb5df6b9ab0af50fe1098a52fd439b04730b6e066887ff7497357b9ebd19f79b"
+SRC_URI[md5sum] = "e459d41a10ce33688b5d389216a8876f"
+SRC_URI[sha256sum] = "b5b1eb91b36894bd01b8e5a56a422c2f3838573da0b0a1c63a096bb454e3b23f"
 
 do_install_append() {
     # Install as pip3 and leave pip2 as default
-- 
2.25.1

