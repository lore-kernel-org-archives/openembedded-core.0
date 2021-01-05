Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web10.5952.1609856749300823540
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Jan 2021 06:25:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=MlWiQwzD;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.49, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f49.google.com with SMTP id w1so1250364pjc.0
        for <openembedded-core@lists.openembedded.org>; Tue, 05 Jan 2021 06:25:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=Y+igB6KT5dKesqTD+VmH+iMxx3tRJnZHbKnGOssi/6E=;
        b=MlWiQwzDxkkjRXz7fyiryTnsJpY0ZMkMCQrX+ZAwt6DlR3D3wN2xdSwq5wm2/omVUy
         iE8gICkPMqt651DTXPOM3GSFBoXQvYyuHLpkl61NePvOKP/0+0FUxo1dYxjZsp7tJppU
         NbLch86qtolZ9dw/+UL8GJdVy41IwTsmODUbB31x1FesnjCKbjFrAY3786gZqFSFFyg8
         dxC/iiY7gtNU+yLujicny60z/atBVlNS/Dfgend7MueI7s7oJ5sAPGhjOH/yQFPa68PO
         +yQ9xxIr3YjI0dXb1Y5bv5FY+2NrvKnFtZtgHsmgWOidMgbDLFh5vpyiZTkc3XngtVOz
         +h6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=Y+igB6KT5dKesqTD+VmH+iMxx3tRJnZHbKnGOssi/6E=;
        b=b6+yTb+hqFIb07snamSN+IoUMYod+hEJIadSSMq8c/XPZqqGuu36BW1WyPExft0mj1
         UWT0SHH0kNG1xKmGnB7bBxZV4U2iIz3y7Tk8pZRvUlhUpGMTiUdmI9q/3srLArtH0Z7H
         7snx9feFAY9gmVLLAXusppm+Igjp1YAahYNi0W+XhYYibDkLiffTqar1Lk1M/xlDRcHi
         E9+RxxbWCj27XMbvHH5O5otH7eI5TwvVLYL24IXe5BisGv9utVlVq9nhHot1FzV4Z2KS
         co4W/sHPfey8oYeq1Q4AoBdCMTucozXb6HpM1pf5R9ZH8YbZU0ZVHDxf13By2UiGCFO7
         NGTQ==
X-Gm-Message-State: AOAM530VB8UZDyAf7axFfDCHTZCNg/RjRFT86Byv82D6dp6o8k0lj/Er
	zz0PTlve+0ig940nP3xN7cGhP/1kM9lrRg+Bfjc=
X-Google-Smtp-Source: ABdhPJxSYHYEJ0HS8T2RWTaLD2XyDbDnN4pfAxwBV5jiBHXISv6vZX82skZU3xsoQzL0if/DXydy1A==
X-Received: by 2002:a17:90b:3355:: with SMTP id lm21mr4229673pjb.115.1609856748486;
        Tue, 05 Jan 2021 06:25:48 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id i130sm57552465pfe.94.2021.01.05.06.25.47
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jan 2021 06:25:47 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 18/30] initscripts: use quotes for shell variable comparision
Date: Tue,  5 Jan 2021 04:23:43 -1000
Message-Id: <4e7338614f9c02a0a846645a51a78ddb69253f60.1609856435.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1609856435.git.steve@sakoman.com>
References: <cover.1609856435.git.steve@sakoman.com>

From: Khem Raj <raj.khem@gmail.com>

Helps to execute it with busybox shell

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 45ba0ca0352bca46f974d28781ac935d8e9ec3ea)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/initscripts/initscripts-1.0/checkroot.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/initscripts/initscripts-1.0/checkroot.sh b/meta/recipes-core/initscripts/initscripts-1.0/checkroot.sh
index 02f0351fcb..a63e71b780 100755
--- a/meta/recipes-core/initscripts/initscripts-1.0/checkroot.sh
+++ b/meta/recipes-core/initscripts/initscripts-1.0/checkroot.sh
@@ -74,7 +74,7 @@ test "$VERBOSE" != no && echo "Activating swap"
 #
 # Check the root filesystem.
 #
-if test -f /fastboot || test $rootcheck = no
+if test -f /fastboot || test "$rootcheck" = "no"
 then
   test $rootcheck = yes && echo "Fast boot, no filesystem check"
 else
-- 
2.17.1

