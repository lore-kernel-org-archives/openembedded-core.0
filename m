Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
 by mx.groups.io with SMTP id smtpd.web08.31944.1607937050521172347
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Dec 2020 01:10:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=RCJsgQSJ;
 spf=pass (domain: gmail.com, ip: 209.85.208.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f50.google.com with SMTP id v22so16342624edt.9
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Dec 2020 01:10:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=U0k5bDPxLbD4Xfflp8Hw/tPwZAgJFI1vDqDiESjoyw8=;
        b=RCJsgQSJzcVdeRiC5bK+Pj3Hx1HANGz/UKxWkl6I0+K7YEkitMbQQRFfcSg64ZB1ss
         SkkZgsBjKh2IUGGy2Fu02A/8QqSyWNu/ROGt6v4dPKOD/n+BTBoJra/C4Mfs2T1WiTKM
         BF2d6LB6kncwBNI5hoFkUIGu6DByNQNdc8Phgb8SmOVx3Vzfn6m+vgAwYpUTaw2O0XIF
         FEgQov32YcAVY9Iikijwc6EaDWOfuGvJvTiw4UWvD37B49N3SWJWuK17ce6QTQ74vun/
         bB9Hz9SyJkzs76loIbiB3NZ0sG0CEM79RG61BrLDuUgH40TteF9rz1iCKCkQCgB8k8If
         9NPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=U0k5bDPxLbD4Xfflp8Hw/tPwZAgJFI1vDqDiESjoyw8=;
        b=UiYihSDFy4JHiDfZfroIpqbKyMnoY234raqDTIsmmzfG+tEuCb7Cv+3J9tOTWTzC/e
         N/nJS19WVm8IP0GiBmjcZSfFKDZQ862PH6M2ErgP7pklIL6qVNkmntjnIkt3YQsSdAvk
         qCx3U9lw0oCsjiUyoC8alGYG0Z2R9JrLrIZoUV4L4X5lgSeQfZGwYO0AtvnJejzfX7EG
         Qd8/Obp1DFy85/cy47Jk4Bi5E9XNUQuAu1i465OCZGHV54hUYm6/fe6tesV8NAKl0OGi
         vykSFCYHcRSuG12asJvPdgsdM58HCt2pHNq+LSy+POZ2vKQC4q/pRilNDmYhbUr3Yv4B
         KLYQ==
X-Gm-Message-State: AOAM531eakgBjomBxBFVVVfiyDvL0Ck5G2JPpjY4GjaeuFsSZcmbqDxx
	ex52eZ+XmrqwXKzE9JKko0Za4QANrMHCrw==
X-Google-Smtp-Source: ABdhPJyfnDvhvmhwde7kI1iFAE0Lkq8g9chuTv3OFe+hKOWbdK1kJwl2qSW67m+01RDaI61eUc/pnA==
X-Received: by 2002:a50:fc13:: with SMTP id i19mr24623186edr.281.1607937048694;
        Mon, 14 Dec 2020 01:10:48 -0800 (PST)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.fritz.box ([2a02:2450:1011:4f7:596d:bf31:3950:5bda])
        by smtp.gmail.com with ESMTPSA id d22sm13318425eja.72.2020.12.14.01.10.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Dec 2020 01:10:48 -0800 (PST)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 1/4] kea: upgrade 1.7.10 -> 1.8.1
Date: Mon, 14 Dec 2020 10:10:38 +0100
Message-Id: <20201214091042.10145-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-connectivity/kea/{kea_1.7.10.bb => kea_1.8.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/kea/{kea_1.7.10.bb => kea_1.8.1.bb} (97%)

diff --git a/meta/recipes-connectivity/kea/kea_1.7.10.bb b/meta/recipes-connectivity/kea/kea_1.8.1.bb
similarity index 97%
rename from meta/recipes-connectivity/kea/kea_1.7.10.bb
rename to meta/recipes-connectivity/kea/kea_1.8.1.bb
index c9a11908e5..3a2ccf5c1f 100644
--- a/meta/recipes-connectivity/kea/kea_1.7.10.bb
+++ b/meta/recipes-connectivity/kea/kea_1.8.1.bb
@@ -19,7 +19,7 @@ SRC_URI = "http://ftp.isc.org/isc/kea/${PV}/${BP}.tar.gz \
            file://fix_pid_keactrl.patch \
            file://0001-src-lib-log-logger_unittest_support.cc-do-not-write-.patch \
            "
-SRC_URI[sha256sum] = "4e121f0e58b175a827581c69cb1d60778647049fa47f142940dddc9ce58f3c82"
+SRC_URI[sha256sum] = "52020cb16889484b661746d7fc4c7cd88974b1af5b7fc436eb6e69c62eb83734"
 
 inherit autotools systemd update-rc.d upstream-version-is-even
 
-- 
2.29.2

