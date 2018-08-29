Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 74EB57918C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Aug 2018 10:00:54 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w7TA0tMu011408
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Aug 2018 03:00:55 -0700
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.408.0; Wed, 29 Aug 2018 03:00:54 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 29 Aug 2018 18:11:39 +0800
Message-ID: <cover.1535537452.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH 0/1] elfutils: Fix prelink libqb error on mips and mips64
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
X-List-Received-Date: Wed, 29 Aug 2018 10:00:54 -0000
Content-Type: text/plain

The following changes since commit 853e0499be449c71378c087e08b1926be8e2ac87:

  ruby: improve reproducibility (2018-08-29 10:40:08 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/elfutils
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=rbt/elfutils

Robert Yang (1):
  elfutils: Fix prelink libqb error on mips and mips64

 ...lf_end.c-check-data_list.data.d.d_buf-before.patch | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

-- 
2.7.4


