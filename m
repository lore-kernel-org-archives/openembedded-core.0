Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18DC7C77B61
	for <webhook@archiver.kernel.org>; Mon, 10 Apr 2023 09:34:59 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.1])
 by mx.groups.io with SMTP id smtpd.web11.40199.1681119292895915147
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Apr 2023 02:34:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=ZW/y7vwt;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.1, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1681119290; i=@fujitsu.com;
	bh=wDUgJGrDe/brPbQ6oelZfkEivWTm2ygboL6lMbvmZNo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=ZW/y7vwtf+ejZ/gY8MOpwxr+fX/l8g11ulMSK0PCJLkpeJsf+5q8sp/L2rYhXCybo
	 aROeR/5P556HyUkCpQWIHSpG9Z4d/q+NV4FPRqbQzlY6bHNXaSpMVmcvpEbMy4wYJ4
	 i0fmwe2GQvXt0/HIgdLFLBvrWkyCvD1g5mf1hk1SPCOuy2KdkD6Oc/sMd6xYj5KcTB
	 oJllRHbPGXt8puYT0UAxRIEAFLVWC8kmWH3qgCpfit557TCZresPYK0J0pmkL0YM5y
	 a8FOb8XL24HfAcmjadPL1KVfAJc+Z5Mw0gmL91SEi4bmmZtNfnIkfYEG0gRJqjYqf9
	 inlW+dTpNDcGA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrOIsWRWlGSWpSXmKPExsViZ8MxSdfqhnG
  KwYY33BZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8bZKR3sBbv4K3ZsfcPawDiLt4uRi0NI4DGj
  xJFN61kgnGtMEnsa+9khnD2MEpd3bGTqYuTkYBOQkrhx/z9bFyMHh4iAnsTVf6IgYWYBFYkXv
  3vYQWxhAUuJL+s6wMpZBFQlvux8ywhi8wo4Sbx7MI0NxJYQUJCY8vA9M4jNKeAsce/9MVYQWw
  ioZueUF+wQ9YISJ2c+YYGYLyFx8MULZoheRYnZl5tZIOwKicbph5ggbDWJq+c2MU9gFJyFpH0
  WkvYFjEyrGM2LU4vKUot0Dc30kooy0zNKchMzc/QSq3QT9VJLdfPyi0oydA31EsuL9VKLi/WK
  K3OTc1L08lJLNjECwzelOM18B+Oxvr96hxglOZiURHm7uIxThPiS8lMqMxKLM+KLSnNSiw8xy
  nBwKEnwMlwGygkWpaanVqRl5gBjCSYtwcGjJMIrcQ0ozVtckJhbnJkOkTrFqCglzstxHighAJ
  LIKM2Da4PF7yVGWSlhXkYGBgYhnoLUotzMElT5V4ziHIxKwrxnLgJN4cnMK4Gb/gpoMRPQYi4
  XA5DFJYkIKakGJlmbUtnwFivz/spoxyUvixf8qvz/fOKc8AOHeC2aGpYytrfwZS+Ri1UXeq9/
  LklB+nWu3ILvsX3u30xeLtq2U3hdlmltzoYp4rIPVMu+d9X69d+SXFbgKR6u/3bKY7PUtRYWu
  209w8WSrn2WvX9f2KDphurHhMPyDXv2G1vr3gi/k/l1+Wo3/UPy3zPuLD21cqaJRFHIx0Sv1C
  UbLN9/OODHVVh2XlMyb9bTh2umCOs+nrJww6m/y8Xj80y2VO3w+OFyKCbAZz9f7RmVkuk/Sgy
  t6uIvOPhqFN2O5Ys95H5B1+xZdlSzyrfPIVcvm7Rxzdz48ZrEsTDxsB28xn0nPB3kDm4/veB4
  gxjbjjmvlViKMxINtZiLihMBGG3PnFoDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-26.tower-745.messagelabs.com!1681119289!192135!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 23419 invoked from network); 10 Apr 2023 09:34:50 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-26.tower-745.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 10 Apr 2023 09:34:50 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 9E847100323
	for <openembedded-core@lists.openembedded.org>; Mon, 10 Apr 2023 10:34:49 +0100 (BST)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 923441000EE
	for <openembedded-core@lists.openembedded.org>; Mon, 10 Apr 2023 10:34:49 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 10 Apr 2023 10:34:48 +0100
From: <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] vala: upgrade 0.56.4 -> 0.56.6
Date: Mon, 10 Apr 2023 17:34:16 +0800
Message-ID: <1681119256-25106-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1681119256-25106-1-git-send-email-wangmy@fujitsu.com>
References: <1681119256-25106-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Apr 2023 09:34:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179872

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
 * Regression fix:
  - vala: Improve initialization of namespace fields with compound
    literal [#1424]

 * Bindings:
  - gio-2.0,glib-2.0,gobject-2.0: Update 2.74 symbols
  - webkit2gtk-4.*: Update to 2.40.0
  - webkitgtk-6.0: Update to 2.40.0
  - gtk4: Update to 4.10.1~40b154bf from 0.58
  - gtk4: Add sealed to all the final types
  - gtk+-3.0: Fix ToolPalette.icon_size get-accessor type
  - webkitgtk-6.0: Update to 2.39.90

 * Various improvements and bug fixes:
  - codegen:
    + Consistently handle GLib.Error as boxed type [#1418]
    + Add cast to accessor calls for generic property implementations
    + Use g_object_class_override_property to implement generic interface
      properties [#1419]
    + Add declaration for register call of dynamic DBus interfaces [#1422]
  - vala:
    + Correctly handle pre/post-increment expression as index of element
      access [#1417]
    + Set proper value-type of unary ref/out expression in initializers [#1421]
    + Allow assignment of namespace fields with inline allocated arrays
  - gtkmodule: Improve error messages

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-devtools/vala/{vala_0.56.4.bb => vala_0.56.6.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/vala/{vala_0.56.4.bb => vala_0.56.6.bb} (18%)

diff --git a/meta/recipes-devtools/vala/vala_0.56.4.bb b/meta/recipes-devtools/vala/vala_0.56.6.bb
similarity index 18%
rename from meta/recipes-devtools/vala/vala_0.56.4.bb
rename to meta/recipes-devtools/vala/vala_0.56.6.bb
index 32fa81a08b..bc5f5477d7 100644
--- a/meta/recipes-devtools/vala/vala_0.56.4.bb
+++ b/meta/recipes-devtools/vala/vala_0.56.6.bb
@@ -1,3 +1,3 @@
 require ${BPN}.inc
 
-SRC_URI[sha256sum] = "862c41d938543ed3d8d86c8219a61087797193defee8da0c50caf49993c66b6a"
+SRC_URI[sha256sum] = "050e841cbfe2b8e7d0fb350c9506bd7557be1cd86a90c896765f1a09a1870013"
-- 
2.34.1


