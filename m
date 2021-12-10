Return-Path: <uvv.mail@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EFC1C433FE
	for <webhook@archiver.kernel.org>; Fri, 10 Dec 2021 11:50:40 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web12.6109.1639137038752752845
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Dec 2021 03:50:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=FwaQ13ZE;
 spf=pass (domain: gmail.com, ip: 209.85.128.46, mailfrom: uvv.mail@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id
 g191-20020a1c9dc8000000b0032fbf912885so6412505wme.4
        for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Dec 2021 03:50:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=pvKfVOTcbU397aBsNGOgQSy4hE0CveVv9ErsYglMtQY=;
        b=FwaQ13ZE1TD8lCngp6+EslXvxqcFo/+139SVwLhKnI3eR/gHsZcT+A9O3Y91p+p5kR
         nlbtOL72AfUpW8c/HNhgb+CNX1C2EHk5Ttx5AQCmtXr8F+qFPEWP2+ZjpDQZVXFGjOUA
         yZuSDuDu7dNWlbb4M5OByORt3fbHrRWpsi7Hmq+Ui+tjqW1bntTVssVurm0XqesipwiP
         nU5o8aFVVf5QlUlsCZJZbaq8tFISoKq5J61dq9nYXjIriFJZZtPhqNC816F2NbeqG2a8
         VFeMhlv5bm13m+1HdQe6++fuJZszyXtAZ+QCm+et847Ln+Ca2yg3fKBC19gV5zTBIIaI
         4JoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pvKfVOTcbU397aBsNGOgQSy4hE0CveVv9ErsYglMtQY=;
        b=3I8l7ReZsz8pp/srvuyfftt1z/8ypldMkl5CaUYDNXYEsTtoySnNa2zZ60O0pFcgwR
         MnAmo55JxUr25FacU1VIf4kn8cL1Xil5GEWtsZOfTf8I22tpErE4iiwgbgxO88/8Lq6x
         WcKJEbQZ43Xa98g1cFziRS2je4/MN+CCtIbgw8SeZY+hDm02l7p8mz+P/1ttM8I7jYGi
         0uL2DCpg+kM/euEpcZboNwpztk9V0ibW5OsCjLeBmV97lKzjy++JiskA0DHSs75AY4oH
         MO/G6714Lv5PhA3xvAorQHtejAu569wB/zMJqiiB0SX/cYXe+p509OnZez5QUS/NGGMr
         Zkfg==
X-Gm-Message-State: AOAM533jSme2tUQnUsLTm6xFJlanKnWt2UChZF/2YpFE1UIQ57VvM4Qh
	FFQz7Gv5w0ru6+x7YPw7kz3fU9sSZsERzA==
X-Google-Smtp-Source: 
 ABdhPJyhwVDqbRrLBvlAo7WY6Dg32Y1bqJJ8Q4orzkzSKvWyfgOJEXtPGIwPyKLNI/RJXmuzDW/6TA==
X-Received: by 2002:a1c:f70c:: with SMTP id v12mr15497088wmh.18.1639137036962;
        Fri, 10 Dec 2021 03:50:36 -0800 (PST)
Received: from slackware.local
 (dslb-002-205-007-123.002.205.pools.vodafone-ip.de. [2.205.7.123])
        by smtp.gmail.com with ESMTPSA id
 y6sm11496662wma.37.2021.12.10.03.50.36
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Dec 2021 03:50:36 -0800 (PST)
From: Vyacheslav Yurkov <uvv.mail@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 7/8] overlayfs: update notes on /etc
Date: Fri, 10 Dec 2021 12:50:26 +0100
Message-Id: 
 <1cd96f8198395146577771a450ec5953bc2509b1.1639136706.git.uvv.mail@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <cover.1639136706.git.uvv.mail@gmail.com>
References: <cover.1639136706.git.uvv.mail@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Dec 2021 11:50:40 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159505

Signed-off-by: Vyacheslav Yurkov <uvv.mail@gmail.com>
---
 meta/classes/overlayfs.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/overlayfs.bbclass b/meta/classes/overlayfs.bbclass
index 3c0f4dc882..f1b8086ea8 100644
--- a/meta/classes/overlayfs.bbclass
+++ b/meta/classes/overlayfs.bbclass
@@ -31,6 +31,7 @@
 #   OVERLAYFS_WRITABLE_PATHS[mnt-overlay] = "/usr/share/another-application"
 #
 # Note: the class does not support /etc directory itself, because systemd depends on it
+# For /etc directory use overlayfs-etc class
 
 REQUIRED_DISTRO_FEATURES += "systemd overlayfs"
 
-- 
2.28.0


