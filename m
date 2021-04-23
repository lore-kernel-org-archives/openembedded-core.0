Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
 by mx.groups.io with SMTP id smtpd.web08.60.1619200985044494155
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Apr 2021 11:03:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=dpoMHGOv;
 spf=pass (domain: gmail.com, ip: 209.85.208.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f44.google.com with SMTP id j12so33354208edy.3
        for <openembedded-core@lists.openembedded.org>; Fri, 23 Apr 2021 11:03:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=GH5P5+I4VqKXVcXiKKxZUG1fwTsTEcYYHwAuWKprdU8=;
        b=dpoMHGOvuyeLesJXZHvf1+W8yyA8zDNBZwv8+U7j3sSQUwapGZoIMIiQf8Ps0q50cB
         VLUL72HnSjRVxBYIhCkTbFKxefVYIZWhN7Ehi1QyfemCzwmJyhoUCB7oFTIKjwfm0QDM
         i35NVpo+tq61ujO27Hj7MBs1hQsqfTscuNM2DHIOVB2UAlaPxjQ0H88tyI/PvIn+GkI8
         91mesfGaqQ7qdOYVJCLIp/cIcJlo8Rl+MkW7MN/5aV2UhzpFgovrxWrqXTdBBETzYTgo
         Rk69PwGTjlqXY+ygCZErBSlXWq7iZZyh50UGP16ZFsHIYH0Bo7WUuDH+t6bJzvvSM/Tg
         oz3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GH5P5+I4VqKXVcXiKKxZUG1fwTsTEcYYHwAuWKprdU8=;
        b=mdubwBzWojIRYKe6Yn1ttVwxUoW1PS0/g5iTDX0kGRpZT4nKzNlf3WnT0Mu8m2qYIu
         Qxsm540tAw0w9jdy6rkQp49OhDDgr+3LJH+mOHOdZtUSs8hAG+y2XTGlAFSWL+IgCfAh
         jjG7990bqxEH4mS7yTgzxXtA0RPQxVzyjlajA+nn7hkrAO9OvJnaE6F+3bGKP1KNHcB5
         hr8GlMBRaiNER1C+GIluxFNhSXi0it4SKoy6RmqEsnq1g7YU6xXq6DB5J7QiDc4b61ZI
         0400eLJimDKMVg7SS/dspVSAxdZznhbhl7WrnjPk74WRnV2iWnQG8BkwJn4GK/H7+tRB
         qxXg==
X-Gm-Message-State: AOAM532mCCJ4dcAIp0bz6qSX+gyILn0YMJMVkJtzBYU2iWtW82xmYxOf
	69T8D7tnIpTccBdD/hx1qeEdr3DVknQNiA==
X-Google-Smtp-Source: ABdhPJzW5GrZCOpQBuf2ibXO7ohVtHy74K7/Tt+b8syaAkegTMVUHYTG03QRdOAquYj9RIVMHgctmg==
X-Received: by 2002:aa7:d615:: with SMTP id c21mr5885572edr.176.1619200983730;
        Fri, 23 Apr 2021 11:03:03 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id z14sm5315849edc.62.2021.04.23.11.03.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Apr 2021 11:03:03 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 5/7] core-image-multilib-example: base on weston, and not sato
Date: Fri, 23 Apr 2021 20:02:52 +0200
Message-Id: <20210423180254.706537-5-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210423180254.706537-1-alex.kanavin@gmail.com>
References: <20210423180254.706537-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../recipes-multilib/images/core-image-multilib-example.bb      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-skeleton/recipes-multilib/images/core-image-multilib-example.bb b/meta-skeleton/recipes-multilib/images/core-image-multilib-example.bb
index e7d50aefda..1290968b9d 100644
--- a/meta-skeleton/recipes-multilib/images/core-image-multilib-example.bb
+++ b/meta-skeleton/recipes-multilib/images/core-image-multilib-example.bb
@@ -6,7 +6,7 @@ SUMMARY = "An example of a multilib image"
 #
 
 # First include a base image to base things off
-require recipes-sato/images/core-image-sato.bb
+require recipes-graphics/images/core-image-weston.bb
 
 # Now add the multilib packages we want to install
 IMAGE_INSTALL += "lib32-bash"
-- 
2.30.2

