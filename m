Return-Path: <changhyeok.bae@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EA09C433F5
	for <webhook@archiver.kernel.org>; Mon, 28 Feb 2022 23:56:50 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web11.2499.1646092608709026013
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Feb 2022 15:56:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Q5pJBiWQ;
 spf=pass (domain: gmail.com, ip: 209.85.221.42,
 mailfrom: changhyeok.bae@gmail.com)
Received: by mail-wr1-f42.google.com with SMTP id i8so789661wrr.8
        for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Feb 2022 15:56:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id;
        bh=KZkhqGdSkpg/pl0JYqLEKJuk3zQKcFGwgpdE1KXTJVM=;
        b=Q5pJBiWQUr7O3uTjWA9tKx632f060j6Zt5WpmUbSPZZeFwwmdwvSEq+ly4A0bpHbkY
         CswdrkjSCE7YIwb7VTW7j8NUdAGuRvwcH/UZ/c/bFrVmvt1z2BDP7gA+Je7TI7yzijpC
         X0l9qQoo93tJYe+rwUAlcu6moJXO8+B2CLqqFfaf7Tfdo02fMtKj8dM2t7Dxac7EjA+T
         LFML38CR2nBdNl7dJ22ufPnVdAk8Q0Q16xVNqy+neJ/+DyZ5okRdad+w8KYUMwbofwNr
         NNtu8F6K2ng57p5T02W2QGAzXyqQfGX/ikZ+ZflRz62vRlRbby9axAqQ3v9j9yyrJ6Eq
         0F9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=KZkhqGdSkpg/pl0JYqLEKJuk3zQKcFGwgpdE1KXTJVM=;
        b=VwfFEksIKiIWeo6wzHasjnbTpZjfOrdis4c5ITwj8B3PHdXSnJ8NtSl48HPHQRTHww
         LhusDa6bXKtkvfys6B/CrJWdZc/1WLYhhjugokMXZK1tz/UNKUkyG1kfYK+pb4dSehAf
         20wf1NOtfZcOPJuzFjrueVeY4SFvnLdZaDABSDrD19R+mcugMICddqi9gF1k7G2mkI5G
         4GrmI6IiSJo3OkPOiYMEKx/o58rLeR+4nAU6R70DUPX7WIDlmTx9FGhwbyl2B0KWBhmM
         U6WK85NbYUkyGfff9eLOPeJnSTHjuiEW3/2Wi4RJcctTK3OMpCkNdbaX4QoZ08XR+0lk
         LQhA==
X-Gm-Message-State: AOAM531XEy35RpAd0l9jxvGyxAWjJbOQNTAKKyBdaX2q08Medl4OlJsp
	3s0GtGxTgTlJNq+Z/Xj3UJNhR0kVy9c=
X-Google-Smtp-Source: 
 ABdhPJwQMJ+hZESSZqVOveAPY3v5YiU6wHULLW0nu6y+Yxh+ygLIKz7oChOyo6sY026Y8EQZjpFn7w==
X-Received: by 2002:a05:6000:1846:b0:1ea:78fc:1d60 with SMTP id
 c6-20020a056000184600b001ea78fc1d60mr16977110wri.590.1646092606896;
        Mon, 28 Feb 2022 15:56:46 -0800 (PST)
Received: from localhost.localdomain (ip5f5aec99.dynamic.kabel-deutschland.de.
 [95.90.236.153])
        by smtp.gmail.com with ESMTPSA id
 v124-20020a1cac82000000b0037c3d08e0e7sm797528wme.29.2022.02.28.15.56.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Feb 2022 15:56:46 -0800 (PST)
From: Changhyeok Bae <changhyeok.bae@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Changhyeok Bae <changhyeok.bae@gmail.com>
Subject: [OE-Core][PATCH] repo: upgrade 2.21 -> 2.22
Date: Mon, 28 Feb 2022 23:56:42 +0000
Message-Id: <20220228235642.66943-1-changhyeok.bae@gmail.com>
X-Mailer: git-send-email 2.17.1
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Feb 2022 23:56:50 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162518

Signed-off-by: Changhyeok Bae <changhyeok.bae@gmail.com>
---
 meta/recipes-devtools/repo/{repo_2.21.bb => repo_2.22.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/repo/{repo_2.21.bb => repo_2.22.bb} (95%)

diff --git a/meta/recipes-devtools/repo/repo_2.21.bb b/meta/recipes-devtools/repo/repo_2.22.bb
similarity index 95%
rename from meta/recipes-devtools/repo/repo_2.21.bb
rename to meta/recipes-devtools/repo/repo_2.22.bb
index 3c50793401..a99d5d7070 100644
--- a/meta/recipes-devtools/repo/repo_2.21.bb
+++ b/meta/recipes-devtools/repo/repo_2.22.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 SRC_URI = "git://gerrit.googlesource.com/git-repo.git;protocol=https;branch=main \
            file://0001-python3-shebang.patch \
            "
-SRCREV = "8e91248655acf1c8044ed8c1b265b804a99eb07f"
+SRCREV = "cc879a97c3e2614d19b15b4661c3cab4d33139c9"
 
 MIRRORS += "git://gerrit.googlesource.com/git-repo.git git://github.com/GerritCodeReview/git-repo.git"
 
-- 
2.17.1


