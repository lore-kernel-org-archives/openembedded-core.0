Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6C1826156D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Sep 2013 09:33:37 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r8C9Xdpn025982
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Sep 2013 02:33:39 -0700 (PDT)
Received: from pek-hostel-vm02.wrs.com (128.224.153.172) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Thu, 12 Sep 2013 02:33:38 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 12 Sep 2013 05:33:35 -0400
Message-ID: <cover.1378978213.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Subject: [PATCH 0/1] icu-native: do_install: Segmentation fault
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
X-List-Received-Date: Thu, 12 Sep 2013 09:33:37 -0000
Content-Type: text/plain

The following changes since commit bd76847d867f9f76f76f033439cfb834cf59380f:

  libnewt-python: Don't write a whiptail package (2013-09-12 08:23:42 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib robert/icu
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=robert/icu

Robert Yang (1):
  icu-native: do_install: Segmentation fault

 .../icu/icu-51.2/icu-pkgdata-large-cmd.patch       |   29 ++++++++++++++++++++
 meta/recipes-support/icu/icu_51.2.bb               |    4 ++-
 2 files changed, 32 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/icu/icu-51.2/icu-pkgdata-large-cmd.patch

-- 
1.7.10.4


