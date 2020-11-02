Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.web12.1181.1604335790230572812
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Nov 2020 08:49:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=vChqJaLJ;
 spf=pass (domain: gmail.com, ip: 209.85.218.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f43.google.com with SMTP id gn41so2500368ejc.4
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Nov 2020 08:49:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=RJ6hRkIAevSEJ2SsiYHRFOl8Y/8FoSKw1McVKqUMD8A=;
        b=vChqJaLJTaOpiPv1pGP6s/ga48jrUFjKlk1Wgw0uqC0HqbNrzq4K8qaQuq8gZmSeNp
         YtqyaNZbpemp6hpkUqyl4TcYxd2ZGUmwdmOTszy20DIJ47EUOaY37G3rr+78LolG3yY7
         KuwyqGpAR1DqBijBq3QRgxJRVjDKV+WjkRiHGrssUp39ETOs7oyaEOmR8o5BCZjAi3zm
         cVspRKEaBCI8g8FLYaP77wZXPbpVCuoBBdGokihmGSSL+ttxOcsKh805tIH2E0ERJiEH
         3m0J6l9IEudpV5oPzpv2aG1eOapfJbbh+i1mxssY7j0Q2fxPTo8EnyZEgZw+vVWABrnP
         DI6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=RJ6hRkIAevSEJ2SsiYHRFOl8Y/8FoSKw1McVKqUMD8A=;
        b=Wcs+4I4hi+SeMl5Pl428Sd6jNTrX+sak8X+QA5KrCALfNhmEvywAO7RNk++UIOc4u4
         rkuGOAXG0vC1dS2k0BA941OTm8WlPxstpQkvcqVEApFs86Bs7TLHGqodoutldJI546HN
         mxMoSuIj+7IvSc2Q/WjChk+9HLO6qIFxODojtwSPjNJInbuifZ+7fGEuRq++yJaFaKD6
         9DWlYi3MkSUPWDXR/OKB+9YGmavgC1jdJIW86KPz2FWvMqFbI2MJAFgLdc7IjvLKbLkM
         PxHFwZMvUyaPgKbYvAQPGldKhcM0s58Qx36mOAznjknX8F3ekIihjf6m121GWcJCtXv7
         TWCg==
X-Gm-Message-State: AOAM531AZ56PTJTws04JoPy3lGMnCnUR+0GaePVP9FWUIBmy3YEJMhPl
	RJY5G9HQ2ttmCG2yjBRJOt3XsVDFVUxkTQ==
X-Google-Smtp-Source: ABdhPJwxoCJJKcS2LmXkyGx7M5jurND5npz3pcPpODUW52iz7/bFUY6Oprwy2vGDEyfSoLFcLA7Lxw==
X-Received: by 2002:a17:906:c041:: with SMTP id bm1mr15891043ejb.202.1604335788500;
        Mon, 02 Nov 2020 08:49:48 -0800 (PST)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.fritz.box ([2a02:2450:1011:4f7:596d:bf31:3950:5bda])
        by smtp.gmail.com with ESMTPSA id us11sm9864781ejb.91.2020.11.02.08.49.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2020 08:49:47 -0800 (PST)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 35/80] libva: upgrade 2.8.0 -> 2.9.0
Date: Mon,  2 Nov 2020 17:48:22 +0100
Message-Id: <20201102164907.27572-35-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20201102164907.27572-1-alex.kanavin@gmail.com>
References: <20201102164907.27572-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-graphics/libva/libva-initial_2.8.0.bb        | 8 --------
 meta/recipes-graphics/libva/libva-initial_2.9.0.bb        | 5 +++++
 meta/recipes-graphics/libva/libva.inc                     | 2 ++
 .../libva/{libva_2.8.0.bb => libva_2.9.0.bb}              | 3 ---
 4 files changed, 7 insertions(+), 11 deletions(-)
 delete mode 100644 meta/recipes-graphics/libva/libva-initial_2.8.0.bb
 create mode 100644 meta/recipes-graphics/libva/libva-initial_2.9.0.bb
 rename meta/recipes-graphics/libva/{libva_2.8.0.bb => libva_2.9.0.bb} (81%)

diff --git a/meta/recipes-graphics/libva/libva-initial_2.8.0.bb b/meta/recipes-graphics/libva/libva-initial_2.8.0.bb
deleted file mode 100644
index f90bb510c4..0000000000
--- a/meta/recipes-graphics/libva/libva-initial_2.8.0.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require libva.inc
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=2e48940f94acb0af582e5ef03537800f"
-SRC_URI[sha256sum] = "adbb1244d278908f89ccfcf254a442de6d71934565a492cb6f03caf2ed4d1ec3"
-
-do_install_append () {
-	rm -f ${D}${libdir}/*.so*
-}
diff --git a/meta/recipes-graphics/libva/libva-initial_2.9.0.bb b/meta/recipes-graphics/libva/libva-initial_2.9.0.bb
new file mode 100644
index 0000000000..5c6abeafe6
--- /dev/null
+++ b/meta/recipes-graphics/libva/libva-initial_2.9.0.bb
@@ -0,0 +1,5 @@
+require libva.inc
+
+do_install_append () {
+	rm -f ${D}${libdir}/*.so*
+}
diff --git a/meta/recipes-graphics/libva/libva.inc b/meta/recipes-graphics/libva/libva.inc
index e7bec80c14..7b6f11674d 100644
--- a/meta/recipes-graphics/libva/libva.inc
+++ b/meta/recipes-graphics/libva/libva.inc
@@ -17,6 +17,8 @@ SECTION = "x11"
 LICENSE = "MIT"
 
 SRC_URI = "https://github.com/intel/libva/releases/download/${PV}/libva-${PV}.tar.bz2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=2e48940f94acb0af582e5ef03537800f"
+SRC_URI[sha256sum] = "e344c1392dde92696c9ffd9cb3c7277d0a3b912236eb4e0fdedf7f375434584b"
 
 S = "${WORKDIR}/libva-${PV}"
 
diff --git a/meta/recipes-graphics/libva/libva_2.8.0.bb b/meta/recipes-graphics/libva/libva_2.9.0.bb
similarity index 81%
rename from meta/recipes-graphics/libva/libva_2.8.0.bb
rename to meta/recipes-graphics/libva/libva_2.9.0.bb
index 621ceea86c..4d3fa50963 100644
--- a/meta/recipes-graphics/libva/libva_2.8.0.bb
+++ b/meta/recipes-graphics/libva/libva_2.9.0.bb
@@ -1,8 +1,5 @@
 require libva.inc
 
-LIC_FILES_CHKSUM = "file://COPYING;md5=2e48940f94acb0af582e5ef03537800f"
-SRC_URI[sha256sum] = "adbb1244d278908f89ccfcf254a442de6d71934565a492cb6f03caf2ed4d1ec3"
-
 PACKAGECONFIG ??= " \
     ${@bb.utils.contains('DISTRO_FEATURES', 'x11 opengl', 'glx', '', d)} \
     ${@bb.utils.filter('DISTRO_FEATURES', 'x11 wayland', d)} \
-- 
2.29.0

