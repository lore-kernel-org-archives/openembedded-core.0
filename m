Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 4D0D671633
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Mar 2016 09:40:39 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u2S9ee0h007482
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Mar 2016 02:40:40 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Mon, 28 Mar 2016 02:40:39 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 28 Mar 2016 02:40:29 -0700
Message-ID: <f6444b900c8f30eec2571d51e33a84b3484de97a.1459157937.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1459157937.git.liezhi.yang@windriver.com>
References: <cover.1459157937.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 8/8] cdrtools: update SRC_URI
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
X-List-Received-Date: Mon, 28 Mar 2016 09:40:39 -0000
Content-Type: text/plain

From: Ross Burton <ross.burton@intel.com>

Upstream released their 3.01 so the alpha releases we were downloading have
moved.  Update the SRC_URI so it continues to download.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-devtools/cdrtools/cdrtools-native_3.01a31.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/cdrtools/cdrtools-native_3.01a31.bb b/meta/recipes-devtools/cdrtools/cdrtools-native_3.01a31.bb
index d0f36e2..50e284c 100644
--- a/meta/recipes-devtools/cdrtools/cdrtools-native_3.01a31.bb
+++ b/meta/recipes-devtools/cdrtools/cdrtools-native_3.01a31.bb
@@ -7,7 +7,7 @@ SECTION = "console/utils"
 LICENSE = "GPLv2 & CDDL-1.0 & LGPLv2.1+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=32f68170be424c2cd64804337726b312"
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/project/cdrtools/alpha/cdrtools-${PV}.tar.bz2"
+SRC_URI = "${SOURCEFORGE_MIRROR}/project/cdrtools/alpha/OLD/3.01aX/cdrtools-${PV}.tar.bz2"
 
 SRC_URI[md5sum] = "78172557894f469b4584d008e93ec469"
 SRC_URI[sha256sum] = "183b5c12777779e78d8b69461aae52401f863768e7e7391d60730006f8cadc5a"
-- 
2.7.4


