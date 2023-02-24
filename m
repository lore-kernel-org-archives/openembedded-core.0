Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A63C1C678D5
	for <webhook@archiver.kernel.org>; Fri, 24 Feb 2023 06:24:27 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web10.12178.1677219866694333857
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Feb 2023 22:24:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=H5O63LGL;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.112, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1677219864; i=@fujitsu.com;
	bh=YB37ENNAvNEro0wWb2qqQ+Sb1P9v6Z9XrZcScg6jivY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=H5O63LGL1l7ONNS7Fc2gxwvDGqv3jF9DjJ4d/VufSUQibUpLXOLFcTD6sxKOyI0wJ
	 e2fMelGVv7w6YOuUtTNE8L9vrYPS4DtL+9R1GyOJD3tyLE9FQwyTo+eoqcK4jEzU5I
	 V1Hi2Xl8VMX3CAK1TVtr5dN7lG43B08BQdV6LalHDJ7J1+Oeu6pJx9IVFhz/gNy2Wj
	 tdZh6JNefGmctQVHCpnIm7eghfVa58K2sXjWUQYzQxDPaLCjgAdCeMH8HJzfgkDZeS
	 jeHnWXSt+pit9M6z6IS+bkYPIvxDMi2neczQW5uO8Oi5iWJGqaPFFrYzGcuJmIBPk8
	 FYx9m0JRGYplw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrEIsWRWlGSWpSXmKPExsViZ8ORpCse8SP
  ZYOEcQ4s7P9+xOzB6nNu4gjGAMYo1My8pvyKBNWNm4xGWgib2ijdtW5gaGDexdTFycQgJPGCU
  aHzZxQzhXGGSeP95D1RmL6PEjE2bgTKcHGwCUhI37v8HSnBwiAjoSVz9JwoSZhZQkXjxu4cdx
  BYWCJF4MncVWDmLgKrE1s7/zCDlvAJOEjsXp4GEJQQUJKY8fA9WwingLNG6+zkriC0EVNLU/w
  AszisgKHFy5hMWiPESEgdfvGCG6FWUmH25mQXCrpRo/fALylaTuHpuE/MERsFZSNpnIWlfwMi
  0itG8OLWoLLVI19BQL6koMz2jJDcxM0cvsUo3US+1VDcvv6gkQ9dQL7G8WC+1uFivuDI3OSdF
  Ly+1ZBMjMHhTitOO72B82fdX7xCjJAeTkiivrsyPZCG+pPyUyozE4oz4otKc1OJDjDIcHEoSv
  HKhQDnBotT01Iq0zBxgJMGkJTh4lER43fyA0rzFBYm5xZnpEKlTjLocaxsO7GUWYsnLz0uVEu
  dtCgMqEgApyijNgxsBi+pLjLJSwryMDAwMQjwFqUW5mSWo8q8YxTkYlYR5v4QATeHJzCuB2/Q
  K6AgmoCO+v/kCckRJIkJKqoFpSekRRtm/5uJat1k68iXz57oKb123W0nQMqsjxrfviMFJs3bD
  yfvbsg4L1BSz/bno/vnxuh+FW07dzFL9vG/pjSUKp5jYD6g2Zk4y2eP+ddm2bMmlxzdKpXyct
  FnquN/ExvJ3L4JeTbs8Yc22jGqbbYJFFhdvrP/1pS7MLrYo89+VTeulZh6N6Wh1O1K2QmHqis
  TPK48sCJ/w9e0n4dZKybTZ3OumPdvj+ebfgQemj1dL7PrDNrnpwvQ6TjVRPYfUtqkKCd1vr/U
  LTEw69O30G4XTLwReRJexLOrbsCOXiyPuQ5brCv0Hqt5WBX9e/X98LeiQs+2Bl4sStlgu0Kq7
  dc5l/+zVuXayHBqOmk/mXVZiKc5INNRiLipOBACPn/fpZQMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-14.tower-745.messagelabs.com!1677219863!542008!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.102.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 17015 invoked from network); 24 Feb 2023 06:24:23 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-14.tower-745.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 24 Feb 2023 06:24:23 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 337401AE
	for <openembedded-core@lists.openembedded.org>; Fri, 24 Feb 2023 06:24:23 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 279621AC
	for <openembedded-core@lists.openembedded.org>; Fri, 24 Feb 2023 06:24:23 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Fri, 24 Feb 2023 06:24:21 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 2/2] xcb-proto: Fix install conflict when enable multilib.
Date: Fri, 24 Feb 2023 14:24:10 +0800
Message-ID: <1677219850-18169-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1677219850-18169-1-git-send-email-wangmy@fujitsu.com>
References: <1677219850-18169-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Feb 2023 06:24:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177658

From: Wang Mingyu <wangmy@fujitsu.com>

Error: Transaction test error:
  file /usr/share/pkgconfig/xcb-proto.pc conflicts between attempted installs of lib32-xcb-proto-dev-1.15.2-r0.armv7ahf_neon and xcb-proto-dev-1.15.2-r0.cortexa57

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb b/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb
index 4e4472a9c1..0fdca732e8 100644
--- a/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb
+++ b/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb
@@ -28,3 +28,6 @@ DEV_PKG_DEPENDENCY = ""
 RRECOMMENDS:${PN}-dbg = "${PN}-dev (= ${EXTENDPKGV})"
 
 BBCLASSEXTEND = "native nativesdk"
+inherit multilib_script
+MULTILIB_SCRIPTS = "${PN}-dev:${datadir}/pkgconfig/xcb-proto.pc"
+
-- 
2.34.1


