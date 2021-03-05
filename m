Received: from mga09.intel.com (mga09.intel.com [])
 by mx.groups.io with SMTP id smtpd.web08.7839.1614918154051973024
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Mar 2021 20:22:44 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: iixRC/O3WBgrxBJxD3oB49IaY5o5IzNhTEQfdwF+UG1y30Pz5RAfe/pd3PwmsUQAuHXol9YH7B
 IruYKwWvrZCA==
X-IronPort-AV: E=McAfee;i="6000,8403,9913"; a="187671124"
X-IronPort-AV: E=Sophos;i="5.81,224,1610438400"; 
   d="scan'208";a="187671124"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2021 20:22:44 -0800
IronPort-SDR: I5Miyu8a1PdoKWgFtWNo0AZkgycQx8cCgzUtHSNPUKQn2T9m5qbws8w0cZilETOiwTmn8FubB1
 bq3xGn8xowqA==
X-IronPort-AV: E=Sophos;i="5.81,224,1610438400"; 
   d="scan'208";a="408129001"
Received: from selvan2x-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.147.249])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2021 20:22:43 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 34/52] cups: Fix reproducibility issues
Date: Fri,  5 Mar 2021 12:21:10 +0800
Message-Id: <523e939c216283a219f3335b0537f2bb9940d70b.1614917620.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1614917620.git.anuj.mittal@intel.com>
References: <cover.1614917620.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Richard Purdie <richard.purdie@linuxfoundation.org>

configure inspects the host's /etc/group for these configuration
options, fix this to the correct values by using configure options.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit f16f9c727569414cd52862dcba18d8e423f4e961)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-extended/cups/cups.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-extended/cups/cups.inc b/meta/recipes-extended/cups/cups.inc
index e7a704134c..4a1177467b 100644
--- a/meta/recipes-extended/cups/cups.inc
+++ b/meta/recipes-extended/cups/cups.inc
@@ -54,6 +54,8 @@ EXTRA_OECONF = " \
                --enable-debug \
                --disable-relro \
                --enable-libusb \
+               --with-system-groups=lpadmin \
+               --with-cups-group=lp \
                --with-domainsocket=/run/cups/cups.sock \
                DSOFLAGS='${LDFLAGS}' \
                "
-- 
2.29.2

