Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 92F516B761
	for <openembedded-core@lists.openembedded.org>;
	Sat, 28 Dec 2013 22:30:11 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 28 Dec 2013 14:30:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,567,1384329600"; d="scan'208";a="457010058"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.122.113])
	by fmsmga002.fm.intel.com with ESMTP; 28 Dec 2013 14:30:11 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 28 Dec 2013 22:29:15 +0000
Message-Id: <62fbd81a544a033dbcaca937f3a21b49fca2044c.1388269205.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1388269205.git.paul.eggleton@linux.intel.com>
References: <cover.1388269205.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1388269205.git.paul.eggleton@linux.intel.com>
References: <cover.1388269205.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 19/38] linux-dummy: set reasonable DESCRIPTION
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
X-List-Received-Date: Sat, 28 Dec 2013 22:30:11 -0000

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/recipes-kernel/linux/linux-dummy.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-kernel/linux/linux-dummy.bb b/meta/recipes-kernel/linux/linux-dummy.bb
index acf07e1..bab1ac1 100644
--- a/meta/recipes-kernel/linux/linux-dummy.bb
+++ b/meta/recipes-kernel/linux/linux-dummy.bb
@@ -1,5 +1,8 @@
 SECTION = "kernel"
 SUMMARY = "Dummy Linux kernel"
+DESCRIPTION = "Dummy Linux kernel, to be selected as the preferred \
+provider for virtual/kernel to satisfy dependencies for situations \
+where you wish to build the kernel externally from the build system."
 LICENSE = "GPLv2"
 
 LIC_FILES_CHKSUM = "file://${WORKDIR}/COPYING.GPL;md5=751419260aa954499f7abaabaa882bbe"
-- 
1.8.1.2


