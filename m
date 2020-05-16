Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web11.4079.1589589954422811259
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 May 2020 17:45:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=tCWzbl1s;
 spf=pass (domain: gmail.com, ip: 209.85.221.49, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f49.google.com with SMTP id l18so5424494wrn.6
        for <openembedded-core@lists.openembedded.org>; Fri, 15 May 2020 17:45:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=iusHApODF7KvZIyatJF3KtlIxdAF+3yypyoODzj7+Bg=;
        b=tCWzbl1sppdarh+UsT6F8WbAtuUqeElvSyLmUT3tXHthlsL5EyyXFxp2YZDdnlE0HY
         rELv4EXXrI/zvJ3rDaJIUx1lQAAiN6mSIOTOz7cXbR08nPa+bgZF64FSxpm44IkOK5wT
         2VZ4y3ydQnUwXEq1PyKYfRrux2cjMwBQfMTPRLsi+WtPtNJPrkikLZy1pYxk1no5jBTD
         5yIYagIfE9Mqqc1enJrIuK3kxOMDNb7imiLK10OgorUzhsjar2iE2Of1oCo84GZxb97F
         WqrG2wj6nz6husf/pNMUO70NEJE8ROlWjkMRSw0+HbQ8PmUkVBHk4B70oc2zkarTWsqN
         qx0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=iusHApODF7KvZIyatJF3KtlIxdAF+3yypyoODzj7+Bg=;
        b=HWfwDzp+5QvU0LKtCRJJJ9qgSyBvH5P7ueuIT5KbmFnZOK+RDjKGaWydgsC/QrTiOS
         DTzuCna8xJpJD8tUnYNr4baVN3Tl0E6HCTfKgbiSLm+22zqNVb+dJMkDAIAM2FAxt83T
         5EgNS6JZPC2BO/nnChqsEF3aEwW/xjd042fXy0Sgop/dphP2ugC4tF43A6O4g77MzQld
         aQoxYmlIqo3Orlxa+jjd4MWK6S8Hw9lAa2rmMTxrVtbVM6YeGdnr6yrWB4uebyXhvuxK
         W+v5VUXUAEsn7IEVI91Mr2lQqrDM1yFYxkKJe48w5RNzzPLGxm304RSJvFsEaYxOd2/p
         85kA==
X-Gm-Message-State: AOAM530C1jsVYZuxIM2IPx7WuGUydk1jTrREpQiuz3YuFsaVomfF1OUG
	3f8EJP9Jj5clj/7diq6ubEPdXpB7
X-Google-Smtp-Source: ABdhPJwz3Grv24SjuBhZdRa3TTQYIIzoE+PXw3V2YoaEZiyhKmwtiekRWfBeWcqSFoeUIBL42b2qnA==
X-Received: by 2002:adf:afdb:: with SMTP id y27mr6692763wrd.323.1589589952620;
        Fri, 15 May 2020 17:45:52 -0700 (PDT)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost ([109.238.218.228])
        by smtp.gmail.com with ESMTPSA id j1sm5830451wrm.40.2020.05.15.17.45.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2020 17:45:51 -0700 (PDT)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [PATCH 1/2] libsecret: inherit features_check
Date: Sat, 16 May 2020 02:45:44 +0200
Message-Id: <20200516004545.3193719-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

* otherwise REQUIRED_DISTRO_FEATURES doesn't do anything

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-gnome/libsecret/libsecret_0.20.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-gnome/libsecret/libsecret_0.20.3.bb b/meta/recipes-gnome/libsecret/libsecret_0.20.3.bb
index d3a0c2ff54..8d317c8efc 100644
--- a/meta/recipes-gnome/libsecret/libsecret_0.20.3.bb
+++ b/meta/recipes-gnome/libsecret/libsecret_0.20.3.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=23c2a5e0106b99d75238986559bb5fc6"
 
 GNOMEBASEBUILDCLASS = "meson"
 
-inherit gnomebase gtk-doc vala gobject-introspection manpages
+inherit gnomebase gtk-doc vala gobject-introspection manpages features_check
 
 DEPENDS += "glib-2.0 libgcrypt gettext-native"
 
-- 
2.25.1

