Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RnoKc-0004D6-Ik
	for openembedded-core@lists.openembedded.org;
	Thu, 19 Jan 2012 10:30:54 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 19 Jan 2012 01:23:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="97472118"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.14.6])
	by azsmga001.ch.intel.com with ESMTP; 19 Jan 2012 01:23:02 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Jan 2012 01:22:41 -0800
Message-Id: <171a9c9f73648326529a68244ebcc39b18713552.1326964778.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <cover.1326964778.git.sgw@linux.intel.com>
References: <cover.1326964778.git.sgw@linux.intel.com>
In-Reply-To: <cover.1326964778.git.sgw@linux.intel.com>
References: <cover.1326964778.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 20/33] site/ix86-common: fix an error
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
X-List-Received-Date: Thu, 19 Jan 2012 09:30:54 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

Fixed this line
ac_cv_sizeof_unsigned_char=${ac_cv_sizeof_unsigned_int=1}

as this line
ac_cv_sizeof_unsigned_char=${ac_cv_sizeof_unsigned_char=1}

This issue was causing guile recipe to compile-fail for x86 target.

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 meta/site/ix86-common |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/site/ix86-common b/meta/site/ix86-common
index 512c9a0..e2796eb 100644
--- a/meta/site/ix86-common
+++ b/meta/site/ix86-common
@@ -1,6 +1,6 @@
 # general
 ac_cv_sizeof_char=${ac_cv_sizeof_char=1}
-ac_cv_sizeof_unsigned_char=${ac_cv_sizeof_unsigned_int=1}
+ac_cv_sizeof_unsigned_char=${ac_cv_sizeof_unsigned_char=1}
 ac_cv_sizeof_char_p=${ac_cv_sizeof_char_p=4}
 ac_cv_sizeof_unsigned_char_p=${ac_cv_sizeof_unsigned_char_p=4}
 ac_cv_sizeof_int=${ac_cv_sizeof_int=4}
-- 
1.7.6.5



