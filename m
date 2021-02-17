Received: from mga12.intel.com (mga12.intel.com [])
 by mx.groups.io with SMTP id smtpd.web09.4031.1613541139240922185
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Feb 2021 21:52:45 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: HcoWAUG3vRapNCYPd82mQ7VrPZ3Sn8wU+WR0hA6fgncwqsOE+469Vu9eUtssjW0z1grl8paeVa
 M3dA1ZYdxSng==
X-IronPort-AV: E=McAfee;i="6000,8403,9897"; a="162247177"
X-IronPort-AV: E=Sophos;i="5.81,184,1610438400"; 
   d="scan'208";a="162247177"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2021 21:52:45 -0800
IronPort-SDR: 2f+ZALPyeJDKpRO0zuREeR+zaXsv4z7Gk0FR7Vna9d7vBTyXvkMkmahw0+ZOTXnGi/GN9ZLTsQ
 4O1YhJPrc6Lw==
X-IronPort-AV: E=Sophos;i="5.81,184,1610438400"; 
   d="scan'208";a="399825464"
Received: from rjangidx-mobl.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.185.188])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2021 21:52:44 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 22/27] psmisc: upgrade 23.3 -> 23.4
Date: Wed, 17 Feb 2021 13:52:05 +0800
Message-Id: <20210217055210.22019-22-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210217055210.22019-1-anuj.mittal@intel.com>
References: <20210217055210.22019-1-anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-extended/psmisc/{psmisc_23.3.bb => psmisc_23.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/psmisc/{psmisc_23.3.bb => psmisc_23.4.bb} (84%)

diff --git a/meta/recipes-extended/psmisc/psmisc_23.3.bb b/meta/recipes-extended/psmisc/psmisc_23.4.bb
similarity index 84%
rename from meta/recipes-extended/psmisc/psmisc_23.3.bb
rename to meta/recipes-extended/psmisc/psmisc_23.4.bb
index e569f1074b..894443f4ef 100644
--- a/meta/recipes-extended/psmisc/psmisc_23.3.bb
+++ b/meta/recipes-extended/psmisc/psmisc_23.4.bb
@@ -5,5 +5,5 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
 SRC_URI = "git://gitlab.com/psmisc/psmisc.git;protocol=https \
            file://0001-Use-UINTPTR_MAX-instead-of-__WORDSIZE.patch \
            "
-SRCREV = "78bde849041e6c914a2a517ebe1255b86dc98772"
+SRCREV = "5fab6b7ab385080f1db725d6803136ec1841a15f"
 S = "${WORKDIR}/git"
-- 
2.29.2

