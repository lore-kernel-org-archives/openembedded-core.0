Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
 by mx.groups.io with SMTP id smtpd.web08.3866.1603919190761889239
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Oct 2020 14:06:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Q/FNnF2y;
 spf=pass (domain: gmail.com, ip: 209.85.208.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f43.google.com with SMTP id v4so1000056edi.0
        for <openembedded-core@lists.openembedded.org>; Wed, 28 Oct 2020 14:06:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=j5YFMVbR5Pc3OxHNnzstuCug2vCFIu3RoCF3rLPUf5s=;
        b=Q/FNnF2yUEr2YEKNllFgGUwHbAcPyrFRQL8e5dT0zvd3hfmk7hv45t/Ra28qmP9YWW
         SNX1Jlulu/cWzBnQrBCLc3uBgl22xLE+v182+7fZ4WMEkFKUOaBIZcTggb91STfAM3OY
         M84ub0BEu1OHpVFoFmsfoRnvK7FT9FIryv5futD0NHUM85dp7jekQCEYAMvGZdgDh/Gs
         DfpC0Ta6Xi0nLd+OKjxywA729DPpZ09F6u+ji6kUqj81QMld4oeGA4HwfBecfNDrdH+t
         dUtSmomxYuk+Jj2ayH5WZnDdmPz3Cr5IX49oYdy/DPw9IjI7FDFcg01NBHlPwvAGTpDn
         bZpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=j5YFMVbR5Pc3OxHNnzstuCug2vCFIu3RoCF3rLPUf5s=;
        b=AmwXSw2YKnrG7r/GuTpaSz2E/1bKamb6YaeBjLdDIsuNCEwuJil9ACCuGXLY1n1NNz
         a1ZXBS1AdYZCiqwbF1AmDKc1i7s1H+TCAmPHOyJBJvY7HWyi5jCPY5hZWHqh/yp9YyFU
         atwhQAj1dKTppbqO/NfhTcmI5bg8ZA5jlKXRFE9R+HcEGiWBBTeNizkb2hrvzVyGtuUD
         aGzzz3W6yJLPPDPqtzCRV+PlQJmtU+APPfrE6Dm+5x6iVqTaolxl/fRenoRbiBMG25ZB
         L6pvyZYphS72O2d3p1gCXQUroOsOQcyvZHbs+ZBi9YtJ0/bfy0FnysnnfU/d1Plo5SX4
         n9xQ==
X-Gm-Message-State: AOAM533y4awFXha8fGxXnagVRQFa6Zf2ph3Ol+s7rqWaR1hj8d4+rZaT
	2dM8j/uK56AtgZRNeDGPrjQZN8Jd4EneLA==
X-Google-Smtp-Source: ABdhPJwYFFRJsEjtrZANUuAeHHLYDJh1VhvoaCVxDh5ka8qMhq8aj8ZSsOsI0izkQj3mTCRt9q0Nww==
X-Received: by 2002:a05:6402:1d87:: with SMTP id dk7mr850147edb.222.1603919189116;
        Wed, 28 Oct 2020 14:06:29 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.fritz.box ([2a02:2450:1011:4f7:596d:bf31:3950:5bda])
        by smtp.gmail.com with ESMTPSA id q25sm352434eja.86.2020.10.28.14.06.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2020 14:06:28 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 26/33] libportal: add a recipe
Date: Wed, 28 Oct 2020 22:05:51 +0100
Message-Id: <20201028210558.21070-26-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20201028210558.21070-1-alex.kanavin@gmail.com>
References: <20201028210558.21070-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is a new build requirement of epiphany browser.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/conf/distro/include/maintainers.inc      |  1 +
 meta/recipes-gnome/libportal/libportal_0.3.bb | 13 +++++++++++++
 2 files changed, 14 insertions(+)
 create mode 100644 meta/recipes-gnome/libportal/libportal_0.3.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 7935f968c7..6458829662 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -367,6 +367,7 @@ RECIPE_MAINTAINER_pn-libpcre = "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER_pn-libpcre2 = "Armin Kuster <akuster808@gmail.com>"
 RECIPE_MAINTAINER_pn-libpipeline = "Wang Mingyu <wangmy@cn.fujitsu.com>"
 RECIPE_MAINTAINER_pn-libpng = "Anuj Mittal <anuj.mittal@intel.com>"
+RECIPE_MAINTAINER_pn-libportal = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER_pn-libproxy = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER_pn-libpthread-stubs = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER_pn-libpsl = "Anuj Mittal <anuj.mittal@intel.com>"
diff --git a/meta/recipes-gnome/libportal/libportal_0.3.bb b/meta/recipes-gnome/libportal/libportal_0.3.bb
new file mode 100644
index 0000000000..022628b1ac
--- /dev/null
+++ b/meta/recipes-gnome/libportal/libportal_0.3.bb
@@ -0,0 +1,13 @@
+SUMMARY = "libportal provides GIO-style async APIs for most Flatpak portals."
+LICENSE = "LGPLv2.1"
+LIC_FILES_CHKSUM = "file://COPYING;md5=5f30f0716dfdd0d91eb439ebec522ec2"
+
+SRC_URI = "git://github.com/flatpak/${BPN}.git;protocol=https"
+SRCREV = "a609e06d0c4adc5c510cf9ac7b060db3d368e78f"
+S = "${WORKDIR}/git"
+
+GTKDOC_MESON_OPTION = 'gtk_doc'
+
+inherit meson gtk-doc
+
+DEPENDS += "glib-2.0 glib-2.0-native"
-- 
2.29.0

