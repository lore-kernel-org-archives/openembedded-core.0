Received: from mga05.intel.com (mga05.intel.com [])
 by mx.groups.io with SMTP id smtpd.web10.12468.1612885988361102987
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Feb 2021 07:53:09 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: dhXbGLCjCkFN++aZ0XPSLK3t50g+MLipSL0+qC4xvagpTDkQx6B5pcjdOzLSHi+rXfOrysF+7Y
 v7aTjUaORsRg==
X-IronPort-AV: E=McAfee;i="6000,8403,9890"; a="266735985"
X-IronPort-AV: E=Sophos;i="5.81,165,1610438400"; 
   d="scan'208";a="266735985"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2021 07:53:08 -0800
IronPort-SDR: +cw/ji5YFkJEDxKWGoj/+3FaVSWE81Nj1umBD3Y1xZQcvZud4P2aSFlZqycMh/lEVo9ASY/Dsc
 SrsTwx4VA+1Q==
X-IronPort-AV: E=Sophos;i="5.81,165,1610438400"; 
   d="scan'208";a="359215549"
Received: from ytee-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.146.52])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2021 07:53:06 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 21/35] libgcrypt: Whitelisted CVEs
Date: Tue,  9 Feb 2021 23:52:06 +0800
Message-Id: <461579e032f0490e69cc20ff526a898618f057b2.1612885583.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1612885583.git.anuj.mittal@intel.com>
References: <cover.1612885583.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: saloni <saloni.jain@kpit.com>

Whitelisted below CVEs:

1. CVE-2018-12433
Link: https://security-tracker.debian.org/tracker/CVE-2018-12433
Link: https://nvd.nist.gov/vuln/detail/CVE-2018-12433
CVE-2018-12433 is marked disputed and ignored by NVD as it does
not impact crypt libraries for any distros and hence, can be safely
marked whitelisted.

2. CVE-2018-12438
Link: https://security-tracker.debian.org/tracker/CVE-2018-12438
Link: https://ubuntu.com/security/CVE-2018-12438
CVE-2018-12438 was reported for affecting openjdk crypt libraries
but there are no details available on which openjdk versions are
affected and does not directly affect libgcrypt or any specific
yocto distributions, hence, can be whitelisted.

Signed-off-by: Saloni Jain <Saloni.Jain@kpit.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 2943efe3f56d394308f9364b439c25f6a7613288)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-support/libgcrypt/libgcrypt_1.8.6.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-support/libgcrypt/libgcrypt_1.8.6.bb b/meta/recipes-support/libgcrypt/libgcrypt_1.8.6.bb
index ac09417e89..832d07d515 100644
--- a/meta/recipes-support/libgcrypt/libgcrypt_1.8.6.bb
+++ b/meta/recipes-support/libgcrypt/libgcrypt_1.8.6.bb
@@ -28,6 +28,9 @@ SRC_URI = "${GNUPG_MIRROR}/libgcrypt/libgcrypt-${PV}.tar.bz2 \
 "
 SRC_URI[sha256sum] = "0cba2700617b99fc33864a0c16b1fa7fdf9781d9ed3509f5d767178e5fd7b975"
 
+# Below whitelisted CVEs are disputed and not affecting crypto libraries for any distro.
+CVE_CHECK_WHITELIST += "CVE-2018-12433 CVE-2018-12438"
+
 BINCONFIG = "${bindir}/libgcrypt-config"
 
 inherit autotools texinfo binconfig-disabled pkgconfig
-- 
2.29.2

