Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4335C4332F
	for <webhook@archiver.kernel.org>; Tue, 22 Mar 2022 12:00:07 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.1])
 by mx.groups.io with SMTP id smtpd.web12.8839.1647950405855195659
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Mar 2022 05:00:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=NdrrCcte;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1647950404; i=@fujitsu.com;
	bh=MHaUfGX+csidBYOywYL4irVKq5/0pv/yxUKFcxxL3Rk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=NdrrCctea6yhH5bZsZctrWE0gEhNuRNnFU+jmlK+93H1qLfx+HjPIeFivjlX/9DSw
	 f1U/yaKUNDitCwSLGRjUKAyjYCyRs2BchRl3GS3+cCGV33oJtaxcnBvRdRQlas1ibA
	 6EqfzSClxOXbrBlqdKZGZk5G3UOzSVy4xsgqtHQr5wRpIUjOgiTn8fpFIcojuKd4yC
	 AwkB11WON6LplvffFKCOiW7bq3zTCt+WqkSI3c4hk1sXBKorwPsj6tGSgeysXQAgpU
	 N2moWa4XqJvqStdG2ZYHxxGYFqNZI8fDv4H/x7Gr9H8AmevJUbAeZvG39/2IxVzhA1
	 h1KP4r058/PWA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrJIsWRWlGSWpSXmKPExsViZ8ORqOu8yzL
  JYOlKQ4s7P9+xOzB6nNu4gjGAMYo1My8pvyKBNaN9222mgnaOij87DrM3MM5j72Lk5BASeMwo
  seMSZxcjF5B9nkniQ/tFZghnD6PE2Z1dzCBVbAJqEtNv3WDtYuTgEBHQk7j6TxQkzCygIvHid
  w/YIGEBG4nbcw4ygdgsAqoSM/pngtm8Ao4S/TtXg9kSAgoSUx6+BxvJKeAk0Xr6DjPEEY4ST2
  d+Z4GoF5Q4OfMJC8R8CYmDL14wQ/QqSsy+3MwCYVdIzJrVBjVTTeLquU3MExgFZyFpn4WkfQE
  j0ypGq6SizPSMktzEzBxdQwMDXUNDU11DXSMDY73EKt1EvdRS3fLU4hJdQ73E8mK91OJiveLK
  3OScFL281JJNjMAQTilmPL2DcVPfT71DjJIcTEqivOLLLZOE+JLyUyozEosz4otKc1KLDzHKc
  HAoSfCu3w6UEyxKTU+tSMvMAcYTTFqCg0dJhPfvBqA0b3FBYm5xZjpE6hSjopQ478sdQAkBkE
  RGaR5cGyyGLzHKSgnzMjIwMAjxFKQW5WaWoMq/YhTnYFQS5l0BMoUnM68EbvoroMVMQIv1Wc1
  AFpckIqSkGpjkCngktgo+Y/dLuhXIvsQsiiFmr7NP723N354XY/zOypoeF55scETpwoeUxJa5
  8zUfxTsU7f9qsfZH+t668y0/F368sv3kVAkzfrMOjeq/2YEzTbO1JT7Nu7HIoo9xRuzqxmOWV
  RMPLtwZmbEli1XlSbBuktnnvXkvFs04f2Z+A+e2fyp/pSVPHbtZvHTaNPVEIdcjrmJrG17+qC
  h+eyP0341Lxfe4JTXmxoeZnbyqdyXnTs80IeuYM1KdnsIcBUt9207erlYuOqEr2j/BdffVnEv
  MlYWatW5Od8QmLL3j23XJdq6i1ZqJZYsPXcmX/5f4dRm77clcTjnZMveWG8Jlkxlbm+Qer+19
  /0c9LUOJpTgj0VCLuag4EQAvyqviXAMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-4.tower-591.messagelabs.com!1647950403!298676!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.10; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 12877 invoked from network); 22 Mar 2022 12:00:03 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-4.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 22 Mar 2022 12:00:03 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 0908A100198
	for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Mar 2022 12:00:03 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id D20AD10018E
	for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Mar 2022 12:00:02 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 22 Mar 2022 11:59:48 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH v2] gnutls: upgrade 3.7.3 -> 3.7.4
Date: Tue, 22 Mar 2022 19:59:33 +0800
Message-ID: <1647950374-5921-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1647950374-5921-1-git-send-email-wangmy@fujitsu.com>
References: <1647950374-5921-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Mar 2022 12:00:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163550

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-support/gnutls/{gnutls_3.7.3.bb => gnutls_3.7.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/gnutls/{gnutls_3.7.3.bb => gnutls_3.7.4.bb} (96%)

diff --git a/meta/recipes-support/gnutls/gnutls_3.7.3.bb b/meta/recipes-support/gnutls/gnutls_3.7.4.bb
similarity index 96%
rename from meta/recipes-support/gnutls/gnutls_3.7.3.bb
rename to meta/recipes-support/gnutls/gnutls_3.7.4.bb
index ebabac1bd0..b34eb7f5f0 100644
--- a/meta/recipes-support/gnutls/gnutls_3.7.3.bb
+++ b/meta/recipes-support/gnutls/gnutls_3.7.4.bb
@@ -23,7 +23,7 @@ SRC_URI = "https://www.gnupg.org/ftp/gcrypt/gnutls/v${SHRT_VER}/gnutls-${PV}.tar
            file://arm_eabi.patch \
            "
 
-SRC_URI[sha256sum] = "fc59c43bc31ab20a6977ff083029277a31935b8355ce387b634fa433f8f6c49a"
+SRC_URI[sha256sum] = "e6adbebcfbc95867de01060d93c789938cf89cc1d1f6ef9ef661890f6217451f"
 
 inherit autotools texinfo pkgconfig gettext lib_package gtk-doc
 
-- 
2.25.1


