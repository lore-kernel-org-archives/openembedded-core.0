Return-Path: <ranjitsinhrathod1991@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 600F6C433EF
	for <webhook@archiver.kernel.org>; Thu,  2 Dec 2021 10:19:08 +0000 (UTC)
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com
 [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.web09.6461.1638440347298947174
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Dec 2021 02:19:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=kH9NCHTm;
 spf=pass (domain: gmail.com, ip: 209.85.215.173,
 mailfrom: ranjitsinhrathod1991@gmail.com)
Received: by mail-pg1-f173.google.com with SMTP id q16so26533912pgq.10
        for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Dec 2021 02:19:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=VoygoL+RTlJO/yxbATH7FWAa6Uh3DL4QRliEQQCcmI4=;
        b=kH9NCHTmm6jiJgl4JN9oV9Fc0ROtceuybctmFgQjY7qqdpYImDtv27y0DE0LOOZEYt
         aeiIkYAf/bRcFRF47oagJqcZnUTBFmK1EFVVmq4hHdWT3Abv/74F5xg9YE49wXyJf1cj
         MC8fa7k4tXP/wDgK+uoYF03+el/4BD4WaZ2jGO6xFkpIx435pCHHrcY0gJ/OCGjSayoL
         619VEyZftNRYQpfMLx4ei+sR/coBITrm4IDr+BF/WbXIrVqezPCx+xw0bPfW1TEmh7do
         ThObaVO8oXzQhY4Gpa+cg96uN0M988tV5RDP0/z5bazsrnz7cZUsAVcUH0pcCivyT5Ki
         s1QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=VoygoL+RTlJO/yxbATH7FWAa6Uh3DL4QRliEQQCcmI4=;
        b=qat+bby4z7ZkRa7Olaq6ZJCX4yThcSROvdaE85PYVmkDDXvrXiqvvokOmGeROdueb7
         UjrOHOhzOkSr9nI8FsPwWV9KXvsG6D0/wy7K4m0LXqQ2ouu+FjCzlcM8J8sf4d43EZq3
         uv+WIlnn5pDevMYQLCj8zi2Zki1In9tdIhrY2Y/NX40rjyZdmgLwLQCNyWgyx9QGNC2/
         geKqAHKs5n3xyyxqeyrYMnZJO9Wz/c0Hr9ii829t4LLRlZSSv48zhIbLTKKm3g8Ocnb1
         ePEl96BeQ1b52rXrgqSuE+Cjh1rwItoNT/Qa/KOWKmJykvy/LK1aMx4pDJU/56Yzbq93
         713A==
X-Gm-Message-State: AOAM530tcvR3azWDA44XsS2Jk+azVLbA1AWPu3gmbBtFvtOHYOmhDygz
	1udk4nh5btbjdYj4aw7c8I2JQXC0+v8=
X-Google-Smtp-Source: 
 ABdhPJxtc+nX2XozU+3zLy+IfDSv3VJKF1I9ADvjdLHN4LcFyljhsRA4dy1wjqJD/XZ/hYWQ6aE3Pg==
X-Received: by 2002:a62:8c55:0:b0:49f:df22:c4ca with SMTP id
 m82-20020a628c55000000b0049fdf22c4camr11562369pfd.11.1638440346546;
        Thu, 02 Dec 2021 02:19:06 -0800 (PST)
Received: from localhost.localdomain ([103.81.94.54])
        by smtp.gmail.com with ESMTPSA id
 186sm2137258pgf.94.2021.12.02.02.19.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Dec 2021 02:19:06 -0800 (PST)
From: Ranjitsinh Rathod <ranjitsinhrathod1991@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
Subject: [meta][dunfell][PATCH 3/3] libsolv: update tag for missing CVEs
Date: Thu,  2 Dec 2021 15:48:04 +0530
Message-Id: <20211202101804.4697-3-ranjitsinhrathod1991@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211202101804.4697-1-ranjitsinhrathod1991@gmail.com>
References: <20211202101804.4697-1-ranjitsinhrathod1991@gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Dec 2021 10:19:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159081

From: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>

It seems like CVE-2021-33928, CVE-2021-33929, CVE-2021-33930 and
CVE-2021-33938 are pointing to same patch as CVE-2021-3200

So add CVE tag inside the patch file which is the remedy for
CVE-2021-33928, CVE-2021-33929, CVE-2021-33930 and CVE-2021-33938

Link:
https://ubuntu.com/security/CVE-2021-3200
https://ubuntu.com/security/CVE-2021-33928
https://ubuntu.com/security/CVE-2021-33929
https://ubuntu.com/security/CVE-2021-33930
https://ubuntu.com/security/CVE-2021-33938

Signed-off-by: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
Signed-off-by: Ranjitsinh Rathod <ranjitsinhrathod1991@gmail.com>
---
 meta/recipes-extended/libsolv/files/CVE-2021-3200.patch | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/libsolv/files/CVE-2021-3200.patch b/meta/recipes-extended/libsolv/files/CVE-2021-3200.patch
index 74164ab495..cc8f53cefd 100644
--- a/meta/recipes-extended/libsolv/files/CVE-2021-3200.patch
+++ b/meta/recipes-extended/libsolv/files/CVE-2021-3200.patch
@@ -11,9 +11,14 @@ been added.
 (Jobs may point inside the whatproviedes array, so we must not invalidate this
 area.)
 
-Upstream-Status: Backport 
-https://github.com/openSUSE/libsolv/commit/0077ef29eb46d2e1df2f230fc95a1d9748d49dec
+Upstream-Status: Backport [https://github.com/openSUSE/libsolv/commit/0077ef29eb46d2e1df2f230fc95a1d9748d49dec]
 CVE: CVE-2021-3200
+CVE: CVE-2021-33928
+CVE: CVE-2021-33929
+CVE: CVE-2021-33930
+CVE: CVE-2021-33938
+Signed-off-by: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
+
 Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
 ---
  ext/testcase.c | 21 +++++++++++++++++++++
-- 
2.17.1


