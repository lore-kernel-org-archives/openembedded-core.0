Received: from mga14.intel.com (mga14.intel.com [])
 by mx.groups.io with SMTP id smtpd.web11.972.1619398464930781840
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Apr 2021 17:54:49 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: /eNDLkN4o1KHzfQDa2zTPbIsW6dV/LT9CbBPMqBqD1zLH/5BmnJ8tnlZwHjl3ADYsmo37CfHKj
 CCpDlt3+AbuA==
X-IronPort-AV: E=McAfee;i="6200,9189,9965"; a="195818226"
X-IronPort-AV: E=Sophos;i="5.82,251,1613462400"; 
   d="scan'208";a="195818226"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2021 17:54:48 -0700
IronPort-SDR: 9gP5OpY6xUxXRb+kHaJtrr/qF6hqC3Z2uUE34rLnGdQ1JPXRXz3+Kcxf5F7LO+A5vGYkSaeVSp
 83a+9DAfhqkw==
X-IronPort-AV: E=Sophos;i="5.82,251,1613462400"; 
   d="scan'208";a="454067455"
Received: from wsan-mobl1.ccr.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.213.45.138])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2021 17:54:47 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 39/64] pango: re-enable ptest
Date: Mon, 26 Apr 2021 08:53:10 +0800
Message-Id: <9786f7f41e034c60f61a7c0e47755d672353e07f.1619397968.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1619397968.git.anuj.mittal@intel.com>
References: <cover.1619397968.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Saul Wold <Saul.Wold@windriver.com>

The run-ptest script got accidently dropped from the SRC_URI during
a past update and ptest patch.

Signed-off-by: Saul Wold <saul.wold@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 4479f810c1a3ab2badf4f9610c309bc0e23e2a5f)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-graphics/pango/pango_1.48.2.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-graphics/pango/pango_1.48.2.bb b/meta/recipes-graphics/pango/pango_1.48.2.bb
index 1dcb43b5e1..aa279bb503 100644
--- a/meta/recipes-graphics/pango/pango_1.48.2.bb
+++ b/meta/recipes-graphics/pango/pango_1.48.2.bb
@@ -18,6 +18,8 @@ inherit gnomebase gtk-doc ptest-gnome upstream-version-is-even gobject-introspec
 GIR_MESON_ENABLE_FLAG = "enabled"
 GIR_MESON_DISABLE_FLAG = "disabled"
 
+SRC_URI += "file://run-ptest"
+
 SRC_URI[archive.sha256sum] = "d21f8b30dc8abdfc55de25656ecb88dc1105eeeb315e5e2a980dcef8010c2c80"
 
 DEPENDS = "glib-2.0 glib-2.0-native fontconfig freetype virtual/libiconv cairo harfbuzz fribidi"
-- 
2.30.2

