Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 7E2C16FFCD
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Aug 2016 09:21:19 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u7M9LJeu024203
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Aug 2016 02:21:19 -0700 (PDT)
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Mon, 22 Aug 2016 02:21:18 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 22 Aug 2016 17:05:53 +0800
Message-ID: <cover.1471857001.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 2.8.3
MIME-Version: 1.0
Subject: [PATCH 00/17] control ipv6 support based on DISTRO_FEATURES
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 22 Aug 2016 09:21:19 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

There is ipv6 configure option for these packages, and we need to them
to be controled by DISTRO_FEATURES.

Tested with and without ipv6 in DISTRO_FEATURES on qemux86-64 and qemuarm.

--
The following changes since commit f078ccf1ac60488169853724c35126cc056f975d:

  bitbake: siggen: Fix file variable typo in compare_sigfiles (2016-08-20 16:11:29 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib.git jhuang0/r_ipv6_160822_0
  http://git.pokylinux.org/cgit.cgi//log/?h=jhuang0/r_ipv6_160822_0

Jackie Huang (17):
  apr: control ipv6 support based on DISTRO_FEATURES
  libice: control ipv6 support based on DISTRO_FEATURES
  libpcap: control ipv6 support based on DISTRO_FEATURES
  libsm: control ipv6 support based on DISTRO_FEATURES
  libxfont: control ipv6 support based on DISTRO_FEATURES
  libxml2: control ipv6 support based on DISTRO_FEATURES
  libxmu: control ipv6 support based on DISTRO_FEATURES
  lighttpd: control ipv6 support based on DISTRO_FEATURES
  nfs-utils: control ipv6 support based on DISTRO_FEATURES
  nspr: control ipv6 support based on DISTRO_FEATURES
  psmisc: control ipv6 support based on DISTRO_FEATURES
  pulseaudio: control ipv6 support based on DISTRO_FEATURES
  rsync: use rsync.inc to avoid duplicated codes
  rsync: control ipv6 support based on DISTRO_FEATURES
  wget: control ipv6 support based on DISTRO_FEATURES
  xauth: control ipv6 support based on DISTRO_FEATURES
  xhost: control ipv6 support based on DISTRO_FEATURES

 meta/recipes-connectivity/libpcap/libpcap.inc      |  5 ++++-
 .../nfs-utils/nfs-utils_1.3.3.bb                   |  5 ++++-
 meta/recipes-core/libxml/libxml2_2.9.4.bb          |  5 ++++-
 meta/recipes-devtools/rsync/rsync.inc              |  7 ++----
 meta/recipes-devtools/rsync/rsync_2.6.9.bb         | 25 ++++++----------------
 meta/recipes-devtools/rsync/rsync_3.1.2.bb         |  8 ++++++-
 meta/recipes-extended/lighttpd/lighttpd_1.4.39.bb  |  5 ++++-
 meta/recipes-extended/psmisc/psmisc.inc            |  3 +++
 meta/recipes-extended/wget/wget.inc                |  5 +++--
 meta/recipes-graphics/xorg-app/xauth_1.0.9.bb      |  3 +++
 meta/recipes-graphics/xorg-app/xhost_1.0.7.bb      |  3 +++
 meta/recipes-graphics/xorg-lib/libice_1.0.9.bb     |  3 ++-
 meta/recipes-graphics/xorg-lib/libsm_1.2.2.bb      |  3 +++
 meta/recipes-graphics/xorg-lib/libxfont_1.5.1.bb   |  3 +++
 meta/recipes-graphics/xorg-lib/libxmu_1.1.2.bb     |  3 +++
 meta/recipes-multimedia/pulseaudio/pulseaudio.inc  |  2 ++
 meta/recipes-support/apr/apr_1.5.2.bb              |  3 +++
 meta/recipes-support/nspr/nspr_4.12.bb             |  3 +++
 18 files changed, 62 insertions(+), 32 deletions(-)

-- 
2.8.1


