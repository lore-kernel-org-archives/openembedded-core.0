Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com [209.85.208.65])
 by mx.groups.io with SMTP id smtpd.web12.17615.1590940440325526469
 for <openembedded-core@lists.openembedded.org>;
 Sun, 31 May 2020 08:54:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=JK8sZ8PD;
 spf=pass (domain: gmail.com, ip: 209.85.208.65, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f65.google.com with SMTP id m21so5383791eds.13
        for <openembedded-core@lists.openembedded.org>; Sun, 31 May 2020 08:54:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=DBMQnOqcZUAiCPvZWagQ40RiNwfi3kncfKX1vmsr/3Y=;
        b=JK8sZ8PDUQJ77t3nWXOnNA2mHCfEPeaHAo/VeQC5DxMRAc4QzgEvPpi0sUovnfyTNX
         VyTtoSxXvC6XFdBdcizxyjApQVzaEGQ6VLYp9zRqZE7XDEXK8k95PpOmQ0pF4ZjFqQOj
         rZ243kizn115A9iCqpZnntP2bVr0Qmr28xyPkIfuC0UxSK9ZEyZohD+9TFYnJbYFYGOf
         1+1Wbd9v2LVtk30tHUPXBrXs2p/8XfTSYY12owKg5F5BgfplMusD3JleaU+amVNral1j
         Gqr1dRrMxVOpthjGyR50PQcyIrl8srzulqx7Og224ojs2gGc5wlfjDDUP+hLkyc+ki8k
         speQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DBMQnOqcZUAiCPvZWagQ40RiNwfi3kncfKX1vmsr/3Y=;
        b=gcRYyUsidQxQjmZALcMMKAd64oER2dHa+RTdYbxqKlIBLcC6gLjWT0BW1yA7emXuQ3
         9rR72kyF6tsZgCL2PUHbHG43QcOjrOwhW8AiUOq9mSaW1Sch+E3bbSA3WxCTVzJWqNSq
         VZK6AUZgP5XxOewcf/MhcrVoD4aWXs4hzsf9O1jNEoVckKzYLyET0sYiCF8OA1csJNqW
         TuyOoWZGmx+4xdZ47nB6mvQ3+D6MIWJTv0BHirju5p49yqyo7zb7xglgzdOzb8G7UzTS
         +k0viK395ni7/LotMewIbH533ws5bUtS2An83XxOYFpsj3nrmdNUtDGkrbMQT1nqvceD
         0akA==
X-Gm-Message-State: AOAM532QTK1rhCrH5gKVIrzweU8sG/U+w6hMtInOTfop4iVHecCWE0TP
	Jw2Stu68v0XaO9yPCMJcBUnOGslA
X-Google-Smtp-Source: ABdhPJwOP5ss5J5fU3fbnMRQlKOqMNA+F/3NXyd0ObSPh7vb76j0BbmqMoZWkZxY6uyAg2GDERm+9A==
X-Received: by 2002:aa7:c646:: with SMTP id z6mr17978978edr.13.1590940438650;
        Sun, 31 May 2020 08:53:58 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.site ([2a02:2450:1011:56f:238d:84be:b349:9184])
        by smtp.gmail.com with ESMTPSA id dn15sm13227042ejc.26.2020.05.31.08.53.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2020 08:53:58 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 36/70] powertop: upgrade 2.10 -> 2.12
Date: Sun, 31 May 2020 17:52:20 +0200
Message-Id: <20200531155254.10283-36-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200531155254.10283-1-alex.kanavin@gmail.com>
References: <20200531155254.10283-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../powertop/{powertop_2.10.bb => powertop_2.12.bb}        | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)
 rename meta/recipes-kernel/powertop/{powertop_2.10.bb => powertop_2.12.bb} (81%)

diff --git a/meta/recipes-kernel/powertop/powertop_2.10.bb b/meta/recipes-kernel/powertop/powertop_2.12.bb
similarity index 81%
rename from meta/recipes-kernel/powertop/powertop_2.10.bb
rename to meta/recipes-kernel/powertop/powertop_2.12.bb
index f1b0e92b2b..f085d9b482 100644
--- a/meta/recipes-kernel/powertop/powertop_2.10.bb
+++ b/meta/recipes-kernel/powertop/powertop_2.12.bb
@@ -2,18 +2,18 @@ SUMMARY = "Power usage tool"
 DESCRIPTION = "Linux tool to diagnose issues with power consumption and power management."
 HOMEPAGE = "https://01.org/powertop/"
 BUGTRACKER = "https://app.devzing.com/powertopbugs/bugzilla"
-DEPENDS = "ncurses libnl pciutils"
+DEPENDS = "ncurses libnl pciutils autoconf-archive"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=12f884d2ae1ff87c09e5b7ccc2c4ca7e"
 
 SRC_URI = "git://github.com/fenrus75/powertop;protocol=https \
     file://0001-wakeup_xxx.h-include-limits.h.patch \
 "
-SRCREV = "e8765b5475b22b7a2b6e9e8a031c68a268a0b0b3"
+SRCREV = "6988eaaa5bbcfff1dd86f757006c6c48cec965c5"
 
 S = "${WORKDIR}/git"
 
-inherit autotools gettext pkgconfig
+inherit autotools gettext pkgconfig bash-completion
 
 # we do not want libncursesw if we can
 do_configure_prepend() {
@@ -22,6 +22,7 @@ do_configure_prepend() {
     mkdir -p ${B}/src/tuning/
     echo "${PV}" > ${S}/version-long
     echo "${PV}" > ${S}/version-short
+    cp ${STAGING_DATADIR}/aclocal/ax_require_defined.m4 ${S}/m4/
 }
 
 inherit update-alternatives
-- 
2.26.2

