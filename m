Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Kai.Kang@windriver.com>) id 1S7kG2-00062z-T7
	for openembedded-core@lists.openembedded.org;
	Wed, 14 Mar 2012 10:12:35 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q2E93nxi011837
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Mar 2012 02:03:49 -0700 (PDT)
Received: from localhost.localdomain (128.224.162.241) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.1.255.0; Wed, 14 Mar 2012 02:03:49 -0700
From: Kang Kai <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 14 Mar 2012 17:03:35 +0800
Message-ID: <cover.1331713107.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.7.5.4
MIME-Version: 1.0
X-Originating-IP: [128.224.162.241]
Subject: [PATCH 0/8] Update packages
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
X-List-Received-Date: Wed, 14 Mar 2012 09:12:35 -0000
Content-Type: text/plain

Hello,

This serious patches try to update some packages.

Regards,


The following changes since commit 19b38a6486086b62efbff2bf8192adbaa34ecc0a:

  package.bbclass: Drop python depends from rpmdeps (2012-03-11 18:27:45 +0000)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib kangkai/update-packages
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=kangkai/update-packages

Kang Kai (8):
  gobject-introspection: update to 1.31.20
  newt: update to 0.52.14
  libsdl: update to 1.2.15
  alsa-lib: update to 1.0.25
  alsa-utils: update to 1.0.25
  alsa-tools: update to 1.0.25
  ghostscript: update to 9.05
  distro_tracking_fields: udpate package status

 .../conf/distro/include/distro_tracking_fields.inc |   48 ++++++------
 .../ghostscript/ghostscript-9.02-genarch.patch     |   12 ++--
 .../ghostscript-9.05-NOT-check-endian.patch        |   54 +++++++++++++
 .../{ghostscript_9.04.bb => ghostscript_9.05.bb}   |    9 +-
 .../{libnewt_0.52.13.bb => libnewt_0.52.14.bb}     |    6 +-
 .../gnome/gobject-introspection_1.31.20.bb         |   28 +++++++
 .../libsdl-1.2.14/add.XGetRequest.symbol.patch     |   79 --------------------
 .../configure_tweak.patch                          |    0
 .../libsdl/{libsdl_1.2.14.bb => libsdl_1.2.15.bb}  |    7 +-
 .../fix-tstamp-declaration.patch                   |    0
 .../unbreak_plugindir.patch                        |    0
 .../{alsa-lib_1.0.24.1.bb => alsa-lib_1.0.25.bb}   |    6 +-
 .../autotools.patch                                |    0
 ...alsa-tools_1.0.24.1.bb => alsa-tools_1.0.25.bb} |    6 +-
 ...-t-let-systemd-unit-restore-the-volume-wh.patch |    4 +-
 .../ncursesfix.patch                               |    0
 .../uclibc-exp10-replacement.patch                 |    0
 ...alsa-utils_1.0.24.2.bb => alsa-utils_1.0.25.bb} |    8 +-
 18 files changed, 134 insertions(+), 133 deletions(-)
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/ghostscript-9.05-NOT-check-endian.patch
 rename meta/recipes-extended/ghostscript/{ghostscript_9.04.bb => ghostscript_9.05.bb} (92%)
 rename meta/recipes-extended/newt/{libnewt_0.52.13.bb => libnewt_0.52.14.bb} (84%)
 create mode 100644 meta/recipes-gnome/gnome/gobject-introspection_1.31.20.bb
 delete mode 100644 meta/recipes-graphics/libsdl/libsdl-1.2.14/add.XGetRequest.symbol.patch
 rename meta/recipes-graphics/libsdl/{libsdl-1.2.14 => libsdl-1.2.15}/configure_tweak.patch (100%)
 rename meta/recipes-graphics/libsdl/{libsdl_1.2.14.bb => libsdl_1.2.15.bb} (93%)
 rename meta/recipes-multimedia/alsa/{alsa-lib-1.0.24.1 => alsa-lib-1.0.25}/fix-tstamp-declaration.patch (100%)
 rename meta/recipes-multimedia/alsa/{alsa-lib-1.0.24.1 => alsa-lib-1.0.25}/unbreak_plugindir.patch (100%)
 rename meta/recipes-multimedia/alsa/{alsa-lib_1.0.24.1.bb => alsa-lib_1.0.25.bb} (92%)
 rename meta/recipes-multimedia/alsa/{alsa-tools-1.0.24.1 => alsa-tools-1.0.25}/autotools.patch (100%)
 rename meta/recipes-multimedia/alsa/{alsa-tools_1.0.24.1.bb => alsa-tools_1.0.25.bb} (83%)
 rename meta/recipes-multimedia/alsa/{alsa-utils-1.0.24.2 => alsa-utils-1.0.25}/0001-alsactl-don-t-let-systemd-unit-restore-the-volume-wh.patch (87%)
 rename meta/recipes-multimedia/alsa/{alsa-utils-1.0.24.2 => alsa-utils-1.0.25}/ncursesfix.patch (100%)
 rename meta/recipes-multimedia/alsa/{alsa-utils-1.0.24.2 => alsa-utils-1.0.25}/uclibc-exp10-replacement.patch (100%)
 rename meta/recipes-multimedia/alsa/{alsa-utils_1.0.24.2.bb => alsa-utils_1.0.25.bb} (93%)

-- 
1.7.5.4



