Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web09.1063.1603478630598552521
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Oct 2020 11:43:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=LD5t5AXl;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id c194so2707889wme.2
        for <openembedded-core@lists.openembedded.org>; Fri, 23 Oct 2020 11:43:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=mzd5D12tkao7Z4XzSDDgIqcPE7F+NRczvbZjt0l4Ee0=;
        b=LD5t5AXlnp0w1KVQfjVWk/5R+vosFonwDKYgkff1vV7xDt6uH7brtF1o/QbMjbw1SA
         ONZrS8uv6IvD437dI9R276lvAiNI+mIWo2egdkQ+QVPRBJIyTcR+jCXn0bPKUpciSArK
         QdFpy4F/hvqboOe6eeFX4JgxzlY/oJUvgMHnvf6nmPujakQyWPxKdZQs4uvtk3CSv4rE
         jK6d6nIM4aiNSAmf0IDqb5wZr6dGynhs1UZDdWr3dXz7GDyk+cyby0dw1HwyArFOJhrW
         kxvy8nytIM4sWYhRClXB93QZFXZriaopVYplcb/UDSSW16tqHn/42IfbCIoddgof2RzT
         5J5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mzd5D12tkao7Z4XzSDDgIqcPE7F+NRczvbZjt0l4Ee0=;
        b=RyteoeyzRrdsGAtk8UjvOmf/6e2w1u2PqdBkN7GGFUQRQ+xlFPYL7gKwLraY8/eIU2
         0xoNTqGUsikoMjiz/FQ8e9deOQs9/oi9+uzznkKaaKUG95O6Q7mrnuQjvMoMcZ0Bb28A
         JPYf20W8/77htT1HtjKDesrff5H28alQLQEZjNOuMDkMaiEOS11LQnuk7UXhd6q/ZK64
         eq2+n2cGSpS40RiwAT05siGpG5MRJ8yizH9AObQ9Cpt21U4S5Y3CNhnKCanhjVA+p7nN
         OCb8bJN/cBKFKqAE2oxlQxY00GVC+FxMV/caiA2WpJONffNJ/iJVemQ5gyZFTMj0tjrO
         UUOQ==
X-Gm-Message-State: AOAM533EE9iN274CltqZYaZt9JG+JmvrcBAiGPmhOzwrdVDdum/A4dsQ
	+mdQpfV1CF7OsaOXI9bdzGQwiLDXWHRP9w==
X-Google-Smtp-Source: ABdhPJyDVLUroM9QdYZANUfEe2zOhGEc45VHNau0Z+eR3eoPk2dRcaHiadR6jyFUaGafReUV4SRZuw==
X-Received: by 2002:a1c:2042:: with SMTP id g63mr3540753wmg.174.1603478628887;
        Fri, 23 Oct 2020 11:43:48 -0700 (PDT)
Return-Path: <quaresma.jose@gmail.com>
Received: from dragon.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id b7sm4999302wrp.16.2020.10.23.11.43.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2020 11:43:48 -0700 (PDT)
From: "Jose Quaresma" <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH v4 07/21] gstreamer1.0-plugins-good: add new meson option as PACKAGECONFIG
Date: Fri, 23 Oct 2020 19:41:18 +0100
Message-Id: <20201023184132.3208737-8-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20201023184132.3208737-1-quaresma.jose@gmail.com>
References: <20201023184132.3208737-1-quaresma.jose@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 .../gstreamer/gstreamer1.0-plugins-good_1.18.0.bb               | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.18.0.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.18.0.bb
index ad3eabd0be..860b31106f 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.18.0.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.18.0.bb
@@ -20,6 +20,7 @@ RPROVIDES_${PN}-soup += "${PN}-souphttpsrc"
 PACKAGECONFIG ??= " \
     ${GSTREAMER_ORC} \
     ${@bb.utils.filter('DISTRO_FEATURES', 'pulseaudio x11', d)} \
+    ${@bb.utils.contains('TUNE_FEATURES', 'm64', 'asm', '', d)} \
     bz2 cairo flac gdk-pixbuf gudev jpeg lame libpng mpg123 soup speex taglib v4l2 \
 "
 
@@ -27,6 +28,7 @@ X11DEPENDS = "virtual/libx11 libsm libxrender libxfixes libxdamage"
 X11ENABLEOPTS = "-Dximagesrc=enabled -Dximagesrc-xshm=enabled -Dximagesrc-xfixes=enabled -Dximagesrc-xdamage=enabled"
 X11DISABLEOPTS = "-Dximagesrc=disabled -Dximagesrc-xshm=disabled -Dximagesrc-xfixes=disabled -Dximagesrc-xdamage=disabled"
 
+PACKAGECONFIG[asm]        = "-Dasm=enabled,-Dasm=disabled,nasm"
 PACKAGECONFIG[bz2]        = "-Dbz2=enabled,-Dbz2=disabled,bzip2"
 PACKAGECONFIG[cairo]      = "-Dcairo=enabled,-Dcairo=disabled,cairo"
 PACKAGECONFIG[dv1394]     = "-Ddv1394=enabled,-Ddv1394=disabled,libiec61883 libavc1394 libraw1394"
-- 
2.29.0

