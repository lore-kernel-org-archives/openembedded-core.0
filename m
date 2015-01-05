Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f46.google.com (mail-pa0-f46.google.com
	[209.85.220.46])
	by mail.openembedded.org (Postfix) with ESMTP id 410DC60167
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Jan 2015 20:40:36 +0000 (UTC)
Received: by mail-pa0-f46.google.com with SMTP id lf10so29336709pab.19
	for <openembedded-core@lists.openembedded.org>;
	Mon, 05 Jan 2015 12:40:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=3xsABxfQK+f9LjjleaZ17mkKFuU4WT9UcRZsA0ZK3vM=;
	b=nMOmeRuSfLjXIPL1hbqqLqy1YyVeJprsQLYMlVttTpaOfqIRgH7+UZA3JskIqJnJrR
	qZa1KZVxXoASJFysLyL1IZOQX7yFTpNPRls7DnOskLmXTcFOBjf5zTo6JRl5jMgccrVB
	azCanjayuW0xJZ0WVRnQs2ifmGH+MUhQJxR/R1KLw+K8wZM77ZtryuaO2IMmu6JN/8gv
	XniMHQh29AuDChOgz6gtT4sYujQqE1wq1Fkk92bMMtrNd9lk7JAAEO/aOrew2cqe2SD/
	kJz67yD0I1ewii2vYkZey7KhKIiLaZE2gjemO98Rsw8TrowYXWiuULIhNPBfLoffzg3z
	cNNg==
X-Received: by 10.68.171.33 with SMTP id ar1mr25806670pbc.37.1420490436776;
	Mon, 05 Jan 2015 12:40:36 -0800 (PST)
Received: from bigisland.hsd1.ca.comcast.net
	(c-76-20-92-207.hsd1.ca.comcast.net. [76.20.92.207])
	by mx.google.com with ESMTPSA id k4sm54950515pbq.74.2015.01.05.12.40.34
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 05 Jan 2015 12:40:35 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org
Date: Mon,  5 Jan 2015 12:40:34 -0800
Message-Id: <cover.1420490240.git.akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 00/12] Dizzy 1.7.1 additions
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 05 Jan 2015 20:40:45 -0000

please consider this for inclusion for 1.7.1
Many security fixes and kernel update.

The following changes since commit f4d9d7bc206aaf30ea5c72675df139425a2c8d90:

  lbdrm: fix build issue. (2014-12-27 08:43:41 -0800)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib akuster/dizzy_1_7_1
  http://git.yoctoproject.org/cgit.cgi//log/?h=akuster/dizzy_1_7_1

Armin Kuster (1):
  binutils: several security fixes

Bruce Ashfield (6):
  linux-yocto/3.10: 8250/8250_dw: fix compile failure due to
    stable/Yocto conflict
  linux-yocto/3.10: update to v3.10.59
  linux-yocto/3.10: update to v3.10.62
  linux-yocto/3.14: update to v3.14.24
  linux-yocto/3.14: update to 3.14.26, integrate ltsi and -rt updates
  lttng-modules: fix mm_compaction_isolate_template build

Jackie Huang (1):
  packagegroup-self-hosted: add git-perltools

Otavio Salvador (1):
  sysvinit-inittab: Disable the carrier detect requirement for serial
    consoles

Richard Purdie (2):
  report-error: Handle the case no logfile exists
  image: Avoid race over directory creation

Sona Sarmadi (1):
  bind: fix for CVE-2014-8500

 meta/classes/image.bbclass                         |   1 +
 meta/classes/report-error.bbclass                  |   9 +-
 .../bind/bind/bind9_9_5-CVE-2014-8500.patch        | 990 +++++++++++++++++++++
 meta/recipes-connectivity/bind/bind_9.9.5.bb       |   1 +
 .../packagegroups/packagegroup-self-hosted.bb      |   1 +
 .../sysvinit/sysvinit-inittab_2.88dsf.bb           |   2 +-
 meta/recipes-devtools/binutils/binutils-2.24.inc   |   8 +
 .../binutils/binutils/binutils_CVE-2014-8484.patch |  67 ++
 .../binutils/binutils/binutils_CVE-2014-8485.patch | 102 +++
 .../binutils/binutils/binutils_CVE-2014-8501.patch |  60 ++
 .../binutils/binutils/binutils_CVE-2014-8502.patch |  89 ++
 .../binutils/binutils_CVE-2014-8502_1.patch        | 523 +++++++++++
 .../binutils/binutils/binutils_CVE-2014-8503.patch |  47 +
 .../binutils/binutils/binutils_CVE-2014-8504.patch |  75 ++
 .../binutils/binutils/binutils_CVE-2014-8737.patch | 177 ++++
 meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb   |   8 +-
 meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb   |   8 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb |   6 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb |   6 +-
 meta/recipes-kernel/linux/linux-yocto_3.10.bb      |  18 +-
 meta/recipes-kernel/linux/linux-yocto_3.14.bb      |  18 +-
 ...-fix-mm_compaction_isolate_template-build.patch |  41 +
 meta/recipes-kernel/lttng/lttng-modules_2.5.0.bb   |   1 +
 23 files changed, 2222 insertions(+), 36 deletions(-)
 create mode 100644 meta/recipes-connectivity/bind/bind/bind9_9_5-CVE-2014-8500.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/binutils_CVE-2014-8484.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/binutils_CVE-2014-8485.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/binutils_CVE-2014-8501.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/binutils_CVE-2014-8502.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/binutils_CVE-2014-8502_1.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/binutils_CVE-2014-8503.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/binutils_CVE-2014-8504.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/binutils_CVE-2014-8737.patch
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/compaction-fix-mm_compaction_isolate_template-build.patch

-- 
1.9.1


