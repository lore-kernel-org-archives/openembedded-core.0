Received: from mail-qw0-f47.google.com ([209.85.216.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QtSJJ-0005V1-O0
	for openembedded-core@lists.openembedded.org;
	Wed, 17 Aug 2011 00:40:37 +0200
Received: by qwh5 with SMTP id 5so312429qwh.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Aug 2011 15:35:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=Qw4aatBtPep9zajTJhHdWga4LxF75BWBghMofz4ck+g=;
	b=rplvlVGKJcJ/XTKZJYlZdei+OBqSYeYH/0aWwpiJne6ksWFFaVgZXrIivpUArDceVh
	ifTMq8HPxYamxbQQShgi4IsIDeOcMvEDMdz+y7ghmFwA7cVUaQvSqBZRxQd+WpsgRp4R
	yU5EYhLX/CWOdhpirfucjdQf9+AjTQZuB2HKs=
Received: by 10.52.28.79 with SMTP id z15mr272217vdg.365.1313534158435;
	Tue, 16 Aug 2011 15:35:58 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id j8sm485777vdv.35.2011.08.16.15.35.57
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 16 Aug 2011 15:35:58 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 16 Aug 2011 15:35:42 -0700
Message-Id: <cover.1313533911.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.5.4
Subject: [PATCH 0/5] Redefine LINKER_HASH_STYLE and uclibc fixes
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 16 Aug 2011 22:40:37 -0000

with this patchset, fix the uclibc image fallouts with various recent
recipe updates

Modify the way we pass linker hash style so it can be used in multiple
methods.

Pass information about default linker hash style to gcc configure
so that it passes the right flags to runtime libraries builds e.g.
libgcc libstdc++ etc.

The following changes since commit 3e872751690135178afb3a3f147bd002112c1bac:

  tcf-agent: Add openssl to DEPENDS (2011-08-16 15:29:09 -0700)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib kraj/linker-hash-choice
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=kraj/linker-hash-choice

Khem Raj (5):
  conf,recipes: Redefine LINKER_HASH_STYLE
  gcc-4.6: Use --with-linker-hash-style configure option
  task-core-tools: Use LTTNGUST variable instead of hardcoding
    lttng-ust
  gdb: Add lttng-ust to DEPENDS only for eglibc
  tcf-agent: Add openssl to DEPENDS

 meta/conf/bitbake.conf                           |    4 ++--
 meta/conf/distro/include/tcmode-default.inc      |    6 +++++-
 meta/recipes-core/tasks/task-core-tools.bb       |    6 +++---
 meta/recipes-core/uclibc/uclibc.inc              |    2 +-
 meta/recipes-devtools/gcc/gcc-4.6.inc            |    3 ++-
 meta/recipes-devtools/gdb/gdb-common.inc         |   11 +++++++++--
 meta/recipes-devtools/tcf-agent/tcf-agent_svn.bb |    4 ++--
 7 files changed, 24 insertions(+), 12 deletions(-)

-- 
1.7.5.4



