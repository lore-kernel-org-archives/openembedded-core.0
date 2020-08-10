Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by mx.groups.io with SMTP id smtpd.web12.46332.1597071178064241135
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Aug 2020 07:52:58 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.43, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: q5WVftLwToIq2ej2dXXIn3Zls4K1cfWyv+nOV1nddEm+NABzNoxp2JxADTXG1pMgoVB9O3FOCf
 tjdt0KqkqMhw==
X-IronPort-AV: E=McAfee;i="6000,8403,9708"; a="238376819"
X-IronPort-AV: E=Sophos;i="5.75,457,1589266800"; 
   d="scan'208";a="238376819"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2020 07:52:57 -0700
IronPort-SDR: OfuV74ia/1ztGS7JGtRGMXqM6WsFVzQJI3jQNfs9G2ovyHU39DAFRAfdDeYlwgeO2/58DzgYwx
 0k4J/dtsi1xg==
X-IronPort-AV: E=Sophos;i="5.75,457,1589266800"; 
   d="scan'208";a="494819265"
Received: from sshettyx-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.249.64.39])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2020 07:52:56 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [zeus][PATCH 2/4] pypi.bbclass: use new pypi UPSTREAM_CHECK_URI
Date: Mon, 10 Aug 2020 22:52:45 +0800
Message-Id: <b535360f0bd2fb6a057b678f35da1803a31eeba6.1597071024.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1597071024.git.anuj.mittal@intel.com>
References: <cover.1597071024.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tim Orling <timothy.t.orling@linux.intel.com>

Upstream https://pypi.python.org/pypi/${PYPI_PACKAGE}/
redirects to https://pypi.org/project/${PYPI_PACKAGE}/

Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
(cherry picked from commit e5f3f961242d888f3f786af8f793bf1d247fdff0)
[Yocto # 13990]
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/classes/pypi.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/pypi.bbclass b/meta/classes/pypi.bbclass
index ffa8aa3ff4..87b4c85fc0 100644
--- a/meta/classes/pypi.bbclass
+++ b/meta/classes/pypi.bbclass
@@ -22,5 +22,5 @@ SECTION = "devel/python"
 SRC_URI += "${PYPI_SRC_URI}"
 S = "${WORKDIR}/${PYPI_PACKAGE}-${PV}"
 
-UPSTREAM_CHECK_URI ?= "https://pypi.python.org/pypi/${PYPI_PACKAGE}/"
+UPSTREAM_CHECK_URI ?= "https://pypi.org/project/${PYPI_PACKAGE}/"
 UPSTREAM_CHECK_REGEX ?= "/${PYPI_PACKAGE}/(?P<pver>(\d+[\.\-_]*)+)/"
-- 
2.26.2

