Received: from mga09.intel.com (mga09.intel.com [])
 by mx.groups.io with SMTP id smtpd.web11.7722.1614918147768864035
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Mar 2021 20:22:30 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: RBKIwhM8EeMEiSlVzTKjXJ8G+gFCNuzsqUHMs5sbj4rJu1ddqoIWVkZOvXI5mYji3QbZ3O5QsQ
 Ea0ZDdfBw3pA==
X-IronPort-AV: E=McAfee;i="6000,8403,9913"; a="187671018"
X-IronPort-AV: E=Sophos;i="5.81,224,1610438400"; 
   d="scan'208";a="187671018"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2021 20:22:27 -0800
IronPort-SDR: wGXZdIbFi+rsvHWHO9aB5RAqed+jP2G3Qw4R8npf52qyl/Gg5xJBqXVGFr3HPNptVBKxZuZvxW
 z+mXSGWYAxjg==
X-IronPort-AV: E=Sophos;i="5.81,224,1610438400"; 
   d="scan'208";a="408128871"
Received: from selvan2x-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.147.249])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2021 20:22:25 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 21/52] linux-firmware: upgrade 20201218 -> 20210208
Date: Fri,  5 Mar 2021 12:20:57 +0800
Message-Id: <640acdfc770d8a6ed77eaaf7bece23a19eee96bf.1614917620.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1614917620.git.anuj.mittal@intel.com>
References: <cover.1614917620.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Richard Purdie <richard.purdie@linuxfoundation.org>

License file had a number of new additions for new firmware but no
new licenses that didn't already exist.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit eab46e65feae24311f0ee0cd05b7ebb2e3b07363)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 ...{linux-firmware_20201218.bb => linux-firmware_20210208.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20201218.bb => linux-firmware_20210208.bb} (99%)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20201218.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20210208.bb
similarity index 99%
rename from meta/recipes-kernel/linux-firmware/linux-firmware_20201218.bb
rename to meta/recipes-kernel/linux-firmware/linux-firmware_20210208.bb
index 700a79b118..59ce4d5124 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20201218.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20210208.bb
@@ -128,7 +128,7 @@ LIC_FILES_CHKSUM = "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
                     file://LICENCE.xc4000;md5=0ff51d2dc49fce04814c9155081092f0 \
                     file://LICENCE.xc5000;md5=1e170c13175323c32c7f4d0998d53f66 \
                     file://LICENCE.xc5000c;md5=12b02efa3049db65d524aeb418dd87ca \
-                    file://WHENCE;md5=03f0fad70b8b557b56084e3090198021 \
+                    file://WHENCE;md5=ef0565762eac313c409567b59dff00b2 \
                     "
 
 # These are not common licenses, set NO_GENERIC_LICENSE for them
@@ -201,7 +201,7 @@ PE = "1"
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/kernel/firmware/${BPN}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "a1cc1ff72c739f312b095df589e9fd639fc81c3f8f7966377ea35222dc94c04b"
+SRC_URI[sha256sum] = "1bcb1a3944c361507754a7d26ccff40ffc28d1fb93bce711d67da26b33e785b7"
 
 inherit allarch
 
-- 
2.29.2

