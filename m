Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
 by mx.groups.io with SMTP id smtpd.web12.10466.1628177700200238539
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Aug 2021 08:35:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=PULZp53e;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.44, mailfrom: steve@sakoman.com)
Received: by mail-ot1-f44.google.com with SMTP id c2-20020a0568303482b029048bcf4c6bd9so5535570otu.8
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Aug 2021 08:35:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=QT0EdX59G7oSrFZa4jwqYYf1k5SMQGJ6NyZcyZzopJ0=;
        b=PULZp53eyYyYKWdNY+P1ZYtTLOyAS5F1wV43gnsP5z0Ixz1xo5GaZI+U31V+WBbT5k
         grp/yfPDDSYYIQ9FPArrX60Hpw0OAUbCvn78LKrQ7UCcASIKfK5XG8XWtqh0JuyScMP7
         j5im1zKJa8yGsHtd6SyVLMLqvPgqSrSYYsLDvMwo0gxbvZAOOBRwTVPJLrNW8S98Y/q3
         BShONeKSG8V2rsE/xyMJYI7yYUlgH3YHB2XKi8k691cYaqim6QacfoGgOlOsjJ664HIz
         I1ul10Qh5Ci1qC2IkzPfOnglQZ8OGUI5CFAxbJzaZw6bQALQg/hdKRRmhg3fKr4SshDp
         4obg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QT0EdX59G7oSrFZa4jwqYYf1k5SMQGJ6NyZcyZzopJ0=;
        b=mtMkHBG5tnYgcb5kMK2v5zG7/jKCXuNJXdfN79VSyf1LR01rX8HNJzjBNNJESJixpc
         3riqx78odTz6yhq6zToghrG6ccZ/L8Ba6UDyVK91bGETv2UChmenD2sk1v614g09v6JS
         aDKi88ulcYaWqiloy33P9jD2eAwf8C7w3BVe2tZ5HUA63a2T1nsFanrdz1d6TRpPVxOC
         zTue9NsdBXLyClAibb0WsPvfPdptxuNc4rxSWkLO8/8RLTCWF+AVyYmpfROfAbTq3y7O
         nyo2fpxSakJ1f6Zm2i9MwE+9Mz4WnLx83TBvZ41FZ+iEZwUKeOirzSFsS+DSe4fitUBD
         5nJQ==
X-Gm-Message-State: AOAM5315cYWzSzVfCVZV+4+9kNZge+ckx2uE3RAaWG+A2I+uc1SKoae+
	gBtWjMYtpM9GeP/iELDvgRnVvqgQE+1S5Nl6
X-Google-Smtp-Source: ABdhPJykum7OAvZ2ZJEEhzK3YkqR0w4pat7t1o1N8443uXtkOqxKPScza1rNUOE+uulSHKOVFUYHCw==
X-Received: by 2002:a05:6830:1386:: with SMTP id d6mr4142318otq.73.1628177699001;
        Thu, 05 Aug 2021 08:34:59 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com ([172.243.4.16])
        by smtp.gmail.com with ESMTPSA id bf41sm1103076oib.41.2021.08.05.08.34.56
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Aug 2021 08:34:58 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 01/33] Revert "gstreamer-plugins-good: ignore CVE-2021-3497/8 since they are fixed"
Date: Thu,  5 Aug 2021 05:33:38 -1000
Message-Id: <8e3d1f6db8b3595f19a4b93d5872537471fe4e43.1628176985.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1628176985.git.steve@sakoman.com>
References: <cover.1628176985.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Change is correct but should be in gstreamer recipe not gstreamer-plugins-good

This reverts commit d853e2bde1ea083f8438e8d7a80f041196d2e38d.
---
 .../gstreamer/gstreamer1.0-plugins-good_1.16.3.bb            | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.16.3.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.16.3.bb
index e8830103ce..1038cbf224 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.16.3.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.16.3.bb
@@ -15,11 +15,6 @@ SRC_URI = " \
 SRC_URI[md5sum] = "c79b6c2f8eaadb2bb66615b694db399e"
 SRC_URI[sha256sum] = "d3a23a3fe73de673f591b7655494990c9e8a0e22a3c70d6f1dbf50198b29f85f"
 
-# CPE entries for gst-plugins-good are listed as gstreamer issues
-# so we need to ignore the false hit
-CVE_CHECK_WHITELIST += "CVE-2021-3497"
-CVE_CHECK_WHITELIST += "CVE-2021-3498"
-
 S = "${WORKDIR}/gst-plugins-good-${PV}"
 
 LICENSE = "GPLv2+ & LGPLv2.1+"
-- 
2.25.1

