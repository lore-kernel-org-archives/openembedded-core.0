Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1S0CPH-00012M-FY
	for openembedded-core@lists.openembedded.org;
	Wed, 22 Feb 2012 14:38:56 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q1MDUXtN016295
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Feb 2012 05:30:33 -0800 (PST)
Received: from build-PowerEdge-T100.corp.ad.wrs.com (128.224.163.66) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.1.255.0; Wed, 22 Feb 2012 05:30:33 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 22 Feb 2012 21:27:56 +0800
Message-ID: <cover.1329916583.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.4.1
MIME-Version: 1.0
Subject: [PATCH 0/1] A script to clean obsolete sstate cache files
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
X-List-Received-Date: Wed, 22 Feb 2012 13:38:56 -0000
Content-Type: text/plain

Here is the testing result:

$ ./poky/scripts/sstate-cache-management.sh --cache-dir=sstate-cache.bak/ --remove-duplicated
Figuring out the archs in the sstate cache dir ...
The following archs have been found in the sstate cache dir:
i586 ppc603e x86_64 qemux86 qemuppc
Removing the sstate-xxx_deploy-rpm.tgz ... (3034 files)
Removing the sstate-xxx_deploy-ipk.tgz ... (0 files)
Removing the sstate-xxx_deploy-deb.tgz ... (0 files)
Removing the sstate-xxx_deploy.tgz ... (8 files)
Removing the sstate-xxx_package.tgz ... (3282 files)
Removing the sstate-xxx_populate-lic.tgz ... (2482 files)
Removing the sstate-xxx_populate-sysroot.tgz ... (3282 files)
12088 files have been removed

// Robert

The following changes since commit 87e32edb88c30ac116fa396148ac26357051f93a:

  iputils: Add base_libdir to VPATH in order to find the crypto library (2012-02-21 17:59:40 +0000)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib robert/remove-sstate
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=robert/remove-sstate

Robert Yang (1):
  A script to clean obsolete sstate cache files

 scripts/sstate-cache-management.sh |  135 ++++++++++++++++++++++++++++++++++++
 1 files changed, 135 insertions(+), 0 deletions(-)
 create mode 100755 scripts/sstate-cache-management.sh

-- 
1.7.4.1



