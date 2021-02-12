Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
 by mx.groups.io with SMTP id smtpd.web12.6594.1613148712199868817
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Feb 2021 08:51:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=n0kmkkz4;
 spf=pass (domain: gmail.com, ip: 209.85.210.43, mailfrom: jpewhacker@gmail.com)
Received: by mail-ot1-f43.google.com with SMTP id d7so8969538otq.6
        for <openembedded-core@lists.openembedded.org>; Fri, 12 Feb 2021 08:51:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zfdhrmqOc2t3L7sH5mVpgokAnbV0j/5YeMCDpXPPqT8=;
        b=n0kmkkz4g5fmdXafmyyRLphvBENAceDqRc8APQMn3/xANvIMVlt89AsO6Oz9/rzLGL
         34UR6mS446w+yFgb9lr+l/VTwMOvD7Ch9LosxXxiHnXm2AlzcCipQmu/91edKfCncYQW
         Ru34ey0zas8WTf7CQfI5MZGjr0kAcsQeRki4WWLXe90jrh7N/BQAlCHbDY60YofinkOK
         PAHHK5hzMWH8twAG1+hpyritsSVQY9Gl60VvbqdR3/ktz1Bc6cvVCYRkkyaTT6a3gDvC
         3PMcbgEr4G2ElxIBSefI+i3OqV9P7D3vCJYwInpLgCFcUjt3ZUryDNSq9x0DFlxAF8wI
         Ov6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zfdhrmqOc2t3L7sH5mVpgokAnbV0j/5YeMCDpXPPqT8=;
        b=YSBoEL2Svtpiyt7Z/7h6Tkg2HlA7qutT/yGMwhOFZyzV28WSzOi4yutIuHzpdsZhud
         DNWoONFbs0KET1aSpoOybJ02FNMM19uQxBjtbEll2givh1zcyUS5dYKW4NK7hiNrjVT1
         h3qmH6P4lS1tJPPBRiaIU1TqpCJboxgS13QsaFgAYWbPdFIvi/OIjCzJrQmuBDK0eDba
         1ErwQqv44AuqzYZshPgZ7ylqVBiCCkHS12I5Ty/W6Kv1Xmg/PZR0eO25QD5yy0RqGeoA
         jHgZe4P2t/9p6p0XT8sStYnMeXrZgGF5UthqlJFdzmxh3iNH4vdjFCR84vErbl8AmfvE
         lm+w==
X-Gm-Message-State: AOAM532UIx94VpvREuBT8liUSFHdIU+pHQ05xu2qFH4lhJUWXuQCUY16
	3Totm/j08pjpnpYf2UCwqhqH2MDa8Z4=
X-Google-Smtp-Source: ABdhPJxVfemUxq96Tyrf0blo/vPr0TdvZKJf7vVJyIo1iHtAlPxzgKeIi3Hpo2CljFZWdJ/nM91+Zg==
X-Received: by 2002:a05:6830:1653:: with SMTP id h19mr2659671otr.78.1613148711334;
        Fri, 12 Feb 2021 08:51:51 -0800 (PST)
Return-Path: <jpewhacker@gmail.com>
Received: from localhost.localdomain ([2605:a601:ac3d:c100:e3e8:d9:3a56:e27d])
        by smtp.gmail.com with ESMTPSA id o83sm1649248ooo.37.2021.02.12.08.51.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Feb 2021 08:51:50 -0800 (PST)
From: "Joshua Watt" <JPEWhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH] weston: remoting backend requires GStreamer base plugins
Date: Fri, 12 Feb 2021 10:51:46 -0600
Message-Id: <20210212165146.21830-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The remoting backend of weston requires the GStreamer base plugins, so
add them to the PACAKGECONFIG depends list.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/recipes-graphics/wayland/weston_9.0.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/wayland/weston_9.0.0.bb b/meta/recipes-graphics/wayland/weston_9.0.0.bb
index 75f9fb05fd..d60b5e1a35 100644
--- a/meta/recipes-graphics/wayland/weston_9.0.0.bb
+++ b/meta/recipes-graphics/wayland/weston_9.0.0.bb
@@ -73,7 +73,7 @@ PACKAGECONFIG[colord] = "-Dcolor-management-colord=true,-Dcolor-management-color
 # Clients support
 PACKAGECONFIG[clients] = "-Dsimple-clients=all -Ddemo-clients=true,-Dsimple-clients= -Ddemo-clients=false"
 # Virtual remote output with GStreamer on DRM backend
-PACKAGECONFIG[remoting] = "-Dremoting=true,-Dremoting=false,gstreamer1.0"
+PACKAGECONFIG[remoting] = "-Dremoting=true,-Dremoting=false,gstreamer1.0 gstreamer1.0-plugins-base"
 # Weston with PAM support
 PACKAGECONFIG[pam] = "-Dpam=true,-Dpam=false,libpam"
 # Weston with screen-share support
-- 
2.30.0

