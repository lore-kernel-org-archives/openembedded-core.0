Received: from mga12.intel.com (mga12.intel.com [])
 by mx.groups.io with SMTP id smtpd.web11.24792.1611128477823315504
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Jan 2021 23:41:24 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: Zs3PTiM4LVNjCXIiUNK/kTNVTcRUfKauD+SVxfsXTZd6Ralli6TkbTp9IT5CvKKottRzj3YW1C
 +k0cPlPOyKQw==
X-IronPort-AV: E=McAfee;i="6000,8403,9869"; a="158240468"
X-IronPort-AV: E=Sophos;i="5.79,360,1602572400"; 
   d="scan'208";a="158240468"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2021 23:41:24 -0800
IronPort-SDR: kfGyB7bgkD/MeDYATiUr2f/ixhC2VZFznhhlibXSjbJIUrD1ujE/k13TkO9xNr3VaKrqAi6UoN
 48jVKWch1Jcg==
X-IronPort-AV: E=Sophos;i="5.79,360,1602572400"; 
   d="scan'208";a="350958526"
Received: from mrengasa-mobl2.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.144.190])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2021 23:41:23 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 07/10] sudo: upgrade 1.9.4p1 -> 1.9.5p1
Date: Wed, 20 Jan 2021 15:40:55 +0800
Message-Id: <20210120074058.252462-7-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210120074058.252462-1-anuj.mittal@intel.com>
References: <20210120074058.252462-1-anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

License-Update: copyright years changed

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-extended/sudo/sudo.inc                           | 2 +-
 .../sudo/{sudo_1.9.4p1.bb => sudo_1.9.5p1.bb}                 | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-extended/sudo/{sudo_1.9.4p1.bb => sudo_1.9.5p1.bb} (94%)

diff --git a/meta/recipes-extended/sudo/sudo.inc b/meta/recipes-extended/sudo/sudo.inc
index 86a18be7e2..97ecabe0fc 100644
--- a/meta/recipes-extended/sudo/sudo.inc
+++ b/meta/recipes-extended/sudo/sudo.inc
@@ -4,7 +4,7 @@ HOMEPAGE = "http://www.sudo.ws"
 BUGTRACKER = "http://www.sudo.ws/bugs/"
 SECTION = "admin"
 LICENSE = "ISC & BSD & Zlib"
-LIC_FILES_CHKSUM = "file://doc/LICENSE;md5=828cd502ad216ff869bf83adf3301e02 \
+LIC_FILES_CHKSUM = "file://doc/LICENSE;md5=fdff64d4fd19126330aa81b94d167173 \
                     file://plugins/sudoers/redblack.c;beginline=1;endline=46;md5=03e35317699ba00b496251e0dfe9f109 \
                     file://lib/util/reallocarray.c;beginline=3;endline=15;md5=397dd45c7683e90b9f8bf24638cf03bf \
                     file://lib/util/fnmatch.c;beginline=3;endline=27;md5=004d7d2866ba1f5b41174906849d2e0f \
diff --git a/meta/recipes-extended/sudo/sudo_1.9.4p1.bb b/meta/recipes-extended/sudo/sudo_1.9.5p1.bb
similarity index 94%
rename from meta/recipes-extended/sudo/sudo_1.9.4p1.bb
rename to meta/recipes-extended/sudo/sudo_1.9.5p1.bb
index 6b5a1ce752..65f5480682 100644
--- a/meta/recipes-extended/sudo/sudo_1.9.4p1.bb
+++ b/meta/recipes-extended/sudo/sudo_1.9.5p1.bb
@@ -7,7 +7,7 @@ SRC_URI = "https://www.sudo.ws/dist/sudo-${PV}.tar.gz \
 
 PAM_SRC_URI = "file://sudo.pam"
 
-SRC_URI[sha256sum] = "1172099dfcdd2fa497e13a3c274a9f5920abd36ae7d2f7aaacd6bc6bc92fd677"
+SRC_URI[sha256sum] = "4dddf37c22653defada299e5681e0daef54bb6f5fc950f63997bb8eb966b7882"
 
 DEPENDS += " virtual/crypt ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 RDEPENDS_${PN} += " ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam-plugin-limits pam-plugin-keyinit', '', d)}"
@@ -56,4 +56,4 @@ RDEPENDS_${PN}-sudo = "${PN}-lib"
 RDEPENDS_${PN} += "${SUDO_PACKAGES}"
 
 FILES_${PN}-sudo = "${bindir}/sudo ${bindir}/sudoedit"
-FILES_${PN}-lib = "${localstatedir} ${libexecdir} ${sysconfdir} ${libdir} ${nonarch_libdir}"
\ No newline at end of file
+FILES_${PN}-lib = "${localstatedir} ${libexecdir} ${sysconfdir} ${libdir} ${nonarch_libdir}"
-- 
2.29.2

