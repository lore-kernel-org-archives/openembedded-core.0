Return-Path: <danismostlikely@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98301CAC5AC
	for <webhook@archiver.kernel.org>; Tue, 23 Sep 2025 19:02:12 +0000 (UTC)
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
 by mx.groups.io with SMTP id smtpd.web11.5817.1758654127643503525
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Sep 2025 12:02:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lJzj7qRl;
 spf=pass (domain: gmail.com, ip: 209.85.219.177, mailfrom: danismostlikely@gmail.com)
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-e94d678e116so6578544276.2
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Sep 2025 12:02:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758654126; x=1759258926; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=agBhrQAOXYze5xX1z9shrJX68J79e8AUBajLTRCK3EU=;
        b=lJzj7qRlZxXGOrvCbJ6urh+wRrfyNXWaOwAoKmu9ClTXihtweqYbjvGmA+Z2Hii/Hw
         qFNPQMiwqmyeiv1TzPmX6v6IwLYQ0/1oP0htc3VkuFfstzjl+RbP1IZ3y016ucNsu4EA
         Ne8Fr00vD3tyOiahG4jfMUsZWnNNbfhJmlanGqGw17QV4Azc/WEB7yPyCVFNiCJ+7Q2i
         umIn7Acx+bWQHkMXLSApbeupzUPUcIgbxByRv0m1C2EZQyGyGZFusL0elTxDogmFNH2B
         tOE66Sdghv8mFKOs0mQLZZXYTy7K7eh+qjI/7JDmAWt2n8EL/f5vxgHJqEilvTKFNUOe
         0uIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758654126; x=1759258926;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=agBhrQAOXYze5xX1z9shrJX68J79e8AUBajLTRCK3EU=;
        b=VcqbUsWg9bvGPWDBC8ds9Wl5I5ijT5sq2RJWDoIfNVMD9/EphgWNumOtCs8A8HLlxL
         EKz7jLj5tiZg52Foq2Xblm8vjYqlmt2UIldfmze1z711u5U7fYvu0ufC/VNHK9HtKmWm
         zooaJGaMoGr9mqHcBiV6Pt5tRzyTf5ls+e/MJnYEwBkObIOqT7I61IxTfscSkUG77D9e
         tKRjIFIyz1JJ4qqu1S/1mIyuJ4JQuo/xhMGgO8SCYfpU5wXn9AHrg7rVc4ME9GjoV5uv
         PmGZkzk5n3sx1k4mgpyC1qqAOrYbYyh4j4wMBVTda1APqkxvDqrwI6CUX6My7tLRA0gC
         2Fwg==
X-Gm-Message-State: AOJu0Yz2t+JwGEfOYaTc/WToF6mEiPIqEtkSUpi/aYjxzQG8uB9vrZxy
	AWwSfh0M/xr5zKAoqf4Yk075yKE/sd0MWdlD+sXptFBK2kWEA1gExHhgZOYgVw==
X-Gm-Gg: ASbGncszAG2vHGX55kTqcQzNw+o0u354WAh7FJ4Vz4xpAffrub62fVFuT6gY14q7cPR
	J3GCqekoMZYpJ6wLkrstlKF+1vVRyhPkCubyj9py3Wpnlvn6ODda39UoL0/2C9gAW28cnNYH4PZ
	Zx2Y9nZsEK+Z1syR1eoDONfKc5zLBA2MVlOY+KCRoyxsSAZsq8bdchpgRSJtWusQUncCrhgMGue
	ITBLHXYyJWRqKmlXfJUd8MrewfZnuFKdpXNk8OEJdYILlERpM8oCwEiz8lOOCtncBUsjVu3MQcL
	mSDWt+SgFYvCIn/NwE1cKqqLYZIlI3AWxLZwaVNsflmo+94iuk+nYbxTLNL3sau+2tZc4aBfj9E
	Ctbn1vhvXMIYb7119nwa6mAjsX/VfbHZdf3ji2oSlj0Lqakw+qTAVuQ==
X-Google-Smtp-Source: AGHT+IFnONi10QmBLFxiTzCNkwFbfk7pFOES4AAZHsPUyLY/6tqSqpt7l57Tkd4GHeszu4gg6emciQ==
X-Received: by 2002:a05:6902:f81:b0:e9d:6a31:d514 with SMTP id 3f1490d57ef6-eb330676eccmr3319133276.44.1758654126440;
        Tue, 23 Sep 2025 12:02:06 -0700 (PDT)
Received: from nebuchadnezzar.home.dankm.pro ([204.83.204.143])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-eb370f95ec3sm75313276.2.2025.09.23.12.02.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Sep 2025 12:02:06 -0700 (PDT)
From: Dan McGregor <danismostlikely@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Daniel McGregor <daniel.mcgregor@vecima.com>
Subject: [PATCH] systemd: use if..then in prerm scriptlet
Date: Tue, 23 Sep 2025 13:01:46 -0600
Message-ID: <20250923190146.1788359-1-danismostlikely@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Sep 2025 19:02:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223912

From: Daniel McGregor <daniel.mcgregor@vecima.com>

Using the [ test ] && foo construct in the prerm scriptlet causes
the prerm scriptlet to fail if the final test condition fails, which
with rpm prevents the removal of the package. Switch to using
if;then;fi instead, since it doesn't cause the scriptlet to fail.

Signed-off-by: Daniel McGregor <daniel.mcgregor@vecima.com>
---
 meta/classes-recipe/systemd.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes-recipe/systemd.bbclass b/meta/classes-recipe/systemd.bbclass
index 4e687135f13..5a0550b287b 100644
--- a/meta/classes-recipe/systemd.bbclass
+++ b/meta/classes-recipe/systemd.bbclass
@@ -74,8 +74,9 @@ if type systemctl >/dev/null 2>/dev/null; then
 		fi
 
 		# same as above, --global flag is not supported for stop so do disable only
-		[ -n "${@systemd_filter_services("${SYSTEMD_SERVICE_ESCAPED}", True, d)}" ] && \
+		if [ -n "${@systemd_filter_services("${SYSTEMD_SERVICE_ESCAPED}", True, d)}" ]; then
 			systemctl --global disable ${@systemd_filter_services("${SYSTEMD_SERVICE_ESCAPED}", True, d)}
+		fi
 	fi
 fi
 }

