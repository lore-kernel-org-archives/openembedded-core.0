Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CEB5C433EF
	for <webhook@archiver.kernel.org>; Tue,  1 Mar 2022 13:08:18 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.1])
 by mx.groups.io with SMTP id smtpd.web08.7718.1646140097243289146
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Mar 2022 05:08:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=jQxwUimB;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1646140095; i=@fujitsu.com;
	bh=DsNgwWHv35ab7m1204BkKKzB8Vrw8xxitx9s/o7PluM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=jQxwUimBuRGEoNZzuSvplt8aQ0zxU4bf1oznXRe2u8hAhQxMEzCe/DIEyyb2kEJAp
	 abTb5vqJBKJZ/s7HT2unUCSZDo5sZAScKriUiwq7zlSv7w8RWEZO5pbzSD84WRml0h
	 NBgjD2k7+qkQuem3jSIYYiZqHVrjOuffD8ET9TyZR/DONBas0c/EdcwmYzmbCkV5XS
	 0HKQGV4slzj8UY8+C17FQIVS649Dz/LR+zefgs3KsgHXDRGJXdTCMSfRVugH9zHfpv
	 LKWmLO1YG00YC+gFQAytgtCXZ9m7rKpgGUxIG+n0XiB7gwa87oHhiavFx5xtkEYySw
	 BsBK6WsCNkVEQ==
Received: from [100.115.33.107] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-a.eu-west-2.aws.ess.symcld.net id 19/DA-14616-FBA1E126;
 Tue, 01 Mar 2022 13:08:15 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrJIsWRWlGSWpSXmKPExsViZ8ORqLtfSi7
  JYM1HYYs7P9+xOzB6nNu4gjGAMYo1My8pvyKBNePL1S/sBau4Kjpe/mNuYOzm7GLk5BASeMwo
  cb/fF8I+zySx8ShrFyMXkH2cUWLdy1YWkASbgJrE9Fs3gBIcHCICehJX/4mChJkFVCRe/O5hB
  7GFBSwlXi06C1bOAhTveHAEzOYVcJJY8ucyM4gtIaAgMeXhezCbU8BZYtqcF2wQe50kLm2dxg
  RRLyhxcuYTFoj5EhIHX7yA6lWUmH25mQXCrpCYNauNCcJWk7h6bhPzBEbBWUjaZyFpX8DItIr
  ROqkoMz2jJDcxM0fX0MBA19DQVNfYVNfQwkQvsUo3US+1VLc8tbhE10gvsbxYL7W4WK+4Mjc5
  J0UvL7VkEyMwhFOKlXfsYGxb9VPvEKMkB5OSKK/aTdkkIb6k/JTKjMTijPii0pzU4kOMMhwcS
  hK8F8XkkoQEi1LTUyvSMnOA8QSTluDgURLhTRUHSvMWFyTmFmemQ6ROMSpKifNOB0kIgCQySv
  Pg2mAxfIlRVkqYl5GBgUGIpyC1KDezBFX+FaM4B6OSMK+lBNAUnsy8Erjpr4AWMwEt/hssBbK
  4JBEhJdXAJH+nYdWuBSzp9tvaI3a+s/jRfD6rPsjJq01FdkL2Hd9/7z859a31WiKXx5Tnvvfz
  H0Zze+4DjHv/tsfG+jDfzLK/eEa4a6l6ZJPd09Qj9qvECpSvasYYrrsTwjN7+4lrC+6KOkRUb
  ndeNnON1Ew5sbUFGlEbDly7a9jGYVhuMdc8fItLT/AFrdaz9efelOycv4zvxbons+tzV5Q014
  apdLSZzN2atE+hIV/zwv2ot11JzTVhisUmr89enyRkf5VzTxJD8h6jjGvtkZqiH+MX6qS49XR
  XaF3bKOout9FoQoGjxo6rJ/XefLm85lKHkhhvfNGM9OBrC17zlM/7ebV5y0450SU5wflmE00c
  +FqVWIozEg21mIuKEwE6AJdvXAMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-3.tower-548.messagelabs.com!1646140095!19600!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.8; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 12592 invoked from network); 1 Mar 2022 13:08:15 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-3.tower-548.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 1 Mar 2022 13:08:15 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id E6D5E10018F
	for <openembedded-core@lists.openembedded.org>;
 Tue,  1 Mar 2022 13:08:14 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id D9687100187
	for <openembedded-core@lists.openembedded.org>;
 Tue,  1 Mar 2022 13:08:14 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.28; Tue, 1 Mar 2022 13:08:12 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] wget: upgrade 1.21.2 -> 1.21.3
Date: Tue, 1 Mar 2022 21:07:55 +0800
Message-ID: <1646140075-39370-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1646140075-39370-1-git-send-email-wangmy@fujitsu.com>
References: <1646140075-39370-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Mar 2022 13:08:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162551

Changelog:
=========
** Fix computation of total bytes downloaded during FTP trasnfers (#61277)
** Add option to select TLS 1.3 on the command line
** Fix HSTS build issues on some 64-bit big-endian systems
** Hide password during status report in --no-verbose
** Remove a sprurious print statement that showed up even during --quiet
** Some more cleanups and bug-fixes

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-extended/wget/{wget_1.21.2.bb => wget_1.21.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/wget/{wget_1.21.2.bb => wget_1.21.3.bb} (60%)

diff --git a/meta/recipes-extended/wget/wget_1.21.2.bb b/meta/recipes-extended/wget/wget_1.21.3.bb
similarity index 60%
rename from meta/recipes-extended/wget/wget_1.21.2.bb
rename to meta/recipes-extended/wget/wget_1.21.3.bb
index 90f3eb104d..f176a1546c 100644
--- a/meta/recipes-extended/wget/wget_1.21.2.bb
+++ b/meta/recipes-extended/wget/wget_1.21.3.bb
@@ -2,6 +2,6 @@ SRC_URI = "${GNU_MIRROR}/wget/wget-${PV}.tar.gz \
            file://0002-improve-reproducibility.patch \
           "
 
-SRC_URI[sha256sum] = "e6d4c76be82c676dd7e8c61a29b2ac8510ae108a810b5d1d18fc9a1d2c9a2497"
+SRC_URI[sha256sum] = "5726bb8bc5ca0f6dc7110f6416e4bb7019e2d2ff5bf93d1ca2ffcc6656f220e5"
 
 require wget.inc
-- 
2.25.1


