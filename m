Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web08.106.1623267529272488872
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Jun 2021 12:38:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=R2kI/y4Z;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: luca.boccassi@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id m41-20020a05600c3b29b02901b9e5d74f02so1839274wms.3
        for <openembedded-core@lists.openembedded.org>; Wed, 09 Jun 2021 12:38:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=P8ZsCvsEbxgys/asKnNxpVmB+/hLeDgu+V85bnxL4ns=;
        b=R2kI/y4Z5N+ZO0vU/gvJpCWTQP+WYvQXUtH6gopzZmueJiT4pLMRHkmZHqTMxCUx7y
         0nfBOqpOEooCN2JsRMezS86o4E/hNd7SE6k8QFUoGL3stSWkh86HshusSaH/3SdkFe/O
         7kVVSCCXVYm+5wmOQvjpTIVGa3LCZxfdBkAmpstMV2RszeD8ZYhUug2l9yDIIMCooxeR
         1aS2hJPiA+NoDnvkFd0oNizsxhYGJiPSC/+s9KCMaVHfEnBOuV7N9IMernJwn5sRm24R
         NwdoRXqS3NbItCMjLnt/FFC0TlS7HYyIk/WPXeG2F/VXb63ZZCjlSly7Vnfi6gpRfaA4
         ysiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=P8ZsCvsEbxgys/asKnNxpVmB+/hLeDgu+V85bnxL4ns=;
        b=MES2yMrUuppPzWcjcfnifWTJy31ZXtf8OFRwNSJnyqD4q/qK5HnWcie8dS2XfwVX8Y
         P7lVcn7UMCyj8hK22Zaf/xFIH0x2bsqxD4GhHOrpvLpKZeVLzzR9GQgwtE7O2kjY4HeH
         UMy3W0JqdeGN1kYN8akGFl+V5wPduYqKwK3a/nzuQYk/TLFP600gQq+4vwZs98HTEup3
         4wYlGsN7TVvkQG4X8WPbFtP3v4p228+qiD9/JZ530aC5QffG3MD7uu6EzPzRKtXQ0aPg
         rCcIMNshYDw0nV2QTHpSiuDm2kGiD0IBINgzdgY7I9BmujuPH1mXMO4Vz2Wo5tDm/AbF
         dmUg==
X-Gm-Message-State: AOAM531qSVruDCbpA9o0EjCZY2N9whLGYVdzkk34S/3wW8Wauigt1QG4
	m3+dVbum1J74AgyrbahGgtxtd+AWCdGPjfqj
X-Google-Smtp-Source: ABdhPJxe7o1r5B3iw3RNSMTdYGfW/M9GNSy188z3nzegIRNOQZ1JiQKT2AN1FEU+09xOqXg3l7wx5Q==
X-Received: by 2002:a1c:98d0:: with SMTP id a199mr11503401wme.22.1623267527116;
        Wed, 09 Jun 2021 12:38:47 -0700 (PDT)
Return-Path: <luca.boccassi@gmail.com>
Received: from localhost ([137.220.125.106])
        by smtp.gmail.com with ESMTPSA id o6sm974955wre.73.2021.06.09.12.38.46
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jun 2021 12:38:46 -0700 (PDT)
From: "Luca Bocassi" <luca.boccassi@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] systemd: install new sysext tool via systemd-extra-utils
Date: Wed,  9 Jun 2021 20:38:45 +0100
Message-Id: <20210609193845.830625-1-luca.boccassi@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Luca Boccassi <luca.boccassi@microsoft.com>

New standalone (no new dependency) utility added in v248

Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
---
 meta/recipes-core/systemd/systemd_248.3.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/systemd/systemd_248.3.bb b/meta/recipes-core/systemd/systemd_248.3.bb
index 4e65656494..37607708f7 100644
--- a/meta/recipes-core/systemd/systemd_248.3.bb
+++ b/meta/recipes-core/systemd/systemd_248.3.bb
@@ -507,6 +507,7 @@ FILES_${PN}-extra-utils = "\
                         ${bindir}/systemd-cgls \
                         ${bindir}/systemd-cgtop \
                         ${bindir}/systemd-stdio-bridge \
+                        ${bindir}/systemd-sysext \
                         ${base_bindir}/systemd-ask-password \
                         ${base_bindir}/systemd-tty-ask-password-agent \
                         ${systemd_unitdir}/system/systemd-ask-password-console.path \
-- 
2.29.2

