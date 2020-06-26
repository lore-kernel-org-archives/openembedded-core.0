Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
 by mx.groups.io with SMTP id smtpd.web12.2880.1593155946276004996
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Jun 2020 00:19:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=SwaBK17m;
 spf=pass (domain: gmail.com, ip: 209.85.208.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f45.google.com with SMTP id s28so6105030edw.11
        for <openembedded-core@lists.openembedded.org>; Fri, 26 Jun 2020 00:19:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=x65gaDQY0Iv2wg37jOh2jEwn3J+v91cWilIY2FQrQko=;
        b=SwaBK17mJvp31WFbajlTt3uoJ5NOL0uf8A29jCTjaI4f4C/N0r5dKFV3sqJ7K1g5Gi
         dnnRRtjS11gOv6N/+UWw3DrFOoOTRR819xiTCB2FqpVlJhb1A+JU8Xa/ca/Rn6ndYENo
         ZX1puTVrvrFxzNmKyBsY9vknIb2Zv4yJ4Qyw84HD3I7V16j+9gx3O1U6Moi0j8Afm1yo
         1uoRFJuVuLrJ+V2Wp6g+KrxWKZATlgtkOoCA7yplOBV2fzdBlKK61UbppoWsjrH695T2
         nrnK4l5YUCaoidXo8FHN8tzcLrfTbDAVE1SfNg+pm6DkUg7bDMJkzPxQvfxkmLbbdUMB
         6kjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=x65gaDQY0Iv2wg37jOh2jEwn3J+v91cWilIY2FQrQko=;
        b=CyGpM1ilCjWuLMjUK6Kr6/6tKwCx32HcmpZnEtudH2zakvFYfNEcW37Vrdnf6DJo0y
         h8gndVrRU4rrBDVoT+PVmYtE+wXnvIacFRG+Sm+v88jbuXExjO4iiM7aM1ghpY7OBF02
         1+Lok5o0ERCRdyiM4Xv1lxaB3Ag5rHEUIZwGMyOkgf+fiL4FFgpgdAPZN45rZc4lGS3b
         pedeLpohuJr2jDgGSxSmFiTFWN5BBO+p/7gLXCSudNXq9saqrJNs8+J/hcsUfqclP4eW
         4ImxdsMYty942AUqbvydzOg5tbDbpWrETpYwzMBWsyfqtATowj1KJxsJ02CuN2LZHcvA
         B3HA==
X-Gm-Message-State: AOAM5316vMQob+aSSbKlKqFjPEPlW5HAxrIePdEUi9i8TPyqnsPcV5eu
	/qQVnpguybRNPqx9VvmjRB2xA3qxkEY=
X-Google-Smtp-Source: ABdhPJxriyQ2JBewgikWHVvTc1P+6lhVa0IrS5Q+EgyOawpFKP4E4qAxBdnqU3KHJJyu6DeT4PuQUw==
X-Received: by 2002:a50:ee87:: with SMTP id f7mr2005264edr.355.1593155943932;
        Fri, 26 Jun 2020 00:19:03 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.site ([2a02:2450:1011:56f:b652:c378:b428:fdf])
        by smtp.gmail.com with ESMTPSA id p4sm20826194edj.64.2020.06.26.00.19.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2020 00:19:03 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 05/30] dropbear: update 2019.78 -> 2020.79
Date: Fri, 26 Jun 2020 09:18:19 +0200
Message-Id: <20200626071844.29134-5-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200626071844.29134-1-alex.kanavin@gmail.com>
References: <20200626071844.29134-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Refresh dropbear-disable-weak-ciphers.patch as some weak items
have been dropped upstream.

License-Update: curve25519 changed to public domain
Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-core/dropbear/dropbear.inc       |  2 +-
 .../dropbear-disable-weak-ciphers.patch       | 39 +++++++------------
 .../recipes-core/dropbear/dropbear_2019.78.bb |  4 --
 .../recipes-core/dropbear/dropbear_2020.79.bb |  3 ++
 4 files changed, 19 insertions(+), 29 deletions(-)
 delete mode 100644 meta/recipes-core/dropbear/dropbear_2019.78.bb
 create mode 100644 meta/recipes-core/dropbear/dropbear_2020.79.bb

