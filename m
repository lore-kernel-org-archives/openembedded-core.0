Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
 by mx.groups.io with SMTP id smtpd.web11.7345.1587740549711898818
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Apr 2020 08:02:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ooWGMbZ/;
 spf=pass (domain: gmail.com, ip: 209.85.128.68, mailfrom: bartlomiej.burdukiewicz@gmail.com)
Received: by mail-wm1-f68.google.com with SMTP id 188so10836240wmc.2
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Apr 2020 08:02:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=HZPKdAta/XF4I8slVgoAyI1t6qYbVEZC4dOkm4szcMM=;
        b=ooWGMbZ/yB/8vxnoLAYRg0j8bV4+ol4amKXp3g/qWdbkImo3C+Zo8n4zALhau4QbfX
         3JlZuke6wnFCNx3hWncxQqNg0LUcU+B+YEp8xFsvS0oRlZotRc1ajP/gX6IdtyHrXDbP
         d7JfZWoYUAsFe08vaY/+bzoGzcMuEHsoNO+i5JtLZlkO0APFq6Tp6G9uQDN2CFvjWepX
         ilmUo6CODgQN3B7N4CIPZx3sHrYu/3bazxG/l7RZYWpAEma37pkiZW5jxFHfFuRUE32B
         CpFK37tVIUUAU/p5ip30EnLmf7PdMheoWOXKvJFJxsgFutVWSAVRadn8pnxCIA+bmm0B
         kEag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=HZPKdAta/XF4I8slVgoAyI1t6qYbVEZC4dOkm4szcMM=;
        b=imcKJW6avN+LfnjkE92D7flyCyVIyHTp1AvxhgBtmIwpOhynFLJ0duwXPcP6ot67SR
         tt36lk5YwVLltQT2aJv3a15B4c0ho2ev2wfUK6Rt2pDrIwfbrt9kVh/FTC7NfmrypacJ
         HkKTo0wD017Av2tvvol0gVO54Lpc1z1z4Np3ovmuWBkMNFJbZAecqZOuqt5cz4HFF2v8
         DdmC/94gSq3og85jSeW3TBTZzFp75pDWDyxtSANV/wVU3Dlx2KGzLjr5xtyCSKUaWo0b
         FUNyNzImLlbxEg3wS/h9R/ML3Y0/9kCQ+8duoE99IMQ6iXeR/bHc1vmU0k7vlCxx9uLm
         /gRQ==
X-Gm-Message-State: AGi0PuZyPe73ztxVzV5gBcOYq/sJEc5EINhV2dljaVxSrTjf2uQ1dKba
	eqNeJbnpLcSwDn7SQ0Y3Q726wxVPliZrqw==
X-Google-Smtp-Source: APiQypI1UAX5RPibz7Rm/G/pmhGXMysYiFjzwivypfEIO+NB4yXu4rSmS9IftCUCWoKM3CGF0XGytw==
X-Received: by 2002:a1c:a9d3:: with SMTP id s202mr10626366wme.160.1587740547863;
        Fri, 24 Apr 2020 08:02:27 -0700 (PDT)
Return-Path: <bartlomiej.burdukiewicz@gmail.com>
Received: from localhost.localdomain (asx191.neoplus.adsl.tpnet.pl. [83.26.235.191])
        by smtp.gmail.com with ESMTPSA id b2sm9672249wrn.6.2020.04.24.08.02.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2020 08:02:27 -0700 (PDT)
From: bartlomiej.burdukiewicz@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Bart=C5=82omiej=20Burdukiewicz?= <bartlomiej.burdukiewicz@gmail.com>
Subject: [meta-oe][PATCH] libva: Removed virtual/mesa dependency
Date: Fri, 24 Apr 2020 17:01:43 +0200
Message-Id: <20200424150143.374520-1-bartlomiej.burdukiewicz@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Mesa can be compiled with libva support, in order to avoid recursive
dependency between mesa and libva, virtual/mesa must be removed
from libva recipe.

Signed-off-by: Bartłomiej Burdukiewicz <bartlomiej.burdukiewicz@gmail.com>
---
 meta/recipes-graphics/libva/libva_2.6.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/libva/libva_2.6.1.bb b/meta/recipes-graphics/libva/libva_2.6.1.bb
index 92cea83bc1..c1a441a18b 100644
--- a/meta/recipes-graphics/libva/libva_2.6.1.bb
+++ b/meta/recipes-graphics/libva/libva_2.6.1.bb
@@ -23,7 +23,7 @@ SRC_URI[sha256sum] = "6c57eb642d828af2411aa38f55dc10111e8c98976dbab8fd62e4862940
 
 UPSTREAM_CHECK_URI = "https://github.com/intel/libva/releases"
 
-DEPENDS = "libdrm virtual/mesa"
+DEPENDS = "libdrm"
 
 inherit meson pkgconfig features_check
 
-- 
2.26.2

