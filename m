Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SPmzS-0000nq-Gk
	for openembedded-core@lists.openembedded.org;
	Thu, 03 May 2012 05:46:02 +0200
Received: by pbbrq2 with SMTP id rq2so1652799pbb.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 May 2012 20:36:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=ipk2BdT9XH9FURlUbQ3mlZ4z80XIs62SjtMt6wj0D4w=;
	b=JOdQpwXm3XX8mh/pW50zFRM8otKKi25yOQQuZ3HCfbzavbI9aboOJYE1ysqrqf58Je
	PSlEsW+b28ptD7AjxnF67rlxQw+v6Fb8r44tqE4DQvuC2mmOJ0L5ViNhycd1BORtK1il
	Kp5yHvtT/tKnfbnyCgzO77ra0SeW7T3C+oqPojdrFclVGjUYaSPuqPG4HjGQuoI07sHL
	SqKQz8jS6pSI0P6eSFkttGP9QeThXFAWyH2brTRockJiQUDC4kf8xYpNDPxYO5XSRbAn
	iCEq4zGzOmkuubDsbLLBuc/9cs4n2xmFN7BJM+t3nekVx8Ke6Yvs+SKVg+0hJyebsQzI
	LNiA==
Received: by 10.68.218.228 with SMTP id pj4mr2151551pbc.167.1336016176438;
	Wed, 02 May 2012 20:36:16 -0700 (PDT)
Received: from localhost.localdomain (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id qa9sm3883045pbb.26.2012.05.02.20.36.14
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 02 May 2012 20:36:15 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  2 May 2012 20:35:21 -0700
Message-Id: <cover.1336015963.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.5.4
Subject: [PATCH 0/3] Enable xserver-xorg for all qemumachines
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
X-List-Received-Date: Thu, 03 May 2012 03:46:02 -0000

Currently we use kdrive for all qemu machines except x86 and x86_64
this patchset enables it for other qemu machines too

I did not delete the kdrive recipes intentionally since I saw that
there were some images which were using kdrive as xserver

I have successfully sato image in qemumips qemuarm and qemuppc

The following changes since commit 35b5fb2dd2131d4c7dc6635c14c6e08ea6926457:

  eglibc-package: remove /var (2012-05-01 12:36:18 +0100)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib kraj/qemu-xserver-xorg
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=kraj/qemu-xserver-xorg

Khem Raj (3):
  qemumachines: Enable xserver-xorg as default xserver
  xserver-xf86-config: Add xorg.conf for arm,mips,ppc,sh qemu machines
  qemux86-64,qemux86: Override XSERVER variable

 meta/conf/machine/include/qemu.inc                 |    9 ++-
 meta/conf/machine/qemux86-64.conf                  |    2 +-
 meta/conf/machine/qemux86.conf                     |    2 +-
 .../xserver-xf86-config/qemuarm/xorg.conf          |   69 ++++++++++++++++++++
 .../xserver-xf86-config/qemumips/xorg.conf         |   69 ++++++++++++++++++++
 .../xserver-xf86-config/qemumips64/xorg.conf       |   69 ++++++++++++++++++++
 .../xserver-xf86-config/qemuppc/xorg.conf          |   69 ++++++++++++++++++++
 .../xserver-xf86-config/qemush4/xorg.conf          |   69 ++++++++++++++++++++
 .../xorg-xserver/xserver-xf86-config_0.1.bb        |    2 +-
 9 files changed, 356 insertions(+), 4 deletions(-)
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xf86-config/qemuarm/xorg.conf
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xf86-config/qemumips/xorg.conf
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xf86-config/qemumips64/xorg.conf
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xf86-config/qemuppc/xorg.conf
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xf86-config/qemush4/xorg.conf

-- 
1.7.5.4



