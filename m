Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1SZNwv-0006P2-0q
	for openembedded-core@lists.openembedded.org;
	Tue, 29 May 2012 17:03:05 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q4TEqkdf025572
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 May 2012 07:52:46 -0700 (PDT)
Received: from usp-ub10.corp.ad.wrs.com (128.224.163.69) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.1.255.0; Tue, 29 May 2012 07:52:45 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 29 May 2012 22:53:05 +0800
Message-ID: <cover.1338302685.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.1
MIME-Version: 1.0
Cc: Zhenfeng.Zhao@windriver.com
Subject: [PATCH 0/4] replace os.system/popen with subprocess module
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
X-List-Received-Date: Tue, 29 May 2012 15:03:05 -0000
Content-Type: text/plain

These patches are based on oe-core.

* Testinfo
  1) $ bitbake core-image-sato core-image-sato-sdk metatoolchain-sdk with
        MACHINE=qemuarm, PACKAGE_CLASSES = "package_rpm"

  2) $ bitbake core-image-sato core-image-sato-sdk metatoolchain-sdk with
        MACHINE=qemuarm, PACKAGE_CLASSES = "package_ipk"

  3) $ bitbake core-image-sato with MACHINE=qemux86, PACKAGE_CLASSES = "package_deb"

  4) $ bitbake world with MACHINE=qemux86

// Robert

The following changes since commit a7532d6b2870a51079c39366def9ae55faeba626:

  rootfs_rpm.bbclass: save rpmlib rather than remove it (2012-05-29 22:36:39 +0800)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib robert/meta_subprocess
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=robert/meta_subprocess

Robert Yang (4):
  meta: replace os.system with subprocess.call
  scripts: replace os.system with subprocess.call
  meta: replace os.popen with subprocess.Popen
  scripts: replace os.popen with subprocess.Popen

 meta/classes/archiver.bbclass                   |    3 +-
 meta/classes/debian.bbclass                     |   12 ++++--
 meta/classes/distrodata.bbclass                 |   17 ++++----
 meta/classes/icecc.bbclass                      |    6 +-
 meta/classes/imagetest-qemu.bbclass             |    9 ++--
 meta/classes/insane.bbclass                     |   46 ++++++++++++++-------
 meta/classes/kernel.bbclass                     |    6 +-
 meta/classes/metadata_scm.bbclass               |   12 ++---
 meta/classes/package.bbclass                    |   49 ++++++++++++----------
 meta/classes/package_deb.bbclass                |    3 +-
 meta/classes/package_ipk.bbclass                |   13 ++++--
 meta/classes/package_tar.bbclass                |    6 ++-
 meta/classes/sanity.bbclass                     |   13 +++---
 meta/classes/sstate.bbclass                     |    9 +++-
 meta/lib/oe/distro_check.py                     |    3 +-
 meta/recipes-core/busybox/busybox.inc           |    3 +-
 meta/recipes-core/uclibc/uclibc.inc             |    7 ++-
 meta/recipes-extended/cups/cups14.inc           |    3 +-
 scripts/contrib/python/generate-manifest-2.7.py |    3 +-
 scripts/rpm-createsolvedb.py                    |    5 +-
 scripts/swabber-strace-attach                   |    3 +-
 21 files changed, 136 insertions(+), 95 deletions(-)



