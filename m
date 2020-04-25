Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com [209.85.221.67])
 by mx.groups.io with SMTP id smtpd.web12.1102.1587841252219228825
 for <openembedded-core@lists.openembedded.org>;
 Sat, 25 Apr 2020 12:00:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=gMQbsTM1;
 spf=pass (domain: gmail.com, ip: 209.85.221.67, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f67.google.com with SMTP id f13so15574741wrm.13
        for <openembedded-core@lists.openembedded.org>; Sat, 25 Apr 2020 12:00:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=z6wzbHLl0guFStdLsKIR8zbzySuTcFVVggYNMzR176I=;
        b=gMQbsTM1ZOD3Ojl6Ae1O/lrA7yAwmA0vPJ6HYYI5s69yAdCs3qMutOQdCu874UpZ33
         4Uc4p+Z3rv3Uzz6MXo9xdk4MIXV7oHfP1c3WLbblzimH7Rv2FjOspuIAAdA7xKengMC+
         MBw3gceSCef6WhZJ57mu+stPQ9Uf2zSJvrqhfXx7P1NuYoGtZr0XjMDYF+4CF+uZy2Sa
         Vql35Ri6j78nBUcZwFgPLspGQu+EGzBgRRLmolWGkozbHFUSoZ8Y/2uygzYpXiW+9eud
         eLxZ/svhsyixQxUe6VWhQocZl8av6gerdFz7KxqnGmEPl9GreItzVKBMmRqJTf9VOKSo
         WF7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=z6wzbHLl0guFStdLsKIR8zbzySuTcFVVggYNMzR176I=;
        b=RYUVx4rabZP3EBg8IZ/21ULqIibb2ZWAWpir7596HDWQPlvtz1U+2nlDLRkEH4NNPW
         ABMfZKV9NNcYa+0InZBHetk2YobPNfygC6qWZmxLgQvQI1a0LKCARAtJYReH0LOMoEXm
         R7eCYr5uE5RHV8r7Oa/LYmXO25YRaCtiPPh7NovbO+MMgbaFb8KHnutXCKPhxewGNch7
         RhgY3+h0StDuYzJ1BCTmV7MQhYlNi/GVk1Q46QNsvIRMhDKl5Vl8tOiYqxoa8oWzFRj1
         qcIIEjDfHmreS6UuxGqsUuyz1OKfYv9MRMuuR67TTuZ2qztKi0KOi6vdDxql9b19P+SX
         BzbQ==
X-Gm-Message-State: AGi0PuatRvwURxT1OP7Gw4OZECXNzzVXw6o+DEmm4UTsST/R+tZdsF1o
	Bztk5qk95P1XB5gAWBSl1Wm/jVqX
X-Google-Smtp-Source: APiQypJMQzmyxms9QWhDzVhjrxDL91ts7fR766975N4HyU107h6AXr/Wd0uDLzJlgjrxmxaSa0IRgA==
X-Received: by 2002:adf:fe51:: with SMTP id m17mr18106301wrs.414.1587841249811;
        Sat, 25 Apr 2020 12:00:49 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.box ([5.28.69.65])
        by smtp.gmail.com with ESMTPSA id n25sm3494135wmk.9.2020.04.25.12.00.49
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Apr 2020 12:00:49 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/3] libsdl2: enable opengl option for native/nativesdk, subject to 'opengl' in DISTRO_FEATURES
Date: Sat, 25 Apr 2020 21:00:17 +0200
Message-Id: <0cb54b6d4bb291664e762510d565a359a586c7ed.1587841042.git.alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <cover.1587841042.git.alex.kanavin@gmail.com>
References: <cover.1587841042.git.alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This allows virgl support in qemu with the SDL frontend

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-graphics/libsdl2/libsdl2_2.0.12.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/libsdl2/libsdl2_2.0.12.bb b/meta/recipes-graphics/libsdl2/libsdl2_2.0.12.bb
index c1c941e452..83dce86801 100644
--- a/meta/recipes-graphics/libsdl2/libsdl2_2.0.12.bb
+++ b/meta/recipes-graphics/libsdl2/libsdl2_2.0.12.bb
@@ -45,8 +45,8 @@ EXTRA_OECONF = "--disable-oss --disable-esd --disable-arts \
 # and BSP layers to pick either (desktop) opengl, gles2, or no GL
 PACKAGECONFIG_GL ?= "${@bb.utils.filter('DISTRO_FEATURES', 'opengl', d)}"
 
-PACKAGECONFIG_class-native = "x11"
-PACKAGECONFIG_class-nativesdk = "${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)}"
+PACKAGECONFIG_class-native = "x11 ${PACKAGECONFIG_GL}"
+PACKAGECONFIG_class-nativesdk = "${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)} ${PACKAGECONFIG_GL}"
 PACKAGECONFIG ??= " \
     ${PACKAGECONFIG_GL} \
     ${@bb.utils.filter('DISTRO_FEATURES', 'alsa directfb pulseaudio x11', d)} \
-- 
2.26.1

