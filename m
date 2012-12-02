Received: from mail-pa0-f47.google.com ([209.85.220.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1TfGds-0003c5-S3
	for openembedded-core@lists.openembedded.org;
	Sun, 02 Dec 2012 22:00:01 +0100
Received: by mail-pa0-f47.google.com with SMTP id fa10so1220094pad.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 02 Dec 2012 12:45:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=ZeNn4U/SJgUEV+PlRlaZfzhlP+v0xJgxKCSmqYS/zyI=;
	b=gg3EeDyHshIBF79wESw3xeH4WgVKYYJXbNAh8kJIhxOzkXHx9gy8VM26WhyhVUmk11
	7HxLq7auMTz87Y79rRAQ5BmjPx25b1NcI2P7aAp0MQVD4/sdvL73jVjlpedQv0509SYq
	3/WDredE2ydIfFFS+DASYObGj7p/aLSa424bNWGrd/4mWlM2ggCLbvVVc3vl1ChcZH+Z
	mDCJi3TOXVLZZOxmPsk9OpObOP4I/avop9B4Q+NcfRsfV6gI7mH2uqNlnO3/HXd7R0Zo
	zos2nfNXeeg3AnC14mbbMmSUNRDSV6ZLNWImDrDAOOvPZWzzXtKua2oMHSMa7MgRriLR
	epTA==
Received: by 10.66.80.8 with SMTP id n8mr728032pax.40.1354481139766;
	Sun, 02 Dec 2012 12:45:39 -0800 (PST)
Received: from agate.agate.openembedded.org (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id o10sm6744526paz.37.2012.12.02.12.45.38
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 02 Dec 2012 12:45:38 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  2 Dec 2012 12:44:55 -0800
Message-Id: <cover.1354480962.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH 0/3] Upgrade util-linux and misc fixes
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
X-List-Received-Date: Sun, 02 Dec 2012 21:00:01 -0000

This patchset fixes libcgroup build failure
drops KERNEL_CC, this patch has been in my tree for a long time
upgrades util-linux

The following changes since commit 99f003356be43bb361634359a5d3c520f72f0a08:

  local.conf.sample: Enable disk space monitoring by default (2012-11-28 15:25:14 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib kraj/misc
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=kraj/misc

Khem Raj (3):
  kernel.bbclass,module-base.bbclass: Use CC to form KERNEL_CC
  util-linux: Update from 2.21 -> 2.22
  libcgroup: Fix QA error about .so symlink

 meta/classes/kernel-arch.bbclass                   |   13 +++++++++++++
 meta/classes/kernel.bbclass                        |   16 +---------------
 meta/classes/module-base.bbclass                   |   16 ----------------
 meta/recipes-core/libcgroup/libcgroup_0.37.1.bb    |    2 +-
 meta/recipes-core/util-linux/util-linux.inc        |   18 +++++++++++-------
 .../util-linux/add-aarch64-support.patch           |    4 ++--
 .../util-linux/uclibc-__progname-conflict.patch    |   14 +++++++-------
 .../util-linux-ng-replace-siginterrupt.patch       |   14 +++++++-------
 .../{util-linux_2.21.2.bb => util-linux_2.22.bb}   |    8 +++-----
 9 files changed, 45 insertions(+), 60 deletions(-)
 rename meta/recipes-core/util-linux/{util-linux_2.21.2.bb => util-linux_2.22.bb} (88%)

-- 
1.7.9.5



