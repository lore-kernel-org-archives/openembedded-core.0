Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com [209.85.214.195])
 by mx.groups.io with SMTP id smtpd.web10.3852.1603858150296061616
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Oct 2020 21:09:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=aNEF+afo;
 spf=pass (domain: gmail.com, ip: 209.85.214.195, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f195.google.com with SMTP id f21so1851806plr.5
        for <openembedded-core@lists.openembedded.org>; Tue, 27 Oct 2020 21:09:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2Oft5r+hlLppmoF+W38K4FEIcTxVvnkG42ljP8YnJBA=;
        b=aNEF+afo6QymFNYPuk0pAnB05JFm1eH/Ta5aTU3/R+S+2KrHgD44opbbsydKyJtlAg
         IXouV1h4qQCMnFJ4TY1kFazMnOWmaKzI28FgLBihqJbAwabYVNfhY8IBLTqK63v9pPxa
         Wf9wXgGz/g6lkLY9OmGfGfuKEc2wCubbHUmvJWbNpxeW4VnFw4VN3glaNnvm4u4Tvapo
         W7X2Ca2Hg34uLFLvyTJFEVue3GvWSYncnNYMjm00O03qvqaEcJybfbjSjeSvC9Yg5Kkc
         xm+s4ORJ/xdO2uKHGFRriw0ggl607TofgSGPmW8tmatk2LGHDLNPxt3AEGNPYa2Zo2aY
         Ga0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2Oft5r+hlLppmoF+W38K4FEIcTxVvnkG42ljP8YnJBA=;
        b=tAHj/lRHeT1dnJp1Xf+kr9Z2W4UVRwQVVFqUwcgN/ZRFhAHldb1DbWVpS6rZuikMFR
         No9CV4qHaNOYk55B9z7hSoEoNgYrYCjAh0ABRz0fQMeg1tu0KMRn/EYFfdY1Q4Uwjuy+
         KhVn2LqVLze2fjq/Qk5XXXEqqRVeeOw9Emms/Rsbfrskg5K0ya8BpgyHRj7ta2UhQavC
         QoU9kgtajHJhpAXDnaZt7ja2NcgqsTpIqZ0biHJ+24cV4VSJya2C8X1TU7/aYviasE0b
         BoIPpT9xXxOXs00ZrJXs67iXpUqTNzDVXnwbm5JEIB2usgmOj/KXVSGmGkMj5hoHyyvW
         2d0w==
X-Gm-Message-State: AOAM533x2fdN3gQfb4jX3VGZeL7CUg87a9iVG85RlktfKbcTO73O9vrx
	94wkYhnhdXCqQdSQT0dHmacUH5k8JtECug==
X-Google-Smtp-Source: ABdhPJzlwW7cmJV9GPAajSqRha0BthywfTqT56zZjgKSEGqr2NeIhrOTvWZj1QeD3Dbdtp5tx57uYQ==
X-Received: by 2002:a17:90a:6b08:: with SMTP id v8mr4959455pjj.126.1603858149484;
        Tue, 27 Oct 2020 21:09:09 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::bc1e])
        by smtp.gmail.com with ESMTPSA id c1sm4133410pfo.207.2020.10.27.21.09.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2020 21:09:08 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 2/3] init-ifupdown: Merge all interface files for differnet qemus
Date: Tue, 27 Oct 2020 21:09:03 -0700
Message-Id: <20201028040904.3446105-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201028040904.3446105-1-raj.khem@gmail.com>
References: <20201028040904.3446105-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

all these were exact copies, therefore just use qemuall to house this
file as it will be same across all qemu machines

