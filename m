Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web11.25497.1588523206524692869
 for <openembedded-core@lists.openembedded.org>;
 Sun, 03 May 2020 09:26:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=LGx/DKOY;
 spf=pass (domain: gmail.com, ip: 209.85.221.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f49.google.com with SMTP id l18so7253059wrn.6
        for <openembedded-core@lists.openembedded.org>; Sun, 03 May 2020 09:26:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Vp1jVdnGxYWLj4pi7bvBuXhMmKoJpP2qocDR3SLxcnM=;
        b=LGx/DKOYY2/m7oIp8pZAnLLd4IeG+6fS4h7EEs3wxnd5c6VtzetN4U0Dm3Iyc3P3Si
         xC/jzaDiUKULkx18K05TmJnpwa0ZHj1lBl9m6nGO7U+TVHYsnWEY5zV6kMQ9lu0J00l+
         s5v6mRxQ4eqRJd20B67SGyVtG+4KQOk7Y1NRgNUMpS8sgsESYuacYyTdE9rBih5YPK1C
         ErAfU7ccWBiXS4Bly7ZD7rp0akTxSxIsR5es/uDMzuNr4CQuMivnu2pxseX7fAgSF10b
         bfBR0++GOiN+Xx0oYgVy94oIyLCRXstn6DNdiuzVPcmFa7bzW+mcxz94RVhQ89uXZdBp
         SpvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Vp1jVdnGxYWLj4pi7bvBuXhMmKoJpP2qocDR3SLxcnM=;
        b=HkIS06CuZuLkfsP/r0LxG6KueSANzuP8c4wuDNAdDy5U0iwbSCFV4nhtZ3daz4itnk
         nKybgj2TW0Pq/NYVg4k0uCNXsWGHqnsMTzDFaxOwJZ87IAd8d/DtPZ0ZwwcCc/9RJquj
         RxvIWzo8Rf0Aa4moscRqPw+Ncco+CJBFHUzWYNx9ekVAbuqC1041qGSFJPTj2KJAlgtr
         O6rZZY3BoAyGmI18oqVJ6dLU3QOxGQYS4O8nFfM2hYbixQGihxb32600EorLsezsTb92
         oA7aR57FMOhjVoANYB7zOXpa3uk3sDnQCv5eJahpW6ODDtMrNex6LdqwCPP7EgtMcnh3
         kBnw==
X-Gm-Message-State: AGi0Pua0AA61PskwRxN//zuAHz9FFFc7eMicHhZKPFRdr7hbxEyi9KUJ
	00S2XrxqXd2spzu9LMFoA6rYIv2C
X-Google-Smtp-Source: APiQypKRkeZamQWoTESLQ0hjwG+rNWVDK8SGiKKVkHckuMvXSRsYubkt0o16JJaUpOgGQnYU8N/oJw==
X-Received: by 2002:adf:ed0e:: with SMTP id a14mr14395449wro.400.1588523204930;
        Sun, 03 May 2020 09:26:44 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.box ([5.28.69.65])
        by smtp.gmail.com with ESMTPSA id q18sm9079532wmj.11.2020.05.03.09.26.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 May 2020 09:26:44 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 17/17] gcr: update to 3.36.0
Date: Sun,  3 May 2020 18:25:59 +0200
Message-Id: <20200503162559.946-17-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200503162559.946-1-alex.kanavin@gmail.com>
References: <20200503162559.946-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert to meson build.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../gcr/{gcr_3.34.0.bb => gcr_3.36.0.bb}             | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)
 rename meta/recipes-gnome/gcr/{gcr_3.34.0.bb => gcr_3.36.0.bb} (75%)

diff --git a/meta/recipes-gnome/gcr/gcr_3.34.0.bb b/meta/recipes-gnome/gcr/gcr_3.36.0.bb
similarity index 75%
rename from meta/recipes-gnome/gcr/gcr_3.34.0.bb
rename to meta/recipes-gnome/gcr/gcr_3.36.0.bb
index 9853b3f416..4fe3b2fff3 100644
--- a/meta/recipes-gnome/gcr/gcr_3.34.0.bb
+++ b/meta/recipes-gnome/gcr/gcr_3.36.0.bb
@@ -11,12 +11,14 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=55ca817ccb7d5b5b66355690e9abc605"
 DEPENDS = "gtk+3 p11-kit glib-2.0 libgcrypt \
            ${@bb.utils.contains('GI_DATA_ENABLED', 'True', 'libxslt-native', '', d)}"
 
+GNOMEBASEBUILDCLASS = "meson"
+GTKDOC_MESON_OPTION = "gtk_doc"
 inherit gnomebase gtk-icon-cache gtk-doc features_check upstream-version-is-even vala gobject-introspection gettext mime mime-xdg
 # depends on gtk+3, but also x11 through gtk+-x11
 REQUIRED_DISTRO_FEATURES = "x11"
 
-SRC_URI[archive.md5sum] = "4af28919fb1dd36d93603e8230283b6f"
-SRC_URI[archive.sha256sum] = "29df50974a90987af694c0fb8926a6b366e68cacd8abd813817cfe1eb5d54524"
+SRC_URI[archive.md5sum] = "adc65563b6b458507b9a578a8b68fb61"
+SRC_URI[archive.sha256sum] = "aaf9bed017a2263c6145c89a1a84178f9f40f238426463e4ae486694ef5f6601"
 
 FILES_${PN} += " \
     ${datadir}/dbus-1 \
@@ -27,9 +29,3 @@ FILES_${PN} += " \
 ARM_INSTRUCTION_SET_armv4 = "arm"
 ARM_INSTRUCTION_SET_armv5 = "arm"
 ARM_INSTRUCTION_SET_armv6 = "arm"
-
-# These files may be out of date or missing our fixes
-# libgcrypt.m4 in particular is calling into libgcrypt-config
-do_configure_prepend() {
-    rm -f ${S}/build/m4/*
-}
-- 
2.26.1

