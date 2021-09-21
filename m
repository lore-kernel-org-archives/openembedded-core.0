Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.web10.979.1632243745130138898
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Sep 2021 10:02:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=MMHBgxrt;
 spf=pass (domain: gmail.com, ip: 209.85.215.173, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f173.google.com with SMTP id q68so21305501pga.9
        for <openembedded-core@lists.openembedded.org>; Tue, 21 Sep 2021 10:02:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=N4kmxNKYbl1wz7cyEHqY936HhzqJqGNK8goHF1yorDM=;
        b=MMHBgxrt/Hb23iJMn7XAsWfr0yNuD1lFS/9L48KXm0gTpdFFjniN1SI4DC5kppInZD
         Doq0zC+JXl17C8vFkp0F+Uf8nL5WRFsYxhcZFHrp/hFwpHKX9QvmSskbyy+0M0Vr4J7M
         7RXb+0LCmhl9fi3bBwrzc5JQrYXKVMYYhGVBUv7VCUJydyJmjNTA/CLOdsNW6SlnAfFd
         OBf//KFd6tbKLLw1ju7Ffk8NxPIKZ6598cIzNH4paRi/cpMNp50Sp7FXlR+PFh7r9FbS
         jfBMOntA3gQN6nYbbyUUVY0HAhX6CmbiR4qYPYNhzStsKUDNK1HUmR/yvsxrHUVne09m
         Rv8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=N4kmxNKYbl1wz7cyEHqY936HhzqJqGNK8goHF1yorDM=;
        b=e1NAnxjjzYG3bCtTm0iEWzzrfype4Z3GYLJPEdk/YahjiVxwtU1PCOKXEzBD+F3IWQ
         rtDaJWydKfa/F8n7+0x0sDspQ45Trdkt1U/N7LWDAHPPJ5nUwypqLhnoLyBQRQWknMWX
         fhII/F+Vc3HMIMgM26nQV0yHbnHEesw//DrRFQXoj6lski4Rt5GpLyCRuM4C9jRktImO
         YzCpKlJNR6ZhL7qP+8z0mdtIB5NvkxsgBHG2H4X9CFPG3xeilf163WMlZcbY17k9K4+J
         VXuKfPdkNUiQul0J3BdLx4gGq+Etx16AqmUzVeGDwf4xf0qf6ljwT11d1bOlifkFuXpN
         e0hg==
X-Gm-Message-State: AOAM533AUIqy21FriPc23MrUSvFEgaRU8RpwPH53Nckp6H5EKHSVScjf
	o/DNmlG/gsXH64JwFvuLUhsQEY0ZfytIug==
X-Google-Smtp-Source: ABdhPJxkQd36r4kTMiMBkordfPZ9nD3/bG5Z+MsYwr1qmQuiU5d7KMqY6j6ypMXAtqt4hSMMQN8k8A==
X-Received: by 2002:a63:81c6:: with SMTP id t189mr4396752pgd.253.1632243740657;
        Tue, 21 Sep 2021 10:02:20 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::728f])
        by smtp.gmail.com with ESMTPSA id a1sm3255968pjg.0.2021.09.21.10.02.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Sep 2021 10:02:20 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] riscv: Add configure cache entries for libidl
Date: Tue, 21 Sep 2021 10:02:17 -0700
Message-Id: <20210921170217.2977601-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These were hidden in meta-networking

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/site/riscv32-linux | 3 +++
 meta/site/riscv64-linux | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/meta/site/riscv32-linux b/meta/site/riscv32-linux
index 97de628e22..acc32fd03c 100644
--- a/meta/site/riscv32-linux
+++ b/meta/site/riscv32-linux
@@ -9,3 +9,6 @@ glib_cv_uscore=${glib_cv_uscore=no}
 
 # startup-notification
 lf_cv_sane_realloc=${lf_cv_sane_realloc=yes}
+
+# libidl
+libIDL_cv_long_long_format=${libIDL_cv_long_long_format=ll}
diff --git a/meta/site/riscv64-linux b/meta/site/riscv64-linux
index 38bc5f044d..cf78133ee0 100644
--- a/meta/site/riscv64-linux
+++ b/meta/site/riscv64-linux
@@ -9,3 +9,6 @@ glib_cv_uscore=${glib_cv_uscore=no}
 
 # startup-notification
 lf_cv_sane_realloc=${lf_cv_sane_realloc=yes}
+
+# libidl
+libIDL_cv_long_long_format=${libIDL_cv_long_long_format=ll}
-- 
2.33.0

