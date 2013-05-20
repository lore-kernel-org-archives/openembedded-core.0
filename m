Received: from mail-pa0-f41.google.com ([209.85.220.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <net147@gmail.com>) id 1UeGPT-000453-N1
	for openembedded-core@lists.openembedded.org;
	Mon, 20 May 2013 05:05:16 +0200
Received: by mail-pa0-f41.google.com with SMTP id rl6so5274033pac.28
	for <openembedded-core@lists.openembedded.org>;
	Sun, 19 May 2013 19:46:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=nW6hOwjgsSoSTbkToSMflrnCTfGBlLOEJIKvgrwK92c=;
	b=TyhTK0mnSz6pymIeFhuWWCeY/wMTJ+kiz0ESGvjU4R5mwBwnPKRwyrJfZxTofTH8sy
	zt5oJBQZeGyMPY9LZ5pgyigxMI/1RMm5uO23JnHO/7Y4y9U0mAEDZOSvxt9F/EHL4uKk
	Dr4gNST9ednjO72A0b1uS944al4Mw1NHWm6t58i6rilXUgY5xvzGaPARCE09Cl7M8G/Y
	dVe8tdkQ1Uos7I47uM6TdYS62lhvrNsHZlvDpwAVbHZobcFI5CBJJbNpGrBs/XA098n9
	ne9GJ/qShEt3pnEjf0bvdNpORt0YyRaMD8yNYMEpwBmiLVjtmXSr+6it2QA4Ry5WaaVT
	bJ9Q==
X-Received: by 10.68.226.225 with SMTP id rv1mr55523784pbc.55.1369018015473;
	Sun, 19 May 2013 19:46:55 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by mx.google.com with ESMTPSA id
	xl10sm23527854pac.15.2013.05.19.19.46.53 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 19 May 2013 19:46:54 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 20 May 2013 13:00:00 +1000
Message-Id: <1369018801-23696-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 1.8.2.3
Subject: [PATCH 0/1] systemd: update to 204
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
X-List-Received-Date: Mon, 20 May 2013 03:05:23 -0000
X-List-Received-Date: Mon, 20 May 2013 03:05:23 -0000
X-List-Received-Date: Mon, 20 May 2013 03:05:23 -0000

This updates systemd to 204.

It depends on the following commit:
- base-files: add /run directory from FHS 3 draft specification

Tested startup/shutdown and serial getty under QEMU x86.

Jonathan Liu (1):
  systemd: update to 204

 .../systemd-serialgetty/serial-getty@.service      |  16 +-
 ...se-AC_CHECK_TOOL-for-objcopy-strings-and-.patch |  41 ---
 ...ystemd-update-utmp-shutdown.service-into-.patch | 367 +++++++++++++++++++++
 .../0002-readahead-chunk-on-spinning-media.patch   | 142 --------
 .../systemd/systemd/0003-readahead-cleanups.patch  |  86 -----
 ...ctl-Handle-missing-etc-sysctl.conf-proper.patch |  33 --
 .../systemd/systemd/199-firmware.patch             |  98 ------
 meta/recipes-core/systemd/systemd_199.bb           | 300 -----------------
 meta/recipes-core/systemd/systemd_204.bb           | 296 +++++++++++++++++
 9 files changed, 673 insertions(+), 706 deletions(-)
 delete mode 100644 meta/recipes-core/systemd/systemd/0001-configure-use-AC_CHECK_TOOL-for-objcopy-strings-and-.patch
 create mode 100644 meta/recipes-core/systemd/systemd/0001-utmp-turn-systemd-update-utmp-shutdown.service-into-.patch
 delete mode 100644 meta/recipes-core/systemd/systemd/0002-readahead-chunk-on-spinning-media.patch
 delete mode 100644 meta/recipes-core/systemd/systemd/0003-readahead-cleanups.patch
 delete mode 100644 meta/recipes-core/systemd/systemd/0013-systemd-sysctl-Handle-missing-etc-sysctl.conf-proper.patch
 delete mode 100644 meta/recipes-core/systemd/systemd/199-firmware.patch
 delete mode 100644 meta/recipes-core/systemd/systemd_199.bb
 create mode 100644 meta/recipes-core/systemd/systemd_204.bb

-- 
1.8.2.3



