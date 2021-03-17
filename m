Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com [195.245.230.5])
 by mx.groups.io with SMTP id smtpd.web11.3760.1615971083417231816
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Mar 2021 01:51:23 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 195.245.230.5, mailfrom: zhengrq.fnst@fujitsu.com)
Return-Path: <zhengrq.fnst@fujitsu.com>
Received: from [100.112.192.143] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-5.bemta.az-a.eu-west-1.aws.symcld.net id 74/3F-42970-903C1506; Wed, 17 Mar 2021 08:51:21 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupkkeJIrShJLcpLzFFi42Kxs+GYost5ODD
  B4P8TbYs7P9+xOzB6nNu4gjGAMYo1My8pvyKBNePIh6XMBf85Kq7PXszUwNjF0cXIxSEkMINJ
  YurCCSwQzm5Gidk7D7J2MXJysAkYSOw/e4G9i5GDQ0RAT+LqP1EQU1jAQeLXg2SQChYBVYm3i
  3uZQGxeAW+J7/ceMoPYEgIKElMevmeGiAtKnJz5hAXEZhaQkDj44gUzyBgJAUWJ2dPlIcorJe
  a+Wcg0gZFnFpKOWUg6FjAyrWK0SCrKTM8oyU3MzNE1NDDQNTQ00jW0NAFiI73EKt1EvdRS3fL
  U4hJdQ73E8mK94src5JwUvbzUkk2MwBBKKTh0YAfjsjcf9A4xSnIwKYnymrYEJgjxJeWnVGYk
  FmfEF5XmpBYfYpTh4FCS4J15ECgnWJSanlqRlpkDDGeYtAQHj5II7xeQNG9xQWJucWY6ROoUo
  6KUOG/dIaCEAEgiozQPrg0WQ5cYZaWEeRkZGBiEeApSi3IzS1DlXzGKczAqCfOKg0zhycwrgZ
  v+CmgxE9BiQ2k/kMUliQgpqQYmLZ6pAc8mXt0730fD7F31c2eH6B4r2WzbixtCed86LK6b2vM
  kc+pqcRkrmYr5TFzn+Cdyat18oJPnkH/+Y9Ydt6aF32ycT7flGF6MkXJeNnF3eKnEtOyr67si
  D8TXlUwUFn6pZCP2xlfJ7SKr2p7Otkb1ud+nc4t7Zf7iejW7JCc2ikN47f95x7mDGuctdDS1v
  u3T9iHrfsq/JtEJxbkbJSTrntuqN+er2W6YHv+msfA3X43TeoPYtW/2/5il2OOWJHPQTT9AxU
  zgosQlT63sy2ufR4Vde7Bm0qYM1hI9p5Bfm/uuiYe0Zv55pDffU+vs8xMb9x082e4TxmHzkDP
  kyJ8Hn4OXmdpzbfwl9l6JpTgj0VCLuag4EQDSKkBUHAMAAA==
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-26.tower-267.messagelabs.com!1615971081!2246667!1
X-Originating-IP: [62.60.8.148]
X-SYMC-ESS-Client-Auth: outbound-route-from=fail
X-StarScan-Received: 
X-StarScan-Version: 9.60.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 6070 invoked from network); 17 Mar 2021 08:51:21 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
  by server-26.tower-267.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 17 Mar 2021 08:51:21 -0000
Received: from r01ukexcasm111.r01.fujitsu.local ([10.183.43.167])
	by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 12H8pLAZ030500
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Wed, 17 Mar 2021 08:51:21 GMT
Received: from localhost.localdomain (10.167.225.35) by
 R01UKEXCASM111.r01.fujitsu.local (10.183.43.167) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Wed, 17 Mar 2021 08:51:19 +0000
From: "zhengruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core] [PATCH] stress-ng: upgrade 0.12.04 -> 0.12.05
Date: Thu, 18 Mar 2021 01:50:24 +0800
Message-ID: <1616003424-27799-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 R01UKEXCASM111.r01.fujitsu.local (10.183.43.167)
Content-Type: text/plain

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 .../stress-ng/{stress-ng_0.12.04.bb => stress-ng_0.12.05.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/stress-ng/{stress-ng_0.12.04.bb => stress-ng_0.12.05.bb} (90%)

diff --git a/meta/recipes-extended/stress-ng/stress-ng_0.12.04.bb b/meta/recipes-extended/stress-ng/stress-ng_0.12.05.bb
similarity index 90%
rename from meta/recipes-extended/stress-ng/stress-ng_0.12.04.bb
rename to meta/recipes-extended/stress-ng/stress-ng_0.12.05.bb
index 28887204d9..eb6bdb4a81 100644
--- a/meta/recipes-extended/stress-ng/stress-ng_0.12.04.bb
+++ b/meta/recipes-extended/stress-ng/stress-ng_0.12.05.bb
@@ -9,7 +9,7 @@ SRC_URI = "https://kernel.ubuntu.com/~cking/tarballs/${BPN}/${BP}.tar.xz \
            file://0001-Do-not-preserve-ownership-when-installing-example-jo.patch \
            file://no_daddr_t.patch \
            "
-SRC_URI[sha256sum] = "b4e34bda8db4ed37e33b7a861bc06ad77cbbd234d63236da2cb58f02e3f3218e"
+SRC_URI[sha256sum] = "af7779aee38e6d94726ed7d5cf36384a64d50c86e42fff89c141d8609913f425"
 
 DEPENDS = "coreutils-native"
 
-- 
2.25.1

