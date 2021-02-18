Received: from mga17.intel.com (mga17.intel.com [])
 by mx.groups.io with SMTP id smtpd.web08.2597.1613622265608276454
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Feb 2021 20:24:40 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: OMbJzXoH4QtdO3sSYu0C7yUKsePh3JCRHKJdZyiVS5EHKIccVxA0s4VQk1Y7Aw3eOG9Fj1Jpa1
 NT3XXHeuwbGg==
X-IronPort-AV: E=McAfee;i="6000,8403,9898"; a="163178033"
X-IronPort-AV: E=Sophos;i="5.81,186,1610438400"; 
   d="scan'208";a="163178033"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2021 20:24:40 -0800
IronPort-SDR: 0TMvWhDubYjDhevBtESQkdUGp26ocnkugHpYfQwMdZf7vplOHDTmHq+KuYfqYZZF9FeMjyuiXi
 r5CnPmJ4ubLw==
X-IronPort-AV: E=Sophos;i="5.81,186,1610438400"; 
   d="scan'208";a="378269237"
Received: from zaizam-mobl.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.185.203])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2021 20:24:39 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 12/12] asciidoc: fix upstream check
Date: Thu, 18 Feb 2021 12:24:18 +0800
Message-Id: <20210218042418.281245-12-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210218042418.281245-1-anuj.mittal@intel.com>
References: <20210218042418.281245-1-anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Detect versions with numbers only and ignore the pre-release versions.

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-extended/asciidoc/asciidoc_9.0.4.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-extended/asciidoc/asciidoc_9.0.4.bb b/meta/recipes-extended/asciidoc/asciidoc_9.0.4.bb
index 51d12cb8c6..4d94adec00 100644
--- a/meta/recipes-extended/asciidoc/asciidoc_9.0.4.bb
+++ b/meta/recipes-extended/asciidoc/asciidoc_9.0.4.bb
@@ -29,3 +29,5 @@ RDEPENDS_${PN} += "python3"
 RDEPENDS_remove_class-native = "python3"
 
 BBCLASSEXTEND = "native nativesdk"
+
+UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>(\d+(\.\d+)+))$"
-- 
2.29.2

