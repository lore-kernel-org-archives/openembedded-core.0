Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1SId9A-0004ie-57
	for openembedded-core@lists.openembedded.org;
	Fri, 13 Apr 2012 11:50:28 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q3D9f6CW014236
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Apr 2012 02:41:06 -0700 (PDT)
Received: from usp-ub10.corp.ad.wrs.com (128.224.163.69) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.1.255.0; Fri, 13 Apr 2012 02:41:05 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 13 Apr 2012 17:41:15 +0800
Message-ID: <cover.1334308316.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.1
MIME-Version: 1.0
Subject: [PATCH 0/1] grub 1.99: fix build for gcc 4.7
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
X-List-Received-Date: Fri, 13 Apr 2012 09:50:28 -0000
Content-Type: text/plain

I've done a "bitbake world" on Fedora 17 64bit (MACHINE = qemux86-64),
the failed pkgs are mklibs-native (have sent patch) and grub as far as
I know.

Will try "bitbake core-image-sato" with MACHINE = qemuarm/qemuppc/qemux86
and "bitbake world" with MACHINE = qemux86 on Fedora 17 64bit this
night.

Test info:
Have tested on:
Ubuntu 10.10
Fedora 13/16/17 x86_64

// Robert

The following changes since commit 71e95c744eaa4dda1b3237db2e13f666f121c92b:

  package_rpm.bbclass: Set tmppath for rpm to somewhere which won't conflict with the rootfs (2012-04-12 21:24:55 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib robert/grub
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=robert/grub

Robert Yang (1):
  grub 1.99: fix build for gcc 4.7

 meta/recipes-bsp/grub/grub_1.99.bb |    7 ++++++-
 1 files changed, 6 insertions(+), 1 deletions(-)