diff --git a/meta/recipes-core/dropbear/dropbear.inc b/meta/recipes-core/dropbear/dropbear.inc
index 7269888a4e..240e328ed2 100644
--- a/meta/recipes-core/dropbear/dropbear.inc
+++ b/meta/recipes-core/dropbear/dropbear.inc
@@ -5,7 +5,7 @@ SECTION = "console/network"
 # some files are from other projects and have others license terms:
 #   public domain, OpenSSH 3.5p1, OpenSSH3.6.1p2, PuTTY
 LICENSE = "MIT & BSD-3-Clause & BSD-2-Clause & PD"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=a5ec40cafba26fc4396d0b550f824e01"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=da58928b5d844c6667963cb5a109272d"
 
 DEPENDS = "zlib virtual/crypt"
 RPROVIDES_${PN} = "ssh sshd"
diff --git a/meta/recipes-core/dropbear/dropbear/dropbear-disable-weak-ciphers.patch b/meta/recipes-core/dropbear/dropbear/dropbear-disable-weak-ciphers.patch
index e48a34bac0..b54581f17a 100644
--- a/meta/recipes-core/dropbear/dropbear/dropbear-disable-weak-ciphers.patch
+++ b/meta/recipes-core/dropbear/dropbear/dropbear-disable-weak-ciphers.patch
@@ -1,33 +1,24 @@
-This feature disables all CBC, SHA1, and diffie-hellman group1 ciphers 
+From c347ece05a7fdbf50d76cb136b9ed45caed333f6 Mon Sep 17 00:00:00 2001
+From: Joseph Reynolds <joseph.reynolds1@ibm.com>
+Date: Thu, 20 Jun 2019 16:29:15 -0500
+Subject: [PATCH] dropbear: new feature: disable-weak-ciphers
+
+This feature disables all CBC, SHA1, and diffie-hellman group1 ciphers
 in the dropbear ssh server and client since they're considered weak ciphers
 and we want to support the stong algorithms.
 
 Upstream-Status: Inappropriate [configuration]
 Signed-off-by: Joseph Reynolds <joseph.reynolds1@ibm.com>
 
-Index: dropbear-2019.78/default_options.h
-===================================================================
---- dropbear-2019.78.orig/default_options.h
-+++ dropbear-2019.78/default_options.h
-@@ -91,7 +91,7 @@ IMPORTANT: Some options will require "ma
- 
- /* Enable CBC mode for ciphers. This has security issues though
-  * is the most compatible with older SSH implementations */
--#define DROPBEAR_ENABLE_CBC_MODE 1
-+#define DROPBEAR_ENABLE_CBC_MODE 0
- 
- /* Enable "Counter Mode" for ciphers. This is more secure than
-  * CBC mode against certain attacks. It is recommended for security
-@@ -101,7 +101,7 @@ IMPORTANT: Some options will require "ma
- /* Message integrity. sha2-256 is recommended as a default, 
-    sha1 for compatibility */
- #define DROPBEAR_SHA1_HMAC 1
--#define DROPBEAR_SHA1_96_HMAC 1
-+#define DROPBEAR_SHA1_96_HMAC 0
- #define DROPBEAR_SHA2_256_HMAC 1
- 
- /* Hostkey/public key algorithms - at least one required, these are used
-@@ -149,12 +149,12 @@ IMPORTANT: Some options will require "ma
+---
+ default_options.h | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/default_options.h b/default_options.h
+index 1aa2297..7ff1394 100644
+--- a/default_options.h
++++ b/default_options.h
+@@ -163,12 +163,12 @@ IMPORTANT: Some options will require "make clean" after changes */
   * Small systems should generally include either curve25519 or ecdh for performance.
   * curve25519 is less widely supported but is faster
   */ 
diff --git a/meta/recipes-core/dropbear/dropbear_2019.78.bb b/meta/recipes-core/dropbear/dropbear_2019.78.bb
deleted file mode 100644
index d2cd8161bf..0000000000
--- a/meta/recipes-core/dropbear/dropbear_2019.78.bb
+++ /dev/null
@@ -1,4 +0,0 @@
-require dropbear.inc
-
-SRC_URI[md5sum] = "a972c85ed678ad0fdcb7844e1294fb54"
-SRC_URI[sha256sum] = "525965971272270995364a0eb01f35180d793182e63dd0b0c3eb0292291644a4"
diff --git a/meta/recipes-core/dropbear/dropbear_2020.79.bb b/meta/recipes-core/dropbear/dropbear_2020.79.bb
new file mode 100644
index 0000000000..43a17bf1e5
--- /dev/null
+++ b/meta/recipes-core/dropbear/dropbear_2020.79.bb
@@ -0,0 +1,3 @@
+require dropbear.inc
+
+SRC_URI[sha256sum] = "084f00546b1610a3422a0773e2c04cbe1a220d984209e033b548b49f379cc441"
-- 
2.27.0

