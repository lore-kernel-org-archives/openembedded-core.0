Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85368C433F5
	for <webhook@archiver.kernel.org>; Thu, 19 May 2022 19:32:27 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
 [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web12.32.1652988740688135938
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 May 2022 12:32:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=o5+my2SG;
 spf=pass (domain: gmail.com, ip: 209.85.214.180,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id n8so5649842plh.1
        for <openembedded-core@lists.openembedded.org>;
 Thu, 19 May 2022 12:32:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=EeVlCRQOWjqkZGWEIpS2Eetj8gx9Y9VIcBavkz6GI0I=;
        b=o5+my2SGt6DjjKWcjt2vt+mt84V8QCrCtjaGnmHZW4Yf0HfWxClPzH1+k7wSTWDoWs
         QNZAsC4icyCxicYWMnqGv+Po78aBWOUHs/akSbR7PqfQ49d6uzZY6bGQsbpl3V89CRz0
         9Gl0uRcdlFExytGebNYIwNxNmCEvwD7251O1w/88kf5c5O2uxDdYwgGJLvomgboxoi4K
         Ut21kSN3ZK4LVd1+A8ZDFhUKd4wj3T6RtXWw71puj/t8N8Az7o8gk0icIhsuS5aJp6rQ
         XETpXW6MoRBQQRdMiFNbIRx935tviaOuDxzwoDP3pM7oFVvmmVuuNMGtoFjBvczTc0k0
         Ix/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=EeVlCRQOWjqkZGWEIpS2Eetj8gx9Y9VIcBavkz6GI0I=;
        b=cdhCzfUpXIOG6ErynptQenmHFRCfnVoMYS9AIwQRCxZ2+9YdDINm/ZVdsKccUjhZ2J
         4Bnrd28+ittGNSjUCYXoaoXfVXxUsEM9KijjVFB1aBPa95aeLqmCs3UDrJAzeqh/Ogwv
         HEw3vFxsmYPMiJ3P5dQ3vT8htAjQ0zoCW6k39JH3n2R14JpJwXWHddr/NxV1V64cp4qp
         d8EsSBHB7LszlVQdlQXXWFpp7mJqR9mZTRadp7NwgIZq2hhDlSowuAfPaJ01xpVdSnGv
         gGzC/TZw+R8EFHUg7FLTPeieU2TAvlLMkWSOxsQQqTuHrAAeu1O65R9W8hH4roI5KYa3
         QO6Q==
X-Gm-Message-State: AOAM532nj2xxZrzEnM/bQ07/6G/MxcD2wS8TiP28T78UXvaw4nc1S8Ut
	1Z45L7J8QJ2FpAODhMxib9OsjGgTs4iPMA==
X-Google-Smtp-Source: 
 ABdhPJyjCwAxWVSAJpYfFRq2cpRfHXVFVrQahwwiBOhsPpfzeAC9IvcNTkvg6lOZ/3toArCRZ6y4VQ==
X-Received: by 2002:a17:902:ce8b:b0:161:8d76:6689 with SMTP id
 f11-20020a170902ce8b00b001618d766689mr6264689plg.153.1652988739837;
        Thu, 19 May 2022 12:32:19 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::2ca3])
        by smtp.gmail.com with ESMTPSA id
 a133-20020a621a8b000000b0050dc76281e4sm31604pfa.190.2022.05.19.12.32.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 May 2022 12:32:19 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] systemd: Update patch status
Date: Thu, 19 May 2022 12:32:17 -0700
Message-Id: <20220519193217.1130644-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 May 2022 19:32:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165908

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../systemd/systemd/0002-Add-sys-stat.h-for-S_IFDIR.patch       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd/0002-Add-sys-stat.h-for-S_IFDIR.patch b/meta/recipes-core/systemd/systemd/0002-Add-sys-stat.h-for-S_IFDIR.patch
index 15413d7a0b9..8cf05464502 100644
--- a/meta/recipes-core/systemd/systemd/0002-Add-sys-stat.h-for-S_IFDIR.patch
+++ b/meta/recipes-core/systemd/systemd/0002-Add-sys-stat.h-for-S_IFDIR.patch
@@ -6,7 +6,7 @@ Subject: [PATCH] Add sys/stat.h for S_IFDIR
 ../git/src/shared/mkdir-label.c:13:61: error: use of undeclared identifier 'S_IFDIR'
         r = mac_selinux_create_file_prepare_at(dirfd, path, S_IFDIR);
 
-Upstream-Status: Pending
+Upstream-Status: Submitted [https://github.com/systemd/systemd/pull/23441]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 
 ---
-- 
2.36.1


