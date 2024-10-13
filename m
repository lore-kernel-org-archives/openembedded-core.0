Return-Path: <changhyeok.bae@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 422F9CF2591
	for <webhook@archiver.kernel.org>; Sun, 13 Oct 2024 21:31:09 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web11.40532.1728855064384009635
 for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Oct 2024 14:31:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OqaPBPyI;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: changhyeok.bae@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4311d972e3eso17927445e9.3
        for <openembedded-core@lists.openembedded.org>; Sun, 13 Oct 2024 14:31:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728855062; x=1729459862; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PgATK9UQkjIit60fcC2EK9Y7jzbdpJXlUZfte7VBd/s=;
        b=OqaPBPyIczq9ihXgj7hlmhV3EfOBIcUZG8YrcyMgo9frqckYr6wj+1tX1oPiKzN+Vm
         OTPGQpi5WYGqOFImG/Ytl8JTtHJqp1ANfVo44bp8ZOof9B+uffkb/SiNXU4HeEwXrq8Y
         BKjEfzJoiWP9FHNFR+lHRQKR75YQyTpxExIj19Oa0Q9jnM2GdHegv9qvrcjpbb1pJ3ct
         uBq2MEAkb2SzikIztrD/Ve/YoT5atdG9whpoSdtOJ6mV3ggQdCTLaeHQfIiXL7GD5BmS
         st4ih7r4iwaXO1L8ZJ1HO6WbsPxfb42MX2chr95o9JmQqQRzEDfL2y2b1tmAibdK5aI9
         kkLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728855062; x=1729459862;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PgATK9UQkjIit60fcC2EK9Y7jzbdpJXlUZfte7VBd/s=;
        b=L7/if5oIcOt52n5rJgnTs8/AQv3fNGNZ8Z7/bZF5GtcNhz/lJA1ZDr+f3+Kkj6SdVg
         Y122I4QFaM09d2ZrYc5FunTRQyyG1IlZqo6+iO/bvso4aDeaF4I9zGsY5XrCQhf3adlk
         El2ncd1J3zARbYQ864Iohu3dDKQEETdcd79yUvyDAfmtkuhlMh7qknSrWhiQAPMsUCnZ
         UH96zKwxpGSHY2SNOhokoe1GHjTOBZdxl20xQIJ8t1fYx3rj7Vx/mXJzBjiWrZZU5Thf
         oCbkRCTOKhH5p9Bd7JD/1q2W+s6CJVWgG/twtq7DcF8WFVV171tDOFsI5/zOED+g85zc
         RWOA==
X-Gm-Message-State: AOJu0YwAgofQw2qYzv35Xnh81ZKdfN++RNkI3/VAqf/ZgdSRKJbIQDQE
	va9xc/HLMPw+kzd36Brzn9WMsReC8vasLliVjxB6hIZmfNMc20h/fDtHMQ==
X-Google-Smtp-Source: AGHT+IHzHLqfvJ12vAOyPh+REqJD8A6e0I2J3WHWobXBxwgeAeGs0wL4dvipMDXWacypUb7jXOnuGw==
X-Received: by 2002:a05:600c:5111:b0:431:1575:2e83 with SMTP id 5b1f17b1804b1-431255dc891mr54282505e9.10.1728855061592;
        Sun, 13 Oct 2024 14:31:01 -0700 (PDT)
Received: from localhost.localdomain ([95.90.247.223])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4311835c3acsm102747075e9.41.2024.10.13.14.31.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Oct 2024 14:31:00 -0700 (PDT)
From: Changhyeok Bae <changhyeok.bae@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Changhyeok Bae <changhyeok.bae@gmail.com>
Subject: [OE-core][PATCH 2/2] repo: upgrade 2.47 -> 2.48
Date: Sun, 13 Oct 2024 21:29:55 +0000
Message-Id: <20241013212955.91367-2-changhyeok.bae@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241013212955.91367-1-changhyeok.bae@gmail.com>
References: <20241013212955.91367-1-changhyeok.bae@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 13 Oct 2024 21:31:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205728

Changelog:
- sync: Always use WORKER_BATCH_SIZE
- project: Handle git sso auth failures as repo exit
- superproject: Remove notice about beta
- project: run fetch --refetch on unable to not parse commit
- Disable git terminal prompt during fetch/clone
- init: add --manifest-upstream-branch
- man: regenerate man pages

Signed-off-by: Changhyeok Bae <changhyeok.bae@gmail.com>
---
 meta/recipes-devtools/repo/{repo_2.47.bb => repo_2.48.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/repo/{repo_2.47.bb => repo_2.48.bb} (94%)

diff --git a/meta/recipes-devtools/repo/repo_2.47.bb b/meta/recipes-devtools/repo/repo_2.48.bb
similarity index 94%
rename from meta/recipes-devtools/repo/repo_2.47.bb
rename to meta/recipes-devtools/repo/repo_2.48.bb
index adebea1c8e..8b72a9e71b 100644
--- a/meta/recipes-devtools/repo/repo_2.47.bb
+++ b/meta/recipes-devtools/repo/repo_2.48.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 SRC_URI = "git://gerrit.googlesource.com/git-repo.git;protocol=https;branch=main \
            "
-SRCREV = "1e19f7dd61923b8835d9c6e1a7e560575dafaf1e"
+SRCREV = "454fdaf1191c87e5c770ab865a911e10e600e178"
 
 MIRRORS += "git://gerrit.googlesource.com/git-repo.git git://github.com/GerritCodeReview/git-repo.git"
 
-- 
2.34.1


