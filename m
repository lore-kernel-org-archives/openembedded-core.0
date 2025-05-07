Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91032C3ABC0
	for <webhook@archiver.kernel.org>; Wed,  7 May 2025 19:26:45 +0000 (UTC)
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
 by mx.groups.io with SMTP id smtpd.web10.4643.1746646001755453359
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 May 2025 12:26:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=aVu5OQm9;
 spf=pass (domain: gmail.com, ip: 209.85.160.179, mailfrom: twoerner@gmail.com)
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-476b89782c3so1777251cf.1
        for <openembedded-core@lists.openembedded.org>; Wed, 07 May 2025 12:26:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746646000; x=1747250800; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=DVK8EBwWBTQ0cQHyy2wq4ZJ28IbzjiebP9cLz6Iwbfc=;
        b=aVu5OQm9iWZG6MpjBQpU3cfCtL1V/9H3bA+1+BrmvStaT/lu8crjkJDzMPhlpJHkvr
         LdF06AvhnK3w6PkcxKgjOtuJCb/s33bKsYEGDD9oNAEtceLNNgpgnNFXUgDbMDpr4SGq
         s67Fa4pMWvHubQs0NQ03mUFjIKV3iC6qvUjwzyywv+pMLkxkZFCii1c75yUwvhTe1pps
         nxP/wydDNV20v2qlfrMkkIZbGQxYLaB6ArS4609RqXERBka+USy3g5AtKkHWS/SEHLaO
         kRDlszZG38qkSsmEOUcgZFdenboHW/B2VKewOXmMpW+Sx/ZeaHjj1wQbPjXWFbBvk6hQ
         ib+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746646000; x=1747250800;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DVK8EBwWBTQ0cQHyy2wq4ZJ28IbzjiebP9cLz6Iwbfc=;
        b=WlMt+AQwFksgfHuL+oAlJqjrtBFOTtiFjqJfKIg7dhUQzGYBwuusMsWecUyzqhOgD8
         L7C3Bt5Vy2LTC3AVxwUK6IYAgqR8J5+qmLGE0Yx/rdZLpruEf6DLvAfLtvCHwHKXy+FV
         rOFPd9t3vj3GRnJUqDKRsbQH9fK4d4WA6DNIyJeqUHSYQHkxeqPQnHvSKmnhruTWg2M0
         MWosQzZ+CIgp7HAepoPiLQQEYav6uuhWOFjzOFHQiKWwIfGEQQUglW9k3vfTZltnHB/R
         wfzdMVknXF8H14aMQ1OhxrePkQSGujf37vy+dbnF9xVG6QEmkoz87TknEVy9v8cbM4RX
         FCYQ==
X-Gm-Message-State: AOJu0YzzneG130GX8oVh8LyiWYingafk8mkjwZd0ji6EUCVz9VjQzqmz
	5fxq4M1GLfYkQmtUaUUhWPVfAR5E6ECrohLIu7JVOt+YN5j5TCqE18fjhA==
X-Gm-Gg: ASbGncsTweHy9rFEXScpr/5yX1G9GR04qWcq/NS+U6yuNcjaBtDdCnXoD7o7XqCrZSY
	vlcXJyx7elBb4CKzWBf9LsHIzuL0eIwGXd/BPu4aTN4ckWTm5ZDQWOHSl2QdwVmgv5RxjEQ0uUn
	gFY+jxvjzps7Js3A8n1luQ+PDx+WwhUH9pKeLl72qHtntHu6RR3m1WMofZHiP8iinl9gh/u2oVj
	IiHMZLL+T+f9aVFcAhKXHAtmcx0o5zbiFvyMU2ZaBysuujZgbLEwWp3g3mCnGkRBV5gGeCt7Mrf
	zoubfezpHtOSlEN6uoputhhcYoFPeii1fTGWYZQmMvHEUFOG9Eyhv3VGcZHJUWN+5Kvw3IAU9lw
	d/HJGK/ez
X-Google-Smtp-Source: AGHT+IHXCeng0YNIE44+5qVC+WClXSG1eM8VDEPfaiH4HPB/1MO5xfFNt7KL1APT/wXBCZ8bB/xZmg==
X-Received: by 2002:a05:622a:1451:b0:48d:e7ad:f17b with SMTP id d75a77b69052e-492278660e7mr62541531cf.37.1746645999569;
        Wed, 07 May 2025 12:26:39 -0700 (PDT)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-49222e9582fsm18332281cf.62.2025.05.07.12.26.38
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 12:26:38 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] systemd: disable linker GCS warning on aarch64
Date: Wed,  7 May 2025 15:26:34 -0400
Message-ID: <20250507192634.19940-1-twoerner@gmail.com>
X-Mailer: git-send-email 2.44.0.501.g19981daefd7c
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 May 2025 19:26:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216132

openssl has some assembler code that has PAC and BTI hints but not GCS. The
systemd recipe then links to libcrypto from openssl with GCS enabled (as
that is a distro-wide setting) and it - correctly - warns that it is being
told to use GCS but one of the inputs does not have GCS. This would not
be a problem but systemd also links with —fatal-warnings, so the build
explodes.

	libcrypto.so: warning: GCS is required by -z gcs, but this shared library lacks the necessary property note. The dynamic loader might not enable GCS or refuse to load the program unless all the shared library dependencies have the GCS marking.
	| collect2: error: ld returned 1 exit status

Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 meta/recipes-core/systemd/systemd_257.5.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/systemd/systemd_257.5.bb b/meta/recipes-core/systemd/systemd_257.5.bb
index acf97517a94a..995b55580e4a 100644
--- a/meta/recipes-core/systemd/systemd_257.5.bb
+++ b/meta/recipes-core/systemd/systemd_257.5.bb
@@ -240,6 +240,7 @@ RESOLV_CONF ??= ""
 # bpf-framework: pass the recipe-sysroot to the compiler used to build
 # the eBPFs, so that it can find needed system includes in there.
 CFLAGS:append = " --sysroot=${STAGING_DIR_TARGET}"
+LDFLAGS:append:aarch64 = " ${@bb.utils.contains('PACKAGECONFIG', 'openssl', '-Wl,-z,gcs-report-dynamic=none', '', d)}"
 
 EXTRA_OEMESON += "-Dnobody-user=nobody \
                   -Dnobody-group=nogroup \
-- 
2.44.0.501.g19981daefd7c


