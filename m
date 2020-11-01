Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
 by mx.groups.io with SMTP id smtpd.web12.8589.1604191478717921315
 for <openembedded-core@lists.openembedded.org>;
 Sat, 31 Oct 2020 17:44:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=AiWXDQCG;
 spf=pass (domain: gmail.com, ip: 209.85.208.42, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f42.google.com with SMTP id k9so10538626edo.5
        for <openembedded-core@lists.openembedded.org>; Sat, 31 Oct 2020 17:44:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=a1A2Mp8Q/ZXqhKterB2gadly6ke+Da3qlIO3SfJRwyg=;
        b=AiWXDQCG9y69CA/msdVPxLpgzDnT7IldTLf5X3hI/kTmYTdXesfc8Ff30+UIUhbUtx
         tOX+QS7WPwaQ/0n1JE4w+kMGZxslHiNRWYasIeDoRQOv7elYIurlDKB4tjVbHtcXobZ8
         suXJq19yTCEg3oqKj+/c7pFNxixgsPdoABLTdiDxSXKEVy2BveKG5qLUCY9t9qT6Q2ie
         fK6tWsT9pMDZTuFipNvyteMBnXmDuB9IE7DkdDL8Kcvu5zjbeGABmvEXJKfW5M3bonFP
         QdpPCcjYmSyhJMLHRqdm0Q+KPeeAA+NrRxZ+45L+bA8n5Il+1RcUBu0WJNaoN/dfIjjf
         UKoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=a1A2Mp8Q/ZXqhKterB2gadly6ke+Da3qlIO3SfJRwyg=;
        b=sS48ZhmNlB/ITxoc/3aKh0wHK3L8K7+4HVREYpzNh2jZiXBejjJvWu9f6JADsi52qT
         mcY/zD73Y2TXbl0TnVrIK1hlixVHoAmi7FYOZXs2YX3CwTw49CGs29hGQhRtEDq5yFAI
         I7nJb+DROte6Ke/4sRTV27Ujp/x2cfVbdVfBBevRmZVeOp1OAdwWBpuym9C49Jsz43ay
         FkWqeVOJXZRy/cu6JOP0ImAmzW1e6V7YpwrCLczr1d3eNrYssfmqkz3bXl6BggKF5Oww
         kSL2Cq6OXjELywPdwO6eLYuPKkd7YHiJK/X2k+e43SnyVYglo3MngFR6JlyXjvohR8a4
         i+3Q==
X-Gm-Message-State: AOAM531ylkOjzdFyITbBcM5gFxiqgWGUSPEGee+bZHzk2pkBqE0hSCcc
	8tUzsI+DulO6woNElBS3A2tJMZGPt5E=
X-Google-Smtp-Source: ABdhPJxTKk1jruGcdw0OjdfKGlkjkcFMZtFFkAnlt2JmmLUy5LP5BluyHKx+boZSuhPpYKdNtiKmuA==
X-Received: by 2002:a50:decd:: with SMTP id d13mr10023033edl.202.1604191477125;
        Sat, 31 Oct 2020 17:44:37 -0700 (PDT)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id q9sm6076754ejr.115.2020.10.31.17.44.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2020 17:44:36 -0700 (PDT)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [gastesgarth][PATCH 12/12] gst-validate: Update 1.16.2 -> Update 1.16.3
Date: Sun,  1 Nov 2020 01:43:40 +0100
Message-Id: <20201101004340.4019257-12-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201101004340.4019257-1-Martin.Jansa@gmail.com>
References: <20201101004340.4019257-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jose Quaresma <quaresma.jose@gmail.com>

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 .../{gst-validate_1.16.2.bb => gst-validate_1.16.3.bb}        | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gst-validate_1.16.2.bb => gst-validate_1.16.3.bb} (87%)

diff --git a/meta/recipes-multimedia/gstreamer/gst-validate_1.16.2.bb b/meta/recipes-multimedia/gstreamer/gst-validate_1.16.3.bb
similarity index 87%
rename from meta/recipes-multimedia/gstreamer/gst-validate_1.16.2.bb
rename to meta/recipes-multimedia/gstreamer/gst-validate_1.16.3.bb
index 35492fe861..ef42abbdd7 100644
--- a/meta/recipes-multimedia/gstreamer/gst-validate_1.16.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-validate_1.16.3.bb
@@ -9,8 +9,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343"
 SRC_URI = "https://gstreamer.freedesktop.org/src/${BPN}/${BP}.tar.xz \
            file://0001-connect-has-a-different-signature-on-musl.patch \
            "
-SRC_URI[md5sum] = "688f42c52d62e8c5e506df911553fb2c"
-SRC_URI[sha256sum] = "4861ccb9326200e74d98007e316b387d48dd49f072e0b78cb9d3303fdecfeeca"
+SRC_URI[md5sum] = "740a436f5b9bf17ea7de0e62c92ec264"
+SRC_URI[sha256sum] = "c2064e887324af6aa476ca669234936711f253b29042f617f1d9f2597c4bf92b"
 
 DEPENDS = "json-glib glib-2.0 glib-2.0-native gstreamer1.0 gstreamer1.0-plugins-base"
 RRECOMMENDS_${PN} = "git"
-- 
2.27.0

