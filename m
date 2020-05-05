Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
 by mx.groups.io with SMTP id smtpd.web12.7167.1588683732996922973
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 May 2020 06:02:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=rXz7K1Sx;
 spf=pass (domain: gmail.com, ip: 209.85.128.67, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f67.google.com with SMTP id x4so2214414wmj.1
        for <openembedded-core@lists.openembedded.org>; Tue, 05 May 2020 06:02:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=i8GKXSobIoTsgSGcrSKmtMT94mTUFj6DXYtyFLbSeM0=;
        b=rXz7K1Sx9eGZnwRWnLgPIs5uhKcHcryKTTASNHWgCysQmygLWt1gyty32IXrF3LrkZ
         j6RA78Wij3d/dARH6US1qE2aeaGwGeHHn79U4fRQkXRlRnzwAM/ayYryDwWpz08f60ZL
         uKHWEBygNbhuVzeuqTzheEdFUNC+d33rATH/X71UfrmYia0sAU1+1jE/GV7A3wVxyCx8
         p+5uEccWrNNu2gz7uV7tyR/t5oP+0XHqWMhpHl9uVOZY1b+huKVJ8qc6AzfNs+cCCDNa
         V3+vc+ROJIeXV11sG7L4bWM9Hm+P1KbHBBMk/H0/BQjVwHazDlG/3QuFOvnT/OB2A7wt
         x2tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=i8GKXSobIoTsgSGcrSKmtMT94mTUFj6DXYtyFLbSeM0=;
        b=F8GKbxwgfaLlWlY6PEs17W/Ll0OJ29IXwzj6th2kcAy6+x4eNDdcliS40cB1LL5kf3
         1In2JOrNiJJwIt616hHJpEKmUxUPW+QMpLTq02kLdhMqC/Vk+ie8dZIHS9C0BXO58wHq
         Z7VqDI4dno+n/1GBSW1xyfMVv00hOP/rn95JDkvt4g7+uAgePzoy1/58y7Pxd5sr3bIK
         IZxrcNESv0PXO8uKfLVRZI4qIrb+xaE66bTw3RtChxjw4PuAJABylHEOWch+fqRWcFO9
         uk1ayPNd6tSg41iVuOrGq1xzpG/3L2JCxJRPJq4rp2v35/4hAwzrD4gWoDdNZdF0PT9C
         tPAg==
X-Gm-Message-State: AGi0PuYRA8VFYS9Lwaf06BwC+NZR2hFhcJ3OBRByeAGxevmZteykeTws
	qj2dnAiD3wtMxxsIWQ52ZkQtOvJg
X-Google-Smtp-Source: APiQypJxzPUBRSu9vzL5ejgFxq4Bm7uQJMVmhRmJTjmde2Nrcrr1YyRFP16v1bbFaaI5MZWvo4Jc4A==
X-Received: by 2002:a1c:3985:: with SMTP id g127mr3311008wma.102.1588683730538;
        Tue, 05 May 2020 06:02:10 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.box ([5.28.69.65])
        by smtp.gmail.com with ESMTPSA id h16sm3388113wrw.36.2020.05.05.06.02.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2020 06:02:09 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 10/24] epiphany: update to 3.36.1
Date: Tue,  5 May 2020 15:01:19 +0200
Message-Id: <20200505130133.24930-10-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200505130133.24930-1-alex.kanavin@gmail.com>
References: <20200505130133.24930-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

libhandy is a new hard dependency.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../epiphany/{epiphany_3.34.4.bb => epiphany_3.36.1.bb}     | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-gnome/epiphany/{epiphany_3.34.4.bb => epiphany_3.36.1.bb} (79%)

diff --git a/meta/recipes-gnome/epiphany/epiphany_3.34.4.bb b/meta/recipes-gnome/epiphany/epiphany_3.36.1.bb
similarity index 79%
rename from meta/recipes-gnome/epiphany/epiphany_3.34.4.bb
rename to meta/recipes-gnome/epiphany/epiphany_3.36.1.bb
index ddb4c2794f..8146983aef 100644
--- a/meta/recipes-gnome/epiphany/epiphany_3.34.4.bb
+++ b/meta/recipes-gnome/epiphany/epiphany_3.36.1.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
 DEPENDS = "libsoup-2.4 webkitgtk gtk+3 iso-codes avahi libnotify gcr \
 	   gsettings-desktop-schemas libxml2-native \
-	   glib-2.0 glib-2.0-native json-glib libdazzle"
+	   glib-2.0 glib-2.0-native json-glib libdazzle libhandy"
 
 GNOMEBASEBUILDCLASS = "meson"
 inherit gnomebase gsettings features_check upstream-version-is-even gettext mime-xdg
@@ -14,8 +14,8 @@ REQUIRED_DISTRO_FEATURES = "x11 opengl"
 SRC_URI = "${GNOME_MIRROR}/${GNOMEBN}/${@gnome_verdir("${PV}")}/${GNOMEBN}-${PV}.tar.${GNOME_COMPRESS_TYPE};name=archive \
            file://0002-help-meson.build-disable-the-use-of-yelp.patch \
            "
-SRC_URI[archive.md5sum] = "a559f164bb7d6cbeceb348648076830b"
-SRC_URI[archive.sha256sum] = "60e190fc07ec7e33472e60c7e633e04004f7e277a0ffc5e9cd413706881e598d"
+SRC_URI[archive.md5sum] = "d66416d0be97ec7789564473337bfe57"
+SRC_URI[archive.sha256sum] = "f6f233fb43c6318476d4594707b3fdd5b4127b5e35263e73fbcad8895db8efb6"
 
 FILES_${PN} += "${datadir}/dbus-1 ${datadir}/gnome-shell/search-providers ${datadir}/metainfo"
 RDEPENDS_${PN} = "iso-codes adwaita-icon-theme gsettings-desktop-schemas"
-- 
2.26.1

