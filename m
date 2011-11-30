Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RVtBj-00031I-Ax
	for openembedded-core@lists.openembedded.org;
	Thu, 01 Dec 2011 00:03:39 +0100
Received: by bkbzv15 with SMTP id zv15so839230bkb.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Nov 2011 14:56:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=M7yjR6Sqjy+EegFcRcFYz4DWQNByeGPAw0hJmy7mTuo=;
	b=mvg2gCQQbAh7r1JkOpnmGvH+klpjM8LYVoOludq9SeopHRAs5tvBK65EqKwKKo6qxk
	ZMJk/oIwt5J6tFfg8/t4owhToJLHmoM03cVAfn7NTnIkW1bVsGqgYmjGAm8j0/0kDe1v
	RXm7sga6ImgETc1YemWROqQpSkBVByAKHdlxg=
Received: by 10.204.152.25 with SMTP id e25mr4587047bkw.51.1322693818471;
	Wed, 30 Nov 2011 14:56:58 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id e18sm7113075bkr.15.2011.11.30.14.56.56
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 30 Nov 2011 14:56:57 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 30 Nov 2011 23:56:50 +0100
Message-Id: <cover.1322693708.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.rc4
Subject: [PATCH][oe-core 0/3] Small fixes sysstat, squashfs-tools, gconf
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
X-List-Received-Date: Wed, 30 Nov 2011 23:03:39 -0000

The following changes since commit 36654d6d393cb8c8a545835184a96be4ae0c885d:

  grub: Use COMPATIBLE_HOST (2011-11-30 22:21:53 +0000)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib jansa/pull
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=jansa/pull

Martin Jansa (3):
  sysstat: don't run populate-volatile.sh update in do_rootfs or
    without populate-volatile.sh
  squashfs-tools: fix PR, those should start with 'r'
  gconf: add polkit to DEPENDS only for target recipe and disable
    default-service for native

 .../squashfs-tools/squashfs-tools_4.2.bb           |    2 +-
 meta/recipes-extended/sysstat/sysstat.inc          |    6 +++++-
 meta/recipes-extended/sysstat/sysstat_10.0.2.bb    |    2 +-
 meta/recipes-gnome/gnome/gconf_3.2.3.bb            |   10 +++++++---
 4 files changed, 14 insertions(+), 6 deletions(-)

-- 
1.7.8.rc4



