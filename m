Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.web11.17524.1590940454161984757
 for <openembedded-core@lists.openembedded.org>;
 Sun, 31 May 2020 08:54:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=tx5zKqoF;
 spf=pass (domain: gmail.com, ip: 209.85.218.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f50.google.com with SMTP id e2so6838755eje.13
        for <openembedded-core@lists.openembedded.org>; Sun, 31 May 2020 08:54:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/JIspsdHWUVl1dAUCQeqXDC07lbo0YoCQwfgFWukFbU=;
        b=tx5zKqoFzEY/zzAZ/6aP4Jup+2foDWa1gZYJ/4lkIuvxXa/cc7JmoYQFfkc80QD+mb
         19nTHfltvKXXWJj7APa6ptdgAwtdlRC+Yfe7CRaZX2gwCm6VVvYBLOI+1N5L4vbPWI4O
         o8xgL31eRint5Rp1wfSr6RyvYAp+2Ju8G4+WeE0Exjb28UJfSTHS3ua5scxaQkJW6uEh
         uucZBRglgxWCMWDb2RSAx1P4h4d0fahJXlg1BUlTOtwsnGWKyoEuJY37Bd01kEf2y4j0
         FoV9tgwBX1CMAZkFPFpVxN/VGwIJphtTdmDyLFVQz6NVTBrfz6Pn7v/YqCPkk0Nf4uEw
         v0qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/JIspsdHWUVl1dAUCQeqXDC07lbo0YoCQwfgFWukFbU=;
        b=bc3OJUHAVF6PcYIe4FY8Ac2pF5uWE13igXBnbjFVxw11+kVI2mQkTxIHJbBzeO0Mma
         Mbbztvd5Rvb5mcViwJdJqAQ8A6V+lrA4+aiyzppEvFBu2ayCo0FduIBaY7qXMSq3UEP2
         8GYE+nP//iNSCY4uGZblhfjQPmBsEKFAH3wo8lIt6vkgXuXPgL9IjlMc+VrAhz9077wa
         bVtKkETowdmkWGEkFdluGWTTZYnmWXyFOAV4AGYlkaG9RhFa04+Gg06KibxL7vb8nlfW
         CwcIriHGi5T1dCMh/GIYFk9uVhZmOUh+wTyuOammohb/Vs0mI5rxiVddglXIi9UFgcCp
         QySA==
X-Gm-Message-State: AOAM532QDy3/gHQUYcH29AVJIcSSIFHsVB8Jz12nIHcnJCSXf3+EZI/K
	6MVZScwzeob1yDbil7wzOug37drj
X-Google-Smtp-Source: ABdhPJwcd8yCw9r7p/NilArh99qki2AiRDYmjbrFCCUJV6b86o1RhJKv15ZHLEUCOIWTr0l84j9Ndg==
X-Received: by 2002:a17:906:6094:: with SMTP id t20mr16952528ejj.359.1590940452567;
        Sun, 31 May 2020 08:54:12 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.site ([2a02:2450:1011:56f:238d:84be:b349:9184])
        by smtp.gmail.com with ESMTPSA id dn15sm13227042ejc.26.2020.05.31.08.54.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2020 08:54:12 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 51/70] ptest-runner: fix upstream version check
Date: Sun, 31 May 2020 17:52:35 +0200
Message-Id: <20200531155254.10283-51-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200531155254.10283-1-alex.kanavin@gmail.com>
References: <20200531155254.10283-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-support/ptest-runner/ptest-runner_2.4.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-support/ptest-runner/ptest-runner_2.4.0.bb b/meta/recipes-support/ptest-runner/ptest-runner_2.4.0.bb
index 09fabdeebc..0a3186dac4 100644
--- a/meta/recipes-support/ptest-runner/ptest-runner_2.4.0.bb
+++ b/meta/recipes-support/ptest-runner/ptest-runner_2.4.0.bb
@@ -12,6 +12,7 @@ PV = "2.4.0+git${SRCPV}"
 
 SRC_URI = "git://git.yoctoproject.org/ptest-runner2 \
 "
+UPSTREAM_VERSION_UNKNOWN = "1"
 
 S = "${WORKDIR}/git"
 
-- 
2.26.2

