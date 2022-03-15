Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46234C433F5
	for <webhook@archiver.kernel.org>; Tue, 15 Mar 2022 10:51:26 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com
 [195.245.230.17])
 by mx.groups.io with SMTP id smtpd.web09.9222.1647341484286267609
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Mar 2022 03:51:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=KyHs0c39;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.17,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1647341482; i=@fujitsu.com;
	bh=NobCRJ8wKVryBmqbbNjS+I/tQFNOJhUHXyF/tLOGmmU=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=KyHs0c39rFBs9QfDLtgcRYjLB9hU5yocFUUy46wVwGdaVKKyXEkOr2/u1Ai1gVZop
	 rhBxfCZyZ4oIFaYFcG07dScxbSgycnzb19w5lueG2VVHE3gE1KZc/g02DEX7LIyt4x
	 TC+7oHBZs/xkB41BIxpYjUs24VdiKD3RuKPpAZRaLB1mHuZ5Zj/tRzSwt/PHdiHCMm
	 KCYD4GvQ+f7fvybdlgsDhrguE7Tx3b0ktqzY3bmQ5ZMKOod/UMZJDHfLK/aaU+8tWY
	 6iL9mTHUszJzMKWlqRPv2nF6BzwE/CYU6NtZQhMxIt1N/AE6iN6p8GLsO+F5cujbsF
	 o1D7CWaC+c63w==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrIIsWRWlGSWpSXmKPExsViZ8ORqLsy3yD
  JYMp6HYs7P9+xOzB6nNu4gjGAMYo1My8pvyKBNWPat4tsBcs5KlZNe8fewLiTvYuRi0NI4DGj
  xI43rawQznkmiaVnVzB3MXICOScYJd6ttAGx2QTUJKbfugFUxMEhIqAncfWfKEiYWUBF4sXvH
  nYQW1jAUaL15hywVhYBVYmG3/1gNq+Ak8SVwxsZQWwJAQWJKQ/fQ8UFJU7OfMICMUdC4uCLF8
  wQNYoSsy83s0DYFRKzZrUxQdhqElfPbWKewMg/C0n7LCTtCxiZVjFaJRVlpmeU5CZm5ugaGhj
  oGhqa6prqGpma6iVW6SbqpZbqlqcWl+ga6iWWF+ulFhfrFVfmJuek6OWllmxiBIZkSjHr/x2M
  3X0/9Q4xSnIwKYnysogYJAnxJeWnVGYkFmfEF5XmpBYfYpTh4FCS4A3KBcoJFqWmp1akZeYA4
  wMmLcHBoyTCuzwNKM1bXJCYW5yZDpE6xagoJc4rkweUEABJZJTmwbXBYvISo6yUMC8jAwODEE
  9BalFuZgmq/CtGcQ5GJWHefpApPJl5JXDTXwEtZgJaPE9aD2RxSSJCSqqBKWDJdMFVt7tXWe8
  +5zKxr/6F785FW+YcteWPOqEm2XcmJdS8avq223ukeCenX7T8H79KuF944zfNWSK8W9ibHTdk
  +oor7T8TpeD8sJvvup7nJu39EUek1W5/M/h0d5qZ3dQZZi0NX3YedG2YxfVsHcO/WdGhQik7m
  TkOrNu/0Ux6pdLyizw7V32IN39VrRC6qvfAk3zpLtbda7ZP0Gt4+zat8LDv6Z9O6ZHL2S7f9H
  5TOmnLtbv9p1hmp9+q5j62t/aU+LdSKVYfB5eQVYqBD9osQ3YH/Y+N0H77Wm9iYWH7od+lNXZ
  TTU+KWN5cZHH38Z8NAVGTZ2x6a7ahISzWf+kRjvMcPNf0V824cCdqOrMSS3FGoqEWc1FxIgAj
  1FDWRAMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-11.tower-585.messagelabs.com!1647341481!10837!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.9; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 26505 invoked from network); 15 Mar 2022 10:51:21 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-11.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 15 Mar 2022 10:51:21 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 1047E1001A4
	for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Mar 2022 10:51:21 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id B9EAC100197
	for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Mar 2022 10:51:20 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.28; Tue, 15 Mar 2022 10:51:17 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] createrepo-c: upgrade 0.18.0 -> 0.19.0
Date: Tue, 15 Mar 2022 18:51:01 +0800
Message-ID: <1647341464-78625-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Mar 2022 10:51:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163228

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{createrepo-c_0.18.0.bb => createrepo-c_0.19.0.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/createrepo-c/{createrepo-c_0.18.0.bb => createrepo-c_0.19.0.bb} (96%)

diff --git a/meta/recipes-devtools/createrepo-c/createrepo-c_0.18.0.bb b/meta/recipes-devtools/createrepo-c/createrepo-c_0.19.0.bb
similarity index 96%
rename from meta/recipes-devtools/createrepo-c/createrepo-c_0.18.0.bb
rename to meta/recipes-devtools/createrepo-c/createrepo-c_0.19.0.bb
index 1122114031..82351252e5 100644
--- a/meta/recipes-devtools/createrepo-c/createrepo-c_0.18.0.bb
+++ b/meta/recipes-devtools/createrepo-c/createrepo-c_0.19.0.bb
@@ -8,7 +8,7 @@ SRC_URI = "git://github.com/rpm-software-management/createrepo_c;branch=master;p
            file://0001-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch \
            "
 
-SRCREV = "09ea861c8ef11927de5a276116ecb83ab8e93462"
+SRCREV = "a531ee881a8f1d9273b4383fb9fa604c56fff138"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1


