Return-Path: <sgw@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 2FAE374230
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 May 2015 15:26:57 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga102.jf.intel.com with ESMTP; 22 May 2015 08:26:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,476,1427785200"; d="scan'208";a="575483088"
Received: from ihoshino-mobl.amr.corp.intel.com (HELO
	swold-mobl.amr.corp.intel.com) ([10.255.86.199])
	by orsmga003.jf.intel.com with ESMTP; 22 May 2015 08:26:52 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 22 May 2015 08:26:48 -0700
Message-Id: <0d17a51b8b0006b24678120f24c20cc49717ec80.1432308259.git.sgw@linux.intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <282662bc963d23782bb7c09425fec988fd4b6a69.1432308259.git.sgw@linux.intel.com>
References: <282662bc963d23782bb7c09425fec988fd4b6a69.1432308259.git.sgw@linux.intel.com>
In-Reply-To: <cover.1432308259.git.sgw@linux.intel.com>
References: <cover.1432308259.git.sgw@linux.intel.com>
Subject: [PATCH 3/3] npth: Upgrade to 1.2
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
X-List-Received-Date: Fri, 22 May 2015 15:26:58 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-support/npth/{npth_1.1.bb => npth_1.2.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/npth/{npth_1.1.bb => npth_1.2.bb} (79%)

diff --git a/meta/recipes-support/npth/npth_1.1.bb b/meta/recipes-support/npth/npth_1.2.bb
similarity index 79%
rename from meta/recipes-support/npth/npth_1.1.bb
rename to meta/recipes-support/npth/npth_1.2.bb
index 72a194e..1b3962e 100644
--- a/meta/recipes-support/npth/npth_1.1.bb
+++ b/meta/recipes-support/npth/npth_1.2.bb
@@ -10,8 +10,8 @@ SRC_URI = "ftp://ftp.gnupg.org/gcrypt/npth/npth-${PV}.tar.bz2 \
            file://pkgconfig.patch \
           "
 
-SRC_URI[md5sum] = "aaffc8ef3e955ab50a1905809f268a23"
-SRC_URI[sha256sum] = "896c561eb2ec8da35f11828fb04a3fbff12d41ff657c799056d7dc4a66e5df7f"
+SRC_URI[md5sum] = "226bac7374b9466c6ec26b1c34dab844"
+SRC_URI[sha256sum] = "6ddbdddb2cf49a4723f9d1ad6563c480d6760dcb63cb7726b8fc3bc2e1b6c08a"
 
 BINCONFIG = "${bindir}/npth-config"
 
-- 
2.1.0


