Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f170.google.com (mail-pf0-f170.google.com
	[209.85.192.170])
	by mail.openembedded.org (Postfix) with ESMTP id 1DD037824F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 May 2017 16:15:09 +0000 (UTC)
Received: by mail-pf0-f170.google.com with SMTP id n23so15693961pfb.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 May 2017 09:15:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=JWpKXuiUBMlxqpxTZx9zGKWP7FsVqtqCRjqzZQPVvIk=;
	b=XTu5imOUsEKbgz2GBDvkjvthnvw4n/l/RIK5MfmkHMdoLL+JcqF13zq52+/oP6g7FZ
	qjPtXwnHenQzn5S1mCPiktjwffukv0vhkUotekJwZN2sGlG6FTon0XuTQjpguDdKJD9D
	mG8Q4cCV6cRAFLN17pdA2U21Z9KnaSRnnWzjCcU5APByemgbUH1AmYqxb5sR2AfX8h5h
	xWm6DkxTzRNFnuK+r5SM6GS2HfNJvZg2tjRQAk5tGooZHQ9KmYI+LjZN0b7OPfp6pbVC
	HQytuai81YrMajvEuEfTi+mi5b9S6ArWWT9Qq9pvpIYm2n1xImGcZVuxNj3PQKfNeGd2
	rKfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=JWpKXuiUBMlxqpxTZx9zGKWP7FsVqtqCRjqzZQPVvIk=;
	b=Qjr6K4eUWd5FKGDoFC3+NLJ8vk/ml2jtUCt5L9QiyC82ffcpJOjEErSp2I2AxHMTmU
	ULA3+A+FMEIEGt/Sw6+0IWEi3zO31txroR1nelzRaUiokkij5DImKznDUoutK5thB0Ox
	Jo4eqEKkO15BvBkSOF2RYwXCyjEZgxtoO+cP9DfnL3/KcabLQZmCudBDvIM1jl4ioFIX
	E1ZsWKpxJS3/A+5kNpel38qDoKAyuRshVWaPgMHMyy6uDqb/Ok5twtglPgc04yw41lmn
	iICDd9cxQjhS8Y/Js43xcYmqYtOEMYiszzvPzfrkSyMKnm4E6tmYmFJRDWoJH24xQU4M
	cV+w==
X-Gm-Message-State: AODbwcBKSms4yEL1kqGzOD500PiQxrWAUVUv6AwTOkNn35TKIaN3h628
	A5JSgXNjbgk9Wg==
X-Received: by 10.84.224.1 with SMTP id r1mr57935430plj.78.1495815311013;
	Fri, 26 May 2017 09:15:11 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::63fb])
	by smtp.gmail.com with ESMTPSA id
	f72sm2723752pfe.62.2017.05.26.09.15.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 26 May 2017 09:15:09 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 26 May 2017 09:15:00 -0700
Message-Id: <20170526161501.30122-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.0
Subject: [PATCH 1/2] nfs-utils: Fix build error due to missing stdint.h> include
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
X-List-Received-Date: Fri, 26 May 2017 16:15:10 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...nclude-stdint.h-for-UINT16_MAX-definition.patch | 27 ++++++++++++++++++++++
 .../nfs-utils/nfs-utils_2.1.1.bb                   |  1 +
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
diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils_2.1.1.bb b/meta/recipes-connectivity/nfs-utils/nfs-utils_2.1.1.bb
index bdf0efa330..d917c4d713 100644
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils_2.1.1.bb
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils_2.1.1.bb
@@ -31,6 +31,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/nfs-utils/${PV}/nfs-utils-${PV}.tar.x
            file://nfs-utils-Do-not-pass-CFLAGS-to-gcc-while-building.patch \
            file://nfs-utils-debianize-start-statd.patch \
            file://bugfix-adjust-statd-service-name.patch \
+           file://0001-include-stdint.h-for-UINT16_MAX-definition.patch \
 "
 
 SRC_URI[md5sum] = "59dfcb2e6254b129f901f40c86086b13"
-- 
2.13.0


