Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1PuqOL-00075d-A9
	for openembedded-core@lists.openembedded.org;
	Wed, 02 Mar 2011 19:03:19 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 02 Mar 2011 10:00:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.62,254,1297065600"; d="scan'208";a="663113144"
Received: from unknown (HELO localhost) ([10.255.12.100])
	by fmsmga002.fm.intel.com with ESMTP; 02 Mar 2011 10:00:26 -0800
Message-Id: <0a1d8f48c8a2120ba57017e1fcf270c677486266.1299088354.git.sgw@linux.intel.com>
In-Reply-To: <cover.1299088353.git.sgw@linux.intel.com>
References: <cover.1299088353.git.sgw@linux.intel.com>
Old-Date: Fri, 25 Feb 2011 16:08:07 -0600
Date: Wed, 02 Mar 2011 10:00:26 -0800
To: openembedded-core@lists.openembedded.org,poky@yoctoproject.org
From: Saul Wold <sgw@linux.intel.com>
X-Mailman-Approved-At: Wed, 02 Mar 2011 19:07:49 +0100
Cc: Scott Rifenbark <scott.m.rifenbark@intel.com>,
	Paul Eggleton <paul.eggleton@linux.intel.com>,
	Liping Ke <liping.ke@intel.com>, Dongxiao Xu <dongxiao.xu@intel.com>,
	Bruce Ashfield <bruce.ashfield@windriver.com>
Subject: [PATCH 12/26] [BUGID# 553] - documentation/poky-ref-manual/development.xml: Fixed pokylinux.org URL
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
X-List-Received-Date: Wed, 02 Mar 2011 18:03:20 -0000

From: Scott Rifenbark <scott.m.rifenbark@intel.com>

[BUGID# 553] - In "The Anjuta Plug-in" section (5.1.2.2) there was
an URL to the source for the Anjuta Plug-in.  The URL had the
pokylinux.org string in it and pointed to the old area.  I changed
the URL to http://git.yoctoproject.org and directed the user to
look under IDE Plugins.

This is a partial fix to bug 553.

Signed-off-by: Scott Rifenbark <scott.m.rifenbark@intel.com>
---
 documentation/poky-ref-manual/development.xml |    7 +++----
 1 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/documentation/poky-ref-manual/development.xml b/documentation/poky-ref-manual/development.xml
index 9a59d7e..db844a9 100644
--- a/documentation/poky-ref-manual/development.xml
+++ b/documentation/poky-ref-manual/development.xml
@@ -302,10 +302,9 @@
                 Plug-in are all required. 
                 The Poky Anjuta Plug-in is available to download as a tarball at the OpenedHand 
                 labs <ulink url="http://labs.o-hand.com/anjuta-poky-sdk-plugin/"></ulink> page or 
-                directly from the Poky Git repository located at 
-                <ulink url="git://git.pokylinux.org/anjuta-poky"></ulink>.
-                You can also access a web interface to the repository at
-                <ulink url="http://git.pokylinux.org/?p=anjuta-poky.git;a=summary"></ulink>.
+                directly from the Poky Git repository located at git://git.yoctoproject.org/anjuta-poky.
+                You can access the source code from a web interface to the repository at
+                <ulink url="http://git.yoctoproject.org/"></ulink> under IDE Plugins.
              </para>
              <para>
                 See the README file contained in the project for more information on 
-- 
1.7.1



