Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QLQEk-00068M-Rb
	for openembedded-core@lists.openembedded.org;
	Sun, 15 May 2011 03:35:15 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 14 May 2011 18:32:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,368,1301900400"; d="scan'208";a="747339707"
Received: from unknown (HELO localhost) ([10.255.12.119])
	by orsmga001.jf.intel.com with ESMTP; 14 May 2011 18:32:22 -0700
Message-Id: <f9cf0343172254484ba53e555c93b92a732764ad.1305422996.git.sgw@linux.intel.com>
In-Reply-To: <cover.1305422996.git.sgw@linux.intel.com>
References: <cover.1305422996.git.sgw@linux.intel.com>
Old-Date: Fri, 13 May 2011 11:18:40 +0800
Date: Sat, 14 May 2011 18:32:22 -0700
To: openembedded-core@lists.openembedded.org
From: Saul Wold <sgw@linux.intel.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Kang Kai <kai.kang@windriver.com>
Subject: [PATCH 03/15] lsbsetup: recreate locale fr_FR
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
X-List-Received-Date: Sun, 15 May 2011 01:35:15 -0000

From: Kang Kai <kai.kang@windriver.com>

Update LSB_Setup.sh to recreate locale fr_FR, which helps to pass
LSB libstdc++ test.
Bump PR to r3.

Signed-off-by: Kang Kai <kai.kang@windriver.com>
---
 meta/recipes-extended/lsb/lsbsetup/LSB_Setup.sh |    1 +
 meta/recipes-extended/lsb/lsbsetup_0.9.bb       |    2 +-
 2 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-extended/lsb/lsbsetup/LSB_Setup.sh b/meta/recipes-extended/lsb/lsbsetup/LSB_Setup.sh
index aa3d5ee..10d8fb8 100644
--- a/meta/recipes-extended/lsb/lsbsetup/LSB_Setup.sh
+++ b/meta/recipes-extended/lsb/lsbsetup/LSB_Setup.sh
@@ -208,6 +208,7 @@ localedef -i en_US -f UTF-8 en_US.UTF-8
 localedef -i se_NO -f UTF-8 se_NO.UTF-8
 localedef -i de_DE -f ISO-8859-1 de_DE
 localedef -i en_US -f ISO-8859-1 en_US.ISO8859-1
+localedef -i fr_FR -f ISO-8859-1 fr_FR
 
 #resolve localhost 
 LOCALHOST=`hostname`
diff --git a/meta/recipes-extended/lsb/lsbsetup_0.9.bb b/meta/recipes-extended/lsb/lsbsetup_0.9.bb
index b0d0a3f..21bd26e 100644
--- a/meta/recipes-extended/lsb/lsbsetup_0.9.bb
+++ b/meta/recipes-extended/lsb/lsbsetup_0.9.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "auto-setup environment for lsb test"
 SECTION = "console/utils"
 PRIORITY = "required"
 LICENSE = "GPLv2"
-PR = "r2"
+PR = "r3"
 
 LIC_FILES_CHKSUM = "file://LSB_Setup.sh;beginline=3;endline=16;md5=97451c7c0786ce5bbe9ac58042945583"
 
-- 
1.7.1.1



