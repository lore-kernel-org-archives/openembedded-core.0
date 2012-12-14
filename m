Received: from mail-pa0-f47.google.com ([209.85.220.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Tjf61-0003gm-NG
	for openembedded-core@lists.openembedded.org;
	Sat, 15 Dec 2012 00:55:13 +0100
Received: by mail-pa0-f47.google.com with SMTP id fa10so2485764pad.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Dec 2012 15:40:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer;
	bh=AUjjJXB1q8+ZvfGXECCrQhPii9q3rZ9+hf2WvnvaOC4=;
	b=rsA/HiWbhTNFvjzkwfGys/1niW+eYvtTe1Ebh7AeEVe+yQWsychHJf8DVkCgRkjogG
	AtpcX9TwihMN5DLtVLDC/SnIY4lEKhbeGdCZD6IYFW5jVWrZnD0p9RbqiMbafaXm39NZ
	txo0ubvls+r6UXxIkLsW007MnJo38fl1yAdpy1j+CVAyIugxPKcqiB/OGAETbAZ4/KWh
	+CicHMvN6PCGrcMbaxUG9mqbeQjiYbK4GB4k99wyT3rcaUykNF4jJqVD8Ctggk4ERhXc
	FnSprffvZjQS7JVLQ/mhZGPksuSMQXJsC7Jd17eQbRfn6fthG6WmN1yL696X7iKSNn0H
	AFCg==
Received: by 10.68.138.137 with SMTP id qq9mr20410804pbb.74.1355528436018;
	Fri, 14 Dec 2012 15:40:36 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id oj1sm3674874pbb.19.2012.12.14.15.40.33
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 14 Dec 2012 15:40:34 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 15 Dec 2012 00:40:38 +0100
Message-Id: <cover.1355475937.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0.2
Subject: [PATCH 00/10] Pending patches
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
X-List-Received-Date: Fri, 14 Dec 2012 23:55:13 -0000

The following changes since commit a24a5e5c9ede4275f7188935a9410b84d406ed19:

  libacpi: Remove QA warning: No GNU_HASH in the elf binary (2012-12-13 14:48:13 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib jansa/pull
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=jansa/pull

Martin Jansa (9):
  scripts/sstate-diff-machines.sh: add simple script to compare sstate
    checksums between MACHINEs
  scripts/sstate-sysroot-cruft.sh: add simple script to find files in
    sysroots not tracked by sstate
  rootfs_*.bbclass: exclude BUILDNAME var dependency from do_rootfs
  bitbake.conf: exclude DATETIME var dependency from IMAGE_NAME
  kernel.bbclass: include PE in KERNEL_IMAGE_BASE_NAME
  kernel.bbclass: use the same versioning schema for modules.tgz and
    provide link to latest
  autotools: copy also remove-potcdate.sin from
    ${STAGING_DATADIR_NATIVE}/gettext/po
  gettext: move remove-potcdate.sin from gettext-native to
    gettext-minimal-native
  iptables: include /usr/share/xtables/pf.os in PN if it's build

Phil Blundell (1):
  kernel.bbclass: Allow modules*.tar.gz generation to be inhibited

 meta/classes/autotools.bbclass                     |   3 +
 meta/classes/kernel.bbclass                        |  12 ++-
 meta/classes/rootfs_deb.bbclass                    |   1 +
 meta/classes/rootfs_ipk.bbclass                    |   1 +
 meta/classes/rootfs_rpm.bbclass                    |   1 +
 meta/conf/bitbake.conf                             |   1 +
 .../gettext-minimal-0.18.1.1/remove-potcdate.sin   |  19 ++++
 .../gettext/gettext-minimal-native_0.18.1.1.bb     |   4 +-
 meta/recipes-core/gettext/gettext_0.18.1.1.bb      |   3 +-
 meta/recipes-extended/iptables/iptables_1.4.15.bb  |   4 +-
 scripts/sstate-diff-machines.sh                    | 107 +++++++++++++++++++++
 scripts/sstate-sysroot-cruft.sh                    |  78 +++++++++++++++
 12 files changed, 227 insertions(+), 7 deletions(-)
 create mode 100644 meta/recipes-core/gettext/gettext-minimal-0.18.1.1/remove-potcdate.sin
 create mode 100755 scripts/sstate-diff-machines.sh
 create mode 100755 scripts/sstate-sysroot-cruft.sh

-- 
1.8.0.2



