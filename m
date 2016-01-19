Return-Path: <alejandro.hernandez@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id C0384731BD
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jan 2016 21:55:47 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga101.fm.intel.com with ESMTP; 19 Jan 2016 13:55:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,319,1449561600"; d="scan'208";a="32546158"
Received: from yctb02.ostc.intel.com (HELO yctb02.otcr.intel.com)
	([10.23.219.47])
	by fmsmga004.fm.intel.com with ESMTP; 19 Jan 2016 13:55:40 -0800
From: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Jan 2016 21:56:24 +0000
Message-Id: <cbf1df80ebfa0611333ac37e9adf4c7c28db6338.1453239938.git.alejandro.hernandez@linux.intel.com>
X-Mailer: git-send-email 1.8.4.5
In-Reply-To: <cover.1453239938.git.alejandro.hernandez@linux.intel.com>
References: <cover.1453239938.git.alejandro.hernandez@linux.intel.com>
Subject: [PATCH 1/9] python3-setuptools: upgrade to 19.2
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
X-List-Received-Date: Tue, 19 Jan 2016 21:55:48 -0000

Signed-off-by: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
---
 .../{python3-setuptools_18.7.1.bb => python3-setuptools_19.2.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-setuptools_18.7.1.bb => python3-setuptools_19.2.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-setuptools_18.7.1.bb b/meta/recipes-devtools/python/python3-setuptools_19.2.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-setuptools_18.7.1.bb
rename to meta/recipes-devtools/python/python3-setuptools_19.2.bb
index eaf6e47..bb57982 100644
--- a/meta/recipes-devtools/python/python3-setuptools_18.7.1.bb
+++ b/meta/recipes-devtools/python/python3-setuptools_19.2.bb
@@ -11,8 +11,8 @@ DEPENDS_class-native += "python3-native"
 SRC_URI = " \
   http://pypi.python.org/packages/source/s/${SRCNAME}/${SRCNAME}-${PV}.tar.gz \
 "
-SRC_URI[md5sum] = "a0984da9cd8d7b582e1fd7de67dfdbcc"
-SRC_URI[sha256sum] = "aff36c95035e0b311eacb1434e3f7e85f5ccaad477773847e582978f8f45bd74"
+SRC_URI[md5sum] = "78353b1f80375ca5e088f4b4627ffe03"
+SRC_URI[sha256sum] = "f90ed8eb70b14b0594ba74e9de4ffca040c0ec8ee505cbf3570499467859f71a"
 UPSTREAM_CHECK_URI = "https://pypi.python.org/pypi/setuptools"
 
 S = "${WORKDIR}/${SRCNAME}-${PV}"
-- 
1.8.4.5


