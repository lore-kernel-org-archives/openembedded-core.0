Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ddalex@intel.com>) id 1TsrpJ-0002Rt-Aj
	for openembedded-core@lists.openembedded.org;
	Wed, 09 Jan 2013 10:20:07 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 09 Jan 2013 01:04:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,436,1355126400"; d="scan'208";a="271676543"
Received: from adamian-desktop.rb.intel.com ([10.237.105.141])
	by fmsmga001.fm.intel.com with ESMTP; 09 Jan 2013 01:04:47 -0800
Received: by adamian-desktop.rb.intel.com (Postfix, from userid 1000)
	id AF98C5606EB; Wed,  9 Jan 2013 11:05:21 +0200 (EET)
From: Alex DAMIAN <alexandru.damian@intel.com>
To: openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org, ross.burton@intel.com
Date: Wed,  9 Jan 2013 11:05:19 +0200
Message-Id: <1357722319-430-1-git-send-email-alexandru.damian@intel.com>
X-Mailer: git-send-email 1.7.10.4
Cc: Alexandru DAMIAN <alexandru.damian@intel.com>
Subject: [PATCH] Git ignore pull requests and built manuals
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 09 Jan 2013 09:20:08 -0000

From: Alexandru DAMIAN <alexandru.damian@intel.com>

We ignore the in-tree built manuals, and
the in-tree pull requests.
---
 .gitignore |    5 +++++
 1 file changed, 5 insertions(+)

diff --git a/.gitignore b/.gitignore
index d99a409..43f7688 100644
--- a/.gitignore
+++ b/.gitignore
@@ -16,3 +16,8 @@ hob-image-*.bb
 *~
 !meta-yocto
 !meta-yocto-bsp
+bitbake/doc/manual/html/
+bitbake/doc/manual/pdf/
+bitbake/doc/manual/txt/
+bitbake/doc/manual/xhtml/
+pull-*/
-- 
1.7.10.4



