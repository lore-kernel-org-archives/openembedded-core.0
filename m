Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RXxf4-0004iL-T1
	for openembedded-core@lists.openembedded.org;
	Tue, 06 Dec 2011 17:14:31 +0100
Received: by ggnh1 with SMTP id h1so6444446ggn.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 06 Dec 2011 08:07:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer;
	bh=cxSkwaP44M/XHfNJ7nEBxxxnAw87a0b3/B7C4gHXpZA=;
	b=B9LoDOoWzN71LcmqWk3d4fnijDwG+AY/1wpJ2Dq0UtrTCrDnYDvV/MbXz/WxSbIrRr
	fqtQmey3zCGEuVHJYxqQbBTdVgL5I66aEe3edfUfu8j/dN7bnv9eeWDZXJu6kjpUBBlM
	vhubhFMu0uc06hZKRRh8TiuO9Fuz4qrH1YjP4=
Received: by 10.236.176.3 with SMTP id a3mr9022189yhm.111.1323187662431;
	Tue, 06 Dec 2011 08:07:42 -0800 (PST)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id l27sm62085463ani.21.2011.12.06.08.07.40
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 06 Dec 2011 08:07:41 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Tue,  6 Dec 2011 16:07:26 +0000
Message-Id: <cover.1323187516.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
Subject: [PATCH 0/5] Provides a framework and initial modules for initramfs
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
X-List-Received-Date: Tue, 06 Dec 2011 16:14:31 -0000

This patchset adds a very flexible and powerful initramfs framework
together with a small set of modules using it. Please refer to each
commit for the respective documentation.

The following changes since commit fb642d21111691b9302e16e984aff9d8fb18c431:

  buildhistory bbclass: avoid absolute paths for files-in-image.txt to avoid diff churn when relocating TMPDIR (2011-12-06 14:40:00 +0000)

are available in the git repository at:
  git://github.com/OSSystems/oe-core master
  https://github.com/OSSystems/oe-core/tree/HEAD

Otavio Salvador (5):
  initramfs-base: provides the base for a modular initramfs
  initramfs-module-debug: add
  initramfs-module-mdev: add
  initramfs-module-e2fs: add
  initramfs-module-udev: add

 .../initrdscripts/initramfs-base/finish            |   42 ++++++
 .../recipes-core/initrdscripts/initramfs-base/init |  136 ++++++++++++++++++++
 .../initrdscripts/initramfs-base_1.0.bb            |   17 +++
 .../initrdscripts/initramfs-module-debug/debug     |   82 ++++++++++++
 .../initrdscripts/initramfs-module-debug_1.0.bb    |   15 ++
 .../initrdscripts/initramfs-module-e2fs/e2fs       |   28 ++++
 .../initrdscripts/initramfs-module-e2fs_1.0.bb     |   15 ++
 .../initrdscripts/initramfs-module-mdev/mdev       |   30 +++++
 .../initrdscripts/initramfs-module-mdev_1.0.bb     |   16 +++
 .../initrdscripts/initramfs-module-udev/udev       |   22 +++
 .../initrdscripts/initramfs-module-udev_1.0.bb     |   16 +++
 11 files changed, 419 insertions(+), 0 deletions(-)
 create mode 100755 meta/recipes-core/initrdscripts/initramfs-base/finish
 create mode 100755 meta/recipes-core/initrdscripts/initramfs-base/init
 create mode 100644 meta/recipes-core/initrdscripts/initramfs-base_1.0.bb
 create mode 100644 meta/recipes-core/initrdscripts/initramfs-module-debug/debug
 create mode 100644 meta/recipes-core/initrdscripts/initramfs-module-debug_1.0.bb
 create mode 100755 meta/recipes-core/initrdscripts/initramfs-module-e2fs/e2fs
 create mode 100644 meta/recipes-core/initrdscripts/initramfs-module-e2fs_1.0.bb
 create mode 100644 meta/recipes-core/initrdscripts/initramfs-module-mdev/mdev
 create mode 100644 meta/recipes-core/initrdscripts/initramfs-module-mdev_1.0.bb
 create mode 100644 meta/recipes-core/initrdscripts/initramfs-module-udev/udev
 create mode 100644 meta/recipes-core/initrdscripts/initramfs-module-udev_1.0.bb

-- 
1.7.2.5



