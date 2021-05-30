Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web11.37068.1622412542311325900
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 May 2021 15:09:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=B/wrfNd9;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f44.google.com with SMTP id l18-20020a1c79120000b0290181c444b2d0so5416373wme.5
        for <openembedded-core@lists.openembedded.org>; Sun, 30 May 2021 15:09:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=zUb69Xf+fwst4xDzBeV/v2qYOBulXylLGfmZKIyIeUs=;
        b=B/wrfNd9nl1aDUpntjsbtuNvmtlbiNUolNGS8oOl9u46RRfkAYhQZJBXhT9wGTlKuX
         WT8e1LwFGy7sJBeqeZ4Rk6XET1ASu8zdzDo9rAWeVQCDE9B+HsbmIAwhjJ3JbXzh3/zb
         MKkcQdVx6R0i1QEbU+z2v8CSuqEjcM4X5Eqgc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zUb69Xf+fwst4xDzBeV/v2qYOBulXylLGfmZKIyIeUs=;
        b=PQVRPVU74twgXuf4C2/l0gPFLbHdbiyjpmbLlzLYeTUJoB5HB0x7/zaqKu2JF8Us3P
         AY53BZirPrZeCUkIaq0SwJgXP1oNOM4QUFuYvyDZGJkmraK6S68Ap3BNWl/2VPZUctKt
         EJQfPPxqENsIXSlhVVGeNYHJvyPYjEE+7Bd90tRtYSeDIDq1mb+ZMTBowCQEc3M4Q8sJ
         CVY0ChyyYIJd4DXnRtifhk/GA8u+EwEJc37RA8HxcpGYP0yluHeuZKtC+XclXhao/DKA
         rYrlM7TeUBvIiQ8tBr8AcnaeoDx+9bwh7uWqSK85wWa5HBk73b8IqlELsI4hnmZJGBoe
         VfSQ==
X-Gm-Message-State: AOAM530kZKcJ2ggQYZgtjotFcj5cuN7sKiJRoEE9R3gjts8gNlCMpwd2
	/D2POoWPim6QTWvQI2WvtLLmDT2Mj3Bx+g==
X-Google-Smtp-Source: ABdhPJzkC8eesY5v90B4S2f1cbKIvANyxkASGN6GbkZEyD4vjbUXmwsLqs71U13MNSfgjt/6yM0/Bw==
X-Received: by 2002:a1c:4c10:: with SMTP id z16mr18573971wmf.0.1622412540915;
        Sun, 30 May 2021 15:09:00 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:fcab:51bf:ac39:992c])
        by smtp.gmail.com with ESMTPSA id j10sm14721102wrt.32.2021.05.30.15.09.00
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 May 2021 15:09:00 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 11/16] gi-docgen: upgrade 2021.5 -> 2021.6
Date: Sun, 30 May 2021 23:08:51 +0100
Message-Id: <20210530220856.2830501-11-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210530220856.2830501-1-richard.purdie@linuxfoundation.org>
References: <20210530220856.2830501-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-gnome/gi-docgen/gi-docgen_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-gnome/gi-docgen/gi-docgen_git.bb b/meta/recipes-gnome/gi-docgen/gi-docgen_git.bb
index 4d779a9bdd3..b6721dc4e0b 100644
--- a/meta/recipes-gnome/gi-docgen/gi-docgen_git.bb
+++ b/meta/recipes-gnome/gi-docgen/gi-docgen_git.bb
@@ -10,8 +10,8 @@ LIC_FILES_CHKSUM = "file://gi-docgen.py;beginline=1;endline=5;md5=2dc0f1f0120247
 
 SRC_URI = "git://gitlab.gnome.org/GNOME/gi-docgen.git;protocol=https;branch=main"
 
-PV = "2021.5"
-SRCREV = "7dee859321573f9c843ef7fb136f11142cb6ddf8"
+PV = "2021.6"
+SRCREV = "cb76996ba9ef7a1634ab9bde30c77c3bbb47c8db"
 
 S = "${WORKDIR}/git"
 
-- 
2.30.2

