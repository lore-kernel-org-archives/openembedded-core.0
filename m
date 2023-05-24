Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC162C77B7A
	for <webhook@archiver.kernel.org>; Wed, 24 May 2023 07:53:33 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.web10.3713.1684914808822866289
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 May 2023 00:53:29 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=ah0J9oJt;
 spf=pass (domain: gmail.com, ip: 209.85.218.50, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-96fdc081cb3so82036266b.2
        for <openembedded-core@lists.openembedded.org>; Wed, 24 May 2023 00:53:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684914807; x=1687506807;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7O8lankDzPdzyAdOxXOOUIE2UiaSRzAcOuiDXYlms/A=;
        b=ah0J9oJtEcbo6aGi5pPqvuV13B1HxHJLmq5OM1O7bx47+ZrJoM0CKCIOtjOfd9mYKp
         yYzaQ4K7VZg0GRgH4FHj6AzncQLuW1QTwcNfU9D5yq90j2K1Uea87G3XItNLEhEAHsE4
         YcMs/70Ut/ehaCkFK9W5L8hcPjF+bzwK8AnymNUNi9PVumjCLRdhmHzPtdhUmD8My5Y8
         L/ZzFm1pUuRIDLDYvDKHP9kmxrP6r5UgnP0aIQKN4u7mhen72rEKIPdJr25UqDem0g0E
         Fy8oalllf4t6tLQKue1w4LTN3wUC3ZoCC/ufYTtb+CyU9gNQuScQ2SEnF4h+IQuiVVMN
         +alQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684914807; x=1687506807;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7O8lankDzPdzyAdOxXOOUIE2UiaSRzAcOuiDXYlms/A=;
        b=fepCwaeiWTLWMOfClFidTNWq0AiaupDGsPMEwu22XrHP/LNsVzEda050U3V44SXQT+
         PoQcgSmkoLk4nwpQ5e/MxnKKli/+Rj6H5b8cFxGTR/n0Olr+7h+jp2IrshH/XtSxW08L
         WV6YoBGFAWAOn41Dpnyc8hFl1zhS6imkk4/oOhSQs3VPJ4Ng8GLEJzeV4LxTIJkHptqs
         9Q35tChgMm5JDGWiW5/4lqLPe6hpxSI/3kArKWkbJk+h0tH/PcXBx76PzkqqmImyYtXy
         qk1SPNAkmkA5BXHerFkZvCfM6czWTCjn3TFBrHMZ8+oznnFLYrgfBrkRt5TR6mEsu0C9
         zIhA==
X-Gm-Message-State: AC+VfDyPWm6ie8qP9iIx0rTCDcPNx5Z4CMrcv54qREht64j1ylv0UPOT
	6QZhKroCUb4Qury0NNhIzOGQLv6lx9k=
X-Google-Smtp-Source: ACHHUZ5zf2ipdQr2rUazpV226lWXfsuvmu1O+23Xrtb2ILgiXQBTFbCDbvCxtsA3u9OkTDadIte+0Q==
X-Received: by 2002:a17:907:26ca:b0:962:46d7:c8fc with SMTP id bp10-20020a17090726ca00b0096246d7c8fcmr14620605ejc.21.1684914807296;
        Wed, 24 May 2023 00:53:27 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id mc20-20020a170906eb5400b0096f803afbe3sm5482544ejb.66.2023.05.24.00.53.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 May 2023 00:53:27 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [PATCH 2/6] qemu: remove unused qemu-7.0.0-glibc-2.36.patch
Date: Wed, 24 May 2023 09:53:16 +0200
Message-Id: <20230524075320.1086358-2-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230524075320.1086358-1-Martin.Jansa@gmail.com>
References: <20230524075320.1086358-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 May 2023 07:53:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181662

* it was removed from SRC_URI in:
  https://git.openembedded.org/openembedded-core/commit/?id=e94d182889ca3c02df913c59f0b66b228ffe588c

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../qemu/qemu/qemu-7.0.0-glibc-2.36.patch     | 46 -------------------
 1 file changed, 46 deletions(-)
 delete mode 100644 meta/recipes-devtools/qemu/qemu/qemu-7.0.0-glibc-2.36.patch

diff --git a/meta/recipes-devtools/qemu/qemu/qemu-7.0.0-glibc-2.36.patch b/meta/recipes-devtools/qemu/qemu/qemu-7.0.0-glibc-2.36.patch
deleted file mode 100644
index abad1cfeeb..0000000000
--- a/meta/recipes-devtools/qemu/qemu/qemu-7.0.0-glibc-2.36.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-Avoid conflicts between sys/mount.h and linux/mount.h that are seen
-with glibc 2.36
-
-Source: https://github.com/archlinux/svntogit-packages/blob/packages/qemu/trunk/qemu-7.0.0-glibc-2.36.patch
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
---- a/linux-user/syscall.c
-+++ b/linux-user/syscall.c
-@@ -95,7 +95,25 @@
- #include <linux/soundcard.h>
- #include <linux/kd.h>
- #include <linux/mtio.h>
-+
-+#ifdef HAVE_SYS_MOUNT_FSCONFIG
-+/*
-+ * glibc >= 2.36 linux/mount.h conflicts with sys/mount.h,
-+ * which in turn prevents use of linux/fs.h. So we have to
-+ * define the constants ourselves for now.
-+ */
-+#define FS_IOC_GETFLAGS                _IOR('f', 1, long)
-+#define FS_IOC_SETFLAGS                _IOW('f', 2, long)
-+#define FS_IOC_GETVERSION              _IOR('v', 1, long)
-+#define FS_IOC_SETVERSION              _IOW('v', 2, long)
-+#define FS_IOC_FIEMAP                  _IOWR('f', 11, struct fiemap)
-+#define FS_IOC32_GETFLAGS              _IOR('f', 1, int)
-+#define FS_IOC32_SETFLAGS              _IOW('f', 2, int)
-+#define FS_IOC32_GETVERSION            _IOR('v', 1, int)
-+#define FS_IOC32_SETVERSION            _IOW('v', 2, int)
-+#else
- #include <linux/fs.h>
-+#endif
- #include <linux/fd.h>
- #if defined(CONFIG_FIEMAP)
- #include <linux/fiemap.h>
---- a/meson.build
-+++ b/meson.build
-@@ -1686,6 +1686,8 @@ config_host_data.set('HAVE_OPTRESET',
-                      cc.has_header_symbol('getopt.h', 'optreset'))
- config_host_data.set('HAVE_IPPROTO_MPTCP',
-                      cc.has_header_symbol('netinet/in.h', 'IPPROTO_MPTCP'))
-+config_host_data.set('HAVE_SYS_MOUNT_FSCONFIG',
-+                     cc.has_header_symbol('sys/mount.h', 'FSCONFIG_SET_FLAG'))
- 
- # has_member
- config_host_data.set('HAVE_SIGEV_NOTIFY_THREAD_ID',
-- 
2.40.1


