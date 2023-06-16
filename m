Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 102D1EB64DD
	for <webhook@archiver.kernel.org>; Fri, 16 Jun 2023 14:37:39 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web10.219.1686926258089919318
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Jun 2023 07:37:38 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=SOof+mxN;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.179, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-666e916b880so145652b3a.2
        for <openembedded-core@lists.openembedded.org>; Fri, 16 Jun 2023 07:37:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1686926257; x=1689518257;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1JquVlq+im7EhZ2Zfx/wrWvTgHz397+MVmxaVKUSQzI=;
        b=SOof+mxN3ycci8/YRTLeoV9xbE7DvOtXUsgKfbimLJ6DuCXZKKmg035DQQEYZnbKnK
         tUaqe2FJ/vtTIclbP7QUeCm0BykI9Du9jOEIHtHflPmrXEt7Zo6B+kkQqPui+zCQqMEJ
         zZAR5WX1DdcVSnSjN0Ilguzahbm4R2JHWC/hBN89YIeGatT+3ZSSEfrSdrxSehfIpnv1
         8xptprRIy3l1ZrWH/tZII1jWC3r+pFvPFVk3lGSFqpp9uPLyvytzP37RLs59OULrm16X
         unWhD33TVG5w//EvBmfZi7igjrbrrUktKvStgm8FSnEMkU4v2ESAaJAfWQ0vwgsXISSn
         Wv9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686926257; x=1689518257;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1JquVlq+im7EhZ2Zfx/wrWvTgHz397+MVmxaVKUSQzI=;
        b=c/zSKKsypuotSGb+6uBauonMrw3uit2rTAb+uksbSzCpGVIakvJwmaQC9MRuWITgWC
         4lp0UHkGzyIjlzus12YFRan7iaoC5kYvZhPtkwJI2FcsFV/mbJRWnn0FTLm7kSJ9a3eY
         OQ9IlfqR9/Oj2+6oY5tg6cWaF6RXNZfqK0k0FOrhmhFvlE0WMf6ucW2GPPwjIU3j1XjT
         mVEGh1QiGuAsccwbUIl3Wr8AtJ6O9pHARmSEZlEXdZ7Tep/VSuEt0wLVGL/cb1yBf8kJ
         zuk01r6k9eXiaFYZ2Kt4TlC5de6p414tweV7IHjvF0lTGDmH+BXQ483HvdSXMH23Eni9
         u7eg==
X-Gm-Message-State: AC+VfDxOyRpksQ543KdUlEG8RWa7+iOem4vr1ESgWsM7Z8cL3J+7t3ml
	tC9nj9dssld3pz5mYklupixfM2BNjjRLAjERzuE=
X-Google-Smtp-Source: ACHHUZ53Lb7WlG9rkjSa2hhTgB2dZ5oJI2+xjPpZhbPJTucasUFfhdTqM6cIB4flb0r3JJhR7ZGSLA==
X-Received: by 2002:a05:6a20:9381:b0:119:fffb:e37f with SMTP id x1-20020a056a20938100b00119fffbe37fmr2903032pzh.10.1686926256964;
        Fri, 16 Jun 2023 07:37:36 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id k21-20020a170902761500b001b03f208323sm15865547pll.64.2023.06.16.07.37.36
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jun 2023 07:37:36 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 09/24] libx11: remove unused patch and FILESEXTRAPATHS
Date: Fri, 16 Jun 2023 04:37:00 -1000
Message-Id: <b6ce931656c29e11ea65023ae6077a2870309020.1686925952.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1686925952.git.steve@sakoman.com>
References: <cover.1686925952.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Jun 2023 14:37:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183030

From: Martin Jansa <Martin.Jansa@gmail.com>

* 0001-fix-a-memory-leak-in-XRegisterIMInstantiateCallback.patch was removed
  from SRC_URI in:
  https://git.openembedded.org/openembedded-core/commit/?id=e13f651f73db0f26f4645447ab5fa17e36d1903b

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit ee37d9f05c047e1dd68e0cb47b809240d2f33835)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...ak-in-XRegisterIMInstantiateCallback.patch | 57 -------------------
 .../recipes-graphics/xorg-lib/libx11_1.8.4.bb |  6 +-
 2 files changed, 2 insertions(+), 61 deletions(-)
 delete mode 100644 meta/recipes-graphics/xorg-lib/libx11/0001-fix-a-memory-leak-in-XRegisterIMInstantiateCallback.patch

