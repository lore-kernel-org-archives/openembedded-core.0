Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1R4Cwc-0006to-8H
	for openembedded-core@lists.openembedded.org;
	Thu, 15 Sep 2011 16:29:38 +0200
Received: by bke11 with SMTP id 11so2490803bke.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Sep 2011 07:24:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=cO4ODJy06HrYkf/9//L/3AOMkxVeVyrcXjNSPAV6zXw=;
	b=T4vN7JOH3RxdhUC7qlKfLuC4kx63wj/6s/vTs76h+9oBJRCnuHv8VQxi1LjR5Gx41g
	Tgc4AHOfRrX7wbbcweriD8xNJ8NmHTdeiJkuYtVGQ5roVow6DtKlK+/Usdc42tyEC2wo
	m8x7EEFcutWgZXAUkjoInBPHJ1v9XSCKJcQFc=
Received: by 10.204.132.79 with SMTP id a15mr777037bkt.329.1316096666657;
	Thu, 15 Sep 2011 07:24:26 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id y8sm3590685bkb.4.2011.09.15.07.24.24
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 15 Sep 2011 07:24:25 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 15 Sep 2011 16:24:16 +0200
Message-Id: <cover.1316096375.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.6.1
Subject: [PATCH 0/5] Small fixes
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
X-List-Received-Date: Thu, 15 Sep 2011 14:29:38 -0000

The following changes since commit e876a44fa8ed0aa2e09084c1e7ddfc876c3f981b:

  cml1/kernel: Update do_menuconfig to use oe.terminal() (2011-09-15 11:22:39 +0100)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib jansa/pull
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=jansa/pull

Martin Jansa (5):
  openssh: update init script to create ECDSA keys if needed
  task-core-boot: allow distributions to define login and init manager
  subversion: remove neon-detection.patch and --with-neon option
  abiword: be carefull with # comments ending with backslash
  claws-mail: be carefull with # comments ending with backslash

 .../recipes-gnome/abiword/abiword-2.5.inc          |    5 +++--
 meta-demoapps/recipes-gnome/abiword/abiword.inc    |    3 ++-
 .../recipes-sato/claws-mail/claws-mail.inc         |    5 +++--
 .../openssh/openssh-5.8p2/init                     |    4 ++++
 meta/recipes-connectivity/openssh/openssh_5.8p2.bb |    2 +-
 meta/recipes-core/tasks/task-core-boot.bb          |    8 ++++++--
 .../subversion/subversion/neon-detection.patch     |   15 ---------------
 .../subversion/subversion_1.6.15.bb                |    5 ++---
 8 files changed, 21 insertions(+), 26 deletions(-)
 delete mode 100644 meta/recipes-devtools/subversion/subversion/neon-detection.patch

-- 
1.7.6.1



