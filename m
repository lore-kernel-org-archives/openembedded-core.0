Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
 by mx.groups.io with SMTP id smtpd.web12.5108.1615464327998536937
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Mar 2021 04:05:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=SYCRavfd;
 spf=pass (domain: gmail.com, ip: 209.85.208.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f41.google.com with SMTP id bx7so2369280edb.12
        for <openembedded-core@lists.openembedded.org>; Thu, 11 Mar 2021 04:05:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2LnxBOxpEhfVNX6Ww8y3JDqDW0nxVTHTj3QBOvssnmI=;
        b=SYCRavfdmoyv1Oefw70SnEOWe0lkfVlrUqvMK4s2FnnKvv7VxEwShIRrffEvWBVgvL
         0Mqr4P94a9mji5vQw0juFSvzRRcnl3L0Ea7TWiefy6LMwO5NKQMTf1we0if87ay6jzkl
         0qy1RfIWYVPdK/ccJiMtqz7e6VWwaUXe4hlM64atBLQDw1TMqc1FmN8nMvuuX7yhHD30
         BWL/lsU6svmrfYs/xTh9M4pLhv5GaJhBMjjZ0MUdnIWwKnnElHDcOVv4oOtKa8W+gs7g
         r7akl5V595DPNsDoAJXKjgsEMwwtEQhviQo3VkWr33wSiUqvqCvZ4iYahjJHqBIGaSkz
         bu+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2LnxBOxpEhfVNX6Ww8y3JDqDW0nxVTHTj3QBOvssnmI=;
        b=rGJuCWSamoSOrcPilx906KtfIRr3Jmuy3zrwEdVPtB19AGNAkVjQPYP59BVqKoEwgP
         fW6PRexw/bv1n0nO1mERuBrVHialQHfuijY7eVcOVCqXVFObJ+Cce1CStF6SZdeySz11
         ZNHZwRj/lFs/mxlu+0vzGgkLTwJ8xHkwOIVKG3GfDimiiU8tLmFQveMti1kxxD2S+CXb
         8Zv07zVKIkrBg+VBvYfTzaO3fTNC9YM7oY6x+jpi8DNz3FS0s5jkNaSF5ZSFgXJCn57s
         ed77XfW3b8W1H2OjYkZXsLmnEIxpmzwW1CMfRgDggDvRvj9uFTNKQpV3ez5DSwtEqAI2
         ioyQ==
X-Gm-Message-State: AOAM531Dg/Z8Gt5jC2Vgvyrk7vc3rBHkn4BIJejcrKMIWYxSOWpIGa92
	+hMowvLDjyuFhtQcjbGCGk9RAJcbRWafLw==
X-Google-Smtp-Source: ABdhPJwXNO5V8Akwk9acgFwn+8X34I6fNnZhiYgZ20XBtDiina9Acq3fvPPpWnVkqi1pIgAPiH0SAA==
X-Received: by 2002:a05:6402:312b:: with SMTP id dd11mr8177535edb.149.1615464326535;
        Thu, 11 Mar 2021 04:05:26 -0800 (PST)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id y17sm1229370ejf.116.2021.03.11.04.05.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Mar 2021 04:05:26 -0800 (PST)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [RFC PATCH 2/2] weston: use standalone xwayland instead of outdated xserver-xorg version
Date: Thu, 11 Mar 2021 13:05:12 +0100
Message-Id: <20210311120512.287214-2-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210311120512.287214-1-alex.kanavin@gmail.com>
References: <20210311120512.287214-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-graphics/wayland/weston_9.0.0.bb       | 2 +-
 meta/recipes-graphics/xorg-xserver/xserver-xorg.inc | 1 -
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/wayland/weston_9.0.0.bb b/meta/recipes-graphics/wayland/weston_9.0.0.bb
index 50fbfa613b..34ac66d4e9 100644
--- a/meta/recipes-graphics/wayland/weston_9.0.0.bb
+++ b/meta/recipes-graphics/wayland/weston_9.0.0.bb
@@ -124,7 +124,7 @@ SUMMARY_libweston-${WESTON_MAJOR_VERSION} = "Helper library for implementing 'wa
 FILES_${PN}-examples = "${bindir}/*"
 
 FILES_${PN}-xwayland = "${libdir}/libweston-${WESTON_MAJOR_VERSION}/xwayland.so"
-RDEPENDS_${PN}-xwayland += "xserver-xorg-xwayland"
+RDEPENDS_${PN}-xwayland += "xwayland"
 
 RDEPENDS_${PN} += "xkeyboard-config"
 RRECOMMENDS_${PN} = "weston-init liberation-fonts"
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
index b3e03744c0..da025171db 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
@@ -122,7 +122,6 @@ EXTRA_OECONF += "--with-fop=no \
 OPENGL_PKGCONFIGS = "dri glx glamor dri3 xshmfence"
 PACKAGECONFIG ??= "dga dri2 udev ${XORG_CRYPTO} \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', '${OPENGL_PKGCONFIGS}', '', d)} \
-                   ${@bb.utils.contains('DISTRO_FEATURES', 'opengl wayland', 'xwayland', '', d)} \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd systemd-logind', '', d)} \
 "
 
-- 
2.29.2

