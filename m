Received: from mail-oa0-f43.google.com ([209.85.219.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1TxWH2-0004IV-8T
	for openembedded-core@lists.openembedded.org;
	Tue, 22 Jan 2013 06:19:54 +0100
Received: by mail-oa0-f43.google.com with SMTP id k1so6814228oag.16
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Jan 2013 21:04:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=8Dnei3fMVRlbdXo9xHKKm3frsk4QHJsdAHWYiFfniRQ=;
	b=U0M+bLWfhENRZp3+XIy5JiCvB4E+4CjRzmr+tW1ODnXYZuKVXX6ipJKWwqAdyfp4fp
	oS72Io1DFNF5ewGLbXn8fu1b9/kaCXEWpO5Gjt3u50DV8HBBdQyKhnHVykgvqesOYq35
	e9HCC+xMI7+sBhKJ5pr9RUMm9HBI5j6rqlOr2+6LjOvBfmYuWNni859u/ZzpxolizhvN
	OEci3g9YoA2uaOiGr4mi6XMjSE+e3b6g9nHox06h5hIL4mNTTg3Oqy4HbvdEUtrwD1kP
	lbko5uoQcXmxNZhG1tytWJzgvJZYzD+gXUX9roDkMeD5konmESYqMrWyRfpJ0ly7IIEO
	zqSQ==
X-Received: by 10.60.7.167 with SMTP id k7mr16398114oea.20.1358831062274;
	Mon, 21 Jan 2013 21:04:22 -0800 (PST)
Received: from leo.gateway.2wire.net
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPS id c4sm12731328oee.0.2013.01.21.21.04.20
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 21 Jan 2013 21:04:21 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 21 Jan 2013 21:03:58 -0800
Message-Id: <cover.1358830857.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.8.0
Subject: [PATCH 0/4] uclibc, systemd, nfs-utils updates
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
X-List-Received-Date: Tue, 22 Jan 2013 05:20:01 -0000

systemd for uclibc needed patches to be refreshed. uClibc git
needed to be updated. nfs-utils is upgrades to 1.8.0-rc3
patch to let non x86 qemu's boot XFCE images

The following changes since commit 751c11e998431613389f094264f096fac5a1c1ae:

  systemd: remove unused SERIAL_CONSOLE variable (2013-01-21 18:56:14 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib kraj/misc
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=kraj/misc

Khem Raj (4):
  nfs-utils: Upgrade 1.2.3 -> 1.2.8-rc3
  uclibc-git: Upgrades to latest git
  systemd: Fix build on uclibc
  qemu.inc: Define preferred providers for libgl, libgles1 and libgles2

 meta/conf/machine/include/qemu.inc                 |    3 +
 .../nfs-utils/nfs-utils-1.0.6-uclibc.patch         |   39 +-
 .../nfs-utils-1.2.3-sm-notify-res_init.patch       |   36 ++
 .../nfs-utils/nfs-utils-nfsctl-x32-fix.patch       |   30 -
 .../nfs-utils/nfs-utils/nfs-utils.1.2.8.rc3.patch  |  599 ++++++++++++++++++++
 .../{nfs-utils_1.2.3.bb => nfs-utils_1.2.7.bb}     |   25 +-
 .../systemd/systemd-pam-fix-getty-unit.patch       |   25 +-
 .../systemd/systemd/systemd-pam-fix-msformat.patch |  131 +++--
 meta/recipes-core/uclibc/uclibc-git.inc            |    5 +-
 ...nt.c-wtent.c-move-functions-from-utxent.c.patch |   78 ++-
 ...-Move-aeabi_read_tp-to-uclibc_nonshared.a.patch |   30 +-
 .../uclibc-git/define-MSG_CMSG_CLOEXEC.patch       |   25 -
 meta/recipes-core/uclibc/uclibc-git/dup3.patch     |   37 --
 .../uclibc/uclibc-git/mount.h-update.patch         |   83 ---
 .../uclibc/uclibc-git/powerpc_copysignl.patch      |   16 +-
 .../uclibc-git/remove_attribute_optimize_Os.patch  |   95 +---
 16 files changed, 846 insertions(+), 411 deletions(-)
 create mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-utils-1.2.3-sm-notify-res_init.patch
 delete mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-utils-nfsctl-x32-fix.patch
 create mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-utils.1.2.8.rc3.patch
 rename meta/recipes-connectivity/nfs-utils/{nfs-utils_1.2.3.bb => nfs-utils_1.2.7.bb} (67%)
 delete mode 100644 meta/recipes-core/uclibc/uclibc-git/define-MSG_CMSG_CLOEXEC.patch
 delete mode 100644 meta/recipes-core/uclibc/uclibc-git/dup3.patch
 delete mode 100644 meta/recipes-core/uclibc/uclibc-git/mount.h-update.patch

-- 
1.7.9.5



