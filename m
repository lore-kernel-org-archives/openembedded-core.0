Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
 by mx.groups.io with SMTP id smtpd.web10.9112.1603366244372659853
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Oct 2020 04:30:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=fLijNeJS;
 spf=pass (domain: gmail.com, ip: 209.85.128.67, mailfrom: luca.boccassi@gmail.com)
Received: by mail-wm1-f67.google.com with SMTP id k21so1036547wmi.1
        for <openembedded-core@lists.openembedded.org>; Thu, 22 Oct 2020 04:30:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=IEmC368i+kDLbEBhnaW8esysnD3f13TsAA6i3N73aX8=;
        b=fLijNeJSGogPNUTC9sifFIYYZe0mCeBdinvFkqei+/vcKLKbJaAnf6y/9oTFwKBUVM
         S3BItjf086pzpSjcimLwG/YD5hZmJFJcX8aDSBihlckkRjXSB5mLUp/Uk0X4AEd4Ce1f
         XP7yXDf4tfrsu0xrvRQM/2gHvk0EoWGzQo+Vwav8INMIiLoB7OPgwlPjCwbdsnynyZD3
         y/inGoWhI6fkWWqflx0ijnfg+ZQOSt3qeqk9lQx2bABtBSja5QyPUSOp8dPN3eSJb1SW
         f4eLuWBrqj50w+qa+iIya1u4/CpAOMWi99ulRU6oke5jUy1UWz6Ni9tRU2abjd8cAFgd
         4TIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IEmC368i+kDLbEBhnaW8esysnD3f13TsAA6i3N73aX8=;
        b=Mge4ZLDTi+qehbtQ3EDo/4jh5I3jO0XgWyvnuWjAo+BoO+uxTuLfqypa3hdXv9RaIN
         Mvr/dT4c0XyeDqsx35E8tpJDZl0s7r1E9FEcPCmLd8PnY23akOojIuc6G8FmlEQT2c49
         NsPT1+odaLlYdtK70azmPYhNtsUseUdcUnZBtNHmmjPWHw2DFZRKDwqQXFAccAHz8pW/
         ASSt96d2u+S9+1TCpOuL+7P5p2IWfMiqoVwpWHLaypfl5iW/Mct5oCM5yTLwFftJbIKj
         ljY20FMf5mGljlGxs9/j6iXNwdD4NLarOwFGim+vpTl5gmC+a0pit4UV5qE0oQ0QRh5K
         LF3A==
X-Gm-Message-State: AOAM531bCj/SQCJIfyM5iytLKMRW5oUlboMUOaPGdc8FKkCDQEihgsR+
	44mOEQdshrBdIWKWDNnVBqkQ75yelexZ7Q==
X-Google-Smtp-Source: ABdhPJysUjbR7lEMHr6hsM9EmfwXhbFMeCFMwM9YR2hh3A7FnI0PHsKFazKwDf5RBNG5kAWQe9gbRg==
X-Received: by 2002:a7b:cf04:: with SMTP id l4mr2113820wmg.33.1603366241986;
        Thu, 22 Oct 2020 04:30:41 -0700 (PDT)
Return-Path: <luca.boccassi@gmail.com>
Received: from localhost ([88.98.246.218])
        by smtp.gmail.com with ESMTPSA id w11sm3374782wrs.26.2020.10.22.04.30.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2020 04:30:41 -0700 (PDT)
From: "Luca Bocassi" <luca.boccassi@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: peter.kjellerstedt@axis.com
Subject: [PATCH v3] Add new recipe for squashfs-tools-ng
Date: Thu, 22 Oct 2020 12:30:36 +0100
Message-Id: <20201022113036.2938947-1-luca.boccassi@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201022092000.2917248-1-luca.boccassi@gmail.com>
References: <20201022092000.2917248-1-luca.boccassi@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Luca Boccassi <luca.boccassi@microsoft.com>

The main difference with squashfs-tools is the availability
of a shared library and a programmatic interface, rather
than just command-line tools.

Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
---
v2: added MIT, Zlib and BSD-2-Clause to LICENSE
v3: fixed CPL-3.0+ tag, removed GPL2 from checksum (not used), changed
    recipe to be versioned, use bb.utils.filter in PACKAGE_CONFIG

 .../squashfs-tools-ng_1.0.2.bb                | 34 +++++++++++++++++++
 1 file changed, 34 insertions(+)
 create mode 100644 meta/recipes-devtools/squashfs-tools-ng/squashfs-tools-ng_1.0.2.bb

diff --git a/meta/recipes-devtools/squashfs-tools-ng/squashfs-tools-ng_1.0.2.bb b/meta/recipes-devtools/squashfs-tools-ng/squashfs-tools-ng_1.0.2.bb
new file mode 100644
index 0000000000..293b31cd92
--- /dev/null
+++ b/meta/recipes-devtools/squashfs-tools-ng/squashfs-tools-ng_1.0.2.bb
@@ -0,0 +1,34 @@
+SUMMARY = "New set of tools for working with SquashFS images"
+SECTION = "base"
+LICENSE = "GPL-3.0+ & LGPL-3.0+ & MIT & BSD-2-Clause & Zlib"
+LIC_FILES_CHKSUM = "file://COPYING.md;md5=c0de2c0aca56349dab98e97992316f7e \
+                    file://licenses/GPLv3.txt;md5=1ebbd3e34237af26da5dc08a4e440464 \
+                    file://licenses/hash_table.txt;md5=874823605326caeaabaa95bfbd0f9fb0 \
+                    file://licenses/LGPLv3.txt;md5=3000208d539ec061b899bce1d9ce9404 \
+                    file://licenses/LZ4.txt;md5=ebc2ea4814a64de7708f1571904b32cc \
+                    file://licenses/xxhash.txt;md5=f042a9be092bd6d7fe6f217d8d00f4ca \
+                    file://licenses/xz.txt;md5=1c389b9610ccfdb25f7abaea6a0bb5a4 \
+                    file://licenses/zlib.txt;md5=ae27c72096606131f760e5f59cf98b06 \
+                    file://licenses/zstd.txt;md5=8df8137b630239cbdd4c0674124cb0c8"
+
+SRCREV = "b96f0fc154feef531be76034bf6e38925636146f"
+SRC_URI = "git://github.com/AgentD/squashfs-tools-ng.git;protocol=https"
+
+S = "${WORKDIR}/git"
+
+inherit autotools pkgconfig
+
+PACKAGECONFIG ??= "gzip xz lzo lz4 zstd ${@bb.utils.filter('DISTRO_FEATURES', 'selinux', d)}"
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

