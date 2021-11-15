Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4168C433F5
	for <webhook@archiver.kernel.org>; Mon, 15 Nov 2021 15:03:09 +0000 (UTC)
Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com
 [85.158.142.115])
 by mx.groups.io with SMTP id smtpd.web10.23421.1636988588321666201
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Nov 2021 07:03:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=tNZMcZbO;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.115,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1636988585; i=@fujitsu.com;
	bh=gbs+vWLm3rOI4FBp2KnNt2fn3XMjTE75dgRPEOOwKqg=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=tNZMcZbOwZbXV55XWiAv5GMBWYFGR5e0zeR+63hJekY46QLyA4uew8fNlNqsO5e8y
	 ohqa9nMnE60FD7lu/n1mo0YhFdnT8rjbFWMvLdbnqH2l5OYZdTrxNW7PWbCZWAmbup
	 4ExvCyZBW0ZBg8stpIm1cq69Qaun3hRT7swVR/8HvHBuzffQDTS6Ic4Y5Buavkcrj7
	 W/XuCsOWLg18jLLxultoAct9AExuy56vkc0Z0fmVJRsJcQgCPzpGOuZTGwxFf2xH9h
	 MHyY3Fa/Ie5E83cYmHArzpeRi7aT4BeGBAnVjcvWmeV+1vHjS/AIwAiDY8lg5K/hqq
	 jfYGZG6NnXNGw==
Received: from [100.113.7.62] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-4.bemta.az-b.eu-central-1.aws.symcld.net id 68/CD-09058-9A672916;
 Mon, 15 Nov 2021 15:03:05 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrAIsWRWlGSWpSXmKPExsViZ8ORqLuybFK
  iwYY2UYs7P9+xOzB6nNu4gjGAMYo1My8pvyKBNWNy42OWgtUcFfP3LWBrYNzG3sXIxSEk8JhR
  Yt/RCawQznkmiRlfbgNlOIGcE4wSH6+HgdhsAmoS02/dACri4BAR0JO4+k8UJMwsoCLx4ncPW
  LmwgIXEhdO3mEBsFgFViTPTj4LZvAJOEus6N7CC2BICChJTHr5nhogLSpyc+YQFYo6ExMEXL5
  ghahQlZl9uZoGwKyRmzWpjgrDVJK6e28Q8gZF/FpL2WUjaFzAyrWK0TCrKTM8oyU3MzNE1NDD
  QNTQ01jXXNTI21Eus0k3SSy3VTU7NKylKBMrqJZYX6xVX5ibnpOjlpZZsYgQGZEoh+/MdjKve
  fNA7xCjJwaQkyvtHf1KiEF9SfkplRmJxRnxRaU5q8SFGGQ4OJQne3aVAOcGi1PTUirTMHGB0w
  KQlOHiURHgNioHSvMUFibnFmekQqVOMilLivNNA+gRAEhmleXBtsIi8xCgrJczLyMDAIMRTkF
  qUm1mCKv+KUZyDUUmYNwBkPE9mXgnc9FdAi5mAFtvf6wdZXJKIkJJqYBIt/bd3Tmdwfs6Fk9c
  D9tx7xOD1bVe+gAtP51beI5/Co7oVfvRv576cVK/cs7Vkn7HJV6fFW7Sc6rqil7zZ8bpUas20
  ZznSXx8bxH8/GsWj6nb74IdJV65e3Gg9OWhC+X2N3u9dN1naA1R6KyblCSoq3T4baHiCoX5+6
  ku9xdtrpfct7WZzy/m94z7f1KYblaw/LdRZEm7f/XFi85db8c734k2dNuwUvO5nG+L9leHj+d
  kpCxTq5MXPBx9mnFvjXBGgvTi3pPz9kSJVkazJ9h/UeHb7L+fN4/FUnZI/Mygq/xpz0qF5fxx
  WWU9TMn65L++WQGnizoMZK3N8W98dquGf+udo7+O087EdrtFMU5RYijMSDbWYi4oTAfMhVIdD
  AwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-19.tower-245.messagelabs.com!1636988585!209145!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 18292 invoked from network); 15 Nov 2021 15:03:05 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-19.tower-245.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 15 Nov 2021 15:03:05 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id CFCD9100232
	for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Nov 2021 15:03:04 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id C3E87100225
	for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Nov 2021 15:03:04 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.24; Mon, 15 Nov 2021 15:02:49 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] ethtool: upgrade 5.14 -> 5.15
Date: Mon, 15 Nov 2021 23:02:33 +0800
Message-ID: <1636988556-78653-1-git-send-email-wangmy@fujitsu.com>
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
 <openembedded-core@lists.openembedded.org>; Mon, 15 Nov 2021 15:03:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158295

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../ethtool/{ethtool_5.14.bb => ethtool_5.15.bb}                | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/ethtool/{ethtool_5.14.bb => ethtool_5.15.bb} (93%)

diff --git a/meta/recipes-extended/ethtool/ethtool_5.14.bb b/meta/recipes-extended/ethtool/ethtool_5.15.bb
similarity index 93%
rename from meta/recipes-extended/ethtool/ethtool_5.14.bb
rename to meta/recipes-extended/ethtool/ethtool_5.15.bb
index 28a49f4f8a..4192dec300 100644
--- a/meta/recipes-extended/ethtool/ethtool_5.14.bb
+++ b/meta/recipes-extended/ethtool/ethtool_5.15.bb
@@ -11,7 +11,7 @@ SRC_URI = "${KERNELORG_MIRROR}/software/network/ethtool/ethtool-${PV}.tar.gz \
            file://avoid_parallel_tests.patch \
            "
 
-SRC_URI[sha256sum] = "9868604c913e5483000c00d5dcb2bb3169a05252de47f62174702ff19cf6de7a"
+SRC_URI[sha256sum] = "a6a1638192209269ca74a29d73903f28531ebdf0794f3e0bdfdbdee2dc75d98b"
 
 UPSTREAM_CHECK_URI = "https://www.kernel.org/pub/software/network/ethtool/"
 
-- 
2.25.1


