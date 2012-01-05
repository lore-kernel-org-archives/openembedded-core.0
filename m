Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RitFt-00086v-KZ
	for openembedded-core@lists.openembedded.org;
	Thu, 05 Jan 2012 20:45:41 +0100
Received: by yenm12 with SMTP id m12so373860yen.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Jan 2012 11:38:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer;
	bh=qtvN731uIwjdPKpYy31dljRJ6ESaLEjtMZBRyzBdhp4=;
	b=nTv3sEa4cPFNBJAn3v2YXNIQvR/EGV9K1cFQAcX4XF1RaKm+E45bPbsI3P8MEDKLlI
	1L0TEw3sPQEnmmm+LzcyNYm2feVv73LjtD7XJY/D+tOT7gJCikfbDckacrDMtDklhPY7
	nLJ6z2jPXj/kuhJSldeb5mZlQXRRv0H1eWBkw=
Received: by 10.236.154.3 with SMTP id g3mr3844719yhk.119.1325792298159;
	Thu, 05 Jan 2012 11:38:18 -0800 (PST)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id n5sm83398402yhk.1.2012.01.05.11.38.12
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 05 Jan 2012 11:38:13 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Jan 2012 19:37:50 +0000
Message-Id: <cover.1325792209.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
Subject: [PATCH 00/10] Pending patches from O.S. Systems tree
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
X-List-Received-Date: Thu, 05 Jan 2012 19:45:41 -0000

The following changes since commit 563828bad19a242bba9ce3db461bb5807037dfdf:

  multilib: Abstract class extension code into classextend.py (2012-01-05 12:36:08 +0000)

are available in the git repository at:
  git://github.com/OSSystems/oe-core master
  https://github.com/OSSystems/oe-core/tree/HEAD

Otavio Salvador (10):
  qt4-graphics-system: add
  qt4e.bbclass: add QT_BASE_NAME for use in recipes
  qt4x11.bbclass: add QT_BASE_NAME for use in recipes
  qt4-embedded.inc: use QT_BASE_NAME from qt4e.bbclass
  qt4-x11-free.inc: use QT_BASE_NAME from qt4x11.bbclass
  initscripts: avoid mounting /sys if it is already mounted
  busybox: disable syslogd configuration file support
  udev: ensure /dev/pts and /dev/shm does exists
  udev: improve udev-cache robustness
  udev: drop depmod handling code as it ought to be done in kernel
    postinst

 meta/classes/qt4e.bbclass                          |    1 +
 meta/classes/qt4x11.bbclass                        |    1 +
 meta/recipes-core/busybox/busybox-1.19.3/defconfig |    2 +-
 meta/recipes-core/busybox/busybox_1.19.3.bb        |    2 +-
 .../initscripts/initscripts-1.0/sysfs.sh           |    4 +-
 meta/recipes-core/initscripts/initscripts_1.0.bb   |    2 +-
 meta/recipes-core/udev/udev.inc                    |   11 +++++++-
 meta/recipes-core/udev/udev/init                   |   23 +++++++++++++---
 meta/recipes-core/udev/udev/udev-cache             |   20 ++++++++++++--
 meta/recipes-core/udev/udev/udev-cache.default     |    4 +++
 meta/recipes-core/udev/udev_164.bb                 |    2 +-
 .../qt4-graphics-system/qt4-graphics-system_1.0.bb |   27 ++++++++++++++++++++
 meta/recipes-qt/qt4/qt4-embedded.inc               |    3 +-
 meta/recipes-qt/qt4/qt4-x11-free.inc               |    3 +-
 14 files changed, 86 insertions(+), 19 deletions(-)
 create mode 100644 meta/recipes-core/udev/udev/udev-cache.default
 create mode 100644 meta/recipes-qt/qt4-graphics-system/qt4-graphics-system_1.0.bb

-- 
1.7.2.5



