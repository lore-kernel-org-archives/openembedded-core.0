Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.web10.20371.1607112486767107130
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Dec 2020 12:08:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=aw8wKYXO;
 spf=pass (domain: gmail.com, ip: 209.85.218.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f49.google.com with SMTP id g20so10474915ejb.1
        for <openembedded-core@lists.openembedded.org>; Fri, 04 Dec 2020 12:08:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=af2I7aYUQofkyD1+CBKjboSUtZUNm68vOPJpv8faFcY=;
        b=aw8wKYXOv97ykYZYJl1Oh61RL7g88spQIICz3+V8p+fB44+ED65v4CLmxLH2l65L+s
         qFuDALecPD7pFp3nBOyrET0p56B/0QelKD+v1SyFFx7IYD6TG7vDsLjH4IC7NSqTf9Gv
         PqqGUY7WooAyrNku94AouUNGwPuWFPhsitFJDHAKofmj8jjBcrP6EsaHSs8LTbX5g5GE
         pxrv4ipI1yrvWZvWTOaVUXZwLmT7fnkx5CFTY2qba+91KFcwiBECMAQGh9yvR1541Wrp
         ZHgye0AIUtAnB7KK/fP6JHu51ZifGBUyQfk2nL0nzRly2S5b+AAOKamzKTECxnOWMIux
         qD5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=af2I7aYUQofkyD1+CBKjboSUtZUNm68vOPJpv8faFcY=;
        b=jL4hQln4PY3ia1rR4ZnDK+6e1rymYCCe4/jDEULzcyR9CovKvFLWCiUhuVIPT7iNk8
         GOzW8uMN2uUtW9WdTomVxnnuNxm+ubtx1CWeGQKuKCEZrLZJegssKuMfeRUQSYadUAkL
         TntXsi7aPagddy0pD1Oz2FLfK8PHIVAGS+S9XRocVtOe+yIuCd4voCTvxjke8XLfYdKg
         tQMrLuQ4PRz+5mNvevrSxgxL6w2JKRRl9MBGhH6PZuomGAFkWQvIKsvIRDKo9FoMqhzU
         mqdYW4D5XoYYBpPrkz8MQXVMUti97v2kA1Z0pP/hVoogL923AMyEZhHC3sUGZLcE7L/e
         OI7Q==
X-Gm-Message-State: AOAM532z+D+OiLk9oIWJB/MQW9pqAwHgw7DC4A33GhI1PVBY0OKixZ2H
	GHnXnFZnQZr3lY8N1NP6a0hIcc/iudkPkw==
X-Google-Smtp-Source: ABdhPJzJYpk0NZ3VXRUuNSKJJVbAeFLyE/c4wdBt2XYfQqrX3TSZeI1OR3/MC1oDidYibcWB+kTrUA==
X-Received: by 2002:a17:906:3b56:: with SMTP id h22mr8466798ejf.491.1607112485059;
        Fri, 04 Dec 2020 12:08:05 -0800 (PST)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.fritz.box ([2a02:2450:1011:4f7:596d:bf31:3950:5bda])
        by smtp.gmail.com with ESMTPSA id d6sm3601660ejy.114.2020.12.04.12.08.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Dec 2020 12:08:04 -0800 (PST)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 22/23] cantarell-fonts: update 0.0.25 -> 0.201
Date: Fri,  4 Dec 2020 21:07:35 +0100
Message-Id: <20201204200737.7072-22-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201204200737.7072-1-alex.kanavin@gmail.com>
References: <20201204200737.7072-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Incorrectly set git regex meant we were stuck with a 4 year old
version.

Use tarballs as they contain prebuilt font files; building them
from source requires a bunch of obscure dependencies.

Contains portions of libglyph which are Apache 2.x licensed.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../cantarell-fonts/cantarell-fonts_0.201.bb  | 18 +++++++++++++
 .../cantarell-fonts/cantarell-fonts_git.bb    | 25 -------------------
 2 files changed, 18 insertions(+), 25 deletions(-)
 create mode 100644 meta/recipes-graphics/cantarell-fonts/cantarell-fonts_0.201.bb
 delete mode 100644 meta/recipes-graphics/cantarell-fonts/cantarell-fonts_git.bb

diff --git a/meta/recipes-graphics/cantarell-fonts/cantarell-fonts_0.201.bb b/meta/recipes-graphics/cantarell-fonts/cantarell-fonts_0.201.bb
new file mode 100644
index 0000000000..29e839b6b2
--- /dev/null
+++ b/meta/recipes-graphics/cantarell-fonts/cantarell-fonts_0.201.bb
@@ -0,0 +1,18 @@
+SUMMARY = "Cantarell, a Humanist sans-serif font family"
+
+DESCRIPTION = "The Cantarell font typeface is designed as a \
+               contemporary Humanist sans serif, and was developed for \
+               on-screen reading; in particular, reading web pages on an \
+               HTC Dream mobile phone."
+
+HOMEPAGE = "https://gitlab.gnome.org/GNOME/cantarell-fonts/"
+SECTION = "fonts"
+LICENSE = "OFL-1.1 & Apache-2.0"
+LIC_FILES_CHKSUM = "file://COPYING;md5=fb1ef92b6909969a472a6ea3c4e99cb7"
+
+inherit gnomebase meson allarch fontcache pkgconfig
+SRC_URI[archive.sha256sum] = "b61f64e5f6a48aa0abc7a53cdcbce60de81908ca36048a64730978fcd9ac9863"
+
+EXTRA_OEMESON += "-Duseprebuilt=true -Dbuildappstream=false"
+
+FILES_${PN} = "${datadir}/fonts ${datadir}/fontconfig"
diff --git a/meta/recipes-graphics/cantarell-fonts/cantarell-fonts_git.bb b/meta/recipes-graphics/cantarell-fonts/cantarell-fonts_git.bb
deleted file mode 100644
index db480bd397..0000000000
--- a/meta/recipes-graphics/cantarell-fonts/cantarell-fonts_git.bb
+++ /dev/null
@@ -1,25 +0,0 @@
-SUMMARY = "Cantarell, a Humanist sans-serif font family"
-
-DESCRIPTION = "The Cantarell font typeface is designed as a \
-               contemporary Humanist sans serif, and was developed for \
-               on-screen reading; in particular, reading web pages on an \
-               HTC Dream mobile phone."
-
-HOMEPAGE = "https://gitlab.gnome.org/GNOME/cantarell-fonts/"
-SECTION = "fonts"
-LICENSE = "OFL-1.1"
-LIC_FILES_CHKSUM = "file://COPYING;md5=df91e3ffcab8cfb972a66bf11255188d"
-
-PV = "0.0.25"
-
-SRCREV = "e28a9096da43984212b5b4002b949bcb8c7527f9"
-SRC_URI = "git://gitlab.gnome.org/GNOME/cantarell-fonts.git;protocol=https;branch=reconstruction-0.0.25"
-UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>(?!0\.13)(?!0\.10\.1)\d+\.\d+(\.\d+)+)"
-
-S = "${WORKDIR}/git"
-
-inherit autotools allarch fontcache pkgconfig
-
-PACKAGECONFIG ??= ""
-PACKAGECONFIG[fontforge] = "--enable-source-rebuild=yes,--enable-source-rebuild=no,fontforge-native"
-FILES_${PN} = "${datadir}/fonts ${datadir}/fontconfig"
-- 
2.29.2

