Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 67CAE79238
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Aug 2018 06:03:40 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w7G63fGe008112
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Aug 2018 23:03:41 -0700 (PDT)
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.399.0; Wed, 15 Aug 2018 23:03:39 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 16 Aug 2018 14:14:14 +0800
Message-ID: <cover.1534399650.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH 0/1] binutils: backport a patch to fix file matching problem
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
X-List-Received-Date: Thu, 16 Aug 2018 06:03:40 -0000
Content-Type: text/plain

Fixed accidental build failures when /tmp/ and build dir are on different
filesystems:

Assembler messages:
Fatal error: The input and output files must be distinct

// Robert

The following changes since commit 125789b6ee6d47ab84192230f63971c4e22418ba:

  cve-check.bbclass: do not download the CVE DB in package-specific tasks (2018-08-15 21:45:10 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/binutils
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=rbt/binutils

Robert Yang (1):
  binutils: Improve check for input file matching output file

 meta/recipes-devtools/binutils/binutils-2.31.inc   |  1 +
 ...check-for-input-file-matching-output-file.patch | 59 ++++++++++++++++++++++
 2 files changed, 60 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/0017-improve-check-for-input-file-matching-output-file.patch

-- 
2.7.4


