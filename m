Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4F77A60235
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Sep 2016 08:54:00 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u8U8s1Kq028505
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Sep 2016 01:54:01 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Fri, 30 Sep 2016 01:54:00 -0700
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 30 Sep 2016 16:49:54 +0800
Message-ID: <cover.1475225357.git.kai.kang@windriver.com>
X-Mailer: git-send-email 2.9.3
MIME-Version: 1.0
Subject: [PATCH 0/1] kbd: create ptest sub-package
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
X-List-Received-Date: Fri, 30 Sep 2016 08:54:01 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

The following changes since commit 5d8a968ecdf40babe452b0ac63d94a7a163710ae:

  dev-manual: Applied review changes to GNU debugging section. (2016-09-28 15:02:33 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib kangkai/kbd
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=kangkai/kbd

Kai Kang (1):
  kbd: create ptest sub-package

 meta/recipes-core/kbd/kbd/run-ptest                |  4 ++
 .../kbd/kbd/set-proper-path-of-resources.patch     | 56 ++++++++++++++++++++++
 meta/recipes-core/kbd/kbd_2.0.3.bb                 | 19 ++++++++
 3 files changed, 79 insertions(+)
 create mode 100644 meta/recipes-core/kbd/kbd/run-ptest
 create mode 100644 meta/recipes-core/kbd/kbd/set-proper-path-of-resources.patch

-- 
2.9.3


