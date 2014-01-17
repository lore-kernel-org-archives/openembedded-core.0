Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 886EA6E36D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jan 2014 06:46:34 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s0H6kaJg011463
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Jan 2014 22:46:36 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.164) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Thu, 16 Jan 2014 22:46:35 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 17 Jan 2014 14:46:33 +0800
Message-ID: <cover.1389941136.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 0/5] systemd misc fixes
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
X-List-Received-Date: Fri, 17 Jan 2014 06:46:35 -0000
Content-Type: text/plain

The following changes since commit cfd1520b4b492ab27b2900ba3510abe6f288097e:

  oe-selftest: separated the SStateBase and SStateTests in different modules (2014-01-16 12:18:52 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib ChenQi/systemd-misc-fixes
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/systemd-misc-fixes

Chen Qi (5):
  systemd: add 'less' to its RDEPENDS
  dropbear: add systemd unit files
  openssh: fixes for systemd
  distcc: add systemd support
  at: add systemd support

 .../openssh/openssh-6.4p1/sshd.socket              |    1 -
 .../openssh/openssh-6.4p1/sshd@.service            |    1 +
 .../openssh/openssh-6.4p1/sshdgenkeys.service      |    8 ++++----
 meta/recipes-connectivity/openssh/openssh_6.4p1.bb |    4 ++--
 meta/recipes-core/dropbear/dropbear.inc            |   17 ++++++++++++++++-
 .../recipes-core/dropbear/dropbear/dropbear.socket |   10 ++++++++++
 .../dropbear/dropbear/dropbear@.service            |   11 +++++++++++
 .../dropbear/dropbear/dropbearkey.service          |    8 ++++++++
 meta/recipes-core/systemd/systemd_208.bb           |    3 ++-
 meta/recipes-devtools/distcc/distcc_3.1.bb         |   14 +++++++++++---
 meta/recipes-devtools/distcc/files/default         |    5 +++++
 meta/recipes-devtools/distcc/files/distccd.service |   11 +++++++++++
 meta/recipes-extended/at/at_3.1.14.bb              |   10 +++++++++-
 meta/recipes-extended/at/files/atd.service         |    9 +++++++++
 14 files changed, 99 insertions(+), 13 deletions(-)
 create mode 100644 meta/recipes-core/dropbear/dropbear/dropbear.socket
 create mode 100644 meta/recipes-core/dropbear/dropbear/dropbear@.service
 create mode 100644 meta/recipes-core/dropbear/dropbear/dropbearkey.service
 create mode 100644 meta/recipes-devtools/distcc/files/distccd.service
 create mode 100644 meta/recipes-extended/at/files/atd.service

-- 
1.7.9.5


