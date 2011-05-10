Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QJfVF-0001SO-KU
	for openembedded-core@lists.openembedded.org;
	Tue, 10 May 2011 07:29:01 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 09 May 2011 22:26:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,345,1301900400"; d="scan'208";a="744876583"
Received: from unknown (HELO localhost) ([10.255.12.75])
	by orsmga001.jf.intel.com with ESMTP; 09 May 2011 22:26:18 -0700
Message-Id: <2107aacaa0a0643b2c737307f07de19d07e13a2d.1305004776.git.sgw@linux.intel.com>
In-Reply-To: <cover.1305004776.git.sgw@linux.intel.com>
References: <cover.1305004776.git.sgw@linux.intel.com>
Old-Date: Thu, 5 May 2011 11:29:33 -0500
Date: Mon, 09 May 2011 22:26:17 -0700
To: openembedded-core@lists.openembedded.org
CC: 
From: Saul Wold <sgw@linux.intel.com>
Subject: [PATCH 09/30] siteinfo: add microblaze target info
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 10 May 2011 05:29:01 -0000

From: Adrian Alonso <aalonso@secretlab.ca>

* Add microblaze target info
* Microblaze soft CPU can be configured as big-endian/little-endian
* Currently target info support for microblaze big endian, using prebuilt
  toolchains.

Signed-off-by: Adrian Alonso <aalonso@secretlab.ca>
---
 meta/classes/siteinfo.bbclass |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/meta/classes/siteinfo.bbclass b/meta/classes/siteinfo.bbclass
index 892abc1..436bc39 100644
--- a/meta/classes/siteinfo.bbclass
+++ b/meta/classes/siteinfo.bbclass
@@ -40,6 +40,7 @@ def get_siteinfo_list(d):
                "i486-linux-uclibc":       "endian-little bit-32 common-uclibc ix86-common",\
                "i586-linux-uclibc":       "endian-little bit-32 common-uclibc ix86-common",\
                "i686-linux-uclibc":       "endian-little bit-32 common-uclibc ix86-common",\
+               "microblaze-linux-gnu":    "endian-big bit-32 common-glibc microblaze-common",\
                "mipsel-linux":            "endian-little bit-32 common-glibc mips-common",\
                "mipsel-linux-uclibc":     "endian-little bit-32 common-uclibc mips-common",\
                "mips-linux":              "endian-big bit-32 common-glibc mips-common",\
-- 
1.7.1.1



