Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 23808607BB
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Jul 2015 08:41:30 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t628fRb3014191
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 2 Jul 2015 01:41:27 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.3.224.2; Thu, 2 Jul 2015 01:41:26 -0700
From: Kai Kang <kai.kang@windriver.com>
To: <ross.burton@intel.com>
Date: Thu, 2 Jul 2015 16:40:50 +0800
Message-ID: <cover.1435825953.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [128.224.153.152]
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/1] Cherry-pick 2471f9b from branch dizzy
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
X-List-Received-Date: Thu, 02 Jul 2015 08:41:38 -0000
Content-Type: text/plain

Hi Ross,

I cherry-pick and rebase 2471f9b from branch dizzy.

Board mpc8315e doesn't support feature altivec, so I built on local ppc board
which support feature altivec. It built fine.

Build fine for mpc8315e too that without altivec.

It is backported patch from valgrind upstream and I didn't do runtime test.

Regards,
Kai


The following changes since commit 8ad9a434c9fd0300cf5c38c368b181b78421e95a:

  bitbake: tests/data: Add new data tests (2015-07-01 15:40:21 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib kangkai/valgrind
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=kangkai/valgrind

Kai Kang (1):
  valgrind: build with altivec only if it supported

 .../pass-maltivec-only-if-it-supported.patch       | 68 ++++++++++++++++++++++
 meta/recipes-devtools/valgrind/valgrind_3.10.1.bb  |  1 +
 2 files changed, 69 insertions(+)
 create mode 100644 meta/recipes-devtools/valgrind/valgrind/pass-maltivec-only-if-it-supported.patch

-- 
1.9.1


