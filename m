Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web11.5980.1622797842987179857
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Jun 2021 02:10:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Z9bjYlHB;
 spf=pass (domain: gmail.com, ip: 209.85.218.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f54.google.com with SMTP id a11so12708565ejf.3
        for <openembedded-core@lists.openembedded.org>; Fri, 04 Jun 2021 02:10:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=L6jtloCXjKqCyqjL4cWh07+j2z3iburVxtCOi7I0vOo=;
        b=Z9bjYlHBYmp1mvu0AsZbNTNYkglvQ+uP/CA0H2lR+nNwx0A2zAZNDVLTWFICTCTCNg
         A87i+eAV60dnMJ70jtDxCMO0Pi+fbL0JWHyHFoUsM6woEZjMrSXimARVMhMMEkE1edF5
         SshBcPAzNvHnLw/GJ0pvktbFz4F2cukQXqgjLfRagKHR4ck/TffDUhMBizSNknWMx71J
         gjjFsvyp/2j2N153abkOZKhtwJaxfmneFlpf2vVxDUnSckIAAlcgjsHoiFf7gabul6Dp
         esvzD2CbI/W7e8sHB6i3ZqtytdZhi8UUbuF4GO5kjZZWwPoObS/fbL/1+rKsqG8I/L6e
         xylg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=L6jtloCXjKqCyqjL4cWh07+j2z3iburVxtCOi7I0vOo=;
        b=f9YxYH0jtNo337+OJEt5pRuQjsX5/AApFK1ruKx1tkaR1TM/afYaevZRjD1vo54wh1
         +WX4QwCelFuKQ9YFHbKCFs6OVjbzCLiG//dwjw0R4MuGUDIFXYjzMOLswXSpgIV/N3lg
         Xtjg4ex47DD0QRW832pZKlpJu5eegTRDb/+vE811URNrHOMNAcp9h4Z+84s36rW+EI4r
         nnMkX7NFdF8i51hmqM4qiYaFzRQOq8eRgyc7TvSccxB3AI+2t3T8uOZCDpBoN53vTsLL
         0dCVTnzLn8xnT9AbwwkaDKjRi+sb4FhjbV8Y5KII65Ckw8wfLYMo/uQJpfciSblqVszD
         FHTw==
X-Gm-Message-State: AOAM530hgQJzCocmObq7zURmtQz6lqi4r1wMoyMnGtLRK7SLNerbO9QP
	tMvmhMmluNJ+FhrIfqqduIQHpCMQdXkpnQ==
X-Google-Smtp-Source: ABdhPJxuW5bo2q1TnnlfHZGz9OOXPUGEp0AjPYfabYsoLOdR0VScvdgdF/KjRGNwleVr9HkBkmrPGQ==
X-Received: by 2002:a17:907:20dc:: with SMTP id qq28mr3260659ejb.440.1622797841637;
        Fri, 04 Jun 2021 02:10:41 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id f7sm2525152ejz.95.2021.06.04.02.10.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jun 2021 02:10:41 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 09/11] xf86-input-libinput: update 0.30.0 -> 1.0.1
Date: Fri,  4 Jun 2021 11:10:28 +0200
Message-Id: <20210604091030.1380877-9-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210604091030.1380877-1-alex.kanavin@gmail.com>
References: <20210604091030.1380877-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

License-Update: formatting

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../xorg-driver/xf86-input-libinput_0.30.0.bb         | 11 -----------
 .../xorg-driver/xf86-input-libinput_1.0.1.bb          | 10 ++++++++++
 2 files changed, 10 insertions(+), 11 deletions(-)
 delete mode 100644 meta/recipes-graphics/xorg-driver/xf86-input-libinput_0.30.0.bb
 create mode 100644 meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.0.1.bb

diff --git a/meta/recipes-graphics/xorg-driver/xf86-input-libinput_0.30.0.bb b/meta/recipes-graphics/xorg-driver/xf86-input-libinput_0.30.0.bb
deleted file mode 100644
index d02988caa4..0000000000
--- a/meta/recipes-graphics/xorg-driver/xf86-input-libinput_0.30.0.bb
+++ /dev/null
@@ -1,11 +0,0 @@
-require xorg-driver-input.inc
-
-SUMMARY = "Generic input driver for the X.Org server based on libinput"
-LIC_FILES_CHKSUM = "file://COPYING;md5=5e6b20ea2ef94a998145f0ea3f788ee0"
-
-DEPENDS += "libinput"
-
-SRC_URI[md5sum] = "11dcfa2cc39f790731a9545fcdeea717"
-SRC_URI[sha256sum] = "f9c7f9fd41ae14061e0e9c3bd45fa170e5e21027a2bc5810034e1e748db996c0"
-
-FILES_${PN} += "${datadir}/X11/xorg.conf.d"
diff --git a/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.0.1.bb b/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.0.1.bb
new file mode 100644
index 0000000000..8da47eaa43
--- /dev/null
+++ b/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.0.1.bb
@@ -0,0 +1,10 @@
+require xorg-driver-input.inc
+
+SUMMARY = "Generic input driver for the X.Org server based on libinput"
+LIC_FILES_CHKSUM = "file://COPYING;md5=a22925127bd3c827c384cedd23ed2309"
+
+DEPENDS += "libinput"
+
+SRC_URI[sha256sum] = "fddec49c115591918475155bf16aaf23017d7f814cee7823a0c11f867aca245b"
+
+FILES_${PN} += "${datadir}/X11/xorg.conf.d"
-- 
2.31.1

