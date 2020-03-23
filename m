Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com [209.85.216.65])
 by mx.groups.io with SMTP id smtpd.web12.1501.1585005919608070552
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Mar 2020 16:25:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=XIjYquqk;
 spf=pass (domain: gmail.com, ip: 209.85.216.65, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f65.google.com with SMTP id jz1so498608pjb.0
        for <openembedded-core@lists.openembedded.org>; Mon, 23 Mar 2020 16:25:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nsAxO8X0WRpNvD4BihSOq6CIsWmY3VfMyej8IeULZLE=;
        b=XIjYquqk0LSK/bNVbpDrwa+wjRF5kINcyrtpdNSfS0Y1YfnIuqNhp5oRj7ydl2zMj/
         CIcLrWNIkv2uDq6UzgAgvFpToIOB0ItYHwGTf7PCU7n55C0OH2uh/Qyyp2Gji3eAL6n2
         zIF7VgFhcVfPP+OX9Kdd3AO03z8XIXWN5oyxK45Qzt/SGqCt4hLXOnwIITqkSZvtOo5f
         dTK2WouN24+05q0pMpwGqKaIdtBAjlhJe4HSCMTqcJMuclhxxcBgAmg3l4pU8MAcdzDQ
         zW0Pf9t/1R5Woc5DjnUC4/9fvalShwLqpM3gwyEPwwDelHsWXkU8bEIKkBxp/aMiBU11
         mozg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nsAxO8X0WRpNvD4BihSOq6CIsWmY3VfMyej8IeULZLE=;
        b=MuRjnLNDmc/CVKd4WpK/HfcHxnz7C77V351njpkqeUqF+5BwJW2smQeEB1adDbpG1S
         78QZCX3yyivyq5eaB6m0RfS+WfSR0jh0rtWKL4S7KXrM+gQuFHrOK0HzDVZdYQz/lP4g
         pjCaVsGkJOJhYkwpGMtjXGXokaqlmlc8fdg6LzKSTyhh0HPdwm+joigA/aTPKBKil0xD
         88E1QnLkydpnpFiuVKuPVYmya6ZxS/+wIfdXVBgJo539denrGLbeh07ZLhzuDt9xT/Jb
         RAXohsmFgG3y9L4YHDhxHQRNUFSZZdV8cOH/qq5vdkZNj9LCXJYsG7o4nkp+L61ifNSm
         CzCw==
X-Gm-Message-State: ANhLgQ1J/l77ab3sdSHeAnF1yrMHUzjf1tiuEbVd8U3Y6lcNkAAocsKv
	WEoqNOPa1rQo04eIfxrBSyovkSUWcW8=
X-Google-Smtp-Source: ADFU+vsr0DG9+mP/ftlSSyXQ6gP28ytjFOU7EOes3gIphMZ5uxrFoLtVUAoGzoymRUoiSj+7VZhCSg==
X-Received: by 2002:a17:90a:5805:: with SMTP id h5mr1868072pji.175.1585005918348;
        Mon, 23 Mar 2020 16:25:18 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::c406])
        by smtp.gmail.com with ESMTPSA id s4sm6375118pgm.18.2020.03.23.16.25.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2020 16:25:17 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] lto.inc: Add global LTO distro policy file
Date: Mon, 23 Mar 2020 16:25:29 -0700
Message-Id: <20200323232529.3658577-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Distros which want to enable LTO can utilize this file, it only covers
packages from OE-Core, other layers should include there own exclusion
list for recipe which dont work with LTO

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/distro/include/lto.inc | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)
 create mode 100644 meta/conf/distro/include/lto.inc

diff --git a/meta/conf/distro/include/lto.inc b/meta/conf/distro/include/lto.inc
new file mode 100644
index 0000000000..0cedc8deca
--- /dev/null
+++ b/meta/conf/distro/include/lto.inc
@@ -0,0 +1,23 @@
+LTO_pn-glibc = ""
+LTO_pn-gcc-runtime = ""
+LTO_pn-libgcc-initial = ""
+LTO_pn-libgcc = ""
+LTO_pn-libpam = ""
+LTO_pn-elfutils = ""
+LTO_pn-perl = ""
+LTO_pn-busybox = ""
+LTO_pn-libxcrypt = ""
+LTO_pn-curl = ""
+LTO_pn-libcap = ""
+LTO_pn-python3 = ""
+LTO_pn-libproxy = ""
+LTO_pn-libbsd = ""
+
+LTO ?= "-flto"
+
+SELECTED_OPTIMIZATION_append_class-target = " ${LTO}"
+TARGET_LDFLAGS_append_class-target = " ${LTO}"
+
+SELECTED_OPTIMIZATION[vardeps] += "LTO"
+
+PACKAGE_DEBUG_SPLIT_STYLE = "debug-without-src"
-- 
2.25.2

