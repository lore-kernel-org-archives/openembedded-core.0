Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 41B8E60D86
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Jan 2014 07:27:15 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s067RFcW003106
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 5 Jan 2014 23:27:15 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.164) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Sun, 5 Jan 2014 23:27:15 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 6 Jan 2014 15:27:33 +0800
Message-ID: <cover.1388992959.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH V3 0/2] Split the functions script into a separate package in initscripts
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
X-List-Received-Date: Mon, 06 Jan 2014 07:27:15 -0000
Content-Type: text/plain

Changes since V2:
1. Fix the FILES for the initscripts-functions package
2. Rebase against the latest master

//Chen Qi


The following changes since commit f33c990db392c6b208efecea0f941449c4d25cec:

  maintainers.inc: reassign e2fsprogs (2014-01-03 15:16:42 +0000)

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


