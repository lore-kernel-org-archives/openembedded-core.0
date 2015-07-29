Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id BC0F5763E0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jul 2015 09:11:55 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t6T9BtNA014697
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jul 2015 02:11:55 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.235.1;
	Wed, 29 Jul 2015 02:11:38 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 29 Jul 2015 02:11:53 -0700
Message-ID: <cover.1438161068.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 0/2] bitbake.conf: add GITHUB_GIT
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
X-List-Received-Date: Wed, 29 Jul 2015 09:11:57 -0000
Content-Type: text/plain

The following changes since commit 27d068d05239c26a3848eb101571acab54635e37:

  harfbuzz: upgrade to 1.0.1 (2015-07-27 23:28:23 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/github
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/github

Robert Yang (2):
  bitbake.conf: add GITHUB_GIT
  meta: git://github.com -> ${GITHUB_GIT}

 meta/conf/bitbake.conf                             |    1 +
 .../connman/connman-gnome_0.7.bb                   |    2 +-
 meta/recipes-core/update-rc.d/update-rc.d_0.7.bb   |    2 +-
 meta/recipes-devtools/bootchart2/bootchart2_git.bb |    2 +-
 .../build-compare/build-compare_git.bb             |    2 +-
 meta/recipes-devtools/remake/remake.inc            |    2 +-
 .../recipes-devtools/sgmlspl/sgmlspl-native_git.bb |    2 +-
 .../squashfs-tools/squashfs-tools_git.bb           |    2 +-
 .../chkconfig-alternatives-native_1.3.59.bb        |    2 +-
 meta/recipes-extended/ltp/ltp_20150420.bb          |    2 +-
 meta/recipes-extended/xinetd/xinetd_2.3.15.bb      |    2 +-
 meta/recipes-graphics/eglinfo/eglinfo.inc          |    2 +-
 meta/recipes-graphics/mx/mx-1.0_1.4.7.bb           |    2 +-
 .../xinput-calibrator/xinput-calibrator_git.bb     |    2 +-
 .../recipes-multimedia/gstreamer/gst-player_git.bb |    2 +-
 meta/recipes-multimedia/libav/libpostproc_git.bb   |    2 +-
 meta/recipes-support/lz4/lz4.bb                    |    2 +-
 17 files changed, 17 insertions(+), 16 deletions(-)

-- 
1.7.9.5


