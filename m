Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1TYGHm-0008CA-M2
	for openembedded-core@lists.openembedded.org;
	Tue, 13 Nov 2012 14:12:15 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id qADCvWuF001781
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 13 Nov 2012 04:57:32 -0800 (PST)
Received: from pek-ub10.wrs.com (128.224.163.69) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.318.4;
	Tue, 13 Nov 2012 04:57:31 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 13 Nov 2012 20:56:35 +0800
Message-ID: <cover.1352807729.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.1
MIME-Version: 1.0
Cc: Zhenfeng.Zhao@windriver.com, scott.a.garman@intel.com
Subject: [for-denzil] [PATCH 0/2] Fix incremental rpm image generation
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
X-List-Received-Date: Tue, 13 Nov 2012 13:12:15 -0000
Content-Type: text/plain

Port the patches from the master branch to denzil, and have tested on
our local autobuilder. They are already on danny.

// Robert

The following changes since commit 846b7c388738f382e83576e77b705aa547c1dd9b:

  bitbake: lib/bb/siggen.py: log when tainting the signature of a task (2012-10-12 08:58:48 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib robert/denzil_rpm
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=robert/denzil_rpm

Robert Yang (2):
  package_rpm.bbclass: Fix incremental rpm image generation
  rootfs_rpm.bbclass: save rpmlib rather than remove it

 meta/classes/image.bbclass       |    6 ++++++
 meta/classes/package_rpm.bbclass |   20 ++++++++------------
 meta/classes/rootfs_rpm.bbclass  |    6 +++++-
 3 files changed, 19 insertions(+), 13 deletions(-)



