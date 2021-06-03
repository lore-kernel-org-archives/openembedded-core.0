Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.web12.347.1622752118071618027
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Jun 2021 13:28:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=OVVlVTxr;
 spf=pass (domain: gmail.com, ip: 209.85.218.41, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ej1-f41.google.com with SMTP id og14so5827908ejc.5
        for <openembedded-core@lists.openembedded.org>; Thu, 03 Jun 2021 13:28:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=XIQWclcdOXyuZuC86mDhoO+oMWjhs5FAeuClS6kpOe0=;
        b=OVVlVTxrOAU6xpjXWDbcfjakn/ZFXyX9TLZyqqncWDq6SaBafjH6UTG1WYfUDZJqSf
         WL8eV+FiIMBmHTYClveq8F+wHAj3bci6JOxIw4+ZlqDjEA5B1KmlpJADrClAT/6dBx0o
         5LowhwmIn2j4JRk+7hrCeA4oSs+DK2v8qpYU3Hj8y8UkX+/uhj5IX9eLV8Sz6jyYgnQh
         GY8YJM990GSR9S1mESe/53I0rVEAld9mXwOYbquURDnU3POZGSdg7WP3N0mybOoxo9Gr
         srA14dXY/r1z+TCcAUUapdxiGdYbrCKj0r0Z89HoB2cHFfooGYUUrcTi70LuVv1YS54S
         5EGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XIQWclcdOXyuZuC86mDhoO+oMWjhs5FAeuClS6kpOe0=;
        b=dn40FMMRk+0mwc5T/AzD+VFevgqr3HpU798A1YbGR7q/j6Loj98Eot7K2X1AEMRvQk
         YeACKinktIqb9HnHJRtJH1Q0tlEBF31nm6kWgnQB0y5QrpaNta/G9KnuBgaCazw8mmyh
         lLg1Q6vhfdhD7/tcWzEBB93eHLh4q5MLtgctA3DHmk+a9htvlQ7LCr4LPzdeZOAdVDWQ
         hMs+F/Aa4Z+VE12R/osILyIW9a2gFsJGFFLIZooEmBg86I3/iUcX4hVvIEHaTlIF4DhV
         +c92N7JWSp6f+P9wAjVGzdEznPicKZvG9ezgkxaRsoO66pBwItLRThsHqmPaAf1l6MPF
         fvhQ==
X-Gm-Message-State: AOAM532AJBob/kT8NevBB0mj7y++W9rvlLBSaMcS5P+h1v+IK+yzrzF6
	xzv3wSL5jaASAHHLS2/mRNbw3lZHQtjq5Q==
X-Google-Smtp-Source: ABdhPJyURGqR4vwmnIsxrSVK04Wc+j0J1tAJEK0PoNtga5FbdkgbkFlNDPsUFIDC70vy+qOXm/FUmQ==
X-Received: by 2002:a17:906:f854:: with SMTP id ks20mr965940ejb.67.1622752116477;
        Thu, 03 Jun 2021 13:28:36 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from thanks-buchmuellers.speedport.ip (p200300f07f11f861d707ea86d7bc33dd.dip0.t-ipconnect.de. [2003:f0:7f11:f861:d707:ea86:d7bc:33dd])
        by smtp.gmail.com with ESMTPSA id u17sm2216009edx.16.2021.06.03.13.28.35
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jun 2021 13:28:36 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] xf86-input-libinput: upgrade 0.30.0 -> 1.0.1
Date: Thu,  3 Jun 2021 22:28:27 +0200
Message-Id: <20210603202827.2141368-2-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210603202827.2141368-1-schnitzeltony@gmail.com>
References: <20210603202827.2141368-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

License was changed to real MIT [1]

[1] https://github.com/freedesktop/xorg-xf86-input-libinput/commit/2bbc4727a12471e3699e2803404a013656066a94

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 ...nput-libinput_0.30.0.bb => xf86-input-libinput_1.0.1.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-graphics/xorg-driver/{xf86-input-libinput_0.30.0.bb => xf86-input-libinput_1.0.1.bb} (44%)

diff --git a/meta/recipes-graphics/xorg-driver/xf86-input-libinput_0.30.0.bb b/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.0.1.bb
similarity index 44%
rename from meta/recipes-graphics/xorg-driver/xf86-input-libinput_0.30.0.bb
rename to meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.0.1.bb
index d02988caa4..1777492ed9 100644
--- a/meta/recipes-graphics/xorg-driver/xf86-input-libinput_0.30.0.bb
+++ b/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.0.1.bb
@@ -1,11 +1,11 @@
 require xorg-driver-input.inc
 
 SUMMARY = "Generic input driver for the X.Org server based on libinput"
-LIC_FILES_CHKSUM = "file://COPYING;md5=5e6b20ea2ef94a998145f0ea3f788ee0"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://COPYING;md5=a22925127bd3c827c384cedd23ed2309"
 
 DEPENDS += "libinput"
 
-SRC_URI[md5sum] = "11dcfa2cc39f790731a9545fcdeea717"
-SRC_URI[sha256sum] = "f9c7f9fd41ae14061e0e9c3bd45fa170e5e21027a2bc5810034e1e748db996c0"
+SRC_URI[sha256sum] = "fddec49c115591918475155bf16aaf23017d7f814cee7823a0c11f867aca245b"
 
 FILES_${PN} += "${datadir}/X11/xorg.conf.d"
-- 
2.31.1

