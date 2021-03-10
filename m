Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.4])
 by mx.groups.io with SMTP id smtpd.web08.7583.1615376974188377897
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Mar 2021 03:49:34 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 85.158.142.4, mailfrom: wangmy@fujitsu.com)
Return-Path: <wangmy@fujitsu.com>
Received: from [100.113.2.232] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-4.bemta.az-a.eu-central-1.aws.symcld.net id D8/9A-03420-C42B8406; Wed, 10 Mar 2021 11:49:32 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrGIsWRWlGSWpSXmKPExsViZ8MRquuzySP
  BYME9Zos7P9+xOzB6nNu4gjGAMYo1My8pvyKBNWNf13OWgqXsFS0vH7A3MG5l62Lk4hASmMEk
  cXjpN3YI5zijxKxnL5i7GDk52AQ0JXq3bGHsYuTgEBHQk7j6TxQkzCygLnFpXQsLiC0sYC3Re
  f0ZG4jNIqAqsffBIyYQm1fARWJX6x6wMRICChJTHr5nhogLSpyc+YQFYo6ExMEXL6BqFCVmX2
  5mgbArJfZsfsg6gZF3FpKWWUhaFjAyrWK0TCrKTM8oyU3MzNE1NDDQNTQ01jXUNTIw10us0k3
  USy3VTU7NKylKBMrqJZYX6xVX5ibnpOjlpZZsYgQGWEoh4/kdjFPffNA7xCjJwaQkyttX4JEg
  xJeUn1KZkVicEV9UmpNafIhRhoNDSYI3cAlQTrAoNT21Ii0zBxjsMGkJDh4lEd6+DUBp3uKCx
  NzizHSI1ClGe443a5csYuZou3cXSM5ccHA1M8f99kOrmYVY8vLzUqXEeZ02ArUJgLRllObBDY
  VF5yVGWSlhXkYGBgYhnoLUotzMElT5V4ziHIxKwrwiIFN4MvNK4Ha/AjqLCegsBQM3kLNKEhF
  SUg1MlnryDfUf185S3eHq/P1GhESIkOTxie3nZNZJCm2eqz/NPeym2cq0WKfj0jLC5+0jX0jY
  y855sor/+J5Avd5kjej0TSc3cvB3r5J0T7V5OPeTp+vvB0/VH/i8EtKdf1hyqbGL8MWmpTX2D
  8w2v3eJnxxW87YuLDNXW/7js5aqQIaphezlcx7x+m2Xc5qwyOSkibCXWNSXggWB6g/5Q/8cWG
  O75qvgquXXVfdviOgXdb+yLHfqJZYzLQn3hU//39qU8eGlibW6XEvZATumaz+C/j8Ker27zyS
  pbG/RIjflb0HiDcrq7U3b5nEdeCW91XLn/Aj2q3fEVOMVrieYKJceW9J4Q4913qcshmO/a9Yp
  sRRnJBpqMRcVJwIALtZEmkkDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-15.tower-228.messagelabs.com!1615376971!379959!1
X-Originating-IP: [62.60.8.85]
X-SYMC-ESS-Client-Auth: outbound-route-from=fail
X-StarScan-Received: 
X-StarScan-Version: 9.60.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 19924 invoked from network); 10 Mar 2021 11:49:31 -0000
Received: from unknown (HELO mailhost4.uk.fujitsu.com) (62.60.8.85)
  by server-15.tower-228.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 10 Mar 2021 11:49:31 -0000
Received: from r01ukexcasm111.r01.fujitsu.local ([10.183.43.167])
	by mailhost4.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 12ABnVZL027427
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Mar 2021 11:49:31 GMT
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM111.r01.fujitsu.local (10.183.43.167) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Wed, 10 Mar 2021 11:49:29 +0000
From: "Wang Mingyu" <wangmy@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [OE-core] [PATCH] sysklogd: upgrade 2.2.1 -> 2.2.2
Date: Wed, 10 Mar 2021 19:49:21 +0800
Message-ID: <1615376961-3303-1-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 R01UKEXCASM111.r01.fujitsu.local (10.183.43.167)
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../sysklogd/{sysklogd_2.2.1.bb => sysklogd_2.2.2.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/sysklogd/{sysklogd_2.2.1.bb => sysklogd_2.2.2.bb} (96%)

diff --git a/meta/recipes-extended/sysklogd/sysklogd_2.2.1.bb b/meta/recipes-extended/sysklogd/sysklogd_2.2.2.bb
similarity index 96%
rename from meta/recipes-extended/sysklogd/sysklogd_2.2.1.bb
rename to meta/recipes-extended/sysklogd/sysklogd_2.2.2.bb
index aa3f126fbc..5dfeca5326 100644
--- a/meta/recipes-extended/sysklogd/sysklogd_2.2.1.bb
+++ b/meta/recipes-extended/sysklogd/sysklogd_2.2.2.bb
@@ -14,7 +14,7 @@ SRC_URI = "git://github.com/troglobit/sysklogd.git;nobranch=1 \
            file://sysklogd \
            "
 
-SRCREV = "b115c7ec4e6d9f3587ac8d212bfc454bfbfe7023"
+SRCREV = "f507ed8ff3f1e9d71bb6f85acbf5d14b2fa4e5f7"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1

