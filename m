Return-Path: <nitin.a.kamble@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 9F8C46A4D2
	for <Openembedded-core@lists.openembedded.org>;
	Thu,  6 Jun 2013 02:30:41 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 05 Jun 2013 19:28:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,811,1363158000"; d="scan'208";a="324978393"
Received: from yocto-hm1.jf.intel.com ([10.23.232.34])
	by orsmga001.jf.intel.com with ESMTP; 05 Jun 2013 19:30:14 -0700
From: nitin.a.kamble@intel.com
To: Openembedded-core@lists.openembedded.org
Date: Wed,  5 Jun 2013 19:28:25 +0000
Message-Id: <9d0b35fe8c4d81bc9034d7ab3086ba9550e63591.1370460463.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.8.1.4
In-Reply-To: <cover.1370460463.git.nitin.a.kamble@intel.com>
References: <cover.1370460463.git.nitin.a.kamble@intel.com>
Subject: [PATCH 1/1] tools-testapps: add xserver in dependency
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
X-List-Received-Date: Thu, 06 Jun 2013 02:30:41 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

This package group adds packages needing Xserver, These packages
demand X drivers such as EMGD driver. And if the image does not
include Xserver then it causes a build error about Xserver like
this:
   Error: no package provides xorg-abi-video-8

Fix the issue by adding Xserver as one of the dependency.

Fixes this bug:
[YOCTO #4615]

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 meta/recipes-core/packagegroups/packagegroup-core-tools-testapps.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/packagegroups/packagegroup-core-tools-testapps.bb b/meta/recipes-core/packagegroups/packagegroup-core-tools-testapps.bb
index 343ae1c..6619a98 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-tools-testapps.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-tools-testapps.bb
@@ -5,7 +5,7 @@
 SUMMARY = "Testing tools/applications"
 LICENSE = "MIT"
 
-PR = "r2"
+PR = "r3"
 
 inherit packagegroup
 
@@ -44,4 +44,5 @@ RDEPENDS_${PN} = "\
     xvideo-tests \
     ltp \
     connman-client \
+    xserver-xorg \
     "
-- 
1.8.1.4


