Return-Path: <kergoth@gmail.com>
Received: from mail-pa0-f49.google.com (mail-pa0-f49.google.com
	[209.85.220.49])
	by mail.openembedded.org (Postfix) with ESMTP id E7F8A7732D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Nov 2015 23:10:42 +0000 (UTC)
Received: by padhx2 with SMTP id hx2so113380659pad.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Nov 2015 15:10:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=hdQs05Q8jA+Stk6GnIGgvSmJftrJsMsQANOUg+4c7lY=;
	b=usWygF9M5xLqot8oGpWGDxlDs+G1arABbqk7M+KHIOzJObLY5OZT2qJZrTqBilaPeK
	R0nSh0CbRg+POGp0KTzaMGAFPxhTwtSbWS52WX9dj0xWf8CG9yR4iYlWYz98pZFdmWBf
	yWtVctJ2CHtrXWvvqgAbjQDsDoq0EsgKqOJM7BwmuwpQfMmNEhBw8qkxF2FlkKw3H09W
	PW5tg9vT/gbKb/jAGMECpvZVZHYwiCrpl0iAxrkUZ94yq00AuK0UcEk/cgovgJrgjCIi
	FMrpc3A6BO9cnKSxnT2Q0EIAm9QGk5InAmvj9agf/olfb1EVgBLN0ExNJaRwUHEC2Q5H
	wopw==
X-Received: by 10.66.158.129 with SMTP id wu1mr35318056pab.146.1447456242286; 
	Fri, 13 Nov 2015 15:10:42 -0800 (PST)
Received: from amyr.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by smtp.gmail.com with ESMTPSA id
	ws6sm22370501pbc.33.2015.11.13.15.10.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 13 Nov 2015 15:10:39 -0800 (PST)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 13 Nov 2015 16:10:36 -0700
Message-Id: <cover.1447455202.git.chris_larson@mentor.com>
X-Mailer: git-send-email 2.2.1
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCHv2 0/6] Misc improvements 1 from Mentor
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
X-List-Received-Date: Fri, 13 Nov 2015 23:10:46 -0000

From: Christopher Larson <chris_larson@mentor.com>

This is the second of three pull requests / patch series from Mentor's queue
of changes destined for oe-core master (not jethro). This series includes
a few recipe improvements and adds the ability to supply and use wks files
from a different layer than the image.

v2 changes:

- dropped the nativesdk-perl wrapper patch, I'll prep a separate patch series
- sysprof: fixed typo in its patch
- image_types: restored support for ${IMAGE_BASENAME}.wks to not break tests,
  correct the search path to include scripts/ for other layers, fixed other
  issues iwth the search, and fixed the file-checksums usage so changes to the
  wks contents cause the image to be rebuilt


The following changes since commit e44ed8c18e395b9c055aefee113b90708e8a8a2f:

  build-appliance-image: Update to jethro head revision (2015-11-03 14:02:57 +0000)

are available in the git repository at:

  git://github.com/kergoth/openembedded-core mentor-misc-improvements-1-after-jethro
  https://github.com/kergoth/openembedded-core/tree/mentor-misc-improvements-1-after-jethro

Christopher Larson (6):
  image_types: improve wks path specification
  sysprof: use packageconfig for the gui
  sysprof: add missing gdk-pixbuf/pango deps
  systemd: for valgrind, define VALGRIND=1
  bluez5: enable sysvinit support
  psplash: add systemd support

 meta/classes/image_types.bbclass                   | 36 +++++++++---
 meta/recipes-connectivity/bluez5/bluez5.inc        |  8 ++-
 meta/recipes-connectivity/bluez5/bluez5/init       | 68 ++++++++++++++++++++++
 .../psplash/files/psplash-quit.service             | 11 ++++
 .../psplash/files/psplash-start.service            | 11 ++++
 meta/recipes-core/psplash/psplash_git.bb           | 20 +++++--
 meta/recipes-core/systemd/systemd_225.bb           |  3 +
 .../sysprof/files/gui-argument.patch               | 35 +++++++++++
 meta/recipes-kernel/sysprof/sysprof_git.bb         |  9 ++-
 9 files changed, 185 insertions(+), 16 deletions(-)
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5/init
 create mode 100755 meta/recipes-core/psplash/files/psplash-quit.service
 create mode 100755 meta/recipes-core/psplash/files/psplash-start.service
 create mode 100644 meta/recipes-kernel/sysprof/files/gui-argument.patch

-- 
2.2.1


