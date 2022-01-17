Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71FFAC4332F
	for <webhook@archiver.kernel.org>; Mon, 17 Jan 2022 14:30:41 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.4])
 by mx.groups.io with SMTP id smtpd.web08.11744.1642429840303470627
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Jan 2022 06:30:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=rqp9hxsD;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.4,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1642429838; i=@fujitsu.com;
	bh=16Dbtt6m/iqqkWVp8c0yBG2fOi6HWcnHeF7HVTPPkE0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=rqp9hxsDO0vD74ewfZS+/V4zjpLAX7uLmKOSl8Tf/X6mpkKNnJhqvExnziLONnoog
	 mvI/zDFlpWn+7+wbeW2K7bnEXB9Eq/oA6G9dP3s0371Y4J262nQq/yOy9Teu6NuxGz
	 3DBL9MgLIavgR8B/YKo0+d262rRDJExHgDhZAEOWB42rJBdc+8TMuf0yNT0Nhi+smI
	 5sZLmNctz2lXNMtSkJV9z1Qi513WhmVdy9BlE6Hmif2TY3cxYGxC/PqTgqE156dilc
	 c2sJh/v5f9/haH2Werut+h7rENNtMkCjbCCm5ZCEbuw9Gp+2d+SlyrkNpAKoZT+AXu
	 xe/NEFaYoIN0g==
Received: from [100.115.32.207] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-4.bemta.az-a.eu-west-2.aws.ess.symcld.net id 67/F8-23453-E8D75E16;
 Mon, 17 Jan 2022 14:30:38 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrFIsWRWlGSWpSXmKPExsViZ8MxSbe39mm
  iQddUG4s7P9+xOzB6nNu4gjGAMYo1My8pvyKBNWPjhx7Ggv0cFbuO7WFuYLzA3sXIxSEk8JhR
  omPJfCjnPJPEwvOL2SCcE4wSk7e+AnI4OdgE1CSm37rB2sXIwSEioCdx9Z8oSJhZQEXixe8ed
  hBbWMBc4u/FbiYQm0VAVeL4lmuMIDavgJPEz8n3wMZICChITHn4nhnE5hRwlnj16i8zyEghoJ
  rJM/QhygUlTs58wgIxXkLi4IsXzBCtihKzLzezQNgVErNmtTFB2GoSV89tYp7AKDgLSfssJO0
  LGJlWMVonFWWmZ5TkJmbm6BoaGOgaGprqGpvrGpoZ6SVW6SbqpZbqlqcWl+gCueXFeqnFxXrF
  lbnJOSl6eaklmxiBQZxSrLpoB+P+VT/1DjFKcjApifJyhj1NFOJLyk+pzEgszogvKs1JLT7EK
  MPBoSTBq54JlBMsSk1PrUjLzAFGFExagoNHSYTXqgYozVtckJhbnJkOkTrFqCglzssFkhAASW
  SU5sG1waL4EqOslDAvIwMDgxBPQWpRbmYJqvwrRnEORiVhXkuQKTyZeSVw018BLWYCWrzq4yO
  QxSWJCCmpBqbsdWElcUuvx/oe2RdQfrQogOdxS86zpFuB9lcSO67FHDq7gLnbwFF5tuja31Ut
  Sj922vM0GJl1tbPXtgUtCln29Wqs9Z67ZvklF7aLzM7RLl0hNcPVW2yt+hmBmPibfQcvzVjhk
  fPf99c9t5nlkwzif4W0d6zWd195WkRbiHtO/tbCdyfuiHUvdnJtKj5/vKiGT2ztifPzpK6qLl
  Wf/EVI7MBZV10TvYuGBTX2c1y/ntm28rQV9++UD7uaXNcxzxBb2qL5gm9eQlG90bu3vX1RC18
  KGD6+I6+nn9lcwsincTqL49Yb+SWFJ6Nsij4o7Il4uETKe4fEQS32V5EPFrgkftOdyvzplXrv
  Ob7+YCWW4oxEQy3mouJEAL0DsaJdAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-18.tower-565.messagelabs.com!1642429837!30683!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 21661 invoked from network); 17 Jan 2022 14:30:37 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-18.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 17 Jan 2022 14:30:37 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 86F0310046C
	for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Jan 2022 14:30:37 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 790B6100461
	for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Jan 2022 14:30:37 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.26; Mon, 17 Jan 2022 14:30:18 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] hdparm: upgrade 9.62 -> 9.63
Date: Mon, 17 Jan 2022 22:30:04 +0800
Message-ID: <1642429806-13814-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1642429806-13814-1-git-send-email-wangmy@fujitsu.com>
References: <1642429806-13814-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Jan 2022 14:30:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160644

Changelog:
=========
new --sanitize-overwrite-passes flag
applied "Plurals patch"

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-extended/hdparm/{hdparm_9.62.bb => hdparm_9.63.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/hdparm/{hdparm_9.62.bb => hdparm_9.63.bb} (94%)

diff --git a/meta/recipes-extended/hdparm/hdparm_9.62.bb b/meta/recipes-extended/hdparm/hdparm_9.63.bb
similarity index 94%
rename from meta/recipes-extended/hdparm/hdparm_9.62.bb
rename to meta/recipes-extended/hdparm/hdparm_9.63.bb
index 61bb44ff38..e286610d6a 100644
--- a/meta/recipes-extended/hdparm/hdparm_9.62.bb
+++ b/meta/recipes-extended/hdparm/hdparm_9.63.bb
@@ -26,7 +26,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/hdparm/${BP}.tar.gz \
            file://wiper.sh-fix-stat-path.patch \
           "
 
-SRC_URI[sha256sum] = "2c0f9d75cdbeda928a25a128cd3d0b7120445ec0910c0b29d4c1038ed1be777f"
+SRC_URI[sha256sum] = "70785deaebba5877a89c123568b41dee990da55fc51420f13f609a1072899691"
 
 EXTRA_OEMAKE = 'STRIP="echo" LDFLAGS="${LDFLAGS}"'
 
-- 
2.25.1


