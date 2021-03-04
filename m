Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web10.1914.1614817804735083653
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Mar 2021 16:30:05 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 85.158.142.112, mailfrom: wangmy@fujitsu.com)
Return-Path: <wangmy@fujitsu.com>
Received: from [100.113.6.236] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-b.eu-central-1.aws.symcld.net id 6B/11-38008-A0A20406; Thu, 04 Mar 2021 00:30:02 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprOIsWRWlGSWpSXmKPExsViZ8MxRZdDyyH
  BoHWjqcWdn+/YHRg9zm1cwRjAGMWamZeUX5HAmrG4XbzgB0fF9VPTWRoYmzm6GLk4hAQ2MUns
  6TvFDOEcZ5Q4M+8HexcjJwebgKZE75YtjF2MHBwiAnoSV/+JgoSZBdQlLq1rYQGxhQUcJC71b
  mQEsVkEVCQ+dv4Bi/MKuErM/HuTCcSWEFCQmPLwPTNEXFDi5MwnLBBzJCQOvnjBDFGjKDH7cj
  MLhF0lsaZjGtsERt5ZSFpmIWlZwMi0itEyqSgzPaMkNzEzR9fQwEDX0NBY11zXyNRIL7FKN0k
  vtVQ3OTWvpCgRKKuXWF6sV1yZm5yTopeXWrKJERheKYXsf3YwXn/9Qe8QoyQHk5Io74Ev9glC
  fEn5KZUZicUZ8UWlOanFhxhlODiUJHglNBwShASLUtNTK9Iyc4ChDpOW4OBREuFVUwNK8xYXJ
  OYWZ6ZDpE4xKkqJ8x4D6RMASWSU5sG1weLrEqOslDAvIwMDgxBPQWpRbmYJqvwrRnEORiVhXk
  51oCk8mXklcNNfAS1mAlo8y80OZHFJIkJKqoHpsMBeoRc+KsZGe/8nb/7zSHbmzcsLj2dEXCo
  WazZq/HFO8bhlzU4R49x/jH+2PP3963X31lf+QU7erIedZ3h9yL3y8f7PdxMsVVhEbt/mu+QS
  Fsx+kXl2uJfVJiHXDpktR34fSl8k88HDp6DTe94Gu2nMUZecZFZmmcxT3xa74cvz+KVJqhNaZ
  2u95pAv2itWH/1+SdFluVyXBLHWTiZ2hrR80Z/Z50KE3v8N2ThtQ6nSv9+hc94ca3l8dcLhpl
  +HNyW2SK2YyqC48cqXwNux+3YHzz+Wn/EoI29WUNrqifJl/CcaM+0Yux2kJ847wDpz9xreP/Y
  tzgvXxMi/PWj66s3T0ImP9x4Qig477LLiuhJLcUaioRZzUXEiALpfaxUqAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-22.tower-238.messagelabs.com!1614817800!1847229!1
X-Originating-IP: [62.60.8.148]
X-SYMC-ESS-Client-Auth: outbound-route-from=fail
X-StarScan-Received: 
X-StarScan-Version: 9.60.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 30761 invoked from network); 4 Mar 2021 00:30:00 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
  by server-22.tower-238.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 4 Mar 2021 00:30:00 -0000
Received: from r01ukexcasm214.r01.fujitsu.local (ex2k13_214.fs.fujitsu.com [10.182.185.116])
	by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 1240U00Y027722
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Thu, 4 Mar 2021 00:30:00 GMT
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 r01ukexcasm214.r01.fujitsu.local (10.182.185.116) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 4 Mar 2021 00:29:58 +0000
From: "Wang Mingyu" <wangmy@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [OE-core] [PATCH] stress-ng: upgrade 0.12.03 -> 0.12.04
Date: Thu, 4 Mar 2021 08:29:53 +0800
Message-ID: <1614817793-40468-1-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 r01ukexcasm214.r01.fujitsu.local (10.182.185.116)
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../stress-ng/{stress-ng_0.12.03.bb => stress-ng_0.12.04.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/stress-ng/{stress-ng_0.12.03.bb => stress-ng_0.12.04.bb} (90%)

diff --git a/meta/recipes-extended/stress-ng/stress-ng_0.12.03.bb b/meta/recipes-extended/stress-ng/stress-ng_0.12.04.bb
similarity index 90%
rename from meta/recipes-extended/stress-ng/stress-ng_0.12.03.bb
rename to meta/recipes-extended/stress-ng/stress-ng_0.12.04.bb
index 73539c9268..28887204d9 100644
--- a/meta/recipes-extended/stress-ng/stress-ng_0.12.03.bb
+++ b/meta/recipes-extended/stress-ng/stress-ng_0.12.04.bb
@@ -9,7 +9,7 @@ SRC_URI = "https://kernel.ubuntu.com/~cking/tarballs/${BPN}/${BP}.tar.xz \
            file://0001-Do-not-preserve-ownership-when-installing-example-jo.patch \
            file://no_daddr_t.patch \
            "
-SRC_URI[sha256sum] = "f27ff439b76a17641291d4234c73655cddcb0a5a588441d6ade290b06ca4b805"
+SRC_URI[sha256sum] = "b4e34bda8db4ed37e33b7a861bc06ad77cbbd234d63236da2cb58f02e3f3218e"
 
 DEPENDS = "coreutils-native"
 
-- 
2.25.1

