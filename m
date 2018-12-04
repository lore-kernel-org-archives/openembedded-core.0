Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0C6126C641
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Dec 2018 04:58:00 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id wB44ve5C013566
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 3 Dec 2018 20:57:50 -0800
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.163.141) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Mon, 3 Dec 2018 20:57:29 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 4 Dec 2018 13:04:45 +0800
Message-ID: <cover.1543899860.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/1] testimage: fix boolean checking for QEMU_USE_KVM
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
X-List-Received-Date: Tue, 04 Dec 2018 04:58:01 -0000
Content-Type: text/plain

*** BLURB HERE ***
The following changes since commit 016e3dda2d6acc9b457079d11b5346a5352a431d:

  btrfs-tools: update to 4.19 (2018-12-03 12:20:01 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib ChenQi/qemu_use_kvm
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/qemu_use_kvm

Chen Qi (1):
  testimage: fix boolean checking for QEMU_USE_KVM

 meta/classes/testimage.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
1.9.1


