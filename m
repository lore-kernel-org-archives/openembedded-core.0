Return-Path: <anibal.limon@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 5EFB67760E
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 May 2017 18:08:13 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	01 May 2017 11:08:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.37,401,1488873600"; d="scan'208";a="851733827"
Received: from jmadams-mobl.amr.corp.intel.com (HELO
	alimonb-mobl1.zpn.intel.com) ([10.254.179.75])
	by FMSMGA003.fm.intel.com with ESMTP; 01 May 2017 11:08:11 -0700
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  1 May 2017 13:08:07 -0500
Message-Id: <1493662087-12167-2-git-send-email-anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1493662087-12167-1-git-send-email-anibal.limon@linux.intel.com>
References: <1493662087-12167-1-git-send-email-anibal.limon@linux.intel.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] ptest-runner: Upgrade tto to 2.1+gitAUTOINC+78afe246fb
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 01 May 2017 18:08:13 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The new 2.1 version supports creating XML results specifying the
-x option.

The xml output format can be see here [1].

[1] https://wiki.yoctoproject.org/wiki/QA/xUnit_XML_Template

Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
---
 .../ptest-runner/{ptest-runner_2.0.2.bb => ptest-runner_2.1.bb}       | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/ptest-runner/{ptest-runner_2.0.2.bb => ptest-runner_2.1.bb} (89%)

diff --git a/meta/recipes-support/ptest-runner/ptest-runner_2.0.2.bb b/meta/recipes-support/ptest-runner/ptest-runner_2.1.bb
similarity index 89%
rename from meta/recipes-support/ptest-runner/ptest-runner_2.0.2.bb
rename to meta/recipes-support/ptest-runner/ptest-runner_2.1.bb
index a3e9a7e..89d709a 100644
--- a/meta/recipes-support/ptest-runner/ptest-runner_2.0.2.bb
+++ b/meta/recipes-support/ptest-runner/ptest-runner_2.1.bb
@@ -7,8 +7,8 @@ HOMEPAGE = "http://git.yoctoproject.org/cgit/cgit.cgi/ptest-runner2/about/"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=751419260aa954499f7abaabaa882bbe"
 
-SRCREV = "6d2872116cd9d6e1617a768f9d72bbf091489b2d"
-PV = "2.0.2+git${SRCPV}"
+SRCREV = "78afe246fb8cb864656c16dd5d1cfa5721ccc8b7"
+PV = "2.1+git${SRCPV}"
 
 SRC_URI = "git://git.yoctoproject.org/ptest-runner2"
 S = "${WORKDIR}/git"
-- 
2.1.4


