Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web11.32927.1599972565319372702
 for <openembedded-core@lists.openembedded.org>;
 Sat, 12 Sep 2020 21:49:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=MaXiDimW;
 spf=pass (domain: gmail.com, ip: 209.85.214.170, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f170.google.com with SMTP id g21so1561598plq.1
        for <openembedded-core@lists.openembedded.org>; Sat, 12 Sep 2020 21:49:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6grAgoouPmHG+S6azFhZefmn+7sALu8Rchfe4o+izTk=;
        b=MaXiDimWl+f+1UOpWY06SgLoScQQHu0LHewy9RMjlKmLrFUK1Mi7jK9ohSPPnvJjDM
         FefhqaGyT66+RJGHpU8RPJ+UZ6MqLM+36oFyC8yJUIh+FBRJYz5xbxrB4WzWA2e7HVJl
         q4a81otEpU9JXaVd8+RPNNcJbt8EbA1dHb5qdHq72GIc5xytQXF/gaM+oGQ5kfou2ZDR
         hnwHAZB0mhbUeClVOXRzqYEN7YEX9Tmf+zu0mDhh4ZqVml3lAiQnFWs94UWzxa57ro1B
         LDy5ecNQWjh0YfdGEAYzq+aH/WLi6WY+pjObBgPOF6wRCoVzS/spzuP9JaFs84d4ft+d
         YmvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6grAgoouPmHG+S6azFhZefmn+7sALu8Rchfe4o+izTk=;
        b=swB2RUBYBwXECu1Br3nEII7iC+IYCLMHnjfE4kfSVnraWX7vcKh1U6z3fpgmeLMA6i
         t4rDC25bz5q02G9xfXZwEiTAzOB4MOKPsc8YTGhmIAf5wrvcs8yLudZg8sp1OSsZ4XG4
         Uv4sJIDuF1RdxWhPxYqTWaCdldbcIpo/N9Vxe6ishRNweaeI8cJmjp9NwIeOrnQq+PuB
         Jhg0+Bu1ODRCa2VTLITZpJp8UG6UZiTS1zgThtMMW15GJuoA/nVqisl5uIX5BnmyV+yJ
         X+yI2jZUYYZ5jujk0BV/31o4HAEBgdEbGrHQwJbcKQDI/MA5iNw9134Em9hgBvN3Lhr/
         FfoQ==
X-Gm-Message-State: AOAM5332C8DsRKsAaY4JxZ52GmSYzvVEWQaBOEsJPATfAePO2UO8GNo4
	4IAauc0YV2CgjPP/RVMdPnchMi/H6s+y0g==
X-Google-Smtp-Source: ABdhPJwIcNqT1Rai1P61dYF9vm2Fl9rq8JPpJzg0FYxXuRuU48gLUeycgjZPF4LZncoTyxdVVNMCrA==
X-Received: by 2002:a17:902:be11:b029:d1:bb21:4c9c with SMTP id r17-20020a170902be11b02900d1bb214c9cmr5362859pls.8.1599972564496;
        Sat, 12 Sep 2020 21:49:24 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::d92c])
        by smtp.gmail.com with ESMTPSA id gq14sm5341693pjb.44.2020.09.12.21.49.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2020 21:49:23 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 2/2] core-image-weston: Bump qemu memory to 512M
Date: Sat, 12 Sep 2020 21:49:21 -0700
Message-Id: <20200913044921.3457893-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200913044921.3457893-1-raj.khem@gmail.com>
References: <20200913044921.3457893-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It needs openGL and launching two weston instances during weston ptest
needs > 256M ram to work

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-graphics/images/core-image-weston.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-graphics/images/core-image-weston.bb b/meta/recipes-graphics/images/core-image-weston.bb
index f5102e1989..fa7e9ef421 100644
--- a/meta/recipes-graphics/images/core-image-weston.bb
+++ b/meta/recipes-graphics/images/core-image-weston.bb
@@ -10,3 +10,5 @@ REQUIRED_DISTRO_FEATURES = "wayland"
 
 CORE_IMAGE_BASE_INSTALL += "weston weston-init weston-examples gtk+3-demo clutter-1.0-examples"
 CORE_IMAGE_BASE_INSTALL += "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'weston-xwayland matchbox-terminal', '', d)}"
+
+QB_MEM = "-m 512"
-- 
2.28.0

