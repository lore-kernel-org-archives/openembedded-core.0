Return-Path: <anibal.limon@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id C211560069
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Apr 2017 17:10:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=intel.com; i=@intel.com; q=dns/txt; s=intel;
	t=1491844255; x=1523380255;
	h=from:to:cc:subject:date:message-id:mime-version:
	content-transfer-encoding;
	bh=TboRC74mTOWMDC6l/y633RiBFYXi2JyHN1ujUUWZQEg=;
	b=eV5fhKwZH/Ofr8SQLkmszeASfi5aKQ0mU6FnFGuHqLXWzujxg/AYSe7r
	98L5zXW2+xfbRuTiMYJvz2mK65RSDw==;
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	10 Apr 2017 10:10:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.37,182,1488873600"; d="scan'208";a="85686460"
Received: from alimonb-mobl1.zpn.intel.com ([10.219.128.122])
	by orsmga005.jf.intel.com with ESMTP; 10 Apr 2017 10:10:50 -0700
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 10 Apr 2017 12:15:03 -0500
Message-Id: <1491844503-9312-1-git-send-email-anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
Subject: [PATCH] ptest-runner: Upgrade to minor version 2.0.2
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
X-List-Received-Date: Mon, 10 Apr 2017 17:10:55 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

To fix a problem when print ERROR after a ptest timeout, this
causes the user confusion about if a test ends or not.

[YOCTO #10842]

Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
---
 .../ptest-runner/{ptest-runner_2.0.bb => ptest-runner_2.0.2.bb}       | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/ptest-runner/{ptest-runner_2.0.bb => ptest-runner_2.0.2.bb} (89%)

diff --git a/meta/recipes-support/ptest-runner/ptest-runner_2.0.bb b/meta/recipes-support/ptest-runner/ptest-runner_2.0.2.bb
similarity index 89%
rename from meta/recipes-support/ptest-runner/ptest-runner_2.0.bb
rename to meta/recipes-support/ptest-runner/ptest-runner_2.0.2.bb
index 9d45513..a3e9a7e 100644
--- a/meta/recipes-support/ptest-runner/ptest-runner_2.0.bb
+++ b/meta/recipes-support/ptest-runner/ptest-runner_2.0.2.bb
@@ -7,8 +7,8 @@ HOMEPAGE = "http://git.yoctoproject.org/cgit/cgit.cgi/ptest-runner2/about/"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=751419260aa954499f7abaabaa882bbe"
 
-SRCREV = "e2aa4256745377b784c8691f546041b59f6e046b"
-PV = "2.0.1+git${SRCPV}"
+SRCREV = "6d2872116cd9d6e1617a768f9d72bbf091489b2d"
+PV = "2.0.2+git${SRCPV}"
 
 SRC_URI = "git://git.yoctoproject.org/ptest-runner2"
 S = "${WORKDIR}/git"
-- 
2.1.4


