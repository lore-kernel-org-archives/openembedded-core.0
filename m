Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
 by mx.groups.io with SMTP id smtpd.web08.8349.1621599286469286097
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 May 2021 05:14:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Y0iCXxSj;
 spf=pass (domain: gmail.com, ip: 209.85.208.176, mailfrom: liu.ming50@gmail.com)
Received: by mail-lj1-f176.google.com with SMTP id p20so23688167ljj.8
        for <openembedded-core@lists.openembedded.org>; Fri, 21 May 2021 05:14:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6IwMyQy0+fEhdtiPueAMtRXzD48ll2qXum5CLj6Jxzk=;
        b=Y0iCXxSjvCol819tVj0w9PS2KmGh3kM0joaLRJdovA2ZFxTIo8R+wL3+Optm5hDl9o
         mRjxCuniCMUTRbtA7u0CSyzOckj4wsctX5GTmltAw4HZ1RMf3cE9Zjf4UzF0S3bkJhUr
         XMwkqAMf0GZ5ISl4PcRGn4rdoKaLtApjLqdN98eVFNNGqUqWsUHj4QdJ8A4XOUx7ZivV
         lJi01UVeTFrE19qKP1wFescVoO6pJRAARgEE05RkXdHnE6OsCOZQMouv8Vhv0PPrh5nZ
         iGwjJuVBfxVl1FUZpFFv8K+3Yky1G+yw/IyVN66J/Xdv88+6fOBEkSndHjKFXVUpCDP8
         qmtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6IwMyQy0+fEhdtiPueAMtRXzD48ll2qXum5CLj6Jxzk=;
        b=OLstmYMNUWS+EGz7TLqwTCYvKq2pgQLh/Vyhp2HfJ2aNohm2RhdKyS4+MH/7qUqxzD
         e5vct866JeU/NloBtt4iA/2v/yXhMR0TebDQPNMhEiqOSeivNC5rIiKzY5/pvMz3s5bA
         naTWcHoAMX+0TEykFfDGp4UkAOyRJ9fEQfOFK7ZnJlFrm2wHVq9Xzy1jFSjBb7gNNtcw
         EhBcZqTMrbJJDmv13tnbln18y7afq+a46BZkls1bWD1Zt0cqWAJCOaujrE9876UjoNID
         oRSQ/hom3mdR7WTrgGGx7O9BQ6/vKM2C7wmG+I9Euj/unb4xXFlflI2gH7fP8n0yMX/J
         zU2w==
X-Gm-Message-State: AOAM533NZ1ZIANAS9qhZRoZd2SKh7iu7yh+yQ92wJUbB1rCzmcxDzv7P
	RK+GBwkR6tUAeOD5N2wd1I3TsQVOdkU=
X-Google-Smtp-Source: ABdhPJxNBrhl/P/tB/u967IVLdQPITxlkxEBRPGVy3Gc20la2PPTcYYfgKziCRxF5zMnsZrYX+S7Gw==
X-Received: by 2002:a05:651c:2122:: with SMTP id a34mr6642785ljq.286.1621599284618;
        Fri, 21 May 2021 05:14:44 -0700 (PDT)
Return-Path: <liu.ming50@gmail.com>
Received: from localhost.localdomain (m90-129-203-26.cust.tele2.se. [90.129.203.26])
        by smtp.gmail.com with ESMTPSA id t26sm344186lfq.24.2021.05.21.05.14.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 May 2021 05:14:44 -0700 (PDT)
From: "Ming Liu" <liu.ming50@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Ming Liu <liu.ming50@gmail.com>
Subject: [OE-core] [PATCH] initramfs-framework:rootfs: fix wrong indentions
Date: Fri, 21 May 2021 14:14:41 +0200
Message-Id: <20210521121441.196231-1-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.29.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ming Liu <liu.ming50@gmail.com>

Signed-off-by: Ming Liu <liu.ming50@gmail.com>
---
 meta/recipes-core/initrdscripts/initramfs-framework/rootfs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/initrdscripts/initramfs-framework/rootfs b/meta/recipes-core/initrdscripts/initramfs-framework/rootfs
index 10b9583172..e0efbe6ebe 100644
--- a/meta/recipes-core/initrdscripts/initramfs-framework/rootfs
+++ b/meta/recipes-core/initrdscripts/initramfs-framework/rootfs
@@ -56,8 +56,8 @@ rootfs_run() {
 					# It is unlikely to change, but keep trying anyway.
 					# Perhaps we pick a different device next time.
 					umount $ROOTFS_DIR
-					fi
 				fi
+			fi
 		fi
 		debug "Sleeping for $delay second(s) to wait root to settle..."
 		sleep $delay
-- 
2.29.0

