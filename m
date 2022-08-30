Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12743C0502E
	for <webhook@archiver.kernel.org>; Tue, 30 Aug 2022 04:25:22 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.3])
 by mx.groups.io with SMTP id smtpd.web11.7846.1661833511616498241
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Aug 2022 21:25:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=JmZT94lj;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.3,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1661833509; i=@fujitsu.com;
	bh=Wayc6SZkJSjFrYUxhSugEjjV/2tdr68pdZ1m6+7Gyhk=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=JmZT94lj1Ub222vra6FlbIrS0bV+0pgxB6Y+D7P+2DZJPe52ePMrxCghKL5p5+OlL
	 cc6k7JlKfZECtBW+ZG+SSvi/GWqv/IIB7aDWC/1Kdh0LkIPqnZw/LAk3niHXUcD68H
	 CU9ekLmBD9SiAWcYR+RNG2g7rYQBygSLcNJo0RatucaN9JzeQHAsYFP5s1Tj9uHgL8
	 NuxUe+6I+1y5fEkhjeYbOT+9yYj0unL8iaQttDuV8lJ7+cHUN5VQmyAJhZKwdM+5lV
	 NTQ8TcOD+YrJEOFANhiD0KFS/Sx0mhmifSRYfElImk7CfOtNd2yVxuhDAgpaiByPq5
	 L+6gi2eoIdt0A==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrAIsWRWlGSWpSXmKPExsViZ8MxSVd1Im+
  yQW+XgsWdn+/YHRg9zm1cwRjAGMWamZeUX5HAmnH75SrGgnauiltzHzA2MM7h7GLk4hASeMwo
  MWPvcvYuRk4g5zqTxPHN6RCJvYwSp2evZQFJsAmoSUy/dYO1i5GDQ0RAT+LqP1GQMLOAisSL3
  z3sIGFhAXeJOYskQUwWAVWJ+RuqQCp4BZwkzrR9AxsiIaAgMeXhe2aIuKDEyZlPWCCmSEgcfP
  GCGaJGUWL25Wao+kqJPbP6mSBsNYmr5zYxT2Dkn4WkfRaS9gWMTKsYrZOKMtMzSnITM3N0DQ0
  MdA0NTXWNLXWNDI31Eqt0E/VSS3XLU4tLdI30EsuL9VKLi/WKK3OTc1L08lJLNjECAzKlWP3q
  DsbNq37qHWKU5GBSEuVd2MqbLMSXlJ9SmZFYnBFfVJqTWnyIUYaDQ0mC93I3UE6wKDU9tSItM
  wcYHTBpCQ4eJRFe7y6gNG9xQWJucWY6ROoUo6KUOO+6PqCEAEgiozQPrg0WkZcYZaWEeRkZGB
  iEeApSi3IzS1DlXzGKczAqCfNu6AGawpOZVwI3/RXQYiagxQ+XcIMsLklESEk1MCW/mHXSc5W
  Dnv73UwvsEzbfdJxtpO0a/SxYIWXZr8lOmq/DVweu+X2boXOGZ4nExV6mstKXDAz3t634Oy94
  mvLlxtfrGxYwFOasC9v+qaTZ8ADrJ/aNfLulogU2mQt80fqrE1k4a1O5IKv05hu64nPU31wxl
  Y9PfbbU5avsj3eW939mbWfT7/7svmTnBjvH8GnV5hccXERfyP740cbOsCitcwbbvoQpeeePnO
  a99cmuWP/7jZuL5XINzlr9Tdjne1vq+e0zLJ3aR15d17xgxLIl0+WgboyUrwHXtEe39Q5/uV2
  ++vWd8++3Lrsq+/5itbwv07y/1rMuiX+5ycwmOUHsw9R2NpOMsimpe/w4NtQrsRRnJBpqMRcV
  JwIAr6BrmkMDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-19.tower-548.messagelabs.com!1661833509!28845!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 22328 invoked from network); 30 Aug 2022 04:25:09 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-19.tower-548.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 30 Aug 2022 04:25:09 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 3FBA11000CC
	for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Aug 2022 05:25:09 +0100 (BST)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223
 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 33FB7100078
	for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Aug 2022 05:25:09 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 30 Aug 2022 05:25:07 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-setuptools: upgrade 65.0.2 -> 65.3.0
Date: Tue, 30 Aug 2022 12:24:50 +0800
Message-ID: <1661833494-12657-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Aug 2022 04:25:22 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170057

Changelog:
===========
 attribute
 Dependency management section of the Quickstart guid

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ython3-setuptools_65.0.2.bb => python3-setuptools_65.3.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-setuptools_65.0.2.bb => python3-setuptools_65.3.0.bb} (95%)

diff --git a/meta/recipes-devtools/python/python3-setuptools_65.0.2.bb b/meta/recipes-devtools/python/python3-setuptools_65.3.0.bb
similarity index 95%
rename from meta/recipes-devtools/python/python3-setuptools_65.0.2.bb
rename to meta/recipes-devtools/python/python3-setuptools_65.3.0.bb
index 1a639ea333..3471d2805d 100644
--- a/meta/recipes-devtools/python/python3-setuptools_65.0.2.bb
+++ b/meta/recipes-devtools/python/python3-setuptools_65.3.0.bb
@@ -11,7 +11,7 @@ SRC_URI:append:class-native = " file://0001-conditionally-do-not-fetch-code-by-e
 SRC_URI += "file://0001-change-shebang-to-python3.patch \
             file://0001-_distutils-sysconfig.py-make-it-possible-to-substite.patch"
 
-SRC_URI[sha256sum] = "101bf15ca723beef42c8db91a761f3748d4d697e17fae904db60c0b619d8d094"
+SRC_URI[sha256sum] = "7732871f4f7fa58fb6bdcaeadb0161b2bd046c85905dbaa066bdcbcc81953b57"
 
 DEPENDS += "${PYTHON_PN}"
 
-- 
2.25.1


