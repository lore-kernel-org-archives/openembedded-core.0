Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f174.google.com (mail-pf0-f174.google.com
	[209.85.192.174])
	by mail.openembedded.org (Postfix) with ESMTP id 0F38877F86
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 May 2017 05:01:14 +0000 (UTC)
Received: by mail-pf0-f174.google.com with SMTP id 9so70335691pfj.1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 21 May 2017 22:01:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=BPi6W/SyTjvEb9moU+4djUY7BBq+FUZgfXF/U7OwOJ0=;
	b=tV9C0a3+2FleGprvZUf4jAIw+IG8vc6MHlWQj0FmOFB+4oEyRhrk/IFSsi5odbjs4X
	mubILOHIoZwycHS31eQVrpA6yt0Yn1OHMDOTnEtz5T/BPhbtTeAT4WjWyLq2dtUBxdT6
	aFHuRwfRkMAf2cUs6M1UqzJZX1jNAzCaP5WaxEhd50efft0QfP9nsdeqbdNUoYpWaPWl
	H3A8AgBLuVRoKVe8gj+s+bGTIby3iilX3+qE/Y2m9aCJ9xRsjrsGEVffGqcImKmCk6Y+
	aeCa1acKa5QWtA5E7krIals7a4RnEYqD/UqDbRIbipEMY+iU2fNjzwK+0GqNsj3sTnlP
	41WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=BPi6W/SyTjvEb9moU+4djUY7BBq+FUZgfXF/U7OwOJ0=;
	b=kEKqzEaDkus+LWTPwi8fsFFXjjdGXsXZYS5ieSacpZxXlDvExQshDzmyGwDR/g4WoU
	uq8xk7kvXO5QLmn0LoYXXt50U8k9XwUt8N/mdZb7gG/cnHuCiPALAIddYnj7D/GAilXx
	i3tx27cbHIgCjGFPJoqifxvAxHLmekzBuKHezuJ8Hd72OhFKj/sFksfK7dYBcRgW7706
	Y8t+7az3J+9dgpk3qWvatUyzzdZtL72osznTYIi0Eg+rrYM+R7XWTaN0hE3dZTWfvcTA
	DUxwzn/TfD44F/syRrasMPgNIqOq0hRwPAvZTd6wWfiMempthvuzChFhQD9Ii4KXENuK
	1ufQ==
X-Gm-Message-State: AODbwcAwNUMczF2/NgG2LIduJF3G71QYRSbqEwLol4bzqMbH4m3zHt5D
	fHP23V0nTH8cJA==
X-Received: by 10.98.245.155 with SMTP id b27mr23209137pfm.181.1495429276449; 
	Sun, 21 May 2017 22:01:16 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::63fb])
	by smtp.gmail.com with ESMTPSA id
	t13sm28839596pfa.126.2017.05.21.22.01.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 21 May 2017 22:01:15 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 21 May 2017 22:00:40 -0700
Message-Id: <20170522050042.42403-13-raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.0
In-Reply-To: <20170522050042.42403-1-raj.khem@gmail.com>
References: <20170522050042.42403-1-raj.khem@gmail.com>
Subject: [PATCH 13/15] nfs-utils: Fix build error due to missing stdint.h> include
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 22 May 2017 05:01:15 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...nclude-stdint.h-for-UINT16_MAX-definition.patch | 27 ++++++++++++++++++++++
 .../nfs-utils/nfs-utils_1.3.4.bb                   |  1 +
 2 files changed, 28 insertions(+)
 create mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/0001-include-stdint.h-for-UINT16_MAX-definition.patch

diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-include-stdint.h-for-UINT16_MAX-definition.patch b/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-include-stdint.h-for-UINT16_MAX-definition.patch
new file mode 100644
index 0000000000..235a2c76fc
--- /dev/null
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-include-stdint.h-for-UINT16_MAX-definition.patch
@@ -0,0 +1,27 @@
+From 36b48057bce76dced335d67a2894a420967811c9 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 20 May 2017 14:07:53 -0700
+Subject: [PATCH] include stdint.h for UINT16_MAX definition
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Pending
+
+ support/nsm/rpc.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/support/nsm/rpc.c b/support/nsm/rpc.c
+index 4e5f40e..d91c6ea 100644
+--- a/support/nsm/rpc.c
++++ b/support/nsm/rpc.c
+@@ -40,6 +40,7 @@
+ 
+ #include <time.h>
+ #include <stdbool.h>
++#include <stdint.h>
+ #include <string.h>
+ #include <unistd.h>
+ #include <fcntl.h>
+-- 
+2.13.0
+
diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils_1.3.4.bb b/meta/recipes-connectivity/nfs-utils/nfs-utils_1.3.4.bb
index 4ca9ab2a3d..344695212c 100644
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils_1.3.4.bb
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils_1.3.4.bb
@@ -31,6 +31,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/nfs-utils/${PV}/nfs-utils-${PV}.tar.x
            file://nfs-utils-Do-not-pass-CFLAGS-to-gcc-while-building.patch \
            file://nfs-utils-debianize-start-statd.patch \
            file://bugfix-adjust-statd-service-name.patch \
+           file://0001-include-stdint.h-for-UINT16_MAX-definition.patch \
 "
 
 SRC_URI[md5sum] = "54e4119043ec8507a2a0e054cf2889a4"
-- 
2.13.0


