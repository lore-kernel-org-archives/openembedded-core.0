Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web11.7061.1588683730254678840
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 May 2020 06:02:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=AFZ/PImO;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id z6so2252971wml.2
        for <openembedded-core@lists.openembedded.org>; Tue, 05 May 2020 06:02:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8kQpUXqqGq7uupKSU1ivHb92HM2t/UxL6jJQIWqgzkI=;
        b=AFZ/PImOrYfb8nr5ddBiy20AiL2NAlwpTZUTQ6124ySBscdoU3df+GqV8eRW0bEQoj
         r6aKUkXHrsIvyWYFWBdumWLx8HvfoHbFjgf3dKI3D8JQEzqgyCs/G/NhFhCnIukDQhja
         dcU9M9HfLmEO3NNDrLI6y6wONEACNOBTc1BYCVYSKR4jSLfn8D3ACMXF7nzDJjGg2F6T
         yNFY0IUI5MAS67fTdFTdWd7xWe6tHl2lbmWtg0bZgjppiEVqrmu2KY3jZ7ct89mWsk/p
         ayGpksIbgxYM8hsbmBZ96j23F6J/0Yk6rc/cSjhDCxqLGNIGJ6jSJyezLRXprdEfzsTC
         Q0nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8kQpUXqqGq7uupKSU1ivHb92HM2t/UxL6jJQIWqgzkI=;
        b=lSy/6PnF+GXXPd05jz9uNU1UYSaJ6kvRN8w2nYyyujnjUaM3cvEE6sec4/j89M2zSl
         /ITeTd0hDFJAHGTd7Vgyxkx3WCXcjlIS9kfim/RBNBSoXMEM7tr6mCTYlJtAcGdTfK1N
         AV0+qoOwE/+OEz2TPEeZIcVQoN+WLlR4zDCIfVIf805hFoseABQxGIVwIcUti38xSjQa
         8YXBl3h5iT1Jpsu3Q6yeqYKtCfCpg8Atk6mZ3fmvsPUUbkKNW4i5iOMaHuXGBamnbbY0
         yPMZETl8ra5t8DoFZUGqiMTLTCW6yLKY/SfbEgsR0HWSQ//921oO9h3lQ06/7TE+f+ex
         PZYg==
X-Gm-Message-State: AGi0PubFqDb653TRAz5/evVlTL3q6ZqW/vSTu3gItvzWqw1LF9ViXQsd
	ceEoAwgXJ1MLiJAXqmwsfwwfX0FL
X-Google-Smtp-Source: APiQypJSSTM2F/dR35NVgfOpbxCl7Kl77CyIyuU/tOQttGoyEt2+yuLBhkrfpha32qWcCrgeI+8Wqw==
X-Received: by 2002:a7b:c955:: with SMTP id i21mr3640977wml.25.1588683728531;
        Tue, 05 May 2020 06:02:08 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.box ([5.28.69.65])
        by smtp.gmail.com with ESMTPSA id h16sm3388113wrw.36.2020.05.05.06.02.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2020 06:02:07 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 08/24] libhandy: add a recipe from meta-oe
Date: Tue,  5 May 2020 15:01:17 +0200
Message-Id: <20200505130133.24930-8-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200505130133.24930-1-alex.kanavin@gmail.com>
References: <20200505130133.24930-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is needed by new versions of epiphany browser.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/conf/distro/include/maintainers.inc    |  1 +
 meta/recipes-gnome/libhandy/libhandy_git.bb | 21 +++++++++++++++++++++
 2 files changed, 22 insertions(+)
 create mode 100644 meta/recipes-gnome/libhandy/libhandy_git.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 54b3c5678c..7d67643cea 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -337,6 +337,7 @@ RECIPE_MAINTAINER_pn-libgloss = "Alejandro Hernandez <aehs29@gmail.com>"
 RECIPE_MAINTAINER_pn-libglu = "Ross Burton <ross.burton@intel.com>"
 RECIPE_MAINTAINER_pn-libgpg-error = "Hongxu Jia <hongxu.jia@windriver.com>"
 RECIPE_MAINTAINER_pn-libgudev = "Ross Burton <ross.burton@intel.com>"
+RECIPE_MAINTAINER_pn-libhandy = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER_pn-libical = "Ross Burton <ross.burton@intel.com>"
 RECIPE_MAINTAINER_pn-libice = "Armin Kuster <akuster808@gmail.com>"
 RECIPE_MAINTAINER_pn-libid3tag = "Tanu Kaskinen <tanuk@iki.fi>"
diff --git a/meta/recipes-gnome/libhandy/libhandy_git.bb b/meta/recipes-gnome/libhandy/libhandy_git.bb
new file mode 100644
index 0000000000..64258941ee
--- /dev/null
+++ b/meta/recipes-gnome/libhandy/libhandy_git.bb
@@ -0,0 +1,21 @@
+SUMMARY = "A library full of GTK+ widgets for mobile phones"
+LICENSE = "LGPLv2.1"
+LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
+
+SRC_URI = "git://source.puri.sm/Librem5/${BPN}.git;protocol=https"
+SRCREV = "7a193d7692c9c76a1a94f17c4d30b585f77d177c"
+S = "${WORKDIR}/git"
+PV = "0.0.13"
+
+GIR_MESON_ENABLE_FLAG = 'enabled'
+GIR_MESON_DISABLE_FLAG = 'disabled'
+GTKDOC_MESON_OPTION = 'gtk_doc'
+
+inherit meson gobject-introspection vala gettext gtk-doc features_check
+
+ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
+
+DEPENDS += "gtk+3"
+
+PACKAGES =+ "${PN}-examples"
+FILES_${PN}-examples = "${bindir}"
-- 
2.26.1

