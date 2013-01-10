Received: from mail-lb0-f170.google.com ([209.85.217.170])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cazfi74@gmail.com>) id 1TtFOD-00006S-Bk
	for openembedded-core@lists.openembedded.org;
	Thu, 10 Jan 2013 11:29:50 +0100
Received: by mail-lb0-f170.google.com with SMTP id j14so343719lbo.29
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Jan 2013 02:14:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer;
	bh=OaRuLpGNVxlBilAQOOM9FaghJ/SnxjUkHrlJfPFP5D8=;
	b=TFZHNd4enG+gQtB1phfxBYbldru5xLEaD38uHtN0K6DXqwv3t6T69eKPiY/K47V+lR
	tEJhFy5NxeqdSavUoISeeX3sXVvN5UNHk5I4ZA0KHmbFmRoMM4wMD6h0OmPPyDuwgnb4
	i388XDWqVX6qGaxn92VsQTHQojP0i14DXsBPKx7Hb2Z77PVH7xNo5Cnw63HiVR5PMVFQ
	wUTUoTZroKZz0KQR8PFqGmVvYOLhQ1dLlonPrBR18fdZU/vRb50L64RT0YbRM+nFKrEA
	idABy6Op3M1DqH+3YGqaVRJlAN3SzWscrfPWq5fZMu72AjesX/y/FglsICTOXdtvrul2
	w1lA==
X-Received: by 10.112.50.138 with SMTP id c10mr29087946lbo.104.1357812863756; 
	Thu, 10 Jan 2013 02:14:23 -0800 (PST)
Received: from prime (a91-153-5-47.elisa-laajakaista.fi. [91.153.5.47])
	by mx.google.com with ESMTPS id ee5sm518856lbb.14.2013.01.10.02.14.21
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Thu, 10 Jan 2013 02:14:22 -0800 (PST)
Received: from cazfi by prime with local (Exim 4.80)
	(envelope-from <cazfi74@gmail.com>) id 1TtF9P-0007lu-E6
	for openembedded-core@lists.openembedded.org;
	Thu, 10 Jan 2013 12:14:19 +0200
From: Marko Lindqvist <cazfi74@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 10 Jan 2013 12:13:57 +0200
Message-Id: <cover.1357812474.git.cazfi74@gmail.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH 00/14] Prepare recipes for automake-1.13 (batch 2)
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
X-List-Received-Date: Thu, 10 Jan 2013 10:29:50 -0000

