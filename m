Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F4CEC77B78
	for <webhook@archiver.kernel.org>; Fri, 21 Apr 2023 06:06:40 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com [195.245.230.17])
 by mx.groups.io with SMTP id smtpd.web11.5474.1682057194374733878
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Apr 2023 23:06:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=qMTh5FkO;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.17, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1682057192; i=@fujitsu.com;
	bh=Ahj77PaCkNDTSSVvpvsyk6ZeTx5zip7JsVz69mX/JhA=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=qMTh5FkOOC9xVt95ZR/UML2cRajFSxRrfBKKHCfBsMtnHAte8eZbekbjUrgcTj02+
	 mVswJZ1T/CdqgzM0MKI8GbUiqnQi36rW7YyhJnaVH8/9DXrwmcdjZ4u8lyQi+EaJXj
	 KkkJkY6qE657tVeHKORND9fqO+jjmXHkUQRUYXlrf7KrJwEj/0tm3JbsrvcWmnzzgq
	 1QqsPZCaj0BDW78EN1F6l0sbjL4J9K8DITbFlqFGLxGPamPRSaMi3QdRgzBm06aFue
	 U996eAzHdDD8obib5bj/iYXCogrt2MnczMTLBZvhMCl4OpuzhmyPvXhqYA8Yb11B2s
	 zJHybGStaEkLg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrNIsWRWlGSWpSXmKPExsViZ8ORqPtc3Sn
  FYPlNc4s7P9+xOzB6nNu4gjGAMYo1My8pvyKBNePo1OusBevZKx5+2cvewLiHrYuRi0NI4DGj
  xJnJv1ghnOtMEhvmPmTuYuQEcvYySlx4UwpiswlISdy4/x+og4NDREBP4uo/UZAws4CKxIvfP
  ewgtrBAgMTdpg9grSwCqhKtexcwg5TzCjhJfJ6YDRKWEFCQmPLwPVgJr4CgxMmZT1ggxkhIHH
  zxghmiRlFi9uVmFgi7UqL1wy8oW03i6rlNzBMY+WchaZ+FpH0BI9MqRtPi1KKy1CJdS72kosz
  0jJLcxMwcvcQq3US91FLd8tTiEl1DvcTyYr3U4mK94src5JwUvbzUkk2MwDBMKWZ12sF4vO+v
  3iFGSQ4mJVHeF7sdUoT4kvJTKjMSizPii0pzUosPMcpwcChJ8G5TdkoREixKTU+tSMvMAcYET
  FqCg0dJhLcfJM1bXJCYW5yZDpE6xagoJc67TQ0oIQCSyCjNg2uDxeElRlkpYV5GBgYGIZ6C1K
  LczBJU+VeM4hyMSsK8msCoFuLJzCuBm/4KaDET0OKHYg4gi0sSEVJSDUzJNx+m/fryNF7SZ3e
  KX6bPDlmvd0GaBYzX03cbTbLz3npqSYTT/xPbbpVu1bQ9f+mFwITOR8KtmyUvf5z+hl/bSlVg
  QZr76g7r7Tc2frHNXfVaiOH7Rks5yxdsUum7PvGYJn3mWaK2jPuSHL8wn+q5l7OXqEiapWpf/
  Gqq+/zJnydqK+9x1acIeGpwX6+es2bLtA5Lg5wAj7e7b59c9vJBjeTDcJFLOpNudS2NrXlVUB
  21faFQmOXU5/cfpi5S7pU4EfhMNOJQFptnjoryj136axymbzD4wqe1prfl2DmLzt9/H8qUVol
  e7Y+SnzH5lXfLzn1Rf84nzz1ctOZQgM2Fh1nz6nM/shV95VrofXW+EktxRqKhFnNRcSIAvxUN
  Gz4DAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-21.tower-585.messagelabs.com!1682057191!274127!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 2461 invoked from network); 21 Apr 2023 06:06:31 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-21.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 21 Apr 2023 06:06:31 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 7A879100225
	for <openembedded-core@lists.openembedded.org>; Fri, 21 Apr 2023 07:06:31 +0100 (BST)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 6E28D1001BF
	for <openembedded-core@lists.openembedded.org>; Fri, 21 Apr 2023 07:06:31 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Fri, 21 Apr 2023 07:06:29 +0100
From: <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 1/2] gdb: use update-alternatives for sframe-spec.info
Date: Fri, 21 Apr 2023 14:06:15 +0800
Message-ID: <1682057176-19939-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Apr 2023 06:06:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180272

From: Wang Mingyu <wangmy@fujitsu.com>

binutils also uses the doc 'sframe-spec.info'.

binutils has a priority of 100.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-devtools/gdb/gdb-common.inc | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/recipes-devtools/gdb/gdb-common.inc b/meta/recipes-devtools/gdb/gdb-common.inc
index 925b0c2f80..338d1650d2 100644
--- a/meta/recipes-devtools/gdb/gdb-common.inc
+++ b/meta/recipes-devtools/gdb/gdb-common.inc
@@ -53,6 +53,12 @@ do_configure () {
 
 # we don't want gdb to provide bfd/iberty/opcodes, which instead will override the
 # right bits installed by binutils.  Same for bfd.info -- also from binutils.
+inherit update-alternatives
+
+ALTERNATIVE_PRIORITY = "50"
+ALTERNATIVE:${PN}-doc = "sframe-spec"
+ALTERNATIVE_LINK_NAME[sframe-spec] = "${infodir}/sframe-spec.info"
+
 do_install:append() {
 	rm -rf ${D}${libdir}
 	rm -rf ${D}${includedir}
-- 
2.34.1


