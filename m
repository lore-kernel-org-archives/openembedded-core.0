Return-Path: <martin.jansa@gmail.com>
Received: from mail-la0-f45.google.com (unknown [209.85.215.45])
	by mail.openembedded.org (Postfix) with ESMTP id 2FC4365FCE
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 May 2014 11:34:38 +0000 (UTC)
Received: by mail-la0-f45.google.com with SMTP id gl10so1787541lab.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 May 2014 04:34:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=qduU5W6+qxf8l5S51aUVNof5rYwcOiNmqrOB/Kz7OGQ=;
	b=td14VMe103r1OWmXR5Z5BcIATtnLQa42mcxGBBEN9kO/YJY7TkkWXDCgF/XsF5KwDM
	+A7W7a6OzAXmtBCL3un5as+vSDSbF6/lLORLWSrzocBLIjjL1aZ82Fnhy4ikv5noUjLd
	naSREz2ww+LhwafohTsXuJk5gZLN3sdrQIOCMH0+ZzuYWNSfqjNfEua00poRTMPixOtP
	Zdo5fKiTQjgR0zF+hKDSXpDcu0DhjPNi5gmlyBlTVlwNIsM4WgcGOO+UMRv8WKlV5/je
	0SH1N/dMPAoHINZf4iGDz4MvkXlsD5eWCOe9m1w3q/hOJucuaIfAqmdzfpbRUhba9O8x
	ckcQ==
X-Received: by 10.152.43.194 with SMTP id y2mr714626lal.72.1399894478686;
	Mon, 12 May 2014 04:34:38 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	mk2sm11293034lbc.8.2014.05.12.04.34.37
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 12 May 2014 04:34:37 -0700 (PDT)
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 12 May 2014 13:34:49 +0200
Message-Id: <cover.1399894447.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.9.2
Subject: [daisy][PATCH 00/10] Daisy backports I
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
X-List-Received-Date: Mon, 12 May 2014 11:34:39 -0000

The following changes since commit 82bd5fc58229df73d7aca93f41b13392f9fdc3dc:

  build-appliance-image: Update to  head revision (2014-04-22 22:53:27 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib jansa/daisy-backports
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=jansa/daisy-backports

Jacob Kroon (1):
  console-tools: Remove floating runtime dependency on flex

Khem Raj (1):
  lttng-modules-2.3.3: Fix build on ARM

Koen Kooi (1):
  grub git: workaround debugedit problems

Martin Jansa (7):
  libnotify: add dbus-glib dependency
  gsettings-desktop-schemas: add missing dependency on intltool-native
  qt4: Explicitly disable sqlite2
  defaultsetup: enable blacklist by default
  gst-plugins-bad: add PACKAGECONFIG for schro, dc1394 and faac
  gst-plugins-good: add PACKAGECONFIG for x11
  gstreamer1.0-plugins-good: add libxfixes and libxdamange to x11
    depends

 meta/conf/distro/defaultsetup.conf                 |   3 +-
 meta/recipes-bsp/grub/grub_git.bb                  |   4 +
 .../console-tools-0.3.2/no-dep-on-libfl.patch      |  19 ++++
 .../console-tools/console-tools_0.3.2.bb           |   1 +
 .../gnome/gsettings-desktop-schemas_3.10.1.bb      |   2 +-
 meta/recipes-gnome/libnotify/libnotify_0.6.0.bb    |   2 +-
 .../lttng/lttng-modules/fixup_block_driver.patch   | 122 +++++++++++++++++++++
 meta/recipes-kernel/lttng/lttng-modules_2.3.3.bb   |   4 +-
 .../gstreamer/gst-plugins-bad_0.10.23.bb           |   3 +
 .../gstreamer/gst-plugins-good_0.10.31.bb          |   6 +-
 .../gstreamer/gstreamer1.0-plugins-good.inc        |   2 +-
 meta/recipes-qt/qt4/qt4.inc                        |   2 +-
 12 files changed, 163 insertions(+), 7 deletions(-)
 create mode 100644 meta/recipes-core/console-tools/console-tools-0.3.2/no-dep-on-libfl.patch
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/fixup_block_driver.patch

-- 
1.9.2


