Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 7208261013
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Aug 2013 02:20:18 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r7K2KHuH006280
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 19 Aug 2013 19:20:17 -0700 (PDT)
Received: from pek-kkang-d1.wrs.com (128.224.162.231) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.342.3; Mon, 19 Aug 2013 19:20:15 -0700
From: Kai Kang <kai.kang@windriver.com>
To: <sgw@linux.intel.com>
Date: Tue, 20 Aug 2013 10:20:07 +0800
Message-ID: <cover.1376965065.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.8.1.2
MIME-Version: 1.0
X-Originating-IP: [128.224.162.231]
Cc: Zhangle.Yang@windriver.com, openembedded-core@lists.openembedded.org
Subject: [PATCH 0/1] Fix bc segmentation fault.
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
X-List-Received-Date: Tue, 20 Aug 2013 02:20:19 -0000
Content-Type: text/plain

The following changes since commit 6382979cca1d1c57467f983ba9611f91555b20a9:

  cronie: fix out of tree build (2013-08-19 11:25:23 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib kangkai/bc
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=kangkai/bc

Kai Kang (1):
  bc: fix segmentation fault

 meta/recipes-extended/bc/bc_1.06.bb                |  3 ++-
 .../bc/files/fix-segment-fault.patch               | 28 ++++++++++++++++++++++
 2 files changed, 30 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-extended/bc/files/fix-segment-fault.patch

-- 
1.8.1.2


