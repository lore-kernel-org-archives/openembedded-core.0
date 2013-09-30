Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 80E806102E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Sep 2013 09:48:35 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r8U9mcc8000723
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Sep 2013 02:48:38 -0700 (PDT)
Received: from pek-kkang-d1.wrs.com (128.224.162.231) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.347.0; Mon, 30 Sep 2013 02:48:36 -0700
From: Kai Kang <kai.kang@windriver.com>
To: <mark.hatle@windriver.com>
Date: Mon, 30 Sep 2013 17:48:24 +0800
Message-ID: <cover.1380534395.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.8.1.2
MIME-Version: 1.0
X-Originating-IP: [128.224.162.231]
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/1] Fix YOCTO #3656
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
X-List-Received-Date: Mon, 30 Sep 2013 09:48:36 -0000
Content-Type: text/plain

The following changes since commit b049d532f6e0ab9e458e486f81b00be47ee69acf:

  testimage: Exclude BB_ORIGENV variable (2013-09-26 17:27:02 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib kangkai/rpm2cpio
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=kangkai/rpm2cpio

Kang Kai (1):
  rpm: fix rpm2cpio segmentation fault

 .../rpm/rpm/rpm2cpio-fix-segmentation-fault.patch  | 28 ++++++++++++++++++++++
 meta/recipes-devtools/rpm/rpm_5.4.9.bb             |  1 +
 2 files changed, 29 insertions(+)
 create mode 100644 meta/recipes-devtools/rpm/rpm/rpm2cpio-fix-segmentation-fault.patch

-- 
1.8.1.2


