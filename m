Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6780079265
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Aug 2018 06:09:12 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w7G69DSB023141
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Aug 2018 23:09:13 -0700
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.399.0; Wed, 15 Aug 2018 23:09:11 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 16 Aug 2018 14:19:45 +0800
Message-ID: <cover.1534400247.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH 0/2] prelink: fixed segmentation fault when install libqb
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
X-List-Received-Date: Thu, 16 Aug 2018 06:09:12 -0000
Content-Type: text/plain

The following changes since commit 125789b6ee6d47ab84192230f63971c4e22418ba:

  cve-check.bbclass: do not download the CVE DB in package-specific tasks (2018-08-15 21:45:10 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/prelink
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=rbt/prelink

Robert Yang (2):
  prelink: use ehdr.e_shstrndx as index rather than ehdr.e_shnum
  elfutils: check data_list.data.d.d_buf before free it

 meta/recipes-devtools/elfutils/elfutils_0.172.bb   |  1 +
 ...end.c-check-data_list.data.d.d_buf-before.patch | 39 ++++++++++++++++++++++
 ...01-src-dso.c-use-ehdr.e_shstrndx-as-index.patch | 39 ++++++++++++++++++++++
 meta/recipes-devtools/prelink/prelink_git.bb       |  4 ++-
 4 files changed, 82 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/elfutils/files/0001-libelf-elf_end.c-check-data_list.data.d.d_buf-before.patch
 create mode 100644 meta/recipes-devtools/prelink/prelink/0001-src-dso.c-use-ehdr.e_shstrndx-as-index.patch

-- 
2.7.4


