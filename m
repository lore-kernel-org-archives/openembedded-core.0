Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC7BEC77B7C
	for <webhook@archiver.kernel.org>; Wed, 24 May 2023 07:53:33 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web11.3587.1684914808146347967
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 May 2023 00:53:28 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=c30nkhV5;
 spf=pass (domain: gmail.com, ip: 209.85.218.44, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-96aae59bbd6so91987666b.3
        for <openembedded-core@lists.openembedded.org>; Wed, 24 May 2023 00:53:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684914806; x=1687506806;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Fw/uSy5Lpt85o2/EvpGnHxyVdjd/arw/yWIWTVHo2MI=;
        b=c30nkhV5ssBU3CaRHCL8mrB4jdeTUleQbmpTYw/56Ku51fKSyFq2AYZLv/tsDQvHow
         SQvERot4xIkKA8bKj+R1tBrEovq9WJ2sPvrBXlDL+Z9s84K0305u/jJeq89mWktmVmSP
         hQs2rLIvK8D39kpzleRkerps0j8cAD8+bsp2gSMH6Jih6wIUdZdaxN/t8auZGlDOWWLC
         qqpAvM/+bSYr4RKraFcrjLntWGitqNGlTAD2e3umbveKBtVoZkl3dOkmSbVV7H0DwKlT
         F9dLOkH1SB0xCQqfus9G37Tz9yGrm/4ox/kGEzl/EsHhda89UuiC1UXuViMLHH89TrjU
         K7XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684914806; x=1687506806;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Fw/uSy5Lpt85o2/EvpGnHxyVdjd/arw/yWIWTVHo2MI=;
        b=GYvBTC+CklG98pPrkeLgps/wSR1OoiYEBGd0xqrPL27yBVjeP7VJDEXJ7Ow45LnAWL
         15VxfWFhGH7G6YhPGU1XtgAWAltJMM/+mn1Fof3jcJlDcmlGdCXBfAIqA7I4k7UKtQ2H
         dgzukieKpChS892aMZiqxTr/DvVanb8YJquJ2ghQnl8lYZdIyf/tVrZ1CJ2OLN7qMuex
         PlGE3s+ttUupsgN+SKg7OLXkBkIkcVKORkd5dAxJ+Sm5L7nNSOZSElXQaCR+NKfVvbzU
         KoIngq7EPKfOd8PkgVhS9xzUBNbx8ln2LwIiTntdFaUfOQWQOznbd8qIo8tVCzeRCKdQ
         te9Q==
X-Gm-Message-State: AC+VfDxIvqGYhFmi1YHR3DrKg5hUQQcy666fXyuXPMGAxvbo045QFQhb
	Uw/rFHh9vl9rOP1HxaSUIu6RMcGxfWU=
X-Google-Smtp-Source: ACHHUZ6yFMy6S+nE7m6JiSTxgwPrhp+SClF/CE0EsGkxRcFI8rI3q7z3sJjiAv3EWXPlNqH8IP51oQ==
X-Received: by 2002:a17:906:ee88:b0:94e:4489:f24d with SMTP id wt8-20020a170906ee8800b0094e4489f24dmr14243980ejb.61.1684914806567;
        Wed, 24 May 2023 00:53:26 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id rv25-20020a17090710d900b00965f6ad266bsm5408788ejb.119.2023.05.24.00.53.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 May 2023 00:53:26 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [PATCH 1/6] libx11: remove unused patch and FILESEXTRAPATHS
Date: Wed, 24 May 2023 09:53:15 +0200
Message-Id: <20230524075320.1086358-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 May 2023 07:53:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181661

* 0001-fix-a-memory-leak-in-XRegisterIMInstantiateCallback.patch was removed
  from SRC_URI in:
  https://git.openembedded.org/openembedded-core/commit/?id=e13f651f73db0f26f4645447ab5fa17e36d1903b

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
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
2.40.1


