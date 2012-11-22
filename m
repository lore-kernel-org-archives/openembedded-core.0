Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Jackie.Huang@windriver.com>) id 1TbQmN-0005mH-9r
	for openembedded-core@lists.openembedded.org;
	Thu, 22 Nov 2012 08:00:57 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id qAM6kl1d009177
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 21 Nov 2012 22:46:48 -0800 (PST)
Received: from pek-cc-pb05l.wrs.com (128.224.157.65) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.318.4; Wed, 21 Nov 2012 22:46:46 -0800
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 22 Nov 2012 14:46:42 +0800
Message-ID: <cover.1353564658.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 1.7.4
MIME-Version: 1.0
Cc: saul.wold@intel.com, Shiqun.Lin@windriver.com
Subject: [PATCH 0/2] pulseaudio: fix tow issues.
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
X-List-Received-Date: Thu, 22 Nov 2012 07:00:58 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

We added these tow fixes for pulseaudio 1.1 as bbappend in our own layer and worked well,
but pulseaudio in oe-core is updated to 2.1 and the bbappend became dangling, so if they
are accepted in or-core, we don't have to mantain and update the bbappend and clean it up,
thanks!

Also added the authors of these fixed in CC list.

* Test info:
1) MACHINE=qemux86-64/qemux86/qemuppc
$ bitbake core-image-sato 
$ bitbake pulseaudio

The following changes since commit 654d5816f8ff696d42d72cfb881d5e51330a79b6:

  build-appliance-image: Update to dee77eca39f406f90e60d9c5ef7a66fcc8f57dbf commit (2012-11-21 20:38:47 +0000)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib jhuang0/d_pulseaudio_1122_2
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=jhuang0/d_pulseaudio_1122_2

Jackie Huang (2):
  pulseaudio: fix compilation on RHEL-5.8 64bit machine
  pulseaudio: The audio over Adipts ALC888 audio effect chip on Sabino
    does not work

 ...ulseaudio-fix-compilation-on-RHEL-machine.patch |   35 ++++++++++++++++++++
 .../pulseaudio/pulseaudio_2.1.bb                   |    9 ++++-
 2 files changed, 42 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-multimedia/pulseaudio/pulseaudio/pulseaudio-fix-compilation-on-RHEL-machine.patch

-- 
1.7.4



