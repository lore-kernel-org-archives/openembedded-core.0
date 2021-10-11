Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FD91C433FE
	for <webhook@archiver.kernel.org>; Mon, 11 Oct 2021 09:41:17 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web10.9727.1633945275884280149
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Oct 2021 02:41:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=a9H2g2DT;
 spf=pass (domain: gmail.com, ip: 209.85.221.42,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f42.google.com with SMTP id v17so54055193wrv.9
        for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Oct 2021 02:41:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Xv1uCwbT+UO8G4nFcNPC9UyC+KFLoU6qincjlGTTUD4=;
        b=a9H2g2DTpdJMWizn98fgHyRi55czC7OmM8Wxi1o+sj0t7NsntDhjD1XPPKHqIClBSF
         WFasmmhLQzEEw7MyoAoSbSCaNHX1pFvE3PeTbRkB9F4WffmsNyVzU2ve3hhKQnT6sX4m
         rvIg34YLXHU6I/V6E7XZUavH1MIBnHfB9HHeEKS68/08IUZS0FIsej+OIPJDQKPxK+9R
         mYfXX77ez0Ev84A7VPeEfqtLKMwbN4f2XTWA1aflOvp9vo5dNbndLw8EUbD7DXZ5wIKp
         LSVhHcD8G3wsIiTzGiqTt4r9t4UVzP+6FKVB3z7ph56e+G11YGFi8ZWQz1OjVtOt1i1A
         /2ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Xv1uCwbT+UO8G4nFcNPC9UyC+KFLoU6qincjlGTTUD4=;
        b=6tNCsZkafB3BQdhq86IEN6/LOpbmxQtlXR3pYaGJmEgBPNOgP6+vpt+yV3vPwgtZUJ
         8qnzccN7Whib2wAmEoK48xNzA5VIDGjvnlNAv7TFfUOX5CqTxX1R0YRv05iCrJgyve83
         u4muOsidN5SBC6nCPs5Y/x70ddEzZP1S9kK0++n3E+O0X9sq0UlOQJQ21ZhcJ21Cm1Zw
         RCjiSBRgWZ9xq+7FIi3cM03cvDiGegjzNQYNkc+SlOssvITIoBPXiC6G/c2z2lBKJW/V
         IWF26lX2/awN2EACjboLMKqQOfaJJfbnChw5fRreeYO4zyKZQWTvLJ8H6EAcucKz8AYI
         PdhQ==
X-Gm-Message-State: AOAM530deH45hyOaIq4R/fgKJSQTlOfoJoA4OSKb/cYiJWJzjWxe3Erw
	/bGvLKCH/w1d75zBPSrpQhqNhxzi8kY=
X-Google-Smtp-Source: 
 ABdhPJxH2hEpW7ydYp950GktZvw0pPj8y54D33tRQv3RfP9dl5ZVXqdkFTtPNK6Hy7q7gsaMB9lbLw==
X-Received: by 2002:a5d:6d51:: with SMTP id
 k17mr13167419wri.233.1633945274343;
        Mon, 11 Oct 2021 02:41:14 -0700 (PDT)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 k17sm7180758wrc.93.2021.10.11.02.41.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Oct 2021 02:41:14 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 17/25] wget: update 1.21.1 -> 1.21.2
Date: Mon, 11 Oct 2021 11:40:51 +0200
Message-Id: <20211011094059.4184654-17-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211011094059.4184654-1-alex@linutronix.de>
References: <20211011094059.4184654-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Oct 2021 09:41:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156830

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-extended/wget/wget.inc                           | 2 ++
 meta/recipes-extended/wget/{wget_1.21.1.bb => wget_1.21.2.bb} | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)
 rename meta/recipes-extended/wget/{wget_1.21.1.bb => wget_1.21.2.bb} (60%)

diff --git a/meta/recipes-extended/wget/wget.inc b/meta/recipes-extended/wget/wget.inc
index cd7290be579..2491199f18c 100644
--- a/meta/recipes-extended/wget/wget.inc
+++ b/meta/recipes-extended/wget/wget.inc
@@ -11,6 +11,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=c678957b0c8e964aa6c70fd77641a71e"
 
 inherit autotools gettext texinfo update-alternatives pkgconfig
 
+DEPENDS += "autoconf-archive"
+
 EXTRA_OECONF = "--without-libgnutls-prefix --without-libssl-prefix \
                 --disable-rpath"
 
diff --git a/meta/recipes-extended/wget/wget_1.21.1.bb b/meta/recipes-extended/wget/wget_1.21.2.bb
similarity index 60%
rename from meta/recipes-extended/wget/wget_1.21.1.bb
rename to meta/recipes-extended/wget/wget_1.21.2.bb
index 21385bbfb27..90f3eb104dc 100644
--- a/meta/recipes-extended/wget/wget_1.21.1.bb
+++ b/meta/recipes-extended/wget/wget_1.21.2.bb
@@ -2,6 +2,6 @@ SRC_URI = "${GNU_MIRROR}/wget/wget-${PV}.tar.gz \
            file://0002-improve-reproducibility.patch \
           "
 
-SRC_URI[sha256sum] = "59ba0bdade9ad135eda581ae4e59a7a9f25e3a4bde6a5419632b31906120e26e"
+SRC_URI[sha256sum] = "e6d4c76be82c676dd7e8c61a29b2ac8510ae108a810b5d1d18fc9a1d2c9a2497"
 
 require wget.inc
-- 
2.20.1


