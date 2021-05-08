Received: from mail3.bemta25.messagelabs.com (mail3.bemta25.messagelabs.com [195.245.230.85])
 by mx.groups.io with SMTP id smtpd.web09.1229.1620435919728632367
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 May 2021 18:05:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=psvztS4y;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.85, mailfrom: wangmy@fujitsu.com)
Return-Path: <wangmy@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1620435918; i=@fujitsu.com;
	bh=HF48TFXlv80KXpwAU249wyn5ebF4VLJdv2jajKT9rvM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=psvztS4yMj4T2pAk/uzBfowf6EEl9o324/qqHhR9GpG09pHvN72ASWEi31T7YEnvA
	 2KEiP7vOIViNNdw1hMGFtU8rI+kDN7cOwhknQp0O+rPk+eZJCKuLjVv4k23FEZ2gqo
	 iZVFeMtGUKa+xHMjveUozESgfjb/WVJHcPerMRNcj9+c284YyF3EBCeEYQldTwY8xv
	 Y8zRSAQEEat8b9sIiFbpPcjMNnvFdCzzhDmXqEPTdE7cICNOhI07DPjCKNBJQ2ZSeS
	 9PS5TWTr0VAEDsoffpOmxcb80eavbxN6x3gqQ3d4OwZoAXr/tkvwCo6tJeXyIrCCrq
	 vVy8gEwcDRW2w==
Received: from [100.112.198.228] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-5.bemta.az-b.eu-west-1.aws.symcld.net id CD/73-53303-DC3E5906; Sat, 08 May 2021 01:05:17 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrFIsWRWlGSWpSXmKPExsViZ8MRonv28dQ
  Eg2OnZS3u/HzH7sDocW7jCsYAxijWzLyk/IoE1ow9f96zFOzkqGibvIm1gfEGexcjF4eQwEwm
  iQ+z9rBBOMcYJbZsXcvYxcjJwSagJjH91g3WLkYODhEBPYmr/0RBwswCKhIvfvewg9jCAs4S/
  Vd+soLYLEDx719fs4DYvAJOEn8+tTKD2BICChJTHr4HszmB6u+8X8sGYgsB1RycdY0Nol5Q4u
  TMJywQ8yUkDr54AdWrKDH7cjMLhF0h8frwJeYJjPyzkLTMQtKygJFpFaN5UlFmekZJbmJmjq6
  hgYGuoaGRrqGlma6ZiV5ilW6SXmqpbnlqcYmuoV5iebFecWVuck6KXl5qySZGYDCmFBxx2MF4
  //UHvUOMkhxMSqK8RTlTE4T4kvJTKjMSizPii0pzUosPMcpwcChJ8O68DpQTLEpNT61Iy8wBR
  gZMWoKDR0mE1+sRUJq3uCAxtzgzHSJ1ilGXY+fpxYuYhVjy8vNSpcR5n4IUCYAUZZTmwY2ARe
  klRlkpYV5GBgYGIZ6C1KLczBJU+VeM4hyMSsK8ciBTeDLzSuA2vQI6ggnoiI9rJ4EcUZKIkJJ
  qYIpgUGDUf3a+MrwlPNGwI0jU/eiqyzser1eZr3rmvfEciQl8aw+KBX457NdWHyTi6ldv0J9e
  7pvwsE35nF33ibdc3+2+/pG4d6/p38TuNV1aPPGWVVNLIlmeC8x7f26ei/nBPwdbJ/cwpd07x
  Zwf+3hS7PY8T4kSH8GPxqJXSrJKGMUVNnrMzFWyrok2sTm6L9107WIL6cSV2+Vr9rClGa0238
  lQY7Bp2feDEkuffWPRdzDl2OwjzbpEKP1zzb3U4surfEXOpLwLz0jLf6kw/edSmQk3NViTDzx
  y3zjpidRpSaGosKjVUpLugckC9hZfP7zNq7pxavqU+6nLtPKcpDYXNwidyZj2Jc59bvBNJZbi
  jERDLeai4kQAW2caQU0DAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-12.tower-285.messagelabs.com!1620435917!648636!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.75.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 8534 invoked from network); 8 May 2021 01:05:17 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-12.tower-285.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 8 May 2021 01:05:17 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 14815HtF017607
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Sat, 8 May 2021 02:05:17 +0100
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Sat, 8 May 2021 02:05:15 +0100
From: "wangmy" <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-pygments: upgrade 2.8.1 -> 2.9.0
Date: Sat, 8 May 2021 09:04:15 +0800
Message-ID: <1620435855-48558-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1620435855-48558-1-git-send-email-wangmy@fujitsu.com>
References: <1620435855-48558-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-pygments_2.8.1.bb => python3-pygments_2.9.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pygments_2.8.1.bb => python3-pygments_2.9.0.bb} (83%)

diff --git a/meta/recipes-devtools/python/python3-pygments_2.8.1.bb b/meta/recipes-devtools/python/python3-pygments_2.9.0.bb
similarity index 83%
rename from meta/recipes-devtools/python/python3-pygments_2.8.1.bb
rename to meta/recipes-devtools/python/python3-pygments_2.9.0.bb
index a2e0083483..7fedcb5a88 100644
--- a/meta/recipes-devtools/python/python3-pygments_2.8.1.bb
+++ b/meta/recipes-devtools/python/python3-pygments_2.9.0.bb
@@ -5,7 +5,7 @@ LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=98419e351433ac106a24e3ad435930bc"
 
 inherit setuptools3
-SRC_URI[sha256sum] = "2656e1a6edcdabf4275f9a3640db59fd5de107d88e8663c5d4e9a0fa62f77f94"
+SRC_URI[sha256sum] = "a18f47b506a429f6f4b9df81bb02beab9ca21d0a5fee38ed15aef65f0545519f"
 
 DEPENDS += "\
             ${PYTHON_PN} \
-- 
2.25.1

