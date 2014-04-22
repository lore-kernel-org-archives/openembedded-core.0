Return-Path: <sgw@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 7675E65D68
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Apr 2014 23:49:38 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 22 Apr 2014 16:49:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,907,1389772800"; d="scan'208";a="497712229"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.12.182])
	by orsmga001.jf.intel.com with ESMTP; 22 Apr 2014 16:49:39 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 22 Apr 2014 16:49:25 -0700
Message-Id: <3936015f8caeb6ca945469bec93e80138ee209e2.1398210385.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1398210385.git.sgw@linux.intel.com>
References: <cover.1398210385.git.sgw@linux.intel.com>
In-Reply-To: <cover.1398210385.git.sgw@linux.intel.com>
References: <cover.1398210385.git.sgw@linux.intel.com>
Subject: [PATCH 03/10] lsbinitscripts: update to 9.53
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
X-List-Received-Date: Tue, 22 Apr 2014 23:49:38 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../lsb/{lsbinitscripts_9.52.bb => lsbinitscripts_9.53.bb}          | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-extended/lsb/{lsbinitscripts_9.52.bb => lsbinitscripts_9.53.bb} (78%)

diff --git a/meta/recipes-extended/lsb/lsbinitscripts_9.52.bb b/meta/recipes-extended/lsb/lsbinitscripts_9.53.bb
similarity index 78%
rename from meta/recipes-extended/lsb/lsbinitscripts_9.52.bb
rename to meta/recipes-extended/lsb/lsbinitscripts_9.53.bb
index 11deae2..ecad90e 100644
--- a/meta/recipes-extended/lsb/lsbinitscripts_9.52.bb
+++ b/meta/recipes-extended/lsb/lsbinitscripts_9.53.bb
@@ -6,12 +6,12 @@ DEPENDS = "popt glib-2.0"
 LIC_FILES_CHKSUM = "file://COPYING;md5=ebf4e8b49780ab187d51bd26aaa022c6"
 
 S="${WORKDIR}/initscripts-${PV}"
-SRC_URI = "http://pkgs.fedoraproject.org/repo/pkgs/initscripts/initscripts-${PV}.tar.bz2/2453811ec27a781a77f309f356663d9e/initscripts-${PV}.tar.bz2 \
+SRC_URI = "http://pkgs.fedoraproject.org/repo/pkgs/initscripts/initscripts-9.53.tar.bz2/6842b4279d67acae40ce14263e241805/initscripts-9.53.tar.bz2 \
            file://functions.patch \
           " 
 
-SRC_URI[md5sum] = "2453811ec27a781a77f309f356663d9e"
-SRC_URI[sha256sum] = "0b3bb828a5d3a3f210b8e606c0416813ba0d021a859658af14810865d2ee8867"
+SRC_URI[md5sum] = "6842b4279d67acae40ce14263e241805"
+SRC_URI[sha256sum] = "b4d97e259de34a5afc2b08bdc402201f4d0a0e02b4961f12c02ff461a5b305e1"
 
 inherit update-alternatives
 
-- 
1.8.3.1


