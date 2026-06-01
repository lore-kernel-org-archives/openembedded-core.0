Return-Path: <sivakumar.bs@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C92BCD6E56
	for <webhook@archiver.kernel.org>; Mon,  1 Jun 2026 11:23:45 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.26149.1780313016976454398
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jun 2026 04:23:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=YI7uWLdy;
 spf=pass (domain: gmail.com, ip: 209.85.214.175, mailfrom: sivakumar.bs@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2c0c32f6ce1so7353335ad.2
        for <openembedded-core@lists.openembedded.org>; Mon, 01 Jun 2026 04:23:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780313016; x=1780917816; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lZa9iFN2eMYASipuShrecvJZM9lZoyFS9LB6kjcsHI0=;
        b=YI7uWLdynGJm1msFT6muzUezrxKHBYr0ebriDfQ26Yfu4kzJhqds9ZrXTA9AnsJ91X
         TtrxY1DP9dhZhCaLWtVitrG9HlSxwMojBWxrVMwmjy17IDzofvu7zugIPeN3xtKo5ouq
         /45gl1+VuVtsei7GKgVlvP9o3JCqT6xwjMWll4EmF6//QPIjwQJ6tDBvE+ocG0G6pY6m
         98V46wqSSYJi2BJvYpMgyN7sp5/DDZEZMnEcBO0W08b7VbJRpEzrthakWOw0yryuKQ8O
         RimMQ+5KbM/9efMvAbHHr8ITToRE7XkqkhoilXvmIqCbNxq1of9UItKVAJ9hF1DZLvQ7
         v+8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780313016; x=1780917816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lZa9iFN2eMYASipuShrecvJZM9lZoyFS9LB6kjcsHI0=;
        b=U+U7ZffLhf9RscWgz7g/ctkNQaKSm6T/5O+QH6BgNb9vCqfCPEeLt/D1+sxrHiBZpr
         zgiIk3gT/SXQu8o9g0/50Ph4cy+vJK7FOLioKQyz8TAOt7jGbp8dX2j7X08gQ/Em9hEw
         EzAvMbolRfWFJM+bqAoSjdMKE4rNDbg4KMG+dOR3mkU66IQBIzI7xgVS9mWYbbzYuXpn
         RHquDo9S5DzYEkPFZkK7uwnHB8ESl5hP3OiT2q6wLDXJeIsM45Gso+xFr3Mo7H7oqR/y
         QbTgiNFpiZakRi/pns+QvSQtlPWGeJeOvS3tFWcEhoWzeVs1x7W3s3LmNQZWBl8k96Hc
         nOlw==
X-Gm-Message-State: AOJu0Ywr2xU7HkC1tbc4sjeqPK+jjx9tA2lTzN+AkAKrCk8OkuWUWnnw
	DTW2uO49ODpNc9N0/n4cu4yxEkhOo3u/y3u/QNNmNS6VaImdGhSY2nMzETI6xQ==
X-Gm-Gg: Acq92OFGDPRmOTW+Ggg/cfVmMVJQd1k9O5w91BErPeRN9gpbF18s7Pyx1kO1HNmX7e0
	zMMUn6CGvjbdbdtazKk8zsPndvTitp1Eq27/+91d2dJpzQAt4kN2YdIcmxYZH53dy6dMxzbUy0Y
	6qY5KbfnmzsA/FPYFllh7+pHNn9FORYGfvO51Pw9BjT/IXipL/BEr7ABBVfhBuYhMAk8efLWT5L
	9fO0u6R7vpZi0QReRh7LDbNArPKfJ1+pqPQM9eD3zIb498zu5yvfOSEaMbYvS89g2x+DiDCzYgB
	x1JtggQWAjPLr1BbvZfipwD0RRf3W6YEu6n8xtfhs3RAawy+ocag9qtPpHF30CzsS22PYxfKelJ
	lva3juEQky506gC/PaK5iOX5P8rxuHp4i12lCf4nnAsyZh6egHGK4whhwFn60kY8GOdxAWsesrj
	fiF/JbrMwsD8Cz9Zb4BR+i/9iU0SN3AYHcq4hkAQJwByN8XjDVk3ZnswGl5aJm4eIRPGLY4dmPQ
	BPEsg==
X-Received: by 2002:a17:902:ebd1:b0:2c0:b081:84b1 with SMTP id d9443c01a7336-2c0b08186fbmr100462675ad.10.1780313016230;
        Mon, 01 Jun 2026 04:23:36 -0700 (PDT)
Received: from naduvan.timesys.com ([223.184.95.99])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf23c43f0asm147371285ad.77.2026.06.01.04.23.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 04:23:35 -0700 (PDT)
From: Siva Balasubramanian <sivakumar.bs@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Siva Balasubramanian <sivakumar.bs@gmail.com>
Subject: [PATCH] qemuboot.bbclass: regenerate .qemuboot.conf after do_image
Date: Mon,  1 Jun 2026 16:53:29 +0530
Message-Id: <20260601112329.142238-1-sivakumar.bs@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Jun 2026 11:23:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237829

do_write_qemuboot_conf was chained after do_rootfs, so it only ran
when the rootfs was rebuilt. If only the kernel was rebuilt (or any
change that regenerates the image without invalidating the rootfs
sstate), the .qemuboot.conf was left stale while new image artifacts
were deployed with a new timestamp suffix. This caused runqemu to
reference mismatched or missing artifacts.

Move the task to run after do_image instead, so the conf file is
always consistent with whatever was last deployed.

Fixes: https://bugzilla.yoctoproject.org/show_bug.cgi?id=14520
Signed-off-by: Siva Balasubramanian <sivakumar.bs@gmail.com>
---
 meta/classes-recipe/qemuboot.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/qemuboot.bbclass b/meta/classes-recipe/qemuboot.bbclass
index 56106b1958..47ce16935f 100644
--- a/meta/classes-recipe/qemuboot.bbclass
+++ b/meta/classes-recipe/qemuboot.bbclass
@@ -127,7 +127,7 @@ QB_DRIVE_TYPE ?= "/dev/sd"
 inherit image-artifact-names
 
 # Create qemuboot.conf
-addtask do_write_qemuboot_conf after do_rootfs before do_image
+addtask do_write_qemuboot_conf after do_image before do_build
 
 def qemuboot_vars(d):
     build_vars = ['MACHINE', 'TUNE_ARCH', 'DEPLOY_DIR_IMAGE',
-- 
2.34.1


