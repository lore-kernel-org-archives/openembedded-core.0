Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 114D77239E
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Dec 2014 15:32:49 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 05 Dec 2014 07:32:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.07,522,1413270000"; d="scan'208";a="633299019"
Received: from unknown (HELO peggleto-mobl5.ger.corp.intel.com)
	([10.252.18.22])
	by fmsmga001.fm.intel.com with ESMTP; 05 Dec 2014 07:32:49 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  5 Dec 2014 15:32:42 +0000
Message-Id: <c3538b9cc6a1e53955164e4f22482b7ac609bc75.1417793506.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <cover.1417793506.git.paul.eggleton@linux.intel.com>
References: <cover.1417793506.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1417793506.git.paul.eggleton@linux.intel.com>
References: <cover.1417793506.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/1] buildtools-tarball: restore missing git tools
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
X-List-Received-Date: Fri, 05 Dec 2014 15:32:51 -0000

Since the split out of git-perltools, some git tools (such as "git am",
"git send-email" and "git-submodule") have no longer been part of the
buildtools. We need these, so add them back in.

Fixes [YOCTO #7033].

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/recipes-core/meta/buildtools-tarball.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/meta/buildtools-tarball.bb b/meta/recipes-core/meta/buildtools-tarball.bb
index 58e0ffa..822f4dc 100644
--- a/meta/recipes-core/meta/buildtools-tarball.bb
+++ b/meta/recipes-core/meta/buildtools-tarball.bb
@@ -16,6 +16,7 @@ TOOLCHAIN_HOST_TASK ?= "\
     nativesdk-chrpath \
     nativesdk-tar \
     nativesdk-git \
+    nativesdk-git-perltools \
     nativesdk-pigz \
     nativesdk-make \
     nativesdk-wget \
-- 
1.9.3


