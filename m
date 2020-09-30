Received: from mail-pj1-f67.google.com (mail-pj1-f67.google.com [209.85.216.67])
 by mx.groups.io with SMTP id smtpd.web10.6581.1601504109682827492
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Sep 2020 15:15:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=zuWYnzFF;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.67, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f67.google.com with SMTP id q4so684548pjh.5
        for <openembedded-core@lists.openembedded.org>; Wed, 30 Sep 2020 15:15:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=7xY577miVfD8W9bVvZ+K1oWF5eUFxd+OXDwPPjEs1x4=;
        b=zuWYnzFFW+KrqMfWN5txBe/QoVuK3jtpHS0gZCzrGf0t4UFfUCITU8a2ZTaFK400+J
         8p18GNwtl5V51xSQJPWZjGO/HCA7rWtUn3LO91fjbKjhHGbFCYJUTgVc8plbEXXfedtp
         v6qeIOAHgnvdtCe2SV/dwuv5a+tWiLhdY9BmIG9yJxnMgzF4Yk1phagXVBD4PExyg7AX
         dQi142kbuDAVP7oP3v7XHAdu7zdL6oxrDcUsa2zA9BM7p5NBAMMylswYj1ypfhEOLaNa
         odUe1Y8kaVmPLD+Q8UFmz6OFeJi5L9+fCJpVY6ZdmzIPvedg2tJ+h2IjH9p+qM+AAika
         VOMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=7xY577miVfD8W9bVvZ+K1oWF5eUFxd+OXDwPPjEs1x4=;
        b=gvlN5Q3hy5R4+9yeHlk+3X+xyUwXJl3brzbjmjIlj/eNtHKIh0Y6muxbIkPuhQ9cDE
         fISqFKdIKwZ6n41PxDbKXQztnMTEbFasRoI8d63iOUnXkdKfJfeFEQRB+3rlN8rToqFS
         gxMBM54pmNzU9f491ZtyXkkSs9L1TF9s7144hwsbP40S9XkXghfDE2hR6T73+Coj79NH
         +vla+VilOyKCP+V+WRelljKnHdIc+2qVmxnYiexJuLWToiDruA1w9IVY5xc6siwOIQ7l
         Lyo5EB/6qOpZOm+uS/mRtykuNz8uQxVp0c/PzOudfH66jMaDMrrMnoUzH+C5MliLdzHd
         SEpw==
X-Gm-Message-State: AOAM53395n1cwhyucZTxBlwML3QI/ePlhGtQYR9TRF7erz4XnH0RAWfC
	A4zu98ouFjfVMc/Bf2WbU305iqg9VkVBpcG3JP8=
X-Google-Smtp-Source: ABdhPJxUM29XF/J7Q7K3kiNDRap5WXt1pejHUiKueLY60oIgB6aW9jXPem4J3abtRNGCPdGxADcuTA==
X-Received: by 2002:a17:90a:5292:: with SMTP id w18mr4463601pjh.72.1601504108793;
        Wed, 30 Sep 2020 15:15:08 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id k6sm3488799pfh.92.2020.09.30.15.15.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2020 15:15:08 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 26/41] oeqa/selftest/containerimage: Update to match assumptions in configuration
Date: Wed, 30 Sep 2020 12:11:28 -1000
Message-Id: <7dc649ba9abef2f9f2f863f568f8f808adbbff38.1601502610.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1601502610.git.steve@sakoman.com>
References: <cover.1601502610.git.steve@sakoman.com>

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Assumptions in the test mean it doesn't work with ssh-pregen-hostkeys.
It also doesn't work with systemd. Update the configuration to make
sure neither of these effect the test.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit e2f277657f1db6a0f805ac07d318a3850535d695)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/selftest/cases/containerimage.py | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/containerimage.py b/meta/lib/oeqa/selftest/cases/containerimage.py
index c0998e319e..4ad7f0e654 100644
--- a/meta/lib/oeqa/selftest/cases/containerimage.py
+++ b/meta/lib/oeqa/selftest/cases/containerimage.py
@@ -42,6 +42,9 @@ IMAGE_FSTYPES = "container"
 PACKAGE_CLASSES = "package_ipk"
 IMAGE_FEATURES = ""
 IMAGE_BUILDINFO_FILE = ""
+INIT_MANAGER = "sysvinit"
+IMAGE_INSTALL_remove = "ssh-pregen-hostkeys"
+
 """)
 
         bbvars = get_bb_vars(['bindir', 'sysconfdir', 'localstatedir',
-- 
2.17.1

