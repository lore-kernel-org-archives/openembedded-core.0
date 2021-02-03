Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web12.9034.1612358886000532844
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Feb 2021 05:28:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=IqW/RPxA;
 spf=pass (domain: gmail.com, ip: 209.85.221.50, mailfrom: luca.boccassi@gmail.com)
Received: by mail-wr1-f50.google.com with SMTP id l12so24298374wry.2
        for <openembedded-core@lists.openembedded.org>; Wed, 03 Feb 2021 05:28:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=USBk8wdFrG074XaLld3H/qRGLuz2fuBeywq+whQLJ9A=;
        b=IqW/RPxAKqrhOnZYCM5rQWoQeM+HhiH0tptRRuVGS6FICDtSYK4zkkKkJ1u3/vGyuT
         szAUHiZGzBN6nH9oMJTzABxL+TiL3frfUV2wJdjnbJOTbk0f3EPNVOpk95/FgGhy/a3c
         wQ8cisru63rGYuLlubz9We6plq5vnvjJG4DDJ7byFCXucuYBvQpmaDKDXD23Pl/vwfPX
         EY83EPdX9pCIOQP4LHrlPMWPRJWCxF9dTqKdmyVFMFoCnjBBdE6KNufnf5UyMr2EZQNh
         zOICiI4hnqyH11kBjFbzIYzkqDhnhHN4JUpPdBgeptuIH9XXxiCkcMvf6MmWBMpBFGgF
         YfHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=USBk8wdFrG074XaLld3H/qRGLuz2fuBeywq+whQLJ9A=;
        b=IFhAZD0YkW218vXrUEGHQnJco8Merqu6ZjXPMvvOWshZ3cAFaevR2cCF6Ek3Iv+J6/
         diEX3Rq17B6BRld1tJMCpJUZ+A6HQQgXhE+OGoNPXcU7YoPT/Al9ZfG0nVuKeSGVEb4T
         TmfLC5W4csq7H2gSkNI/1+xoz4EbWf/T+vBHeiaoZ5v0DBFedcmXGqCL9VQTV8FR9ewN
         WAnEuYqk++mfxgsB+gC88ShPrXKSzIiCxlOEm5PZRDopFZKCN9C08Vl5nWFBoA6oucOD
         NL+Jk0j3+jsTIRHAhmCrgOhsp/wW0Ym8rPaB60wZqW52bGifuKQGQj6cCFO9ZGJW/ngL
         h7rg==
X-Gm-Message-State: AOAM5328bLwXp9sBLabboZiQt8x70OMBhcbwLvfNGTABaxt4wlO6kScd
	dPfxOz7RIVk3qrCbKlTCybaKHePDcaQ7nw==
X-Google-Smtp-Source: ABdhPJyIX5KSB+t3EhNQjxhu853c7nlr6AvIUCegtJQ/XZK30fUSTpoZSPF1jGTF7yKf0VZalkX14g==
X-Received: by 2002:a5d:6685:: with SMTP id l5mr3480568wru.176.1612358884069;
        Wed, 03 Feb 2021 05:28:04 -0800 (PST)
Return-Path: <luca.boccassi@gmail.com>
Received: from localhost ([88.98.246.218])
        by smtp.gmail.com with ESMTPSA id f17sm4041712wrv.0.2021.02.03.05.28.03
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Feb 2021 05:28:03 -0800 (PST)
From: "Luca Bocassi" <luca.boccassi@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] systemd: update to v247.3
Date: Wed,  3 Feb 2021 13:28:01 +0000
Message-Id: <20210203132801.982669-1-luca.boccassi@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Luca Boccassi <luca.boccassi@microsoft.com>

Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
---
 .../systemd/{systemd-boot_247.2.bb => systemd-boot_247.3.bb}    | 0
 .../systemd/{systemd-conf_247.2.bb => systemd-conf_247.3.bb}    | 0
 meta/recipes-core/systemd/systemd.inc                           | 2 +-
 .../recipes-core/systemd/{systemd_247.2.bb => systemd_247.3.bb} | 0
 4 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/systemd/{systemd-boot_247.2.bb => systemd-boot_247.3.bb} (100%)
 rename meta/recipes-core/systemd/{systemd-conf_247.2.bb => systemd-conf_247.3.bb} (100%)
 rename meta/recipes-core/systemd/{systemd_247.2.bb => systemd_247.3.bb} (100%)

diff --git a/meta/recipes-core/systemd/systemd-boot_247.2.bb b/meta/recipes-core/systemd/systemd-boot_247.3.bb
similarity index 100%
rename from meta/recipes-core/systemd/systemd-boot_247.2.bb
rename to meta/recipes-core/systemd/systemd-boot_247.3.bb
diff --git a/meta/recipes-core/systemd/systemd-conf_247.2.bb b/meta/recipes-core/systemd/systemd-conf_247.3.bb
similarity index 100%
rename from meta/recipes-core/systemd/systemd-conf_247.2.bb
rename to meta/recipes-core/systemd/systemd-conf_247.3.bb
diff --git a/meta/recipes-core/systemd/systemd.inc b/meta/recipes-core/systemd/systemd.inc
index cb7d782b76..ccff8c8b9e 100644
--- a/meta/recipes-core/systemd/systemd.inc
+++ b/meta/recipes-core/systemd/systemd.inc
@@ -14,7 +14,7 @@ LICENSE = "GPLv2 & LGPLv2.1"
 LIC_FILES_CHKSUM = "file://LICENSE.GPL2;md5=751419260aa954499f7abaabaa882bbe \
                     file://LICENSE.LGPL2.1;md5=4fbd65380cdd255951079008b364516c"
 
-SRCREV = "937118a5b2f27a7913c421ad76893cdda01c5566"
+SRCREV = "551dd873b0bdfb9e7e47431b2933c8b910228f0c"
 SRCBRANCH = "v247-stable"
 SRC_URI = "git://github.com/systemd/systemd-stable.git;protocol=git;branch=${SRCBRANCH}"
 
diff --git a/meta/recipes-core/systemd/systemd_247.2.bb b/meta/recipes-core/systemd/systemd_247.3.bb
similarity index 100%
rename from meta/recipes-core/systemd/systemd_247.2.bb
rename to meta/recipes-core/systemd/systemd_247.3.bb
-- 
2.29.2