Additionally, it can support out of tree qemu definitions better eg.
qemuppc64

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../init-ifupdown-1.0/{qemuarm => qemuall}/interfaces     | 0
 .../init-ifupdown/init-ifupdown-1.0/qemuarm64/interfaces  | 5 -----
 .../init-ifupdown/init-ifupdown-1.0/qemuarmv6/interfaces  | 5 -----
 .../init-ifupdown/init-ifupdown-1.0/qemuarmv7/interfaces  | 5 -----
 .../init-ifupdown/init-ifupdown-1.0/qemumips/interfaces   | 8 --------
 .../init-ifupdown/init-ifupdown-1.0/qemumips64/interfaces | 8 --------
 .../init-ifupdown/init-ifupdown-1.0/qemuppc/interfaces    | 8 --------
 .../init-ifupdown-1.0/qemuriscv32/interfaces              | 8 --------
 .../init-ifupdown-1.0/qemuriscv64/interfaces              | 8 --------
 .../init-ifupdown/init-ifupdown-1.0/qemush4/interfaces    | 8 --------
 .../init-ifupdown/init-ifupdown-1.0/qemux86-64/interfaces | 8 --------
 .../init-ifupdown/init-ifupdown-1.0/qemux86/interfaces    | 8 --------
 12 files changed, 79 deletions(-)
 rename meta/recipes-core/init-ifupdown/init-ifupdown-1.0/{qemuarm => qemuall}/interfaces (100%)
 delete mode 100644 meta/recipes-core/init-ifupdown/init-ifupdown-1.0/qemuarm64/interfaces
 delete mode 100644 meta/recipes-core/init-ifupdown/init-ifupdown-1.0/qemuarmv6/interfaces
 delete mode 100644 meta/recipes-core/init-ifupdown/init-ifupdown-1.0/qemuarmv7/interfaces
 delete mode 100644 meta/recipes-core/init-ifupdown/init-ifupdown-1.0/qemumips/interfaces
 delete mode 100644 meta/recipes-core/init-ifupdown/init-ifupdown-1.0/qemumips64/interfaces
 delete mode 100644 meta/recipes-core/init-ifupdown/init-ifupdown-1.0/qemuppc/interfaces
 delete mode 100644 meta/recipes-core/init-ifupdown/init-ifupdown-1.0/qemuriscv32/interfaces
 delete mode 100644 meta/recipes-core/init-ifupdown/init-ifupdown-1.0/qemuriscv64/interfaces
 delete mode 100644 meta/recipes-core/init-ifupdown/init-ifupdown-1.0/qemush4/interfaces
 delete mode 100644 meta/recipes-core/init-ifupdown/init-ifupdown-1.0/qemux86-64/interfaces
 delete mode 100644 meta/recipes-core/init-ifupdown/init-ifupdown-1.0/qemux86/interfaces

