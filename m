Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DD1ECD8CA8
	for <webhook@archiver.kernel.org>; Sat, 13 Jun 2026 10:53:02 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.88938.1781347981710175212
 for <openembedded-core@lists.openembedded.org>;
 Sat, 13 Jun 2026 03:53:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=KaFHreXL;
 spf=pass (domain: gmail.com, ip: 209.85.210.178, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-8423f420455so914529b3a.3
        for <openembedded-core@lists.openembedded.org>; Sat, 13 Jun 2026 03:53:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781347981; x=1781952781; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=T6SUeIUz9SNYnzuJpPtqDx2i0CvDFbRTpAKxgoumgEc=;
        b=KaFHreXLRJvREqnk1ox6rhcyTR/8aloRIggUYxOz8oMplNRRfO5HJXDtwc3giYNzbR
         XYoj63AD3/H3XupWg52nQiIrjA872euqdErkXsVg22tXvovE+9bRouTfbBzOh3CAQ+mZ
         bjlqV4vSRKN502i/uWdYaeHFOL6HjWDCgxCkIDNHYs4OgJhHBMNHXFlczidz4mgrIIu6
         Ew9aivDzxH7VH/9LhSeHHw5+h/Cg6E4THwKzBWFg7nrFN+WELKOjRZFbkPC0nID8QjFO
         kz4TSuE1HZCCLNvaeoLCDYGaq/8z5+DRKWI8fbzFV79YTdGMRetW/BJKCYGV1QCpBamT
         UycQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781347981; x=1781952781;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T6SUeIUz9SNYnzuJpPtqDx2i0CvDFbRTpAKxgoumgEc=;
        b=gS7oB9EoMGvQ1liCEwFO8c1630//j8GyxgCXwp7WWzKZ3rXv0k0f2dmVLsdK7FgD1K
         16hGGU/movkclJEeYnIDdeAjtlb8vIgIVW7uQZgveASDUjJpd1u9Vl149VYpzR7RanaS
         94URD2Bz2P2SCDHzsXynHtBD0TVLzkfFSkoJ+Gy5qKLmqu9anjrcSe04rP0LjHZJPa+G
         UnSDYgUrvAv4NTOMKYolW94b0V1nIdAVNJc2G4AgD4YozE8mek8EYVe8EkqF7MXbGGzk
         BIPbFpCZaCyVyZnjAuS0kx2U97AmFY84DoQbVsk9v1IrXLJZGmZonCJ8u/ggTnNpnETR
         qcIg==
X-Gm-Message-State: AOJu0YzBORso68zmJHk3K8ITQ1Wca+niMK3T19lACUHV+1LJr0OAdDek
	47fdlWaXcs3okRqNhZBIawX0cNXwHOh22sVX7KxuyAW4mzofsTCX5M59XOZNGAOR
X-Gm-Gg: Acq92OFg5SkBWHJW0GcATW9lK2EgBX5a80SRqFLfPGcKMR6tMyoh49e+V9/RM8GAZEh
	wog5Bu7fol8Pz7mD4F5QyN9zURuaZSnuJK5H34HtietorLvb0ytZbIuzTcvh6v1p0kpPFCMaXp0
	FUTJzV2arixbBpxpdvyxrd9w7vuMa+SOgqzLKmKwH9P5FynAa1mQvrgC7ERBnqFvwUzKxbHNrE9
	fwiRCcb+42QeictXGPvTRbZtjgHiyYw5kUil2MR5t1xyjI0BSGq28VPVE/VlwhEATL7eXANogsL
	qU+SKKkNgBDf4IimLjYXfT0uN6F/2SBIBq5Dh2VFuUqHSY3Tkav+wah2ZmqE1UtvC0EswnVP0wP
	lAX7aRtSL9na6EDTBFRNmEZnOzaFYICI4UVEHaVKQB7svSYWbgj7cF0vhODyR7f1/Uh9kGhOxOv
	BBmyL+XTOh/Vq9C4zjTURsZr3LZZaRJRTrfimq
X-Received: by 2002:a05:6a00:3498:b0:842:3ea1:5dd1 with SMTP id d2e1a72fcca58-844e19663fdmr3150782b3a.14.1781347981003;
        Sat, 13 Jun 2026 03:53:01 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.105.153])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434afd50e6sm4689778b3a.30.2026.06.13.03.52.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jun 2026 03:53:00 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta][wrynose][PATCH 1/2] wireless-regdb: upgrade 2026.03.18 -> 2026.05.30
Date: Sat, 13 Jun 2026 22:52:48 +1200
Message-ID: <20260613105250.3902916-1-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 13 Jun 2026 10:53:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238676

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 ...ireless-regdb_2026.03.18.bb => wireless-regdb_2026.05.30.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-kernel/wireless-regdb/{wireless-regdb_2026.03.18.bb => wireless-regdb_2026.05.30.bb} (94%)

diff --git a/meta/recipes-kernel/wireless-regdb/wireless-regdb_2026.03.18.bb b/meta/recipes-kernel/wireless-regdb/wireless-regdb_2026.05.30.bb
similarity index 94%
rename from meta/recipes-kernel/wireless-regdb/wireless-regdb_2026.03.18.bb
rename to meta/recipes-kernel/wireless-regdb/wireless-regdb_2026.05.30.bb
index a70e9dd0da..e544b72965 100644
--- a/meta/recipes-kernel/wireless-regdb/wireless-regdb_2026.03.18.bb
+++ b/meta/recipes-kernel/wireless-regdb/wireless-regdb_2026.05.30.bb
@@ -5,7 +5,7 @@ LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=07c4f6dea3845b02a18dc00c8c87699c"
 
 SRC_URI = "https://www.kernel.org/pub/software/network/${BPN}/${BP}.tar.xz"
-SRC_URI[sha256sum] = "5fc0000475d8c5368ccc5222827c16aef98b1eb6a69c9b5a3e7b7e98528945ac"
+SRC_URI[sha256sum] = "8a27bfc081bafed8c24dd70fab0d96f098e5a0bfcd08d3da672595f225ab8993"
 
 inherit bin_package allarch
 

