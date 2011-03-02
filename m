Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1PuqNy-00071S-UJ
	for openembedded-core@lists.openembedded.org;
	Wed, 02 Mar 2011 19:02:55 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 02 Mar 2011 10:00:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.62,254,1297065600"; d="scan'208";a="396465423"
Received: from unknown (HELO localhost) ([10.255.12.100])
	by azsmga001.ch.intel.com with ESMTP; 02 Mar 2011 10:00:21 -0800
Message-Id: <18f0124db5c10ea23698ca0c469d4dfde89adf43.1299088354.git.sgw@linux.intel.com>
In-Reply-To: <cover.1299088353.git.sgw@linux.intel.com>
References: <cover.1299088353.git.sgw@linux.intel.com>
Old-Date: Fri, 25 Feb 2011 13:54:07 -0600
Date: Wed, 02 Mar 2011 10:00:21 -0800
To: openembedded-core@lists.openembedded.org,poky@yoctoproject.org
From: Saul Wold <sgw@linux.intel.com>
X-Mailman-Approved-At: Wed, 02 Mar 2011 19:07:48 +0100
Cc: Scott Rifenbark <scott.m.rifenbark@intel.com>,
	Paul Eggleton <paul.eggleton@linux.intel.com>,
	Liping Ke <liping.ke@intel.com>, Dongxiao Xu <dongxiao.xu@intel.com>,
	Bruce Ashfield <bruce.ashfield@windriver.com>
Subject: [PATCH 08/26] documentation/poky-ref-manual/introduction.xml: [BUGID# 553] - Fixed pokylinux URL
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
X-List-Received-Date: Wed, 02 Mar 2011 18:02:55 -0000

From: Scott Rifenbark <scott.m.rifenbark@intel.com>

    [BUGID# 553] - In the Development Checkouts section (1.5.3)
    there is a reference to
    http://git.pokylinux.org/.  This URL resolves to an older looking
    source area.  I determined that the URL
    http://git.yoctoproject.org/ resolves to the newer Yocto source
    web interface so I changed the URL to that.
    This is a partial fix
    to Bug 553.

Signed-off-by: Scott Rifenbark <scott.m.rifenbark@intel.com>
---
 documentation/poky-ref-manual/introduction.xml |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/documentation/poky-ref-manual/introduction.xml b/documentation/poky-ref-manual/introduction.xml
index 064c0cb..c7cca8f 100644
--- a/documentation/poky-ref-manual/introduction.xml
+++ b/documentation/poky-ref-manual/introduction.xml
@@ -153,7 +153,7 @@
         <para>
             Poky is available from our git repository located at
             git://git.pokylinux.org/poky.git; a web interface to the repository
-            can be accessed at <ulink url='http://git.pokylinux.org/'/>.
+            can be accessed at <ulink url='http://git.yoctoproject.org/'/>.
         </para>
 
         <para>
-- 
1.7.1



