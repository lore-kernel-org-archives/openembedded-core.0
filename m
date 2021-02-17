Received: from mga12.intel.com (mga12.intel.com [])
 by mx.groups.io with SMTP id smtpd.web09.4031.1613541139240922185
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Feb 2021 21:52:51 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: 5kQwXNgDHYbshdTPivIMHxLho1wPC6s85kbxpmLw/aF1Ocx3JfKU6ezkessRTOkDUj6uNyOa7u
 RuxP62KIKDSQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9897"; a="162247205"
X-IronPort-AV: E=Sophos;i="5.81,184,1610438400"; 
   d="scan'208";a="162247205"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2021 21:52:50 -0800
IronPort-SDR: XOkQrIvV/amAQHvAhITIxAh/mx1aTtEREaN/fMvXPw4aCzKIV5m13QMOsE9M+AeBSxe2Svqrla
 U34AcYdHDswA==
X-IronPort-AV: E=Sophos;i="5.81,184,1610438400"; 
   d="scan'208";a="399825478"
Received: from rjangidx-mobl.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.185.188])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2021 21:52:49 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 26/27] libcap: upgrade 2.47 -> 2.48
Date: Wed, 17 Feb 2021 13:52:09 +0800
Message-Id: <20210217055210.22019-26-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210217055210.22019-1-anuj.mittal@intel.com>
References: <20210217055210.22019-1-anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-support/libcap/{libcap_2.47.bb => libcap_2.48.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/libcap/{libcap_2.47.bb => libcap_2.48.bb} (96%)

diff --git a/meta/recipes-support/libcap/libcap_2.47.bb b/meta/recipes-support/libcap/libcap_2.48.bb
similarity index 96%
rename from meta/recipes-support/libcap/libcap_2.47.bb
rename to meta/recipes-support/libcap/libcap_2.48.bb
index bc4754eab8..d8bbebdde1 100644
--- a/meta/recipes-support/libcap/libcap_2.47.bb
+++ b/meta/recipes-support/libcap/libcap_2.48.bb
@@ -12,7 +12,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/libs/security/linux-privs/${BPN}2/${BPN}-${
            file://0002-tests-do-not-run-target-executables.patch \
            file://0001-tests-do-not-statically-link-a-test.patch \
            "
-SRC_URI[sha256sum] = "af165df45f9fe8b315164ec7143740947489f36ccbe6999b6cdf86e7a8dca04b"
+SRC_URI[sha256sum] = "4de9590ee09a87c282d558737ffb5b6175ccbfd26d580add10df44d0f047f6c2"
 
 UPSTREAM_CHECK_URI = "https://www.kernel.org/pub/linux/libs/security/linux-privs/${BPN}2/"
 
-- 
2.29.2

