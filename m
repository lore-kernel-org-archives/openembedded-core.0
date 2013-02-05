Received: from mail-bk0-f43.google.com ([209.85.214.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rep.dot.nop@gmail.com>) id 1U2l7e-0003zq-Tp
	for openembedded-core@lists.openembedded.org;
	Tue, 05 Feb 2013 17:11:51 +0100
Received: by mail-bk0-f43.google.com with SMTP id jm19so154242bkc.16
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Feb 2013 07:56:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=FVtK9yHXuajHIrpgWzKoAFnGx2zieLEAGEGQwCnsfEI=;
	b=Qe2KX1DBzap27pdLc8rGruwsZGIjyEL6B8zrIttqTFBB38PqWFs0BX+dkDlq1Nn0u0
	7Ce74OP1pC3QDBEyLljjNeI++79sD03G4IW2gUUr2R95f+Qi7iXQiHbENYpBb8ue4b0i
	XZB2WsvVm+k+ren1nXBPu5S8AGx9QfJtf0u/aZM79jfzTBNxbKKlBOAARGbn0Y80LKoc
	0joWtP18k6XniYGRi3FSd88gOBKssJiI/N4pmbJo8fOxPZ5agx22/yJ8s0kYwtSAqUUW
	JYoXOjmNqW+R+81ydoHAucZ0qk5AX1PSx/EePg7Pe5Il9ZvbU5ybgDoPGWiIG+/XfIie
	OmdQ==
X-Received: by 10.204.149.81 with SMTP id s17mr6627080bkv.117.1360079761349;
	Tue, 05 Feb 2013 07:56:01 -0800 (PST)
Received: from s42.loc (91-119-139-175.dynamic.xdsl-line.inode.at.
	[91.119.139.175])
	by mx.google.com with ESMTPS id k4sm6742718bkv.18.2013.02.05.07.55.58
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Tue, 05 Feb 2013 07:55:59 -0800 (PST)
Received: from cow by s42.loc with local (Exim 4.80)
	(envelope-from <rep.dot.nop@gmail.com>)
	id 1U2ksG-0004XD-CI; Tue, 05 Feb 2013 16:55:56 +0100
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 Feb 2013 16:55:40 +0100
Message-Id: <cover.1360079373.git.rep.dot.nop@gmail.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH 0/8] misc tweaks
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
X-List-Received-Date: Tue, 05 Feb 2013 16:12:00 -0000

some hunks for busybox and uclibc.
Build-tested qemu{arm,mips,i386,x86_64,ppc} micro-image.

The following changes since commit 3b1beb8b15b8e3e397b3aa8320490103d4f29bac:

  dropbear: fix RPROVIDES (2013-02-04 23:19:55 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib aldot/fixes
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=aldot/fixes

Bernhard Reutner-Fischer (8):
  base.bbclass: Commentary typo fix
  uclibc: add c6x arch
  uclibc: turn on kernel module support
  Revert "Add ptest for glib."
  busybox: add ifup's ifstate dir to package
  busybox: update-modules script needs id(1)
  base.bbclass: remove redundant setting of MAKE
  create-pull-request: Error message on missing -u

 meta/classes/base.bbclass                          |    3 +-
 meta/recipes-core/busybox/busybox.inc              |    5 ++
 meta/recipes-core/busybox/busybox_1.20.2.bb        |    2 +-
 .../glib-2.0/glib-2.0/Makefile-ptest.patch         |   61 --------------------
 meta/recipes-core/glib-2.0/glib-2.0/run-ptest      |    3 -
 meta/recipes-core/glib-2.0/glib-2.0_2.34.3.bb      |   22 -------
 meta/recipes-core/uclibc/uclibc-config.inc         |    1 +
 meta/recipes-core/uclibc/uclibc-git/uClibc.distro  |    2 +
 scripts/create-pull-request                        |    5 +-
 9 files changed, 13 insertions(+), 91 deletions(-)
 delete mode 100644 meta/recipes-core/glib-2.0/glib-2.0/Makefile-ptest.patch
 delete mode 100644 meta/recipes-core/glib-2.0/glib-2.0/run-ptest

-- 
1.7.10.4



