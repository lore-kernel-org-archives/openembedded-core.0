Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
 by mx.groups.io with SMTP id smtpd.web09.74172.1629400110560301176
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Aug 2021 12:08:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=gjqbjLQB;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.176, mailfrom: steve@sakoman.com)
Received: by mail-oi1-f176.google.com with SMTP id o185so9795212oih.13
        for <openembedded-core@lists.openembedded.org>; Thu, 19 Aug 2021 12:08:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=rV2PZZdUA+ptW5XRQ+7HqXLKuQyIAZapd1RcWJbS/SY=;
        b=gjqbjLQBcI0Mv5ZlTq4RsyL8aBfPzArooL6UY0g66wPb0iEc9TEEZkHjcCl/EbAe5g
         sNvkjG5f2yEXGdkO8PsSlzvZTGqV8Ahtg7v8UjAXg6C6ASDxI7Zqn5Ttzs9nuvx8YWF4
         IuOBqsy5Y0jgnv8l5FXca/wpEg88poIhqdaDfMDr0U+soDixV011JRDe+zIrMd3xNJOt
         bnwz/lbAJ1517pPgi69jjc46ZWNR8JyRgsHXjWDvw1CldHr0krpQ22hly+GRAMIwF3A6
         ty0MshTWfaT2e/taDAvloE4FAY1pKuL82TgZcb3RXnPtR/qcwm8XHkLbzI6VZwYKh5oi
         GCTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rV2PZZdUA+ptW5XRQ+7HqXLKuQyIAZapd1RcWJbS/SY=;
        b=BLclzKi0q1QSYm4SvtxkZfbrwRlA1NtBxp09RF2vaA4rgW4K836H/n1+HVXDdLYNun
         MyHkMmEnEPNJo8BQEYt9A+TNeJROeBfOPio5tYSqUnylWrZHImH+d+fz5PDgTgi+0keS
         SIQZey3tQEzct2cwaXyjk/hXO+/cxRmzOfi8AYDFyKgfNGaZ5O4YZqzfsztILVxzJeif
         c9GGlbayVASAYkR8iqBIqlcRRq/fmKS9m4M2gOD5F1ktyearkw/V5Ueao9BZJWu8BQzx
         4CqXIrXwQvviocuCT2NtfEYzf6CNHa4O4wKKNVBolrTv+kMH6tJhyeCNRn6nMKGMDiJ6
         SakQ==
X-Gm-Message-State: AOAM530mFOv0Ypw9meEShK/643f/QKzx0KrUxYfMNGdcoD+BM4pTx8jY
	rVN9XPnOr7YK55BQaeFF7PUUVF+F0YU2q/6d
X-Google-Smtp-Source: ABdhPJxW0ij45ge+6Es6l09mS5qRYo4cJqBkbcXVrpAkAOxaVKS9c95ePg0jSbxPmIdO69rxhBeJAA==
X-Received: by 2002:a05:6808:d53:: with SMTP id w19mr172330oik.135.1629400109413;
        Thu, 19 Aug 2021 12:08:29 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com ([172.243.4.16])
        by smtp.gmail.com with ESMTPSA id s10sm765080oog.14.2021.08.19.12.08.25
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Aug 2021 12:08:28 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 01/12] util-linux: fix CVE-2021-37600
Date: Thu, 19 Aug 2021 09:07:51 -1000
Message-Id: <f1b1627cac303f5f9c07fc0e8f959c0675b8f3a7.1629399953.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1629399953.git.steve@sakoman.com>
References: <cover.1629399953.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Dragos-Marian Panait <dragos.panait@windriver.com>

sys-utils/ipcutils: be careful when call calloc() for uint64 nmembs

Fix: #1395
Signed-off-by: Karel Zak <kzak@redhat.com>

CVE: CVE-2021-37600
Upstream-Status: Backport [1c9143d0c1f979c3daf10e1c37b5b1e916c22a1c]

Signed-off-by: Dragos-Marian Panait <dragos.panait@windriver.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 9822232b4abd811bb9c8562f98c0aefc748340a0)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../util-linux/CVE-2021-37600.patch           | 33 +++++++++++++++++++
 .../util-linux/util-linux_2.35.1.bb           |  1 +
 2 files changed, 34 insertions(+)
 create mode 100644 meta/recipes-core/util-linux/util-linux/CVE-2021-37600.patch

diff --git a/meta/recipes-core/util-linux/util-linux/CVE-2021-37600.patch b/meta/recipes-core/util-linux/util-linux/CVE-2021-37600.patch
new file mode 100644
index 0000000000..2b306c435b
--- /dev/null
+++ b/meta/recipes-core/util-linux/util-linux/CVE-2021-37600.patch
@@ -0,0 +1,33 @@
+From 1c9143d0c1f979c3daf10e1c37b5b1e916c22a1c Mon Sep 17 00:00:00 2001
+From: Karel Zak <kzak@redhat.com>
+Date: Tue, 27 Jul 2021 11:58:31 +0200
+Subject: [PATCH] sys-utils/ipcutils: be careful when call calloc() for uint64
+ nmembs
+
+Fix: https://github.com/karelzak/util-linux/issues/1395
+Signed-off-by: Karel Zak <kzak@redhat.com>
+
+CVE: CVE-2021-37600
+Upstream-Status: Backport [1c9143d0c1f979c3daf10e1c37b5b1e916c22a1c]
+
+Signed-off-by: Dragos-Marian Panait <dragos.panait@windriver.com>
+---
+ sys-utils/ipcutils.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/sys-utils/ipcutils.c b/sys-utils/ipcutils.c
+index e784c4dcb..18868cfd3 100644
+--- a/sys-utils/ipcutils.c
++++ b/sys-utils/ipcutils.c
+@@ -218,7 +218,7 @@ static void get_sem_elements(struct sem_data *p)
+ {
+ 	size_t i;
+ 
+-	if (!p || !p->sem_nsems || p->sem_perm.id < 0)
++	if (!p || !p->sem_nsems || p->sem_nsems > SIZE_MAX || p->sem_perm.id < 0)
+ 		return;
+ 
+ 	p->elements = xcalloc(p->sem_nsems, sizeof(struct sem_elem));
+-- 
+2.25.1
+
diff --git a/meta/recipes-core/util-linux/util-linux_2.35.1.bb b/meta/recipes-core/util-linux/util-linux_2.35.1.bb
index 516b783887..731f0618eb 100644
--- a/meta/recipes-core/util-linux/util-linux_2.35.1.bb
+++ b/meta/recipes-core/util-linux/util-linux_2.35.1.bb
@@ -11,6 +11,7 @@ SRC_URI += "file://configure-sbindir.patch \
             file://0001-libfdisk-script-accept-sector-size-ignore-unknown-he.patch \
             file://0001-kill-include-sys-types.h-before-checking-SYS_pidfd_s.patch \
             file://0001-include-cleanup-pidfd-inckudes.patch \
+            file://CVE-2021-37600.patch \
 "
 SRC_URI[md5sum] = "7f64882f631225f0295ca05080cee1bf"
 SRC_URI[sha256sum] = "d9de3edd287366cd908e77677514b9387b22bc7b88f45b83e1922c3597f1d7f9"
-- 
2.25.1

