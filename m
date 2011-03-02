Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1PuqOK-00075e-Tf
	for openembedded-core@lists.openembedded.org;
	Wed, 02 Mar 2011 19:03:19 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 02 Mar 2011 10:00:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.62,254,1297065600"; d="scan'208";a="663113102"
Received: from unknown (HELO localhost) ([10.255.12.100])
	by fmsmga002.fm.intel.com with ESMTP; 02 Mar 2011 10:00:20 -0800
Message-Id: <b1c7055dead4badd14872105c49466cbf86d3b54.1299088354.git.sgw@linux.intel.com>
In-Reply-To: <cover.1299088353.git.sgw@linux.intel.com>
References: <cover.1299088353.git.sgw@linux.intel.com>
Old-Date: Fri, 25 Feb 2011 13:37:17 -0600
Date: Wed, 02 Mar 2011 10:00:20 -0800
To: openembedded-core@lists.openembedded.org,poky@yoctoproject.org
From: Saul Wold <sgw@linux.intel.com>
X-Mailman-Approved-At: Wed, 02 Mar 2011 19:07:49 +0100
Cc: Scott Rifenbark <scott.m.rifenbark@intel.com>,
	Paul Eggleton <paul.eggleton@linux.intel.com>,
	Liping Ke <liping.ke@intel.com>, Dongxiao Xu <dongxiao.xu@intel.com>,
	Bruce Ashfield <bruce.ashfield@windriver.com>
Subject: [PATCH 07/26] documentation/poky-ref-manual/introduction.xml: [BUGID# 553] - Fixed pokylinux.org link in Nightly Build section
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

[BUGID# 553] - In the nightly build section (1.5.2) there is a reference to
http://autobuilder.pokylinux.org/.  This URL resolves to an autobuilder
page that has a bunch of pokylinux links.  I determined that the URL
http://autobuilder.yoctoproject.org/ also resolves to the autobuilder
page so I updated the URL to use the YP link.  This is a partial fix
to Bug 553.

Signed-off-by: Scott Rifenbark <scott.m.rifenbark@intel.com>
---
 documentation/poky-ref-manual/introduction.xml |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/documentation/poky-ref-manual/introduction.xml b/documentation/poky-ref-manual/introduction.xml
index b2e3452..064c0cb 100644
--- a/documentation/poky-ref-manual/introduction.xml
+++ b/documentation/poky-ref-manual/introduction.xml
@@ -129,7 +129,7 @@
         <para>
             We make nightly builds of Poky for testing purposes and to make the
             latest developments available. The output from these builds is available
-            at <ulink url='http://autobuilder.pokylinux.org/'/>.
+            at <ulink url='http://autobuilder.yoctoproject.org/'/>.
             The numbers used in the builds increase for each subsequent build and can be used to 
             reference a specific build.
         </para>
-- 
1.7.1



