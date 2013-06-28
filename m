Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 267A76AE86
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jun 2013 16:19:25 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 28 Jun 2013 09:19:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,958,1363158000"; d="scan'208";a="357336991"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.122.97])
	by fmsmga001.fm.intel.com with ESMTP; 28 Jun 2013 09:20:03 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 28 Jun 2013 17:19:07 +0100
Message-Id: <4ca52451c62261c9104a14d525c595279b0614e9.1372436217.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1372436217.git.paul.eggleton@linux.intel.com>
References: <cover.1372436217.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1372436217.git.paul.eggleton@linux.intel.com>
References: <cover.1372436217.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 6/6] packagegroup-self-hosted: add python-git
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
X-List-Received-Date: Fri, 28 Jun 2013 16:19:25 -0000

python-git is needed by buildhistory-diff, so add it to this
packagegroup allowing buildhistory-diff to be used within
build-appliance-image.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/recipes-core/packagegroups/packagegroup-self-hosted.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb b/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
index ed73617..8473a92 100644
--- a/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
@@ -154,6 +154,7 @@ RDEPENDS_packagegroup-self-hosted-extended = "\
     python-elementtree \
     python-email \
     python-fcntl \
+    python-git \
     python-logging \
     python-misc \
     python-multiprocessing \
-- 
1.8.1.2


