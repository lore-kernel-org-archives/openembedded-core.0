Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by mx.groups.io with SMTP id smtpd.web12.5291.1589059404868553245
 for <openembedded-core@lists.openembedded.org>;
 Sat, 09 May 2020 14:23:25 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: linux.intel.com, ip: 192.55.52.88, mailfrom: timothy.t.orling@linux.intel.com)
IronPort-SDR: SREUHnB9ldr2n62oxpXVzOkNBUzd2bjHkc4euxrqoGSj/27U4vsVHX5qLY8cXDzfFV8N0KVXem
 HzBJeeh0ptig==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2020 14:23:24 -0700
IronPort-SDR: SLcJ3+my8S78oVh1MrrlKD/2ny1GSr8KWPTq+VERbL5nvPkF7ttV2PrG6OedAA4cwr8m5if/QY
 d3alETfKQ2eA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,373,1583222400"; 
   d="scan'208";a="279379091"
Received: from wrath.jf.intel.com ([10.54.31.24])
  by orsmga002.jf.intel.com with ESMTP; 09 May 2020 14:23:24 -0700
From: "Tim Orling" <timothy.t.orling@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <timothy.t.orling@linux.intel.com>
Subject: [PATCH] pypi.bbclass: use new pypi UPSTREAM_CHECK_URI
Date: Sat,  9 May 2020 14:23:12 -0700
Message-Id: <20200509212312.8023-1-timothy.t.orling@linux.intel.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Upstream https://pypi.python.org/pypi/${PYPI_PACKAGE}/
redirects to https://pypi.org/project/${PYPI_PACKAGE}/

Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
---
 meta/classes/pypi.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/pypi.bbclass b/meta/classes/pypi.bbclass
index ffa8aa3ff44..87b4c85fc09 100644
--- a/meta/classes/pypi.bbclass
+++ b/meta/classes/pypi.bbclass
@@ -22,5 +22,5 @@ SECTION = "devel/python"
 SRC_URI += "${PYPI_SRC_URI}"
 S = "${WORKDIR}/${PYPI_PACKAGE}-${PV}"
 
-UPSTREAM_CHECK_URI ?= "https://pypi.python.org/pypi/${PYPI_PACKAGE}/"
+UPSTREAM_CHECK_URI ?= "https://pypi.org/project/${PYPI_PACKAGE}/"
 UPSTREAM_CHECK_REGEX ?= "/${PYPI_PACKAGE}/(?P<pver>(\d+[\.\-_]*)+)/"
-- 
2.24.0

