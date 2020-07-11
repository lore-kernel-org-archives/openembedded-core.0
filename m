Received: from mga07.intel.com (mga07.intel.com [])
 by mx.groups.io with SMTP id smtpd.web10.3336.1594439293505136637
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Jul 2020 20:48:15 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: linux.intel.com, ip: <nil>, mailfrom: timothy.t.orling@linux.intel.com)
IronPort-SDR: XZXmVEESt1ACwCs8+ixKy8TMY7Lhc4jDrvHFFWwU69lq18y2130IruvRV0IYPLhnjNtOITcGQ/
 i/nZZFIiPwaQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9678"; a="213206817"
X-IronPort-AV: E=Sophos;i="5.75,338,1589266800"; 
   d="scan'208";a="213206817"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2020 20:48:14 -0700
IronPort-SDR: W+CnBRuX9mwPmAl4LZQyG2ThW4AqZxg+Sp8L758UaD+lImx/GFdgm0k7HovABY2min1v0QdKoy
 BUe5gELIry5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,338,1589266800"; 
   d="scan'208";a="484376788"
Received: from wrath.jf.intel.com ([10.54.31.24])
  by fmsmga006.fm.intel.com with ESMTP; 10 Jul 2020 20:48:14 -0700
From: "Tim Orling" <timothy.t.orling@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] lib/oe/recipeutils.py: add AUTHOR; BBCLASSEXTEND
Date: Fri, 10 Jul 2020 20:48:07 -0700
Message-Id: <82f82b9e01a0beb0b145954f876acea99208f4e8.1594438523.git.timothy.t.orling@linux.intel.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <cover.1594438523.git.timothy.t.orling@linux.intel.com>
References: <cover.1594438523.git.timothy.t.orling@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If you try to create a plugin for recipetool that
adds the AUTHOR field, it is impossible to put it
in the recommended position [1] without adding to the
recipe_progression variable.

While we are at it, also add BBCLASSEXTEND at the
end, as also recommended by [1].

[1] http://www.openembedded.org/wiki/Styleguide

Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
---
 meta/lib/oe/recipeutils.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/recipeutils.py b/meta/lib/oe/recipeutils.py
index 29473a98825..36427eec918 100644
--- a/meta/lib/oe/recipeutils.py
+++ b/meta/lib/oe/recipeutils.py
@@ -24,7 +24,7 @@ from collections import OrderedDict, defaultdict
 from bb.utils import vercmp_string
 
 # Help us to find places to insert values
-recipe_progression = ['SUMMARY', 'DESCRIPTION', 'HOMEPAGE', 'BUGTRACKER', 'SECTION', 'LICENSE', 'LICENSE_FLAGS', 'LIC_FILES_CHKSUM', 'PROVIDES', 'DEPENDS', 'PR', 'PV', 'SRCREV', 'SRCPV', 'SRC_URI', 'S', 'do_fetch()', 'do_unpack()', 'do_patch()', 'EXTRA_OECONF', 'EXTRA_OECMAKE', 'EXTRA_OESCONS', 'do_configure()', 'EXTRA_OEMAKE', 'do_compile()', 'do_install()', 'do_populate_sysroot()', 'INITSCRIPT', 'USERADD', 'GROUPADD', 'PACKAGES', 'FILES', 'RDEPENDS', 'RRECOMMENDS', 'RSUGGESTS', 'RPROVIDES', 'RREPLACES', 'RCONFLICTS', 'ALLOW_EMPTY', 'populate_packages()', 'do_package()', 'do_deploy()']
+recipe_progression = ['SUMMARY', 'DESCRIPTION', 'AUTHOR', 'HOMEPAGE', 'BUGTRACKER', 'SECTION', 'LICENSE', 'LICENSE_FLAGS', 'LIC_FILES_CHKSUM', 'PROVIDES', 'DEPENDS', 'PR', 'PV', 'SRCREV', 'SRCPV', 'SRC_URI', 'S', 'do_fetch()', 'do_unpack()', 'do_patch()', 'EXTRA_OECONF', 'EXTRA_OECMAKE', 'EXTRA_OESCONS', 'do_configure()', 'EXTRA_OEMAKE', 'do_compile()', 'do_install()', 'do_populate_sysroot()', 'INITSCRIPT', 'USERADD', 'GROUPADD', 'PACKAGES', 'FILES', 'RDEPENDS', 'RRECOMMENDS', 'RSUGGESTS', 'RPROVIDES', 'RREPLACES', 'RCONFLICTS', 'ALLOW_EMPTY', 'populate_packages()', 'do_package()', 'do_deploy()', 'BBCLASSEXTEND']
 # Variables that sometimes are a bit long but shouldn't be wrapped
 nowrap_vars = ['SUMMARY', 'HOMEPAGE', 'BUGTRACKER', r'SRC_URI\[(.+\.)?md5sum\]', r'SRC_URI\[(.+\.)?sha256sum\]']
 list_vars = ['SRC_URI', 'LIC_FILES_CHKSUM']
-- 
2.24.0

