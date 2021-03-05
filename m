Received: from mga09.intel.com (mga09.intel.com [])
 by mx.groups.io with SMTP id smtpd.web08.7839.1614918154051973024
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Mar 2021 20:22:48 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: 8mvEyEkTPkB2XGNQxSGdYGoMbrVYw40JAjkQtQtcJ/ZT++hkEQsT52KhERYzRGWui/AZtxw2d6
 t7S0JnrdajJQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9913"; a="187671146"
X-IronPort-AV: E=Sophos;i="5.81,224,1610438400"; 
   d="scan'208";a="187671146"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2021 20:22:48 -0800
IronPort-SDR: jZXWlhVEtd7fYV/NHHOWsAnPWfam57dUQ2y7K6lpbRbTC0M8LeLQjN1qt5GH5tfkiP5ZSeNCeF
 FSpZ93jzTyxA==
X-IronPort-AV: E=Sophos;i="5.81,224,1610438400"; 
   d="scan'208";a="408129046"
Received: from selvan2x-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.147.249])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2021 20:22:47 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 37/52] externalsrc: Pass through npmsw URIs in SRC_URI
Date: Fri,  5 Mar 2021 12:21:13 +0800
Message-Id: <05a0d9ca3916f498976aa76c22935180da321b4f.1614917620.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1614917620.git.anuj.mittal@intel.com>
References: <cover.1614917620.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mike Crowe <mac@mcrowe.com>

NPM shrinkwrap files need to stay in SRC_URI even when using
externalsrc so that npm_do_fetch can run to fetch the required
dependencies.

Signed-off-by: Mike Crowe <mac@mcrowe.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit e889cbecf9a1731b199e57d79a14e574398586bb)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/classes/externalsrc.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/externalsrc.bbclass b/meta/classes/externalsrc.bbclass
index 64e94e3301..c7b2bf2f49 100644
--- a/meta/classes/externalsrc.bbclass
+++ b/meta/classes/externalsrc.bbclass
@@ -68,6 +68,7 @@ python () {
             url_data = fetch.ud[url]
             parm = url_data.parm
             if (url_data.type == 'file' or
+                    url_data.type == 'npmsw' or
                     'type' in parm and parm['type'] == 'kmeta'):
                 local_srcuri.append(url)
 
-- 
2.29.2

