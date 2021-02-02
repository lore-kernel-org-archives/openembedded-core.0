Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by mx.groups.io with SMTP id smtpd.web11.45304.1612226350333547810
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Feb 2021 16:39:10 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.93, mailfrom: khairul.rohaizzat.jamaluddin@intel.com)
IronPort-SDR: 7tQfek9ZFYCNew6wjczC54T1kVpZKpHKHV4Kj2v+KrThJ3UAMACGw7asg8LFN1OI7Yhmx2J0f4
 9TE4VWR8RQXA==
X-IronPort-AV: E=McAfee;i="6000,8403,9882"; a="177266744"
X-IronPort-AV: E=Sophos;i="5.79,393,1602572400"; 
   d="scan'208";a="177266744"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2021 16:39:09 -0800
IronPort-SDR: mmeqvNGuMOuPem8ZhRmG58c50cEQp9CRpHsqJtR4kQdhYzltcIWO6n63PNU+Lq8ts+L3YTWByf
 EJYV4ZhqkHGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,393,1602572400"; 
   d="scan'208";a="405953137"
Received: from andromeda02.png.intel.com ([10.221.183.11])
  by fmsmga004.fm.intel.com with ESMTP; 01 Feb 2021 16:39:08 -0800
From: "Jamaluddin, Khairul Rohaizzat" <khairul.rohaizzat.jamaluddin@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] qemu: whitelist CVE-2020-15863
Date: Tue,  2 Feb 2021 08:39:07 +0800
Message-Id: <1612226347-65529-1-git-send-email-khairul.rohaizzat.jamaluddin@intel.com>
X-Mailer: git-send-email 2.7.4

From: Khairul Rohaizzat Jamaluddin <khairul.rohaizzat.jamaluddin@intel.com>

It is an reported as to affect on rc0 release of qemu-5.1.0
https://nvd.nist.gov/vuln/detail/CVE-2020-15863

It was already patched in
https://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?id=d3c60cde03fd7de11776ec04ff50c61b6e1f6140

Signed-off-by: Khairul Rohaizzat Jamaluddin <khairul.rohaizzat.jamaluddin@intel.com>
---
 meta/recipes-devtools/qemu/qemu.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index c894b81..38f228b 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -35,6 +35,9 @@ UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
 SRC_URI[sha256sum] = "cb18d889b628fbe637672b0326789d9b0e3b8027e0445b936537c78549df17bc"
 
+#affected 5.1rc0 but fixed in 5.1
+CVE_CHECK_WHITELIST += "CVE-2020-15863"
+
 SRC_URI_append_class-target = " file://cross.patch"
 SRC_URI_append_class-nativesdk = " file://cross.patch"
 
-- 
2.7.4

