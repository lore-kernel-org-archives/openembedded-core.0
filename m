Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1F23A773BC
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Nov 2015 07:32:15 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id tAG7WFhX008438
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 15 Nov 2015 23:32:15 -0800
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Sun, 15 Nov 2015 23:32:14 -0800
From: <wenzong.fan@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 16 Nov 2015 02:32:10 -0500
Message-ID: <cover.1447659023.git.wenzong.fan@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/3] qemu: fix CVE-2015-5225, CVE-2015-6855, CVE-2015-7295
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
X-List-Received-Date: Mon, 16 Nov 2015 07:32:18 -0000
Content-Type: text/plain

From: Wenzong Fan <wenzong.fan@windriver.com>

The following changes since commit fc45deac89ef63ca1c44e763c38ced7dfd72cbe1:

  build-appliance-image: Update to jethro head revision (2015-11-03 14:03:03 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib wenzong/qemu-cve
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=wenzong/qemu-cve

Wenzong Fan (3):
  qemu: fix CVE-2015-5225
  qemu: fix CVE-2015-6855
  qemu: fix CVE-2015-7295

 .../qemu/qemu/qemu-CVE-2015-5225.patch             |  91 +++++++++++
 .../qemu/qemu/qemu-CVE-2015-6855.patch             | 151 +++++++++++++++++++
 .../qemu/qemu/qemu-CVE-2015-7295.patch             | 166 +++++++++++++++++++++
 meta/recipes-devtools/qemu/qemu_2.4.0.bb           |   3 +
 4 files changed, 411 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/qemu-CVE-2015-5225.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/qemu-CVE-2015-6855.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/qemu-CVE-2015-7295.patch

-- 
1.9.1


