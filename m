Received: from mga18.intel.com (mga18.intel.com [])
 by mx.groups.io with SMTP id smtpd.web11.9634.1605627379456851254
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Nov 2020 07:36:35 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: vV11XI+zlnhaDy0X0s+8r5wfUm4Cla7VeKoYmXSiSQEvVhUpUMqt4SHl+UEhdf9wac+2VCI/tq
 VP0AUd5LeDzA==
X-IronPort-AV: E=McAfee;i="6000,8403,9808"; a="158720032"
X-IronPort-AV: E=Sophos;i="5.77,485,1596524400"; 
   d="scan'208";a="158720032"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2020 07:36:35 -0800
IronPort-SDR: m4xqGvSG7hRvNuKamknHTT/l8XzArPoxozSDxEd4dNjGxO5VtTX5LyPP9F/5QAd4TzVEGxJsNv
 lgeebTbZx4bw==
X-IronPort-AV: E=Sophos;i="5.77,485,1596524400"; 
   d="scan'208";a="400803000"
Received: from sbinisma-mobl2.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.213.40.254])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2020 07:36:34 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 16/19] libbsd: Remove BSD-4-Clause from main package
Date: Tue, 17 Nov 2020 23:36:05 +0800
Message-Id: <e822d8423fb836cc821b5c87d1b4f30477a313fd.1605626675.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <cover.1605626675.git.anuj.mittal@intel.com>
References: <cover.1605626675.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mark Jonas <toertel@gmail.com>

libbsd contains a multitude of licenses. For (commercial) projects the
3rd clause of the BSD-4-Clause license can be problematic. But only a
few man pages use this license. This means that the main package
containing the binary library itself is not under BSD-4-Clause ruling.

Signed-off-by: Mark Jonas <toertel@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 9c3e3f83b5fb162d161a7b9773d426418a22c05f)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-support/libbsd/libbsd_0.10.0.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-support/libbsd/libbsd_0.10.0.bb b/meta/recipes-support/libbsd/libbsd_0.10.0.bb
index 3b9ac5a01f..5b32b9af41 100644
--- a/meta/recipes-support/libbsd/libbsd_0.10.0.bb
+++ b/meta/recipes-support/libbsd/libbsd_0.10.0.bb
@@ -27,7 +27,8 @@ HOMEPAGE = "https://libbsd.freedesktop.org/wiki/"
 # License: ISC-Original
 # License: public-domain
 # License: public-domain-Colin-Plumb
-LICENSE = "BSD-4-Clause & ISC & PD"
+LICENSE = "BSD-3-Clause & BSD-4-Clause & ISC & PD"
+LICENSE_${PN} = "BSD-3-Clause & ISC & PD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=2120be0173469a06ed185b688e0e1ae0"
 SECTION = "libs"
 
-- 
2.28.0