diff --git a/meta/recipes-core/init-ifupdown/init-ifupdown-1.0/qemuarm/interfaces b/meta/recipes-core/init-ifupdown/init-ifupdown-1.0/qemuall/interfaces
similarity index 100%
rename from meta/recipes-core/init-ifupdown/init-ifupdown-1.0/qemuarm/interfaces
rename to meta/recipes-core/init-ifupdown/init-ifupdown-1.0/qemuall/interfaces
diff --git a/meta/recipes-core/init-ifupdown/init-ifupdown-1.0/qemuarm64/interfaces b/meta/recipes-core/init-ifupdown/init-ifupdown-1.0/qemuarm64/interfaces
deleted file mode 100644
index 16967763e5..0000000000
--- a/meta/recipes-core/init-ifupdown/init-ifupdown-1.0/qemuarm64/interfaces
+++ /dev/null
@@ -1,5 +0,0 @@
-# /etc/network/interfaces -- configuration file for ifup(8), ifdown(8)
- 
-# The loopback interface
-auto lo
-iface lo inet loopback
diff --git a/meta/recipes-core/init-ifupdown/init-ifupdown-1.0/qemuarmv6/interfaces b/meta/recipes-core/init-ifupdown/init-ifupdown-1.0/qemuarmv6/interfaces
deleted file mode 100644
index 16967763e5..0000000000
--- a/meta/recipes-core/init-ifupdown/init-ifupdown-1.0/qemuarmv6/interfaces
+++ /dev/null
@@ -1,5 +0,0 @@
-# /etc/network/interfaces -- configuration file for ifup(8), ifdown(8)
- 
-# The loopback interface
-auto lo
-iface lo inet loopback
diff --git a/meta/recipes-core/init-ifupdown/init-ifupdown-1.0/qemuarmv7/interfaces b/meta/recipes-core/init-ifupdown/init-ifupdown-1.0/qemuarmv7/interfaces
deleted file mode 100644
index 16967763e5..0000000000
--- a/meta/recipes-core/init-ifupdown/init-ifupdown-1.0/qemuarmv7/interfaces
+++ /dev/null
@@ -1,5 +0,0 @@
-# /etc/network/interfaces -- configuration file for ifup(8), ifdown(8)
- 
-# The loopback interface
-auto lo
-iface lo inet loopback
diff --git a/meta/recipes-core/init-ifupdown/init-ifupdown-1.0/qemumips/interfaces b/meta/recipes-core/init-ifupdown/init-ifupdown-1.0/qemumips/interfaces
deleted file mode 100644
index f62b9a897d..0000000000
--- a/meta/recipes-core/init-ifupdown/init-ifupdown-1.0/qemumips/interfaces
+++ /dev/null
@@ -1,8 +0,0 @@
-# /etc/network/interfaces -- configuration file for ifup(8), ifdown(8)
- 
-# The loopback interface
-auto lo
-iface lo inet loopback
-
-
-
diff --git a/meta/recipes-core/init-ifupdown/init-ifupdown-1.0/qemumips64/interfaces b/meta/recipes-core/init-ifupdown/init-ifupdown-1.0/qemumips64/interfaces
deleted file mode 100644
index f62b9a897d..0000000000
--- a/meta/recipes-core/init-ifupdown/init-ifupdown-1.0/qemumips64/interfaces
+++ /dev/null
@@ -1,8 +0,0 @@
-# /etc/network/interfaces -- configuration file for ifup(8), ifdown(8)
- 
-# The loopback interface
-auto lo
-iface lo inet loopback
-
-
-
diff --git a/meta/recipes-core/init-ifupdown/init-ifupdown-1.0/qemuppc/interfaces b/meta/recipes-core/init-ifupdown/init-ifupdown-1.0/qemuppc/interfaces
deleted file mode 100644
index f62b9a897d..0000000000
--- a/meta/recipes-core/init-ifupdown/init-ifupdown-1.0/qemuppc/interfaces
+++ /dev/null
@@ -1,8 +0,0 @@
-# /etc/network/interfaces -- configuration file for ifup(8), ifdown(8)
- 
-# The loopback interface
-auto lo
-iface lo inet loopback
-
-
-
diff --git a/meta/recipes-core/init-ifupdown/init-ifupdown-1.0/qemuriscv32/interfaces b/meta/recipes-core/init-ifupdown/init-ifupdown-1.0/qemuriscv32/interfaces
deleted file mode 100644
index f62b9a897d..0000000000
--- a/meta/recipes-core/init-ifupdown/init-ifupdown-1.0/qemuriscv32/interfaces
+++ /dev/null
@@ -1,8 +0,0 @@
-# /etc/network/interfaces -- configuration file for ifup(8), ifdown(8)
- 
-# The loopback interface
-auto lo
-iface lo inet loopback
-
-
-
diff --git a/meta/recipes-core/init-ifupdown/init-ifupdown-1.0/qemuriscv64/interfaces b/meta/recipes-core/init-ifupdown/init-ifupdown-1.0/qemuriscv64/interfaces
deleted file mode 100644
index f62b9a897d..0000000000
--- a/meta/recipes-core/init-ifupdown/init-ifupdown-1.0/qemuriscv64/interfaces
+++ /dev/null
@@ -1,8 +0,0 @@
-# /etc/network/interfaces -- configuration file for ifup(8), ifdown(8)
- 
-# The loopback interface
-auto lo
-iface lo inet loopback
-
-
-
diff --git a/meta/recipes-core/init-ifupdown/init-ifupdown-1.0/qemush4/interfaces b/meta/recipes-core/init-ifupdown/init-ifupdown-1.0/qemush4/interfaces
deleted file mode 100644
index f62b9a897d..0000000000
--- a/meta/recipes-core/init-ifupdown/init-ifupdown-1.0/qemush4/interfaces
+++ /dev/null
@@ -1,8 +0,0 @@
-# /etc/network/interfaces -- configuration file for ifup(8), ifdown(8)
- 
-# The loopback interface
-auto lo
-iface lo inet loopback
-
-
-
diff --git a/meta/recipes-core/init-ifupdown/init-ifupdown-1.0/qemux86-64/interfaces b/meta/recipes-core/init-ifupdown/init-ifupdown-1.0/qemux86-64/interfaces
deleted file mode 100644
index f62b9a897d..0000000000
--- a/meta/recipes-core/init-ifupdown/init-ifupdown-1.0/qemux86-64/interfaces
+++ /dev/null
@@ -1,8 +0,0 @@
-# /etc/network/interfaces -- configuration file for ifup(8), ifdown(8)
- 
-# The loopback interface
-auto lo
-iface lo inet loopback
-
-
-
diff --git a/meta/recipes-core/init-ifupdown/init-ifupdown-1.0/qemux86/interfaces b/meta/recipes-core/init-ifupdown/init-ifupdown-1.0/qemux86/interfaces
deleted file mode 100644
index f62b9a897d..0000000000
--- a/meta/recipes-core/init-ifupdown/init-ifupdown-1.0/qemux86/interfaces
+++ /dev/null
@@ -1,8 +0,0 @@
-# /etc/network/interfaces -- configuration file for ifup(8), ifdown(8)
- 
-# The loopback interface
-auto lo
-iface lo inet loopback
-
-
-
-- 
2.28.0

