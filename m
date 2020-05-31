Received: from mail-ej1-f66.google.com (mail-ej1-f66.google.com [209.85.218.66])
 by mx.groups.io with SMTP id smtpd.web10.17663.1590940466295082572
 for <openembedded-core@lists.openembedded.org>;
 Sun, 31 May 2020 08:54:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ZZAXvzMz;
 spf=pass (domain: gmail.com, ip: 209.85.218.66, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f66.google.com with SMTP id e2so6839025eje.13
        for <openembedded-core@lists.openembedded.org>; Sun, 31 May 2020 08:54:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=KZvZvw71Gq45K/OLVzS50H8w/YnCkK/ajagSGKVmOa4=;
        b=ZZAXvzMzAs1Z/loesSxviM9thrmm09afMiyaAHEMn2+HTnHK4REk1aNjFMixLf88lG
         Ws35gYTAdI8nK3rnYMOS0bBZSp70hs4Xdy152S9wtrReqzOoXcqZ1hr0XJ84YOW/Ukv7
         2TaPpJ3gH1Bb08lcswhM/0oV7Y6R+2yaD9VzemwjfMVL8txoZfYc/y2Ft2Q0koY7I9te
         uX8MFMXQZfgy/xFYk9gdfcFBzmNqlUdTqgmdNDjlZTtGqXjECMMdmNvswPWYG7h1xNFL
         D24DjCeXf3sXw9kFcPa25h5MwP9NoNwcSY4qGegJXobK3BrZwOS69DgUdmNEPTlMFbgx
         W16w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KZvZvw71Gq45K/OLVzS50H8w/YnCkK/ajagSGKVmOa4=;
        b=tNAmids0hOFAlcQQ//QJsx3INd73EDV1OGhxchGzeCmeHp0hiVpBMyWhK4AXJJHrdc
         TrgMKhlYs0GRXlnjTOQy0LRnxjXB4rekFzveIcItE52V23T1+DTwJ/9FPJOCVv2rrSyd
         vdwFl61jaD/DiFt7pjXiZr1mgKhczecPgpZWCeo12UHuPg+HKTO2hnUFlQ0V6PzHYMq7
         v8qEv5TkQDHwzMeX2HXoPn1aL0pD+/Uibez7CdNNY6W6zZ5dZ5sWM+Vjc1w0ROH3r1YK
         6R1Z8OXiFJx9ATCSkCzSwN68Wgu2ApbkDIMHRrtQRgYD3GrSzRLrAYvPU2Ho66SwDmN/
         QjdQ==
X-Gm-Message-State: AOAM531Z4JkGt7WSF2eldp2KW4IGFjp6W5xa5fq+/flkfYFOaRUJpdkO
	Cw3taT39OPjqIXoN2bLd8uM4dcEH
X-Google-Smtp-Source: ABdhPJzkqLI4at6yaOxnTI0LfURVC/WNYrnEACP5/xcaSrZszi6Xbe037hwH7a12RTlX3KUC4+jpBQ==
X-Received: by 2002:a17:906:4716:: with SMTP id y22mr35126ejq.125.1590940464694;
        Sun, 31 May 2020 08:54:24 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.site ([2a02:2450:1011:56f:238d:84be:b349:9184])
        by smtp.gmail.com with ESMTPSA id dn15sm13227042ejc.26.2020.05.31.08.54.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2020 08:54:24 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 65/70] libyaml: adjust license checksum to omit copyright year lines.
Date: Sun, 31 May 2020 17:52:49 +0200
Message-Id: <20200531155254.10283-65-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200531155254.10283-1-alex.kanavin@gmail.com>
References: <20200531155254.10283-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-support/libyaml/libyaml_0.2.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/libyaml/libyaml_0.2.4.bb b/meta/recipes-support/libyaml/libyaml_0.2.4.bb
index e1817748bc..b0f85cda0e 100644
--- a/meta/recipes-support/libyaml/libyaml_0.2.4.bb
+++ b/meta/recipes-support/libyaml/libyaml_0.2.4.bb
@@ -5,7 +5,7 @@ HOMEPAGE = "https://pyyaml.org/wiki/LibYAML"
 SECTION = "libs/devel"
 
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://License;md5=7bbd28caa69f81f5cd5f48647236663d"
+LIC_FILES_CHKSUM = "file://License;md5=51591594753f05018680f6db765d5a46;beginline=3"
 
 SRC_URI = "https://pyyaml.org/download/libyaml/yaml-${PV}.tar.gz"
 SRC_URI[md5sum] = "0532bb32548ee92f1c0328aa8a87dec7"
-- 
2.26.2

