Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id A6F8B771CA
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Nov 2015 02:08:42 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id tAD28fLs011559
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Thu, 12 Nov 2015 18:08:42 -0800
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.159) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Thu, 12 Nov 2015 18:08:41 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>,
	<richard.purdie@linuxfoundation.org>
Date: Fri, 13 Nov 2015 10:08:30 +0800
Message-ID: <cover.1447380260.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/1] qemu: fix CVE-2015-5279
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
X-List-Received-Date: Fri, 13 Nov 2015 02:08:43 -0000
Content-Type: text/plain

The following changes since commit fc45deac89ef63ca1c44e763c38ced7dfd72cbe1:

  build-appliance-image: Update to jethro head revision (2015-11-03 14:03:03 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib hongxu/qemu
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=hongxu/qemu

Hongxu Jia (1):
  qemu: fix CVE-2015-5279

 .../qemu/qemu/qemu-CVE-2015-5279.patch             | 78 ++++++++++++++++++++++
 meta/recipes-devtools/qemu/qemu_2.4.0.bb           |  1 +
 2 files changed, 79 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/qemu-CVE-2015-5279.patch

-- 
1.9.1


