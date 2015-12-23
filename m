Return-Path: <joshuagloe@gmail.com>
Received: from mail-wm0-f51.google.com (mail-wm0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id 428AD6AC37
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Dec 2015 13:40:44 +0000 (UTC)
Received: by mail-wm0-f51.google.com with SMTP id p187so149108294wmp.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Dec 2015 05:40:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding;
	bh=XjBmVQ8SbWLktltlpMNX0+i0yNrUEX9a0Egv0exSsnk=;
	b=mOk2k8V9lMJKjY5lBl4WtRpq2jv6cy4awBr9PZUIQD8mza0wikyz/KiNuEFLp6/3T4
	EzHJGXo8eYm67GCRsySjpyyVXyTgcHy4g1mAESgPbIwMyqMnCNljt/7Ukp2GD/jWzTMS
	ChOGottR8dv/vBcALxL1xrEaV3f8BzI0TBl+bVc7jycyUlx+kOT4QjUOs0fH9HhOMo8u
	co8uNz5tINYNWCg0eg36W1YQV7BIVl6rQjfqoTJyxuUQnBWXvl5ZwiDcj4Xcq7MDm7yV
	2n2xgSiDwQc+YjMC1Iva8YvJnYkp9mn7006CUX2mIgl+zBvkbIozU2SyjDY3hMmWF4vI
	HGSA==
X-Received: by 10.194.76.228 with SMTP id n4mr27075662wjw.35.1450878045520;
	Wed, 23 Dec 2015 05:40:45 -0800 (PST)
Received: from nothic.cbg.collabora.co.uk
	(host86-190-54-244.range86-190.btcentralplus.com. [86.190.54.244])
	by smtp.gmail.com with ESMTPSA id
	df10sm22951338wjb.44.2015.12.23.05.40.44
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 23 Dec 2015 05:40:44 -0800 (PST)
From: Joshua Lock <joshuagloe@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 23 Dec 2015 13:40:36 +0000
Message-Id: <cover.1450877679.git.joshua.lock@collabora.co.uk>
X-Mailer: git-send-email 2.5.0
MIME-Version: 1.0
Subject: [PATCH 0/9] Proposed changes for fido
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
X-List-Received-Date: Wed, 23 Dec 2015 13:40:47 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Joshua Lock <joshua.lock@collabora.co.uk>

Please consider the following fixes, available in the joshuagl/fido-next
branch of openembedded-core-contrib, for the fido branch.

Regards,

Joshua

The following changes since commit 9f339f516ab03d598fae0e536b3a420ea4d8ee1a:

  bash: Disable custom memory allocator (2015-11-20 15:46:27 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib joshuagl/fido-next
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=joshuagl/fido-next

Armin Kuster (1):
  libxml2: fix CVE-2015-7942 and CVE-2015-8035

Bhuvanchandra DV (1):
  linux-firmware: rtl8192cx: Add latest available firmware

Martin Jansa (2):
  linux-dtb.inc: drop unused DTB_NAME variable from do_install
  feature-arm-thumb.inc: Fix ARMPKGSFX_THUMB value

Mike Crowe (1):
  allarch: Force TARGET_*FLAGS variable values

Richard Purdie (2):
  layer.conf: Add several allarch dependency exclusions
  layer.conf: Add missing dependency for allarch package
    initramfs-framework

Sona Sarmadi (1):
  bind: CVE-2015-8000

Stefan Müller-Klieser (1):
  gcc-4.9: backport from gcc trunk r212178

 meta/classes/allarch.bbclass                       |   4 +
 meta/conf/layer.conf                               |  11 ++
 .../conf/machine/include/arm/feature-arm-thumb.inc |   2 +-
 .../bind/bind/CVE-2015-8000.patch                  | 194 +++++++++++++++++++++
 meta/recipes-connectivity/bind/bind_9.9.5.bb       |   1 +
 meta/recipes-core/libxml/libxml2.inc               |   2 +
 .../libxml/libxml2/CVE-2015-7942.patch             |  55 ++++++
 .../libxml/libxml2/CVE-2015-8035.patch             |  41 +++++
 meta/recipes-devtools/gcc/gcc-4.9.inc              |   1 +
 ...racking.c-backport-from-gcc-trunk-r212178.patch |  39 +++++
 .../linux-firmware/linux-firmware_git.bb           |   4 +-
 meta/recipes-kernel/linux/linux-dtb.inc            |   1 -
 12 files changed, 351 insertions(+), 4 deletions(-)
 create mode 100644 meta/recipes-connectivity/bind/bind/CVE-2015-8000.patch
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2015-7942.patch
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2015-8035.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.9/0062-gcc-var-tracking.c-backport-from-gcc-trunk-r212178.patch

--
2.5.0

