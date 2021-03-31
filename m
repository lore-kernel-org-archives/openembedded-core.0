Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
 by mx.groups.io with SMTP id smtpd.web11.5634.1617193384792923361
 for <openembedded-core@lists.openembedded.org>;
 Wed, 31 Mar 2021 05:23:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=lJibdiO7;
 spf=pass (domain: gmail.com, ip: 209.85.208.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f53.google.com with SMTP id w18so22155135edc.0
        for <openembedded-core@lists.openembedded.org>; Wed, 31 Mar 2021 05:23:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=W/yhZWRVWInvEQAXOkCPuFNLfglhOJNP9pqez8TkREc=;
        b=lJibdiO7MJKF5Z00ILusKxw0SEgG9ZynB66FvktElujOIXQRbZEWJltQpJmipuLiQR
         nkG62lNQF9bYUKZ+quOpnBCP0bwjjC9IUlah/isZm4UkSSzqSPlCLrQ0aj5vLMB7pm9C
         CHghMsz9LjI8oyooiv3F7ogUQ6rbgilXWyoWFZtwSAjyxWUcsT6uGeZQOU2WO/Lxx/Sy
         6xZw9wEnxV4dbns5H20F7eJ03Xh1djHrbpUkl6hD0Ew1HPDHbofn3nJvM+gyi/rYzvbN
         1MgRA7fTbVRhjDbRQcrxux5VX/n6xuiwBZKYX6fMFYmIkzQi4d6lexe7sR9OZu90oDzf
         Nvew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=W/yhZWRVWInvEQAXOkCPuFNLfglhOJNP9pqez8TkREc=;
        b=J5FLcJWGE/TVLvT/jYRlHpHDbkHtoSZb8nmXtDoBaUP1U+2NEYrsMZebm1vDA51OwU
         TxgiQeLBnISl+WgSwrp5pAn4VOXPKwfmVaqA+vipMfDYfTDL4y+ySPQF+61gFoOyoQqc
         eZBLqyEZjF1S6Ze7N2/witFwDML3Mh/EIqEhX3IOgrPxKMS4III8YWX6Vj5X6erq73Or
         3hMZp69jmmT6zdnCgdAWR2ugcsEJafMNV2vy/LJlwF1tKQooMldBj9ztQG82Hf+MMtWQ
         Tx6GjbCnmL+LIHrVKcfDj+YrXyxhazh+k+WmyA52GWF6aNX/g7PqdhG71RQzrvESMJrB
         Thtw==
X-Gm-Message-State: AOAM531c8mInjWxkBtm6R2sjbpduCgwr6iTrKjX6IgmjmyTR/oa6c7qX
	oiamRnQ0HhujdZwUUUHgAaJfZ2TG+5jMKQ==
X-Google-Smtp-Source: ABdhPJz5O2jgcOQFJ+TVuVQaNbbmsJvf5zOT2CAyQtj+16B97MT70IbeoI4wnFqBMHjC3ewydt+1qw==
X-Received: by 2002:a05:6402:13ce:: with SMTP id a14mr3345831edx.365.1617193383247;
        Wed, 31 Mar 2021 05:23:03 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id l10sm1497979edr.87.2021.03.31.05.23.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Mar 2021 05:23:02 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 2/2] ptest-runner: correct version check
Date: Wed, 31 Mar 2021 14:22:54 +0200
Message-Id: <20210331122254.121192-2-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210331122254.121192-1-alex.kanavin@gmail.com>
References: <20210331122254.121192-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-support/ptest-runner/ptest-runner_2.4.0.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-support/ptest-runner/ptest-runner_2.4.0.bb b/meta/recipes-support/ptest-runner/ptest-runner_2.4.0.bb
index 8b9938f572..0d23a3ee89 100644
--- a/meta/recipes-support/ptest-runner/ptest-runner_2.4.0.bb
+++ b/meta/recipes-support/ptest-runner/ptest-runner_2.4.0.bb
@@ -12,7 +12,6 @@ PV .= "+git${SRCPV}"
 
 SRC_URI = "git://git.yoctoproject.org/ptest-runner2 \
 "
-UPSTREAM_VERSION_UNKNOWN = "1"
 
 S = "${WORKDIR}/git"
 
-- 
2.29.2

