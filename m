Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63042C00140
	for <webhook@archiver.kernel.org>; Wed, 24 Aug 2022 08:47:01 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.2])
 by mx.groups.io with SMTP id smtpd.web10.8725.1661330809728338675
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Aug 2022 01:46:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=Ud/QP7yE;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.2,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1661330808; i=@fujitsu.com;
	bh=TBT9Dl37vPilxd/uO4BxcQJUuR80+ixCK8iYTwqtc+g=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=Ud/QP7yE1HPo6KHMneGwM+PQXLZlVNizD75SCMB1Bwny2SlktaX5sK7K4pSQztscd
	 NqBt+fa82Mdu+eWY2lZauoTWlQQeACf81d5+W9IIK8CrodWGAqbg7xkiDTDZn30/Nz
	 NiSswWnTdnCk/idS5ja4G0eYn2BYzgjQm9NZ6MHiiIDbGI/GpNaPgwxDrKI32d/Mre
	 nKZXkeKnrVF/5AXaF/TdrJEZUIihhcpPH2+BjxjX5m0to8F1MUz3ijrWqUMbrcQAHa
	 7kjeyqNlLeMrVZUKQU3vuQrqykxYwWZDCrNYcrLsr0x6tnUrCJWi5MK320UFycoHAP
	 pn4Sue76X2/9Q==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrEIsWRWlGSWpSXmKPExsViZ8OxWbf8KWu
  ywZoWTYs7P9+xOzB6nNu4gjGAMYo1My8pvyKBNePRwwVMBY85Knbc3MvWwHiLvYuRi0NI4AGj
  xLQHU1ghnCtMEpcXdkA5exklnrYtZOxi5ORgE1CTmH7rBlCCg0NEQE/i6j9RkDCzgIrEi9897
  CC2sICNxIeXv5hAbBYBVYmfW3+ygNi8Ak4SK6ZtAKuREFCQmPLwPTOIzSngLLHt0BGwuBBQTU
  dbD1S9oMTJmU9YIOZLSBx88YIZoldRYvblZhYIu1Jiz6x+JghbTeLquU3MExgFZyFpn4WkfQE
  j0ypGq6SizPSMktzEzBxdQwMDXUNDU11jXUNLS73EKt1EvdRS3fLU4hJdQ73E8mK91OJiveLK
  3OScFL281JJNjMAgTilmPr6DcUrfT71DjJIcTEqivDfPsCYL8SXlp1RmJBZnxBeV5qQWH2KU4
  eBQkuAVeAKUEyxKTU+tSMvMAUYUTFqCg0dJhFcCpJW3uCAxtzgzHSJ1itGSY+rsf/uZOZaDyZ
  lf2w4wC7Hk5eelSonzpj4CahAAacgozYMbB4v6S4yyUsK8jAwMDEI8BalFuZklqPKvGMU5GJW
  Eebc8AJrCk5lXArf1FdBBTEAHBe1mBjmoJBEhJdXAFKCleUE3pC+q6eTbUzqFnxX/LYuNLk/h
  n8W18cWSNn0/8/1FDYfeLRTfuGx+18LL8su2bJJK0rm7TVLjBdenCWfuHw/PqrvfZaP089p96
  WfcdnN+2DgaX955Xe1o3b8bz6sqr/28xzqXv+gAnw9Tc29AdQYTX8/kvZYeBcFzlFwmM75wWS
  /2+w67X+WtqcV6nt8Xe7Hw2sSmbn346ffi05Nd0p/FPax7+Cyk0iXyQG3JpyW7vzY+1eJ4HzX
  xv7e10ZGPp5ezcr3xfusx6X6T6PEt81+vVd198HRKdujupYf2izQGVSxbJ3ntqdSVg++ua/Na
  OB5sq1zvIVX9yPX5r7atfL+XZ0/kjiz4Jti6lUeJpTgj0VCLuag4EQDy3TyZdQMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-19.tower-587.messagelabs.com!1661330807!131605!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 25935 invoked from network); 24 Aug 2022 08:46:47 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-19.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 24 Aug 2022 08:46:47 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 40D0E152
	for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Aug 2022 09:46:47 +0100 (BST)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223
 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 34C23150
	for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Aug 2022 09:46:47 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Wed, 24 Aug 2022 09:46:45 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] librepo: upgrade 1.14.3 -> 1.14.4
Date: Wed, 24 Aug 2022 16:46:16 +0800
Message-ID: <1661330777-13307-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1661330777-13307-1-git-send-email-wangmy@fujitsu.com>
References: <1661330777-13307-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Aug 2022 08:47:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169792

Changelog:
==========
    Use nanosec precision for timestamp of checksum cache
    Fix alloc/free mismatches and memory leaks

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../librepo/{librepo_1.14.3.bb => librepo_1.14.4.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/librepo/{librepo_1.14.3.bb => librepo_1.14.4.bb} (94%)

diff --git a/meta/recipes-devtools/librepo/librepo_1.14.3.bb b/meta/recipes-devtools/librepo/librepo_1.14.4.bb
similarity index 94%
rename from meta/recipes-devtools/librepo/librepo_1.14.3.bb
rename to meta/recipes-devtools/librepo/librepo_1.14.4.bb
index 2c8e592251..cdd9645298 100644
--- a/meta/recipes-devtools/librepo/librepo_1.14.3.bb
+++ b/meta/recipes-devtools/librepo/librepo_1.14.4.bb
@@ -10,7 +10,7 @@ SRC_URI = "git://github.com/rpm-software-management/librepo.git;branch=master;pr
            file://0004-Set-gpgme-variables-with-pkg-config-not-with-cmake-m.patch \
            "
 
-SRCREV = "8fc7950795282d9c7c50071f45973006de5594ab"
+SRCREV = "2bd1041c741c85bc196ca01dcca1eae6099eb742"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1


