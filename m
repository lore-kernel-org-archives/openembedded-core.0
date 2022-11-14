Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE565C433FE
	for <webhook@archiver.kernel.org>; Mon, 14 Nov 2022 03:27:06 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com [195.245.230.81])
 by mx.groups.io with SMTP id smtpd.web10.1809.1668396411239333947
 for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Nov 2022 19:26:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=FD/z5IC6;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.81, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1668396409; i=@fujitsu.com;
	bh=KTLOkYlAzoJUa0TCt2nsr2XvK89brXxhfbu0wHMvAmg=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=FD/z5IC6xWGWb8S2Z5BXGtRfBYlEjf/r4n56yDlZOTxchStjLULJEjip1qbh5ZfIL
	 ktGFd5R1pmdFXb+1/lrWDG8vyJ22EoP2LYbWeu+bD7DO7W47YShridHsoXEa3HDytm
	 NPZ01Bl9lLx5GgtY2xHQBPcPevmS4bFRGMfxS6qt2hhXBKl8A3SKV4UaiL51IRnAkT
	 6LBJpFQXFCODv4a7bc0rwAHXXIqRUmUL8yEUDH2kmHoex2ttKD4btNc2nDzaDG3jhE
	 7PdEXrIvXvSHAje3lGRDRKaDsgZYI/xMYCJ5upKEjDXCD53E+m6tcjX+dpwhNL6LWw
	 5rPpfV4KvcZvg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrPIsWRWlGSWpSXmKPExsViZ8ORqFuxtTD
  Z4NA7OYs7P9+xOzB6nNu4gjGAMYo1My8pvyKBNeP6lV7Wgg7OisdTL7A2MK7k6GLk4hASeMwo
  8X/XBEYI5xqTxIvv79ghnD2MElt7NrF0MXJysAlISdy4/5+ti5GDQ0RAT+LqP1GQMLOAisSL3
  z3sILawgK1E7715TCAlLAKqEqf/qYGEeQWcJLY+3MUMYksIKEhMefieGSIuKHFy5hMWiDESEg
  dfvICqUZSYfbmZBcKukJg1q40JwlaTuHpuE/MERv5ZSNpnIWlfwMi0itGsOLWoLLVI19BUL6k
  oMz2jJDcxM0cvsUo3US+1VLc8tbhE11AvsbxYL7W4WK+4Mjc5J0UvL7VkEyMwFFOK2Yt3MD5Y
  9kfvEKMkB5OSKC//+sJkIb6k/JTKjMTijPii0pzU4kOMMhwcShK8FzYD5QSLUtNTK9Iyc4BxA
  ZOW4OBREuEt3QSU5i0uSMwtzkyHSJ1iNOZY23BgLzPHzK9tB5iFWPLy81KlxHlXgEwSACnNKM
  2DGwSL10uMslLCvIwMDAxCPAWpRbmZJajyrxjFORiVhHnvgCzkycwrgdv3CugUJqBTvkfmgZx
  SkoiQkmpgEutpZinRZz79TuFA3umD0+yPP6/Zc2itSfL1AqavLgd0HFInsHt0pa5bOTnff4Fz
  0aOJvfFn/Z8c9Sxk4ru/RyR2iQm76qQDwVkuUbqfr1v/n6u6yEDykyHH0gnZW9jZ0+4K+DoZf
  64W3BzBo/o86f6PPkHu2HT9HvMMhTuv+wtVJ+z8tMF1XltjwDXThK75chbinAyeMwrfbd9jP/
  G57//Laj6JRmZWJt9+MX+c6GXStr4wbGKNwJeEuXP+TjwWsTHtjRLbpu37Zvnev++6qU5Eyff
  qpM1e/V909oYsdul/laKj/ffPhKUFx9sOJBb8yM9IquJ6GZhgeq0v/oXgVGOrUPkTs33ll01f
  +yREiaU4I9FQi7moOBEAQOcjk1IDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-10.tower-585.messagelabs.com!1668396408!172080!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.100.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 32709 invoked from network); 14 Nov 2022 03:26:48 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-10.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 14 Nov 2022 03:26:48 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 21A44100194
	for <openembedded-core@lists.openembedded.org>; Mon, 14 Nov 2022 03:26:48 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 151F8100182
	for <openembedded-core@lists.openembedded.org>; Mon, 14 Nov 2022 03:26:48 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 14 Nov 2022 03:26:46 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] xwayland: upgrade 22.1.4 -> 22.1.5
Date: Mon, 14 Nov 2022 11:26:30 +0800
Message-ID: <1668396390-24168-1-git-send-email-wangmy@fujitsu.com>
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
 <openembedded-core@lists.openembedded.org>; Mon, 14 Nov 2022 03:27:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173222

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../xwayland/{xwayland_22.1.4.bb => xwayland_22.1.5.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xwayland/{xwayland_22.1.4.bb => xwayland_22.1.5.bb} (95%)

diff --git a/meta/recipes-graphics/xwayland/xwayland_22.1.4.bb b/meta/recipes-graphics/xwayland/xwayland_22.1.5.bb
similarity index 95%
rename from meta/recipes-graphics/xwayland/xwayland_22.1.4.bb
rename to meta/recipes-graphics/xwayland/xwayland_22.1.5.bb
index 8597d07a7d..c1c5407dee 100644
--- a/meta/recipes-graphics/xwayland/xwayland_22.1.4.bb
+++ b/meta/recipes-graphics/xwayland/xwayland_22.1.5.bb
@@ -10,7 +10,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=5df87950af51ac2c5822094553ea1880"
 
 SRC_URI = "https://www.x.org/archive/individual/xserver/xwayland-${PV}.tar.xz"
-SRC_URI[sha256sum] = "5c39bdd77444c3fa7a0e2ef317ae69ddde89a901dc8914dbc8eac39a9313512a"
+SRC_URI[sha256sum] = "e317ac1f119f8321654921761420901e4abd95585a8c763ce26af3b045ac1672"
 
 UPSTREAM_CHECK_REGEX = "xwayland-(?P<pver>\d+(\.(?!90\d)\d+)+)\.tar"
 
-- 
2.25.1


