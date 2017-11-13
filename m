Return-Path: <changhyeok.bae@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id EAE8178687
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Nov 2017 16:06:23 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id b189so9068339wmd.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Nov 2017 08:06:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=sFPGMFUhGKYEJsNM0WqJ7zdc5BPx4Dz3jtMap+2ZldU=;
	b=ZrY+/7FKIvnEMIYM4D6DHxZH1AopSUMTarI1PspqbsJ8pr5ubBwFJWqGHc1lS0c0WY
	h1B73Ft9TNX3DzhKivj9S3eG4g9FHYdXj8yX8VzhhiXN67H7Dq9zS5lX7++WZh1ja1d8
	qMwSzb1FEn+a+piagiuZj9Vg8Ir+nNylMBSOqb3lfL/OjzD05ty8XbaPWF5MVgKPmYqb
	uWl0TPacNYDeuAu+ka3yFWTV9RQvLSh/tFUIBd8NjQ+m2hAtCJ419omVG2I2vQBA1RdG
	wxzS25bj3T2RbTsS2uZ3chKmKK43WJHzIsb+ei/mUyRUV+CATXQyFjDFWV54t2EYtVio
	jXag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=sFPGMFUhGKYEJsNM0WqJ7zdc5BPx4Dz3jtMap+2ZldU=;
	b=tPY/vRpxsPd5jKQGbvTCqZWWfoZb4F6El93jMm7RS6pICzwFqxQ2+tIFIT8lYrJNRw
	5ANz3mtW0W9X5RK/7VsXj031pPWnr/rMtcTeNxqyPwy5mXn9wIPoxk3zCBCyLBmtOrBC
	jA98g4wcnRpIOKAc7HgUlpt2Hf+nnm8UVMcMnynySPBqbuF+3PgGTwfQUr6COzrHLSCL
	6sJw2wIq52Rg1np82vaLd7LRdRYJYVCnFr8ay1irJtvxL0Df7xP5Tyy0y2uHt4qD2n38
	s901wWEzXVlgqabnak6cVHa2BzTf92KWzpWvp81CJcrH9+5eBY9GjSwLdD2c0lvkEzez
	xZLw==
X-Gm-Message-State: AJaThX58KVPSE4+URPIQfBGkPHgC1+O4eYdJbB2v4QbOcHd/wqkRtD+a
	ocCkBUAjBqSPLoxJHTJ9RRdmPw==
X-Google-Smtp-Source: AGs4zMZbhCP8lp0RYtcQqQUcZfP7py7lN6Pci5iIEfSigLJzzW7GPA434H0euCwiVC0lsAGaIRAcXQ==
X-Received: by 10.80.207.195 with SMTP id i3mr13676745edk.55.1510589184158;
	Mon, 13 Nov 2017 08:06:24 -0800 (PST)
Received: from ip-172-31-1-64.ap-northeast-2.compute.internal
	(ec2-13-124-121-69.ap-northeast-2.compute.amazonaws.com.
	[13.124.121.69]) by smtp.gmail.com with ESMTPSA id
	z56sm5172454edb.72.2017.11.13.08.06.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 13 Nov 2017 08:06:23 -0800 (PST)
From: Changhyeok Bae <changhyeok.bae@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 13 Nov 2017 16:06:16 +0000
Message-Id: <1510589176-84322-1-git-send-email-changhyeok.bae@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] iproute2: upgrade to 4.13
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
X-List-Received-Date: Mon, 13 Nov 2017 16:06:24 -0000

- 0001-include-stdint.h-explicitly-for-UINT16_MAX.patch is already
  applied to upstream.
- Rebase two patches.

