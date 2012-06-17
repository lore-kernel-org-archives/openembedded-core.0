Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Sg8Nz-0008Qo-NZ
	for openembedded-core@lists.openembedded.org;
	Sun, 17 Jun 2012 07:50:55 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 16 Jun 2012 22:40:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="181103305"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.105])
	by fmsmga002.fm.intel.com with ESMTP; 16 Jun 2012 22:40:11 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 16 Jun 2012 22:39:58 -0700
Message-Id: <d38794184acfa63a130e477bd159ec2a90eace6f.1339911478.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1339911478.git.sgw@linux.intel.com>
References: <cover.1339911478.git.sgw@linux.intel.com>
In-Reply-To: <cover.1339911478.git.sgw@linux.intel.com>
References: <cover.1339911478.git.sgw@linux.intel.com>
Subject: [Consolidated Pull 14/23] multilib.conf: Add the support of multilib for lsbinitscripts
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
X-List-Received-Date: Sun, 17 Jun 2012 05:50:56 -0000

From: Xiaofeng Yan <xiaofeng.yan@windriver.com>

Add the multilib support for this package to multilib.conf because error will
appear when building an lib32-core-image-lsb without this patch.

[YOCTO #2571]

Signed-off-by: Xiaofeng Yan <xiaofeng.yan@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/multilib.conf |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/meta/conf/multilib.conf b/meta/conf/multilib.conf
index 9fc5a90..cea8694 100644
--- a/meta/conf/multilib.conf
+++ b/meta/conf/multilib.conf
@@ -420,6 +420,7 @@ BBCLASSEXTEND_append_pn-lrzsz = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-lsb = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-lsbsetup = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-lsbtest = " ${MULTILIBS}"
+BBCLASSEXTEND_append_pn-lsbinitscripts = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-lsof = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-ltp = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-lttng-control = " ${MULTILIBS}"
-- 
1.7.7.6



