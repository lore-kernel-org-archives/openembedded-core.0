Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 90AAB60232
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Dec 2014 17:02:17 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga102.jf.intel.com with ESMTP; 30 Dec 2014 09:00:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,862,1389772800"; d="scan'208";a="435018735"
Received: from kolmos-mobl.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.19.251])
	by FMSMGA003.fm.intel.com with ESMTP; 30 Dec 2014 08:50:17 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 30 Dec 2014 17:02:06 +0000
Message-Id: <eacae9b451c6e4c49bc971e7dda05aaf44416e48.1419958884.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <cover.1419958884.git.paul.eggleton@linux.intel.com>
References: <cover.1419958884.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1419958884.git.paul.eggleton@linux.intel.com>
References: <cover.1419958884.git.paul.eggleton@linux.intel.com>
Subject: [dizzy][PATCH 1/2] packagegroup-self-hosted: add git-perltools
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
X-List-Received-Date: Tue, 30 Dec 2014 17:02:17 -0000

From: Jackie Huang <jackie.huang@windriver.com>

git-perltools provides some usefull git tools like:
git-submodule, git-request-pull, git-send-email, git-am, etc.

We should have it added in self-hosted image.

(From OE-Core master rev: 4b0cbdc9c94b336f3102d4cce1886842b28ce6d5)

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-core/packagegroups/packagegroup-self-hosted.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb b/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
index 65aca7f..f95ce77 100644
--- a/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
@@ -120,6 +120,7 @@ RDEPENDS_packagegroup-self-hosted-extended = "\
     gettext \
     gettext-runtime \
     git \
+    git-perltools \
     grep \
     groff \
     gzip \
-- 
1.9.3


