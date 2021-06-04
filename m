Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web08.5834.1622797843596537567
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Jun 2021 02:10:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=gy+eorOJ;
 spf=pass (domain: gmail.com, ip: 209.85.218.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f42.google.com with SMTP id h24so13450499ejy.2
        for <openembedded-core@lists.openembedded.org>; Fri, 04 Jun 2021 02:10:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=M5IeoYPXZz+t6bGfPoFOE0lZTG0i0XJokrDSFoV11s0=;
        b=gy+eorOJT+8nE9EcWg4ynwl/HDF5d8upXW2RCY1Mv+jkVBPehkbIhm0b9R6MVTlR+i
         jpLlQktLxI5sEVe0RzL/bFIWs+cvLWb4+jOlYQ7B3foNHJnN5wSDLjrwFbr7vVJlkeSB
         yzoJJYgoXWAQYyyqJ0Yv1vrNG9UnYsVzTsqlDtpEdHC+WwcitdltLGmiVhT/qJYQWgtA
         PVMA9WmYJVOmWybbm014a6l0uY2EnCkACO47Grf0YcgYJdFe/Fp5WJ4Tw+GocMGUhNKQ
         dxSbZuhRy+fCxElCqwhe7vGXsAA9c5my+oNxYJ+/o2nZJgOs/YpHwM3B8eBYNkxnL7D/
         wAZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=M5IeoYPXZz+t6bGfPoFOE0lZTG0i0XJokrDSFoV11s0=;
        b=PTI26nQSJePP08ldMmV8PJYDyYXEJN6tuVePP4Z2amPsq8sUhGhGv5jWpPFcZUht4Q
         i58+T0QI7TFXxm+uXzAmhjzpJohsdb4nRr74eoUGzXAeVuPXQwZQ2Ca6eQJDkIQBDmqu
         t2YcwXLLoZVRexpn7tWNnRhPNCcNGyhcy53Y4oTICKU0M2SG8r+khRNvoeeTu+BSsBXH
         JXGqUe7sACcXtdGU4gJ3VCrk1oF/uRZgPoFgl2ZLM8GY/V4Ig6OIr7BhaPu3TCzB5Eye
         8m7H50qDhq36Yge4FU+ll2KbwQdXY9qHl0AjZ8rtlyDUnMSLYTQG3aq+W6gvwhzTb7dr
         N46Q==
X-Gm-Message-State: AOAM531LZFptl0UUong0s4Pqh0NCx+MBdHCOBxX69RIXmJIWDY2DM7S6
	GDMDBbpvSjK7kL54OmCvu0QhEtVGkn0/Og==
X-Google-Smtp-Source: ABdhPJyaDM6GK1ELMujMk5hJ/6e5A6TXCrl6PPwsED99nM2fEGsUfUzQZKrXarvEL/h2ZYuxROzFsA==
X-Received: by 2002:a17:907:970f:: with SMTP id jg15mr3299385ejc.59.1622797842242;
        Fri, 04 Jun 2021 02:10:42 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id f7sm2525152ejz.95.2021.06.04.02.10.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jun 2021 02:10:41 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 10/11] erofs-utils: correct upstream version check
Date: Fri,  4 Jun 2021 11:10:29 +0200
Message-Id: <20210604091030.1380877-10-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210604091030.1380877-1-alex.kanavin@gmail.com>
References: <20210604091030.1380877-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-devtools/erofs-utils/erofs-utils_1.2.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/erofs-utils/erofs-utils_1.2.1.bb b/meta/recipes-devtools/erofs-utils/erofs-utils_1.2.1.bb
index 6435fea68c..5ab4bf2816 100644
--- a/meta/recipes-devtools/erofs-utils/erofs-utils_1.2.1.bb
+++ b/meta/recipes-devtools/erofs-utils/erofs-utils_1.2.1.bb
@@ -7,6 +7,8 @@ HOMEPAGE = "https://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs-utils.gi
 SRCREV = "d1f4953edfcf4f51c71ba91586e21fc6ce9f6db9"
 SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs-utils.git"
 
+UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>(\d+(\.\d+)+))"
+
 S = "${WORKDIR}/git"
 
 DEPENDS = "util-linux-libuuid"
-- 
2.31.1

