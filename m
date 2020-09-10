Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com [209.85.215.194])
 by mx.groups.io with SMTP id smtpd.web11.12182.1599702460571568722
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Sep 2020 18:47:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=AePyO60J;
 spf=pass (domain: gmail.com, ip: 209.85.215.194, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f194.google.com with SMTP id w186so3365296pgb.8
        for <openembedded-core@lists.openembedded.org>; Wed, 09 Sep 2020 18:47:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GGNuTP+v7OWvo/UeVo0jzw1GwNQA2xQiDdaNW3rBHBM=;
        b=AePyO60Ju0O33xH7JoiAlgG0hyYe6EjL4xT8lMM+iH1keWGEvipEDI/UNrMHXQphcI
         EGVOPIWVLHgM7WznYo7qAU0qKyG0g+iltmcr4XBAzX0pOlwiG+Lap+uL4hCjlGLtW3Em
         aWQZv2NlMc7oZ8xLgQrgLvDnJrf75056ikdvm1IMOKZectmXtGXmkwvQjVBRlmx1z6aC
         pUzPd0PQwzRKmvFXk+DgZVtAxT7zSmmyTlRToWii5Z5DuTeqQWW+em3hoq8RF3mqIIbe
         Ot7txA7ocOnwVf16X/KTUs69hUxZdK4pzYnJFmJ5eYIcyqaubfuGVevjZJh4l0L3QwpN
         A35A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GGNuTP+v7OWvo/UeVo0jzw1GwNQA2xQiDdaNW3rBHBM=;
        b=Kb+WxA9SZ9a6zk5muwOVgRe/L4MfChxV5x/zc0F8qBzq5bxTgSLLLBYET2onx9D56q
         /ogWK7mY1lqly0NVsFrgjm9enCnhHhfrJtHiPJxuB0HcaYYA2kA/skVCwfjrr05MS/r3
         GbhF4Y+7oLkUsRzWttK/ZoUzBMNxb5KvLJSkjiDBDKqXSqyjy/i7Se8GcQf7+dtKnxwh
         NKMde/HWyZpjXN6gX49KO7bO8LGefuyplclhSc5FsAKkYoraOf8Q/HVY2el50/SX8EYQ
         32koXF/XvU9BoAD+YXqdgDrAbnN2E2LLTzng1EIvxdM7rW2z5lXgzaWp6JiISntmPg0T
         JN1g==
X-Gm-Message-State: AOAM5324IKySB66veS20mGb2RWeEFZF3HGzj8D017IpUmSpqT1A4coca
	bBdpPgIqlNEvwXe9i07mphyVojHQWBTiaw==
X-Google-Smtp-Source: ABdhPJyft6rEfsRw+BL6P5T4Rsv+oM+7YgUVks4HcaE2rwxa9JMxuyIVfu4dM+DV4riSIPZc+GI3fA==
X-Received: by 2002:a05:6a00:2a6:: with SMTP id q6mr3185041pfs.154.1599702459856;
        Wed, 09 Sep 2020 18:47:39 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::d92c])
        by smtp.gmail.com with ESMTPSA id br22sm352852pjb.35.2020.09.09.18.47.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2020 18:47:39 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 1/3] musl: Upgrade to latest master
Date: Wed,  9 Sep 2020 18:47:35 -0700
Message-Id: <20200910014737.779020-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Accomodates rv32 port which is out of tree at the moment

details are [1]

[1] https://git.musl-libc.org/cgit/musl/log/?qt=range&q=73cc775bee53300c7cf759f37580220b18ac13d3..ffac0c229986725c0d0f3c806bafa7e3ca409f3b

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/musl/musl_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/musl_git.bb
index 51b19e89a5..e72b05a36c 100644
--- a/meta/recipes-core/musl/musl_git.bb
+++ b/meta/recipes-core/musl/musl_git.bb
@@ -4,7 +4,7 @@
 require musl.inc
 inherit linuxloader
 
-SRCREV = "73cc775bee53300c7cf759f37580220b18ac13d3"
+SRCREV = "ffac0c229986725c0d0f3c806bafa7e3ca409f3b"
 
 BASEVER = "1.2.1"
 
-- 
2.28.0

