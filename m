Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4031.1795649403407342038
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Nov 2026 15:30:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=QZuFJq77;
 spf=pass (domain: gmail.com, ip: 74.125.82.177, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-3282db206d3so1376095eec.0
        for <openembedded-core@lists.openembedded.org>; Wed, 25 Nov 2026 15:30:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795649403; x=1796254203; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CbfMPPaV4xUe5p1GkmGtIrUbqvRO0nUPPSf5ufiAa5Y=;
        b=QZuFJq77mDMWRkQC6k1c8DCsOea+ixbLoUCE5BtVkb8pTfVB028bzgUJLUn63I+Gjn
         sL/GKJgJxZahWUrlkM/BcdwNnbHFO8kFED2MbJYFcUD4d5ZgdEWjmAOaZufGHXGutm54
         1Zpw+AiK4n6otzsReYyxa5vAwIEv8DyJ5LY8TmLUjmUM4JKHxuXvUQNK43khM0xToT+O
         43DSuu1OWzt7Kz/PS/wAP5mzKf5GJcLGTVGtBzhHv/gUS5ygGF298FG8IkPA2bwbasF8
         1TJXvBnaMBSV+KbLEUy6mPyWahWK3oPlFb5dK3qT/MqSTzMmSP/+3X7vexbR0kxdB6+C
         RLQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795649403; x=1796254203;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CbfMPPaV4xUe5p1GkmGtIrUbqvRO0nUPPSf5ufiAa5Y=;
        b=K9d8C7FMeSlPCB+xfZTqvo+RtyowQSvOfLf0OI+cF9fzB+NyFkVTUY5JMrkkhEceyC
         pbLOIKRbPqXC7WypX4Kb85Sy+wm3ISTTuSZ02olM7W5XW8lZCMXTI2K+6tmgLnvA/NWr
         iYyFlWRWYTyvfS4OVd9IGhPT//9nPNvgb8dng4Z8EFdxwarxCTeX68bPPeRG/2yWfzKF
         LxVnnhKFvd+4nC3n10LbfAYRcukACrRU08vxyVPWl6JBFZicSLs4nvZCaZl/Ee+FURrw
         RREe0C7hjtqzdUOIVy9H+XTPrBZ0WlN3NFLo7iBRmJEPzketvyLqM4Lnb6de9ime6fkv
         Ws8g==
X-Gm-Message-State: APuU4Z/3+BgoJU+YoIhTr9aKVUroAd4xeEJSLB/Pu6FZC4yAR96cyFV6
	LFNmoB+5kWdkd+D9qBmYrFhJY8bXzj/XslSGdoNvial1GScCVVYYdxKATkOS1QF+
X-Gm-Gg: AZFdTZdClMXNRk0/koxq3gTFfsqxUONmBqm6BdLj0Ylm3imQsorLEijq6Q4H5kHrIDC
	v1O3bkSlAR6PnWGTrc7WdRVQHPSndGB+JbxpgeVgGh2My7fILzRnmI4KbaRI5c3uFjI2TGd8ZPj
	/oVojs1+kJ1m2Cw8iuSiH4L6qhYOnRG1QGmdAF9g1FA8f8INK5jzKNWnxqO0xGaeCbuUrMuskVJ
	sM9PXrhQa4988TCQW7nmydn8IMsg0ahaURJKH116L6SOM3wBiGjfB6NNN9pwlyHhzhi75SmAaof
	L5YPnQkN7sYTkNkZi1ZFkHQrGSjkN3PRhL9lbEzILAt7zxWa4W6qqQOOYUDIojF7baanQom5/fp
	PPcbc3fTKf8tIVuBwt0p8Uwt952mBg21RU5neQn4LZdtcXX5+R4vYZOoEPFeAq6uIZbCKQ8EXMo
	T1o4CbeR5TqmKbayLI1AKnPnx+PtwZZl8jJLkizbhvSn0sJz3smOp2BUOiHJGpHwc6r20ahAW0y
	ZYJPs8mKOsYS9CKjDHmTvxfaSMSB9DU/tCw2HXL52zwYcS2WZFEMa6/VQP0AzeOt88KvaiBrkx0
	g38P7HylFMGnpBIW4hM1xZPi/ehVWrRRuTsvtVsxice4+iz8WDHx8prUX8ZpGQ71wy+9uREjduY
	/+inNla/AK8/EZTaLn927z4c5Iu4wc4yFWP7n3zCHLd1DOIwOr4bkUbVIFVvWpZ5YwQBjSh6qN7
	es0jQO2R0/mfn3RqU/lHPxmYswwphTySSoMfBNgjKBu8Efw7BlmnVP0jQzHHiy0qGsxnwQJRh/s
	IvrlfBkZw1P6QEDWUoves0aVXKeRZYZh7kWNTLYpRMB3gkmOo6nuFBTS/kvyeKec6XOz6ruaDmq
	eMDrH9maDUi4JxVITnvkbgLIyQ==
X-Received: by 2002:a05:693c:42c2:b0:386:bc8f:b603 with SMTP id 5a478bee46e88-386bc8fbce1mr8227615eec.38.1795649402477;
        Wed, 25 Nov 2026 15:30:02 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567abb870sm47749444eec.25.2026.11.25.15.30.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 15:30:01 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [PATCH] gettext: Use shared libunistring on musl
Date: Wed, 25 Nov 2026 15:29:59 -0800
Message-ID: <20261125232959.3962552-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 25 Nov 2026 23:30:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251269
Content-Type: text/plain; charset="utf-8"

libgettextpo is built with -DOMIT_SETLOCALE_LOCK=1 and relies on a
dependency library to provide gl_get_setlocale_null_lock: GNU libintl or
a shared libunistring. On musl there is no GNU libintl, and the bundled
libunistring copy does not export it, so libgettextpo.so was left with an
undefined symbol.

Instead of patching gettext to define its own copy of the lock, which
upstream considers a configuration problem
(https://savannah.gnu.org/bugs/?62659), link against the shared
libunistring on musl, which exports the lock, and drop the patch.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta/recipes-core/gettext/gettext_1.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-core/gettext/gettext_1.0.bb b/meta/recipes-core/gettext/gettext_1.0.bb
index 8a93ce1b49..4bfcee20ee 100644
--- a/meta/recipes-core/gettext/gettext_1.0.bb
+++ b/meta/recipes-core/gettext/gettext_1.0.bb
@@ -61,6 +61,8 @@ EXTRA_OECONF:append:libc-musl = "\
 PACKAGECONFIG ??= "glib libxml ${@bb.utils.filter('DISTRO_FEATURES', 'selinux', d)}"
 PACKAGECONFIG:class-native = ""
 PACKAGECONFIG:class-nativesdk = ""
+# musl has no GNU libintl, so libgettextpo needs gl_get_setlocale_null_lock from shared libunistring
+PACKAGECONFIG:append:libc-musl = " libunistring"
 
 PACKAGECONFIG[glib] = "--without-included-glib,--with-included-glib,glib-2.0"
 PACKAGECONFIG[libxml] = "--without-included-libxml,--with-included-libxml,libxml2"
