Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Kai.Kang@windriver.com>) id 1RGP30-00087n-Q2
	for openembedded-core@lists.openembedded.org;
	Wed, 19 Oct 2011 07:50:39 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p9J5ijRg016911
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 18 Oct 2011 22:44:45 -0700 (PDT)
Received: from localhost (128.224.162.225) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Tue, 18 Oct 2011 22:44:45 -0700
From: Kang Kai <kai.kang@windriver.com>
To: <saul.wold@intel.com>, <openembedded-core@lists.openembedded.org>
Date: Wed, 19 Oct 2011 13:45:53 +0800
Message-ID: <cover.1318995438.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.7.5.1.300.gc565c
MIME-Version: 1.0
X-Originating-IP: [128.224.162.225]
Subject: [PATCH 0/5] Update packages V3
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
X-List-Received-Date: Wed, 19 Oct 2011 05:50:39 -0000
Content-Type: text/plain

Hi Saul,

Version 3: remove obsolete patches, and add distro tracking information.

Version 2: only add libsdl update

Update ghostscript, libxml-sax-perl and liburi-perl to latest version.

Regards,


The following changes since commit 3c517bfe6c6d7781658f65bda4e0fdb499ca2b62:

  bind 9.8.1: fix build after recent update (2011-10-17 16:58:14 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib kangkai/update-pkgs
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=kangkai/update-pkgs

Kang Kai (5):
  ghostscript: update to 9.04
  libxml-sax-perl: update to 0.99
  liburi-perl: update to 1.59
  libsdl: update to 1.2.14
  distro_tracking_fields: update packages tracking fields

 .../conf/distro/include/distro_tracking_fields.inc |   24 ++
 .../{liburi-perl_1.58.bb => liburi-perl_1.59.bb}   |    6 +-
 .../ghostscript/ghostscript/arm/soobjarch.h        |   40 ---
 .../ghostscript-9.02-prevent_recompiling.patch     |   74 +++---
 .../ghostscript/ghostscript/i586/soobjarch.h       |   41 ---
 .../ghostscript/ghostscript/mips/soobjarch.h       |   40 ---
 .../ghostscript/ghostscript/powerpc/soobjarch.h    |   40 ---
 .../ghostscript/ghostscript/powerpc64/soobjarch.h  |   40 ---
 .../ghostscript/ghostscript/x86_64/soobjarch.h     |   40 ---
 .../{ghostscript_9.02.bb => ghostscript_9.04.bb}   |   24 +-
 ...ml-sax-perl_0.96.bb => libxml-sax-perl_0.99.bb} |    7 +-
 meta/recipes-graphics/libsdl/files/acinclude.m4    |  189 -------------
 .../libsdl/files/configure_tweak.patch             |  281 +++++++++-----------
 .../libsdl/files/kernel-asm-page.patch             |   15 -
 .../libsdl/{libsdl_1.2.11.bb => libsdl_1.2.14.bb}  |   17 +-
 15 files changed, 219 insertions(+), 659 deletions(-)
 rename meta/recipes-devtools/perl/{liburi-perl_1.58.bb => liburi-perl_1.59.bb} (81%)
 delete mode 100644 meta/recipes-extended/ghostscript/ghostscript/arm/soobjarch.h
 delete mode 100644 meta/recipes-extended/ghostscript/ghostscript/i586/soobjarch.h
 delete mode 100644 meta/recipes-extended/ghostscript/ghostscript/mips/soobjarch.h
 delete mode 100644 meta/recipes-extended/ghostscript/ghostscript/powerpc/soobjarch.h
 delete mode 100644 meta/recipes-extended/ghostscript/ghostscript/powerpc64/soobjarch.h
 delete mode 100644 meta/recipes-extended/ghostscript/ghostscript/x86_64/soobjarch.h
 rename meta/recipes-extended/ghostscript/{ghostscript_9.02.bb => ghostscript_9.04.bb} (81%)
 rename meta/recipes-extended/perl/{libxml-sax-perl_0.96.bb => libxml-sax-perl_0.99.bb} (85%)
 delete mode 100644 meta/recipes-graphics/libsdl/files/acinclude.m4
 delete mode 100644 meta/recipes-graphics/libsdl/files/kernel-asm-page.patch
 rename meta/recipes-graphics/libsdl/{libsdl_1.2.11.bb => libsdl_1.2.14.bb} (81%)

-- 
1.7.5.1.300.gc565c



