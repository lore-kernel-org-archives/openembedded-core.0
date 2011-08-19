Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Jingdong.Lu@windriver.com>) id 1QuLj1-0004RF-RT
	for Openembedded-core@lists.openembedded.org;
	Fri, 19 Aug 2011 11:50:52 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p7J9kAFj011912
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <Openembedded-core@lists.openembedded.org>;
	Fri, 19 Aug 2011 02:46:10 -0700 (PDT)
Received: from localhost (128.224.162.156) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Fri, 19 Aug 2011 02:46:10 -0700
From: Jingdong.Lu@windriver.com
To: <Openembedded-core@lists.openembedded.org>
Date: Fri, 19 Aug 2011 17:46:04 +0800
Message-ID: <cover.1313747056.git.jingdong.lu@windriver.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
X-Originating-IP: [128.224.162.156]
Subject: [PATCH 0/1]mpc8315e-rdb: add kernel modules to rootfs
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
X-List-Received-Date: Fri, 19 Aug 2011 09:50:53 -0000
Content-Type: text/plain

From: Jingdong Lu <jingdong.lu@windriver.com>

Fix bug: [YOCTO #817]

Add kernel modules to rootfs for mpc8315e.

The following changes since commit 081e010443a3436dbd5415968aeb3ef4383e2686:
  Jingdong Lu (1):
        initrdscripts: fix init-live.sh

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib jingdonglu/bug817
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=jingdonglu/bug817

Jingdong Lu (1):
  mpc8315e-rdb: add kernel modules to rootfs

 meta-yocto/conf/machine/mpc8315e-rdb.conf |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)



