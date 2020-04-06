Received: from mga14.intel.com (mga14.intel.com [])
 by mx.groups.io with SMTP id smtpd.web11.12871.1586185918252682432
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Apr 2020 08:12:00 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: CzdgujKj372x1ciA1ZzvXiNlCYeGhdxyIun2OdehnYseHUAqr1LbaH85wlAUmCXi9FKbCg1FgM
 zhoDC/63yJ8w==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2020 08:12:00 -0700
IronPort-SDR: RZ+s/eaSsErqGjOpsLYMoIlIXQu0cM6bpvMYL8ydoEXq0qgSnyTZM/k+9KR3Eu4xfiKy1/EnuC
 f59bWCWrCnnA==
X-IronPort-AV: E=Sophos;i="5.72,351,1580803200"; 
   d="scan'208";a="424391119"
Received: from anmitta2-mobl1.gar.corp.intel.com ([10.249.70.63])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2020 08:11:58 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [zeus][PATCH 02/13] waffle: no need to depend on target python3
Date: Mon,  6 Apr 2020 23:11:30 +0800
Message-Id: <7b4f6a4c7c5bcb4479c7e2e7eca733065cb40464.1586185832.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1586185832.git.anuj.mittal@intel.com>
References: <cover.1586185832.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Marek Vasut <marex@denx.de>

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Ross Burton <ross.burton@intel.com>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-graphics/waffle/waffle_1.6.0.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-graphics/waffle/waffle_1.6.0.bb b/meta/recipes-graphics/waffle/waffle_1.6.0.bb
index 8a1d5748f6..82cead9ad1 100644
--- a/meta/recipes-graphics/waffle/waffle_1.6.0.bb
+++ b/meta/recipes-graphics/waffle/waffle_1.6.0.bb
@@ -35,3 +35,8 @@ PACKAGECONFIG[x11-egl] = "-Dx11_egl=enabled,-Dx11_egl=disabled,virtual/${MLPREFI
 PACKAGECONFIG[surfaceless-egl] = "-Dsurfaceless_egl=enabled,-Dsurfaceless_egl=disabled,virtual/${MLPREFIX}libgl"
 
 # TODO: optionally build manpages and examples
+
+# Unset these to stop python trying to report the target Python setup
+_PYTHON_SYSCONFIGDATA_NAME[unexport] = "1"
+STAGING_INCDIR[unexport] = "1"
+STAGING_LIBDIR[unexport] = "1"
-- 
2.25.1

