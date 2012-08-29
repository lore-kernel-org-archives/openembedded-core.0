Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Kai.Kang@windriver.com>) id 1T6fsA-0007LU-Ic
	for openembedded-core@lists.openembedded.org;
	Wed, 29 Aug 2012 12:51:46 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id q7TAdVlP026114
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Aug 2012 03:39:32 -0700 (PDT)
Received: from localhost.localdomain (128.224.162.164) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.309.2; Wed, 29 Aug 2012 03:39:30 -0700
From: Kang Kai <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 29 Aug 2012 18:39:38 +0800
Message-ID: <cover.1346236551.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.7.5.4
MIME-Version: 1.0
X-Originating-IP: [128.224.162.164]
Cc: Zhenfeng.Zhao@windriver.com
Subject: [PATCH 0/2] Patches for dependency issue
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
X-List-Received-Date: Wed, 29 Aug 2012 10:51:47 -0000
Content-Type: text/plain

The following changes since commit b4c5725af4cd85d5644f0373e2674e903c4eab2b:

  yocto-bsp: add missing xserver-xf86-config .bbappend for qemu (2012-08-25 14:47:07 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib kangkai/deps
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=kangkai/deps

Kang Kai (2):
  Add dependency libidn to 3 packages
  ltp: add dependency libaio

 .../ghostscript/ghostscript_9.05.bb                |    4 ++--
 meta/recipes-extended/ltp/ltp_20120614.bb          |    4 ++--
 meta/recipes-extended/msmtp/msmtp_1.4.24.bb        |    4 ++--
 meta/recipes-extended/wget/wget.inc                |    4 ++--
 4 files changed, 8 insertions(+), 8 deletions(-)

-- 
1.7.5.4



