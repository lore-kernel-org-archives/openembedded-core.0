Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1PuqO2-00071W-Eu
	for openembedded-core@lists.openembedded.org;
	Wed, 02 Mar 2011 19:02:58 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 02 Mar 2011 10:00:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.62,254,1297065600"; d="scan'208";a="608305446"
Received: from unknown (HELO localhost) ([10.255.12.100])
	by orsmga002.jf.intel.com with ESMTP; 02 Mar 2011 10:00:30 -0800
Message-Id: <a820c07796dc478154b7e5ee4e590a425b981e8a.1299088354.git.sgw@linux.intel.com>
In-Reply-To: <cover.1299088353.git.sgw@linux.intel.com>
References: <cover.1299088353.git.sgw@linux.intel.com>
Old-Date: Fri, 25 Feb 2011 16:52:58 -0600
Date: Wed, 02 Mar 2011 10:00:29 -0800
To: openembedded-core@lists.openembedded.org,poky@yoctoproject.org
From: Saul Wold <sgw@linux.intel.com>
X-Mailman-Approved-At: Wed, 02 Mar 2011 19:07:48 +0100
Cc: Scott Rifenbark <scott.m.rifenbark@intel.com>,
	Paul Eggleton <paul.eggleton@linux.intel.com>,
	Liping Ke <liping.ke@intel.com>, Dongxiao Xu <dongxiao.xu@intel.com>,
	Bruce Ashfield <bruce.ashfield@windriver.com>
Subject: [PATCH 15/26] documentation/poky-ref-manual/resources.xml: Text addtions in Links section in Appendix I
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
X-List-Received-Date: Wed, 02 Mar 2011 18:02:58 -0000

From: Scott Rifenbark <scott.m.rifenbark@intel.com>

I added text after the bulleted items "The Poky website" and "BitBake Uer Manual."
These were blank and it was not consistent with the rest of the list.

Signed-off-by: Scott Rifenbark <scott.m.rifenbark@intel.com>
---
 documentation/poky-ref-manual/resources.xml |    7 ++++---
 1 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/documentation/poky-ref-manual/resources.xml b/documentation/poky-ref-manual/resources.xml
index e6f7b26..888610c 100644
--- a/documentation/poky-ref-manual/resources.xml
+++ b/documentation/poky-ref-manual/resources.xml
@@ -75,7 +75,8 @@
             for Yocto Project.
         </para></listitem>
         <listitem><para>
-            <ulink url='http://pokylinux.org'>The Poky website</ulink> 
+            <ulink url='http://pokylinux.org'>The Poky website</ulink> - The home site
+            for Poky Linux.
         </para></listitem>
         <listitem><para>
             <ulink url='http://www.openedhand.com/'>OpenedHand</ulink> - The
@@ -96,8 +97,8 @@
             - The tool used to process Poky metadata.
         </para></listitem>
         <listitem><para>
-            <ulink url='http://bitbake.berlios.de/manual/'>Bitbake User
-                Manual</ulink>
+            <ulink url='http://bitbake.berlios.de/manual/'>BitBake User
+                Manual</ulink> - A comprehensive guide to the BitBake tool.
         </para></listitem>
         <listitem><para>
             <ulink url='http://pimlico-project.org/'>Pimlico</ulink> - A
-- 
1.7.1



