Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com [195.245.230.1])
 by mx.groups.io with SMTP id smtpd.web10.7495.1615376824458837918
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Mar 2021 03:47:04 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 195.245.230.1, mailfrom: wangmy@fujitsu.com)
Return-Path: <wangmy@fujitsu.com>
Received: from [100.112.192.143] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-a.eu-west-1.aws.symcld.net id 10/DB-56778-6B1B8406; Wed, 10 Mar 2021 11:47:02 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprGIsWRWlGSWpSXmKPExsViZ8MxVXfbRo8
  Eg2vv5C3u/HzH7sDocW7jCsYAxijWzLyk/IoE1ozDL30K5nBUPOk8y9bAuJa9i5GLQ0hgBpNE
  08YVTBDOcUaJX4vPM3cxcnKwCWhK9G7ZwtjFyMEhIqAncfWfKEiYWUBd4tK6FhYQW1jAUeL+s
  kZWEJtFQFXi3+N/7CA2r4CLxIOFsxlBbAkBBYkpD98zQ8QFJU7OfMICMUdC4uCLF8wQNYoSsy
  83s0DYlRJ7Nj9kncDIOwtJyywkLQsYmVYxWiQVZaZnlOQmZuboGhoY6BoaGukaWprqGpoa6iV
  W6SbqpZbqlqcWl+gCueXFesWVuck5KXp5qSWbGIHBlVJwePoOxv43H/QOMUpyMCmJ8vYVeCQI
  8SXlp1RmJBZnxBeV5qQWH2KU4eBQkuANXAKUEyxKTU+tSMvMAQY6TFqCg0dJhLdvA1Cat7ggM
  bc4Mx0idYpRUUqcd916oIQASCKjNA+uDRZdlxhlpYR5GRkYGIR4ClKLcjNLUOVfMYpzMCoJ84
  oAY1WIJzOvBG76K6DFTECLFQzcQBaXJCKkpBqYFjwLP7gkrrXlXVTz2xk7GNR1YtjdN1Yz566
  v+DzjzXHbP6cWTLlSIbLmasXHmhrOvpPPHP55WBxzKfhQGdS/ZsdWl+Ox81Yc8Dknl/EwofHo
  wc8Gv47tud7YkdUpLVkzJy5dZeqxBh+tWRnz1R5ZvQ9Knbv/1hnXWZpuvFIPj0tut7w4+4/Wk
  j3mlzoZDl+w+nQ8dn+KhHUBt4lodL//6p9blMpfKzQUuXSfOsP3ji+217iIg6O1q/lI/h+xJ/
  M5DB5M7ojSlmlIuqXIsH9b84MTkwSUTOXYbkkdkNe+Ebn3q32Z1YEN01mW3zwoFHpw/RozhZ8
  WC844BJeofew2Yjzy5Wb1Db7ALj3lGpdtSizFGYmGWsxFxYkAF8zcmikDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-19.tower-267.messagelabs.com!1615376822!1688269!1
X-Originating-IP: [62.60.8.149]
X-SYMC-ESS-Client-Auth: outbound-route-from=fail
X-StarScan-Received: 
X-StarScan-Version: 9.60.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 20962 invoked from network); 10 Mar 2021 11:47:02 -0000
Received: from unknown (HELO mailhost2.uk.fujitsu.com) (62.60.8.149)
  by server-19.tower-267.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 10 Mar 2021 11:47:02 -0000
Received: from r01ukexcasm111.r01.fujitsu.local ([10.183.43.167])
	by mailhost2.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 12ABkuDJ023391
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Mar 2021 11:47:02 GMT
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM111.r01.fujitsu.local (10.183.43.167) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Wed, 10 Mar 2021 11:46:54 +0000
From: "Wang Mingyu" <wangmy@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [OE-core] [PATCH] createrepo-c: upgrade 0.17.0 -> 0.17.1
Date: Wed, 10 Mar 2021 19:46:02 +0800
Message-ID: <1615376771-3093-1-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 R01UKEXCASM111.r01.fujitsu.local (10.183.43.167)
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../{createrepo-c_0.17.0.bb => createrepo-c_0.17.1.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/createrepo-c/{createrepo-c_0.17.0.bb => createrepo-c_0.17.1.bb} (96%)

diff --git a/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.0.bb b/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.1.bb
similarity index 96%
rename from meta/recipes-devtools/createrepo-c/createrepo-c_0.17.0.bb
rename to meta/recipes-devtools/createrepo-c/createrepo-c_0.17.1.bb
index e0433806b2..f621bff8a1 100644
--- a/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.0.bb
+++ b/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.1.bb
@@ -8,7 +8,7 @@ SRC_URI = "git://github.com/rpm-software-management/createrepo_c \
            file://0001-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch \
            "
 
-SRCREV = "909a0636665ed96f97babc3b887f9badc88875c3"
+SRCREV = "956a318b427e2489ccac754d199a09d32690ddc3"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1