Signed-off-by: Changhyeok Bae <changhyeok.bae@gmail.com>
---
 ...nclude-stdint.h-explicitly-for-UINT16_MAX.patch | 32 ----------------------
 .../iproute2/0001-ip-Remove-unneed-header.patch    | 16 +++++------
 .../iproute2/0001-iproute2-de-bash-scripts.patch   | 11 ++++----
 .../{iproute2_4.11.0.bb => iproute2_4.13.0.bb}     |  5 ++--
 4 files changed, 15 insertions(+), 49 deletions(-)
 delete mode 100644 meta/recipes-connectivity/iproute2/iproute2/0001-include-stdint.h-explicitly-for-UINT16_MAX.patch
 rename meta/recipes-connectivity/iproute2/{iproute2_4.11.0.bb => iproute2_4.13.0.bb} (66%)

diff --git a/meta/recipes-connectivity/iproute2/iproute2/0001-include-stdint.h-explicitly-for-UINT16_MAX.patch b/meta/recipes-connectivity/iproute2/iproute2/0001-include-stdint.h-explicitly-for-UINT16_MAX.patch
deleted file mode 100644
index eb0c0ab..0000000
--- a/meta/recipes-connectivity/iproute2/iproute2/0001-include-stdint.h-explicitly-for-UINT16_MAX.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 3c885d87befc706bb923933b9819de6fe2de897e Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 20 May 2017 14:03:19 -0700
-Subject: [PATCH] include stdint.h explicitly for UINT16_MAX)
-
-Fixes
-| tc_core.c:190:29: error: 'UINT16_MAX' undeclared (first use in this function); did you mean '__INT16_MAX__'?
-|    if ((sz >> s->size_log) > UINT16_MAX) {
-|                              ^~~~~~~~~~
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
-Upstream-Status: Pending
-
- tc/tc_core.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/tc/tc_core.c b/tc/tc_core.c
-index 7bbe0d7..821b741 100644
---- a/tc/tc_core.c
-+++ b/tc/tc_core.c
-@@ -12,6 +12,7 @@
- 
- #include <stdio.h>
- #include <stdlib.h>
-+#include <stdint.h>
- #include <unistd.h>
- #include <syslog.h>
- #include <fcntl.h>
--- 
-2.13.0
-
diff --git a/meta/recipes-connectivity/iproute2/iproute2/0001-ip-Remove-unneed-header.patch b/meta/recipes-connectivity/iproute2/iproute2/0001-ip-Remove-unneed-header.patch
index a9f8db6..a9027c5 100644
--- a/meta/recipes-connectivity/iproute2/iproute2/0001-ip-Remove-unneed-header.patch
+++ b/meta/recipes-connectivity/iproute2/iproute2/0001-ip-Remove-unneed-header.patch
@@ -1,6 +1,6 @@
-From f58fc99c88a54135e55a6e0956ce8ae71078d1cc Mon Sep 17 00:00:00 2001
+From 02ed10fc5215c4a32e6740b0a0c2439659be6801 Mon Sep 17 00:00:00 2001
 From: Changhyeok Bae <changhyeok.bae@gmail.com>
-Date: Mon, 12 Jun 2017 04:29:07 +0000
+Date: Mon, 13 Nov 2017 15:59:35 +0000
 Subject: [PATCH] ip: Remove unneed header
 
 Fix redefinition of struct ethhdr with a suitably patched musl libc
@@ -8,23 +8,23 @@ that suppresses the kernel if_ether.h.
 
 Signed-off-by: Changhyeok Bae <changhyeok.bae@gmail.com>
 
-Upstream-Status: Submitted [netdev@vger.kernel.org]
+Upstream-Status: Pending [netdev@vger.kernel.org]
 ---
  ip/iplink_bridge.c | 1 -
  1 file changed, 1 deletion(-)
 
 diff --git a/ip/iplink_bridge.c b/ip/iplink_bridge.c
-index 818b43c..f065b22 100644
+index cccdec1..f065b22 100644
 --- a/ip/iplink_bridge.c
 +++ b/ip/iplink_bridge.c
-@@ -15,7 +15,6 @@
+@@ -13,7 +13,6 @@
+ #include <stdlib.h>
+ #include <string.h>
  #include <netinet/in.h>
+-#include <netinet/ether.h>
  #include <linux/if_link.h>
  #include <linux/if_bridge.h>
--#include <netinet/ether.h>
  #include <net/if.h>
- 
- #include "rt_names.h"
 -- 
 2.7.4
 
diff --git a/meta/recipes-connectivity/iproute2/iproute2/0001-iproute2-de-bash-scripts.patch b/meta/recipes-connectivity/iproute2/iproute2/0001-iproute2-de-bash-scripts.patch
index 39c7d40..c3d3fea 100644
--- a/meta/recipes-connectivity/iproute2/iproute2/0001-iproute2-de-bash-scripts.patch
+++ b/meta/recipes-connectivity/iproute2/iproute2/0001-iproute2-de-bash-scripts.patch
@@ -5,14 +5,13 @@ de-bash these two scripts to make iproute2 not depend on bash.
 Upstream-Status: Pending
 
 Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
-
 ---
- ip/ifcfg |   15 ++++++++-------
- ip/rtpr  |    2 +-
+ ip/ifcfg | 15 ++++++++-------
+ ip/rtpr  |  2 +-
  2 files changed, 9 insertions(+), 8 deletions(-)
 
 diff --git a/ip/ifcfg b/ip/ifcfg
-index 083d9df..60bcf1f 100644
+index 30a2dc4..8677b2e 100644
 --- a/ip/ifcfg
 +++ b/ip/ifcfg
 @@ -1,12 +1,13 @@
@@ -43,7 +42,7 @@ index 083d9df..60bcf1f 100644
 -ip route add unreachable 255.255.255.255 >& /dev/null
 +ip route add unreachable 224.0.0.0/24 > /dev/null 2>&1
 +ip route add unreachable 255.255.255.255 > /dev/null 2>&1
- if [ `ip link ls $dev | grep -c MULTICAST` -ge 1 ]; then
+ if [ "`ip link ls $dev | grep -c MULTICAST`" -ge 1 ]; then
 -  ip route add 224.0.0.0/4 dev $dev scope global >& /dev/null
 +  ip route add 224.0.0.0/4 dev $dev scope global > /dev/null 2>&1
  fi
@@ -60,5 +59,5 @@ index c3629fd..674198d 100644
  exec tr "[\\\\]" "[
  ]"
 -- 
