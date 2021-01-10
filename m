Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web10.16881.1610278386318375809
 for <openembedded-core@lists.openembedded.org>;
 Sun, 10 Jan 2021 03:33:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=PWIOOmDS;
 spf=pass (domain: gmail.com, ip: 209.85.218.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f51.google.com with SMTP id jx16so20624494ejb.10
        for <openembedded-core@lists.openembedded.org>; Sun, 10 Jan 2021 03:33:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=k7t9VuZbGCY8sAzpHZEdInXJgfHHJ7LjU1nGsBskCNM=;
        b=PWIOOmDSKwv5XyemHmJc67AjzU4PrZSA/DG3pzpD0bD6ejCwnr4Eqt55+0iOyHQpL7
         KjFHQAoeiyxlnyIPXqlT+1AEzCrJVDC2/+GG1WOXu5ntULZpNLSYs2K7QzgcHuoc5sb7
         /pRsZLNAAfIsICj7jNFU1gOWLCZIRTaV2g6DQgLgdOvi46baHZaG29KyCPHnDxLg9SCX
         YCiM8CjhHx3VT44falUaIXK06NiLp7d/bJ24XmnHN6leJ+Q3yAJRrNOAH4AAWnpV4en9
         p0YhLOFGB5NwW6p+arI3L6d13fuKABwM2+ekAKVkEYD4f5DmanPHuaoNZju2tcMa0Vr3
         xCJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=k7t9VuZbGCY8sAzpHZEdInXJgfHHJ7LjU1nGsBskCNM=;
        b=UfucHhwdnftxWhBCok7IuCrWXc5Xv5ybgZFzCrEUETc5cclGpN7MPraB4waGBEWLKL
         3y+n0A3H13/JAa4U67o8WodlUr5x2bZr+Ji1SRDoOd8I1/IX6wuDourxGPr3y7qxif+7
         djfDejfzPsPr5AYwbdawpkYaUyWPOskiUrVBNC5I8rjD6IBELoY0x19WH883OfAs3Wqp
         3pboQNz+8DlIRO4hId9BQOwVb+6K92Y1lhXbXZexs1q861lKFt3XPSIMG8sCLyXOZ1j6
         3NSshk8zlm4Pg6DE5GUzZo7mkpW5UaR6VUuT/Yq9mFeXq0gBUbkcA++n4G0G70ZqOyPk
         8zJg==
X-Gm-Message-State: AOAM531p4TWwsZtV1VTRJUJkP6rCgo9WjZ2hyFC77Yw+wa2dWruyuHwR
	3MDL0mmj8+JO11KMQyJGjv0oiaZlCPA=
X-Google-Smtp-Source: ABdhPJxnvSKfxQnnXX/+daVVWtS3fWmc2Ylr/H5keiQ50RFezM5dn+sNd1fpqSpNiJl8KMihWTIe1g==
X-Received: by 2002:a17:906:408f:: with SMTP id u15mr7973356ejj.84.1610278384658;
        Sun, 10 Jan 2021 03:33:04 -0800 (PST)
Return-Path: <alex.kanavin@gmail.com>
Received: from fedora.fritz.box ([2a02:2450:1011:4f7:8d55:862e:4e16:5283])
        by smtp.gmail.com with ESMTPSA id n17sm5657424ejh.49.2021.01.10.03.33.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Jan 2021 03:33:04 -0800 (PST)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH] net-tools: correct version check
Date: Sun, 10 Jan 2021 12:32:59 +0100
Message-Id: <20210110113259.466958-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A new upstream release is out.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-extended/net-tools/net-tools_1.60-20181103.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/recipes-extended/net-tools/net-tools_1.60-20181103.bb b/meta/recipes-extended/net-tools/net-tools_1.60-20181103.bb
index e97731073e..dcc2218e48 100644
--- a/meta/recipes-extended/net-tools/net-tools_1.60-20181103.bb
+++ b/meta/recipes-extended/net-tools/net-tools_1.60-20181103.bb
@@ -16,8 +16,6 @@ SRC_URI = "git://git.code.sf.net/p/net-tools/code;protocol=https \
     file://Bug_541172-netstat.c-exit-codes.patch \
 "
 
-UPSTREAM_VERSION_UNKNOWN = "1"
-
 S = "${WORKDIR}/git"
 
 inherit gettext
-- 
2.29.2

