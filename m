Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com [209.85.210.193])
 by mx.groups.io with SMTP id smtpd.web10.6466.1598420465571225648
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Aug 2020 22:41:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=a2FcoiFy;
 spf=pass (domain: gmail.com, ip: 209.85.210.193, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f193.google.com with SMTP id 17so381505pfw.9
        for <openembedded-core@lists.openembedded.org>; Tue, 25 Aug 2020 22:41:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=p9c1ilb+msHaiDWmyqWap76zl0AxCZAygeYbFjquK6w=;
        b=a2FcoiFygh4b7flFDbbE/NKUfwGylJeEAOxF07GTPKH6vf2/+q4KJ/AMZMdcwSMCl3
         ZsaI/HNJUFuoqcf7pF8+RZ4O1yPGqWudBdgfkkMK3ITQiDnH4K+TLMkgeRSEvnpS4zXa
         viJAAgItDwEQUvabrxfJjrncJN3f2MIMw+KhGJwfHylmCYBdfUnvC2mjBe7xtrFIh4hi
         EL8Xl1BihLJYgdmY4LBOSmr0Rm8Sxru35X6PJQkMHKXSgnWUyCDOvk9hujJjQMvkdUPn
         DJr7rYTxIy7K/vcp/SCfGlg8F4eBo4YCVTRGpHO/kevQ2gwI6MF08ksXphU5lXRzBTcJ
         XKkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=p9c1ilb+msHaiDWmyqWap76zl0AxCZAygeYbFjquK6w=;
        b=g7xcTZXZ18IW2tsgC40emseXoGsoteMQVDOtcQtZ9/fCUX4ndwRaFDaQp4NgbNKyX7
         bwTO6JHTtl8Fkfc46JmYA0VCalC5l+WV7Lwq+SRcOivlufjQNXpblK3efCUOBLtmcsq6
         rLZ5NbWAaRfljvnG3sY5zDrkv5wLApU/PjZBRf0Gcc74kvq3rLBfiJ7v2pMPw9Rs3V32
         hNgCg8NvfwmWLcK4LBXoWTlfFwj0Z5eF2nbLliL2rfxgaOYr2/6S8TJg8UAzmd+q4+Sb
         7SdUkuy4C9pP3DdnffNYKJKVaGm5t4TT56NoU7QtIegUpGVZaL0QymKI85EGI4FclP/l
         872g==
X-Gm-Message-State: AOAM532DRTPxqyaJIpQak6KW59OoynT4mGNQpc11gY6xpK+Bat2wlmvS
	6e3oYFUntS3wLydii5RuOm/3qC4kVrkyuA==
X-Google-Smtp-Source: ABdhPJyVRx9naW/Xpkgz+o3i+wmF7JHaJTr+VoUaiccs4Qs6AbIoCRqO6OUcOSo+PTymXG8Q6d1ezg==
X-Received: by 2002:a62:178d:: with SMTP id 135mr10840276pfx.192.1598420464686;
        Tue, 25 Aug 2020 22:41:04 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::4fbd])
        by smtp.gmail.com with ESMTPSA id r91sm817809pja.56.2020.08.25.22.41.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2020 22:41:04 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] lttng-tools: Do not build for riscv64
Date: Tue, 25 Aug 2020 22:41:01 -0700
Message-Id: <20200826054101.856417-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since lttng-modules are not buildable, there is no point of building
tools either

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../packagegroups/packagegroup-core-tools-profile.bb           | 1 +
 meta/recipes-kernel/lttng/lttng-tools_2.12.2.bb                | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb b/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb
index ca35af1ec3..608e406f83 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb
@@ -41,6 +41,7 @@ LTTNGUST_arc = ""
 
 LTTNGTOOLS = "lttng-tools"
 LTTNGTOOLS_arc = ""
+LTTNGTOOLS_riscv64 = ""
 
 LTTNGMODULES = "lttng-modules"
 LTTNGMODULES_arc = ""
diff --git a/meta/recipes-kernel/lttng/lttng-tools_2.12.2.bb b/meta/recipes-kernel/lttng/lttng-tools_2.12.2.bb
index e9c8e18e22..0614e86713 100644
--- a/meta/recipes-kernel/lttng/lttng-tools_2.12.2.bb
+++ b/meta/recipes-kernel/lttng/lttng-tools_2.12.2.bb
@@ -162,3 +162,6 @@ do_install_ptest () {
         esac
     done
 }
+
+COMPATIBLE_HOST_riscv64 = "null"
+
-- 
2.28.0

