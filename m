Received: from mail-lf1-f66.google.com (mail-lf1-f66.google.com [209.85.167.66])
 by mx.groups.io with SMTP id smtpd.web12.11712.1613265749057299836
 for <openembedded-core@lists.openembedded.org>;
 Sat, 13 Feb 2021 17:22:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20150623.gappssmtp.com header.s=20150623 header.b=y5PzB8Rf;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com, ip: 209.85.167.66, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lf1-f66.google.com with SMTP id p21so5059730lfu.11
        for <openembedded-core@lists.openembedded.org>; Sat, 13 Feb 2021 17:22:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xSjiHGVau6oXkEvKapUFayBXNikr6d9o3VggG8lx+zw=;
        b=y5PzB8RfF1nBHZuf+N+5xgPs5Il9brJggsmSajonF2Okn4MZFuKFxoq3jNJj9lJzNi
         28btZGmW9cKgpKbAIbMBdakcScHOFSwER6aICWY6PjELnX6+X9xLZQyoi8xwbAtsPCEu
         7two/go4njXgKHFMFHrFnZK0RYuVc4riT1aAWxfkBB4iNtxus5aE81ZUxxeN/17qm/Mx
         9hojaY1+n581lCV2FGKhmNL8jqDjzgQGkUQ6QPRlJB6Vy6DVo1RBsCAslCU+b7H8c0D+
         rV0HjJXhdH8GnxVY0BvDaBuONIvkYoKw8bKs6lXRZIo9ZvlfnxcyMyXjxYN7+NBABZZz
         VWpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xSjiHGVau6oXkEvKapUFayBXNikr6d9o3VggG8lx+zw=;
        b=t3g0Zv34GfBy+GywdlWFb17AoiI239MGEx/ts79sUsKQ0JdVm0X4DZ779YVTsokcck
         wmvZEN84NL2XImGpmYwlgpyeILtzq98ZKBXbXAnBQMN7wYExW1vPF+OA4jpUcDv0Ksql
         3a6Jg99ieozJaWNFQUu8l+eAClimkjeMa8XFj5Pa3tkqYBVHVK5iG0QJoz9RvYkIB+X6
         QUQVEV32otmlUUyB6PAXkbQ8WgGbul5+UAmfJBiKkjE77HFfKKQ/loOmRRJqrGAayuvz
         +T3y66rYrM7MprHCQuPYmtVoBiXT/dyi7TRwcNs3iODrT0+nt1m9ANomkaQ1ryyuQF9R
         2a4Q==
X-Gm-Message-State: AOAM532lEcW0GKwpzsOMw7+kASl0DV1UtyRoUcp0LjhJxUaX5bkdgvQX
	IqOosZze+UY74RPhQFthRfM0MyZR+2W9iV+d
X-Google-Smtp-Source: ABdhPJzNdbl61KANwq7cq9CbNiVJJbXiU1VWNd4XtDEdtGE3MAZbOm+cL/N6dntcGdQk4YuTRw20FA==
X-Received: by 2002:ac2:5dc1:: with SMTP id x1mr5013738lfq.182.1613265747095;
        Sat, 13 Feb 2021 17:22:27 -0800 (PST)
Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from localhost.localdomain (c213-89-0-115.bredband.comhem.se. [213.89.0.115])
        by smtp.gmail.com with ESMTPSA id j137sm2264727lfj.55.2021.02.13.17.22.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Feb 2021 17:22:26 -0800 (PST)
From: "Oleksandr Kravchuk" <open.source@oleksandr-kravchuk.com>
To: openembedded-core@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH] tar: update to 1.34
Date: Sun, 14 Feb 2021 02:22:13 +0100
Message-Id: <20210214012213.454634-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 meta/recipes-extended/tar/{tar_1.33.bb => tar_1.34.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/tar/{tar_1.33.bb => tar_1.34.bb} (95%)

diff --git a/meta/recipes-extended/tar/tar_1.33.bb b/meta/recipes-extended/tar/tar_1.34.bb
similarity index 95%
rename from meta/recipes-extended/tar/tar_1.33.bb
rename to meta/recipes-extended/tar/tar_1.34.bb
index 5e34cdf9e5..af04919c41 100644
--- a/meta/recipes-extended/tar/tar_1.33.bb
+++ b/meta/recipes-extended/tar/tar_1.34.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
 SRC_URI = "${GNU_MIRROR}/tar/tar-${PV}.tar.bz2"
 
-SRC_URI[sha256sum] = "85b6953f4bc9666eb7db61b48f150dca21b941d85090171ea8c4f89902e460af"
+SRC_URI[sha256sum] = "b44cc67f8a1f6b0250b7c860e952b37e8ed932a90bd9b1862a511079255646ff"
 
 inherit autotools gettext texinfo
 
-- 
2.25.1

