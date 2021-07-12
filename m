Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.web08.12702.1626103982175267022
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Jul 2021 08:33:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=tGR5H/pM;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.171, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f171.google.com with SMTP id v7so18646717pgl.2
        for <openembedded-core@lists.openembedded.org>; Mon, 12 Jul 2021 08:33:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=Itp/pCWYyaMCrP04GlmHQPMOTqcGd/BoVMV5zmLyTbs=;
        b=tGR5H/pMHONSlAfXyt2FFv+EKu/xPqOUaGtf2prePFMvldrR6rqxifPUcG+d5RXvvX
         JlwBE6WZ5IgNx/c91XsL//jTGcuBgEYx5EVkqfI4/WxJJdNc+4FHCpKpvdcZtSn9b4f3
         LgxUFBVIwS/wFoou7EhJyKLwn3X+sh4W+j3RhCc9X2hXx2koQ0jiaZMHgXiH/DonhOas
         Sz9SZMz90D1+F+7qfKGdpXSKXnfaTBfyD0GYz+44vOWIYeEr+VJVXTUGsNJr5YUqoE5e
         M8OMxYqfohjDWkedz+h3xz8j/es634CH60ODSK1wOzKCkRgPU+Yi1eZz1jAfmpvBJLYb
         MzQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Itp/pCWYyaMCrP04GlmHQPMOTqcGd/BoVMV5zmLyTbs=;
        b=DaukRcvKqLIC7Ss4i7BNhVYZ6Iqm9Lhmmrxs6CvgWkmIVfwGhp9acx2HggcsF1RoRq
         loM3XqonMIXxpsuvALkTs6ab12Mlo3uLDgjU0GhIiFfYXUZ5FvyILnTF1tVbjAXjomKM
         F/Xs4XHTr3ZuLZYR7VfmRVItfdbrU2UOD/+kCF7DQ+yA2xPQD8NQOXb1kQXWtf6fCsPZ
         eDZaOXRRCAXkVtYvOYXD4KBFk8uUdWBlzYPF3QLhWvefn2WFrhzbIWonZj9I5ao2WybS
         OhNwYGFoHB6Qdnh0a0KFLM3vIMfm/lLvII/sYnZ7xM1czEQjAle4uho3Jak0z/qDddns
         c+OA==
X-Gm-Message-State: AOAM532sH99nC7nK8Hj5KCb6L0mombpBOqU6a7bC37YxEwJZzwQar2WY
	utcNC8/Ea0ITxzgvIq7jvyI0/jX5jn7vPfCV
X-Google-Smtp-Source: ABdhPJyulx/GM0ymFzUvE5BAjMEnEH/T1ssZvhEOcop3ORqYnpuovAaN1hWx9rj1w1PLQ/905CWNIg==
X-Received: by 2002:a05:6a00:21c7:b029:2ec:2bfa:d0d1 with SMTP id t7-20020a056a0021c7b02902ec2bfad0d1mr53769145pfj.14.1626103981285;
        Mon, 12 Jul 2021 08:33:01 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id n3sm16765942pfn.216.2021.07.12.08.33.00
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jul 2021 08:33:00 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 12/12] report-error: Drop pointless inherit
Date: Mon, 12 Jul 2021 05:32:05 -1000
Message-Id: <cfd74f2bae51413d9c327e0f08ecf751325c2d74.1626103708.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1626103708.git.steve@sakoman.com>
References: <cover.1626103708.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Richard Purdie <richard.purdie@linuxfoundation.org>

The base class is always inherited, drop the unneeded inherit.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 837d62c066589e5a12a0bf894ae7b24e8b048665)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/report-error.bbclass | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/classes/report-error.bbclass b/meta/classes/report-error.bbclass
index 9cb6b0bd31..de48e4ff0f 100644
--- a/meta/classes/report-error.bbclass
+++ b/meta/classes/report-error.bbclass
@@ -6,8 +6,6 @@
 #
 # Licensed under the MIT license, see COPYING.MIT for details
 
-inherit base
-
 ERR_REPORT_DIR ?= "${LOG_DIR}/error-report"
 
 def errorreport_getdata(e):
-- 
2.25.1

