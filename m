Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE06FE77187
	for <webhook@archiver.kernel.org>; Tue, 17 Dec 2024 08:58:45 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web11.77568.1734425918925110419
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Dec 2024 00:58:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=edHa9Q8c;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1734425920; x=1765961920;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=x9fI8ls8vkMD7yRQxztY2HGwnKs/TtEZ0zX+D5pe+ao=;
  b=edHa9Q8c9PiuJx3tMgO56570+dQS/3wLP05+/OC+ujK6J/c4I56gGCQp
   HBCVBvQLcSfhdpFubWupHGVmqo5xMwPhRFU1woZAexdscWRDp4LRs0jsP
   vxWE/N/N5BW+zZSpNk44RZJD6E6/4Hu5nF5ab7rnwhWlsIaVxUxd/TUp4
   ZCFnhfmWIQGSa+apcZC3HY9V0Orbfwc+P83HC+K/2nbxFQhYcI08aSyZt
   INbAnsiMkj8njnWN7SH2tZy9xAE6mz4kM5oL8KyubSiAVH7/rA4ycX/q/
   23XyL9jRjA6GvA1w6SPu43nA6jDk7ykYZlzdO4SJq9dfW6JTGQ/fAJtZK
   A==;
X-CSE-ConnectionGUID: ZkQu44YuRm2tP9XitdGEYw==
X-CSE-MsgGUID: tMChDjb9QFi5dw9+0ApFTA==
X-IronPort-AV: E=McAfee;i="6700,10204,11288"; a="184237986"
X-IronPort-AV: E=Sophos;i="6.12,241,1728918000"; 
   d="scan'208";a="184237986"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2024 17:58:39 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 372DFD6EA7
	for <openembedded-core@lists.openembedded.org>; Tue, 17 Dec 2024 17:58:37 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 04CEDD5098
	for <openembedded-core@lists.openembedded.org>; Tue, 17 Dec 2024 17:58:37 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 8E66F2007CDE4
	for <openembedded-core@lists.openembedded.org>; Tue, 17 Dec 2024 17:58:36 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 375B71A000B;
	Tue, 17 Dec 2024 16:58:36 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [OE-core] [PATCH 20/21] socat: upgrade 1.8.0.1 -> 1.8.0.2
Date: Tue, 17 Dec 2024 16:58:06 +0800
Message-Id: <1734425887-18069-20-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1734425887-18069-1-git-send-email-wangmy@fujitsu.com>
References: <1734425887-18069-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28864.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28864.006
X-TMASE-Result: 10--0.475900-10.000000
X-TMASE-MatchedRID: 4E21WKQgrFSjz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmIAf/HImzvCGOeKNmNNd29XA34KY0g5BTdN8rmPQRlvK/GmNQuSBG+Fo8W
	MkQWv6iV3LAytsQR4e5rSTaF7k3C43QfwsVk0UbvqwGfCk7KUsy1lgUmXrdPfDko2WK9Z47FCgP
	WFp6UUKHM3OyZdSlgFCRYbVDJOJXnGUyi5SOf/LiPT4IaP++6iMrOmZ1VqJu3ATXJDBiQcFIgep
	pQyntVe0v8srR3gjfRl7+AkHjVJOxuqkzsKv5+9ftwZ3X11IV0=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Dec 2024 08:58:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208823

From: Wang Mingyu <wangmy@cn.fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../socat/{socat_1.8.0.1.bb => socat_1.8.0.2.bb}                | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/socat/{socat_1.8.0.1.bb => socat_1.8.0.2.bb} (95%)

diff --git a/meta/recipes-connectivity/socat/socat_1.8.0.1.bb b/meta/recipes-connectivity/socat/socat_1.8.0.2.bb
similarity index 95%
rename from meta/recipes-connectivity/socat/socat_1.8.0.1.bb
rename to meta/recipes-connectivity/socat/socat_1.8.0.2.bb
index 95b4017040..7d5da67c9c 100644
--- a/meta/recipes-connectivity/socat/socat_1.8.0.1.bb
+++ b/meta/recipes-connectivity/socat/socat_1.8.0.2.bb
@@ -13,7 +13,7 @@ SRC_URI = "http://www.dest-unreach.org/socat/download/socat-${PV}.tar.bz2 \
            file://0001-fix-compile-procan.c-failed.patch \
 "
 
-SRC_URI[sha256sum] = "6a283565db7cf86292c6f70504c58abb03e29888adeed5a6c5f3457e803c1b81"
+SRC_URI[sha256sum] = "adc07a9c2723527cf6568d2fb96559794cf9c254a4bc2edd36f7f3789e9f7625"
 
 inherit autotools
 
-- 
2.43.0


