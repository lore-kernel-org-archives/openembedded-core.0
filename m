Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
 by mx.groups.io with SMTP id smtpd.web10.181953.1598214079602915495
 for <openembedded-core@lists.openembedded.org>;
 Sun, 23 Aug 2020 13:21:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=rN/Tmm+4;
 spf=pass (domain: gmail.com, ip: 209.85.208.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f44.google.com with SMTP id c10so6263096edk.6
        for <openembedded-core@lists.openembedded.org>; Sun, 23 Aug 2020 13:21:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=cVk0lKCo6q/IpGacrJyV6QAhbcZD1c87w4+qqT5lFjM=;
        b=rN/Tmm+4GpR/BVO5HIUY1vTXPoP+Qkem7A3tBoxY16mZL6Bk29h1M/BmQk5igJT5TV
         RKdtxkBCrb6TqTEmedjPgbVg7Fa7OnDhQkk1yLkIhrDsV4iUOUcGupFvIq4Dn5/Pdbij
         Uj/gA9Tq546mmcCANrd/zE1ipOtcdqCRESps56iYeGPTertipM4WR1lnUdrqP/Qd3WoV
         oLVE25GKbzPkoUT89ZQzMOQBaVSOkkLxyWzR8o9pxJL7KGkSK8vv72rgBVsla5oNMgDi
         7QB9PxJ6bvWFn9M3vgGTZOYuIcSmJLZKa/n2QriVgmzetqvFXZx785NqZ7CcuCwXSe22
         Ra5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cVk0lKCo6q/IpGacrJyV6QAhbcZD1c87w4+qqT5lFjM=;
        b=lftd+xz5tkgzYgM9jtWRCluw/wlqJ2hLj5QYrw4oCFkCYAmr+ApobpGFf7sn4Oe27Z
         DOYFD2KwZ2o41/dpACVbQutkGNjf2/4/RJR5ivmwsTiRRVjcGlX4p5Xupf8vKJ/sh+gU
         +VrJrOhjmvs9qAatxbIIPB/JjsNX5Rj/4EFjxHQFgDON8+O3ifIm8oSk+mNLNHo/KfuP
         iSqCT+tFwAxUfr9fItY2hxF8Z5i8m9PmZYd189lkgumUa/iWZPXrs8g16mXN9tHOgLJU
         h6qQApdsRW2FInpjJ0EbnHIa6m1ianKNagLa4nxtE7ohFSMNW5ndJ4QiOy9Z/4PrxL+M
         9hgQ==
X-Gm-Message-State: AOAM5311bg3iqH2WWjGY66cVsAba7WcLQd/nNkPTeNc7F0IN4YNytUV4
	bpmMnF12slGXocR25bAidLyiG3LnobM=
X-Google-Smtp-Source: ABdhPJxc/5t2a9XSKTbyZ928mtBrrqQAiw8KZzrdwCy9djLUTbx57kiurT9w3kI+xGJfwGzhuABIQw==
X-Received: by 2002:a05:6402:156:: with SMTP id s22mr2543781edu.372.1598214077887;
        Sun, 23 Aug 2020 13:21:17 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.box (cable-95-168-130-13.cust.telecolumbus.net. [95.168.130.13])
        by smtp.gmail.com with ESMTPSA id sd17sm7342480ejb.93.2020.08.23.13.21.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Aug 2020 13:21:17 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 13/37] gtk+3: upgrade 3.24.21 -> 3.24.22
Date: Sun, 23 Aug 2020 22:20:07 +0200
Message-Id: <20200823202031.24686-13-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200823202031.24686-1-alex.kanavin@gmail.com>
References: <20200823202031.24686-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-gnome/gtk+/{gtk+3_3.24.21.bb => gtk+3_3.24.22.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-gnome/gtk+/{gtk+3_3.24.21.bb => gtk+3_3.24.22.bb} (84%)

diff --git a/meta/recipes-gnome/gtk+/gtk+3_3.24.21.bb b/meta/recipes-gnome/gtk+/gtk+3_3.24.22.bb
similarity index 84%
rename from meta/recipes-gnome/gtk+/gtk+3_3.24.21.bb
rename to meta/recipes-gnome/gtk+/gtk+3_3.24.22.bb
index 70c0e66db7..6af2bd94c1 100644
--- a/meta/recipes-gnome/gtk+/gtk+3_3.24.21.bb
+++ b/meta/recipes-gnome/gtk+/gtk+3_3.24.22.bb
@@ -8,8 +8,7 @@ SRC_URI = "http://ftp.gnome.org/pub/gnome/sources/gtk+/${MAJ_VER}/gtk+-${PV}.tar
            file://0003-Add-disable-opengl-configure-option.patch \
            file://link_fribidi.patch \
            "
-SRC_URI[md5sum] = "95afed6c860d27de827db66434d681da"
-SRC_URI[sha256sum] = "aeea6ae7cd35e83dfc7699be716519faefca346c62e784dd1a37d9df94c08f52"
+SRC_URI[sha256sum] = "bf18a4a5dff28a7b02aaef1b949c2d09c96c18387eddab152bb4cd55a5b67dda"
 
 S = "${WORKDIR}/gtk+-${PV}"
 
-- 
2.28.0

