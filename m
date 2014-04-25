Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 27B2F65D89
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Apr 2014 08:59:42 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s3P8xh1l021564
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 25 Apr 2014 01:59:43 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Fri, 25 Apr 2014 01:59:42 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 25 Apr 2014 16:59:35 +0800
Message-ID: <cover.1398416012.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.8.1.2
MIME-Version: 1.0
Cc: saul.wold@intel.com
Subject: [PATCH 0/1][dora] make: fix invoking makeinfo failed at do_install time
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
X-List-Received-Date: Fri, 25 Apr 2014 08:59:43 -0000
Content-Type: text/plain

The following changes since commit 50e9ccb2aff7b9f9dca4fda99a6832c60f64de3b:

  bitbake: bitbake: fetch2/git: Anchor names when using ls-remote (2014-04-19 11:04:48 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib hongxu/fix-dora-make
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=hongxu/fix-dora-make

Hongxu Jia (1):
  make: fix invoking makeinfo failed at do_install time

 .../doc-make.texi-fix-itemx-must-follow-item.patch | 24 ++++++++++++++++++++++
 meta/recipes-devtools/make/make.inc                |  1 +
 2 files changed, 25 insertions(+)
 create mode 100644 meta/recipes-devtools/make/files/doc-make.texi-fix-itemx-must-follow-item.patch

-- 
1.8.1.2


