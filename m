Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Hongxu.Jia@windriver.com>) id 1UQXfQ-00057h-BF
	for openembedded-core@lists.openembedded.org;
	Fri, 12 Apr 2013 08:41:04 +0200
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r3C6NZTw000043
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Apr 2013 23:23:35 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.147) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Thu, 11 Apr 2013 23:23:34 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 12 Apr 2013 14:23:28 +0800
Message-ID: <cover.1365732443.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Subject: [PATCH 0/3]udev-extraconf:fix rootless X write to usb storage failed
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 12 Apr 2013 06:41:05 -0000
Content-Type: text/plain

The following need to be discussed:
1, Is it proper to change the group of storage dir to `disk', and grant
   it with w/r/x permissions?

2, Is it proper to add xuser to group `disk', is there a security issue?


The following changes since commit 95b71d2b03a3a6dc5d32a7d6a84ec3420f39aa61:

  routerstationpro: strip the output kernel of .comment section (2013-04-11 09:03:21 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib hongxu/fix-udev-xuser-2
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=hongxu/fix-udev-xuser-2

Hongxu Jia (3):
  xserver-nodm-init: Add xuser to disk group
  connman.inc: Add xuser to disk group
  udev-extraconf:fix rootless X write to usb storage failed

 meta/recipes-connectivity/connman/connman.inc      |    2 +-
 meta/recipes-core/udev/udev-extraconf/mount.sh     |   25 ++++++++++++++++++--
 .../x11-common/xserver-nodm-init.bb                |    4 ++--
 3 files changed, 26 insertions(+), 5 deletions(-)

-- 
1.7.10.4



