Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DDFEC433F5
	for <webhook@archiver.kernel.org>; Tue, 22 Mar 2022 10:38:51 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.2])
 by mx.groups.io with SMTP id smtpd.web08.8284.1647945530064065376
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Mar 2022 03:38:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=ATPxlaC6;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.2,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1647945528; i=@fujitsu.com;
	bh=025E6E0tfhHumG6tTcU0+GuNl43luCMbT12po0ytARA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=ATPxlaC6uUSgoh1cb6FUZJNXOt8LRNpTeLOti6CzZv3WZyJIdHiRRK7VViJRtL/VK
	 qzpvzDw1lUOVpsQLjaMocBYax+uF/7l/4w4Im3F4tN8u5TJd8LXcWew2vQv5z4qqse
	 Ql6JsTu2jzb3LvkdK/MFsdltsjm7TCTKz7hpSIBatVBrFy0WuthgCx3NVvKYXCdVG6
	 Lftqky3EMjuYjw5XAafsVhVlQM0VEdW2M5MWf+kaI/n9IXPz42YnlDqWoZKX9u+CKG
	 1VAF0nDPBEPljhuGTOfcSvzE0YFDfzrK8YU+698jdCZPH20TdtrUINqRBegh6DlUAm
	 HI+BzIYREq9tA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrCIsWRWlGSWpSXmKPExsViZ8ORqGux3DL
  J4Ek3q8Wdn+/YHRg9zm1cwRjAGMWamZeUX5HAmjF18kHmgtfsFfM3BjcwtrJ3MXJxCAk8ZpQ4
  tO02G4Rznkni2OQnTBDOHkaJK69OsHYxcnKwCahJTL91A8jm4BAR0JO4+k8UJMwsoCLx4ncPO
  4gtLGAj8fn8dUYQm0VAVaK3vQfM5hVwlJi5oYEJxJYQUJCY8vA9M8gYTgEniSmn8kHCQkAl/T
  MusEGUC0qcnPmEBWK8hMTBFy+YIVoVJWZfbmaBsCskZs1qgxqpJnH13CbmCYyCs5C0z0LSvoC
  RaRWjVVJRZnpGSW5iZo6uoYGBrqGhqa6xsa65iV5ilW6iXmqpbnlqcYmukV5iebFeanGxXnFl
  bnJOil5easkmRmAApxQreu1gfLXip94hRkkOJiVR3jetlklCfEn5KZUZicUZ8UWlOanFhxhlO
  DiUJHiPLgbKCRalpqdWpGXmAKMJJi3BwaMkwpvRDZTmLS5IzC3OTIdInWLU5fhw6MpeZiGWvP
  y8VClx3qdLgYoEQIoySvPgRsAi+xKjrJQwLyMDA4MQT0FqUW5mCar8K0ZxDkYlYV6RZUBTeDL
  zSuA2vQI6ggnoCH1WM5AjShIRUlINTD3vr1+62WFgZi14uU56r8VyF6ac/18SNm9VeiT2OrL8
  7Y3ewvfz2zRKr022fTjnTdQF4RncPfHfeUU6Jx1ND9G9fPNqaFTaMkn5g5prPhzSs/RovPi3x
  WQX74LoLykHjx3KyHf9I77JOO3C0XpZycUH8tLeMh5tNfhztb/TySpuZcTNnVeKROfvDN+x2P
  /8iqKjHROLYh0Un69acN1xg++8OcKBifu2nSxslalwfVuW3f3k1T3d4tfPz61Ue/+Jf921NLH
  7nm9e/LVJNrim/Uvrr7FYxe/f4QXblbmPfcmJv7ywdblKV2HUoaeXu2YmRzbULNV/XPLlgdXe
  pX9YvY8xrZjt0PdwtoNp0xOu6deUWIozEg21mIuKEwECFUUqZwMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-2.tower-548.messagelabs.com!1647945527!16346!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.85.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 13226 invoked from network); 22 Mar 2022 10:38:48 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-2.tower-548.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 22 Mar 2022 10:38:48 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 9808D100185
	for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Mar 2022 10:38:47 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 77106100186
	for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Mar 2022 10:38:47 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 22 Mar 2022 10:38:25 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] libsolv: upgrade 0.7.21 -> 0.7.22
Date: Tue, 22 Mar 2022 18:38:09 +0800
Message-ID: <1647945489-5242-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1647945489-5242-1-git-send-email-wangmy@fujitsu.com>
References: <1647945489-5242-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Mar 2022 10:38:51 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163541

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libsolv/{libsolv_0.7.21.bb => libsolv_0.7.22.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/libsolv/{libsolv_0.7.21.bb => libsolv_0.7.22.bb} (95%)

diff --git a/meta/recipes-extended/libsolv/libsolv_0.7.21.bb b/meta/recipes-extended/libsolv/libsolv_0.7.22.bb
similarity index 95%
rename from meta/recipes-extended/libsolv/libsolv_0.7.21.bb
rename to meta/recipes-extended/libsolv/libsolv_0.7.22.bb
index acf61e3adc..c27bf9c67e 100644
--- a/meta/recipes-extended/libsolv/libsolv_0.7.21.bb
+++ b/meta/recipes-extended/libsolv/libsolv_0.7.22.bb
@@ -12,7 +12,7 @@ SRC_URI = "git://github.com/openSUSE/libsolv.git;branch=master;protocol=https \
            file://0001-utils-Conside-musl-when-wrapping-qsort_r.patch \
 "
 
-SRCREV = "6f8bae1fea9c923bddf01c27115123010d191b07"
+SRCREV = "ea114b257b78bda6ee3e4238118ed93bc57c5984"
 
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+)"
 
-- 
2.25.1


