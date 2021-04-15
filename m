Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web09.7357.1618495089932443286
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Apr 2021 06:58:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=bxMBCLDE;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f43.google.com with SMTP id w7-20020a1cdf070000b0290125f388fb34so12178273wmg.0
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Apr 2021 06:58:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ccwU48zlXRho3NOfbrEfTZsvBT7zxEty2pNWnBpt5R4=;
        b=bxMBCLDERQ46JqPXiAApvkCW7Bc2tM46UlGBHnXCmX8kui4CJoEMAnHO44NcuLGbj5
         offZtiEaxqcZSR28FHcF+ZR+y/reyBvazxxlKG94v3eFaFb+P19P7OkGys+3gXnOeJGc
         MWRcPcoDAs+n2X+fNglxCUoYGx6pmTHGNXYnI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ccwU48zlXRho3NOfbrEfTZsvBT7zxEty2pNWnBpt5R4=;
        b=Ya2i6zWiVUiCd3EtBcZgmPrPJ3jwAUmtKDlHz+lDBUaCeoGnYOuKXot7fPyPrwLLHf
         E8cCm5m0jzYFf03X6dK7OG7CCyxlWnnUh8+6a3DC+QGPuL2ZFcljuY1RL92/j/f61cWB
         pqNGjGjAmLXU0rsegMaZgjFT+eT0IdnX+Nnkr2vheUK78ZhZhu+yppkbgYCfJHrU7/Vy
         QJ+qP0aYN4pf9JJ7ouzDZtMTMbI/wkjBGiMlUbtMewnn+bk4+pAOpyWbkLGQTgE74vtb
         ivtZn7Y4f1xndrgUUAS8kXxNXmQytWBXSDvFNV8Tg7gPhI3Mi/ZTk8YjvwruG4K5XlZK
         rAUA==
X-Gm-Message-State: AOAM530M0W8c2N35zl0hgqNP5Ys5QEH/1KpnyPoxSQ3L9DHFrI+/v7fy
	IAU4YOZEAmzaB1u6QdrGAfmcFa3fwMR7xQ==
X-Google-Smtp-Source: ABdhPJxXmSragi4BmZ7+XTE4GXsW5ppaP26DB4RA4QMcXNr41xG2qinmQlQQ1/hbBaMRodh5s2749g==
X-Received: by 2002:a05:600c:4013:: with SMTP id i19mr3371084wmm.144.1618495088178;
        Thu, 15 Apr 2021 06:58:08 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:b769:fd13:2e7b:1bdf])
        by smtp.gmail.com with ESMTPSA id f6sm3267562wrt.19.2021.04.15.06.58.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Apr 2021 06:58:08 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] layer.conf: Update to add post 3.3 release honister series
Date: Thu, 15 Apr 2021 14:58:07 +0100
Message-Id: <20210415135807.1317283-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta-selftest/conf/layer.conf | 2 +-
 meta-skeleton/conf/layer.conf | 2 +-
 meta/conf/layer.conf          | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-selftest/conf/layer.conf b/meta-selftest/conf/layer.conf
index 5604f826933..fae8c5a65a3 100644
--- a/meta-selftest/conf/layer.conf
+++ b/meta-selftest/conf/layer.conf
@@ -9,4 +9,4 @@ BBFILE_COLLECTIONS += "selftest"
 BBFILE_PATTERN_selftest = "^${LAYERDIR}/"
 BBFILE_PRIORITY_selftest = "5"
 
-LAYERSERIES_COMPAT_selftest = "hardknott"
+LAYERSERIES_COMPAT_selftest = "honister"
diff --git a/meta-skeleton/conf/layer.conf b/meta-skeleton/conf/layer.conf
index ba301742ecd..1cb0ca1f301 100644
--- a/meta-skeleton/conf/layer.conf
+++ b/meta-skeleton/conf/layer.conf
@@ -14,4 +14,4 @@ LAYERVERSION_skeleton = "1"
 
 LAYERDEPENDS_skeleton = "core"
 
-LAYERSERIES_COMPAT_skeleton = "hardknott"
+LAYERSERIES_COMPAT_skeleton = "honister"
diff --git a/meta/conf/layer.conf b/meta/conf/layer.conf
index 5210fd46126..5892c80ae4d 100644
--- a/meta/conf/layer.conf
+++ b/meta/conf/layer.conf
@@ -7,12 +7,12 @@ BBFILE_COLLECTIONS += "core"
 BBFILE_PATTERN_core = "^${LAYERDIR}/"
 BBFILE_PRIORITY_core = "5"
 
-LAYERSERIES_CORENAMES = "hardknott"
+LAYERSERIES_CORENAMES = "hardknott honister"
 
 # This should only be incremented on significant changes that will
 # cause compatibility issues with other layers
 LAYERVERSION_core = "12"
-LAYERSERIES_COMPAT_core = "hardknott"
+LAYERSERIES_COMPAT_core = "honister"
 
 BBLAYERS_LAYERINDEX_NAME_core = "openembedded-core"
 
-- 
2.30.2

