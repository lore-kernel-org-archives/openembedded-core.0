Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QAzSX-0006Lg-QL
	for openembedded-core@lists.openembedded.org;
	Sat, 16 Apr 2011 08:58:22 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 15 Apr 2011 23:55:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,223,1301900400"; d="scan'208";a="910411407"
Received: from unknown (HELO localhost) ([10.255.12.232])
	by fmsmga001.fm.intel.com with ESMTP; 15 Apr 2011 23:55:45 -0700
Message-Id: <3b4985665a9473e6c83c6a295721a3f3405d1d09.1302936483.git.sgw@linux.intel.com>
In-Reply-To: <cover.1302936483.git.sgw@linux.intel.com>
References: <cover.1302936483.git.sgw@linux.intel.com>
Old-Date: Fri, 15 Apr 2011 07:57:12 -0500
Date: Fri, 15 Apr 2011 23:55:44 -0700
To: openembedded-core@lists.openembedded.org
From: Saul Wold <sgw@linux.intel.com>
X-Mailman-Approved-At: Sat, 16 Apr 2011 12:03:17 +0200
Cc: Scott Rifenbark <scott.m.rifenbark@intel.com>,
	Paul Eggleton <paul.eggleton@linux.intel.com>,
	Jingdong Lu <jingdong.lu@windriver.com>, Kang Kai <kai.kang@windriver.com>,
	Xiaofeng Yan <xiaofeng.yan@windriver.com>
Subject: [PATCH 54/58] documentation/kernel-manual/kernel-how-to.xml: replaced 'pokylinux' with 'yoctoproject'
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
X-List-Received-Date: Sat, 16 Apr 2011 06:58:22 -0000

From: Scott Rifenbark <scott.m.rifenbark@intel.com>

Signed-off-by: Scott Rifenbark <scott.m.rifenbark@intel.com>
---
 documentation/kernel-manual/kernel-how-to.xml |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/documentation/kernel-manual/kernel-how-to.xml b/documentation/kernel-manual/kernel-how-to.xml
index 79c8526..96325fe 100644
--- a/documentation/kernel-manual/kernel-how-to.xml
+++ b/documentation/kernel-manual/kernel-how-to.xml
@@ -1022,7 +1022,7 @@ That's it. Configure and build.
                     You can start with something in <filename>meta/conf/machine</filename> - <filename>
                     meta/conf/machine/atom-pc.conf</filename> for example.  Or, you can start with a machine 
                     configuration from any of the BSP layers in the meta-intel repository at 
-                    <ulink url='http://git.pokylinux.org/cgit/cgit.cgi/meta-intel/'></ulink>, such as 
+                    <ulink url='http://git.yoctoproject.org/cgit/cgit.cgi/meta-intel/'></ulink>, such as 
                     <filename>meta-intel/meta-emenlow/conf/machine/emenlow.conf</filename>.
                 </para>
                 
@@ -1073,7 +1073,7 @@ That's it. Configure and build.
                     To create this branch first create a bare clone of the Yocto Project git repository.
                     Next, create a local clone of that:
                     <literallayout class='monospaced'>
-     $ git clone --bare git://git.pokylinux.org/linux-yocto-2.6.37.git
+     $ git clone --bare git://git.yoctoproject.org/linux-yocto-2.6.37.git
      linux-yocto-2.6.37.git
      $ git clone linux-yocto-2.6.37.git linux-yocto-2.6.37
                     </literallayout>
-- 
1.7.1.1



