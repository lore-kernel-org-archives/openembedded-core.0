Received: from 18.mo5.mail-out.ovh.net ([178.33.45.10]
	helo=mo5.mail-out.ovh.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1R682C-0002Qz-Pm
	for openembedded-core@lists.openembedded.org;
	Tue, 20 Sep 2011 23:39:20 +0200
Received: from mail178.ha.ovh.net (b7.ovh.net [213.186.33.57])
	by mo5.mail-out.ovh.net (Postfix) with SMTP id 675FD1004F2B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Sep 2011 23:22:53 +0200 (CEST)
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 20 Sep 2011 23:18:33 +0200
Received: from tal33-3-82-233-81-124.fbx.proxad.net (HELO ?192.168.2.9?)
	(ebenard%eukrea.com@82.233.81.124)
	by ns0.ovh.net with SMTP; 20 Sep 2011 23:18:33 +0200
Message-ID: <4E790328.2010604@eukrea.com>
Date: Tue, 20 Sep 2011 23:18:32 +0200
From: =?UTF-8?B?RXJpYyBCw6luYXJk?= <eric@eukrea.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:6.0.2) Gecko/20110902 Thunderbird/6.0.2
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
X-Ovh-Mailout: 178.32.228.5 (mo5.mail-out.ovh.net)
References: <20110911172241.GA3674@chargestorm.se>
	<4E7246EB.2070607@eukrea.com>
	<CAP9ODKqCc3zAuwBoL7Yiet0GKuJKFymZMtStkpwAq88b=ZGibw@mail.gmail.com>
	<201109161212.19780.paul.eggleton@linux.intel.com>
	<4E733F7D.6090109@eukrea.com>
	<CAP9ODKo9-6qHhCWfWS5_GXrNxw38VCXjzih2hdoWRQ9vY3MVFg@mail.gmail.com>
	<DD23E745-87D9-4831-85D4-C038CD79DCF7@dominion.thruhere.net>
	<CAP9ODKoemW81Sob3uUe-1LedWXcoJqEdkUGTj-+ZjgrUsytb_Q@mail.gmail.com>
	<49A59D49-5FF1-4F8D-A259-F6F8CA42ADC9@dominion.thruhere.net>
	<CAP9ODKpbVD-2AyXEMQG9D=6=F1n2kC-J=jOU7EPc2hWa_bjq6A@mail.gmail.com>
	<1316437421.14488.13.camel@ted> <4E77990A.5080504@eukrea.com>
In-Reply-To: <4E77990A.5080504@eukrea.com>
X-Ovh-Tracer-Id: 227431782651047362
X-Ovh-Remote: 82.233.81.124 (tal33-3-82-233-81-124.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-Spam-Check: DONE|U 0.5/N
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -20
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeeftddrvddtucetggdotefuucfrrhhofhhilhgvmecuqfggjfenuceurghilhhouhhtmecufedttdenuchlihhnuhigvdigucdlqddvtddm
Subject: Re: [PATCH] qt4: update to latest version 4.7.4
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
X-List-Received-Date: Tue, 20 Sep 2011 21:39:20 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable

Hi,

ok 2 branches are available here : git://github.com/eukrea/oe-core.git
- qt4_improve for improvement to existing qt 4.7.3,
- qt4_upgrade for adding qt 4.7.4 (with DEFAULT_PREFERENCE=3D-1 as sugges=
ted by=20
Koen.

Please test them so that we can fix potential failures and send the pull=20
request (I have compile test actually running with the latest changes in=20
qt4_upgrade branch so this one is not yet fully tested).

For more details :

** branch qt4_improve
The following changes since commit 81274f4488fbc4d68d150870735ec0181b60b4=
51:

   freetype: disable bzip2 compressed font support (2011-09-19 13:14:03 +=
0100)

are available in the git repository at:
   git://github.com/eukrea/oe-core.git qt4_improve

Denis Carikli (3):
       qt4.inc: remove the optional documentation package from the demo's=
=20
RRECOMMENDS
       qt4(embedded and x11): disable neon for armv6-vfp
       qt4.inc: package qtdemo's docs in a separate package

Eric B=C3=A9nard (2):
       qt4e-demo-image: improve image
       qt4: fix generated sdk

  meta/recipes-qt/images/qt4e-demo-image.bb   |    2 +-
  meta/recipes-qt/meta/meta-toolchain-qte.bb  |    7 +++++++
  meta/recipes-qt/qt4/qt4-embedded.inc        |    2 +-
  meta/recipes-qt/qt4/qt4-embedded_4.7.3.bb   |    4 ++--
  meta/recipes-qt/qt4/qt4-tools-nativesdk.inc |   22 +++++++++++---------=
--
  meta/recipes-qt/qt4/qt4-x11-free.inc        |    2 +-
  meta/recipes-qt/qt4/qt4-x11-free_4.7.3.bb   |    4 ++--
  meta/recipes-qt/qt4/qt4.inc                 |    7 ++++++-
  8 files changed, 31 insertions(+), 19 deletions(-)

** branch qt4_upgrade :
The following changes since commit 69482033e9b5841c2bd46c86679383a52bc4ab=
ea:

   qt4.inc: package qtdemo's docs in a separate package (2011-09-20 21:42=
:36=20
+0200)

are available in the git repository at:
   git://github.com/eukrea/oe-core.git qt4_upgrade

Eric B=C3=A9nard (1):
       qt4: update to latest version 4.7.4

  meta/recipes-qt/qt4/qt-4.7.4.inc                   |   62 +++++++++++++=
+++++
  .../0001-Added-Openembedded-crossarch-option.patch |   47 +++++++++++++=
+
  meta/recipes-qt/qt4/qt-4.7.4/fix-qtbug-20925.patch |   56 +++++++++++++=
++++
  meta/recipes-qt/qt4/qt-4.7.4/g++.conf              |   60 +++++++++++++=
+++++
  .../qt4/qt-4.7.4/hack-out-pg2-4.7.0.patch          |   31 +++++++++
  meta/recipes-qt/qt4/qt-4.7.4/linux.conf            |   66 +++++++++++++=
+++++++
  meta/recipes-qt/qt4/qt4-embedded_4.7.4.bb          |   12 ++++
  meta/recipes-qt/qt4/qt4-native_4.7.4.bb            |   18 +++++
  meta/recipes-qt/qt4/qt4-tools-nativesdk_4.7.4.bb   |   11 +++
  meta/recipes-qt/qt4/qt4-x11-free_4.7.4.bb          |   13 ++++
  10 files changed, 376 insertions(+), 0 deletions(-)
  create mode 100644 meta/recipes-qt/qt4/qt-4.7.4.inc
  create mode 100644=20
meta/recipes-qt/qt4/qt-4.7.4/0001-Added-Openembedded-crossarch-option.pat=
ch
  create mode 100644 meta/recipes-qt/qt4/qt-4.7.4/fix-qtbug-20925.patch
  create mode 100644 meta/recipes-qt/qt4/qt-4.7.4/g++.conf
  create mode 100644 meta/recipes-qt/qt4/qt-4.7.4/hack-out-pg2-4.7.0.patc=
h
  create mode 100644 meta/recipes-qt/qt4/qt-4.7.4/linux.conf
  create mode 100644 meta/recipes-qt/qt4/qt4-embedded_4.7.4.bb
  create mode 100644 meta/recipes-qt/qt4/qt4-native_4.7.4.bb
  create mode 100644 meta/recipes-qt/qt4/qt4-tools-nativesdk_4.7.4.bb
  create mode 100644 meta/recipes-qt/qt4/qt4-x11-free_4.7.4.bb

Thanks
Eric


