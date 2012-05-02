Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <darren@apps.dvhart.com>) id 1SPR6t-00073Z-Iz
	for openembedded-core@lists.openembedded.org;
	Wed, 02 May 2012 06:24:15 +0200
Received: by ghbz2 with SMTP id z2so231951ghb.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 01 May 2012 21:14:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=sender:from:to:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=GIcth31dHJDFtryqe5kfYKA4nmdu2AmDJRM/eYrunEE=;
	b=JnpbhGltzq5A/p1ATOJcdyHlZM2z7hxARrIYblTjOyjnq3iLMK8Vf1yujCMTngDrPi
	0S6BERE+jy2J/zIBs++ECIeen8s46ZyrTLFKAKrgXVZyoK8hh5Kkv6pcTfP/Tpb85CO0
	z3OCFyKeWM8xng0XkZiQiukjDflcTx+UWA9mBPRWixO92SEInhpP2lHAr3rR36BrZAVH
	kqu3pyphbtIj4boQazOkLdrkDguhUG00r4VzQR/oePVD10j44BlhW+R/xh4hqCC6Y7zV
	2JyMNPN4WL6sX7v9azqMHEcWSmgPP+INvYpP3TVQHIbm0ofcvN+tzQMcLUy83bZTzR7A
	e1Bg==
Received: by 10.68.221.39 with SMTP id qb7mr13806733pbc.120.1335932070821;
	Tue, 01 May 2012 21:14:30 -0700 (PDT)
Received: from localhost (static-50-53-99-101.bvtn.or.frontiernet.net.
	[50.53.99.101])
	by mx.google.com with ESMTPS id q5sm771627pbp.28.2012.05.01.21.14.28
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 01 May 2012 21:14:28 -0700 (PDT)
Sender: Darren Hart <darren@apps.dvhart.com>
From: Darren Hart <dvhart@linux.intel.com>
To: openembedded-core@lists.openembedded.org,
	scott.a.garman@intel.com
Date: Tue,  1 May 2012 21:14:17 -0700
Message-Id: <cover.1335931960.git.dvhart@linux.intel.com>
X-Mailer: git-send-email 1.7.5.4
X-Gm-Message-State: ALoCoQks7qS4h4REpvSJP9UWK/rgEr8KXykaF1LewbMHL24ulpUqs5X4MjV9HwRPrO2dDRes3eON
Subject: [PATCH 0/1][1.2.1] initrdscripts: Update install.sh to work with mmc devices
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
X-List-Received-Date: Wed, 02 May 2012 04:24:15 -0000

The following changes since commit 35b5fb2dd2131d4c7dc6635c14c6e08ea6926457:

  eglibc-package: remove /var (2012-05-01 12:36:18 +0100)

are available in the git repository at:
  git://git.yoctoproject.org/user-contrib/dvhart/oe-core installer
  http://git.yoctoproject.org/cgit.cgi/user-contrib/dvhart/oe-core/log/?h=installer

Darren Hart (1):
  [1.2.1] initrdscripts: Update install.sh to work with mmc devices

 .../initrdscripts/files/init-install.sh            |   45 ++++++++++---------
 .../initrdscripts/initramfs-live-install_1.0.bb    |    2 +-
 2 files changed, 25 insertions(+), 22 deletions(-)

-- 
1.7.5.4



