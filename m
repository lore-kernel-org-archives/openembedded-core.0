Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1REMZ0-0001IZ-Hb
	for openembedded-core@lists.openembedded.org;
	Thu, 13 Oct 2011 16:47:14 +0200
Received: by ggnq1 with SMTP id q1so82708ggn.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Oct 2011 07:41:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer;
	bh=3HxJerPkuZmpi2Ze0C1LXh1jM1UI3FxLS8C5URZEAmo=;
	b=Aw4VV3MywoXfG/XQS6ECUjSUPf3NRuPG3Drpk/h4VmL4bmPV1om1qB7SIsGKYCaCx1
	Cs3papSlwBFZRpbzx0mIwGRtwuKGbBiAh5oXaD2jkGIHYzQPMtKXAcyqHevC5G2fAzkr
	zbYx3QEpzOY6gD9ThEtIWTQgTTf7HfRJ17JF4=
Received: by 10.150.163.6 with SMTP id l6mr4804719ybe.40.1318516890250;
	Thu, 13 Oct 2011 07:41:30 -0700 (PDT)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id v20sm122509anv.17.2011.10.13.07.41.27
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 13 Oct 2011 07:41:29 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Thu, 13 Oct 2011 14:41:15 +0000
Message-Id: <cover.1318516840.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
Subject: [PATCH 0/4] Qt4 and image building improvements
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
X-List-Received-Date: Thu, 13 Oct 2011 14:47:14 -0000

The following changes since commit 5ad1ca59dea6d5045f252ed7b786ad193faced64:

  xf86-video-intel: Update 2.15.0 -> 2.16.0 (2011-10-12 22:59:14 +0100)

are available in the git repository at:
  git://github.com/OSSystems/oe-core master
  https://github.com/OSSystems/oe-core/tree/HEAD

Otavio Salvador (4):
  image-live.bbclass: allow override of initrd image
  initramfs-live-boot: make it more generic and easy to use
  qt4: use 4.7.4 as default preference
  distro_tracking_fields.inc: update qt4 related entries

 meta/classes/image-live.bbclass                    |    5 ++-
 .../conf/distro/include/distro_tracking_fields.inc |   32 ++++++++++----------
 meta/recipes-core/initrdscripts/files/init-live.sh |   32 ++++++++++++-------
 .../initrdscripts/initramfs-live-boot_1.0.bb       |    3 +-
 meta/recipes-qt/qt4/qt4-embedded_4.7.4.bb          |    1 -
 meta/recipes-qt/qt4/qt4-native_4.7.4.bb            |    1 -
 meta/recipes-qt/qt4/qt4-tools-nativesdk_4.7.4.bb   |    2 -
 meta/recipes-qt/qt4/qt4-x11-free_4.7.4.bb          |    2 -
 8 files changed, 41 insertions(+), 37 deletions(-)

-- 
1.7.2.5



