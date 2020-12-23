Received: from mga12.intel.com (mga12.intel.com [])
 by mx.groups.io with SMTP id smtpd.web12.10343.1608736768391429647
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Dec 2020 07:19:37 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: ut2DDRQ/3w1o7LLvbMM2NGX3fhezMYcgEwVOUo6dFflrzLIVKrXtCEHrH1E1nYNHA+A/ttl/ur
 T0iXhKmiQ70g==
X-IronPort-AV: E=McAfee;i="6000,8403,9843"; a="155236137"
X-IronPort-AV: E=Sophos;i="5.78,441,1599548400"; 
   d="scan'208";a="155236137"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2020 07:19:36 -0800
IronPort-SDR: NecpavsEzHSpkWRPZ0mUBCmeZGI3uydveHV595CBA8sACtFqRTtGgDK93w6tBCgq6iKU14cOhz
 OyxHhIt/sraw==
X-IronPort-AV: E=Sophos;i="5.78,441,1599548400"; 
   d="scan'208";a="374027730"
Received: from btang1-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.249.75.173])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2020 07:19:35 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 31/35] ncurses: Make ncurses-tools depend on ncurses-terminfo-base
Date: Wed, 23 Dec 2020 23:18:41 +0800
Message-Id: <e0d6785a3751f191cbd84c05857bd3a7e60aa5ff.1608735614.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1608735614.git.anuj.mittal@intel.com>
References: <cover.1608735614.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Robert Yang <liezhi.yang@windriver.com>

Fixed when ncurses-terminfo-base is not installed:
$ infocmp
infocmp: couldn't open terminfo file linux.

The required file is in ncurses-terminfo-base

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit f3e0a6bf1b7d9009c253e3f97df8736ecf3aa79b)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-core/ncurses/ncurses.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/ncurses/ncurses.inc b/meta/recipes-core/ncurses/ncurses.inc
index 4b61889668..fe4e8a5d6e 100644
--- a/meta/recipes-core/ncurses/ncurses.inc
+++ b/meta/recipes-core/ncurses/ncurses.inc
@@ -312,7 +312,7 @@ FILES_${PN}-tools = "\
 "
 
 # 'reset' is a symlink to 'tset' which is in the 'ncurses' package
-RDEPENDS_${PN}-tools = "${PN}"
+RDEPENDS_${PN}-tools = "${PN} ${PN}-terminfo-base"
 
 FILES_${PN}-terminfo = "\
   ${datadir}/terminfo \
-- 
2.29.2

