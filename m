Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0338C76196
	for <webhook@archiver.kernel.org>; Mon, 10 Apr 2023 08:57:08 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.2])
 by mx.groups.io with SMTP id smtpd.web11.39778.1681117021948410971
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Apr 2023 01:57:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=Umkvj4aT;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.2, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1681117020; i=@fujitsu.com;
	bh=kMU4Fl3jpzEsxyHPKDDTiQdX3GUWFyh3qsk4M8lA7sc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=Umkvj4aThyAQb22FGhNLKpSxztbBTbgYOvouGMzPVed/JBW2+ZUphLi6k1N4+koyF
	 lKPfQAhTg5UXv3astO47ViFjlbvuXQfdB8amZOUk7kYbSij7apq1vdvXTDT9hduulF
	 ybJylKiQzUb7bnaTq2KEZSemUVgKu/526h+C0V8K5ZkocrNO25RgvX+Rs74mC3Smzu
	 sCRDfs3flP0cOdcGhUemOIkcrf+qTAuvb3HzE3CnKi0dnQhjrKqh1pgeNqaE+OSh3y
	 vtQQB4eiFW8rBYTmdY9w58qMxulbNHo7t3unLDAdefJRUVfUsx3S1uVh+jVjtiZIXW
	 QlJfRB9qE7B6A==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrKIsWRWlGSWpSXmKPExsViZ8ORqBt53jj
  FoOmpkcWdn+/YHRg9zm1cwRjAGMWamZeUX5HAmtGxO7VgHUfF64dnmBoYd7J3MXJxCAk8ZpSY
  emEDkMMJ5Fxjkvh0LRAisYdR4tzc4ywgCTYBKYkb9/+zdTFycIgI6Elc/ScKEmYWUJF48bsHr
  FdYwFbiwOs9YDaLgKrE/ok/GEFsXgEnicfPO1hBbAkBBYkpD98zg9icAs4S7V1djBB7nSTaz3
  cwQ9QLSpyc+YQFYr6ExMEXL5ghehUlZl9uZoGwKyQapx9igrDVJK6e28Q8gVFwFpL2WUjaFzA
  yrWI0L04tKkst0jU010sqykzPKMlNzMzRS6zSTdRLLdXNyy8qydA11EssL9ZLLS7WK67MTc5J
  0ctLLdnECAzdlOKkOzsYd/b91TvEKMnBpCTK28VlnCLEl5SfUpmRWJwRX1Sak1p8iFGGg0NJg
  tfgLFBOsCg1PbUiLTMHGEcwaQkOHiUR3opjQGne4oLE3OLMdIjUKUZFKXFeyXNACQGQREZpHl
  wbLHYvMcpKCfMyMjAwCPEUpBblZpagyr9iFOdgVBLm3XYYaApPZl4J3PRXQIuZgBZzuRiALC5
  JREhJNTDVJIVO/xxlI6X2WH+qhv06lwzRro8nJIN/6K04dmbHjvgEQ7W21BuXJ6acMQtfckGi
  vEz+13pjldnrlc4cqf6uGbR/6Zecbc+Wz/OIVXVYluMY8YZb5fsh+ZMrJYoULZR/fbWQt1t3Z
  c1+WQO1XVkvDz0IZNncoKguvH7f8Yd9N3Y2e5oy/tZd6pyhsKflY+GBbrUi6dW/0+9P/6TleT
  NXmc9E+MPuLwk+DBzar200bq47lpexRrkl5f6bjSVHo7T69/B833Wje+qxSK/p1udYff8s8/t
  q0qYfyDDnW6W1Xvbvrje57WeWcc1hSD2cai6tm6A74+vU4FN9/D1O2fwbHq+z293DnJh2cc6c
  lQuVWIozEg21mIuKEwHldtc5WAMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-5.tower-732.messagelabs.com!1681117017!434653!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 23998 invoked from network); 10 Apr 2023 08:56:57 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-5.tower-732.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 10 Apr 2023 08:56:57 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 4DD6C1001B5
	for <openembedded-core@lists.openembedded.org>; Mon, 10 Apr 2023 09:56:57 +0100 (BST)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 4119C1001B0
	for <openembedded-core@lists.openembedded.org>; Mon, 10 Apr 2023 09:56:57 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 10 Apr 2023 09:56:55 +0100
From: <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] cracklib: upgrade 2.9.10 -> 2.9.11
Date: Mon, 10 Apr 2023 16:56:35 +0800
Message-ID: <1681116997-24685-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1681116997-24685-1-git-send-email-wangmy@fujitsu.com>
References: <1681116997-24685-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Apr 2023 08:57:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179845

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../cracklib/{cracklib_2.9.10.bb => cracklib_2.9.11.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/cracklib/{cracklib_2.9.10.bb => cracklib_2.9.11.bb} (94%)

diff --git a/meta/recipes-extended/cracklib/cracklib_2.9.10.bb b/meta/recipes-extended/cracklib/cracklib_2.9.11.bb
similarity index 94%
rename from meta/recipes-extended/cracklib/cracklib_2.9.10.bb
rename to meta/recipes-extended/cracklib/cracklib_2.9.11.bb
index 8197cdad9e..34ef2b65a1 100644
--- a/meta/recipes-extended/cracklib/cracklib_2.9.10.bb
+++ b/meta/recipes-extended/cracklib/cracklib_2.9.11.bb
@@ -13,7 +13,7 @@ SRC_URI = "git://github.com/cracklib/cracklib;protocol=https;branch=main \
            file://0001-packlib.c-support-dictionary-byte-order-dependent.patch \
            "
 
-SRCREV = "e74c539344d024709ee76e2920b0af7f9a5c5556"
+SRCREV = "4cf5125250c6325ef0a2dc085eabff875227edc3"
 S = "${WORKDIR}/git/src"
 
 inherit autotools gettext
-- 
2.34.1


