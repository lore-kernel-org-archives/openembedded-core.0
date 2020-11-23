Received: from mga07.intel.com (mga07.intel.com [])
 by mx.groups.io with SMTP id smtpd.web09.36702.1606144038537265324
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Nov 2020 07:07:27 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: awgjdQWp745Jn/cqj25mFF1q4KC6KggVYPFildDkKF4jZW/9z43eA+szVGhK7EkecNLz17Fo6m
 oS15JTQ81t8w==
X-IronPort-AV: E=McAfee;i="6000,8403,9813"; a="235920737"
X-IronPort-AV: E=Sophos;i="5.78,363,1599548400"; 
   d="scan'208";a="235920737"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2020 07:07:26 -0800
IronPort-SDR: tR5b85uR8uH5v5DC/5fUUiLp5FWb8WuiiiUIzwOX2jes01gPakJUmvaXfAWgDRaH7BBYQXGJR7
 10BxDhGsGzqg==
X-IronPort-AV: E=Sophos;i="5.78,363,1599548400"; 
   d="scan'208";a="361475228"
Received: from kpteh-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.215.244.15])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2020 07:07:25 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 16/21] weston-init: Fix incorrect idle-time setting
Date: Mon, 23 Nov 2020 23:06:46 +0800
Message-Id: <c7cd893088bc82466bf1843c292731eb5992467b.1606111370.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <cover.1606111370.git.anuj.mittal@intel.com>
References: <cover.1606111370.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Alistair <alistair@alistair23.me>

Signed-off-by: Alistair Francis <alistair@alistair23.me>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 84b3a6b7bd73ebad90865ee4351578c2109358fb)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-graphics/wayland/weston-init.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/wayland/weston-init.bb b/meta/recipes-graphics/wayland/weston-init.bb
index b7a99be646..1eee0d3c71 100644
--- a/meta/recipes-graphics/wayland/weston-init.bb
+++ b/meta/recipes-graphics/wayland/weston-init.bb
@@ -51,7 +51,7 @@ do_install() {
 	fi
 
 	if [ "${@bb.utils.contains('PACKAGECONFIG', 'no-idle-timeout', 'yes', 'no', d)}" = "yes" ]; then
-		echo "idle-time=0" >> ${D}${sysconfdir}/xdg/weston/weston.ini
+		sed -i -e "/^\[core\]/a idle-time=0" ${D}${sysconfdir}/xdg/weston/weston.ini
 	fi
 }
 
-- 
2.28.0

