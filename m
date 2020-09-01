Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com [209.85.214.193])
 by mx.groups.io with SMTP id smtpd.web11.15514.1598973760583416596
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Sep 2020 08:22:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=j1hgoDxu;
 spf=pass (domain: gmail.com, ip: 209.85.214.193, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f193.google.com with SMTP id l9so689153plt.8
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Sep 2020 08:22:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id;
        bh=/1nIhkbNMsTBagv138TEXrs4PL27zkPWgdd4KmCuPvE=;
        b=j1hgoDxuoDU1RP2zJlOpWXM1mRH7NeWq7Ya8SctT9HB4qcHZ+OHyR9eruCHsLLZCCm
         dXC1gxPM3XGyYWqoEUTHFpY/cR5Ou48w8X8beBXEouii4ycxZbgF+es+CrtQqP0Ws5Sk
         OqDdVwqkJZsOSODwHfB+f8oPLTB4HzHw0XolSixPzWFXWL7Y5G2Kh+VH3cbr2rxzCvXF
         5FnR4rGHT6cltvSX8LA7n4lKXLhfZcucBeldX7NQ0BR8xj4onPBC87VPV7RmYAYwQgBI
         7gLrm+DMfRb+YHL5ffKLAPsQjCwdpQX9SWqo7xPGDnEZLXZRoyvlCgiqzDrjpgU4LfDE
         5e1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id;
        bh=/1nIhkbNMsTBagv138TEXrs4PL27zkPWgdd4KmCuPvE=;
        b=EFAXZBisZdFxkLOTLegXVATpnuEpz+nLDHacWYfD+7xkGw+AnBmFzv68PwCHkL2bNt
         5sTnwjTzVKJReLwp7r/E9ZBuHWK3x6CT+APzfcdeevy3rzlKQMrdYCWlczI/rM84eDS5
         bRf0lEOtVNyNScCpQXXHzpPbubJ/+5rPmzCzGmvuyGHcuIAksOWt8bowlK3JwGmBrzaE
         Abt3HwEy88JzmaMHN7HDDTc1CWwGL3clJiMXArN5IDEHnBouCAigqz9fRwuAMhPXJ7oO
         vTidhRFPjXghRjgCIGofm99EhIWDLVopi0OQXum9JjXbR/+OuoCfAYsrsmL8HyEnJIl2
         R8Vg==
X-Gm-Message-State: AOAM533TVKDXwXV9qT8VfHPpHAKhay0T2UwZWPQ9DhGy1UG+YW+wgiyG
	/IfQTktHTMUERt4wuhyStBXmtcphk84=
X-Google-Smtp-Source: ABdhPJz1yijoieOzbf0jYBe/GPxt6iiDeJBo3Ju/JfvSvJlKYYCMb0FT3SmJoQphAT2eNE/eGm5AyQ==
X-Received: by 2002:a17:902:bb93:: with SMTP id m19mr1824128pls.77.1598973759072;
        Tue, 01 Sep 2020 08:22:39 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:9dcf:ebf9:1f19:e8a8])
        by smtp.gmail.com with ESMTPSA id u5sm2217917pfm.149.2020.09.01.08.22.36
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2020 08:22:37 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/8] log4cplus: move meta-oe pkg to core
Date: Tue,  1 Sep 2020 08:22:29 -0700
Message-Id: <20200901152236.9377-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1

pkg need for kea

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../log4cplus/log4cplus_2.0.5.bb              | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)
 create mode 100644 meta/recipes-devtools/log4cplus/log4cplus_2.0.5.bb

diff --git a/meta/recipes-devtools/log4cplus/log4cplus_2.0.5.bb b/meta/recipes-devtools/log4cplus/log4cplus_2.0.5.bb
new file mode 100644
index 00000000000..967ac7623a3
--- /dev/null
+++ b/meta/recipes-devtools/log4cplus/log4cplus_2.0.5.bb
@@ -0,0 +1,19 @@
+SUMMARY = "log4cplus provides a simple C++ logging API for log management"
+SECTION = "libs"
+HOMEPAGE = "http://sourceforge.net/projects/log4cplus/"
+BUGTRACKER = "http://sourceforge.net/p/log4cplus/bugs/"
+
+LICENSE = "Apache-2.0 & BSD-2-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=41e8e060c26822886b592ab4765c756b"
+
+SRC_URI = "${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}-stable/${PV}/${BP}.tar.gz \
+          "
+SRC_URI[md5sum] = "71dd956bf686195127559671f1426cff"
+SRC_URI[sha256sum] = "c07115c23219390633798def30b7b51a0f79fdeb857e4b49632f17746d0ceb97"
+
+UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/log4cplus/files/log4cplus-stable/"
+UPSTREAM_CHECK_REGEX = "log4cplus-stable/(?P<pver>\d+(\.\d+)+)/"
+
+inherit autotools pkgconfig
+
+BBCLASSEXTEND = "native"
-- 
2.17.1

