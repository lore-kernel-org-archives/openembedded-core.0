Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.web12.15078.1623570872819663743
 for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Jun 2021 00:54:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=iu2dE+8T;
 spf=pass (domain: gmail.com, ip: 209.85.215.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f180.google.com with SMTP id t9so6143635pgn.4
        for <openembedded-core@lists.openembedded.org>; Sun, 13 Jun 2021 00:54:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=iFJV2/IwTOjo5ReZIZUDUaLPKMuhS2SJfMs/f0dYxdw=;
        b=iu2dE+8TJo8xnM3ITPJ+QSOvmrg1XPxjJZ/FSCe8aZpRap5GeeuFQUNhP+F7VcPj3m
         KQM3gQ9062cYEhjU9aSPN1B0+qBrpFKmZOemQtyxxpxoOeF6Y1TO3WvDB4uJnWzAvkh4
         4p1UigX1TIMBpo8r1pZdZJJONUmDY/tQ3/+6UtQatJZDTVKbf3MniznZ6RK7ngbJlyCk
         6xSyUY2vwyRO7cCMEYbzcGipdonDbjbSIYvnS8J2PYjbyFF0oK3I+OHviy+lbiBeD9/i
         X5LOpjm+shCsyw9hUoHg5aA5uA0wV6zKI1H9a2VHutSZPrQUYveHnPtrZWPIQ9GVQPfL
         pcdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=iFJV2/IwTOjo5ReZIZUDUaLPKMuhS2SJfMs/f0dYxdw=;
        b=Cylu5LjgHfwmulW0eoIr2vDzNpZIYqdSh+MloA4fi0rnYD8IxNqQv+JjdwulSFvTh3
         RBSC+FQC5RsD08qmbG5rAf3mwhkgwRvB8MZYIvkFMM7aOLw+NvRwm2cN2cDCy5L/s+ZI
         W+MkZPfBYH6YG0+GdNp2qLmsvPmmiyl/4Yz2cMZzvmT714XmAi1a1eJSCc7d6cNIB43m
         54CjlDkxoZ3eWsLKKQKpgTmmqr7A6jNdGaufqlDQOY8hpgepHFaAipywLmWXw5WHirjX
         AX1jv9EPJ4QTCfH5K/+zRAlY5dOjEcLsqZbk4yo52bSoAiF5XwLzrEyptVz+WEyzq0nK
         R+7Q==
X-Gm-Message-State: AOAM530bWmroKM5uDg2ekkjw/q57mhyEPHQ9sLy37lWpC8t7TrppMNvl
	sdO+US0O8q4j9S1rJM+dLcXU/wyaZ+5JGw==
X-Google-Smtp-Source: ABdhPJyQdJFB1KZnh8uvK7tWHD6lyXmRnBApHHBbdCuvyWZoZU1glymUHk5+8lxVRiuKWbSNbczKGw==
X-Received: by 2002:a63:1143:: with SMTP id 3mr11790626pgr.166.1623570871936;
        Sun, 13 Jun 2021 00:54:31 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::a054])
        by smtp.gmail.com with ESMTPSA id ip7sm8312665pjb.39.2021.06.13.00.54.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Jun 2021 00:54:31 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] linuxloader.bbclass: Add entry for ppc64 LE glibc loader
Date: Sun, 13 Jun 2021 00:54:28 -0700
Message-Id: <20210613075428.2205130-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/classes/linuxloader.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes/linuxloader.bbclass b/meta/classes/linuxloader.bbclass
index 30925ac87d..3ded1fc786 100644
--- a/meta/classes/linuxloader.bbclass
+++ b/meta/classes/linuxloader.bbclass
@@ -40,6 +40,8 @@ def get_glibc_loader(d):
         dynamic_loader = "${base_libdir}/ld-linux-mipsn8.so.1"
     elif targetarch.startswith("mips"):
         dynamic_loader = "${base_libdir}/ld.so.1"
+    elif targetarch == "powerpc64le":
+        dynamic_loader = "${base_libdir}/ld64.so.2"
     elif targetarch == "powerpc64":
         dynamic_loader = "${base_libdir}/ld64.so.1"
     elif targetarch == "x86_64":
-- 
2.32.0

