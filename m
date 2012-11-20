Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Qi.Chen@windriver.com>) id 1TakRQ-0003fR-4Q
	for openembedded-core@lists.openembedded.org;
	Tue, 20 Nov 2012 10:48:28 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id qAK9YNhK006482
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Nov 2012 01:34:23 -0800 (PST)
Received: from chenqi-OptiPlex-760.corp.ad.wrs.com (128.224.163.154) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.318.4; Tue, 20 Nov 2012 01:34:23 -0800
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 20 Nov 2012 17:34:32 +0800
Message-ID: <cover.1353311649.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Cc: Zhenfeng.Zhao@windriver.com
Subject: [PATCH 0/1] mdadm: make udev rules dir configurable
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
X-List-Received-Date: Tue, 20 Nov 2012 09:48:28 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

The following changes since commit 9acfef96333ffe6e08998e6fd69187c14532d26c:

  yocto-bsp: update qemu machine.conf template (2012-11-18 16:42:10 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib ChenQi/mdadm
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/mdadm

Chen Qi (1):
  mdadm: make udev rules dir configurable

 .../mdadm-make-udev-rules-dir-configurable.patch   |   30 ++++++++++++++++++++
 meta/recipes-extended/mdadm/mdadm_3.2.6.bb         |    4 ++-
 2 files changed, 33 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-extended/mdadm/files/mdadm-make-udev-rules-dir-configurable.patch

-- 
1.7.9.5



