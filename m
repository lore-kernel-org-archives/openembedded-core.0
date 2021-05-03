Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web08.34549.1620052718132836659
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 May 2021 07:38:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=VoC/9p1c;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f54.google.com with SMTP id k128so3479306wmk.4
        for <openembedded-core@lists.openembedded.org>; Mon, 03 May 2021 07:38:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yQnHvUN1kgf7wn0biXwPvC90rJJOZv+Hb/zS612lp0k=;
        b=VoC/9p1cFEtw2DwO95FqKWrhYT6MjYqAcBTo6d+sGr0mCNNfdepFC+FIzcrrh+YYK1
         JFtmk579ZZFHK5S1iJgvVXSXXSp6LdRU0q9Zx8UHMVsdDDK04cz1SVfLLAMwftx+uFud
         o2Wm/yLpgWsfunNtcDRa7w6OySjGRrPD4Tovo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yQnHvUN1kgf7wn0biXwPvC90rJJOZv+Hb/zS612lp0k=;
        b=S6nm3KxXfTudIWMmLe2v5B01bOpPXc46+f2SB9tbWhNTnrVzm3+FJbfaBojwNzv+yP
         yQyhorlHLXYjTZyNiVcbHmwRUPEaG1xhjm+iuV5TIm08Yj3l0A/ooLpO9wyQxV7o4dM4
         eS4uTJ3Fg3fX6bSDAGS9jCL0k8oo+IxYU61gUCT+tFZR+j+RnGu/5DVvUw/ujdaPrV4p
         B4NlVFAmZBmkS3whsXBREIlgrSLtAPhk6m19rTEQ6EefXammhPsd2OytIScSmp36Mfk2
         BVtZcwEekiEFYhCFJ9Tmq1vLJx5FUntiqtcRn01vjE7Um4SKeKwa+7gxWgbYjoOWD8nV
         QMQA==
X-Gm-Message-State: AOAM531t3VGk+LR3OiRz8W1J6B3IVFCBi+JsFmsSKs6qqIlUmJgWfejg
	2FrgwJA7Bw+m4qv3fk56vgzwX/y9v/j8iA==
X-Google-Smtp-Source: ABdhPJyv+3xDlKABWBDL48yAQgweBv3nvLzGY3o1ItjAZ3coafhJeqrkAOpSo1QvW5LOo8YOo/2j0g==
X-Received: by 2002:a1c:c5:: with SMTP id 188mr19078845wma.5.1620052716513;
        Mon, 03 May 2021 07:38:36 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:2abe:bb29:590f:e028])
        by smtp.gmail.com with ESMTPSA id g25sm4629575wmk.43.2021.05.03.07.38.36
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 May 2021 07:38:36 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] yocto-uninative: Update to 3.1 which includes a patchelf fix
Date: Mon,  3 May 2021 15:38:35 +0100
Message-Id: <20210503143835.1903457-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/distro/include/yocto-uninative.inc | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/conf/distro/include/yocto-uninative.inc b/meta/conf/distro/include/yocto-uninative.inc
index a2a2dd18ece..05b79d14c3f 100644
--- a/meta/conf/distro/include/yocto-uninative.inc
+++ b/meta/conf/distro/include/yocto-uninative.inc
@@ -8,7 +8,7 @@
 
 UNINATIVE_MAXGLIBCVERSION = "2.33"
 
-UNINATIVE_URL ?= "http://downloads.yoctoproject.org/releases/uninative/3.0/"
-UNINATIVE_CHECKSUM[aarch64] ?= "1c668909098c5b56132067adc69a249cb771f4560428e5822de903a12d97bf33"
-UNINATIVE_CHECKSUM[i686] ?= "e6cc2fc056234cffa6a2ff084cce27d544ea3f487a62b5e253351cefd4421900"
-UNINATIVE_CHECKSUM[x86_64] ?= "5ec5a9276046e7eceeac749a18b175667384e1f445cd4526300a41404d985a5b"
+UNINATIVE_URL ?= "http://downloads.yoctoproject.org/releases/uninative/3.1/"
+UNINATIVE_CHECKSUM[aarch64] ?= "7fa12b9fe7a95934cc09beb0e8a25ff97179ef3105116015d32548eadd27b024"
+UNINATIVE_CHECKSUM[i686] ?= "bbfcdd48336800b5af97e294918c6586a0a8fa903f127f813b0bd5110de8c55c"
+UNINATIVE_CHECKSUM[x86_64] ?= "5d0611df544edff6428cef7d871257a91aa6ba1bd92f5365a2df8deb54b6b31e"
-- 
2.30.2

