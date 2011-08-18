Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Jingdong.Lu@windriver.com>) id 1QtylP-0000a6-C5
	for Openembedded-core@lists.openembedded.org;
	Thu, 18 Aug 2011 11:19:47 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p7I9F7Pe020550
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <Openembedded-core@lists.openembedded.org>;
	Thu, 18 Aug 2011 02:15:07 -0700 (PDT)
Received: from localhost (128.224.162.156) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Thu, 18 Aug 2011 02:15:07 -0700
From: Jingdong.Lu@windriver.com
To: <Openembedded-core@lists.openembedded.org>
Date: Thu, 18 Aug 2011 17:00:51 +0800
Message-ID: <cover.1313657192.git.jingdong.lu@windriver.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
X-Originating-IP: [128.224.162.156]
Subject: [PATCH 0/1]initrdscripts: fix init-live.sh
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
X-List-Received-Date: Thu, 18 Aug 2011 09:19:47 -0000
Content-Type: text/plain

From: Jingdong Lu <jingdong.lu@windriver.com>

Fix bug: [YOCTO 686] (partly)

"ROOT_IMAGE" is a wrong path and it can't be mounted when using liveCD. So
modify value of "ROOT_IMAGE" in init-live.sh to "isolinux/rootfs.img".
If we want to use liveCD, we also need to add some kernel options related to
CDROM support when compling kernel. 

The following changes since commit a21ff559e7c93e9da61104f4a33e42e6004189fd:
  Richard Purdie (1):
        Fixup remaining bb.msg.domain users

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib jingdonglu/bug686
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=jingdonglu/bug686

Jingdong Lu (1):
  initrdscripts: fix init-live.sh

 meta/recipes-core/initrdscripts/files/init-live.sh |    2 +-
 .../initrdscripts/initramfs-live-boot_1.0.bb       |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)



