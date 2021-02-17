Received: from mga12.intel.com (mga12.intel.com [])
 by mx.groups.io with SMTP id smtpd.web09.4031.1613541139240922185
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Feb 2021 21:52:34 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: kTPHi4fHdftHYOlfwTOl8KtKvyFQwO1qgXYfjxUMMQ9ZUVnItOZ+bC7d52KHq5qqInPiOPktwb
 moGVKXTyP62w==
X-IronPort-AV: E=McAfee;i="6000,8403,9897"; a="162247134"
X-IronPort-AV: E=Sophos;i="5.81,184,1610438400"; 
   d="scan'208";a="162247134"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2021 21:52:34 -0800
IronPort-SDR: YIcrrouunwtST115YIiYKWsI7kdt+B/tS5QVyQNS4zeeqTvRw4hV/GzdELLXvu/dHAZsKeTtu2
 Hxwn+WPhPLhw==
X-IronPort-AV: E=Sophos;i="5.81,184,1610438400"; 
   d="scan'208";a="399825433"
Received: from rjangidx-mobl.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.185.188])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2021 21:52:32 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 14/27] sysstat: upgrade 12.4.2 -> 12.4.3
Date: Wed, 17 Feb 2021 13:51:57 +0800
Message-Id: <20210217055210.22019-14-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210217055210.22019-1-anuj.mittal@intel.com>
References: <20210217055210.22019-1-anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../sysstat/{sysstat_12.4.2.bb => sysstat_12.4.3.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/sysstat/{sysstat_12.4.2.bb => sysstat_12.4.3.bb} (65%)

diff --git a/meta/recipes-extended/sysstat/sysstat_12.4.2.bb b/meta/recipes-extended/sysstat/sysstat_12.4.3.bb
similarity index 65%
rename from meta/recipes-extended/sysstat/sysstat_12.4.2.bb
rename to meta/recipes-extended/sysstat/sysstat_12.4.3.bb
index e50bb0ff61..5a27de439f 100644
--- a/meta/recipes-extended/sysstat/sysstat_12.4.2.bb
+++ b/meta/recipes-extended/sysstat/sysstat_12.4.3.bb
@@ -4,4 +4,4 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a23a74b3f4caf9616230789d94217acb"
 
 SRC_URI += "file://0001-configure.in-remove-check-for-chkconfig.patch"
 
-SRC_URI[sha256sum] = "3701b2c1883d50eb384d7b95ce5b6df0a71fdcb3c23f96cb58098d1bcffa018f"
+SRC_URI[sha256sum] = "ae432431f45aacbcabacfbbe129e2505e215cafa9ce996d7550c6091a46f0bfd"
-- 
2.29.2

