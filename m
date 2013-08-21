Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4AF016B0CE
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Aug 2013 06:15:55 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r7L6FsUt012626
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Aug 2013 23:15:55 -0700 (PDT)
Received: from pek-cc-pb05l.wrs.com (128.224.157.65) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.342.3; Tue, 20 Aug 2013 23:15:53 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 21 Aug 2013 14:15:45 +0800
Message-ID: <cover.1377064624.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 1.7.4.1
MIME-Version: 1.0
Subject: [PATCH 0/6 v2] Add status command for daemon of some packages
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
X-List-Received-Date: Wed, 21 Aug 2013 06:15:55 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

v2 comments:
remove stuff that doesn't related to "status" command

--
The following changes since commit d98f08a7ad95d0b17846276b028a6614f16b6846:

  genext2fs: fix memory corruption on powerpc (2013-08-20 07:11:44 -0700)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib jhuang0/r_status_for_daemons_0821_0
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=jhuang0/r_status_for_daemons_0821_0

Jackie Huang (6):
  sysklogd: add init.d/syslog status command for LSB compliance
  at: add init.d/atd status command for LSB compliance
  dbus: add init.d/dbus-1 status command for LSB compliance
  sysvinit: add init.d/bootlogd status command for LSB compliance
  nfs-utils: add init.d/nfsserver status command for LSB compliance
  openssh: add init.d/sshd status command for LSB compliance

 .../nfs-utils/nfs-utils/nfsserver                  |    9 +++++++++
 .../openssh/openssh-6.2p2/init                     |   14 +++++++++++++-
 meta/recipes-core/dbus/dbus-1.6.10/dbus-1.init     |    9 ++++++++-
 meta/recipes-core/sysvinit/sysvinit/bootlogd.init  |    9 ++++++++-
 meta/recipes-extended/at/files/S99at               |   13 ++++++++++++-
 meta/recipes-extended/sysklogd/files/sysklogd      |   13 ++++++++++++-
 6 files changed, 62 insertions(+), 5 deletions(-)

-- 
1.7.4.1


