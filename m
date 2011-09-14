Received: from mail-gx0-f178.google.com ([209.85.161.178])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1R3pPa-0000H9-I6
	for openembedded-core@lists.openembedded.org;
	Wed, 14 Sep 2011 15:21:58 +0200
Received: by gxk21 with SMTP id 21so143165gxk.9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Sep 2011 06:16:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer;
	bh=LzQO4fNRJztkxPzSkBap/039frkuracZyiPsBosXbkM=;
	b=YN3tT+fXx7VcnmH7KA/xgAvKYqAIbc3txMCEFrzBIO3X8bwiI7CtCJ0sD/pJkgP27u
	HuhSptiyYRsHhFKyoHcoAHwdPsTwd7XATtZ7f3kdtBKwyWWmzy3p55VADaw3MZt/j6G9
	7y2ckkDCVc2CX23sb6mKgq7caIvw/RBy8hXjs=
Received: by 10.150.166.11 with SMTP id o11mr2740035ybe.112.1316006204561;
	Wed, 14 Sep 2011 06:16:44 -0700 (PDT)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id n2sm784948ybh.25.2011.09.14.06.16.42
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 14 Sep 2011 06:16:43 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Wed, 14 Sep 2011 13:16:30 +0000
Message-Id: <cover.1316006156.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
Subject: [PATCH 0/3] Small fixes for xserver-xf86 inc files
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
X-List-Received-Date: Wed, 14 Sep 2011 13:21:58 -0000

The following changes since commit 8df322abfd3fa8c460fd73c83c1ef0b5e419dc11:

  core-image-minimal: Add missing POKY_EXTRA_IMAGE variable (2011-09-14 01:27:08 +0100)

are available in the git repository at:
  git://github.com/OSSystems/oe-core master
  https://github.com/OSSystems/oe-core/tree/master

Otavio Salvador (3):
  xserver-xf86-common.inc: use ${datadir} instead of /usr/share
  xserver-xf86-dri-lite.inc: use ${datadir} instead of /usr/share
  xserver-xf86-lite.inc: use ${datadir} instead of /usr/share

 .../xorg-xserver/xserver-xf86-common.inc           |    2 +-
 .../xorg-xserver/xserver-xf86-dri-lite.inc         |    2 +-
 .../xorg-xserver/xserver-xf86-lite.inc             |    2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

-- 
1.7.2.5



