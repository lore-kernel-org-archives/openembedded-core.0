Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web10.9677.1629636684388724270
 for <openembedded-core@lists.openembedded.org>;
 Sun, 22 Aug 2021 05:51:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ijMoRfX1;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id j12-20020a05600c1c0c00b002e6d80c902dso8938012wms.4
        for <openembedded-core@lists.openembedded.org>; Sun, 22 Aug 2021 05:51:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=I+PDy1qeuH1/YxM3t0dopvUQP+iYLULPChcsZXF/g+I=;
        b=ijMoRfX1eaB++pcgy6vmd8kjM1tH8kCDotUSd9S9U6mOe9FvtXX/vOwm4rLWGIzosw
         zHs1N/DKmPpek4zhzAUuec8XhT3GK7+CCQlDKFi7XsNWZKYD8zMByB2CWD9OANA9UuEi
         lCnKTzXreyW+tq5UQcB2PQ24+T3kuJO/76cAnA7rvgb3CdeCMyjqdv2RxD690fIfzefB
         z56S9i8mQ4sEjKaZJSwXepRxOWysQGQVUlDOYmtcRIwuCqXDyeVUIZDSgklkptaw8YEr
         LRPXp3R1lWEUrHIYYOopY6MA4hCTCNiUA8GFGD2OGgIo+HazVLRXM9EIh5Wv4bUPAdmk
         kPEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=I+PDy1qeuH1/YxM3t0dopvUQP+iYLULPChcsZXF/g+I=;
        b=cbYmNS+mIN6tTQ1dusNA65N+xt7LvNIZgWtZ8tN49FY5vzyTFyqeI55b/9LatfQY3U
         cAqLDlah4B9e66wXggDXFWmzcqjaUoMVl3+2zShdp45ujkj6qO+8gTlSfpHhWei0SjPK
         gXvVCMpKEGeaf2bJV4JbsrGt+g1HBmVfAcwbhANf4P5ZOnZP+oxtg40de1rNMKvLJRCe
         Bk6hmBgI8ulYN/0uqa/rSQcv/zOsRSQkTZM8KCZJ3R8MNg6CUPQ6CRpkJv7TaTlT+Jma
         YnmMtTyQg7vuvp8ooPNeVns3klKWcS8XV9fXJQPHgKT9ZRCs8pTKPzbpfVwgB66dnIPv
         l8rg==
X-Gm-Message-State: AOAM533k3067hMHxbpXKw10me2ru8YaiG43wLaS8dLZMMnIH6YBkajf+
	XDinNSev0ykEi+l2tAG8x8twOmcPihMBqQ==
X-Google-Smtp-Source: ABdhPJzOxo2tVex6dXGoZvBi+d8ACJx9zF71HahzsQypkA6fy5A1byT5WZ7sQfhHX79zQQr2bUy8dQ==
X-Received: by 2002:a05:600c:4f4d:: with SMTP id m13mr12148700wmq.179.1629636683011;
        Sun, 22 Aug 2021 05:51:23 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id c8sm11915882wrx.53.2021.08.22.05.51.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Aug 2021 05:51:22 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 18/55] mobile-broadband-provider-info: upgrade 20201225 -> 20210805
Date: Sun, 22 Aug 2021 14:50:26 +0200
Message-Id: <20210822125103.310416-18-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210822125103.310416-1-alex.kanavin@gmail.com>
References: <20210822125103.310416-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../mobile-broadband-provider-info_git.bb                     | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb b/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb
index f170cf4650..837490f15f 100644
--- a/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb
+++ b/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb
@@ -4,8 +4,8 @@ DESCRIPTION = "Mobile Broadband Service Provider Database stores service provide
 SECTION = "network"
 LICENSE = "PD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=87964579b2a8ece4bc6744d2dc9a8b04"
-SRCREV = "90f3fe28aa25135b7e4a54a7816388913bfd4a2a"
-PV = "20201225"
+SRCREV = "11f2247eccd3c161b8fd9b41143862e9fb81193c"
+PV = "20210805"
 PE = "1"
 
 SRC_URI = "git://gitlab.gnome.org/GNOME/mobile-broadband-provider-info.git;protocol=https"
-- 
2.31.1

