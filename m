Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9979F60592
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Jul 2013 08:14:56 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r6M8EvJH027830
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Jul 2013 01:14:57 -0700 (PDT)
Received: from pek-cc-pb05l.wrs.com (128.224.157.65) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Mon, 22 Jul 2013 01:14:57 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 22 Jul 2013 16:14:53 +0800
Message-ID: <cover.1374480160.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 1.7.4.1
MIME-Version: 1.0
Subject: [PATCH 0/2] dbus: fix two issues
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
X-List-Received-Date: Mon, 22 Jul 2013 08:14:57 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

Test info:
MACHINE = "qemux86-64"

$ bitbake core-image-sato
$ runqemu qemux86-64 core-image-sato ext3 nographic
root@qemux86-64:~# /etc/init.d/dbus-1 stop
Stopping system message bus: dbus.
root@qemux86-64:~# /etc/init.d/dbus-1 restart
Stopping system message bus: dbus.
Starting system message bus: dbus.
root@qemux86-64:~# /etc/init.d/dbus-1 start
system message bus already started; not starting.
Starting system message bus: dbus.
root@qemux86-64:~# /etc/init.d/dbus-1 stop
Stopping system message bus: dbus.
root@qemux86-64:~# /etc/init.d/dbus-1 start
Starting system message bus: dbus.

--
The following changes since commit 8fc6904fe97438478119db6cd23b7b4eb33b50aa:

  curl: add upstream status to patch (2013-07-18 12:21:13 -0700)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib jhuang0/r_bbappend_dbus_0722_0
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=jhuang0/r_bbappend_dbus_0722_0

Jackie Huang (2):
  dbus: remove build host test in configure script
  dbus: add -o option into start-stop-daemon arguments

 meta/recipes-core/dbus/dbus-1.6.10/dbus-1.init  |    4 +-
 meta/recipes-core/dbus/dbus-1.6.8/os-test.patch |   35 +++++++++++++++++++++++
 meta/recipes-core/dbus/dbus.inc                 |    4 ++-
 3 files changed, 40 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-core/dbus/dbus-1.6.8/os-test.patch

-- 
1.7.4.1


