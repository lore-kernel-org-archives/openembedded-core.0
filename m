Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4162.1793330640364329729
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Oct 2026 20:24:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=PQINjjLQ;
 spf=pass (domain: gmail.com, ip: 209.85.216.41, mailfrom: bbnpreetsingh@gmail.com)
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3ad41b47541so200193a91.1
        for <openembedded-core@lists.openembedded.org>; Thu, 29 Oct 2026 20:24:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793330640; x=1793935440; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=SvbLrMrllkAzaqzfSACQszj9FmLvV/lcvqpGXJeFaI4=;
        b=PQINjjLQmZf0NQoAQusYisRjS6/aZb/o69GqnHzyBwRLcaXv6Kr8Nwrg6r9w51L05l
         YTbGCwxN1RjmDr4jPKVdToy26i3TXe8XpGfZ5eqOEv3Lqfqj1/mej4+2XY0WnBhZp3Qt
         sBeJmVK6wDx+F6f1LU+mVP+hCw3CWsCUBxc45cIH2z4E/K+bXtX1fKzc7sjycistJucX
         2g4eg2hc6cDNrGOdkUahvLpka1Nu5pGKNdiAoB2TJBvQAVxmCdRX8ax8j76uE7nTBXEp
         xh0ef8Pj8NROZr7DpDqe5BBaBItjFEhM+ZrlVNEnHUYOZaGRAtw5Jw36GOKkaIhH5Fjn
         fmUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793330640; x=1793935440;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SvbLrMrllkAzaqzfSACQszj9FmLvV/lcvqpGXJeFaI4=;
        b=O66Os4TKPjShF3AoLOZ1gody3AnpOTZVPTgAjes7NmPsQgsE9I/ig2PtC9VkhSEuLF
         k1yHvockHW6H329x3Mh47OJx/Pv7IJz+NtXjE7ZnbB5CxCrYqkOg0kUZ5nZKQSHiqThi
         w8tmEpVsPk4LBxPSaASDGikeCCZos7224Rza/Oq+HbIuVs8+7TomqmgC+Mzn7pX3z5vI
         1ucWvfo5VSP9WuMfnsk6AQdKrIYCpkYzsYOyfBwApX1YB+YjxGiqdAkavJraNs7/Epkg
         HY0+g05WUuylhW8DrpY1MQZdM5Hn0SyhdwYFhJeNdwXQFUTe7jmPCM3Lp4R9KhgnmOsl
         dZ2w==
X-Gm-Message-State: AFq9FYI7pBAfVfeBNgSxiAv+GWalHivdX3Pr/mspKmUTdBR9GkaUVWwj
	qI4z5HSlOhoo+vjo9rzcZ5AdmXbkrX6XKRGbfvWQAajNBNQ2K1l1kfeaM56sBAxV
X-Gm-Gg: AYBFou2r+33MVXuuvLVpiBHKOLLtNziO7LfmuqmL5MsC0uPqWUjUcKNfd4hluG1VcY0
	f7p+8hS0vR/sSs3K3tCMzV6Legw1aJwvOaoSHFHd6JXL5YU5sUT0gFdk9X0S9lReUpPzK1gKDAi
	oQtn309VaTtsZpvwkTGTQ+0P3lJ6zLa+D86zIAP2Rrfr8eC7JNrNAPMFM2ebM3Kk5nlzntAIngI
	HsaQvRsMfrBnzZ+3OH0VmeAoUpEc6ymj0rH6rsYzeS3ZfjmSRL++Qjp5AM4oPYCwWoCMRmYkdTH
	AxBSzoqR8kCKcBhBeTXt4j8lGazBtyqoYcmbLN1lsKzmJgLt5aznetN+I3mUdyl+RjLvGOESNCp
	RqN68dn24CGKg4n7WNN8MvrUduceuwWz+eJj9GKhIk4+CZbhzFSTqJ4jEEJ40sYMNYJ+r+eUpod
	RA6yxYDb5j//jDvPWCS+DNvQvEMtyVO1fIP1IvF1gucNWpTGY7eRB1Sp+Xiij/3nUggenfzeQp6
	/q218W7xTAAyRUqp5VNyjr2refGAKT/1I+j5iyCCS3QgI7CiGyw11emrfYH0tpODPJO6MdaPGIZ
	W8jcQfx8UCtmbMhmvYOgWNUPrw==
X-Received: by 2002:a17:90b:5686:b0:3a4:b061:2765 with SMTP id 98e67ed59e1d1-3ae89724af0mr796731a91.15.1793330639536;
        Thu, 29 Oct 2026 20:23:59 -0700 (PDT)
Return-Path: <bbnpreetsingh@gmail.com>
Received: from ydev.. ([187.15.89.109])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae6e9426ffsm6639464a91.7.2026.10.29.20.23.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 20:23:59 -0700 (PDT)
From: Babanpreet Singh <bbnpreetsingh@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Babanpreet Singh <bbnpreetsingh@gmail.com>
Subject: [PATCH] maintainers.inc: assign libusb1 and stress-ng
Date: Fri, 30 Oct 2026 03:23:57 +0000
Message-ID: <20261030032357.7-1-bbnpreetsingh@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 30 Oct 2026 03:24:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248981
Content-Type: text/plain; charset="utf-8"

Volunteer to maintain libusb1 and stress-ng.

Signed-off-by: Babanpreet Singh <bbnpreetsingh@gmail.com>
---
 meta/conf/distro/include/maintainers.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 74db3e44e9..bf57067c87 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -422,7 +422,7 @@ RECIPE_MAINTAINER:pn-libucontext = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-libunistring = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-libunwind = "Bruce Ashfield <bruce.ashfield@gmail.com>"
 RECIPE_MAINTAINER:pn-liburcu = "Wang Mingyu <wangmy@fujitsu.com>"
-RECIPE_MAINTAINER:pn-libusb1 = "Unassigned <unassigned@yoctoproject.org>"
+RECIPE_MAINTAINER:pn-libusb1 = "Babanpreet Singh <bbnpreetsingh@gmail.com>"
 RECIPE_MAINTAINER:pn-libuv = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-libva = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-libva-initial = "Unassigned <unassigned@yoctoproject.org>"
@@ -818,7 +818,7 @@ RECIPE_MAINTAINER:pn-squashfs-tools = "Robert Yang <liezhi.yang@windriver.com>"
 RECIPE_MAINTAINER:pn-ssh-pregen-hostkeys = "Richard Purdie <richard.purdie@linuxfoundation.org>"
 RECIPE_MAINTAINER:pn-startup-notification = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-strace = "Kris Gavvala <kris.gavvala@windriver.com>"
-RECIPE_MAINTAINER:pn-stress-ng = "Unassigned <unassigned@yoctoproject.org>"
+RECIPE_MAINTAINER:pn-stress-ng = "Babanpreet Singh <bbnpreetsingh@gmail.com>"
 RECIPE_MAINTAINER:pn-subversion = "Richard Purdie <richard.purdie@linuxfoundation.org>"
 RECIPE_MAINTAINER:pn-sudo = "Chen Qi <Qi.Chen@windriver.com>"
 RECIPE_MAINTAINER:pn-swig = "Unassigned <unassigned@yoctoproject.org>"
-- 
2.43.0

