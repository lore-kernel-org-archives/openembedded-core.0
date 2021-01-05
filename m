Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web08.6002.1609856762187007570
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Jan 2021 06:26:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=RQC4MyLS;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.182, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f182.google.com with SMTP id x18so16449927pln.6
        for <openembedded-core@lists.openembedded.org>; Tue, 05 Jan 2021 06:26:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=F4Bn7LBsjnySbtex2EprvIagRj/B+0u/oMO/OygnM30=;
        b=RQC4MyLScSoaofUJe/JF5emOJxB2R3lnYpA4atAHz0mPlfniaJHppVy9cAI9yxaT5A
         avy6RAuytFuFYUHjbAgKGT8JZxfYELj8tCk3tTkxBj5dFGqTRLOBZjo8HT4AIYCl74cR
         HcOzGQeqY0ptFxfr8znU1inKdWnw4oM9dX0hia3IoaGR1LowexS6mE3FjhwR4GvCcwMk
         DrEugthT2hEhbTDAAE25fsAM9mDW4doINp/7iZ6LRSne938ZpDILjUbv3qcMEJzmZM19
         /NpFgSUKWjTtht62vs7Zr9C87DxHK3e9tnLFfhU8NmQVAbOxG/jqYmCPp4f4OubqZ3ql
         9PnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=F4Bn7LBsjnySbtex2EprvIagRj/B+0u/oMO/OygnM30=;
        b=rzwhKUiLFN6wMSlSc5LMTn34zevKnB+xxbnviljm546rvly1hL4mqYrETHKud6/ffb
         xeB9XB76gGRER5Yr9z7rZtBFhZcNsQbC5J+JGSWBxLvI2oJ45yBoB558LTzyLV7/vVme
         FTN0tiHFnQdRdhh/w5sXOb2C7hUADtuRHncFo3a6rKAfWloiBPnULgm3XPVRUYKZ+Sjb
         US2Qj0MsUyXSnRGN35VpIFiVLOSmAG6t+VctT6ffItqR7jZ87TalRB9j7P6hSinkY9hK
         93WV+md7wL2iRLevnsvh2JJTH8FpIWvpO/YREYU2VbPz9MRyVn/IfkErJ7p1ebhPnyeT
         D9tA==
X-Gm-Message-State: AOAM530ZZQBnpjQOggtBCWCZP+9RHSD5QUUMTgzNGoYHHUOBAlHimdGR
	cQCE5bBaTgqx6J23tQl9z4D1tabFGR1l+8fPMgI=
X-Google-Smtp-Source: ABdhPJyDWukkluZEIE632CHR2zByj6ZddTW9V0jHjPKlO0hlcmjyoql8RyeElPg8x3OnL4PC1LD1Ow==
X-Received: by 2002:a17:90a:6809:: with SMTP id p9mr4192149pjj.112.1609856761416;
        Tue, 05 Jan 2021 06:26:01 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id i130sm57552465pfe.94.2021.01.05.06.26.00
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jan 2021 06:26:00 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 20/30] weston: Fix PACKAGECONFIG for remoting
Date: Tue,  5 Jan 2021 04:23:45 -1000
Message-Id: <74611d0438a30b48f6d830763e747d6d93c4ea68.1609856435.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1609856435.git.steve@sakoman.com>
References: <cover.1609856435.git.steve@sakoman.com>

From: Robert Yang <liezhi.yang@windriver.com>

Fix a typo: gstreamer-1.0 -> gstreamer1.0.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit d5b030dd9b9ada796f90919c97c887b00612cfc0)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-graphics/wayland/weston_8.0.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/wayland/weston_8.0.0.bb b/meta/recipes-graphics/wayland/weston_8.0.0.bb
index 8fef864827..0b383f25f3 100644
--- a/meta/recipes-graphics/wayland/weston_8.0.0.bb
+++ b/meta/recipes-graphics/wayland/weston_8.0.0.bb
@@ -70,7 +70,7 @@ PACKAGECONFIG[colord] = "-Dcolor-management-colord=true,-Dcolor-management-color
 # Clients support
 PACKAGECONFIG[clients] = "-Dsimple-clients=all -Ddemo-clients=true,-Dsimple-clients= -Ddemo-clients=false"
 # Virtual remote output with GStreamer on DRM backend
-PACKAGECONFIG[remoting] = "-Dremoting=true,-Dremoting=false,gstreamer-1.0"
+PACKAGECONFIG[remoting] = "-Dremoting=true,-Dremoting=false,gstreamer1.0"
 # Weston with PAM support
 PACKAGECONFIG[pam] = "-Dpam=true,-Dpam=false,libpam"
 # Weston with screen-share support
-- 
2.17.1

