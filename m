Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.web08.28761.1623018032936392319
 for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Jun 2021 15:20:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=VIu06jPY;
 spf=pass (domain: gmail.com, ip: 209.85.215.172, mailfrom: ticotimo@gmail.com)
Received: by mail-pg1-f172.google.com with SMTP id i34so5950300pgl.9
        for <openembedded-core@lists.openembedded.org>; Sun, 06 Jun 2021 15:20:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=PBhhHTYychOe/kXff/bkluhr5YRsFCCSmKcEEqXMzYM=;
        b=VIu06jPYi2k0uZzqgy7FK6ek/fJMltjYhkeSPRH6G64priZtPfQPW6lBS6Bxalmgox
         lDfvEgzfvafUAkB9AoCu5I3PVOCJiiora36JMiC2Qa1w8B17RkAVWw4qlu/w3ldCVukf
         ybMnRuAB7MT0H34YjOIIKRJIlKXFsTaq+rjlwdQkMVUZ+wC5U1knhWKqJsDEQvPjFOR+
         mX+OGZKN4VUpMctV8bPHd5KkJWKCVoMNtvwnaIxu5lakNMcE2KRnWENIsHpO+QiA4sYu
         oT77Zpth8V/zNPfoeF9OCEOwdT01unm8OWgfOaY9TA+6a2bQjV22Jduj19Kt6BceGNXr
         IMkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PBhhHTYychOe/kXff/bkluhr5YRsFCCSmKcEEqXMzYM=;
        b=cykwoO6/suqvzcAfIMP1h3fSfJCVI/RPa+2FH4SiWbKEJZFB8WC8y0BXI0pMl81L9V
         wuL7aTFNeNyPJKeY76yZttO4srqCNCdhqIHybnGgWjh9Yt9Ad70xSeNSNGe9iB91kxnL
         Cz9OfbOt7Q1DoZ1geooj0O2BX4WY8rEutctg6OJcKPEGwdxo04aPMJSP8vg59Q4J8jqH
         vQtYa3zEvdMD9eV+LuV+Anl0b1xAELZZYj2rArHwODMoT6Lq6FaDC/+mDOQrDauUd3lz
         ePbPhdvokx0gmm6MBZrz4x6cEnKwl9K2eQ82xNIW4KwbfrfdJuYcRknXZzs3w0rZwqtn
         kevA==
X-Gm-Message-State: AOAM5336TEjGDcsAuvrXIUwbSqIxbbtVkyF8x95iXgY+efnwno4m72j5
	/KiBsl0ZH5iXDOo43QpVAlnq+f2f+PgrJA==
X-Google-Smtp-Source: ABdhPJzfTYCH3nWwYgCYjmP56H7oXezornuiJPDs02NsV10vb/jcRmbnVlkeYY9vULpelUuwzuOsvg==
X-Received: by 2002:a62:ea1a:0:b029:2ec:9146:30be with SMTP id t26-20020a62ea1a0000b02902ec914630bemr12370177pfh.29.1623018032268;
        Sun, 06 Jun 2021 15:20:32 -0700 (PDT)
Return-Path: <ticotimo@gmail.com>
Received: from nereus.local ([2601:1c0:6000:9640:d783:82a8:8b1b:d4e0])
        by smtp.gmail.com with ESMTPSA id z6sm6818369pfr.99.2021.06.06.15.20.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Jun 2021 15:20:32 -0700 (PDT)
From: "Tim Orling" <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <timothy.t.orling@intel.com>
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <timothy.t.orling@intel.com>
Subject: [PATCH 5/5] at-spi2-core: upgrade 2.40.1 -> 2.40.2
Date: Sun,  6 Jun 2021 15:20:16 -0700
Message-Id: <02aff1d71a0055eb410915741fdc44ad6824283e.1623016777.git.timothy.t.orling@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1623016777.git.timothy.t.orling@intel.com>
References: <cover.1623016777.git.timothy.t.orling@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Upstream release notes:

What's new in at-spi2-core 2.40.2:

* README: Remove outdated links.
* Key grab fixes for the new API.
* registryd: Add a missing call to va_end.

Signed-off-by: Tim Orling <timothy.t.orling@intel.com>
---
 .../atk/{at-spi2-core_2.40.1.bb => at-spi2-core_2.40.2.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/atk/{at-spi2-core_2.40.1.bb => at-spi2-core_2.40.2.bb} (94%)

diff --git a/meta/recipes-support/atk/at-spi2-core_2.40.1.bb b/meta/recipes-support/atk/at-spi2-core_2.40.2.bb
similarity index 94%
rename from meta/recipes-support/atk/at-spi2-core_2.40.1.bb
rename to meta/recipes-support/atk/at-spi2-core_2.40.2.bb
index 83e1908ef0f..ebd3ed49c60 100644
--- a/meta/recipes-support/atk/at-spi2-core_2.40.1.bb
+++ b/meta/recipes-support/atk/at-spi2-core_2.40.2.bb
@@ -11,7 +11,7 @@ MAJ_VER = "${@oe.utils.trim_version("${PV}", 2)}"
 
 SRC_URI = "${GNOME_MIRROR}/${BPN}/${MAJ_VER}/${BPN}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "9f66e3a4ee42db897af478a826b1366d7011a6d55ddb7e9d4bfeb3300ab23856"
+SRC_URI[sha256sum] = "44dc17af943b0fd196c61c1e03b6c166960385cae96ccb5e95bdefffb6849f98"
 
 X11DEPENDS = "virtual/libx11 libxi libxtst"
 
-- 
2.29.2

