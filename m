Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QOu80-0003tE-CH
	for openembedded-core@lists.openembedded.org;
	Tue, 24 May 2011 18:06:40 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 24 May 2011 09:03:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,261,1304319600"; 
   d="scan'208";a="7845604"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.12.133])
	by fmsmga001.fm.intel.com with ESMTP; 24 May 2011 09:03:02 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 24 May 2011 09:02:47 -0700
Message-Id: <cover.1306219274.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
Subject: [Consolidated Pull 00/12] 24-May-2011
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
X-List-Received-Date: Tue, 24 May 2011 16:06:40 -0000

Various updates and clean-up

Sau!

The following changes since commit ad72ffadca975166cd8a416e4bf7b7fe33616d39:

  Merge branch 'master', remote-tracking branch 'origin/master' (2011-05-23 23:00:20 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib sgw/stage
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/rootfs_size

Darren Hart (1):
  create-pull-request: generalize the repository URL parsing

Kang Kai (1):
  ghostscript: fix run failure on mpc8315e

Koen Kooi (1):
  pulseaudio: package udev rules

Nitin A Kamble (5):
  git: upgrade from 1.7.4.3 to 1.7.5.1
  libpcre: upgrade from 8.10 to 8.12
  byacc: upgrade from 20101127 to 20101229
  python-pygpbject: upgrade from 2.27 to 2.27.91
  distro-tracking: update toolchain recipe fields

Otavio Salvador (2):
  send-pull-request: drop sendemail checks
  syslinux: rdepends on mtools

Saul Wold (2):
  gail: update gail to 1.20.2
  update-alternatives-dpkg: Update to dpkg base 1.15.8.7

 .../conf/distro/include/distro_tracking_fields.inc |    3 +
 meta/recipes-devtools/git/files/autotools.patch    |   16 --------
 meta/recipes-devtools/git/git.inc                  |    3 +-
 .../git/{git_1.7.4.3.bb => git_1.7.5.1.bb}         |    6 +-
 ...bject_2.27.0.bb => python-pygobject_2.27.91.bb} |    6 +-
 meta/recipes-devtools/syslinux/syslinux_4.03.bb    |    4 +-
 .../update-alternatives-dpkg.inc                   |   12 +++++-
 .../update-alternatives-dpkg_1.13.22.bb            |    7 ---
 .../update-alternatives-dpkg_1.15.8.7.bb           |    8 ++++
 meta/recipes-extended/byacc/byacc_20101127.bb      |    7 ---
 meta/recipes-extended/byacc/byacc_20101229.bb      |    7 +++
 meta/recipes-extended/ghostscript/arm/objarch.h    |   40 +++++++++++++++++++
 meta/recipes-extended/ghostscript/arm/soobjarch.h  |   40 +++++++++++++++++++
 .../ghostscript/ghostscript-9.02-genarch.patch     |   27 +++++++++++++
 .../ghostscript/ghostscript_9.02.bb                |   22 +++++++++-
 meta/recipes-extended/ghostscript/i586/objarch.h   |   41 ++++++++++++++++++++
 meta/recipes-extended/ghostscript/i586/soobjarch.h |   41 ++++++++++++++++++++
 meta/recipes-extended/ghostscript/mips/objarch.h   |   40 +++++++++++++++++++
 meta/recipes-extended/ghostscript/mips/soobjarch.h |   40 +++++++++++++++++++
 .../recipes-extended/ghostscript/powerpc/objarch.h |   40 +++++++++++++++++++
 .../ghostscript/powerpc/soobjarch.h                |   40 +++++++++++++++++++
 meta/recipes-extended/ghostscript/x86_64/objarch.h |   40 +++++++++++++++++++
 .../ghostscript/x86_64/soobjarch.h                 |   40 +++++++++++++++++++
 .../gnome/{gail_1.20.0.bb => gail_1.20.2.bb}       |   10 +++-
 meta/recipes-multimedia/pulseaudio/pulseaudio.inc  |    2 +-
 .../pulseaudio/pulseaudio_0.9.15.bb                |    2 +-
 .../pulseaudio/pulseaudio_0.9.22.bb                |    2 +-
 .../libpcre/{libpcre_8.10.bb => libpcre_8.12.bb}   |    6 +-
 scripts/create-pull-request                        |   29 ++++++--------
 scripts/send-pull-request                          |   16 --------
 30 files changed, 511 insertions(+), 86 deletions(-)
 delete mode 100644 meta/recipes-devtools/git/files/autotools.patch
 rename meta/recipes-devtools/git/{git_1.7.4.3.bb => git_1.7.5.1.bb} (56%)
 rename meta/recipes-devtools/python/{python-pygobject_2.27.0.bb => python-pygobject_2.27.91.bb} (87%)
 delete mode 100644 meta/recipes-devtools/update-alternatives/update-alternatives-dpkg_1.13.22.bb
 create mode 100644 meta/recipes-devtools/update-alternatives/update-alternatives-dpkg_1.15.8.7.bb
 delete mode 100644 meta/recipes-extended/byacc/byacc_20101127.bb
 create mode 100644 meta/recipes-extended/byacc/byacc_20101229.bb
 create mode 100644 meta/recipes-extended/ghostscript/arm/objarch.h
 create mode 100644 meta/recipes-extended/ghostscript/arm/soobjarch.h
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/ghostscript-9.02-genarch.patch
 create mode 100644 meta/recipes-extended/ghostscript/i586/objarch.h
 create mode 100644 meta/recipes-extended/ghostscript/i586/soobjarch.h
 create mode 100644 meta/recipes-extended/ghostscript/mips/objarch.h
 create mode 100644 meta/recipes-extended/ghostscript/mips/soobjarch.h
 create mode 100644 meta/recipes-extended/ghostscript/powerpc/objarch.h
 create mode 100644 meta/recipes-extended/ghostscript/powerpc/soobjarch.h
 create mode 100644 meta/recipes-extended/ghostscript/x86_64/objarch.h
 create mode 100644 meta/recipes-extended/ghostscript/x86_64/soobjarch.h
 rename meta/recipes-gnome/gnome/{gail_1.20.0.bb => gail_1.20.2.bb} (72%)
 rename meta/recipes-support/libpcre/{libpcre_8.10.bb => libpcre_8.12.bb} (94%)

-- 
1.7.3.4



