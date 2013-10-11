Return-Path: <sgw@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id C3A676D032
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Oct 2013 15:27:31 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 11 Oct 2013 08:27:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.90,1081,1371106800"; d="scan'208";a="373506444"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.15.234])
	by azsmga001.ch.intel.com with ESMTP; 11 Oct 2013 08:27:33 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 11 Oct 2013 08:27:19 -0700
Message-Id: <8679eec425909713b55c4bdb92b5d1891cc0709e.1381505051.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <664cd9c705a03b0529f30e091b6e8b721ef13a09.1381505051.git.sgw@linux.intel.com>
References: <664cd9c705a03b0529f30e091b6e8b721ef13a09.1381505051.git.sgw@linux.intel.com>
In-Reply-To: <cover.1381505051.git.sgw@linux.intel.com>
References: <cover.1381505051.git.sgw@linux.intel.com>
Subject: [PATCH 13/18] lsbinitscripts: Update to 9.50
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
X-List-Received-Date: Fri, 11 Oct 2013 15:27:32 -0000

(From OE-Core rev: 9fc6cf7a16b2c6e0f0e1bceec7e89a378b4bd9f6)

Signed-off-by: Saul Wold <sgw@linux.intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../lsb/{lsbinitscripts_9.48.bb => lsbinitscripts_9.50.bb}          | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-extended/lsb/{lsbinitscripts_9.48.bb => lsbinitscripts_9.50.bb} (78%)

diff --git a/meta/recipes-extended/lsb/lsbinitscripts_9.48.bb b/meta/recipes-extended/lsb/lsbinitscripts_9.50.bb
similarity index 78%
rename from meta/recipes-extended/lsb/lsbinitscripts_9.48.bb
rename to meta/recipes-extended/lsb/lsbinitscripts_9.50.bb
index 3011f98..3071b6a 100644
--- a/meta/recipes-extended/lsb/lsbinitscripts_9.48.bb
+++ b/meta/recipes-extended/lsb/lsbinitscripts_9.50.bb
@@ -6,12 +6,12 @@ DEPENDS = "popt glib-2.0"
 LIC_FILES_CHKSUM = "file://COPYING;md5=ebf4e8b49780ab187d51bd26aaa022c6"
 
 S="${WORKDIR}/initscripts-${PV}"
-SRC_URI = "http://pkgs.fedoraproject.org/repo/pkgs/initscripts/initscripts-9.48.tar.bz2/7dfab81a5a8d3f0dea5ba55e391c26f3/initscripts-9.48.tar.bz2 \
+SRC_URI = "http://pkgs.fedoraproject.org/repo/pkgs/initscripts/initscripts-9.50.tar.bz2/7252642952d33be10cc00beb862c7b7b/initscripts-9.50.tar.bz2 \
            file://functions.patch \
           " 
 
-SRC_URI[md5sum] = "7dfab81a5a8d3f0dea5ba55e391c26f3"
-SRC_URI[sha256sum] = "5f786121269383d81117532877f6488b48c52a544e0013528dc52c8924f70455"
+SRC_URI[md5sum] = "7252642952d33be10cc00beb862c7b7b"
+SRC_URI[sha256sum] = "1d8fb32b9a7de0c24437acdab27d71deb58c05314f81978ec2aea574fba862e0"
 
 inherit update-alternatives
 
-- 
1.8.3.1


