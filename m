Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E16C5C38162
	for <webhook@archiver.kernel.org>; Wed,  6 Apr 2022 16:33:19 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com
 [195.245.230.18])
 by mx.groups.io with SMTP id smtpd.web08.7616.1649245766507441530
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Apr 2022 04:49:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=GH6Fiqmj;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.18,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1649245764; i=@fujitsu.com;
	bh=NBe0smVEAW5vSXgWngM21os7OWr98N9P4lRaZfLXbbQ=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=GH6FiqmjrwsTgFBm83iO9A6E1STj1O4t6Kv1Xxr2QZplnNC/xfMMUK3sz3y6uAXnG
	 FchtnPdO1umsCA5yL2ofV7ibp2WYXKcYybk679huYuM3FRjrBEI0DBQHXeInX/nQTL
	 Xh0X1Zt+5mZ4KHykSUTStN+kHGLFH70/loCXt2PXELUu8zioyNdUiV24SozW5xDJYd
	 u1KDMy7+DZKdYTV9GN4DT7J2l9doOb8f792BqTDm83n7ujj+6I5d7nTP8dy/4yayjO
	 H+ercS5b83jGm9Y47sqyaC03Fu13L+sX4X3SeWPDfB09dB21XBf4tGk9+7iYsU9J9m
	 /uotHkcyXKyvA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrIIsWRWlGSWpSXmKPExsViZ8ORqOtS55t
  k8OC1kMWdn+/YHRg9zm1cwRjAGMWamZeUX5HAmjFzR27BTe6Kqb9nszQw3ubqYuTgEBJ4zCix
  nKWLkQvIPM8kMWv9XEYIZzejxLr1naxdjJwcbAJqEtNv3WAFaRAR0JO4+k8UJMwsoCLx4ncPO
  4gtLGAvse/HMSYQmwUofvT0UUYQm1fASWLj1+tgYyQEFCSmPHzPDBEXlDg58wkLxBwJiYMvXj
  BD1ChKzL7czAJhV0jMmtXGBGGrSVw9t4l5AiP/LCTts5C0L2BkWsVolVSUmZ5RkpuYmaNraGC
  ga2hoqmuqa2RkrpdYpZuol1qqW55aXKJrqJdYXqyXWlysV1yZm5yTopeXWrKJERiOKcWsj3cw
  run7qXeIUZKDSUmUd3+5b5IQX1J+SmVGYnFGfFFpTmrxIUYZDg4lCd4tVUA5waLU9NSKtMwcY
  GzApCU4eJREeLVqgNK8xQWJucWZ6RCpU4zGHJcOXdnLzLHpMJAUYsnLz0uVEud9CVIqAFKaUZ
  oHNwgWs5cYZaWEeRkZGBiEeApSi3IzS1DlXzGKczAqCfN6gUzhycwrgdv3CugUJqBT3p3xBDm
  lJBEhJdXANLNz8bb6D3t5lY7YW+9878UkJHd0ne7UesZ3Or949+kYCc06+P+TTM9CJ63Er6kG
  a5nexHUWTf2SJaF4Ni8mNP7G82qBX2eaEkPnL1u0amJwKe+JWX+u63zunrJZSiOhaG1fx7FM3
  0KNs4tVp3BYHPynmzt17Y7VK+7/SfXfH7d+/tmm60cFz2nb3UpK8mRQj/OYFD33aUKr1u+iMw
  ebXfeyT2VOm7NqQqO/yQOtsh88jdWioulGTB2l65kVUxK8dDRSNk9u7JIIa5MXCPkxoXj1tQZ
  3jTIhAZNOi+yL2y7c+Xj2jIioy70H51Z2GT6QsnHyOxMed6XMT3w6r5aUZES48xOJ1ymHymd8
  UJymxFKckWioxVxUnAgAxp9Uz1QDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-15.tower-585.messagelabs.com!1649245764!111662!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.85.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 23216 invoked from network); 6 Apr 2022 11:49:24 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-15.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 6 Apr 2022 11:49:24 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id AB9851001A8
	for <openembedded-core@lists.openembedded.org>;
 Wed,  6 Apr 2022 12:49:23 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 74990100181
	for <openembedded-core@lists.openembedded.org>;
 Wed,  6 Apr 2022 12:49:23 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Wed, 6 Apr 2022 12:49:01 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] acpica: upgrade 20211217 -> 20220331
Date: Mon, 4 Apr 2022 02:45:36 +0800
Message-ID: <1649011540-28857-1-git-send-email-wangmy@fujitsu.com>
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
 <openembedded-core@lists.openembedded.org>; Wed, 06 Apr 2022 16:33:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164069

License-Update: year updated to 2022.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../acpica/{acpica_20211217.bb => acpica_20220331.bb}         | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/acpica/{acpica_20211217.bb => acpica_20220331.bb} (91%)

diff --git a/meta/recipes-extended/acpica/acpica_20211217.bb b/meta/recipes-extended/acpica/acpica_20220331.bb
similarity index 91%
rename from meta/recipes-extended/acpica/acpica_20211217.bb
rename to meta/recipes-extended/acpica/acpica_20220331.bb
index d1727c1dab..2c554f863a 100644
--- a/meta/recipes-extended/acpica/acpica_20211217.bb
+++ b/meta/recipes-extended/acpica/acpica_20220331.bb
@@ -10,14 +10,14 @@ HOMEPAGE = "http://www.acpica.org/"
 SECTION = "console/tools"
 
 LICENSE = "Intel | BSD-3-Clause | GPL-2.0-only"
-LIC_FILES_CHKSUM = "file://source/compiler/aslcompile.c;beginline=7;endline=150;md5=c33ce358fdcd142684e41e336b7992e8"
+LIC_FILES_CHKSUM = "file://source/compiler/aslcompile.c;beginline=7;endline=150;md5=41a76b4b1f816240f090cf010fefebf0"
 
 COMPATIBLE_HOST = "(i.86|x86_64|arm|aarch64).*-linux"
 
 DEPENDS = "m4-native flex-native bison-native"
 
 SRC_URI = "https://acpica.org/sites/acpica/files/acpica-unix-${PV}.tar.gz"
-SRC_URI[sha256sum] = "2511f85828820d747fa3e2c3433d3a38c22db3d9c2fd900e1a84eb4173cb5992"
+SRC_URI[sha256sum] = "acaff68b14f1e0804ebbfc4b97268a4ccbefcfa053b02ed9924f2b14d8a98e21"
 
 UPSTREAM_CHECK_URI = "https://acpica.org/downloads"
 
-- 
2.25.1


