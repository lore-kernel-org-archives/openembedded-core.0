Received: from mga07.intel.com (mga07.intel.com [])
 by mx.groups.io with SMTP id smtpd.web11.29836.1607916926312113884
 for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Dec 2020 19:35:26 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: DSod9ZSL5mrDjuSsw5vCMof3BQ7k5lcfvqQINFg5EI944jp4fekiAesbKhvcOHsbBwS3p/Ev/3
 lL9/LgwjswQA==
X-IronPort-AV: E=McAfee;i="6000,8403,9834"; a="238752350"
X-IronPort-AV: E=Sophos;i="5.78,417,1599548400"; 
   d="scan'208";a="238752350"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2020 19:35:22 -0800
IronPort-SDR: VASs51o6m19XHWtcbWPnP/eOiNVdj0Sd2l3wn7IrEHZdSnZfHt4PAACWL01UCdDqQ4Zp0Ng06f
 RFG1KRxs5jDQ==
X-IronPort-AV: E=Sophos;i="5.78,417,1599548400"; 
   d="scan'208";a="447670742"
Received: from gohpeibo-mobl.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.173.90])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2020 19:35:21 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 01/19] libsdl2: Add directfb to PACKAGECONFIG rdepends
Date: Mon, 14 Dec 2020 11:34:58 +0800
Message-Id: <bcc2df0f95d173d6ec91ac9ff9fd4ed8b0a64a55.1607916826.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1607916826.git.anuj.mittal@intel.com>
References: <cover.1607916826.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mark Jonas <toertel@gmail.com>

PACKAGECONFIG[directfb] already adds directfb to the build
dependencies. But the automatically generated runtime
dependencies do not add the directfb package to the runtime
dependencies. Most likely this happens because libsdl2 does not link
against directfb but uses dlopen() or similar. Thus, the runtime
dependency to directfb needs to be declared explicitly.

Signed-off-by: Mark Jonas <toertel@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 62d3cbe7c8261c1c875ff6da11572409262aaf02)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-graphics/libsdl2/libsdl2_2.0.12.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/libsdl2/libsdl2_2.0.12.bb b/meta/recipes-graphics/libsdl2/libsdl2_2.0.12.bb
index 0b75eb0c1d..1513746492 100644
--- a/meta/recipes-graphics/libsdl2/libsdl2_2.0.12.bb
+++ b/meta/recipes-graphics/libsdl2/libsdl2_2.0.12.bb
@@ -57,7 +57,7 @@ PACKAGECONFIG ??= " \
 "
 PACKAGECONFIG[alsa]       = "--enable-alsa --disable-alsatest,--disable-alsa,alsa-lib,"
 PACKAGECONFIG[arm-neon]   = "--enable-arm-neon,--disable-arm-neon"
-PACKAGECONFIG[directfb]   = "--enable-video-directfb,--disable-video-directfb,directfb"
+PACKAGECONFIG[directfb]   = "--enable-video-directfb,--disable-video-directfb,directfb,directfb"
 PACKAGECONFIG[gles2]      = "--enable-video-opengles,--disable-video-opengles,virtual/libgles2"
 PACKAGECONFIG[jack]       = "--enable-jack,--disable-jack,jack"
 PACKAGECONFIG[kmsdrm]     = "--enable-video-kmsdrm,--disable-video-kmsdrm,libdrm virtual/libgbm"
-- 
2.29.2

