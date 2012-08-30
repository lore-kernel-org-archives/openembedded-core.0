Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1T6xUA-0002JM-P7
	for openembedded-core@lists.openembedded.org;
	Thu, 30 Aug 2012 07:40:10 +0200
Received: by pbcwy7 with SMTP id wy7so2566884pbc.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Aug 2012 22:27:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=2nEgkFrPMdRvnlbIHGlJh6xgRhnQ8IBxsq2T81l8nr0=;
	b=jUbuJ6dsi8jfQ70sV+qJ1xuHLsbzdZ0ul7MpqCZprmmXCESurgkRtXTBjLxzVkicDC
	5EDON3TFGhwiuPNV4T5+7Eq+u6xW0I8fYnGo840VRJR7Gvpgw1YphfSdYG828v4jaIQ+
	8/W00SfAn8NpNc3k2gFjGzmRDVacT830ByMk9p7cpwBKr/zDe89xmbrlDcIldGb923Fg
	iO6DY/vua2RMwGrrECmi6sukYGdtuBJ0qyaD0Rf1azboyhCtrtDGHeCU8g8jO6KR+jf4
	CTnlYH7vm0dVialWWZcCY6UlhtcQBtBZdrvJMJ4aqnzl3qDjhRMa89Mp0LHXbtZxrgIj
	vTdg==
Received: by 10.68.194.169 with SMTP id hx9mr9583054pbc.8.1346304474983;
	Wed, 29 Aug 2012 22:27:54 -0700 (PDT)
Received: from agate.agate.openembedded.org (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id uy3sm861562pbc.29.2012.08.29.22.27.52
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 29 Aug 2012 22:27:53 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 29 Aug 2012 22:27:08 -0700
Message-Id: <cover.1346304324.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH 0/3] uclibc and eglibc update
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
X-List-Received-Date: Thu, 30 Aug 2012 05:40:11 -0000


get some bugfixes for eglibc
Move uclibc git recipes to latest git
create patch for updating mount.h needed
for systemd to work

Fix elfutils build on uclibc

The following changes since commit 5bc4c0593997b046300a8f5b3f63c278aeb31d68:

  gail: remove (2012-08-29 14:14:13 -0700)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib kraj/misc-fixes
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=kraj/misc-fixes

Khem Raj (3):
  uclibc-git: Move to tip of master and sync mount.h
  eglibc: Bring in the fix for glibc bug #14459, #14195
  elfutils: Fix build on uclibc

 .../eglibc/eglibc-2.16/rpc-bootstrap.patch         |   63 ---------------
 meta/recipes-core/eglibc/eglibc_2.16.bb            |    3 +-
 meta/recipes-core/uclibc/uclibc-git.inc            |    5 +-
 .../uclibc/uclibc-git/mount.h-update.patch         |   83 ++++++++++++++++++++
 meta/recipes-core/uclibc/uclibc_git.bb             |    2 -
 meta/recipes-devtools/elfutils/elfutils_0.148.bb   |    8 +-
 6 files changed, 91 insertions(+), 73 deletions(-)
 delete mode 100644 meta/recipes-core/eglibc/eglibc-2.16/rpc-bootstrap.patch
 create mode 100644 meta/recipes-core/uclibc/uclibc-git/mount.h-update.patch

-- 
1.7.9.5



