Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com
	[209.85.215.170])
	by mail.openembedded.org (Postfix) with ESMTP id EB07D60B71
	for <openembedded-core@openembedded.org>;
	Tue,  4 Feb 2020 15:06:11 +0000 (UTC)
Received: by mail-pg1-f170.google.com with SMTP id k3so9795516pgc.3
	for <openembedded-core@openembedded.org>;
	Tue, 04 Feb 2020 07:06:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=hGxIXqLbo55aW6Ucxkqo0I7gCFauSm6FS19gXu1EYIs=;
	b=CQBuHgZEOls2xdRr56FCOtrhG0UQqHFGG5UhfS/n8nSccRXjUpLW/rTemNTZfPeRNQ
	5lM3mGT+HQr1SgCselsMx+4YYO+50K6as7511hR6e4GNYxNFolDfUPkHgPuVZu+xLbNn
	ZbwUMzi8T7ncxZ2E5nfrekv0iuUcj908gAY4gE/f3n4+Yr9O3hw92IzSRdBv4J8fnHrU
	9QKi9DqlIoMsCCMgBUDhZNFIWVzgNS00TUHhBpyYzYXdchKcHnakcmwHbStQSFlP+3gS
	UnVZj6Tn6XPtohiDVxxCqPrdkAyJRLQGcHE85W7DJ9W56Med90HUJX5RtQz7DSxo2kUf
	8Qsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=hGxIXqLbo55aW6Ucxkqo0I7gCFauSm6FS19gXu1EYIs=;
	b=p5pL7oD//F4Qtl1TqGs72oxyWndnN1hYaog+XyCO6HRtwZxFSQ/8/Po+yqPFFb4qi+
	CKEfMqikq8FHylrcG9JrmlSOEjn2mfkkUMpPTtGLev6cW2W3CNGjiWpdgwqQWJPUyWer
	tFi70ffifEK+1KMpM3ulg1RZO642CkNGxM/r1CcRZRigwhpQSfcABnYNM4yLJhZSavTu
	Ok/UjqGA7PWqGNeawmq37ugz2cg3zBJqeSjkfggJ4d4Kko3K59QmJQxXoTxzmtvHJbIe
	2huMbk1Rl8WoRKURzusOAiO9yJCaUzpu6D6fI+fSjBoVFu6CO+1HhtsUVPLTEDplnUS5
	ArmA==
X-Gm-Message-State: APjAAAWifYIqV2C91TAvnYbgBflvNM87QZzK/EO5ac1ITUtzyiWSUoXJ
	LsQdd7t9Ss//osW+qYzeKl7dsG32
X-Google-Smtp-Source: APXvYqxzN8g/Y8sVi1wFjzbRxe37P5xJkscbJqwJwF9gieOf9x0+3bGuCAL6CKmow2Njld9rzYIunw==
X-Received: by 2002:a63:c441:: with SMTP id m1mr447918pgg.324.1580828772592;
	Tue, 04 Feb 2020 07:06:12 -0800 (PST)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:a5c0::afc]) by smtp.gmail.com with ESMTPSA id
	b98sm4216055pjc.16.2020.02.04.07.06.11
	for <openembedded-core@openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 04 Feb 2020 07:06:12 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@openembedded.org
Date: Tue,  4 Feb 2020 07:06:00 -0800
Message-Id: <cover.1580828664.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [zeus 0/8] Merge request
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
X-List-Received-Date: Tue, 04 Feb 2020 15:06:12 -0000

Please concider these changes for zeus

The following changes since commit 2bba0052597020ea887c84419440df11f9859283:

  sstatesig: Improve debug output if getpwuid() fails (2020-01-18 14:04:27 -0800)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/zeus-next
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/zeus-next

Armin Kuster (1):
  python2: add ntpath

De Huo (2):
  bash: Fix CVE-2019-18276
  kbd: configure.ac: Fix logic of vlock configure switch

Hongxu Jia (1):
  kbd: avoid vlock conflict with busybox

Joe Slater (1):
  webkitgtk: fix occasional link error

Lee Chee Yang (1):
  libxml2: Fix CVE-2019-19956

Sana Kazi (1):
  bzip2: Fix CVE-2019-12900

Sumit Garg (1):
  core: recipes: fix some native tools dependencies

 ...-Fix-logic-of-vlock-configure-switch.patch |  31 ++
 meta/recipes-core/kbd/kbd_2.0.4.bb            |   4 +-
 .../libxml/libxml2/Fix-CVE-2019-19956.patch   |  40 ++
 meta/recipes-core/libxml/libxml2_2.9.9.bb     |   1 +
 .../python/python/python2-manifest.json       |   1 +
 .../bash/bash/bash-CVE-2019-18276.patch       | 402 ++++++++++++++++++
 meta/recipes-extended/bash/bash_5.0.bb        |   1 +
 .../bzip2/bzip2-1.0.6/CVE-2019-12900.patch    |  36 ++
 meta/recipes-extended/man-db/man-db_2.8.7.bb  |   2 +-
 meta/recipes-extended/psmisc/psmisc.inc       |   2 +-
 .../xorg-app/xorg-app-common.inc              |   2 +-
 .../webkit/webkitgtk/fix-link-error.patch     |  45 ++
 meta/recipes-sato/webkit/webkitgtk_2.24.4.bb  |   1 +
 13 files changed, 564 insertions(+), 4 deletions(-)
 create mode 100644 meta/recipes-core/kbd/kbd/0001-configure.ac-Fix-logic-of-vlock-configure-switch.patch
 create mode 100644 meta/recipes-core/libxml/libxml2/Fix-CVE-2019-19956.patch
 create mode 100644 meta/recipes-extended/bash/bash/bash-CVE-2019-18276.patch
 create mode 100644 meta/recipes-extended/bzip2/bzip2-1.0.6/CVE-2019-12900.patch
 create mode 100755 meta/recipes-sato/webkit/webkitgtk/fix-link-error.patch

-- 
2.17.1


