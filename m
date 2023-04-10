Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 152E9C76196
	for <webhook@archiver.kernel.org>; Mon, 10 Apr 2023 09:41:49 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com [195.245.230.18])
 by mx.groups.io with SMTP id smtpd.web10.41132.1681119706961972930
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Apr 2023 02:41:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=S8u2GdJY;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.18, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1681119705; i=@fujitsu.com;
	bh=BKtzNUT9YtBnLc3DZ+CP3VPXtTJDR+SVYyIzyARP1o0=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=S8u2GdJY3s5D5llykH4pOfB0Y4+zBwUGYvKmbmychSrxyX5dSXvDURxPCcin727yj
	 8T9dw3nJb+JTwimwtspUuKu+BqPdtmdpl10a276jPizDYcmFsZeRhlRermxSu+/Gm1
	 xmwvfXAlV8Z4gps8GNpM8T2GR/KxmTBaPWAkafThUDp14fVpW7TRzfGMp79lQAnKmD
	 w/1Ze7P9d9kvO6Ry0NRj9SkwEbD3ATex0rn1A/7yOSMrqjre8S/4NbqhNZL63jG7Hn
	 x/u/1LtqBEMHsWIsJvh460ruEzt6HLXLHCYyW+hH02QNaoKz8EuipFZJCaDSpFxw4y
	 6EJsXzSmK8Blg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrHIsWRWlGSWpSXmKPExsViZ8MxSffGTeM
  Ugz9HjC3u/HzH7sDocW7jCsYAxijWzLyk/IoE1owvG2YxFdzlqNjWcJe1gbGJo4uRi0NI4DGj
  xIGZ11ggnGtMEn3Hn7JCOHsYJb4++MXcxcjJwSYgJXHj/n+2LkYODhEBPYmr/0RBwswCKhIvf
  vewg9jCAs4SG/5NZAOxWQRUJV4uPsQEYvMKOEl8eneUBcSWEFCQmPLwPTNEXFDi5MwnLBBzJC
  QOvnjBDFGjKDH7cjNUfYVE43SIORICahJXz21insDIPwtJ+ywk7QsYmVYxmhWnFpWlFukaGus
  lFWWmZ5TkJmbm6CVW6SbqpZbqlqcWl+ga6iWWF+ulFhfrFVfmJuek6OWllmxiBAZjSjFr3A7G
  731/9Q4xSnIwKYnydnEZpwjxJeWnVGYkFmfEF5XmpBYfYpTh4FCS4GW4DJQTLEpNT61Iy8wBR
  gZMWoKDR0mEV+IaUJq3uCAxtzgzHSJ1ilFRSpyX4zxQQgAkkVGaB9cGi8ZLjLJSwryMDAwMQj
  wFqUW5mSWo8q8YxTkYlYR5z1wEmsKTmVcCN/0V0GImoMVcLgYgi0sSEVJSDUx9jlkfHJJc4j1
  Wfz3RfqEvlsmHt8uW85SxIE/BoZ62yBezCioOxO3Rf7TkubR4dtV/68vVdhZuVkeNvr387XyX
  +fnxw7+9w/TemK7JdmA82vY2aMnx64uuiL/dtOLIx4BzL5+seqf8tub45XMCgsv3iu9VbVTIs
  q6OieyeOK3jjdXaw/OX35ivdn/1mTUsrbrdAcU9Dd+qb+Y2ndQ8rW84t7xu+WrmdenyXyfeFf
  co8WfUkrwYP/3YmnPxT8sDFbwX+bPfU1/9dlXZWcFTGWXyc7SbH5hW/qzt6tqyzjmk+vh/o5K
  Ncfl6q+8vrZix6rPmipndNgtVjn5dfMnxdYz7Q8eIHSW5au+lr37vvbZMiaU4I9FQi7moOBEA
  TOcZ4EEDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-19.tower-585.messagelabs.com!1681119704!196655!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 17750 invoked from network); 10 Apr 2023 09:41:44 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-19.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 10 Apr 2023 09:41:44 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 75476100323
	for <openembedded-core@lists.openembedded.org>; Mon, 10 Apr 2023 10:41:44 +0100 (BST)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 687A81000D5
	for <openembedded-core@lists.openembedded.org>; Mon, 10 Apr 2023 10:41:44 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 10 Apr 2023 10:41:42 +0100
From: <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-pytz: upgrade 2022.7.1 -> 2023.3
Date: Mon, 10 Apr 2023 17:41:31 +0800
Message-ID: <1681119692-25319-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Apr 2023 09:41:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179883

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-pytz_2022.7.1.bb => python3-pytz_2023.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pytz_2022.7.1.bb => python3-pytz_2023.3.bb} (90%)

diff --git a/meta/recipes-devtools/python/python3-pytz_2022.7.1.bb b/meta/recipes-devtools/python/python3-pytz_2023.3.bb
similarity index 90%
rename from meta/recipes-devtools/python/python3-pytz_2022.7.1.bb
rename to meta/recipes-devtools/python/python3-pytz_2023.3.bb
index e399f2139a..09fa26093f 100644
--- a/meta/recipes-devtools/python/python3-pytz_2022.7.1.bb
+++ b/meta/recipes-devtools/python/python3-pytz_2023.3.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=1a67fc46c1b596cce5d21209bbe75999"
 
 inherit pypi setuptools3 ptest
 
-SRC_URI[sha256sum] = "01a0681c4b9684a28304615eba55d1ab31ae00bf68ec157ec3708a8182dbbcd0"
+SRC_URI[sha256sum] = "1d8ce29db189191fb55338ee6d0387d82ab59f3d00eac103412d64e0ebd0c588"
 
 RDEPENDS:${PN}:class-target += "\
     ${PYTHON_PN}-datetime \
-- 
2.34.1


