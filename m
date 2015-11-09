Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id B176B76294
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Nov 2015 01:16:54 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id tA91GssI014707
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 8 Nov 2015 17:16:54 -0800
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Sun, 8 Nov 2015 17:16:53 -0800
From: <wenzong.fan@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 8 Nov 2015 20:16:51 -0500
Message-ID: <cover.1447031701.git.wenzong.fan@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/1 v2] mdadm: fix CFLAGS and ptest issues
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
X-List-Received-Date: Mon, 09 Nov 2015 01:16:55 -0000
Content-Type: text/plain

From: Wenzong Fan <wenzong.fan@windriver.com>

V2 change:

* also fix another ptest error while building poky-lsb:

  raid6check.c:352:2: error: ignoring return value of posix_memalign, \
  declared with attribute warn_unused_result [-Werror=unused-result]

The following changes since commit fc45deac89ef63ca1c44e763c38ced7dfd72cbe1:

  build-appliance-image: Update to jethro head revision (2015-11-03 14:03:03 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib wenzong/mdadm
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=wenzong/mdadm

Wenzong Fan (1):
  mdadm: fix CFLAGS and ptest issues

 .../mdadm/files/mdadm-fix-ptest-build-errors.patch | 50 ++++++++++++++++++++++
 meta/recipes-extended/mdadm/mdadm_3.3.4.bb         |  3 +-
 2 files changed, 52 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-extended/mdadm/files/mdadm-fix-ptest-build-errors.patch

-- 
1.9.1


