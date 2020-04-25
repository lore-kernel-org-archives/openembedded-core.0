Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com [209.85.221.66])
 by mx.groups.io with SMTP id smtpd.web12.335.1587835714597676283
 for <openembedded-core@lists.openembedded.org>;
 Sat, 25 Apr 2020 10:28:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Q79w7BTA;
 spf=pass (domain: gmail.com, ip: 209.85.221.66, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f66.google.com with SMTP id j2so15423814wrs.9
        for <openembedded-core@lists.openembedded.org>; Sat, 25 Apr 2020 10:28:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9RyDCdbd5naogJiy1CMpei1if6kf41vbQEJ7KcLJRik=;
        b=Q79w7BTAXrCrnaYf3yYDOCmLJ/iYA+gYvp6rSBGWKouM2IWw5eEUsQIcZYhfyIp8zF
         /SHSEw2zeX00wcxztO/lTAUYrZ0odtIDHdBHWA9qlJ8Vqq6jxcYyu+O+HVD1b5u+Zl7k
         JTo2aMGrjjnHNh6aoYDYPzMej7oSy/+RZKdumv+mYrJoEafP1hHzmTlEUHrbGAysE5q1
         yF8tvd/jtJbbKiC5mAikNtQ/AeBzibJPVDzj//FTpYBvAN0Y7G6IJkf0VGsY/JchqBn3
         Zf2lrvNJpbt3jan600C34e7CYQe2lTdVf0fBJECAJJcKOWmQIM359YVT01SZTk90cC4c
         beLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9RyDCdbd5naogJiy1CMpei1if6kf41vbQEJ7KcLJRik=;
        b=f/B4vtWgBSJ//o1Kvw/PMbRWVztyY5CbrmG3JLdm02yYDkQSsVnpPglioxXHsoPz3h
         SDgrQxXimLJQzQamwSgfCfqpl4fLx5jaUARRkS/iAkwkftCZIvShTOSkuUK47hIIE0fU
         JmlBOOnSJI4RI0YVIY9/QuA+nbG39bt/uP9rbRtBAHyB6WGpjLs35GcyMwdZiIT5u9jX
         hbhf9VeGsWxnCdJLOY3ghq4UnUhiYf5MhaLciTac6ALMRrSXZWtIuLDcIh4RSc5X94B7
         mf1mMqpXlsJmwjMHkzpfA93bEsBDmZAyoocQI9PFZ13bxTG8u6sPdKyCaR3FthLhrBgO
         Flbg==
X-Gm-Message-State: AGi0Pub2dcuYV0qNBznrmSQENG7H6nhxD0HJoQlFil61nkN8j5hg1yAw
	5CNWckZfhlDAUFavo4NuJD5RxS7j
X-Google-Smtp-Source: APiQypJs7VSa9iRO6PsWizTDMiUjzoCEdn5kGx/9V7dd0QfiEwTgcZgL4NB9tSF2Sdfw85P+FXndKg==
X-Received: by 2002:adf:e711:: with SMTP id c17mr18581004wrm.334.1587835712936;
        Sat, 25 Apr 2020 10:28:32 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.box ([5.28.69.65])
        by smtp.gmail.com with ESMTPSA id g25sm7751253wmh.24.2020.04.25.10.28.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Apr 2020 10:28:32 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 07/15] libinput: update 1.15.2 -> 1.15.5
Date: Sat, 25 Apr 2020 19:28:06 +0200
Message-Id: <20200425172814.27370-7-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200425172814.27370-1-alex.kanavin@gmail.com>
References: <20200425172814.27370-1-alex.kanavin@gmail.com>
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

