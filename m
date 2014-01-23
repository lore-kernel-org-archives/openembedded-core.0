Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 22D416DC8B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jan 2014 12:12:23 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s0NCCNEp001781
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jan 2014 04:12:23 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.164) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.347.0; Thu, 23 Jan 2014 04:12:23 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 23 Jan 2014 20:12:33 +0800
Message-ID: <cover.1390479069.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 0/4] Rework initscripts-functions dependency issue
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
X-List-Received-Date: Thu, 23 Jan 2014 12:12:23 -0000
Content-Type: text/plain

The following changes since commit c36607b62fa7eef5d0494df5aa77666605559723:

  Revert "e2fsprogs/populate-extfs.sh: fix a problem on dash" (2014-01-23 10:29:32 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib ChenQi/initscripts-functions-rework
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=ChenQi/initscripts-functions-rework

Chen Qi (4):
  Revert "Add missing RDEPENDS of initscripts-functions"
  update-rc.d: automatically rdepend on initscripts-funtions
  sysvinit: add initscripts-functions to RDEPENDS
  initscripts: add initscripts-functions-dev package

 meta/classes/update-rc.d.bbclass                   |   12 ++++++++++++
 meta/recipes-bsp/alsa-state/alsa-state.bb          |    2 +-
 meta/recipes-bsp/apmd/apmd_3.2.2-14.bb             |    1 -
 .../irda-utils/irda-utils_0.9.18.bb                |    2 --
 .../nfs-utils/nfs-utils_1.2.9.bb                   |    4 ++--
 meta/recipes-connectivity/openssh/openssh_6.4p1.bb |    2 +-
 meta/recipes-connectivity/ppp/ppp_2.4.5.bb         |    1 -
 meta/recipes-core/dbus/dbus.inc                    |    2 +-
 meta/recipes-core/initscripts/initscripts_1.0.bb   |    4 +++-
 meta/recipes-core/systemd/systemd_208.bb           |    2 +-
 meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb     |    4 ++--
 meta/recipes-devtools/distcc/distcc_3.1.bb         |    1 -
 meta/recipes-devtools/tcf-agent/tcf-agent_git.bb   |    2 +-
 meta/recipes-extended/at/at_3.1.14.bb              |    3 ++-
 meta/recipes-extended/cronie/cronie_1.4.11.bb      |    2 --
 meta/recipes-extended/rpcbind/rpcbind_0.2.1.bb     |    2 --
 meta/recipes-extended/sysklogd/sysklogd.inc        |    2 --
 meta/recipes-extended/xinetd/xinetd_2.3.15.bb      |    1 -
 .../oprofile/oprofileui-server_git.bb              |    2 +-
 19 files changed, 27 insertions(+), 24 deletions(-)

-- 
1.7.9.5


