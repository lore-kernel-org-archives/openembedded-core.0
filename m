Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
 by mx.groups.io with SMTP id smtpd.web10.7927.1603358410077901615
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Oct 2020 02:20:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=E4DdLytV;
 spf=pass (domain: gmail.com, ip: 209.85.128.66, mailfrom: luca.boccassi@gmail.com)
Received: by mail-wm1-f66.google.com with SMTP id k21so804685wmi.1
        for <openembedded-core@lists.openembedded.org>; Thu, 22 Oct 2020 02:20:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=eX1+iKhPWb/3pHWVvAIZgpZeTu/lTyWw7r8eTfpcREQ=;
        b=E4DdLytVLHoebzYlfSl2Myhty8MJCjsFRCxS1e91+qXSS0b1nw1yRA7BweOt7/sfW3
         WRtr1FECHfHG7V9KG+qr6kbPGUc7p8WxXA1frRu3zvvw4voGC8CNv9y3rMZYQYhzENEF
         XXF9WN+uLFD1KB2g7GC1lQvRXbWGv6O6x/2SfQN21WyD3CwsSKpraVWBYbsCUpP0856k
         2aHTer0n4NoNvV2MSAfh+SXEECLrMhWxrdDrWNHiCi5hQFuKqzHYAxBZlJIjs/uoASt2
         EdGgUgKCrIzLWJhFGbLu9AEgmaq9m/LRC5ycEH+AlK194mO74DYFCw54OqqQRkdtQqPI
         yWKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=eX1+iKhPWb/3pHWVvAIZgpZeTu/lTyWw7r8eTfpcREQ=;
        b=abwCvZAl6uS8hyad9oRsPnXnRUDDXhAfli0I27QbhrB+Z9EebmIP75nMEb5IelSwno
         sKDvNLBAQ71nOLL7HVK+Mk2zvc/k7SpJHzqAtYU2qo+iLEdDo2NG2Xmqxqk2pQ0pVuOF
         65HqFVLAnIDW+XodvMSkXyU3XGUcozHY2ll/y8o0ap8Lh5c7AzvYvM//DK0ivrxS16HJ
         IDMje95gB7SEYVSItOeb0UmzmQLuLJ4kL209f+pENchODdxA/iKakIZ/y2IRdi9RLbAE
         7mbxNRkYTUF8fSKLjb+zMvVbY8+P/VjJetwd5xGU5U31/HEQ7cBBDg9+7yhuIb14s5Qb
         FdZg==
X-Gm-Message-State: AOAM531jPFNZahkAO2niLGjW/nbgXyd2A2E2bCct46/qjTnxEeTvOo/o
	ioQamSpVgbXnHpiFP61L0Ifj2Ga5Ne1C1Q==
X-Google-Smtp-Source: ABdhPJzcH030cYnHZlQKVNEPNhQhOZYDH6s+gfW++NeC7lKznXzqF/xpgWaMwMmytcQFmiSZ82CQyg==
X-Received: by 2002:a7b:cc09:: with SMTP id f9mr1542692wmh.93.1603358407667;
        Thu, 22 Oct 2020 02:20:07 -0700 (PDT)
Return-Path: <luca.boccassi@gmail.com>
Received: from localhost ([88.98.246.218])
        by smtp.gmail.com with ESMTPSA id b63sm2629101wme.9.2020.10.22.02.20.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2020 02:20:07 -0700 (PDT)
From: "Luca Bocassi" <luca.boccassi@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: kweihmann@outlook.com
Subject: [PATCH v2] Add new recipe for squashfs-tools-ng
Date: Thu, 22 Oct 2020 10:20:00 +0100
Message-Id: <20201022092000.2917248-1-luca.boccassi@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201021155857.2841570-1-luca.boccassi@gmail.com>
References: <20201021155857.2841570-1-luca.boccassi@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Luca Boccassi <luca.boccassi@microsoft.com>

The main difference with squashfs-tools is the availability
of a shared library and a programmatic interface, rather
than just command-line tools.

Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
---
v2: added MIT, Zlib and BSD-2-Clause to LICENSE

 .../squashfs-tools-ng_git.bb                  | 37 +++++++++++++++++++
 1 file changed, 37 insertions(+)
 create mode 100644 meta/recipes-devtools/squashfs-tools-ng/squashfs-tools-ng_git.bb

diff --git a/meta/recipes-devtools/squashfs-tools-ng/squashfs-tools-ng_git.bb b/meta/recipes-devtools/squashfs-tools-ng/squashfs-tools-ng_git.bb
new file mode 100644
index 0000000000..6479017ddb
--- /dev/null
+++ b/meta/recipes-devtools/squashfs-tools-ng/squashfs-tools-ng_git.bb
@@ -0,0 +1,37 @@
+SUMMARY = "New set of tools for working with SquashFS images"
+SECTION = "base"
+LICENSE = "GPLv3+ & LGPL-3.0+ & MIT & BSD-2-Clause & Zlib"
+LIC_FILES_CHKSUM = "file://COPYING.md;md5=c0de2c0aca56349dab98e97992316f7e \
+                    file://licenses/GPLv2.txt;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
+                    file://licenses/GPLv3.txt;md5=1ebbd3e34237af26da5dc08a4e440464 \
+                    file://licenses/hash_table.txt;md5=874823605326caeaabaa95bfbd0f9fb0 \
+                    file://licenses/LGPLv3.txt;md5=3000208d539ec061b899bce1d9ce9404 \
+                    file://licenses/LZ4.txt;md5=ebc2ea4814a64de7708f1571904b32cc \
+                    file://licenses/xxhash.txt;md5=f042a9be092bd6d7fe6f217d8d00f4ca \
+                    file://licenses/xz.txt;md5=1c389b9610ccfdb25f7abaea6a0bb5a4 \
+                    file://licenses/zlib.txt;md5=ae27c72096606131f760e5f59cf98b06 \
+                    file://licenses/zstd.txt;md5=8df8137b630239cbdd4c0674124cb0c8"
+
+PV = "1.0.2"
+SRCREV = "b96f0fc154feef531be76034bf6e38925636146f"
+SRC_URI = "git://github.com/AgentD/squashfs-tools-ng.git;protocol=https \
+"
+
+S = "${WORKDIR}/git"
+
+inherit autotools pkgconfig
+
+PACKAGECONFIG ??= "gzip xz lzo lz4 zstd ${@bb.utils.contains('DISTRO_FEATURES', 'selinux', 'selinux', '', d)}"
+PACKAGECONFIG[gzip] = "--with-gzip,--without-gzip,zlib"
+PACKAGECONFIG[xz] = "--with-xz,--without-xz,xz"
+PACKAGECONFIG[lzo] = "--with-lzo,--without-lzo,lzo"
+PACKAGECONFIG[lz4] = "--with-lz4,--without-lz4,lz4"
+PACKAGECONFIG[zstd] = "--with-zstd,--without-zstd,zstd"
+PACKAGECONFIG[selinux] = "--with-selinux,--without-selinux,libselinux"
+
+PACKAGES =+ "libsquashfs"
+FILES_libsquashfs = "${libdir}/libsquashfs*${SOLIBS}"
+
+BBCLASSEXTEND = "native nativesdk"
+
+CVE_PRODUCT = "squashfs"
-- 
2.20.1

