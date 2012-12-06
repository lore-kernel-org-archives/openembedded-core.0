Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eflanagan@envy.jf.intel.com>) id 1Tghud-0001pm-71
	for openembedded-core@lists.openembedded.org;
	Thu, 06 Dec 2012 21:19:18 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 06 Dec 2012 12:02:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,232,1355126400"; d="scan'208";a="229989468"
Received: from envy.jf.intel.com ([10.7.201.159])
	by orsmga001.jf.intel.com with ESMTP; 06 Dec 2012 12:03:41 -0800
Received: from envy.jf.intel.com (localhost [127.0.0.1])
	by envy.jf.intel.com (8.14.4/8.14.4/Debian-2ubuntu2) with ESMTP id
	qB6K16ur027028; Thu, 6 Dec 2012 12:01:07 -0800
Received: (from eflanagan@localhost)
	by envy.jf.intel.com (8.14.4/8.14.4/Submit) id qB6K1607027027;
	Thu, 6 Dec 2012 12:01:06 -0800
From: Elizabeth Flanagan <elizabeth.flanagan@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Dec 2012 12:01:05 -0800
Message-Id: <cover.1354823958.git.elizabeth.flanagan@intel.com>
X-Mailer: git-send-email 1.7.5.4
Subject: [PATCH v2 0/1] Include locale in the package manifest
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
X-List-Received-Date: Thu, 06 Dec 2012 20:19:18 -0000

Resending patch as it did not apply clean to master.

This patch is removes the exclusion of *locale* from the package and license
manifests. Doing so, allows us to accurately audit the packages installed
on an image with what the manifests contain.

This was tested by:

ssh root@192.168.7.4 'rpm -qa|sort' >> pkg_list
pr -m -t -s package.manifest pkg_list | gawk '{print $2 " " $1}'

and then manually comparing the results.

The following changes since commit 9b003c95fc916c163b8858728c1e7e06f162898e:

  license.bbclass: Including locale packages (2012-12-06 11:58:48 -0800)

are available in the git repository at:
  git://git.yoctoproject.org/poky-contrib eflanagan/locale_license
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=eflanagan/locale_license

Elizabeth Flanagan (1):
  license.bbclass: Including locale packages

 meta/classes/license.bbclass |    7 +------
 1 files changed, 1 insertions(+), 6 deletions(-)

-- 
1.7.5.4



