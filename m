Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by mx.groups.io with SMTP id smtpd.web10.36802.1614009670915969052
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Feb 2021 08:01:11 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.136, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: I9v2Kof4aikCftKH91sEKRTUSdEeemYAmT7j8uP9BmeskGL54RRXTyU9aPgpu3tzywjO80/p7O
 pyxM3LkWzTDA==
X-IronPort-AV: E=McAfee;i="6000,8403,9903"; a="163706056"
X-IronPort-AV: E=Sophos;i="5.81,197,1610438400"; 
   d="scan'208";a="163706056"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2021 08:01:09 -0800
IronPort-SDR: ZqXNXO283bO/mBrr6AcPl8JE8n8KspunqLaCeBexwAWfEwGS9q5qYUsY9iQhfqeiQE/cOgPaMr
 yvATRfW2+v3A==
X-IronPort-AV: E=Sophos;i="5.81,197,1610438400"; 
   d="scan'208";a="430302025"
Received: from yrajendx-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.147.39])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2021 08:01:08 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 20/30] quilt: Be determnistic about column presence
Date: Tue, 23 Feb 2021 00:00:23 +0800
Message-Id: <234aa20802d07e8c7772a7786589aabb51076858.1614009417.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1614009417.git.anuj.mittal@intel.com>
References: <cover.1614009417.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Richard Purdie <richard.purdie@linuxfoundation.org>

I've seen local differences in the quilt output depending on whether the column
binary was available in the sysroot. Fix determinism issues by being specific
about configuration.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 0cd5fba8634bcc679518f98cc25be66a51081372)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-devtools/quilt/quilt.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/quilt/quilt.inc b/meta/recipes-devtools/quilt/quilt.inc
index d6d06c049c..d7ecda7aaa 100644
--- a/meta/recipes-devtools/quilt/quilt.inc
+++ b/meta/recipes-devtools/quilt/quilt.inc
@@ -30,7 +30,7 @@ EXTRA_OECONF = "--with-perl='${USRBINPATH}/env perl' --with-patch=patch"
 EXTRA_OECONF_append_class-native = " --disable-nls"
 EXTRA_AUTORECONF += "--exclude=aclocal"
 
-CACHED_CONFIGUREVARS += "ac_cv_path_BASH=/bin/bash"
+CACHED_CONFIGUREVARS += "ac_cv_path_BASH=/bin/bash ac_cv_path_COLUMN=column"
 
 # Make sure we don't have "-w" in shebang lines: it breaks using
 # "/usr/bin/env perl" as parser
-- 
2.29.2

