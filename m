Return-Path: <alejandro.hernandez@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 97DF6731DD
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Jun 2016 05:57:10 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga101.fm.intel.com with ESMTP; 07 Jun 2016 22:57:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,437,1459839600"; d="scan'208";a="993287629"
Received: from yctb02.ostc.intel.com (HELO yctb02.otcr.jf.intel.com)
	([10.54.69.56])
	by orsmga002.jf.intel.com with ESMTP; 07 Jun 2016 22:57:09 -0700
From: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  8 Jun 2016 05:56:13 +0000
Message-Id: <d569eff9957384d9f04fc1c3b3f54c9dd61e6cb9.1465365165.git.alejandro.hernandez@linux.intel.com>
X-Mailer: git-send-email 2.6.6
In-Reply-To: <12b9dd4338999b75a21fd1d293fa911e9dca3f1e.1465365165.git.alejandro.hernandez@linux.intel.com>
References: <12b9dd4338999b75a21fd1d293fa911e9dca3f1e.1465365165.git.alejandro.hernandez@linux.intel.com>
In-Reply-To: <cover.1465365165.git.alejandro.hernandez@linux.intel.com>
References: <cover.1465365165.git.alejandro.hernandez@linux.intel.com>
Subject: [PATCH 7/9] python3-pygobject: Upgrade from 3.18.2 to 3.21.0
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
X-List-Received-Date: Wed, 08 Jun 2016 05:57:11 -0000

Signed-off-by: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
---
 .../{python3-pygobject_3.18.2.bb => python3-pygobject_3.21.0.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-pygobject_3.18.2.bb => python3-pygobject_3.21.0.bb} (81%)

diff --git a/meta/recipes-devtools/python/python3-pygobject_3.18.2.bb b/meta/recipes-devtools/python/python3-pygobject_3.21.0.bb
similarity index 81%
rename from meta/recipes-devtools/python/python3-pygobject_3.18.2.bb
rename to meta/recipes-devtools/python/python3-pygobject_3.21.0.bb
index 4ddae81..e5990d6 100644
--- a/meta/recipes-devtools/python/python3-pygobject_3.18.2.bb
+++ b/meta/recipes-devtools/python/python3-pygobject_3.21.0.bb
@@ -13,8 +13,8 @@ SRC_URI = " \
     file://0001-configure.ac-add-sysroot-path-to-GI_DATADIR-don-t-se.patch \
 "
 
-SRC_URI[md5sum] = "0a956f3e785e23b0f136832f2e57a862"
-SRC_URI[sha256sum] = "2a3cad1517916b74e131e6002c3824361aee0671ffb0d55ded119477fc1c2c5f"
+SRC_URI[md5sum] = "a6dba83e3a7df52ba80bd02906f74611"
+SRC_URI[sha256sum] = "898c9ef2f80968ccf33d6fbd5087b1721b74792a308b277d02bc935450168a58"
 
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
-- 
2.6.6


