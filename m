Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com [209.85.221.68])
 by mx.groups.io with SMTP id smtpd.web11.4099.1588240712037753774
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Apr 2020 02:58:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Cqr755Z0;
 spf=pass (domain: gmail.com, ip: 209.85.221.68, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f68.google.com with SMTP id f13so6057832wrm.13
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Apr 2020 02:58:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9RyDCdbd5naogJiy1CMpei1if6kf41vbQEJ7KcLJRik=;
        b=Cqr755Z06s6aMlxUKsVId3sQrplfid1xOcBsjpud4lv4kAwLUhMs/1u8HwkvMnb2eX
         KBMCUpYimHjGE6Hd3/mkXHejdki9aInMk6zYlb9Z87gSJ4C2GJAnUYwIKZzawlrpPF3n
         BqwiljIWxGG5N6a1FOM3H8OTzFDoA0xcXU+PnK6cWIyEcK1XOxUME+6xqBBkdXn46s6w
         cCGULzzzv+QnJUIYruvt2WVMVlihiCN4DakPzIm0hUB8ykDap+ub1jqticAAbMQA90FZ
         +ZfXlbyvQ9aQCqkpxfVKFH/noBVCO+9kldVJ0rTQrJByDCbruaxmdrbRrV6vmQ5Wyl7n
         hi7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9RyDCdbd5naogJiy1CMpei1if6kf41vbQEJ7KcLJRik=;
        b=DRSI7MaR611Rqwbs5qZdwSCphXXFodJWjs2UvM0ERa6qULHyvtSHY4PvBWyBMj/0s+
         e3imvoutIysy7+VyC0iUtrmeDuScP1EHYGejnmXCgT1BYs/N+C0X3Gu1XptufKmMAf4f
         wVy2bn7Ug4ZdkNEZQkhiNzi/1jQX867cTQtuWhGlHhoYI+LhE+h57xVLnK2wjSQnzqIr
         UXPHUMZqmPQy+SQwwwlfj/FWwGV4LZFenQ/jOc+c510iNJTYja7vxfIRtq2w6nVxrOlI
         ZWBxahEVgXCpJ+3ef/XHpR7y3v48bRHJ+WyXBpf/Lh4t6vz8DegCR4CrSKpxNJ8VSO6M
         93Rg==
X-Gm-Message-State: AGi0PubFrGVVPFxWdlDv4j3Odo+mdtmW705VQRiETfMORGPwg5m8VaJo
	L0FCHtzKFOihWr6pfw6X7O+ixZ9f
X-Google-Smtp-Source: APiQypKZ/nX1Fxp7wwtzk++qJH3Wh0rQI4pRUPGOrY8rBE2xaGr6b2YpgHljGQo5b9ExiqltX88lmA==
X-Received: by 2002:adf:f5ce:: with SMTP id k14mr3174301wrp.39.1588240710430;
        Thu, 30 Apr 2020 02:58:30 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.box ([5.28.69.65])
        by smtp.gmail.com with ESMTPSA id b82sm12380682wmh.1.2020.04.30.02.58.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2020 02:58:29 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 02/17] libinput: update 1.15.2 -> 1.15.5
Date: Thu, 30 Apr 2020 11:58:00 +0200
Message-Id: <20200430095815.2824-2-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200430095815.2824-1-alex.kanavin@gmail.com>
References: <20200430095815.2824-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../wayland/{libinput_1.15.2.bb => libinput_1.15.5.bb}        | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/wayland/{libinput_1.15.2.bb => libinput_1.15.5.bb} (91%)

diff --git a/meta/recipes-graphics/wayland/libinput_1.15.2.bb b/meta/recipes-graphics/wayland/libinput_1.15.5.bb
similarity index 91%
rename from meta/recipes-graphics/wayland/libinput_1.15.2.bb
rename to meta/recipes-graphics/wayland/libinput_1.15.5.bb
index 62dc9d2f0f..551edcd2e1 100644
--- a/meta/recipes-graphics/wayland/libinput_1.15.2.bb
+++ b/meta/recipes-graphics/wayland/libinput_1.15.5.bb
@@ -16,8 +16,8 @@ SRC_URI = "http://www.freedesktop.org/software/${BPN}/${BP}.tar.xz \
            file://run-ptest \
            file://determinism.patch \
            "
-SRC_URI[md5sum] = "eb6bd2907ad33d53954d70dfb881a643"
-SRC_URI[sha256sum] = "971c3fbfb624f95c911adeb2803c372e4e3647d1b98f278f660051f834597747"
+SRC_URI[md5sum] = "c9a1b15bb932eaf22f840efe4c3f84eb"
+SRC_URI[sha256sum] = "a90efc8f423c3094f2f9f372fb92381b2f3aad62e8b5882a8abe333aa8249c97"
 
 UPSTREAM_CHECK_REGEX = "libinput-(?P<pver>\d+\.\d+\.(?!9\d+)\d+)"
 
-- 
2.26.1

