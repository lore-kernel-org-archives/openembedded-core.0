Return-Path: <uvv.mail@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B80FCFEDA07
	for <webhook@archiver.kernel.org>; Tue, 17 Mar 2026 18:41:22 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.83786.1773772879879845719
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Mar 2026 11:41:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=A2mAe178;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: uvv.mail@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-48540355459so58838295e9.3
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Mar 2026 11:41:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773772878; x=1774377678; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=m0dvV19clSMA9keqnOnKtjk3fzEZWzxGZrdoV3mXdmM=;
        b=A2mAe178+mZJbAHkcyDxE0Et26wIw/g9VMu2zebetqVl0hEV7fv0opeWCT8udltv43
         HYb2aES9XsQSti3b338Z+S/LJRn5o91jI6cSJOgQe+nSriyzjESxxrFq/DBlhOdS1TH4
         EDMfAamTa++1xru6zfEnftXH0M73OhQlOCHcYoImK7qFgWqC622ezRs7BbL6pZ1KCtbB
         sfhLfEHuvAnlJNHLzy9GchqQRpDJR9qPq/SkpGHiPbHECZ4sR+fiIhJrw98aR5spdaoq
         jqtGWGpSC6vXUlwtaIsRzz1xDW9bjFEAOHHY/Hnc1o1QwTxLJ2uM5TnNd+FYj7fOcchk
         QTwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773772878; x=1774377678;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m0dvV19clSMA9keqnOnKtjk3fzEZWzxGZrdoV3mXdmM=;
        b=EtQ095d+hZhAW9n2RrRDH5ESEYypu2C+0FDCv7aVukm8AqgPuXSWlNaal3ZAP5UrsB
         TFmUnSIDITbkUUICZEMEaMqQfUUqTWGXZlFL0GUH9WbiQUjqKhvxZqHBMGHnhs/PGqJd
         antPlY8ZBqHaNlEEq/0XiDWt67kcD3KQ4kg30rTanLvtdQmmh7eoCaLXeiUQOGlLnN8v
         Q8bqNvznl/10cFxteVwfc543C4+mrbsnQQFBjxllZ4OnWfB21UMgeXZANxJ1AjeLR3iM
         jetp9E01olCXYKiirCX3D4GhZl4TqN0VJYzjzUoQKmW3GT+952XduUHZiHKVMrkn8p+C
         T1hQ==
X-Gm-Message-State: AOJu0YyUP06PqidrAnkoyu2TM+VMLSA9L4Q6CVGGddanxzifqjv4DxsQ
	ICixqYvRhFjm80qN/f2uBq6tu7QsTXVL4csY7XzGJX9/FfEc1RWPaXOym2+W9HV1
X-Gm-Gg: ATEYQzwdKhkO5O7WxPOz7j94BEpgdXq+mgYCWIfwVFCfhr6W9y2wMdi87aPeeil+mqS
	AUzEeZkKr3Nmr2pgt6loCss/B1biqLC6H6QKFeDKmJiyyR8tSslUITub78EKKmyTq9X0xyR6TzH
	5LlbfSg2JHvnOdewfd6wHIYJ/Y+uKoQ4LSnnN71Gru4dUEluWCTETEr5srZ+4Ovu7M4ZhefxuiM
	gbnmjJgtdfzORHzKr2sfpk0PwA4xpoijsdzBRnG6Kn8pxYSP2Av4/cCtSYx2ocGrUgumJSClxP2
	Zsv8bXEDdewJ1XPdsOVDXsno1TGZ8OcHSkQA4QxYlNtICHkm8cRLYEkFZcjxd0TUdzznk6LRbl0
	Gx6yVF+OnL+lQ28lKjH8sjOOqE1DW1MRyIyVss12OEc4lFUgxwp66jHA9B8/dbKRb1F4Q9ScBOy
	J8XRkayZM/a7g8LTiOwvcPseoF
X-Received: by 2002:a05:600c:c493:b0:485:3e19:9e01 with SMTP id 5b1f17b1804b1-486f456fe60mr11424395e9.28.1773772877590;
        Tue, 17 Mar 2026 11:41:17 -0700 (PDT)
Received: from Ubuntu-2204-jammy-amd64-base.. ([2a01:4f8:272:3f67::2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4856ea9d7e1sm81778645e9.7.2026.03.17.11.41.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 11:41:16 -0700 (PDT)
From: uvv.mail@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Vyacheslav Yurkov <uvv.mail@gmail.com>,
	=?UTF-8?q?Wojciech=20Nizi=C5=84ski?= <niziak-yoctobug@spox.org>
Subject: [PATCH] overlayfs-etc: Add template file dependency
Date: Tue, 17 Mar 2026 18:40:52 +0000
Message-ID: <20260317184052.422222-1-uvv.mail@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Mar 2026 18:41:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233332

From: Vyacheslav Yurkov <uvv.mail@gmail.com>

It case a user uses own template file, its changes have to be propagated
to the image.

Fixes [YOCTO #16193]

Cc: Wojciech Niziński <niziak-yoctobug@spox.org>
Signed-off-by: Vyacheslav Yurkov <uvv.mail@gmail.com>
---
 meta/classes-recipe/overlayfs-etc.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes-recipe/overlayfs-etc.bbclass b/meta/classes-recipe/overlayfs-etc.bbclass
index d339fbbeee..6ee97fb30c 100644
--- a/meta/classes-recipe/overlayfs-etc.bbclass
+++ b/meta/classes-recipe/overlayfs-etc.bbclass
@@ -43,6 +43,8 @@ OVERLAYFS_ETC_INIT_TEMPLATE ??= "${COREBASE}/meta/files/overlayfs-etc-preinit.sh
 OVERLAYFS_ETC_EXPOSE_LOWER ??= "0"
 OVERLAYFS_ETC_CREATE_MOUNT_DIRS ??= "1"
 
+do_rootfs[file-checksums] += "${OVERLAYFS_ETC_INIT_TEMPLATE}:True"
+
 python create_overlayfs_etc_preinit() {
     overlayEtcMountPoint = d.getVar("OVERLAYFS_ETC_MOUNT_POINT")
     overlayEtcFsType = d.getVar("OVERLAYFS_ETC_FSTYPE")

