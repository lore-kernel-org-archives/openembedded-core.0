Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.web12.17594.1590940411998511898
 for <openembedded-core@lists.openembedded.org>;
 Sun, 31 May 2020 08:53:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=YuEB+Q5I;
 spf=pass (domain: gmail.com, ip: 209.85.208.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f52.google.com with SMTP id e12so176541eds.2
        for <openembedded-core@lists.openembedded.org>; Sun, 31 May 2020 08:53:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=dZWTQeDBoUyxir2i/Se/ZEXwU4IvG6f7PnYY6h9JnVA=;
        b=YuEB+Q5IuBel/hFFK2g1XG4jhgwp6uah05IbW8Q6tRh4XOLf6q36Yb3K6FjP4zru9K
         wIXTTZe37gI801gYJH3R1Yl5DRlMCoO9tQ6vWH0LJTyMz732XlJcU+VlILYnhc0UQ01U
         KLPzPb/QAqCSZ9wmLRk/se65nYFRe3a6NWWea5GobRqo8opb9vPD1maN7GyYYcS1lBIX
         4ntmdDRWZiUjQebC/nphOyHxCVY01VEm2mv7bRRD1IHEnAggQI+UQhgW/wU5rvoeXmM/
         fvZy01IZNL8ZXLyJE/C26ePyOxtuucrl1ezwKlB2Q4UxStDY+RbnJt2kMx8CdmaexBpy
         OKYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=dZWTQeDBoUyxir2i/Se/ZEXwU4IvG6f7PnYY6h9JnVA=;
        b=ghfD1W72+1HOotMKp0cG0UNT9IR+xqgMlsy6ZxSaGr35IfdKyoE1evPn2ifXqLucrj
         Jfvh7tJl4yY/IEOKyDYD/UpC9JZEFPMHoJGwBOOYRqQrU/mjnp0ZuZm/l1a+dd206rwU
         5OgWjL8JSVwxePnLLy9wk3SNXIl4VBGpKOgCCoMIVM/AYBywBdG7LCQ2gDxfAXqJVHXZ
         ogLU2RWFlxGfRg7HYMlqxzAhTADOYIq/b3XlldseA7dzA5Dr1swSRYrfEs36FEOpI2us
         umg20Ndn+9OuLCStVlPWc1WdhcMV5LTDjPSaUd2oR0TdQ0NlOcoPHgzAoznjwKLsslzF
         Bzow==
X-Gm-Message-State: AOAM531/cdBj6nTA+ufBzC/+9aIS3JkZA2RP9z5PwFnnqWlBVUIN1Pl2
	R2dLZJ06c2+xH6xMaqsHU+wK2dHw
X-Google-Smtp-Source: ABdhPJzbeUQRXsgRPZwN/8mga+f/mYmVqPYCWL5jHbzoJUbBvGggJfuUpQTtB112hAn0L4/w83JFsQ==
X-Received: by 2002:aa7:c646:: with SMTP id z6mr17977726edr.13.1590940410302;
        Sun, 31 May 2020 08:53:30 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.site ([2a02:2450:1011:56f:238d:84be:b349:9184])
        by smtp.gmail.com with ESMTPSA id dn15sm13227042ejc.26.2020.05.31.08.53.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2020 08:53:29 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 03/70] ccache: upgrade 3.7.7 -> 3.7.9
Date: Sun, 31 May 2020 17:51:47 +0200
Message-Id: <20200531155254.10283-3-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200531155254.10283-1-alex.kanavin@gmail.com>
References: <20200531155254.10283-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-devtools/ccache/ccache_3.7.7.bb | 7 -------
 meta/recipes-devtools/ccache/ccache_3.7.9.bb | 7 +++++++
 2 files changed, 7 insertions(+), 7 deletions(-)
 delete mode 100644 meta/recipes-devtools/ccache/ccache_3.7.7.bb
 create mode 100644 meta/recipes-devtools/ccache/ccache_3.7.9.bb

diff --git a/meta/recipes-devtools/ccache/ccache_3.7.7.bb b/meta/recipes-devtools/ccache/ccache_3.7.7.bb
deleted file mode 100644
index 3e7362b28b..0000000000
--- a/meta/recipes-devtools/ccache/ccache_3.7.7.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require ccache.inc
-
-LICENSE = "GPLv3+"
-LIC_FILES_CHKSUM = "file://LICENSE.adoc;md5=22d514dbc01fdf9a9784334b6b59417a"
-
-SRC_URI[md5sum] = "500d7bd9ebc6ee3105d7fc332c1ef395"
-SRC_URI[sha256sum] = "9b61f7fab2ec15305ee8382b03365503232dfb04b57414e7b0433768d530fa8a"
diff --git a/meta/recipes-devtools/ccache/ccache_3.7.9.bb b/meta/recipes-devtools/ccache/ccache_3.7.9.bb
new file mode 100644
index 0000000000..a4de6c9fe1
--- /dev/null
+++ b/meta/recipes-devtools/ccache/ccache_3.7.9.bb
@@ -0,0 +1,7 @@
+require ccache.inc
+
+LICENSE = "GPLv3+"
+LIC_FILES_CHKSUM = "file://LICENSE.adoc;md5=22d514dbc01fdf9a9784334b6b59417a"
+
+SRC_URI[md5sum] = "a4a38afc62ed189904357739fd8f3fb8"
+SRC_URI[sha256sum] = "92838e2133c9e704fdab9ee2608dad86c99021278b9ac47d065aa8ff2ea8ce36"
-- 
2.26.2