-1.7.9.5
+2.7.4
 
diff --git a/meta/recipes-connectivity/iproute2/iproute2_4.11.0.bb b/meta/recipes-connectivity/iproute2/iproute2_4.13.0.bb
similarity index 66%
rename from meta/recipes-connectivity/iproute2/iproute2_4.11.0.bb
rename to meta/recipes-connectivity/iproute2/iproute2_4.13.0.bb
index dbd0545..32bf0d5 100644
--- a/meta/recipes-connectivity/iproute2/iproute2_4.11.0.bb
+++ b/meta/recipes-connectivity/iproute2/iproute2_4.13.0.bb
@@ -4,12 +4,11 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/net/${BPN}/${BP}.tar.xz \
            file://configure-cross.patch \
            file://0001-iproute2-de-bash-scripts.patch \
            file://0001-libc-compat.h-add-musl-workaround.patch \
-           file://0001-include-stdint.h-explicitly-for-UINT16_MAX.patch \
            file://0001-ip-Remove-unneed-header.patch \
           "
 
-SRC_URI[md5sum] = "7a9498de88bcca95c305df6108ae197e"
-SRC_URI[sha256sum] = "72671028bda696d0cb8f48ec8e702581c3a501caeed33eec3a81d7041cbc8026"
+SRC_URI[md5sum] = "69dc9e3ece3296890278f0de478330c8"
+SRC_URI[sha256sum] = "9cfb81edf8c8509e03daa77cf62aead01c4a827132f6c506578f94cc19415c50"
 
 # CFLAGS are computed in Makefile and reference CCOPTS
 #
-- 
2.7.4


