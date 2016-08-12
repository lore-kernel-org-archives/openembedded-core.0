Return-Path: <alejandro.hernandez@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 707C27726B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Aug 2016 21:06:54 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga102.fm.intel.com with ESMTP; 12 Aug 2016 14:06:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,512,1464678000"; d="scan'208";a="864546312"
Received: from yctb02.ostc.intel.com (HELO yctb02.otcr.jf.intel.com)
	([10.54.69.56])
	by orsmga003.jf.intel.com with ESMTP; 12 Aug 2016 14:06:53 -0700
From: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 12 Aug 2016 21:03:35 +0000
Message-Id: <91edba072fe86b6d4a241c548fe04337d4008ff4.1471026724.git.alejandro.hernandez@linux.intel.com>
X-Mailer: git-send-email 2.6.6
In-Reply-To: <5e7ef6c13822259be4c3a29b2a8105a9d02d7f08.1471026724.git.alejandro.hernandez@linux.intel.com>
References: <5e7ef6c13822259be4c3a29b2a8105a9d02d7f08.1471026724.git.alejandro.hernandez@linux.intel.com>
In-Reply-To: <cover.1471026724.git.alejandro.hernandez@linux.intel.com>
References: <cover.1471026724.git.alejandro.hernandez@linux.intel.com>
Subject: [PATCH 3/3] python3-git: Fixes dependencies, avoiding to install python3-misc
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
X-List-Received-Date: Fri, 12 Aug 2016 21:06:55 -0000

This patch adds the following dependencies to be able to import git on
python3: python3-enum, python3-logging, python3-datetime, python3-netclient.

[YOCTO #9757]

Signed-off-by: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
---
 meta/recipes-devtools/python/python3-git_2.0.7.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-git_2.0.7.bb b/meta/recipes-devtools/python/python3-git_2.0.7.bb
index 6620444..c9fe9ba 100644
--- a/meta/recipes-devtools/python/python3-git_2.0.7.bb
+++ b/meta/recipes-devtools/python/python3-git_2.0.7.bb
@@ -4,4 +4,4 @@ DEPENDS = "python3-gitdb"
 
 inherit setuptools3
 
-RDEPENDS_${PN} += "python3-gitdb python3-lang python3-io python3-shell python3-math python3-re python3-subprocess python3-stringold python3-unixadmin"
+RDEPENDS_${PN} += "python3-gitdb python3-lang python3-io python3-shell python3-math python3-re python3-subprocess python3-stringold python3-unixadmin python3-enum python3-logging python3-datetime python3-netclient"
-- 
2.6.6


