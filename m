Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 899B86065F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Aug 2013 03:25:48 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r7K3PnJ4006885
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Aug 2013 20:25:49 -0700 (PDT)
Received: from pek-cc-pb05l.wrs.com (128.224.157.65) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.342.3; Mon, 19 Aug 2013 20:25:48 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 20 Aug 2013 11:25:40 +0800
Message-ID: <cover.1376968627.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 1.7.4.1
MIME-Version: 1.0
Subject: [PATCH 0/6] Add status command for LSB compliance for some packages
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
X-List-Received-Date: Tue, 20 Aug 2013 03:25:48 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

test info:
MACHINE ??= "qemux86-64"
IMAGE_INSTALL_append = " at sysklogd"

$ bitbake core-image-sato

root@qemux86-64:~# /etc/init.d/atd status
/usr/sbin/atd (pid 580) is running...
root@qemux86-64:~# /etc/init.d/syslog status
syslogd (pid 695) is running...
klogd (pid 697) is running...
root@qemux86-64:~# /etc/init.d/nfsserver status
/usr/sbin/rpc.mountd (pid 685) is running...
nfsd (pid 683 682 681 680 679 678 677 676) is running...
root@qemux86-64:~# /etc/init.d/bootlogd status
/sbin/bootlogd is stopped
root@qemux86-64:~# /etc/init.d/dbus-1 status
/usr/bin/dbus-daemon (pid 704 589) is running...
root@qemux86-64:~# /etc/init.d/sshd status
/usr/sbin/sshd (pid 627) is running...

--
The following changes since commit 57662d4f813d5795cac1529633db80a09efdb089:

  meta-skeleton: Add busybox config fragment example (2013-08-13 23:03:44 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib jhuang0/r_status_for_daemons_0820_0
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=jhuang0/r_status_for_daemons_0820_0

Jackie Huang (6):
  dbus: add init.d/dbus-1 status command for LSB compliance
  sysvinit: add init.d/bootlogd status command for LSB compliance
  nfs-utils: add init.d/nfsserver status command for LSB compliance
  openssh: add init.d/sshd status command for LSB compliance
  sysklogd: add init.d/syslog status command for LSB compliance
  at: add init.d/atd status command for LSB compliance

 .../nfs-utils/nfs-utils/nfsserver                  |   25 ++++++++++++++++-
 .../openssh/openssh-6.2p2/init                     |   15 ++++++++++-
 meta/recipes-core/dbus/dbus-1.6.10/dbus-1.init     |    9 +++++-
 meta/recipes-core/sysvinit/sysvinit/bootlogd.init  |   28 +++++++++++++++++---
 meta/recipes-extended/at/files/S99at               |   13 ++++++++-
 meta/recipes-extended/sysklogd/files/sysklogd      |   13 ++++++++-
 6 files changed, 93 insertions(+), 10 deletions(-)

-- 
1.7.4.1


