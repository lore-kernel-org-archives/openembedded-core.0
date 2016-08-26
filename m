Return-Path: <joshua.g.lock@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 995EE7706C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Aug 2016 15:43:13 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga103.jf.intel.com with ESMTP; 26 Aug 2016 08:43:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,581,1464678000"; d="scan'208";a="1020782684"
Received: from jlock-mobl1.ger.corp.intel.com ([10.252.3.89])
	by orsmga001.jf.intel.com with ESMTP; 26 Aug 2016 08:43:14 -0700
From: Joshua Lock <joshua.g.lock@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 26 Aug 2016 16:43:05 +0100
Message-Id: <81a35da5b46204d44e1d94346255b38590d49d9b.1472225461.git.joshua.g.lock@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1472225461.git.joshua.g.lock@intel.com>
References: <cover.1472225461.git.joshua.g.lock@intel.com>
In-Reply-To: <cover.1472225461.git.joshua.g.lock@intel.com>
References: <cover.1472225461.git.joshua.g.lock@intel.com>
Subject: [PATCH 1/2] buildtools-tarball: add tar
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
X-List-Received-Date: Fri, 26 Aug 2016 15:43:13 -0000

We'd like to make use of features which aren't available in tar
versions prior to 1.27, therefore add tar to the buildtools-tarball
so that older distributions can still perform builds.

Signed-off-by: Joshua Lock <joshua.g.lock@intel.com>
---
 meta/recipes-core/meta/buildtools-tarball.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/meta/buildtools-tarball.bb b/meta/recipes-core/meta/buildtools-tarball.bb
index 34df531..f28a8c3 100644
--- a/meta/recipes-core/meta/buildtools-tarball.bb
+++ b/meta/recipes-core/meta/buildtools-tarball.bb
@@ -24,6 +24,7 @@ TOOLCHAIN_HOST_TASK ?= "\
     nativesdk-ca-certificates \
     nativesdk-texinfo \
     nativesdk-locale-base-en-us \
+    nativesdk-tar \
     "
 
 SDK_PACKAGE_ARCHS += "buildtools-dummy-${SDKPKGSUFFIX}"
-- 
2.7.4


