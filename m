Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5F7A260237
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Oct 2018 03:55:31 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w9B3tWe6029352
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Oct 2018 20:55:32 -0700 (PDT)
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.408.0; Wed, 10 Oct 2018 20:55:31 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 11 Oct 2018 12:06:52 +0800
Message-ID: <cover.1539230757.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH 0/1] prelink: Fix Segmentation fault error when prelink qemu
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
X-List-Received-Date: Thu, 11 Oct 2018 03:55:31 -0000
Content-Type: text/plain

The following changes since commit d0d55add6cb01252a46d829ade75666920b676fa:

  libxml2: Make it compatible with externalsrc (2018-10-10 14:33:34 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/prelink
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=rbt/prelink

Robert Yang (1):
  prelink: Fix Segmentation fault error when prelink qemu

 ...ps.c-check-info-resolvetls-before-use-its.patch | 51 ++++++++++++++++++++++
 meta/recipes-devtools/prelink/prelink_git.bb       |  1 +
 2 files changed, 52 insertions(+)
 create mode 100644 meta/recipes-devtools/prelink/prelink/0001-src-arch-mips.c-check-info-resolvetls-before-use-its.patch

-- 
2.7.4


