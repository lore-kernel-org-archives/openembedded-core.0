Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com [209.85.210.193])
 by mx.groups.io with SMTP id smtpd.web11.3910.1603858148283443884
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Oct 2020 21:09:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=G5JVSVwV;
 spf=pass (domain: gmail.com, ip: 209.85.210.193, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f193.google.com with SMTP id 126so2165887pfu.4
        for <openembedded-core@lists.openembedded.org>; Tue, 27 Oct 2020 21:09:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7hWR8v6/3rfS7i2aawTUR/MsXR8WAx1zobskY1/PVLg=;
        b=G5JVSVwVyrP6PmcqTcK/kQagstyjI21J0kU6ZTdxVNMA2GPJoEmRadty7nL4dMvzpo
         L9ZfMOlrvcjlK50fDb5cvwZycQP8g2lfgK6YoAAsNxDiuG1yPVIP9o+2cnrt7GainNhp
         4rkrcOw77FQVL7FsK5tbXDkHvKDiHcpjoE+03CE7fthbR6Qh5UugeJvCYVNpKMBwrTTC
         oGMXwsJI0f/tYXdkY0FSL+ZNjibcN5arD4UH3J9DaB5AhMdb0fOpMhI6CXO9tYtNXb/m
         2kMaZrf6l9/don49oFHtxCwTzQ0SGwWgmgsVuVl591EkRCmb5bbX/8G1Hp/W3JPNQBhm
         rjNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7hWR8v6/3rfS7i2aawTUR/MsXR8WAx1zobskY1/PVLg=;
        b=cGfJBvmchKKHzSQstp0Rw45uoniPkRYs/XOcLyZ0sR4MF+VmlTZy6yjs8vfMVsdyyx
         vUv/P9ATyogWeAQyPzxJPoC+sa9k5YgeR9DGZTut2QHJ7UizhNp/NeejCzilgSLe2H3q
         36z8Mt40YLCS3rKJ7xE5Ua5YxLrQnLJXEtAZn3AOMkvAfUGio8o49bVzUUdduqk/5qXU
         CCFEwDY0ehhjP1yKV2O+Asl7IQkb1SttHdSt294/zOzbb6FH6FNQeMVKcWJEYgZOoVHp
         7X+SzcrRue/cmJkqfkg0g5o8x+fgBYNE35H3na+72uiE1SOTF+byuZptIiYL6Pd8rPRr
         Ob3w==
X-Gm-Message-State: AOAM531FTvmHTFWDkh3kDPu+ev3TjWKDB46YMg+TvMOPkgXFdA4Ae4NF
	4HwZdasFlhv/xWQwZOcUK/hHbJowPqdU0A==
X-Google-Smtp-Source: ABdhPJwRJIc4aCTKWTXMT8gLEFNJ9kni7Kwn3EJKIPHRjcDAoLJlCw94GIxRfAatAsIYGEWnvKMjRw==
X-Received: by 2002:a62:7a8f:0:b029:163:d0b3:ac18 with SMTP id v137-20020a627a8f0000b0290163d0b3ac18mr5644972pfc.9.1603858147428;
        Tue, 27 Oct 2020 21:09:07 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::bc1e])
        by smtp.gmail.com with ESMTPSA id c1sm4133410pfo.207.2020.10.27.21.09.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2020 21:09:06 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 1/3] init-ifupdown: Define interfaces file for riscv emulators
Date: Tue, 27 Oct 2020 21:09:01 -0700
Message-Id: <20201028040904.3446105-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../init-ifupdown-1.0/qemuriscv32/interfaces              | 8 ++++++++
 .../init-ifupdown-1.0/qemuriscv64/interfaces              | 8 ++++++++
 2 files changed, 16 insertions(+)
 create mode 100644 meta/recipes-core/init-ifupdown/init-ifupdown-1.0/qemuriscv32/interfaces
 create mode 100644 meta/recipes-core/init-ifupdown/init-ifupdown-1.0/qemuriscv64/interfaces

diff --git a/meta/recipes-core/init-ifupdown/init-ifupdown-1.0/qemuriscv32/interfaces b/meta/recipes-core/init-ifupdown/init-ifupdown-1.0/qemuriscv32/interfaces
new file mode 100644
index 0000000000..f62b9a897d
--- /dev/null
+++ b/meta/recipes-core/init-ifupdown/init-ifupdown-1.0/qemuriscv32/interfaces
@@ -0,0 +1,8 @@
+# /etc/network/interfaces -- configuration file for ifup(8), ifdown(8)
+ 
+# The loopback interface
+auto lo
+iface lo inet loopback
+
+
+
diff --git a/meta/recipes-core/init-ifupdown/init-ifupdown-1.0/qemuriscv64/interfaces b/meta/recipes-core/init-ifupdown/init-ifupdown-1.0/qemuriscv64/interfaces
new file mode 100644
index 0000000000..f62b9a897d
--- /dev/null
+++ b/meta/recipes-core/init-ifupdown/init-ifupdown-1.0/qemuriscv64/interfaces
@@ -0,0 +1,8 @@
+# /etc/network/interfaces -- configuration file for ifup(8), ifdown(8)
+ 
+# The loopback interface
+auto lo
+iface lo inet loopback
+
+
+
-- 
2.28.0

