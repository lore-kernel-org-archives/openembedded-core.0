Received: from mga12.intel.com (mga12.intel.com [])
 by mx.groups.io with SMTP id smtpd.web10.10233.1608736733177759099
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Dec 2020 07:18:55 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: JyRzSqSLWy+H+1iiHyK7OocVyyrNZxVxvntWqE+gDYrjyqiG7sFO5DdC3QphBbWpByuRcKPwsx
 n8IkOp4ROC7g==
X-IronPort-AV: E=McAfee;i="6000,8403,9843"; a="155235941"
X-IronPort-AV: E=Sophos;i="5.78,441,1599548400"; 
   d="scan'208";a="155235941"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2020 07:18:54 -0800
IronPort-SDR: gaIXHziIS1qIhJWlW+WYTGRKHTyRx0qG9O/lLrX5GAePl7gYE5qnEAUR978iHX2TkC19Q33V5n
 fIwM/RstwMAw==
X-IronPort-AV: E=Sophos;i="5.78,441,1599548400"; 
   d="scan'208";a="374027478"
Received: from btang1-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.249.75.173])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2020 07:18:53 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 02/35] linux-firmware: upgrade 20201022 -> 20201118
Date: Wed, 23 Dec 2020 23:18:12 +0800
Message-Id: <27983f070c5e168155e82648c6465c9f1d874fcc.1608735614.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1608735614.git.anuj.mittal@intel.com>
References: <cover.1608735614.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

License-Update: firmware versions/filenames
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit c8b2f1e058e83e3f6676189fd77fcfad3acd019f)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 ...{linux-firmware_20201022.bb => linux-firmware_20201118.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20201022.bb => linux-firmware_20201118.bb} (99%)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20201022.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20201118.bb
similarity index 99%
rename from meta/recipes-kernel/linux-firmware/linux-firmware_20201022.bb
rename to meta/recipes-kernel/linux-firmware/linux-firmware_20201118.bb
index 93b9d5308a..5de7157f3a 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20201022.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20201118.bb
@@ -126,7 +126,7 @@ LIC_FILES_CHKSUM = "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
                     file://LICENCE.xc4000;md5=0ff51d2dc49fce04814c9155081092f0 \
                     file://LICENCE.xc5000;md5=1e170c13175323c32c7f4d0998d53f66 \
                     file://LICENCE.xc5000c;md5=12b02efa3049db65d524aeb418dd87ca \
-                    file://WHENCE;md5=daf28db5d6353de0a886f08106cffa22 \
+                    file://WHENCE;md5=ef221e03fc58f4d34a132b801dfa1d68 \
                     "
 
 # These are not common licenses, set NO_GENERIC_LICENSE for them
@@ -198,7 +198,7 @@ PE = "1"
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/kernel/firmware/${BPN}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "bf586e0beb4c65f22bf0a79811f259aa0a5a7cc9f70eebecb260525b6914cef7"
+SRC_URI[sha256sum] = "863d5a31da725b856a917280d1e3014929b3bc3d4e6e5faecf530c13afb7e2b9"
 
 inherit allarch
 
-- 
2.29.2

