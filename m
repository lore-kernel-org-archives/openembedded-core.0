Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web12.19625.1597558791001951850
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Aug 2020 23:19:51 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 140.211.169.56, mailfrom: auh@auh.yoctoproject.org)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D8692E02021; Sat, 15 Aug 2020 23:19:50 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=BAYES_00,HELO_MISC_IP,
	MISSING_DATE,MISSING_MID,RDNS_NONE autolearn=no version=3.3.1
X-Spam-HAM-Report: 
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.5 MISSING_MID Missing Message-Id: header
	*  0.8 RDNS_NONE Delivered to internal network by a host with no rDNS
	*  1.4 MISSING_DATE Missing Date: header
	*  0.2 HELO_MISC_IP Looking for more Dynamic IP Relays
Received: from [172.29.10.111] (unknown [198.145.29.2])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8FE93E02026
	for <openembedded-core@lists.openembedded.org>; Sat, 15 Aug 2020 23:19:36 -0700 (PDT)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Changhyeok Bae <changhyeok.bae@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] iproute2: upgrading to 5.8.0 SUCCEEDED
Message-Id: <20200816061950.D8692E02021@yocto-www.yoctoproject.org>
Date: Sat, 15 Aug 2020 23:19:50 -0700 (PDT)
X-Groupsio-MsgNum: 141472
Content-Type: multipart/mixed; boundary="===============6588926460294505557=="

--===============6588926460294505557==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *iproute2* to *5.8.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-iproute2-upgrade-5.7.0-5.8.0.patch
    - check the changes to upstream patches and summarize them in the commit message,
    - compile an image that contains the package
    - perform some basic sanity tests
    - amend the patch and sign it off: git commit -s --reset-author --amend
    - send it to the appropriate mailing list

Alternatively, if you believe the recipe should not be upgraded at this time,
you can fill RECIPE_NO_UPDATE_REASON in respective recipe file so that
automatic upgrades would no longer be attempted.

Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper

--===============6588926460294505557==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-iproute2-upgrade-5.7.0-5.8.0.patch"

From b1e9825163949aa9a7280c3e3ef2a6c2848e0c63 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Sat, 15 Aug 2020 13:04:59 +0000
Subject: [PATCH] iproute2: upgrade 5.7.0 -> 5.8.0

---
 .../0001-devlink.c-add-missing-include.patch        | 13 +++++++------
 .../{iproute2_5.7.0.bb => iproute2_5.8.0.bb}        |  2 +-
 2 files changed, 8 insertions(+), 7 deletions(-)
 rename meta/recipes-connectivity/iproute2/{iproute2_5.7.0.bb => iproute2_5.8.0.bb} (79%)

diff --git a/meta/recipes-connectivity/iproute2/iproute2/0001-devlink.c-add-missing-include.patch b/meta/recipes-connectivity/iproute2/iproute2/0001-devlink.c-add-missing-include.patch
index f9580b7d44..6400051dda 100644
--- a/meta/recipes-connectivity/iproute2/iproute2/0001-devlink.c-add-missing-include.patch
+++ b/meta/recipes-connectivity/iproute2/iproute2/0001-devlink.c-add-missing-include.patch
@@ -1,23 +1,24 @@
-From 5df629d825df4ccc4283228bc0739da126326072 Mon Sep 17 00:00:00 2001
+From 1607d253990ee9e943b7303db9e2accdcfa08cfe Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Sat, 6 Jun 2020 18:00:13 +0000
 Subject: [PATCH] devlink.c: add missing include
 
 Upstream-Status: Pending
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+
 ---
  devlink/devlink.c | 1 +
  1 file changed, 1 insertion(+)
 
 diff --git a/devlink/devlink.c b/devlink/devlink.c
-index 16602ab..c278e6d 100644
+index 0982fae..93dc01c 100644
 --- a/devlink/devlink.c
 +++ b/devlink/devlink.c
-@@ -26,6 +26,7 @@
- #include <libmnl/libmnl.h>
- #include <netinet/ether.h>
+@@ -33,6 +33,7 @@
+ #include <sys/select.h>
+ #include <sys/socket.h>
  #include <sys/types.h>
 +#include <signal.h>
  
- #include "SNAPSHOT.h"
+ #include "version.h"
  #include "list.h"
diff --git a/meta/recipes-connectivity/iproute2/iproute2_5.7.0.bb b/meta/recipes-connectivity/iproute2/iproute2_5.8.0.bb
similarity index 79%
rename from meta/recipes-connectivity/iproute2/iproute2_5.7.0.bb
rename to meta/recipes-connectivity/iproute2/iproute2_5.8.0.bb
index 276afeab11..3a590f9122 100644
--- a/meta/recipes-connectivity/iproute2/iproute2_5.7.0.bb
+++ b/meta/recipes-connectivity/iproute2/iproute2_5.8.0.bb
@@ -5,7 +5,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/net/${BPN}/${BP}.tar.xz \
            file://0001-devlink.c-add-missing-include.patch \
            "
 
-SRC_URI[sha256sum] = "725dc7ba94aae54c6f8d4223ca055d9fb4fe89d6994b1c03bfb4411c4dd10f21"
+SRC_URI[sha256sum] = "cfcd1f890290f8c8afcc91d9444ad929b9252c16f9ab3f286c50dd3c59dc646e"
 
 # CFLAGS are computed in Makefile and reference CCOPTS
 #
-- 
2.17.1


--===============6588926460294505557==--
