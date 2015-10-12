Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 022737703D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Oct 2015 13:49:27 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga102.fm.intel.com with ESMTP; 12 Oct 2015 06:49:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,673,1437462000"; d="scan'208";a="824745428"
Received: from skhizaka-mobl.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.5.208])
	by orsmga002.jf.intel.com with ESMTP; 12 Oct 2015 06:49:27 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 12 Oct 2015 14:49:10 +0100
Message-Id: <cd708ddf274f1055b1b91364d55ae2f3680b2d5a.1444657696.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1444657696.git.paul.eggleton@linux.intel.com>
References: <cover.1444657696.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1444657696.git.paul.eggleton@linux.intel.com>
References: <cover.1444657696.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 2/3] build-compare: drop PATCHTOOL setting
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
X-List-Received-Date: Mon, 12 Oct 2015 13:49:28 -0000

We don't need PATCHTOOL to be set to git in this recipe, and setting it
that way requires that the running user has git user & email configured,
which on a build server it might well not be.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/recipes-devtools/build-compare/build-compare_git.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-devtools/build-compare/build-compare_git.bb b/meta/recipes-devtools/build-compare/build-compare_git.bb
index 7ac3784..676f11d 100644
--- a/meta/recipes-devtools/build-compare/build-compare_git.bb
+++ b/meta/recipes-devtools/build-compare/build-compare_git.bb
@@ -10,7 +10,6 @@ SRC_URI = "git://github.com/openSUSE/build-compare.git \
            file://Ignore-DWARF-sections.patch;striplevel=1 \
            file://0001-Add-support-for-deb-and-ipk-packaging.patch \
            "
-PATCHTOOL = "git"
 
 SRCREV = "c5352c054c6ef15735da31b76d6d88620f4aff0a"
 
-- 
2.1.0