diff --git a/meta/recipes-graphics/xorg-lib/libx11/0001-fix-a-memory-leak-in-XRegisterIMInstantiateCallback.patch b/meta/recipes-graphics/xorg-lib/libx11/0001-fix-a-memory-leak-in-XRegisterIMInstantiateCallback.patch
deleted file mode 100644
index 722116c07e..0000000000
--- a/meta/recipes-graphics/xorg-lib/libx11/0001-fix-a-memory-leak-in-XRegisterIMInstantiateCallback.patch
+++ /dev/null
@@ -1,57 +0,0 @@
-CVE: CVE-2022-3554
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@arm.com>
-
-From 1d11822601fd24a396b354fa616b04ed3df8b4ef Mon Sep 17 00:00:00 2001
-From: "Thomas E. Dickey" <dickey@invisible-island.net>
-Date: Tue, 4 Oct 2022 18:26:17 -0400
-Subject: [PATCH] fix a memory leak in XRegisterIMInstantiateCallback
-
-Analysis:
-
-    _XimRegisterIMInstantiateCallback() opens an XIM and closes it using
-    the internal function pointers, but the internal close function does
-    not free the pointer to the XIM (this would be done in XCloseIM()).
-
-Report/patch:
-
-    Date: Mon, 03 Oct 2022 18:47:32 +0800
-    From: Po Lu <luangruo@yahoo.com>
-    To: xorg-devel@lists.x.org
-    Subject: Re: Yet another leak in Xlib
-
-    For reference, here's how I'm calling XRegisterIMInstantiateCallback:
-
-    XSetLocaleModifiers ("");
-    XRegisterIMInstantiateCallback (compositor.display,
-                                    XrmGetDatabase (compositor.display),
-                                    (char *) compositor.resource_name,
-                                    (char *) compositor.app_name,
-                                    IMInstantiateCallback, NULL);
-
-    and XMODIFIERS is:
-
-        @im=ibus
-
-Signed-off-by: Thomas E. Dickey <dickey@invisible-island.net>
----
- modules/im/ximcp/imInsClbk.c | 3 +++
- 1 file changed, 3 insertions(+)
-
-diff --git a/modules/im/ximcp/imInsClbk.c b/modules/im/ximcp/imInsClbk.c
-index 95b379cb..c10e347f 100644
---- a/modules/im/ximcp/imInsClbk.c
-+++ b/modules/im/ximcp/imInsClbk.c
-@@ -212,6 +212,9 @@ _XimRegisterIMInstantiateCallback(
-     if( xim ) {
- 	lock = True;
- 	xim->methods->close( (XIM)xim );
-+	/* XIMs must be freed manually after being opened; close just
-+	   does the protocol to deinitialize the IM.  */
-+	XFree( xim );
- 	lock = False;
- 	icb->call = True;
- 	callback( display, client_data, NULL );
--- 
-2.34.1
-
diff --git a/meta/recipes-graphics/xorg-lib/libx11_1.8.4.bb b/meta/recipes-graphics/xorg-lib/libx11_1.8.4.bb
index 7831b4986a..9058c1844e 100644
--- a/meta/recipes-graphics/xorg-lib/libx11_1.8.4.bb
+++ b/meta/recipes-graphics/xorg-lib/libx11_1.8.4.bb
@@ -18,14 +18,12 @@ DEPENDS += "xorgproto \
 
 PROVIDES = "virtual/libx11"
 
-FILESEXTRAPATHS =. "${FILE_DIRNAME}/libx11:"
-
 PE = "1"
 
 XORG_PN = "libX11"
 
-SRC_URI += "file://disable_tests.patch \
-            "
+SRC_URI += "file://disable_tests.patch"
+
 SRC_URI[sha256sum] = "c9a287a5aefa9804ce3cfafcf516fe96ed3f7e8e45c0e2ee59e84c86757df518"
 
 inherit gettext
-- 
2.34.1


