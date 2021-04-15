Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com [195.245.230.5])
 by mx.groups.io with SMTP id smtpd.web11.4222.1618475560065136625
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Apr 2021 01:32:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=e2K79kw9;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.5, mailfrom: wangmy@fujitsu.com)
Return-Path: <wangmy@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1618475558; i=@fujitsu.com;
	bh=mO4Nb+RqdQgdmImUeJyVhoth+NxlBhuPlZxhEEeJql4=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=e2K79kw9zHjOS9IYV36RdemzV5Pqlhc4uU3gQ3kPVU2sUiSbFu6dJVtsvJBcLJI58
	 AfGZJFcXdj5ZLNuZ2/wBStvepalO0f71SEwhaPcuxg51x7t7DBnF5jfQ29lGH+bdkA
	 EdGMhTcViMM2b7ryMz/C7VRrRncn/0Z9imwXbutXNhHrvwoz1yTussZjnPMOf8ysKa
	 h+YTzVJ5D5TpJNcnUr/DYvHrEM8+m5GRqwJIjB0v/xkYoCt+e/lZ34bUpSJ/Lntc3y
	 I24H00yEvEzMTone0zohMUs6qXPZ3MLGf3TvNAHnfCzDDzE5yc9o/6amqZXxcnw4mM
	 YemPbEUWygGyQ==
Received: from [100.112.193.211] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-5.bemta.az-a.eu-west-1.aws.symcld.net id 47/8B-01834-62AF7706; Thu, 15 Apr 2021 08:32:38 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprCIsWRWlGSWpSXmKPExsViZ8MxVVf1V3m
  Cwdof2hZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8bGt2IFd4UquqY7NjBeF+hi5OIQEpjFJLGr
  9ScjhHOcUeLUw5WsXYycHGwCahLTb90Asjk4RAT0JK7+EwUJMwuoSLz43cMOYgsLmEv83zALr
  JxFQFXi1G6IOK+Ak8SVg5PYQGwJAQWJKQ/fM0PEBSVOznzCAjFHQuLgixfMEDWKErMvN7NA2J
  USnesXME5g5J2FpGUWkpYFjEyrGM2TijLTM0pyEzNzdA0NDHQNDY10DS2NdE1M9BKrdBP1Ukt
  1y1OLS3QN9RLLi/WKK3OTc1L08lJLNjECAyul4IDODsafrz7oHWKU5GBSEuU9tKIsQYgvKT+l
  MiOxOCO+qDQntfgQowwHh5IEb8uP8gQhwaLU9NSKtMwcYJDDpCU4eJREeJf9BErzFhck5hZnp
  kOkTjEqSonzngLpEwBJZJTmwbXBIusSo6yUMC8jAwODEE9BalFuZgmq/CtGcQ5GJWFeNZDxPJ
  l5JXDTXwEtZgJaXLGqFGRxSSJCSqqBKW/ZgfuzYw6ICk0V7L07t3Kts0K+2GGmbfOq4jZWWcS
  G3G3rP+J523PdjyBFFn2evxUGb/8lTXO2qVO6I8f77i6rF/+bjLBdZgZSBg/veYo/y1Ffs/v9
  e7H98lsnv2/6//H6u+nSbCZcxiuW3fN07CqwtWJ4alu6cmHw3JO+j/K/zY/K23bn8N/LE+41d
  ymfXb7q+LrvhsffHt/3XnW6vGW5w3np7v/t9rw1F3e/nht39M/T6V25OQ6KVrsMl219JeP5cO
  lK8Rla/FxKr9/JBt+5k3HlrOXRwP+qcn1F27Ona1lvuZu93W+O56OewhamGV/+nNIuWLW8vG2
  +U5nr6gfeq9V62TYtvWO00TTpf48SS3FGoqEWc1FxIgBSI8nNJwMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-8.tower-271.messagelabs.com!1618475557!1425511!1
X-Originating-IP: [62.60.8.149]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.60.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 12824 invoked from network); 15 Apr 2021 08:32:37 -0000
Received: from unknown (HELO mailhost2.uk.fujitsu.com) (62.60.8.149)
  by server-8.tower-271.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 15 Apr 2021 08:32:37 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost2.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 13F8WTZF002171
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Thu, 15 Apr 2021 09:32:37 +0100
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 15 Apr 2021 09:32:27 +0100
From: "wangmy" <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH v2] icu: upgrade 68.2 -> 69.1
Date: Thu, 15 Apr 2021 16:32:16 +0800
Message-ID: <1618475536-24802-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

refresh 0001-icu-Added-armeb-support.patch

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../icu/icu/0001-icu-Added-armeb-support.patch              | 6 +++---
 meta/recipes-support/icu/{icu_68.2.bb => icu_69.1.bb}       | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)
 rename meta/recipes-support/icu/{icu_68.2.bb => icu_69.1.bb} (96%)

diff --git a/meta/recipes-support/icu/icu/0001-icu-Added-armeb-support.patch b/meta/recipes-support/icu/icu/0001-icu-Added-armeb-support.patch
index 145efc0e01..c5dc0611c2 100644
--- a/meta/recipes-support/icu/icu/0001-icu-Added-armeb-support.patch
+++ b/meta/recipes-support/icu/icu/0001-icu-Added-armeb-support.patch
@@ -13,7 +13,7 @@ Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/i18n/double-conversion-utils.h b/i18n/double-conversion-utils.h
-index 8c6a0e1..cf89907 100644
+index c937463..feaad0f 100644
 --- a/i18n/double-conversion-utils.h
 +++ b/i18n/double-conversion-utils.h
 @@ -115,7 +115,7 @@ int main(int argc, char** argv) {
@@ -24,7 +24,7 @@ index 8c6a0e1..cf89907 100644
 +    defined(__arm__) || defined(__avr32__) || defined(_M_ARM) || defined(_M_ARM64) || \
      defined(__hppa__) || defined(__ia64__) || \
      defined(__mips__) || \
-     defined(__nios2__) || \
+     defined(__nios2__) || defined(__ghs) || \
 -- 
-2.7.4
+2.25.1
 
diff --git a/meta/recipes-support/icu/icu_68.2.bb b/meta/recipes-support/icu/icu_69.1.bb
similarity index 96%
rename from meta/recipes-support/icu/icu_68.2.bb
rename to meta/recipes-support/icu/icu_69.1.bb
index 1ca87feee4..bfeea8d2f0 100644
--- a/meta/recipes-support/icu/icu_68.2.bb
+++ b/meta/recipes-support/icu/icu_69.1.bb
@@ -112,8 +112,8 @@ SRC_URI = "${BASE_SRC_URI};name=code \
 SRC_URI_append_class-target = "\
            file://0001-Disable-LDFLAGSICUDT-for-Linux.patch \
           "
-SRC_URI[code.sha256sum] = "c79193dee3907a2199b8296a93b52c5cb74332c26f3d167269487680d479d625"
-SRC_URI[data.sha256sum] = "2989b466fa010edc41297e12fdd5ae47c2610ad68b63af1a0bd2a1acfaf497f3"
+SRC_URI[code.sha256sum] = "4cba7b7acd1d3c42c44bb0c14be6637098c7faf2b330ce876bc5f3b915d09745"
+SRC_URI[data.sha256sum] = "4fc2d8cfc3343673123586fca3967404abd4e346fba5515829204533b3bae4bf"
 
 UPSTREAM_CHECK_REGEX = "icu4c-(?P<pver>\d+(_\d+)+)-src"
 UPSTREAM_CHECK_URI = "https://github.com/unicode-org/icu/releases"
-- 
2.25.1

