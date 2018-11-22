Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	by mail.openembedded.org (Postfix) with ESMTP id A87D26C5EF
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Nov 2018 21:56:01 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
	by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	22 Nov 2018 13:56:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,267,1539673200"; d="scan'208";a="94178158"
Received: from schong-mobl1.gar.corp.intel.com (HELO localhost.localdomain)
	([10.255.178.145])
	by orsmga008.jf.intel.com with ESMTP; 22 Nov 2018 13:56:00 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 23 Nov 2018 10:55:50 +1300
Message-Id: <ce1f3acd80c56e712571e76342fa72265838258b.1542923737.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.17.2
In-Reply-To: <cover.1542923737.git.paul.eggleton@linux.intel.com>
References: <cover.1542923737.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/1] socat: fix LICENSE
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
X-List-Received-Date: Thu, 22 Nov 2018 21:56:01 -0000

According to both the README and source headers, the LICENSE value for
socat is explicitly GPLv2, not v2 or later, so adjust LICENSE
accordingly (leaving aside whether "GPL-2.0+-with-OpenSSL-exception"
should actually be considered a valid LICENSE string or not).

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/recipes-connectivity/socat/socat_1.7.3.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/socat/socat_1.7.3.2.bb b/meta/recipes-connectivity/socat/socat_1.7.3.2.bb
index 927df7463ae..b2d6b1dea4a 100644
--- a/meta/recipes-connectivity/socat/socat_1.7.3.2.bb
+++ b/meta/recipes-connectivity/socat/socat_1.7.3.2.bb
@@ -7,7 +7,7 @@ SECTION = "console/network"
 
 DEPENDS = "openssl readline"
 
-LICENSE = "GPL-2.0+-with-OpenSSL-exception"
+LICENSE = "GPL-2.0-with-OpenSSL-exception"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://README;beginline=257;endline=287;md5=338c05eadd013872abb1d6e198e10a3f"
 
-- 
2.17.2


