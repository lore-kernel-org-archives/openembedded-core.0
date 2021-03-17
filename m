Received: from mail3.bemta25.messagelabs.com (mail3.bemta25.messagelabs.com [195.245.230.84])
 by mx.groups.io with SMTP id smtpd.web08.3754.1615970956760887132
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Mar 2021 01:49:17 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 195.245.230.84, mailfrom: zhengrq.fnst@fujitsu.com)
Return-Path: <zhengrq.fnst@fujitsu.com>
Received: from [100.112.196.73] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-4.bemta.az-b.eu-west-1.aws.symcld.net id 72/26-64503-A82C1506; Wed, 17 Mar 2021 08:49:14 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmpnkeJIrShJLcpLzFFi42Kxs+EI1e06FJh
  gsGqjjMWdn+/YHRg9zm1cwRjAGMWamZeUX5HAmvH/1y22gmccFefO2DUwtnN0MXJxCAnMYJJY
  8mU6K4Szm1Fi/+SPTF2MnBxsAgYS+89eYO9i5OAQEdCTuPpPFMQUFrCU2P4rFaSCRUBVYuHzC
  cwgNq+At0Rj/zkWEFtCQEFiysP3UHFBiZMzn4DFmQUkJA6+eMEMMkZCQFFi9nR5iPJKiblvFj
  JNYOSZhaRjFpKOBYxMqxjNk4oy0zNKchMzc3QNDQx0DQ2NdA0tLXSNDfQSq3ST9FJLdctTi0t
  0DfUSy4v1iitzk3NS9PJSSzYxAsMnpeCY3A7G3jcf9A4xSnIwKYnymrYEJgjxJeWnVGYkFmfE
  F5XmpBYfYpTh4FCS4J15ECgnWJSanlqRlpkDDGWYtAQHj5II7xeQNG9xQWJucWY6ROoUo6KUO
  C8bSEIAJJFRmgfXBoufS4yyUsK8jAwMDEI8BalFuZklqPKvGMU5GJWEecWB0SjEk5lXAjf9Fd
  BiJqDFhtJ+IItLEhFSUg1MqW388zz07U9lRmq2yLrwr+U5ftansOwXS85lM707d9m3dl4/9+V
  L+ucdKyWZeOYct257Y1rR1S1mda38lEzYI7NCnr+/kpnsEpdPDAxMnHWk0zGk/P+fmqpErdmm
  jueF+V4qv11uZHg6wNDu1uyV3LdL381eJGX81LbWTHnW7TUrvTp6Lv180PnhX9Ru3YJz2vcZp
  4dn7TN+6KV9w0bjbcWzXdvmzs47dvBv5KHLcvxXKna5OoeYe+YKroq3cu/yYNviddn7yo4D7N
  bvvbeKmvTZZ9WHqU4wrVG2q20xKZ38PHkxy/wbSZ+MnDM1re/wuZ16kXjuZQXnSwPdj9su6Mr
  Mf2joUPpO323q1plKLMUZiYZazEXFiQDlmX5vGgMAAA==
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-22.tower-285.messagelabs.com!1615970954!2199323!1
X-Originating-IP: [62.60.8.85]
X-SYMC-ESS-Client-Auth: outbound-route-from=fail
X-StarScan-Received: 
X-StarScan-Version: 9.60.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 15730 invoked from network); 17 Mar 2021 08:49:14 -0000
Received: from unknown (HELO mailhost4.uk.fujitsu.com) (62.60.8.85)
  by server-22.tower-285.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 17 Mar 2021 08:49:14 -0000
Received: from r01ukexcasm111.r01.fujitsu.local ([10.183.43.167])
	by mailhost4.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 12H8nExY019929
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Wed, 17 Mar 2021 08:49:14 GMT
Received: from localhost.localdomain (10.167.225.35) by
 R01UKEXCASM111.r01.fujitsu.local (10.183.43.167) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Wed, 17 Mar 2021 08:49:12 +0000
From: "zhengruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core] [PATCH] sudo: upgrade 1.9.6 -> 1.9.6p1
Date: Thu, 18 Mar 2021 01:49:02 +0800
Message-ID: <1616003342-27718-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 R01UKEXCASM111.r01.fujitsu.local (10.183.43.167)
Content-Type: text/plain

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 meta/recipes-extended/sudo/{sudo_1.9.6.bb => sudo_1.9.6p1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/sudo/{sudo_1.9.6.bb => sudo_1.9.6p1.bb} (96%)

diff --git a/meta/recipes-extended/sudo/sudo_1.9.6.bb b/meta/recipes-extended/sudo/sudo_1.9.6p1.bb
similarity index 96%
rename from meta/recipes-extended/sudo/sudo_1.9.6.bb
rename to meta/recipes-extended/sudo/sudo_1.9.6p1.bb
index 2106e80ba1..b333459136 100644
--- a/meta/recipes-extended/sudo/sudo_1.9.6.bb
+++ b/meta/recipes-extended/sudo/sudo_1.9.6p1.bb
@@ -7,7 +7,7 @@ SRC_URI = "https://www.sudo.ws/dist/sudo-${PV}.tar.gz \
 
 PAM_SRC_URI = "file://sudo.pam"
 
-SRC_URI[sha256sum] = "62c9580492cd2e7dd6273b5cfe197560f2c508a83649d1ce4f61c8ee02ff3a55"
+SRC_URI[sha256sum] = "a9e9cdc058fafeb9cd3ebfb864c81755e524d98aa022152763f25bce8ca3ca90"
 
 DEPENDS += " virtual/crypt ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 RDEPENDS_${PN} += " ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam-plugin-limits pam-plugin-keyinit', '', d)}"
-- 
2.25.1

