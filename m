Received: from mail-px0-f172.google.com ([209.85.212.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QGIM1-00024X-QH
	for openembedded-core@lists.openembedded.org;
	Sun, 01 May 2011 00:09:34 +0200
Received: by pxi6 with SMTP id 6so1467115pxi.3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 30 Apr 2011 15:06:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer;
	bh=TuVhWkf3phjWpE//3PJr5S7wFFiqzKn539dsILDqZzk=;
	b=xnhMqQy57CJFyMtvmWiBYzPY4nmIpQ1fuEltvNztohd164uev7XUcjoXrj+V1Q0wHg
	VmUYxBe0MjWnjfu/I+8G3e7OKzVDJ6Bv3Ky3eIZaE10hp21W5+nEYTlCP9mN33+xfSHY
	65cVa1r2UJXz7rbXpW0hzs4yJ9gqGSF1mXjYE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=YLWHiiS2QNjy4LhaH5HMM1dkaI1ZjIErpPkHnB7/crHXFSla4LRH2vxgnZbmKwvkE/
	xi0PQ7Pf2mXRG7TClwLHr9s0hEzoHCItV6KK9Owf34g6+wi/64FvWvP4zvtWzAvDwNgr
	SYM3bA5DnArpDMC0eJZ1L0HOM/RMBqvuupvIo=
Received: by 10.68.8.225 with SMTP id u1mr4384889pba.409.1304201216891;
	Sat, 30 Apr 2011 15:06:56 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id t6sm2790211pbc.21.2011.04.30.15.06.54
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 30 Apr 2011 15:06:55 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: OE core <openembedded-core@lists.openembedded.org>
Date: Sat, 30 Apr 2011 15:06:46 -0700
Message-Id: <cover.1304200899.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
Subject: [PATCH V3 0/4] uclibc support in oe-core v3
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
X-List-Received-Date: Sat, 30 Apr 2011 22:09:34 -0000

This patchset works well with both uclibc and eglibc
For uclibc one would need meta-openembedded layer for now
I have included the feedback on v2

Additionally inherit gettext for libx11 recipes

alsa-utils needs to fix exp10 references for uclibc

Pull URL: git://git.openembedded.org/openembedded-core-contrib
  Branch: kraj/uclibc
  Browse: http://git.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=kraj/uclibc

Thanks,
    Khem Raj <raj.khem@gmail.com>
---


Khem Raj (4):
  gettext.bbclass: Use _append instead of =+
  insane.bbclass: Checking for NLS too when checking gettext dependency
  libx11: Use inherit gettext
  alsa-utils_1.0.24.2.bb: Fix build for uclibc targets

 meta/classes/gettext.bbclass                       |   30 ++++++++++++++-----
 meta/classes/insane.bbclass                        |    9 +++--
 meta/recipes-graphics/xorg-lib/libx11_1.3.4.bb     |    3 +-
 meta/recipes-graphics/xorg-lib/libx11_git.bb       |    6 ++-
 .../uclibc-exp10-replacement.patch                 |   21 ++++++++++++++
 .../recipes-multimedia/alsa/alsa-utils_1.0.24.2.bb |    4 ++-
 6 files changed, 57 insertions(+), 16 deletions(-)
 create mode 100644 meta/recipes-multimedia/alsa/alsa-utils-1.0.24.2/uclibc-exp10-replacement.patch

-- 
1.7.4.1



