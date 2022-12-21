Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42F7BC4167B
	for <webhook@archiver.kernel.org>; Wed, 21 Dec 2022 03:00:00 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.113])
 by mx.groups.io with SMTP id smtpd.web10.10350.1671591597900122005
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Dec 2022 18:59:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=GpgjwsVF;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.113, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1671591595; i=@fujitsu.com;
	bh=Tzye3S/M+fo75ssUQ1woxzftEfYoCoa8O76y1U6Hbxk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=GpgjwsVFXsr4MiSbGNSxHS0egMiTPHubpc11vg9OntrVl8EPjf5TMhLi8zXVuJZ9y
	 BwmgX5LsmHyzvbLzLCjHcIzdf785HNqeTTt2r6buwtq0FXU9AT03SN9no3nr+Oo/t0
	 NPPZKMCFb2S0p3MC4N/t1vR9dKcmOK0zEAbZgLfwHuWjXhyu0gFSbuFBhIsTIT/1aW
	 maM2KTXzlNgWDCzJu/XZWw8RGeMYsCQBb8KKWpreDop10hC0ComzkCSXz0f+sWMzWS
	 x4yzS0eV1dzOFIVgVsieqFQKsbwuZ2DnUD9kZ09BvOjwgGGkDZML1TgWmHpUk43wp0
	 ZWfSJlunEC1NA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrIIsWRWlGSWpSXmKPExsViZ8ORpLuqbFG
  ywdsONYs7P9+xOzB6nNu4gjGAMYo1My8pvyKBNWPd3imsBSs5K3r/xjYw7uboYuTiEBJ4wCjx
  4lo/O4RzmUni+ZPVTBDOHkaJhmXv2LoYOTnYBKQkbtz/D2RzcIgI6Elc/ScKEmYWUJF48buHH
  cQWFrCV2HpwNlg5i4CqxJzZK1lBbF4BJ4n9N08wgdgSAgoSUx6+ZwaxOQWcJY6+2wtWLwRUc+
  74VyaIekGJkzOfsEDMl5A4+OIFM0SvosTsy80sEHaFxKxZbVAz1SSuntvEPIFRcBaS9llI2hc
  wMq1iNCtOLSpLLdK11EsqykzPKMlNzMzRS6zSTdRLLdXNyy8qydA11EssL9ZLLS7WK67MTc5J
  0ctLLdnECAzdlOL03B2Ml5b90TvEKMnBpCTK68OwKFmILyk/pTIjsTgjvqg0J7X4EKMMB4eSB
  K9pKVBOsCg1PbUiLTMHGEcwaQkOHiURXrsSoDRvcUFibnFmOkTqFKMux8yvbQeYhVjy8vNSpc
  R5Q0FmCIAUZZTmwY2AxfQlRlkpYV5GBgYGIZ6C1KLczBJU+VeM4hyMSsK8MSCreDLzSuA2vQI
  6ggnoiGk3F4IcUZKIkJJqYJLr+iHBka5ufjwy4qhNccXcHRbM+zLucYisdko7Ie6T+ENNOP49
  34SJtxSeXavaKOFexR5ZqSnzln/y7CK5j1q5k4QqCnfOYjv/Tn3v0u36z0PYJf4UuR7lus5z8
  oP9Xi0ZwdULpnVGMi/WK8pZPEdURKHGuWJKwm+do1ebXzRMa7E+v3weR7fhjBsBs2t+xV6MUn
  LWivqdyp3nxFk+3fH7N/ZPavfnqoT6XT2ilVHz7NxEuYnGgZNWnpgvpZVnZ5Q1U979Z/m8E+d
  232zy2HhavcdaJlk0K9i11qRRfq0Rb91bybVGb7+ELDKaf8z7wW37Qzz2aYc0bDc2Hwp89P6i
  3nKGxi7Dfd8TtWq3KLEUZyQaajEXFScCAFAkn8RkAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-6.tower-732.messagelabs.com!1671591594!127826!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 13473 invoked from network); 21 Dec 2022 02:59:54 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-6.tower-732.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 21 Dec 2022 02:59:54 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 160C41B0
	for <openembedded-core@lists.openembedded.org>; Wed, 21 Dec 2022 02:59:54 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 0B16F1AE
	for <openembedded-core@lists.openembedded.org>; Wed, 21 Dec 2022 02:59:54 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Wed, 21 Dec 2022 02:59:52 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] help2man: upgrade 1.49.2 -> 1.49.3
Date: Wed, 21 Dec 2022 10:59:11 +0800
Message-ID: <1671591551-12455-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1671591551-12455-1-git-send-email-wangmy@fujitsu.com>
References: <1671591551-12455-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 Dec 2022 03:00:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174893

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
  * Cleanup whitespace in po-texi/help2man-texi.pot.
  * Add Korean translation

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../help2man/{help2man_1.49.2.bb => help2man_1.49.3.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/help2man/{help2man_1.49.2.bb => help2man_1.49.3.bb} (89%)

diff --git a/meta/recipes-devtools/help2man/help2man_1.49.2.bb b/meta/recipes-devtools/help2man/help2man_1.49.3.bb
similarity index 89%
rename from meta/recipes-devtools/help2man/help2man_1.49.2.bb
rename to meta/recipes-devtools/help2man/help2man_1.49.3.bb
index 62e1f67b55..75931a511f 100644
--- a/meta/recipes-devtools/help2man/help2man_1.49.2.bb
+++ b/meta/recipes-devtools/help2man/help2man_1.49.3.bb
@@ -6,7 +6,7 @@ LICENSE = "GPL-3.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=1ebbd3e34237af26da5dc08a4e440464"
 
 SRC_URI = "${GNU_MIRROR}/${BPN}/${BPN}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "9e2e0e213a7e0a36244eed6204d902b6504602a578b6ecd15268b1454deadd36"
+SRC_URI[sha256sum] = "4d7e4fdef2eca6afe07a2682151cea78781e0a4e8f9622142d9f70c083a2fd4f"
 
 inherit autotools
 
-- 
2.25.1


