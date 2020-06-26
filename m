Received: from mail-ej1-f67.google.com (mail-ej1-f67.google.com [209.85.218.67])
 by mx.groups.io with SMTP id smtpd.web12.2881.1593155948269208709
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Jun 2020 00:19:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=iaDNrkDx;
 spf=pass (domain: gmail.com, ip: 209.85.218.67, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f67.google.com with SMTP id w6so8369816ejq.6
        for <openembedded-core@lists.openembedded.org>; Fri, 26 Jun 2020 00:19:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1YTasdE3xlsHv0wimGQT12Vl9sKPz9sHCSI5svRqG1w=;
        b=iaDNrkDxbp1YxKMGp9ozctL2xQqvKA7LLM6YvrPKS/0mh6ESdezxKhelbOa7y2RnML
         X3LPzIUNFEJZ4G3bbkCr9tAUi3DQNXjX0xsBmIc6455iDPgrSBS0STFh99Nw0ldK1jaI
         Ulj6pNQ6IDEpm4s6stp9ohCJNXWUksausq1vi/U5tk3eGlXoQxRwDZ9jktFmNsJE4R9j
         vF8wLYfN81AERQG+HOW8fpz8at6ALRfmNZLgz8jlmpnkyXi2QV+t/tAifXaCHbyVVRoI
         c5PPDEW07qZ1ZzTQtsUa7pTALVqjeiDIHgi0fgmfbAHg2X05CYUD6AiD/DEkqsywTw8L
         +0Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1YTasdE3xlsHv0wimGQT12Vl9sKPz9sHCSI5svRqG1w=;
        b=XYq+64CeQqKUhDXLV/JqNgz1tWNIdCO3y3PpO1UKKD86Y4VY8xT4nSyLne3gUx1DLn
         89Sgo82Kr/EW5d4G6IKVFlmVf3U/KJYJfZY96r47HlYHhf9XRcUHH/YfMdhynYObR+5r
         pjteZffab0mFM1OL2ZZ5aN9nZpYZGeXJ8H1rj7YI867NnrjXi77rmj/79+FqejVD4ast
         FUnJ/+h4/7BeOri+jydgK3pseMsnbAVmRxP8Twkv5JRGyboBy2Akxf9TgRCrndaPb7Ej
         Y8ke5xdWiF4wNjMKjjE05PEpRBtUCH9ePaG9C4qjyxWYUzh0i7YyIGJArWsn9s50DkNl
         Y8qA==
X-Gm-Message-State: AOAM533xaScud0wVyErnisHeHnSzTaJr3QbKhOuZKjIforPkk4IojC6n
	aKIiAOWV5H7gar4x2ZZQ3ykS4OD0r6E=
X-Google-Smtp-Source: ABdhPJxnLfbvBGyrx6psntDQEhxqI88pPDgnirYUBEg788koFbweoIPc22vFqDLAqH289CJlXAGwFw==
X-Received: by 2002:a17:906:7693:: with SMTP id o19mr1299213ejm.295.1593155946640;
        Fri, 26 Jun 2020 00:19:06 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.site ([2a02:2450:1011:56f:b652:c378:b428:fdf])
        by smtp.gmail.com with ESMTPSA id p4sm20826194edj.64.2020.06.26.00.19.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2020 00:19:06 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 07/30] gnu-config: update to latest revision
Date: Fri, 26 Jun 2020 09:18:21 +0200
Message-Id: <20200626071844.29134-7-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200626071844.29134-1-alex.kanavin@gmail.com>
References: <20200626071844.29134-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-devtools/gnu-config/gnu-config_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/gnu-config/gnu-config_git.bb b/meta/recipes-devtools/gnu-config/gnu-config_git.bb
index 9d1874c7bc..54eb5e48a1 100644
--- a/meta/recipes-devtools/gnu-config/gnu-config_git.bb
+++ b/meta/recipes-devtools/gnu-config/gnu-config_git.bb
@@ -8,8 +8,8 @@ DEPENDS_class-native = "hostperl-runtime-native"
 
 INHIBIT_DEFAULT_DEPS = "1"
 
-SRCREV = "e78c96e5288993aaea3ec44e5c6ee755c668da79"
-PV = "20200515+git${SRCPV}"
+SRCREV = "696cd4a4eab1ee9fefbb7e38dbab291d741d0c5a"
+PV = "20200621+git${SRCPV}"
 
 SRC_URI = "git://git.savannah.gnu.org/config.git \
            file://gnu-configize.in"
-- 
2.27.0

