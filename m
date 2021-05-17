Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
 by mx.groups.io with SMTP id smtpd.web11.19523.1621260890474478391
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 May 2021 07:14:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=VVJhCsgE;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.169, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f169.google.com with SMTP id m190so4751111pga.2
        for <openembedded-core@lists.openembedded.org>; Mon, 17 May 2021 07:14:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=zKw0ldMaET0QQz+DyotqclzS2r3cZ++gyLb1EUlw9Vc=;
        b=VVJhCsgEBgXEP5cmbEz3EhazqVsmW56OYviV4VvFgjy0u+U40ENZydm1L7wG6QXUNv
         pbUEkTkk8uW5Typ/RnPGLF4h1YBsUJUBdAFK+wWaP60gYEQ+zqVB2FBZGF/HLCYAoORk
         nvD6okIvGG/3tudUAlE6E1Zz1P8e8lJZbdZtc2zGxWFILqNiDlpjnumEn1HNaLuvuVhQ
         zCHWGJ5iFTWiX4D7QuRcO989mKo9kABFc9Q+fjNYO/TRKzMZ9waYBWFEXuBUIXV7UB/z
         vdrafP2QQny5Yh+3Zh221v4rMnvwnuI6YsykBUcqrlbU4xfsVTXcbBS44b2IsYYnZ4b/
         Ri7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zKw0ldMaET0QQz+DyotqclzS2r3cZ++gyLb1EUlw9Vc=;
        b=cb4j5kr48KpcLwpOV/YVSR+tFPZogkv2Zmpw35mYam/9OsMS53mDy7ow1HxoLLzmLg
         dijstDOPg4K4RE4de0fDFFiGgEnadg2yd9hS0lkYiqHx8KKZ/isbWZyUXH0ZmC3jTQtA
         XgT+KNakcKJzDoafsSnfl/kKxo45czA9qTtkC/gt6vx6DXCTWsQzXmCzZZVExOQHo1CF
         DtjrTGNpK/fblTw7z4GUCE/mj2w9n4UenOykojyofWsXLiOElqt/Yj1d7DfPNeOk+vv/
         tdUO7Q3hFsMnb8f5FGL/5NaIsqenoxsB9sMGw5YKNjdD+fX9vd1p2+rrkx8g0dWYd6M1
         vuBw==
X-Gm-Message-State: AOAM531N8a1785Z9jNGXcS2mVQieuQQgVkogdPL3GpeMzCnQ3YSmDvxB
	NrU0gb9qKOVZKV/8WRI9zXT9l8c+FWlIa+j2SZs=
X-Google-Smtp-Source: ABdhPJyQ4FDzkbtDPrEsEQnJLotM+lnFkhhKicO8UQJdkrvLsxv9IbbNtzUP4Z/CIVn6umeLsf6zFA==
X-Received: by 2002:a63:eb47:: with SMTP id b7mr33978787pgk.227.1621260889671;
        Mon, 17 May 2021 07:14:49 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id 66sm11292660pgj.9.2021.05.17.07.14.48
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 May 2021 07:14:49 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 23/35] avahi: Exclude CVE-2021-26720 from cve-check
Date: Mon, 17 May 2021 04:13:29 -1000
Message-Id: <760cc905fda18ee73ff3698a117f8841d3823b65.1621260695.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1621260695.git.steve@sakoman.com>
References: <cover.1621260695.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Issue only affects Debian and SUSE.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 72522fa1a5f3b9b2855043fe6b421886d641385f)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-connectivity/avahi/avahi_0.7.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-connectivity/avahi/avahi_0.7.bb b/meta/recipes-connectivity/avahi/avahi_0.7.bb
index f6e3afb24e..0df44bffbe 100644
--- a/meta/recipes-connectivity/avahi/avahi_0.7.bb
+++ b/meta/recipes-connectivity/avahi/avahi_0.7.bb
@@ -8,6 +8,9 @@ SRC_URI += "file://00avahi-autoipd \
 
 inherit update-rc.d systemd useradd
 
+# Issue only affects Debian/SUSE, not us
+CVE_CHECK_WHITELIST += "CVE-2021-26720"
+
 PACKAGES =+ "libavahi-gobject avahi-daemon libavahi-common libavahi-core libavahi-client avahi-dnsconfd libavahi-glib avahi-autoipd avahi-utils"
 
 LICENSE_libavahi-gobject = "LGPLv2.1+"
-- 
2.25.1

