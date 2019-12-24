Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 02B097F85F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Dec 2019 07:20:27 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id xBO7K8mP006558
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Dec 2019 23:20:19 -0800
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.468.0; Mon, 23 Dec 2019 23:19:57 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 24 Dec 2019 15:21:08 +0800
Message-ID: <cover.1577171808.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH v2 0/1] pseudo: Make realpath() remove trailing slashes
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
X-List-Received-Date: Tue, 24 Dec 2019 07:20:28 -0000
Content-Type: text/plain

* V2:
  Fix Upstream-Status

* V1:
  Initial version

// Robert

The following changes since commit d6c62cc0305ab082e990041da104fedb5798e0e4:

  oeqa: reproducible: Test core-image-sato and core-image-full-cmdline (2019-12-18 10:17:49 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/pseudo
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=rbt/pseudo

Robert Yang (1):
  pseudo: Make realpath() remove trailing slashes

 .../0001-realpath.c-Remove-trailing-slashes.patch  | 57 ++++++++++++++++++++++
 meta/recipes-devtools/pseudo/pseudo_git.bb         |  1 +
 2 files changed, 58 insertions(+)
 create mode 100644 meta/recipes-devtools/pseudo/files/0001-realpath.c-Remove-trailing-slashes.patch

-- 
2.7.4


