Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Jingdong.Lu@windriver.com>) id 1Qw8qV-0007vc-QP
	for Openembedded-core@lists.openembedded.org;
	Wed, 24 Aug 2011 10:30:00 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p7O8PCfO013563
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <Openembedded-core@lists.openembedded.org>;
	Wed, 24 Aug 2011 01:25:12 -0700 (PDT)
Received: from localhost (128.224.162.207) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Wed, 24 Aug 2011 01:25:11 -0700
From: Jingdong.Lu@windriver.com
To: <Openembedded-core@lists.openembedded.org>
Date: Wed, 24 Aug 2011 16:25:03 +0800
Message-ID: <cover.1314172740.git.jingdong.lu@windriver.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
X-Originating-IP: [128.224.162.207]
Subject: [PATCH 0/1]initrdscripts: fix init-live.sh for hddimg and livecd
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 24 Aug 2011 08:30:00 -0000
Content-Type: text/plain

From: Jingdong Lu <jingdong.lu@windriver.com>

Both hddimg and livecd use init-live.sh script to boot the rootfs.img.
But the paths of rootfs.img in hddimg and livecd are different. So we add
a variable "ISOLINUX" to provide a correct path. 

The following changes since commit edd8e1e8b974eb3f0f9f66c2207aadf43612350b:
  Scott Rifenbark (1):
        documentation/adt-manual/adt-command.xml: general edits.

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib jingdonglu/bug686-v2
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=jingdonglu/bug686-v2

Jingdong Lu (1):
  initrdscripts: fix init-live.sh for hddimg and livecd

 meta/recipes-core/initrdscripts/files/init-live.sh |   17 +++++++++++------
 .../initrdscripts/initramfs-live-boot_1.0.bb       |    2 +-
 2 files changed, 12 insertions(+), 7 deletions(-)



