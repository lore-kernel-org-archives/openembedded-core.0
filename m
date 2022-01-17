Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B188C433FE
	for <webhook@archiver.kernel.org>; Mon, 17 Jan 2022 14:32:32 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.3])
 by mx.groups.io with SMTP id smtpd.web12.11765.1642429942837873378
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Jan 2022 06:32:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=rSncZUIM;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.3,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1642429941; i=@fujitsu.com;
	bh=u1IKxNCnGGoMgySPthpaJee7rW/i90ip3wzmRa8HkTk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=rSncZUIMoSf61dEe6eyWZr6nncVfs+ofKEU8XYXGUqPrOZBzTc12q4ebebnTjCfCb
	 gxEu/fUG/zGmM8zUdELnyNRMcK5vVrDJANNQEko9r9ty3OYy9B8FwCqJw+WDlJ54xH
	 Oj5togryHYSKSywBluDdd8SyuRiVSn/Usvw3F5vvn01x2yHaego8qQWdQCdvPqlRtY
	 YQqUMJ+NC/p3oa1b3DSnhVq0mf9iZjioS1Ccr/LGZWq0XajLmrueG9zrXzX5KNScU0
	 zE/yZtc9OUe4u0y3F+zHP0vWOvVMLPqvElA+Rn85cglRK4aXzjRGJq9+ACBeqATLxH
	 kaIk4Y4oVDqPg==
Received: from [100.115.32.207] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-3.bemta.az-a.eu-west-2.aws.ess.symcld.net id CF/EE-09428-5FD75E16;
 Mon, 17 Jan 2022 14:32:21 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrFIsWRWlGSWpSXmKPExsViZ8ORqPul9mm
  iQfcBI4s7P9+xOzB6nNu4gjGAMYo1My8pvyKBNWPrzQWsBVt5Kz69vs7UwNjI08XIxSEk8JhR
  4ur7D8xdjJxAznkmifctfhCJE4wSO5sfgiXYBNQkpt+6wdrFyMEhIqAncfWfKEiYWUBF4sXvH
  nYQW1jAVuL3kYVsIDaLgKrEpNdTWUFsXgEnibcn1oDZEgIKElMevgcbySngLLH6xG1GiL1OEr
  uvLGWGqBeUODnzCQvEfAmJgy9eMEP0KkrMvtzMAmFXSMya1cYEYatJXD23iXkCo+AsJO2zkLQ
  vYGRaxWidVJSZnlGSm5iZo2toYKBraGiqa2ypa2RorJdYpZuol1qqW55aXKJrpJdYXqyXWlys
  V1yZm5yTopeXWrKJERjEKcXqV3cwbl71U+8QoyQHk5IoL2fY00QhvqT8lMqMxOKM+KLSnNTiQ
  4wyHBxKEry3a4BygkWp6akVaZk5wIiCSUtw8CiJ8GoDo0qIt7ggMbc4Mx0idYpRUUqclxkkIQ
  CSyCjNg2uDRfElRlkpYV5GBgYGIZ6C1KLczBJU+VeM4hyMSsK8mSBTeDLzSuCmvwJazAS0eNX
  HRyCLSxIRUlINTE22kSITp99aZOLaZb/v81a9+h6eV70LLgWtSeJ/fMPv0ovDubfSj7jrHZEV
  XldUoFYxhSnXadk7j6i4ELvu55m7GebsV/8p5vvuk+1aPc5neXcauzec+e3GKzfVfXHljojZ+
  ydvlPVjLW/b+S1rzYlVxyp5fRjZOT4ppL5jMhI8xVnydeInrqI6t9deET9DTa/cYVthukzsSs
  NzjnhbxsPVL98vUL3M9TF086K9J9SPrju3LoD5k36x15//dU6+bObJPz1LDfZ0zX4RIbeFYbl
  p89o/B1c+NtKXcYuZvyGUZcXmju/bV9+wmDg5JC7PUe559am1j61N57w8M0N61t6S7bfee58y
  0r/SY/kmuEKJpTgj0VCLuag4EQC5ZjA+XQMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-27.tower-548.messagelabs.com!1642429940!1218!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 29078 invoked from network); 17 Jan 2022 14:32:20 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-27.tower-548.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 17 Jan 2022 14:32:20 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 69DD310019A
	for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Jan 2022 14:32:20 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 5B49610018C
	for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Jan 2022 14:32:20 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.26; Mon, 17 Jan 2022 14:31:59 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] u-boot: upgrade 2021.10 -> 2022.01
Date: Mon, 17 Jan 2022 22:31:44 +0800
Message-ID: <1642429904-13928-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1642429904-13928-1-git-send-email-wangmy@fujitsu.com>
References: <1642429904-13928-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Jan 2022 14:32:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160651

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-bsp/u-boot/u-boot-common.inc                       | 2 +-
 .../u-boot/{u-boot-tools_2021.10.bb => u-boot-tools_2022.01.bb} | 1 +
 .../recipes-bsp/u-boot/{u-boot_2021.10.bb => u-boot_2022.01.bb} | 0
 3 files changed, 2 insertions(+), 1 deletion(-)
 rename meta/recipes-bsp/u-boot/{u-boot-tools_2021.10.bb => u-boot-tools_2022.01.bb} (98%)
 rename meta/recipes-bsp/u-boot/{u-boot_2021.10.bb => u-boot_2022.01.bb} (100%)

diff --git a/meta/recipes-bsp/u-boot/u-boot-common.inc b/meta/recipes-bsp/u-boot/u-boot-common.inc
index 5a3fc17ad1..c09b1c2876 100644
--- a/meta/recipes-bsp/u-boot/u-boot-common.inc
+++ b/meta/recipes-bsp/u-boot/u-boot-common.inc
@@ -12,7 +12,7 @@ PE = "1"
 
 # We use the revision in order to avoid having to fetch it from the
 # repo during parse
-SRCREV = "d80bb749fab53da72c4a0e09b8c2d2aaa3103c91"
+SRCREV = "d637294e264adfeb29f390dfc393106fd4d41b17"
 
 SRC_URI = "git://git.denx.de/u-boot.git;branch=master \
           "
diff --git a/meta/recipes-bsp/u-boot/u-boot-tools_2021.10.bb b/meta/recipes-bsp/u-boot/u-boot-tools_2022.01.bb
similarity index 98%
rename from meta/recipes-bsp/u-boot/u-boot-tools_2021.10.bb
rename to meta/recipes-bsp/u-boot/u-boot-tools_2022.01.bb
index 7eaf721ca8..ef386f76e6 100644
--- a/meta/recipes-bsp/u-boot/u-boot-tools_2021.10.bb
+++ b/meta/recipes-bsp/u-boot/u-boot-tools_2022.01.bb
@@ -1,2 +1,3 @@
 require u-boot-common.inc
 require u-boot-tools.inc
+
diff --git a/meta/recipes-bsp/u-boot/u-boot_2021.10.bb b/meta/recipes-bsp/u-boot/u-boot_2022.01.bb
similarity index 100%
rename from meta/recipes-bsp/u-boot/u-boot_2021.10.bb
rename to meta/recipes-bsp/u-boot/u-boot_2022.01.bb
-- 
2.25.1


