Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by mx.groups.io with SMTP id smtpd.web09.37355.1614009665427621233
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Feb 2021 08:01:05 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.136, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: 5hHtwlExK1srV/tHKQVB+C4XZuEcqCCDfL8l3fFjXcgDMe1CEz6+q8NBG0EYvoWePZiF6lLq/9
 vzX71j4mgZ5A==
X-IronPort-AV: E=McAfee;i="6000,8403,9903"; a="163705993"
X-IronPort-AV: E=Sophos;i="5.81,197,1610438400"; 
   d="scan'208";a="163705993"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2021 08:01:03 -0800
IronPort-SDR: CDNVnH2zZnbdXFsParBBEpdCQBfOvGwEsa5duyL7YO3ou9CkClHkHbx5Bb35uh+a18kPJ3qIka
 Cti257RYcCpg==
X-IronPort-AV: E=Sophos;i="5.81,197,1610438400"; 
   d="scan'208";a="430301937"
Received: from yrajendx-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.147.39])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2021 08:01:01 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 15/30] weston-init: Fix weston-keyboard path in weston.ini
Date: Tue, 23 Feb 2021 00:00:18 +0800
Message-Id: <5606b3fb87a19daaafdd0d414c5d004ab67d6fa2.1614009417.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1614009417.git.anuj.mittal@intel.com>
References: <cover.1614009417.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Marek Vasut <marex@denx.de>

The weston-keyboard executable is installed into /usr/libexec
instead of /usr/lib/weston , correct the path in weston.ini .

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Khem Raj <raj.khem@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 56dee47a5ddb1da66d30f894a282d0658dcc930c)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-graphics/wayland/weston-init/weston.ini | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/wayland/weston-init/weston.ini b/meta/recipes-graphics/wayland/weston-init/weston.ini
index b48726d59c..6bd5aef55a 100644
--- a/meta/recipes-graphics/wayland/weston-init/weston.ini
+++ b/meta/recipes-graphics/wayland/weston-init/weston.ini
@@ -42,7 +42,7 @@ require-input=false
 #path=/build/weston-0lEgCh/weston-1.11.0/weston-flower
 
 #[input-method]
-#path=/usr/lib/weston/weston-keyboard
+#path=/usr/libexec/weston-keyboard
 
 #[output]
 #name=LVDS1
-- 
2.29.2

