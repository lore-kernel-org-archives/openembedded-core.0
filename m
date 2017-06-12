Return-Path: <changhyeok.bae@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id 59F1478211
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Jun 2017 05:44:35 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id d5so3115677pfe.1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 11 Jun 2017 22:44:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=xfD+M94z2uU4R4u7dKM7SksL7YomdCRJgbJqCHlO0ks=;
	b=jOCeItcMGq5oB5gvUV+/fXp52IrejJaJOHeVCBnnPnKVncu3YNcRZz3qXF0VrImzlW
	M0MXhVwjNf2RWqTv+HzJK0Zq0Cu/PqjI6WtcOhMOOkdLkIhTDbmfP2zLIhX95ZKzFs2K
	gRFYNV3ZN/NE9XjOWZfnZihp1B1NqFOPvug4VSvEK+9PJSmYkYbZQfZ05Raso6PzhY7L
	iFvXfzuS1JQva4dZ5f+vgdEX3kQ6kRFkkyZRqlsLwBUlTW4gtYmZMb0fty9LREZUcDLi
	lpg2F6ZxYP8fPFKkaMv9KuzVaNUTCvXE2nOZu1V7+NX0Vw6kwKHXhQ91x7oYL79vMBAN
	g2WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=xfD+M94z2uU4R4u7dKM7SksL7YomdCRJgbJqCHlO0ks=;
	b=oYgMrsDwKD4XBRAC9gKKhBrQRQQrhtfb1y6jiuGeOxSqiRLHnDjZgLRX/wnzHDYNEt
	zfI4uVtzLq+RAnYRLEmSJhAffzzYRbW5PCXVWRIxKRdsxDuYolQbS4rJJRLvNZETggb6
	jePNs/csQf7ABKrP6+DD2aCzAe3cYfLqAD5P4/ZQXAnqWzRadPf2Q0AwVMYEODK/8lOD
	b8amG52G9nQPZQyjpO96CVXRLIlBdBlZIUX/gzkLH+JdBUF70/VOTc4DZ40X67U0WjZJ
	8ydM7xMsnwPbLP4u7fKdE1pXex/pgSBTAyDXUxMzqFwaFXATvTQxE3CgN+nAMdDL5iDu
	98OQ==
X-Gm-Message-State: AODbwcA88N75Mi1MoinYRtUFCpgDa21wI6iocTsjtDwcl/Vaa6TnKKvR
	IpjufXVaHycFU7De
X-Received: by 10.84.142.129 with SMTP id 1mr53372371plx.84.1497246276237;
	Sun, 11 Jun 2017 22:44:36 -0700 (PDT)
Received: from ip-172-31-15-204.ap-northeast-2.compute.internal
	(ec2-13-124-88-129.ap-northeast-2.compute.amazonaws.com.
	[13.124.88.129]) by smtp.gmail.com with ESMTPSA id
	a187sm16011875pge.45.2017.06.11.22.44.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 11 Jun 2017 22:44:35 -0700 (PDT)
From: Changhyeok Bae <changhyeok.bae@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 12 Jun 2017 05:44:30 +0000
Message-Id: <1497246270-17253-1-git-send-email-changhyeok.bae@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH v2] iproute2: Upgrade 4.10.0 -> 4.11.0
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
X-List-Received-Date: Mon, 12 Jun 2017 05:44:36 -0000

0001-ip-Remove-unneed-header.patch is to fix build error
built with musl.

Signed-off-by: Changhyeok Bae <changhyeok.bae@gmail.com>
---
 .../iproute2/0001-ip-Remove-unneed-header.patch    | 30 ++++++++++++++++++++++
 .../{iproute2_4.10.0.bb => iproute2_4.11.0.bb}     |  5 ++--
 2 files changed, 33 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-connectivity/iproute2/iproute2/0001-ip-Remove-unneed-header.patch
 rename meta/recipes-connectivity/iproute2/{iproute2_4.10.0.bb => iproute2_4.11.0.bb} (69%)

diff --git a/meta/recipes-connectivity/iproute2/iproute2/0001-ip-Remove-unneed-header.patch b/meta/recipes-connectivity/iproute2/iproute2/0001-ip-Remove-unneed-header.patch
new file mode 100644
index 0000000..a9f8db6
--- /dev/null
+++ b/meta/recipes-connectivity/iproute2/iproute2/0001-ip-Remove-unneed-header.patch
@@ -0,0 +1,30 @@
+From f58fc99c88a54135e55a6e0956ce8ae71078d1cc Mon Sep 17 00:00:00 2001
+From: Changhyeok Bae <changhyeok.bae@gmail.com>
+Date: Mon, 12 Jun 2017 04:29:07 +0000
+Subject: [PATCH] ip: Remove unneed header
+
+Fix redefinition of struct ethhdr with a suitably patched musl libc
+that suppresses the kernel if_ether.h.
+
+Signed-off-by: Changhyeok Bae <changhyeok.bae@gmail.com>
+
+Upstream-Status: Submitted [netdev@vger.kernel.org]
+---
+ ip/iplink_bridge.c | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/ip/iplink_bridge.c b/ip/iplink_bridge.c
+index 818b43c..f065b22 100644
+--- a/ip/iplink_bridge.c
++++ b/ip/iplink_bridge.c
+@@ -15,7 +15,6 @@
+ #include <netinet/in.h>
+ #include <linux/if_link.h>
+ #include <linux/if_bridge.h>
+-#include <netinet/ether.h>
+ #include <net/if.h>
+ 
+ #include "rt_names.h"
+-- 
+2.7.4
+
diff --git a/meta/recipes-connectivity/iproute2/iproute2_4.10.0.bb b/meta/recipes-connectivity/iproute2/iproute2_4.11.0.bb
similarity index 69%
rename from meta/recipes-connectivity/iproute2/iproute2_4.10.0.bb
rename to meta/recipes-connectivity/iproute2/iproute2_4.11.0.bb
index 063d467..dbd0545 100644
--- a/meta/recipes-connectivity/iproute2/iproute2_4.10.0.bb
+++ b/meta/recipes-connectivity/iproute2/iproute2_4.11.0.bb
@@ -5,10 +5,11 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/net/${BPN}/${BP}.tar.xz \
            file://0001-iproute2-de-bash-scripts.patch \
            file://0001-libc-compat.h-add-musl-workaround.patch \
            file://0001-include-stdint.h-explicitly-for-UINT16_MAX.patch \
+           file://0001-ip-Remove-unneed-header.patch \
           "
 
-SRC_URI[md5sum] = "b94a2b0edefaeac124dc8f5d006931b9"
-SRC_URI[sha256sum] = "22b1e1c1fc704ad35837e5a66103739727b8b48ac90b48c13f79b7367ff0a9a8"
+SRC_URI[md5sum] = "7a9498de88bcca95c305df6108ae197e"
+SRC_URI[sha256sum] = "72671028bda696d0cb8f48ec8e702581c3a501caeed33eec3a81d7041cbc8026"
 
 # CFLAGS are computed in Makefile and reference CCOPTS
 #
-- 
2.7.4


