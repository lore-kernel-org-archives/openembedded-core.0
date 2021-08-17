Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by mx.groups.io with SMTP id smtpd.web10.34266.1629168135472276180
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Aug 2021 19:42:16 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.120, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10078"; a="214133324"
X-IronPort-AV: E=Sophos;i="5.84,327,1620716400"; 
   d="scan'208";a="214133324"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2021 19:42:15 -0700
X-IronPort-AV: E=Sophos;i="5.84,327,1620716400"; 
   d="scan'208";a="593153065"
Received: from unknown (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.215.231.145])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2021 19:42:14 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/7] hdcp: upgrade 21.1.0 -> 21.2.0
Date: Tue, 17 Aug 2021 10:42:04 +0800
Message-Id: <20210817024209.114840-2-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210817024209.114840-1-anuj.mittal@intel.com>
References: <20210817024209.114840-1-anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 recipes-graphics/hdcp/{hdcp_21.1.0.bb => hdcp_21.2.0.bb} | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename recipes-graphics/hdcp/{hdcp_21.1.0.bb => hdcp_21.2.0.bb} (100%)

diff --git a/recipes-graphics/hdcp/hdcp_21.1.0.bb b/recipes-graphics/hdcp/hdcp_21.2.0.bb
similarity index 100%
rename from recipes-graphics/hdcp/hdcp_21.1.0.bb
rename to recipes-graphics/hdcp/hdcp_21.2.0.bb
-- 
2.31.1

