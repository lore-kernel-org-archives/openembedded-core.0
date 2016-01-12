Return-Path: <armccurdy@gmail.com>
Received: from mail-ob0-f196.google.com (mail-ob0-f196.google.com
	[209.85.214.196])
	by mail.openembedded.org (Postfix) with ESMTP id 8DA0D65CC3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jan 2016 07:19:13 +0000 (UTC)
Received: by mail-ob0-f196.google.com with SMTP id oj9so5774697obc.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jan 2016 23:19:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=GtUK3FMDf+OOSrdq0S4jJEBMUiVDZp/WH+4crKexVxo=;
	b=mxIfQ1jr+70ZbQiTbKcfBJn1GR5sJY9X93VR/vpdx5PkDhgf1/8OthM3glWzHweKqp
	SJnQe+P3YE68uxTEX56eRoCY7mAvtK+dXps11nwTitVzZadWECwHJ3VGD9AMuUdX/PJS
	W17R0rrOVAYyc0kTUwyU7AGC/VBAT17opq7QCnMapKjXKVfTzuWtNZwU+ekqovhKxhJS
	1bPhu1tpwYbt9YoI0DZLH93Cucy+9kBN1d0G6VitJfqIkYDgErdgFsWCmphUX0vnq62H
	YeIJ6w6CEuHpTM5zw+m32oFRmEZJgTf9VFdAACcMc422495VQiOVCq9Lfq0bbK4Gt0zd
	ji2g==
X-Received: by 10.60.117.102 with SMTP id kd6mr95359935oeb.73.1452583153619;
	Mon, 11 Jan 2016 23:19:13 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id
	d2sm49992973oic.12.2016.01.11.23.19.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 11 Jan 2016 23:19:12 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 Jan 2016 23:18:32 -0800
Message-Id: <1452583117-812-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH 0/5] strace: misc fixes + update 4.10 -> 4.11
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
X-List-Received-Date: Tue, 12 Jan 2016 07:19:13 -0000

Andre McCurdy (5):
  strace: drop unnecessary dependency on acl
  strace: fix --disable-aio configure option
  strace: remove need for git-version-gen script
  strace: fix ARCH definition in tests/Makefile
  strace: update 4.10 -> 4.11

 .../0001-Add-linux-aarch64-arch_regs.h.patch       |  25 ---
 .../Include-linux-ioctl.h-for-_IOC_-macros.patch   |  69 -------
 .../strace/Include-sys-stat.h-for-S_I-macros.patch |  52 -----
 .../strace/strace/Makefile-ptest.patch             |  18 +-
 .../strace/strace/disable-git-version-gen.patch    |  20 ++
 .../recipes-devtools/strace/strace/git-version-gen | 225 ---------------------
 .../strace/strace-add-configure-options.patch      |  57 ------
 .../strace/{strace_4.10.bb => strace_4.11.bb}      |  22 +-
 8 files changed, 35 insertions(+), 453 deletions(-)
 delete mode 100644 meta/recipes-devtools/strace/strace/0001-Add-linux-aarch64-arch_regs.h.patch
 delete mode 100644 meta/recipes-devtools/strace/strace/Include-linux-ioctl.h-for-_IOC_-macros.patch
 delete mode 100644 meta/recipes-devtools/strace/strace/Include-sys-stat.h-for-S_I-macros.patch
 create mode 100644 meta/recipes-devtools/strace/strace/disable-git-version-gen.patch
 delete mode 100755 meta/recipes-devtools/strace/strace/git-version-gen
 delete mode 100644 meta/recipes-devtools/strace/strace/strace-add-configure-options.patch
 rename meta/recipes-devtools/strace/{strace_4.10.bb => strace_4.11.bb} (53%)

-- 
1.9.1


