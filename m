Received: from mga12.intel.com (mga12.intel.com [])
 by mx.groups.io with SMTP id smtpd.web10.10233.1608736733177759099
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Dec 2020 07:19:14 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: nR/jerLlTkn8gwE6LkVpZBvvsD3jeveV5JpV8pKY89LmO5cRl86YrwOZLP24lFh1CJIqDRV6JU
 XKeXc3I/hOFw==
X-IronPort-AV: E=McAfee;i="6000,8403,9843"; a="155236052"
X-IronPort-AV: E=Sophos;i="5.78,441,1599548400"; 
   d="scan'208";a="155236052"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2020 07:19:14 -0800
IronPort-SDR: NldUn5noA8lWg8W1AZec6/5rWpn4QQ1L8hNt80OvWDhArkOVnYxCRsF2WYkpwF71b4U2ahwaGx
 zKE/9eHzV9EA==
X-IronPort-AV: E=Sophos;i="5.78,441,1599548400"; 
   d="scan'208";a="374027596"
Received: from btang1-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.249.75.173])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2020 07:19:13 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 16/35] parted: Make readline dependency optional
Date: Wed, 23 Dec 2020 23:18:26 +0800
Message-Id: <27b2aca75af2d0df9b6d63ff0368b6cb02e6b52f.1608735614.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1608735614.git.anuj.mittal@intel.com>
References: <cover.1608735614.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mark Jonas <toertel@gmail.com>

Signed-off-by: Mark Jonas <toertel@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit bb433833d2ae7b87d18dfae5635eac9097ecc9b7)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-extended/parted/parted_3.3.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-extended/parted/parted_3.3.bb b/meta/recipes-extended/parted/parted_3.3.bb
index a1fd3ef07b..ce40c04ad4 100644
--- a/meta/recipes-extended/parted/parted_3.3.bb
+++ b/meta/recipes-extended/parted/parted_3.3.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://www.gnu.org/software/parted/parted.html"
 LICENSE = "GPLv3+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=2f31b266d3440dd7ee50f92cf67d8e6c"
 SECTION = "console/tools"
-DEPENDS = "ncurses readline util-linux virtual/libiconv"
+DEPENDS = "ncurses util-linux virtual/libiconv"
 
 SRC_URI = "${GNU_MIRROR}/parted/parted-${PV}.tar.xz \
            file://no_check.patch \
@@ -22,6 +22,9 @@ EXTRA_OECONF = "--disable-device-mapper"
 
 inherit autotools pkgconfig gettext texinfo ptest
 
+PACKAGECONFIG ?= "readline"
+PACKAGECONFIG[readline] = "--with-readline,--without-readline,readline"
+
 BBCLASSEXTEND = "native nativesdk"
 
 do_compile_ptest() {
-- 
2.29.2

