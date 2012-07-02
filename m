Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1SlnbK-0004bR-Fq
	for openembedded-core@lists.openembedded.org;
	Mon, 02 Jul 2012 22:52:06 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q62KetZJ010491
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 2 Jul 2012 13:40:55 -0700 (PDT)
Received: from localhost.localdomain (172.25.34.61) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Mon, 2 Jul 2012 13:40:54 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 2 Jul 2012 15:50:28 -0500
Message-ID: <8d24b139f2f1ce024ad66750cbb00bfc8527af37.1341262097.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1341262097.git.mark.hatle@windriver.com>
References: <cover.1341262097.git.mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 7/7] base.bbclass: Add cross-canadian-${TRANSLATED_TARGET_ARCH} to the license exclusion list
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 02 Jul 2012 20:52:06 -0000
Content-Type: text/plain

This appears to be an oversight in the original implementation.  All of the
host package types were being ignored except for the SDK cross-canadian type.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/classes/base.bbclass |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index 9219170..08065c6 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -432,7 +432,7 @@ python () {
 
         dont_want_license = d.getVar('INCOMPATIBLE_LICENSE', True)
 
-        if dont_want_license and not pn.endswith("-native") and not pn.endswith("-cross") and not pn.endswith("-cross-initial") and not pn.endswith("-cross-intermediate") and not pn.endswith("-crosssdk-intermediate") and not pn.endswith("-crosssdk") and not pn.endswith("-crosssdk-initial") and not pn.endswith("-nativesdk"):
+        if dont_want_license and not pn.endswith("-native") and not pn.endswith("-cross") and not pn.endswith("-cross-initial") and not pn.endswith("-cross-intermediate") and not pn.endswith("-crosssdk-intermediate") and not pn.endswith("-crosssdk") and not pn.endswith("-crosssdk-initial") and not pn.endswith("-cross-canadian-%s" % d.getVar('TRANSLATED_TARGET_ARCH', True)) and not pn.endswith("-nativesdk"):
         # Internally, we'll use the license mapping. This way INCOMPATIBLE_LICENSE = "GPLv2" and
         # INCOMPATIBLE_LICENSE = "GPLv2.0" will pick up all variations of GPL-2.0
             spdx_license = return_spdx(d, dont_want_license)
-- 
1.7.3.4



