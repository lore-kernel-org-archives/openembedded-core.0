Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QHPJf-0001zm-Iy
	for openembedded-core@lists.openembedded.org;
	Wed, 04 May 2011 01:47:43 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 03 May 2011 16:44:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,312,1301900400"; d="scan'208";a="429934648"
Received: from unknown (HELO localhost) ([10.255.13.11])
	by azsmga001.ch.intel.com with ESMTP; 03 May 2011 16:44:48 -0700
Message-Id: <8c4a20031e38e1294b1cd2fb816a3ca802ba1eef.1304465724.git.sgw@linux.intel.com>
In-Reply-To: <cover.1304465724.git.sgw@linux.intel.com>
References: <cover.1304465724.git.sgw@linux.intel.com>
Old-Date: Fri, 29 Apr 2011 17:39:09 +0800
Date: Tue, 03 May 2011 16:44:48 -0700
To: openembedded-core@lists.openembedded.org
From: Saul Wold <sgw@linux.intel.com>
Cc: Xiaofeng Yan <xiaofeng.yan@windriver.com>, Ilya Yanok <yanok@emcraft.com>,
	Darren Hart <dvhart@linux.intel.com>,
	Paul Eggleton <paul.eggleton@linux.intel.com>,
	Kang Kai <kai.kang@windriver.com>, Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH 21/33] LSB_Setup.sh: Add character set to lsb-image
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
X-List-Received-Date: Tue, 03 May 2011 23:47:43 -0000

From: Xiaofeng Yan <xiaofeng.yan@windriver.com>

Add character set to lsb-image to solve bugs from lsb test

Signed-off-by: Xiaofeng Yan <xiaofeng.yan@windriver.com>
---
 meta/recipes-extended/lsb/lsbsetup/LSB_Setup.sh |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-extended/lsb/lsbsetup/LSB_Setup.sh b/meta/recipes-extended/lsb/lsbsetup/LSB_Setup.sh
index a8189e5..aa3d5ee 100644
--- a/meta/recipes-extended/lsb/lsbsetup/LSB_Setup.sh
+++ b/meta/recipes-extended/lsb/lsbsetup/LSB_Setup.sh
@@ -207,6 +207,7 @@ localedef -i en_US -f ISO-8859-15  en_US.ISO-8859-15
 localedef -i en_US -f UTF-8 en_US.UTF-8
 localedef -i se_NO -f UTF-8 se_NO.UTF-8
 localedef -i de_DE -f ISO-8859-1 de_DE
+localedef -i en_US -f ISO-8859-1 en_US.ISO8859-1
 
 #resolve localhost 
 LOCALHOST=`hostname`
-- 
1.7.4.1



