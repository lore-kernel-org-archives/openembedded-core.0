Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 316F2739C8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Mar 2015 09:23:13 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id t2A9NEOl014245
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Mar 2015 02:23:15 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 10 Mar 2015 02:23:14 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 10 Mar 2015 02:23:12 -0700
Message-ID: <cover.1425979323.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 0/2] disable parallel build for mtd-utils and blktrace
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
X-List-Received-Date: Tue, 10 Mar 2015 09:23:15 -0000
Content-Type: text/plain

The following changes since commit 0542472969d0eb28fd44da97e4e01d69d864d157:

  scripts/runqemu: clarify help text (2015-03-05 17:47:10 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/parallel
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/parallel

Robert Yang (2):
  mtd-utils: disable parallel build
  Revert "blktrace: fix and enable parallel build"

 meta/recipes-devtools/mtd/mtd-utils_git.bb         |    4 ++
 .../blktrace/blktrace/makefile-fix-parallel.patch  |   41 --------------------
 meta/recipes-kernel/blktrace/blktrace_git.bb       |   17 ++++++--
 3 files changed, 18 insertions(+), 44 deletions(-)
 delete mode 100644 meta/recipes-kernel/blktrace/blktrace/makefile-fix-parallel.patch

-- 
1.7.9.5


