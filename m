Return-Path: <Dengke.Du@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id C079D6B6EA
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Nov 2017 07:28:05 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id vA37S6Jc016356
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 3 Nov 2017 00:28:06 -0700 (PDT)
Received: from pek-ddu-u1642.wrs.com (128.224.162.135) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Fri, 3 Nov 2017 00:28:05 -0700
From: Dengke Du <dengke.du@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 3 Nov 2017 15:26:41 +0800
Message-ID: <cover.1509693899.git.dengke.du@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH 0/1] expat: upgrade to 2.2.5
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
X-List-Received-Date: Fri, 03 Nov 2017 07:28:05 -0000
Content-Type: text/plain

The following changes since commit 514a808f21c37b6ad704ce397bb2740ecc9a93bc:

  ref-manual: Updates to "Image Generation" section. (2017-10-30 15:55:08 +0000)

are available in the git repository at:

  https://github.com/DengkeDu/openembedded-core.git dengke/expat-2.2.5
  https://github.com//tree/dengke/expat-2.2.5

Dengke Du (1):
  expat: upgrade to 2.2.5

 meta/recipes-core/expat/expat/libtool-tag.patch | 34 +++++++++++++++++--------
 meta/recipes-core/expat/expat_2.2.3.bb          |  4 ---
 meta/recipes-core/expat/expat_2.2.5.bb          |  4 +++
 3 files changed, 27 insertions(+), 15 deletions(-)
 delete mode 100644 meta/recipes-core/expat/expat_2.2.3.bb
 create mode 100644 meta/recipes-core/expat/expat_2.2.5.bb

-- 
2.7.4