The following changes since commit 0cfec10c4c7b0597f0e0c8f85539d901861a2f83:

  guile: add explicit dependency to avoid parallel build issue (2013-01-09 13:41:12 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib cazfi/am13
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=cazfi/am13

Marko Lindqvist (14):
  dbus-glib: replace obsolete automake macros with working ones
  tslib: replace obsolete automake macros with working ones
  makedepend: replace obsolete automake macros with working ones
  alsa-lib: replace obsolete automake macros with working ones
  python: replace obsolete automake macros with working ones
  libogg: replace obsolete automake macros with working ones
  libmad: replace obsolete automake macros with working ones
  libvorbis: replace obsolete automake macros with working ones
  opensp: replace obsolete automake macros with working ones
  gconf: replace obsolete automake macros with working ones
  startup-notification: replace obsolete automake macros with working
    ones
  gtk+: replace obsolete automake macros with working ones
  gmp: replace obsolete automake macros with working ones
  bluez4: replace obsolete automake macros with working ones

 .../bluez4-4.101/obsolete_automake_macros.patch    |   14 ++++++++++++
 meta/recipes-connectivity/bluez/bluez4_4.101.bb    |    6 +++--
 .../dbus-glib-0.100/obsolete_automake_macros.patch |   15 +++++++++++++
 meta/recipes-core/dbus/dbus-glib.inc               |    1 +
 meta/recipes-core/dbus/dbus-glib_0.100.bb          |    2 +-
 .../opensp-1.5.2/obsolete_automake_macros.patch    |   15 +++++++++++++
 meta/recipes-devtools/opensp/opensp_1.5.2.bb       |    6 +++--
 .../obsolete_automake_macros.patch                 |   14 ++++++++++++
 meta/recipes-devtools/python/python-dbus_1.1.1.bb  |    6 +++--
 .../obsolete_automake_macros.patch                 |   23 ++++++++++++++++++++
 .../python/python-pygobject_2.27.91.bb             |    6 +++--
 .../gconf-3.2.5/obsolete_automake_macros.patch     |   14 ++++++++++++
 meta/recipes-gnome/gnome/gconf_3.2.5.bb            |    6 +++--
 .../gtk+-2.24.14/obsolete_automake_macros.patch    |   23 ++++++++++++++++++++
 meta/recipes-gnome/gtk+/gtk+_2.24.14.bb            |    1 +
 .../obsolete_automake_macros.patch                 |   15 +++++++++++++
 .../startup-notification_0.12.bb                   |    4 +++-
 .../tslib/tslib/obsolete_automake_macros.patch     |   15 +++++++++++++
 meta/recipes-graphics/tslib/tslib_1.0.bb           |    6 +++--
 .../obsolete_automake_macros.patch                 |   15 +++++++++++++
 .../recipes-graphics/xorg-util/makedepend_1.0.4.bb |    4 +++-
 .../alsa-lib-1.0.25/obsolete_automake_macros.patch |   15 +++++++++++++
 meta/recipes-multimedia/alsa/alsa-lib_1.0.25.bb    |    6 +++--
 .../libmad/libmad/obsolete_automake_macros.patch   |   14 ++++++++++++
 meta/recipes-multimedia/libmad/libmad_0.15.1b.bb   |    6 +++--
 .../libogg-1.3.0/obsolete_automake_macros.patch    |   14 ++++++++++++
 meta/recipes-multimedia/libogg/libogg_1.3.0.bb     |    6 +++--
 .../libvorbis-1.3.3/obsolete_automake_macros.patch |   15 +++++++++++++
 .../libvorbis/libvorbis_1.3.3.bb                   |    6 +++--
 .../gmp/gmp-5.1.0/obsolete_automake_macros.patch   |   13 +++++++++++
 meta/recipes-support/gmp/gmp_5.1.0.bb              |    3 +++
 31 files changed, 286 insertions(+), 23 deletions(-)
 create mode 100644 meta/recipes-connectivity/bluez/bluez4-4.101/obsolete_automake_macros.patch
 create mode 100644 meta/recipes-core/dbus/dbus-glib-0.100/obsolete_automake_macros.patch
 create mode 100644 meta/recipes-devtools/opensp/opensp-1.5.2/obsolete_automake_macros.patch
 create mode 100644 meta/recipes-devtools/python/python-dbus-1.1.1/obsolete_automake_macros.patch
 create mode 100644 meta/recipes-devtools/python/python-pygobject/obsolete_automake_macros.patch
 create mode 100644 meta/recipes-gnome/gnome/gconf-3.2.5/obsolete_automake_macros.patch
 create mode 100644 meta/recipes-gnome/gtk+/gtk+-2.24.14/obsolete_automake_macros.patch
 create mode 100644 meta/recipes-graphics/startup-notification/startup-notification-0.12/obsolete_automake_macros.patch
 create mode 100644 meta/recipes-graphics/tslib/tslib/obsolete_automake_macros.patch
 create mode 100644 meta/recipes-graphics/xorg-util/makedepend-1.0.4/obsolete_automake_macros.patch
 create mode 100644 meta/recipes-multimedia/alsa/alsa-lib-1.0.25/obsolete_automake_macros.patch
 create mode 100644 meta/recipes-multimedia/libmad/libmad/obsolete_automake_macros.patch
 create mode 100644 meta/recipes-multimedia/libogg/libogg-1.3.0/obsolete_automake_macros.patch
 create mode 100644 meta/recipes-multimedia/libvorbis/libvorbis-1.3.3/obsolete_automake_macros.patch
 create mode 100644 meta/recipes-support/gmp/gmp-5.1.0/obsolete_automake_macros.patch

-- 
1.7.10.4



