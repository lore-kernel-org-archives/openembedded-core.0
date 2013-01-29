Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Kai.Kang@windriver.com>) id 1U04Gu-0008Bm-5H
	for openembedded-core@lists.openembedded.org;
	Tue, 29 Jan 2013 07:02:17 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r0T5kZ1x010817
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Jan 2013 21:46:35 -0800 (PST)
Received: from localhost.localdomain (128.224.162.205) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.318.4; Mon, 28 Jan 2013 21:46:35 -0800
From: Kang Kai <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 29 Jan 2013 13:47:49 +0800
Message-ID: <cover.1359438225.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.7.5.4
MIME-Version: 1.0
X-Originating-IP: [128.224.162.205]
Cc: Zhenfeng.Zhao@windriver.com
Subject: [PATCH 0/1] Fix busybox testsuite du-k-works issue
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
X-List-Received-Date: Tue, 29 Jan 2013 06:02:18 -0000
Content-Type: text/plain

The following changes since commit cfb082961a6c9ac3d65738031c4071210529cd07:

  bitbake: build.py: Dump out performance data of individual tasks (2013-01-28 14:49:05 +0000)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib kangkai/busybox-du
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=kangkai/busybox-du

Kang Kai (1):
  busybox: update test case du-k-works

 ...estsuite-du-du-k-works-fix-false-positive.patch |   35 ++++++++++++++++++++
 meta/recipes-core/busybox/busybox_1.20.2.bb        |    5 ++-
 2 files changed, 38 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-core/busybox/busybox-1.20.2/testsuite-du-du-k-works-fix-false-positive.patch

-- 
1.7.5.4



