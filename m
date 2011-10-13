Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Kai.Kang@windriver.com>) id 1REHJa-0006vv-60
	for openembedded-core@lists.openembedded.org;
	Thu, 13 Oct 2011 11:10:58 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p9D95CVG004355
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Oct 2011 02:05:12 -0700 (PDT)
Received: from localhost (128.224.162.225) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Thu, 13 Oct 2011 02:05:12 -0700
From: Kang Kai <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 13 Oct 2011 17:05:32 +0800
Message-ID: <cover.1318496401.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.7.5.1.300.gc565c
MIME-Version: 1.0
X-Originating-IP: [128.224.162.225]
Subject: [PATCH 0/4] Import some patches from WindRiver Linux
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
X-List-Received-Date: Thu, 13 Oct 2011 09:10:58 -0000
Content-Type: text/plain

Hi All,

I import some patches from  WindRiver Linux. The first and second are
try to use target commands instead of the commands on the build machine.
And the last two will add the xinput-calibrator to add touchscreen support.

Regards,

The following changes since commit b92b776d56e64a437181de9bc76f8dcc8e15a5f8:

  meta-yocto: Catch up with xserver and mesa upgrades/rename (2011-10-12 23:05:12 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib kangkai/distro
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=kangkai/distro

Kang Kai (4):
  mesa-dri/xlib: use target commands in mklib file
  gdk-pixbuf: pick up ${NM} to fix libtool naming issue
  xinput: add xinput from oe
  xinput-calibrator: add touchscreen support

 .../gdk-pixbuf-2.24.0/configure-nm.patch           |   32 ++++++
 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.24.0.bb |    3 +
 .../mesa-use-target-commands-in-mklib.patch        |  104 ++++++++++++++++++++
 meta/recipes-graphics/mesa/mesa-dri_7.11.bb        |    3 +-
 meta/recipes-graphics/mesa/mesa-xlib_7.11.bb       |    3 +-
 .../pointercal-xinput/bug20/pointercal.xinput      |    1 +
 .../pointercal-xinput/iphone3g/pointercal.xinput   |    1 +
 .../pointercal-xinput/nokia900/pointercal.xinput   |    2 +
 .../pointercal-xinput/om-gta01/pointercal.xinput   |    2 +
 .../pointercal-xinput/om-gta02/pointercal.xinput   |    2 +
 .../pointercal-xinput/pointercal.xinput            |    1 +
 .../xinput-calibrator/pointercal-xinput_0.0.bb     |   21 ++++
 .../xinput-calibrator/xinput-calibrator_0.7.5.bb   |   24 +++++
 meta/recipes-graphics/xorg-app/xinput_1.5.3.bb     |   10 ++
 14 files changed, 207 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf-2.24.0/configure-nm.patch
 create mode 100644 meta/recipes-graphics/mesa/mesa-dri/mesa-use-target-commands-in-mklib.patch
 create mode 100644 meta/recipes-graphics/xinput-calibrator/pointercal-xinput/bug20/pointercal.xinput
 create mode 100644 meta/recipes-graphics/xinput-calibrator/pointercal-xinput/iphone3g/pointercal.xinput
 create mode 100644 meta/recipes-graphics/xinput-calibrator/pointercal-xinput/nokia900/pointercal.xinput
 create mode 100644 meta/recipes-graphics/xinput-calibrator/pointercal-xinput/om-gta01/pointercal.xinput
 create mode 100644 meta/recipes-graphics/xinput-calibrator/pointercal-xinput/om-gta02/pointercal.xinput
 create mode 100644 meta/recipes-graphics/xinput-calibrator/pointercal-xinput/pointercal.xinput
 create mode 100644 meta/recipes-graphics/xinput-calibrator/pointercal-xinput_0.0.bb
 create mode 100644 meta/recipes-graphics/xinput-calibrator/xinput-calibrator_0.7.5.bb
 create mode 100644 meta/recipes-graphics/xorg-app/xinput_1.5.3.bb

-- 
1.7.5.1.300.gc565c



