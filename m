Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 398F065C98
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jul 2015 06:19:01 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t6E6J25e007951
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jul 2015 23:19:02 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.3.235.1; Mon, 13 Jul 2015 23:19:01 -0700
From: Kai Kang <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 14 Jul 2015 14:17:33 +0800
Message-ID: <cover.1436854516.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [128.224.153.152]
Subject: [PATCH 0/1] Fix failures of bash QA buildpaths check
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
X-List-Received-Date: Tue, 14 Jul 2015 06:19:06 -0000
Content-Type: text/plain

The following changes since commit 190ec1145dd1963cbe562bb250343b8d3acc1f40:

  opkg-utils: Change alternatives lib path from /usr/lib/opkg to /var/lib/opkg (2015-07-12 22:55:55 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib kangkai/bash
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=kangkai/bash

Kai Kang (1):
  bash: fix for QA buildpaths check

 meta/recipes-extended/bash/bash-3.2.48/run-ptest | 2 --
 meta/recipes-extended/bash/bash.inc              | 8 ++------
 meta/recipes-extended/bash/bash/run-ptest        | 5 ++++-
 meta/recipes-extended/bash/bash_3.2.48.bb        | 6 ++++++
 4 files changed, 12 insertions(+), 9 deletions(-)
 delete mode 100644 meta/recipes-extended/bash/bash-3.2.48/run-ptest

-- 
1.9.1


