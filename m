Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web10.1222.1588282935175696886
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Apr 2020 14:42:36 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="key unavailable" header.i=@gmail.com header.s=20161025 header.b=PBLQeqsx;
 spf=pass (domain: gmail.com, ip: 209.85.221.43, mailfrom: schnitzeltony@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id c12so4011507wrp.0
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Apr 2020 14:42:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=aWzXpaggsosls/GZmdgU6k962Vlt+YFyHfNgOAXmQEM=;
        b=PBLQeqsxaaWVP8nxwlKXdc7dgZ40+zp7b+JQLqc9HWDFsPotZnQiLD2XpsrTV6lgKd
         mM6jTAeQbigAUGsDXi/Gk6Mli1NttsdQu5PIuW7+mkzjohXV0G8GNAEtZjUpj4jAe9Vf
         ZWRZj0d5d+wbFg9WtZRdob+3vrSDyNQeeujsV6pPoRsM/9mefNp4t55euDIa8ulNNE+s
         zd3j0n7fKAOo0jBXq6F+r08r2RnB8tFsAcPdgud4g2C+NTzDnsuq3NlzfdIJDYcAZGJZ
         uqZqMC0z7+Fjjc0BpX3SklBqQgHbYt3B6blC/6yMuzr1PDA6MBjgJxZw7+sMvhpc2Qj5
         OBCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=aWzXpaggsosls/GZmdgU6k962Vlt+YFyHfNgOAXmQEM=;
        b=DWLBRJJaK4EXTbK8T7RD05kk3DzVqsfHfwESbYReWyADc2Z2zcKpKM+F5KWi/fFU+8
         JUQTvQfSesbMuV42ViYuBn/2mrifEYonNLChh4Ki9oIENP2qUOznrL51MLYZ1xePcHc3
         4PK58hXzXiEzuBMnFCWwTRVWr9ggcQLWO/BfM+EPDTjp0LIO7ELpA/PwGI6g7djWOI7c
         CWrzQj8UQQw+Adcl+KQ5/pF4+1JAhesPf7cWVj/bORU1xYA+tZIZoHfeAT8WT4fZW13e
         n7ZF7TMIVW89KWo8M/lmXq30qJSls82CCVZ7yR61u+C5IuRfSrPVzKpdlQovSyfNAsFp
         pDNQ==
X-Gm-Message-State: AGi0PuZ6tF91SQqsbVixyK0h5N9XOKGt1bbFzfNhj5hOTOBavP73x4Zy
	8QoUanDMfM3chnk2JenRXKoWX6Bk
X-Google-Smtp-Source: APiQypIVAz4ZR8GoZY72MoezqYALPW6BZSAlkroTsYVgxOMvM7eM8VVKTai8xW7sKRSqWhaHGVo3Rg==
X-Received: by 2002:a05:6000:10c2:: with SMTP id b2mr720024wrx.118.1588282933176;
        Thu, 30 Apr 2020 14:42:13 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300F07F0ED4889B49C017C853F8D3.dip0.t-ipconnect.de. [2003:f0:7f0e:d488:9b49:c017:c853:f8d3])
        by smtp.gmail.com with ESMTPSA id q10sm1421069wrv.95.2020.04.30.14.42.12
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2020 14:42:12 -0700 (PDT)
From: "Andreas M?ller" <schnitzeltony@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] libnotify: upgrade 0.7.8 -> 0.7.9 / port to meson
Date: Thu, 30 Apr 2020 23:42:02 +0200
Message-Id: <20200430214203.26595-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From [1]:
New in 0.7.9
============
* Fixed linking in darwin [Iain, Marco; !5]
* Added man page for notify-send [Jan; !6]
* Dropped autotools [Jan; !11]

[1] http://ftp.gnome.org/pub/gnome/sources/libnotify/0.7/libnotify-0.7.9.news

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../{libnotify_0.7.8.bb => libnotify_0.7.9.bb}     | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)
 rename meta/recipes-gnome/libnotify/{libnotify_0.7.8.bb => libnotify_0.7.9.bb} (59%)

diff --git a/meta/recipes-gnome/libnotify/libnotify_0.7.8.bb b/meta/recipes-gnome/libnotify/libnotify_0.7.9.bb
similarity index 59%
rename from meta/recipes-gnome/libnotify/libnotify_0.7.8.bb
rename to meta/recipes-gnome/libnotify/libnotify_0.7.9.bb
index 0306b04f4e..38da41639b 100644
--- a/meta/recipes-gnome/libnotify/libnotify_0.7.8.bb
+++ b/meta/recipes-gnome/libnotify/libnotify_0.7.9.bb
@@ -7,12 +7,20 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=7fbc338309ac38fefcd64b04bb903e34"
 
 DEPENDS = "dbus gtk+3 glib-2.0"
 
-inherit gnomebase gtk-doc features_check gobject-introspection
+GNOMEBASEBUILDCLASS = "meson"
+
+inherit gnomebase gtk-doc features_check gobject-introspection manpages
 # depends on gtk+3
 ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 
-SRC_URI[archive.md5sum] = "babb4b07b5f21bef42a386d3d7019599"
-SRC_URI[archive.sha256sum] = "69209e0b663776a00c7b6c0e560302a8dbf66b2551d55616304f240bba66e18c"
+SRC_URI[archive.md5sum] = "ccd9c53364174cc8d13e18a1988faa76"
+SRC_URI[archive.sha256sum] = "66c0517ed16df7af258e83208faaf5069727dfd66995c4bbc51c16954d674761"
+
+GIR_MESON_ENABLE_FLAG = 'enabled'
+GIR_MESON_DISABLE_FLAG = 'disabled'
+GTKDOC_MESON_OPTION = 'gtk_doc'
+
+PACKAGECONFIG[manpages] = "-Dman=true,-Dman=false,libxslt-native xmlto-native"
 
 # there were times, we had two versions of libnotify (oe-core libnotify:0.6.x /
 # meta-gnome libnotify3: 0.7.x)
-- 
2.21.1

