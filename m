Received: from mail-pa0-f46.google.com ([209.85.220.46])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1UNuxX-0005w2-6u
	for openembedded-core@lists.openembedded.org;
	Fri, 05 Apr 2013 02:56:51 +0200
Received: by mail-pa0-f46.google.com with SMTP id lb1so1745333pab.33
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 Apr 2013 17:39:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=0NcYOPkFxH34zYcOq4HnYFGc6rp/SAKDvTcylqJDpqw=;
	b=W8IV6lyrviDYIp7bNPrgL26ohVZ7N5zY90HnO/pIISCN8Bds5tG8slQjTThS/pb5+i
	hzpmJuTkiu5uIippxQfRooGCt+IhMZiPvGphGG9KaSsco7wX6rMn48fmGsmuN5KZ8Ro9
	YjQdlgkYkkj0Hc3bctRY4KuvxaVqfnUhfO7VrHpuTCh8TRTll67BKcmXL/Mr1Ds40gts
	6em3H4XhgldyvYnjOPRj6QlB1t9+rBBdy1tBKfk96TIFa+BKzgyJ/n1FFVP+Lc1i0eVr
	JJe+Nv85OnCxGhswidL89IouYoowpwh+MkeB4u9iOteWXVbtjbMdYgFqNTgvzEBDsEDw
	Xsug==
X-Received: by 10.68.241.132 with SMTP id wi4mr11575636pbc.8.1365122376544;
	Thu, 04 Apr 2013 17:39:36 -0700 (PDT)
Received: from agate.agate.openembedded.org (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id 1sm12025656pba.32.2013.04.04.17.39.34
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 04 Apr 2013 17:39:34 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  4 Apr 2013 17:38:40 -0700
Message-Id: <cover.1365122145.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH 0/1] Fix coreutils build on uclibc
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 05 Apr 2013 00:56:52 -0000

coreutils after upgrade has started to fail to build on uclibc
targets, this series of patches fix the build on uclibc as well
as on eglibc is working normal.

The following changes since commit 2587a33134fde80dd1367629d9def45ac70256ee:

  site: add endianness information for libmemcached (2013-04-04 23:58:00 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib kraj/coreutils
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=kraj/coreutils

Khem Raj (1):
  coreutils: Fix build on uclibc after upgrade to 8.21

 ...d-ltr-and-lpthread-for-getting-spawn-func.patch |   15 ++++
 ...sys_time.in.h-Fix-use-of-restrict-keyword.patch |   51 +++++++++++++
 .../coreutils/coreutils-8.21/gcc-uclibc.patch      |   77 ++++++++++++++++++++
 meta/recipes-core/coreutils/coreutils_8.21.bb      |    5 +-
 4 files changed, 147 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-core/coreutils/coreutils-8.21/0001-local.mk-Add-ltr-and-lpthread-for-getting-spawn-func.patch
 create mode 100644 meta/recipes-core/coreutils/coreutils-8.21/0001-sys_time.in.h-Fix-use-of-restrict-keyword.patch
 create mode 100644 meta/recipes-core/coreutils/coreutils-8.21/gcc-uclibc.patch

-- 
1.7.9.5



