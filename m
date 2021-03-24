Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com [195.245.230.67])
 by mx.groups.io with SMTP id smtpd.web10.5937.1616593147185885223
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Mar 2021 06:39:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=xZ3n2DhJ;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.67, mailfrom: wangmy@fujitsu.com)
Return-Path: <wangmy@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1616593145; i=@fujitsu.com;
	bh=Wezrblxw9OTNnHlt3YtxEXtOgdkKXzIxeJfSuohC0t8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=xZ3n2DhJniXs8hn22rDMM+y7jlkboZXSyylTvyvMo4dCzq33r+5clwnkzXwZpDTO9
	 /QGlD9djEwpdTT2xil31Xdj8i0yJC+3UnWruUUDPRUvN0dGLkLXOQsF+2+z0+K2V8C
	 dI/aKSbXaV1v25K8h76t9MCbV5vq04ySrd0gEsOeeplu4qya4v/PEvn/WNkA3qS/VY
	 JuhBYTOTALBLT/3vM6KWAnD1V+6CzoT9YEhcPcZzPw8NI7iOsqsAT5IJkFUr4+WxKU
	 rFYHERPXScWmyFo85E71DDI6lVQ220Y65WUcSpk6XAFrtauqeGyOyI/WYlGD+XSDkT
	 wMqeKmq2jZmuQ==
Received: from [100.112.196.73] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-3.bemta.az-b.eu-west-1.aws.symcld.net id 5F/2B-42200-9F04B506; Wed, 24 Mar 2021 13:39:05 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrFIsWRWlGSWpSXmKPExsViZ8MxVfenQ3S
  CQd93UYs7P9+xOzB6nNu4gjGAMYo1My8pvyKBNWPP+0+MBW85KpZ+NmpgfMvexcjFISSwmUli
  wrZfbBDOCUaJpnmHGLsYOTnYBNQkpt+6wdrFyMEhIqAncfWfKEiYWUBd4tK6FhYQW1jATmLm9
  81gNouAqsSk9RPYQGxeASeJg+8XgI2REFCQmPLwPTOIzSngLDH12W0wWwiopm3Pc0aIekGJkz
  OfsEDMl5A4+OIFM0SvosTsy80sEHaVxJqOaWwTGPlnIWmZhaRlASPTKkaLpKLM9IyS3MTMHF1
  DAwNdQ0MjXUNLC11Dc2O9xCrdJL3UUt3y1OISXUO9xPJiveLK3OScFL281JJNjMBgTCk4tnYH
  Y8+bD3qHGCU5mJREeatsohOE+JLyUyozEosz4otKc1KLDzHKcHAoSfBK2gPlBItS01Mr0jJzg
  JEBk5bg4FES4ZWwBUrzFhck5hZnpkOkTjHqcjTfWbKIWYglLz8vVUqc9zrIDAGQoozSPLgRsC
  i9xCgrJczLyMDAIMRTkFqUm1mCKv+KUZyDUUmYtxNkCk9mXgncpldARzABHbHxRyTIESWJCCm
  pBqap5QprmK23/+5/68qp88H5wxXHKQvKrguWsv4/Xc+3u2nacgG9v4tTrYW9J81JK7RmL1V1
  +vJALHHqun4L7nebQzVinsyqu3c//3TsQiO3RPv8Jy/esWyz/Je7ujVjFkfl3k87RCYtf/Ty7
  9kNKfeKF6/d8piD51RA0bSuv6F+LJIvPssdSTrPd9jN89eXF0H37iitfDjjr8U516t/rL4a77
  0+017Q4er36Q9T6nlaztW92nTSy+fGd7l5l+bN368s8UTV6ELSOYaS0s5Vy5Wvblsbvm3Fwr+
  Jlp2yO9hUs2P1+M4XSr+7E5rwNuN5y7U1WavWely9IR799vu0jd/6uhpUL33tm1R7ON3Tqo3B
  XYmlOCPRUIu5qDgRALpIOBtNAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-8.tower-291.messagelabs.com!1616593144!241313!1
X-Originating-IP: [62.60.8.149]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.60.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 9156 invoked from network); 24 Mar 2021 13:39:05 -0000
Received: from unknown (HELO mailhost2.uk.fujitsu.com) (62.60.8.149)
  by server-8.tower-291.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 24 Mar 2021 13:39:05 -0000
Received: from r01ukexcasm214.r01.fujitsu.local (ex2k13_214.fs.fujitsu.com [10.182.185.116])
	by mailhost2.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 12ODcxpc026640
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Wed, 24 Mar 2021 13:39:04 GMT
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 r01ukexcasm214.r01.fujitsu.local (10.182.185.116) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Wed, 24 Mar 2021 13:39:00 +0000
From: "wangmy" <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [OE-core] [PATCH] babeltrace2: upgrade 2.0.3 -> 2.0.4
Date: Wed, 24 Mar 2021 21:38:47 +0800
Message-ID: <1616593128-42917-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1616593128-42917-1-git-send-email-wangmy@fujitsu.com>
References: <1616593128-42917-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 r01ukexcasm214.r01.fujitsu.local (10.182.185.116)
Content-Type: text/plain

From: Wang Mingyu <wangmy@cn.fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../lttng/{babeltrace2_2.0.3.bb => babeltrace2_2.0.4.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-kernel/lttng/{babeltrace2_2.0.3.bb => babeltrace2_2.0.4.bb} (98%)

diff --git a/meta/recipes-kernel/lttng/babeltrace2_2.0.3.bb b/meta/recipes-kernel/lttng/babeltrace2_2.0.4.bb
similarity index 98%
rename from meta/recipes-kernel/lttng/babeltrace2_2.0.3.bb
rename to meta/recipes-kernel/lttng/babeltrace2_2.0.4.bb
index 32ba75bf36..7fb524eeb0 100644
--- a/meta/recipes-kernel/lttng/babeltrace2_2.0.3.bb
+++ b/meta/recipes-kernel/lttng/babeltrace2_2.0.4.bb
@@ -12,7 +12,7 @@ SRC_URI = "git://git.efficios.com/babeltrace.git;branch=stable-2.0 \
            file://0001-tests-do-not-run-test-applications-from-.libs.patch \
            file://0001-Make-manpages-multilib-identical.patch \
            "
-SRCREV = "91d154476e66735d705adda9ca5cbf5b5eea5940"
+SRCREV = "23e8cf4e6fdc1d0b230e964dafac08a57e6228e6"
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>2(\.\d+)+)$"
 
 S = "${WORKDIR}/git"
-- 
2.25.1

