Received: from mail-fx0-f51.google.com ([209.85.161.51])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Qje3h-00049E-Rg
	for openembedded-core@lists.openembedded.org;
	Wed, 20 Jul 2011 23:12:01 +0200
Received: by fxh10 with SMTP id 10so2396413fxh.10
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jul 2011 14:06:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=yoR7u0lpsZDZI5nNcb5Gtj99w3Hji3fyl8G4uTJymY8=;
	b=ZXxlVuJqNl4J/IuxuftPTgglHUhGRpiGX/AlKZPK7qUkMA+55f498Kaug0Dr7j+bHr
	AdjzO19bgEKsUzL/z8oCRkO5lBAHFZRcr5tiYgbtefD3CDvacxVBdg/AskEzcnJfL8dF
	8uCWDEZgihRk+iVThvJx4cGA98Z++wZTr8EcM=
Received: by 10.204.46.198 with SMTP id k6mr2630095bkf.236.1311195983831;
	Wed, 20 Jul 2011 14:06:23 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id q1sm4072865faa.3.2011.07.20.14.06.22
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 20 Jul 2011 14:06:22 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Jul 2011 23:06:14 +0200
Message-Id: <cover.1311195893.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.6
Subject: [PATCH 00/10] Small fixes
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
X-List-Received-Date: Wed, 20 Jul 2011 21:12:01 -0000

Fixes for recipes using intltool, distributions not having locales support in libc and distutils fix

The following changes since commit 0d03800caffc2341b74190d38f7a372223c89f4c:

  lsbsetup_1.0.bb: Change the hardcoded /usr/lib to support multilib (2011-07-20 15:43:43 +0100)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib jansa/pull
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=jansa/pull

Martin Jansa (10):
  tcmode-default: set preferred version also for (e)glibc-locale
  eglibc-package: don't fail without localedef/gconv
  intltool: inherit perlnative
  polkit: inherit perlnative
  shared-mime-info: inherit perlnative
  xkeyboard-config: inherit perlnative
  avahi: inherit perlnative
  vte: inherit perlnative
  python: save Makefile.sysroot in do_compile
  python: add patch to fix cross compilation on host with linux-3.0

 meta/conf/distro/include/tcmode-default.inc        |    2 ++
 meta/recipes-connectivity/avahi/avahi.inc          |    2 +-
 meta/recipes-core/eglibc/eglibc-package.inc        |    8 ++++++--
 meta/recipes-devtools/intltool/intltool.inc        |    3 +--
 .../python/python/07-linux3-regen-fix.patch        |   18 ++++++++++++++++++
 meta/recipes-devtools/python/python_2.6.6.bb       |    8 +++++---
 meta/recipes-extended/polkit/polkit_0.101.bb       |    2 +-
 .../xorg-lib/xkeyboard-config_2.1.bb               |    2 +-
 .../shared-mime-info/shared-mime-info.inc          |    2 +-
 meta/recipes-support/vte/vte.inc                   |    2 +-
 10 files changed, 37 insertions(+), 12 deletions(-)
 create mode 100644 meta/recipes-devtools/python/python/07-linux3-regen-fix.patch

-- 
1.7.6



