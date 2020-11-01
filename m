Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.web10.8580.1604191468997258560
 for <openembedded-core@lists.openembedded.org>;
 Sat, 31 Oct 2020 17:44:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=PBN+f/SZ;
 spf=pass (domain: gmail.com, ip: 209.85.218.53, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f53.google.com with SMTP id i19so2667475ejx.9
        for <openembedded-core@lists.openembedded.org>; Sat, 31 Oct 2020 17:44:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3ejr9cmrRlMVSuViSpq+zum2OZXTPLXNL//A+ev5wN8=;
        b=PBN+f/SZKC8TZDvc1yrMWlPuNOhsCHCx3LhhNHnD1GiAMM/+SwWDWTyHJ5Gn1zR+s8
         IPr2feAob2E2ys9THctJfIOHTY985wv05l16FpdlAPe6hfcdzZYFZNJEy4m/rKGIaJMW
         Y7ZqE+UrWkTydG/wkkfSaXdGsbOCq/HdPiQwG/Dj9s+7UUoUgw3zpkOQfX9t7Srnlt44
         P0zBg/O8Qb9nx6s14DekEQPj2dU3wxbYNYK8TpjKeutbBpx6q9DLIiVEQ/Zaz0au9Z5m
         /lHRADPriMFKzPqXUtt/R5i9SJ70SRPzy3nkqcf9WLAvn5wvkkJTQvU8nTffHt6QZqKq
         e+VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3ejr9cmrRlMVSuViSpq+zum2OZXTPLXNL//A+ev5wN8=;
        b=dzC834pTqYYJqOy8BPzzdg7SJHNpXMQY8HL0l0h4p9VNkPPviV0kgbvvq2LzmOoclE
         NGk5LBu4Nrz3/euumgzT3omag+BPvtQVh7Gv/3N+SZPDj4DXQ+gd7NIMPLRht+onuEiq
         G8UH1twxAXVO7bGigbchPANibSzTldIOVivjejWEZihhbIw+qzJJD2nTEbVdLTndgPxE
         133MIByu+9db/wrcVy4ODDYuVAKyLCz40J5tcxvUTH/xPRBTtpZwY0xbpWuIR+hH+bL+
         f2Sf0ZW/wlYr/hyku0MIKhy2jef0ZWeZa3XtXxyFcb0TRT9bTwv3I+dmZDrLo8UxWcwa
         TKpg==
X-Gm-Message-State: AOAM5319BgDOWTQ3qNWClxd1+/McZIQNrRnyLPrxT0mLnYaJqxOg0qIL
	SvoVNp5nRbD0SfkEfogzGSqD8D+bqgU=
X-Google-Smtp-Source: ABdhPJwcFOWXEpgSkCUxBN61e0Cnxd0UPWLa4cOlXrO8YCGf53dS0G6NTkOwX5EZAaQvoY+CnFzT/g==
X-Received: by 2002:a17:906:3a1a:: with SMTP id z26mr8881659eje.519.1604191467194;
        Sat, 31 Oct 2020 17:44:27 -0700 (PDT)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id k21sm6673579edv.31.2020.10.31.17.44.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2020 17:44:26 -0700 (PDT)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [gastesgarth][PATCH 02/12] gstreamer1.0: Update 1.16.2 -> Update 1.16.3
Date: Sun,  1 Nov 2020 01:43:30 +0100
Message-Id: <20201101004340.4019257-2-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201101004340.4019257-1-Martin.Jansa@gmail.com>
References: <20201101004340.4019257-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jose Quaresma <quaresma.jose@gmail.com>

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 .../{gstreamer1.0_1.16.2.bb => gstreamer1.0_1.16.3.bb}        | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0_1.16.2.bb => gstreamer1.0_1.16.3.bb} (95%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.16.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.16.3.bb
similarity index 95%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0_1.16.2.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0_1.16.3.bb
index 9d92fe1439..66ad3e3381 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.16.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.16.3.bb
@@ -22,8 +22,8 @@ SRC_URI = " \
     file://0003-meson-Add-valgrind-feature.patch \
     file://0004-meson-Add-option-for-installed-tests.patch \
 "
-SRC_URI[md5sum] = "0e661ed5bdf1d8996e430228d022628e"
-SRC_URI[sha256sum] = "e3f044246783fd685439647373fa13ba14f7ab0b346eadd06437092f8419e94e"
+SRC_URI[md5sum] = "beecf6965a17fb17fa3b262fd36df70a"
+SRC_URI[sha256sum] = "692f037968e454e508b0f71d9674e2e26c78475021407fcf8193b1c7e59543c7"
 
 PACKAGECONFIG ??= "${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '', d)} \
                    check \
-- 
2.27.0

