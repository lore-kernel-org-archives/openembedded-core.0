Return-Path: <biannm@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id D951472425
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Dec 2014 05:48:19 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.04,848,1406563200"; d="scan'208";a="44649582"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 08 Dec 2014 13:45:00 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id sB85luoK013980;
	Mon, 8 Dec 2014 13:47:56 +0800
Received: from localhost.localdomain (10.167.226.31) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Mon, 8 Dec 2014 13:48:18 +0800
From: Bian Naimeng <biannm@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 8 Dec 2014 13:45:05 +0800
Message-ID: <1418017507-64551-1-git-send-email-biannm@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.167.226.31]
Cc: Sergey Poznyakoff <gray@gnu.org.ua>
Subject: [PATCH 0/2] cpio: backport patch of CVE-2014-9112
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
X-List-Received-Date: Mon, 08 Dec 2014 05:48:21 -0000
Content-Type: text/plain

cpio: Fix memory overrun on reading improperly created link records

Signed-off-by: Bian Naimeng <biannm@cn.fujitsu.com>

http://git.savannah.gnu.org/cgit/cpio.git/commit/?id=746f3ff670dcfcdd28fcc990e79cd6fccc7ae48d
  * src/copyin.c (get_link_name): New function.
  (list_file, copyin_link): use get_link_name

  * tests/symlink-bad-length.at: New file.
  * tests/symlink-long.at: New file.
  * tests/Makefile.am: Add new files.
  * tests/testsuite.at: Likewise.

  See http://lists.gnu.org/archive/html/bug-cpio/2014-11/msg00007.html

Upstream-Status: Backport
Signed-off-by: Sergey Poznyakoff <gray@gnu.org.ua>

Bian Naimeng (2):
  cpio: fix bug CVE-2014-9112 for cpio-2.8
  cpio: fix bug CVE-2014-9112 for cpio-2.11

 .../cpio/cpio-2.11/fix-memory-overrun.patch        | 220 +++++++++++++++++++++
 .../cpio/cpio-2.8/fix-memory-overrun.patch         | 217 ++++++++++++++++++++
 meta/recipes-extended/cpio/cpio_2.11.bb            |   3 +-
 meta/recipes-extended/cpio/cpio_2.8.bb             |   7 +-
 4 files changed, 443 insertions(+), 4 deletions(-)
 create mode 100644 meta/recipes-extended/cpio/cpio-2.11/fix-memory-overrun.patch
 create mode 100644 meta/recipes-extended/cpio/cpio-2.8/fix-memory-overrun.patch

-- 
1.9.1


