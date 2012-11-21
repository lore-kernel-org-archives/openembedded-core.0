Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Kai.Kang@windriver.com>) id 1Tb6yk-0005fC-Dp
	for openembedded-core@lists.openembedded.org;
	Wed, 21 Nov 2012 10:52:22 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id qAL9cGiP011580
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 21 Nov 2012 01:38:16 -0800 (PST)
Received: from localhost.localdomain (128.224.162.205) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.318.4; Wed, 21 Nov 2012 01:38:15 -0800
From: Kang Kai <kai.kang@windriver.com>
To: <sgw@linux.intel.com>
Date: Wed, 21 Nov 2012 17:38:40 +0800
Message-ID: <cover.1353490311.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.7.5.4
MIME-Version: 1.0
X-Originating-IP: [128.224.162.205]
Cc: Zhenfeng.Zhao@windriver.com, openembedded-core@lists.openembedded.org
Subject: [PATCH 0/4] V2: drop lsbsetup
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
X-List-Received-Date: Wed, 21 Nov 2012 09:52:22 -0000
Content-Type: text/plain

V2:
Break up the big patch.

The following changes since commit 9acfef96333ffe6e08998e6fd69187c14532d26c:

  yocto-bsp: update qemu machine.conf template (2012-11-18 16:42:10 +0000)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib kangkai/lsb
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=kangkai/lsb

Kang Kai (4):
  lsbsetup: drop it
  packagegroup-core-lsb: remove lsbsetup
  chkconfig: add link files install_initd and remove_initd
  msmtp: add link to ${libdir}/sendmail

 .../recipes-extended/chkconfig/chkconfig_1.3.58.bb |   10 +-
 meta/recipes-extended/lsb/lsbsetup/LSB_Setup.sh    |  230 --------------------
 meta/recipes-extended/lsb/lsbsetup_1.0.bb          |   26 ---
 meta/recipes-extended/msmtp/msmtp_1.4.24.bb        |    9 +-
 .../packagegroups/packagegroup-core-lsb.bb         |    3 +-
 5 files changed, 18 insertions(+), 260 deletions(-)
 delete mode 100644 meta/recipes-extended/lsb/lsbsetup/LSB_Setup.sh
 delete mode 100644 meta/recipes-extended/lsb/lsbsetup_1.0.bb

-- 
1.7.5.4



