Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 96ADE6B5F6
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Jan 2014 02:24:51 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s022OqKY005938
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 1 Jan 2014 18:24:52 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.164) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.347.0; Wed, 1 Jan 2014 18:24:52 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 2 Jan 2014 10:25:03 +0800
Message-ID: <cover.1388629298.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH V2 0/2] Split the functions script into a separate package in initscripts
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
X-List-Received-Date: Thu, 02 Jan 2014 02:24:53 -0000
Content-Type: text/plain

Changes since V1:
1. Add initscripts-functions to the REPENDS of the packages that need it instead of always intalling it.

//Chen Qi


The following changes since commit 005af45191ded6185c618c708181b31281e43092:

  bitbake: fetch2: avoid printing "no checksum" error message twice (2013-12-22 14:29:13 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib ChenQi/initscripts-functions
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/initscripts-functions

Chen Qi (2):
  initscripts: split the functions script into a separate package
  Add missing RDEPENDS of initscripts-functions

 meta/recipes-bsp/alsa-state/alsa-state.bb          |    2 +-
 meta/recipes-bsp/apmd/apmd_3.2.2-14.bb             |    1 +
 .../irda-utils/irda-utils_0.9.18.bb                |    2 ++
 .../nfs-utils/nfs-utils_1.2.9.bb                   |    4 ++--
 meta/recipes-connectivity/openssh/openssh_6.4p1.bb |    2 +-
 meta/recipes-connectivity/ppp/ppp_2.4.5.bb         |    1 +
 meta/recipes-core/dbus/dbus.inc                    |    2 +-
 meta/recipes-core/initscripts/initscripts_1.0.bb   |    8 ++++++--
 meta/recipes-core/systemd/systemd_208.bb           |    2 +-
 meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb     |    2 +-
 meta/recipes-devtools/distcc/distcc_3.1.bb         |    1 +
 meta/recipes-devtools/tcf-agent/tcf-agent_git.bb   |    2 +-
 meta/recipes-extended/at/at_3.1.14.bb              |    3 +--
 meta/recipes-extended/cronie/cronie_1.4.11.bb      |    2 ++
 meta/recipes-extended/rpcbind/rpcbind_0.2.1.bb     |    2 ++
 meta/recipes-extended/sysklogd/sysklogd.inc        |    2 ++
 meta/recipes-extended/xinetd/xinetd_2.3.15.bb      |    1 +
 .../oprofile/oprofileui-server_git.bb              |    2 +-
 18 files changed, 28 insertions(+), 13 deletions(-)

-- 
1.7.9.5


