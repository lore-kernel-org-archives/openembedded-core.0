Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Kai.Kang@WINDRIVER.COM>) id 1TZFpH-00026T-5W
	for openembedded-core@lists.openembedded.org;
	Fri, 16 Nov 2012 07:54:55 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id qAG6echn021478
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Nov 2012 22:40:58 -0800 (PST)
Received: from localhost.localdomain (128.224.162.205) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.318.4; Thu, 15 Nov 2012 22:40:52 -0800
From: Kang Kai <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 16 Nov 2012 14:41:24 +0800
Message-ID: <cover.1353031471.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.7.5.4
MIME-Version: 1.0
X-Originating-IP: [128.224.162.205]
Cc: Zhenfeng.Zhao@WINDRIVER.COM
Subject: [PATCH 0/1] Remove package lsbsetup
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
X-List-Received-Date: Fri, 16 Nov 2012 06:54:55 -0000
Content-Type: text/plain

The following changes since commit 9e0d3c0faa9cc80ce8f2ce0eb31dcd20ef875955:

  sstate: Bump version number to deal with layout fixes (2012-11-14 23:37:45 +0000)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib kangkai/lsb
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=kangkai/lsb

Kang Kai (1):
  lsbsetup: remove it

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



