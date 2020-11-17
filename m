Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by mx.groups.io with SMTP id smtpd.web10.4722.1605596166868164834
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Nov 2020 22:56:06 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.151, mailfrom: siew.hoon.lim@intel.com)
IronPort-SDR: 08k8iq1pGwAAj0elUnTglJ5OSeIrXHA/S0bsSj7p/GV2guwNxYtRI64FlVQaGysNOJKyw3lKdh
 2i+h1RrLKzqA==
X-IronPort-AV: E=McAfee;i="6000,8403,9807"; a="150723119"
X-IronPort-AV: E=Sophos;i="5.77,484,1596524400"; 
   d="scan'208";a="150723119"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2020 22:56:05 -0800
IronPort-SDR: 87JCiySVWNoFnZ3EaswR6zVTggBwx45BhwlRX7JErucbC3bJNgMpAc8s4w2RhmmMknoVQ3xznK
 Tnj+8FrVGr4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,484,1596524400"; 
   d="scan'208";a="367985879"
Received: from slim50-desktop.png.intel.com ([10.221.79.121])
  by orsmga007.jf.intel.com with ESMTP; 16 Nov 2020 22:56:04 -0800
From: "Lim Siew Hoon" <siew.hoon.lim@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-Core][dunfell][PATCH] glib-2.0: correct build with latest meson
Date: Tue, 17 Nov 2020 14:55:25 +0800
Message-Id: <20201117065525.14353-1-siew.hoon.lim@intel.com>
X-Mailer: git-send-email 2.17.1

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

(cherry picked from commit 6a91d2b7d463abfd8f39a9f9d5ddde40a939d6e
from https://github.com/openembedded/openembedded-core.git)

To solve meson upgrade from 0.53.2 to 0.55.1 causing glib-2.0 bitbake
failure. And this code changed does not causing glib-2.0 bitbake failing
if still using existing meson 0.53.2 from dunfell.

Signed-off-by: Lim Siew Hoon <siew.hoon.lim@intel.com>
---
 meta/recipes-core/glib-2.0/glib-2.0/meson.cross.d/common-linux | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/glib-2.0/glib-2.0/meson.cross.d/common-linux b/meta/recipes-core/glib-2.0/glib-2.0/meson.cross.d/common-linux
index 83596e0efb..adad7e62ee 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0/meson.cross.d/common-linux
+++ b/meta/recipes-core/glib-2.0/glib-2.0/meson.cross.d/common-linux
@@ -2,4 +2,4 @@
 have_proc_self_cmdline = true
 
 [binaries]
-env = "/usr/bin/env"
+env = '/usr/bin/env'
-- 
2.17.1

