Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8F1D86070C
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Jul 2015 03:25:13 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t613PDgE029777
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jun 2015 20:25:14 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.3.224.2; Tue, 30 Jun 2015 20:25:14 -0700
From: Kai Kang <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 1 Jul 2015 11:24:43 +0800
Message-ID: <cover.1435720976.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [128.224.153.152]
Subject: [PATCH 0/1] Fix build path in expect-dev pkg
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
X-List-Received-Date: Wed, 01 Jul 2015 03:25:14 -0000
Content-Type: text/plain

The following changes since commit 410a6377493ebf3fa21045c390693f021149c241:

  bitbake: tests/data: Add new data tests (2015-06-30 09:06:35 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib kangkai/expect
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=kangkai/expect

Yue Tao (1):
  expect: replace the STAGING_INCDIR with includedir

 meta/recipes-devtools/expect/expect_5.45.bb | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

-- 
1.9.1


