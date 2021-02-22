Received: from mga12.intel.com (mga12.intel.com [])
 by mx.groups.io with SMTP id smtpd.web09.37355.1614009665427621233
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Feb 2021 08:01:05 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: DG0Lk6CkFkGE23u5s+hLD/MqTgz58FzRzM10CudIgoqJ/byixNVC/DwI5T5TC38zxVKRk3VLnL
 O9gNhKojK1HA==
X-IronPort-AV: E=McAfee;i="6000,8403,9903"; a="163706004"
X-IronPort-AV: E=Sophos;i="5.81,197,1610438400"; 
   d="scan'208";a="163706004"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2021 08:01:04 -0800
IronPort-SDR: ULyAWh3887CvCHAbkKSQhxl9kC5DvKJM3+71D6vqeNbVB0nc0puOkiSgcfVe/lK9UdlqozK7oK
 TLt51P26uLkQ==
X-IronPort-AV: E=Sophos;i="5.81,197,1610438400"; 
   d="scan'208";a="430301952"
Received: from yrajendx-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.147.39])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2021 08:01:02 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 16/30] vim: Improve determinism
Date: Tue, 23 Feb 2021 00:00:19 +0800
Message-Id: <d1ba11457ebfdbdc0b717b6c5798bb9930e71c88.1614009417.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1614009417.git.anuj.mittal@intel.com>
References: <cover.1614009417.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Add a couple of configure options to avoid determism issues in the vim build.
This can happen due to the addition of glib-2.0 to the native sysroot through
later task additions to the sysroot through indirect dependencies.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 914f86054f5ea0a115767c1b3d9cdb4c4ef9545b)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-support/vim/vim.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index 4d2886c19e..1ea40e5e7f 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -68,8 +68,10 @@ EXTRA_OECONF = " \
     --disable-gtktest \
     --disable-xim \
     --disable-netbeans \
+    --disable-desktop-database-update \
     --with-tlib=ncurses \
     ac_cv_small_wchar_t=no \
+    ac_cv_path_GLIB_COMPILE_RESOURCES=no \
     vim_cv_getcwd_broken=no \
     vim_cv_memmove_handles_overlap=yes \
     vim_cv_stat_ignores_slash=no \
-- 
2.29.2

