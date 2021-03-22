Received: from mga03.intel.com (mga03.intel.com [])
 by mx.groups.io with SMTP id smtpd.web08.7183.1616377301187997965
 for <openembedded-core@lists.openembedded.org>;
 Sun, 21 Mar 2021 18:41:57 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: FxtdJ1T0eNLSLTB1O1c28qajRHB3NPa8J8t3WQH7mQhhcLoQNbJgM1+dGfHLTjavjJ841O98iH
 W9DPj59XWqwQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9930"; a="190211619"
X-IronPort-AV: E=Sophos;i="5.81,266,1610438400"; 
   d="scan'208";a="190211619"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2021 18:41:57 -0700
IronPort-SDR: pLFKCqfsW0Y3HlCMWXyATgNNN0W0gteZtN1ydaD0DPMi7q+viMIbXtWuOahgG0bYM1Yqd8inUx
 12RiB2enKe6A==
X-IronPort-AV: E=Sophos;i="5.81,266,1610438400"; 
   d="scan'208";a="524295206"
Received: from myusoff-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.249.78.4])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2021 18:41:55 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 14/25] gstreamer1.0-python: Set internal python library path correcty
Date: Mon, 22 Mar 2021 09:41:16 +0800
Message-Id: <45b8cc437557490ae3aca2434ea19a5113bf2fa6.1616377115.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1616377115.git.anuj.mittal@intel.com>
References: <cover.1616377115.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Richard Purdie <richard.purdie@linuxfoundation.org>

The library hardcodes paths to the python library internally and currently
these are build paths. Fix this to use the correct target path and
fix reproducibility in the process.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 4c190e8c9a2b53de3def1065fb6e479b72d040dc)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.16.3.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.16.3.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.16.3.bb
index 14b34a2808..3eeb69d72c 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.16.3.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.16.3.bb
@@ -16,6 +16,8 @@ PNREAL = "gst-python"
 
 S = "${WORKDIR}/${PNREAL}-${PV}"
 
+EXTRA_OEMESON += "-Dlibpython-dir=${libdir}"
+
 # gobject-introspection is mandatory and cannot be configured
 REQUIRED_DISTRO_FEATURES = "gobject-introspection-data"
 UNKNOWN_CONFIGURE_WHITELIST_append = " introspection"
-- 
2.30.2

