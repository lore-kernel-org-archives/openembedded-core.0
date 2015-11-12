Return-Path: <kergoth@gmail.com>
Received: from mail-pa0-f41.google.com (mail-pa0-f41.google.com
	[209.85.220.41])
	by mail.openembedded.org (Postfix) with ESMTP id 42F7D77280
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Nov 2015 23:40:35 +0000 (UTC)
Received: by pasz6 with SMTP id z6so82453242pas.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Nov 2015 15:40:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=jz+F6fzKE5Wmi37H3pIEazx7OG6MSki7Xr/F00+APvQ=;
	b=xvueclWfchYzQdiQPiwCm4zOCxPWKjI7CrScIjFR2KbHwUZE5HJsPQmgZzI8yLlgvo
	lwASTDn3141MXwycdOzPln/M4CKHRYZ26gMNhD89FCrieZzr5Y3fmSaIgUqr33vutoyc
	yUKuexnbhtkkf4nr6HSyfXc6KJsZtYgbTPi1JgHtFLo7T/+SxBaLlgsO/gv5wb+js3si
	7mHpaO8KBLc4jDBX0HR4OE/Xk4RebO1dnMGOH4BLuk+/7je8ggXvY0unqF2BMXzPh3xM
	oRDh1+fRo32iuUmea2MTnsG2LGYsK9S6ZGSXMk87CKCPl+nC61hIpo30mFZLeHCGCPaq
	yrPQ==
X-Received: by 10.67.4.38 with SMTP id cb6mr27284218pad.34.1447371635785;
	Thu, 12 Nov 2015 15:40:35 -0800 (PST)
Received: from amyr.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by smtp.gmail.com with ESMTPSA id
	wq1sm16715245pbc.49.2015.11.12.15.40.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 12 Nov 2015 15:40:33 -0800 (PST)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 12 Nov 2015 16:40:23 -0700
Message-Id: <cover.1447371041.git.chris_larson@mentor.com>
X-Mailer: git-send-email 2.2.1
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH 0/7] Misc improvements 1 from Mentor
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
X-List-Received-Date: Thu, 12 Nov 2015 23:40:35 -0000

From: Christopher Larson <chris_larson@mentor.com>

This is the second of three pull requests / patch series from Mentor's queue
of changes destined for oe-core master (not jethro). This series includes
a few recipe improvements and adds the ability to supply and use wks files
from a different layer than the image.


The following changes since commit e44ed8c18e395b9c055aefee113b90708e8a8a2f:

  build-appliance-image: Update to jethro head revision (2015-11-03 14:02:57 +0000)

are available in the git repository at:

  git://github.com/kergoth/openembedded-core mentor-misc-improvements-1-after-jethro
  https://github.com/kergoth/openembedded-core/tree/mentor-misc-improvements-1-after-jethro

Christopher Larson (7):
  image_types: improve wks path specification
  sysprof: use packageconfig for the gui
  sysprof: add missing gdk-pixbuf/pango deps
  systemd: for valgrind, define VALGRIND=1
  bluez5: enable sysvinit support
  psplash: add systemd support
  nativesdk-perl: set PERL5LIB based on wrapper path

 meta/classes/image_types.bbclass                   | 22 ++++---
 meta/recipes-connectivity/bluez5/bluez5.inc        |  8 ++-
 meta/recipes-connectivity/bluez5/bluez5/init       | 68 ++++++++++++++++++++++
 .../psplash/files/psplash-quit.service             | 11 ++++
 .../psplash/files/psplash-start.service            | 11 ++++
 meta/recipes-core/psplash/psplash_git.bb           | 20 +++++--
 meta/recipes-core/systemd/systemd_225.bb           |  3 +
 meta/recipes-devtools/perl/perl_5.22.0.bb          |  4 +-
 .../sysprof/files/gui-argument.patch               | 35 +++++++++++
 meta/recipes-kernel/sysprof/sysprof_git.bb         |  9 ++-
 10 files changed, 174 insertions(+), 17 deletions(-)
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5/init
 create mode 100755 meta/recipes-core/psplash/files/psplash-quit.service
 create mode 100755 meta/recipes-core/psplash/files/psplash-start.service
 create mode 100644 meta/recipes-kernel/sysprof/files/gui-argument.patch

-- 
2.2.1


