Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1T6O5L-0001Q7-LA
	for openembedded-core@lists.openembedded.org;
	Tue, 28 Aug 2012 17:52:12 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q7SFdvDV010083
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Aug 2012 08:39:57 -0700 (PDT)
Received: from localhost.localdomain (128.224.163.124) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.309.2; Tue, 28 Aug 2012 08:39:57 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 28 Aug 2012 23:45:21 +0800
Message-ID: <cover.1346138100.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.11.2
MIME-Version: 1.0
Cc: Zhenfeng.Zhao@windriver.com
Subject: [PATCH 0/1] package_rpm.bbclass: fix the arch (replace "-" with "_")
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
X-List-Received-Date: Tue, 28 Aug 2012 15:52:12 -0000
Content-Type: text/plain

Test info:
MACHINE = beagleboard/mpc8315e-rdb/qemux86
PACKAGE_CLASSES = package_rpm

$ bitbake core-image-minimal core-image-sato meta-toolchain \
	meta-toolchain-sdk adt-installer meta-ide-support

$ bitbake package-index

$ runqemu qemux86 (when MACHINE=qemux86)

All of them are OK.

Note:
The nativesdk's arch would be x86_64_nativesdk or i686_nativesdk (it was
x86_64 or i686 in the past) when use rpm, I have tested as much as I
can, but I'm not sure whether I have missed anything which minds this.

// Robert

The following changes since commit b4c5725af4cd85d5644f0373e2674e903c4eab2b:

  yocto-bsp: add missing xserver-xf86-config .bbappend for qemu (2012-08-25 14:47:07 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib robert/rpmarch
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=robert/rpmarch

Robert Yang (1):
  package_rpm.bbclass: fix the arch (replace "-" with "_")

 meta/classes/package_rpm.bbclass | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

-- 
1.7.11.2



