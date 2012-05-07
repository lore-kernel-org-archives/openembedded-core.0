Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SRULk-0004ej-3F
	for openembedded-core@lists.openembedded.org;
	Mon, 07 May 2012 22:16:04 +0200
Received: by wibhj13 with SMTP id hj13so3239547wib.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 May 2012 13:06:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer;
	bh=PACxUxWC7+RMaaT8H/G8ii/SRaNkLqk8AzoNoJlWB1g=;
	b=T9d1mzRbcUDV8vf1j3mCoxaz16x/cXHPerp/IqnkthhD1jtf3wiU7RLu4b12OUmOOu
	zVC/XrBpyP4DNhA2fVH50C1FsOlEAksX6f4q2JAcNJPjLOIIgcgkLnIeKqOsbKAZU87s
	YRqh3b4qHILi8oZT4fSAfehxEbGPYgQqnW5i6C7O1imvUu+mPLhHlXXeXn/L9lV9Ecdm
	wJ/dqqvELbZerYhyOt2k1PT0ic93HB2pkoWYDgpcMxyfd8SW+xQ1JqBNXAMIQ9SfMAtg
	SemlYqMrUhgI4AFLH1iEytdlA+1s00cOU5Y7tYYgLCEh92ZiG+ph7yTth4wMfXgoFH7a
	KWYw==
Received: by 10.180.101.230 with SMTP id fj6mr38389723wib.13.1336421173492;
	Mon, 07 May 2012 13:06:13 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id ff9sm23961675wib.2.2012.05.07.13.06.11
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 07 May 2012 13:06:12 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  7 May 2012 22:05:59 +0200
Message-Id: <cover.1336417061.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
Subject: [PATCH 0/6] cleanup old stuff
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 07 May 2012 20:16:04 -0000

I haven't tried to build world for all archs, but git grep shows 
that this stuff wasn't used so it should be safe to remove it.

The following changes since commit 2929e7d590862d9649458c90804e79a1dce40423:

  glib-2.0: Fix issues with libelf dependency creeping in (2012-05-07 10:53:24 +0100)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib jansa/pull
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=jansa/pull

Martin Jansa (6):
  dbus-glib: bump PR to rebuild after glib upgrade
  evolution-data-server: delete unused patch parallelmake.patch
  evolution-data-server: delete old 2.20.0 version
  meta-demoapps: delete from oe-core
  libgdbus: delete from oe-core
  libsoup: delete from oe-core

 .../farsight/farsight2_0.0.9.bb                    |   23 -
 .../recipes-connectivity/farsight/libnice_0.0.6.bb |   23 -
 .../libetpan/files/cxx-is-here.patch               |   20 -
 .../recipes-connectivity/libetpan/libetpan_0.54.bb |   20 -
 .../loudmouth/loudmouth_1.4.0.bb                   |   10 -
 .../openswan/openswan-2.4.7/installflags.patch     |   15 -
 .../openswan-2.4.7/ld-library-path-breakage.patch  |   28 -
 .../openswan-2.4.7/openswan-2.4.7-gentoo.patch     |  379 -------
 .../openswan/openswan_2.4.7.bb                     |   36 -
 .../opensync/libopensync-0.37/build-in-src.patch   |   20 -
 .../opensync/libopensync-0.37/cmake.patch          |   19 -
 .../libopensync-0.37/no-python-check.patch         |   18 -
 .../libopensync-plugin-evolution2/0.37-fixes.patch |   25 -
 .../opensync/libopensync-plugin-evolution2_0.36.bb |    8 -
 .../opensync/libopensync-plugin-file_0.37.bb       |    2 -
 .../libopensync-plugin-google-calendar_0.36.bb     |    2 -
 .../opensync/libopensync-plugin-irmc_0.36.bb       |    4 -
 .../libopensync-plugin-syncml/fixerror.patch       |   15 -
 .../opensync/libopensync-plugin-syncml_0.38.bb     |    8 -
 .../opensync/libopensync-plugin-vformat_0.37.bb    |    4 -
 .../opensync/libopensync-plugin_0.36.inc           |   11 -
 .../opensync/libopensync_0.37.bb                   |   26 -
 .../recipes-connectivity/opensync/libsync_git.bb   |   22 -
 .../opensync/libsyncml/build-in-src.patch          |   21 -
 .../opensync/libsyncml_0.5.4.bb                    |   17 -
 .../opensync/msynctool_0.38.bb                     |   20 -
 .../telepathy/empathy/no-gnome-doc.patch           |   41 -
 .../telepathy/empathy_2.26.1.bb                    |   29 -
 .../telepathy/telepathy-farsight_0.0.7.bb          |   16 -
 .../telepathy/telepathy-gabble/gabble.manager      |   33 -
 .../telepathy/telepathy-gabble_0.7.8.bb            |   18 -
 .../wbxml/files/no-doc-install.patch               |   17 -
 .../recipes-connectivity/wbxml/wbxml2_0.9.2.bb     |   24 -
 .../recipes-gnome/abiword/abiword-2.5.inc          |   64 --
 .../abiword/abiword-embedded_2.5.2.bb              |   12 -
 meta-demoapps/recipes-gnome/abiword/abiword.inc    |   64 --
 .../recipes-gnome/abiword/abiword_2.5.2.bb         |    5 -
 meta-demoapps/recipes-gnome/abiword/abiword_svn.bb |   10 -
 .../gcalctool/gcalctool/fix-includedir.patch       |   33 -
 .../recipes-gnome/gcalctool/gcalctool_5.7.32.bb    |   13 -
 .../recipes-gnome/gcalctool/gcalctool_5.8.17.bb    |   12 -
 .../gnome/gnome-settings-daemon/configurefix.patch |   32 -
 .../gnome-settings-daemon/desktop-moblin.patch     |   13 -
 ...-settings-daemon-2.24.0-catch-deviceadded.patch |   21 -
 .../gnome-settings-daemon-fix-gthread.patch        |   15 -
 .../gnome-settings-daemon/mojito-cleanup.patch     |   76 --
 .../gnome/gnome-settings-daemon/mount-plugin.patch |  620 ----------
 .../gnome/gnome-settings-daemon_2.26.1.bb          |   25 -
 .../30f29e7d8e1b67c40cd18a7155ba30c4382692d5.patch |   22 -
 .../recipes-gnome/gnome/gnome-terminal_2.26.3.bb   |   16 -
 .../recipes-gnome/gnome/libgnomecanvas_2.20.0.bb   |   14 -
 .../recipes-gnome/gnome/libgnomekbd_2.26.0.bb      |   14 -
 .../recipes-gnome/libgsf/libgsf_1.14.5.bb          |   25 -
 .../recipes-gnome/libgtkstylus/files/gtkstylus.sh  |    5 -
 .../recipes-gnome/libgtkstylus/libgtkstylus_0.5.bb |   24 -
 .../recipes-gnome/wv/wv-1.2.0/pkgconfig.patch      |   15 -
 meta-demoapps/recipes-gnome/wv/wv_1.2.0.bb         |   14 -
 meta-demoapps/recipes-graphics/clutter/tidy.inc    |   20 -
 .../recipes-graphics/clutter/tidy/autofoo.patch    |   13 -
 .../clutter/tidy/tidy-enable-tests.patch           |   22 -
 meta-demoapps/recipes-graphics/clutter/tidy_git.bb |   14 -
 .../libxklavier/libxklavier/pkgconfigfix.patch     |   17 -
 .../libxklavier/libxklavier_3.9.bb                 |   11 -
 .../pong-clock/pong-clock/pong-clock-no-flicker.c  |  410 -------
 .../recipes-graphics/pong-clock/pong-clock_1.0.bb  |   16 -
 .../recipes-graphics/xorg-app/xbacklight_1.1.bb    |    4 -
 .../recipes-graphics/xorg-app/xeyes_1.0.1.bb       |    4 -
 .../recipes-graphics/xorg-app/xrdb/60XDefaults.sh  |    3 -
 .../recipes-graphics/xorg-app/xrdb_1.0.5.bb        |   14 -
 .../xorg-lib/liblbxutil/mkg3states.patch           |   65 --
 .../recipes-graphics/xorg-lib/liblbxutil_1.1.0.bb  |   11 -
 .../recipes-graphics/xorg-lib/libxaw_1.0.5.bb      |   21 -
 .../recipes-graphics/xorg-lib/libxevie_1.0.2.bb    |    8 -
 .../recipes-graphics/xorg-lib/libxkbui_1.0.2.bb    |    8 -
 .../xorg-proto/xproxymanagementprotocol_1.0.3.bb   |    5 -
 .../recipes-graphics/xournal/files/ldflags.patch   |   17 -
 .../xournal/files/no-printing.diff                 |  180 ---
 .../recipes-graphics/xournal/xournal_0.2.bb        |   12 -
 .../recipes-sato/claws-mail/claws-mail.inc         |   58 -
 .../recipes-sato/claws-mail/claws-mail_2.9.1.bb    |    1 -
 .../claws-plugin-gtkhtml2-viewer_0.15.bb           |   14 -
 .../claws-mail/claws-plugin-maildir_0.24.4.bb      |   14 -
 .../claws-mail/claws-plugin-mailmbox_1.13.bb       |   14 -
 .../claws-mail/claws-plugin-rssyl_0.13.bb          |   14 -
 .../recipes-sato/claws-mail/files/desktop.patch    |   21 -
 .../recipes-sato/claws-mail/files/fix-build.patch  |   26 -
 .../claws-mail/files/owl-window-menu.patch         | 1011 -----------------
 .../claws-mail/files/streamline-ui.patch           | 1010 -----------------
 .../clipboard-manager/clipboard-manager_0.6.4.bb   |   33 -
 .../clipboard-manager/files/daemonize.patch        |   46 -
 .../clipboard-manager/files/makefile.patch         |   20 -
 .../clipboard-manager/files/script.patch           |   41 -
 .../epdfview/epdfview/epdfview-ui-print.xml        |   12 -
 .../recipes-sato/epdfview/epdfview/epdfview-ui.xml |   57 -
 .../epdfview/epdfview/epdfview.desktop             |   10 -
 .../recipes-sato/epdfview/epdfview/owl-menus.patch |  327 ------
 .../recipes-sato/epdfview/epdfview_0.1.6.bb        |   21 -
 .../recipes-sato/epdfview/epdfview_0.1.7.bb        |   21 -
 .../recipes-sato/kf/files/fix-configure.patch      |   27 -
 .../recipes-sato/kf/files/fix-desktop-file.patch   |   22 -
 meta-demoapps/recipes-sato/kf/files/gcc4.patch     |   32 -
 meta-demoapps/recipes-sato/kf/kf_0.5.4.1.bb        |   16 -
 .../matchbox-themes-extra_0.3.bb                   |   28 -
 .../matchbox-themes-extra_git.bb                   |   33 -
 .../recipes-sato/matchbox-themes-gtk/files/gtkrc   |    1 -
 .../matchbox-themes-gtk/matchbox-themes-gtk.bb     |   17 -
 .../recipes-support/iso-codes/iso-codes_3.3.bb     |   13 -
 .../libfribidi/files/libtool-update.patch          |   13 -
 .../libfribidi/libfribidi_0.10.4.bb                |   23 -
 .../openobex/files/disable-cable-test.patch        |   17 -
 .../openobex/files/libusb_crosscompile_check.patch |   15 -
 .../recipes-support/openobex/openobex_1.5.bb       |   23 -
 .../recipes-support/poppler/poppler-data_0.1.bb    |   16 -
 .../recipes-support/poppler/poppler-fpu.inc        |    6 -
 meta-demoapps/recipes-support/poppler/poppler.inc  |   18 -
 .../recipes-support/poppler/poppler_0.9.2.bb       |    2 -
 meta/recipes-core/dbus/dbus-glib_0.98.bb           |    2 +-
 .../evolution-data-server-2.20.0/iconv-detect.h    |    5 -
 .../no_iconv_test.patch                            |   32 -
 .../evolution-data-server-2.20.0/oh-contact.patch  |  201 ----
 .../eds/evolution-data-server/parallelmake.patch   |  203 ----
 .../eds/evolution-data-server_2.20.0.bb            |   96 --
 .../libgdbus/libgdbus/fix-for-new-glib.patch       |   20 -
 meta/recipes-support/libgdbus/libgdbus_git.bb      |   20 -
 .../dprintf_conflict_with_eglibc.patch             | 1186 --------------------
 .../libsoup/libsoup-2.2.105/fix-for-new-glib.patch |   85 --
 meta/recipes-support/libsoup/libsoup_2.2.105.bb    |   20 -
 127 files changed, 1 insertions(+), 7975 deletions(-)
 delete mode 100644 meta-demoapps/recipes-connectivity/farsight/farsight2_0.0.9.bb
 delete mode 100644 meta-demoapps/recipes-connectivity/farsight/libnice_0.0.6.bb
 delete mode 100644 meta-demoapps/recipes-connectivity/libetpan/files/cxx-is-here.patch
 delete mode 100644 meta-demoapps/recipes-connectivity/libetpan/libetpan_0.54.bb
 delete mode 100644 meta-demoapps/recipes-connectivity/loudmouth/loudmouth_1.4.0.bb
 delete mode 100644 meta-demoapps/recipes-connectivity/openswan/openswan-2.4.7/installflags.patch
 delete mode 100644 meta-demoapps/recipes-connectivity/openswan/openswan-2.4.7/ld-library-path-breakage.patch
 delete mode 100644 meta-demoapps/recipes-connectivity/openswan/openswan-2.4.7/openswan-2.4.7-gentoo.patch
 delete mode 100644 meta-demoapps/recipes-connectivity/openswan/openswan_2.4.7.bb
 delete mode 100644 meta-demoapps/recipes-connectivity/opensync/libopensync-0.37/build-in-src.patch
 delete mode 100644 meta-demoapps/recipes-connectivity/opensync/libopensync-0.37/cmake.patch
 delete mode 100644 meta-demoapps/recipes-connectivity/opensync/libopensync-0.37/no-python-check.patch
 delete mode 100644 meta-demoapps/recipes-connectivity/opensync/libopensync-plugin-evolution2/0.37-fixes.patch
 delete mode 100644 meta-demoapps/recipes-connectivity/opensync/libopensync-plugin-evolution2_0.36.bb
 delete mode 100644 meta-demoapps/recipes-connectivity/opensync/libopensync-plugin-file_0.37.bb
 delete mode 100644 meta-demoapps/recipes-connectivity/opensync/libopensync-plugin-google-calendar_0.36.bb
 delete mode 100644 meta-demoapps/recipes-connectivity/opensync/libopensync-plugin-irmc_0.36.bb
 delete mode 100644 meta-demoapps/recipes-connectivity/opensync/libopensync-plugin-syncml/fixerror.patch
 delete mode 100644 meta-demoapps/recipes-connectivity/opensync/libopensync-plugin-syncml_0.38.bb
 delete mode 100644 meta-demoapps/recipes-connectivity/opensync/libopensync-plugin-vformat_0.37.bb
 delete mode 100644 meta-demoapps/recipes-connectivity/opensync/libopensync-plugin_0.36.inc
 delete mode 100644 meta-demoapps/recipes-connectivity/opensync/libopensync_0.37.bb
 delete mode 100644 meta-demoapps/recipes-connectivity/opensync/libsync_git.bb
 delete mode 100644 meta-demoapps/recipes-connectivity/opensync/libsyncml/build-in-src.patch
 delete mode 100644 meta-demoapps/recipes-connectivity/opensync/libsyncml_0.5.4.bb
 delete mode 100644 meta-demoapps/recipes-connectivity/opensync/msynctool_0.38.bb
 delete mode 100644 meta-demoapps/recipes-connectivity/telepathy/empathy/no-gnome-doc.patch
 delete mode 100644 meta-demoapps/recipes-connectivity/telepathy/empathy_2.26.1.bb
 delete mode 100644 meta-demoapps/recipes-connectivity/telepathy/telepathy-farsight_0.0.7.bb
 delete mode 100644 meta-demoapps/recipes-connectivity/telepathy/telepathy-gabble/gabble.manager
 delete mode 100644 meta-demoapps/recipes-connectivity/telepathy/telepathy-gabble_0.7.8.bb
 delete mode 100644 meta-demoapps/recipes-connectivity/wbxml/files/no-doc-install.patch
 delete mode 100644 meta-demoapps/recipes-connectivity/wbxml/wbxml2_0.9.2.bb
 delete mode 100644 meta-demoapps/recipes-gnome/abiword/abiword-2.5.inc
 delete mode 100644 meta-demoapps/recipes-gnome/abiword/abiword-embedded_2.5.2.bb
 delete mode 100644 meta-demoapps/recipes-gnome/abiword/abiword.inc
 delete mode 100644 meta-demoapps/recipes-gnome/abiword/abiword_2.5.2.bb
 delete mode 100644 meta-demoapps/recipes-gnome/abiword/abiword_svn.bb
 delete mode 100644 meta-demoapps/recipes-gnome/gcalctool/gcalctool/fix-includedir.patch
 delete mode 100644 meta-demoapps/recipes-gnome/gcalctool/gcalctool_5.7.32.bb
 delete mode 100644 meta-demoapps/recipes-gnome/gcalctool/gcalctool_5.8.17.bb
 delete mode 100644 meta-demoapps/recipes-gnome/gnome/gnome-settings-daemon/configurefix.patch
 delete mode 100644 meta-demoapps/recipes-gnome/gnome/gnome-settings-daemon/desktop-moblin.patch
 delete mode 100644 meta-demoapps/recipes-gnome/gnome/gnome-settings-daemon/gnome-settings-daemon-2.24.0-catch-deviceadded.patch
 delete mode 100644 meta-demoapps/recipes-gnome/gnome/gnome-settings-daemon/gnome-settings-daemon-fix-gthread.patch
 delete mode 100644 meta-demoapps/recipes-gnome/gnome/gnome-settings-daemon/mojito-cleanup.patch
 delete mode 100644 meta-demoapps/recipes-gnome/gnome/gnome-settings-daemon/mount-plugin.patch
 delete mode 100644 meta-demoapps/recipes-gnome/gnome/gnome-settings-daemon_2.26.1.bb
 delete mode 100644 meta-demoapps/recipes-gnome/gnome/gnome-terminal/30f29e7d8e1b67c40cd18a7155ba30c4382692d5.patch
 delete mode 100644 meta-demoapps/recipes-gnome/gnome/gnome-terminal_2.26.3.bb
 delete mode 100644 meta-demoapps/recipes-gnome/gnome/libgnomecanvas_2.20.0.bb
 delete mode 100644 meta-demoapps/recipes-gnome/gnome/libgnomekbd_2.26.0.bb
 delete mode 100644 meta-demoapps/recipes-gnome/libgsf/libgsf_1.14.5.bb
 delete mode 100644 meta-demoapps/recipes-gnome/libgtkstylus/files/gtkstylus.sh
 delete mode 100644 meta-demoapps/recipes-gnome/libgtkstylus/libgtkstylus_0.5.bb
 delete mode 100644 meta-demoapps/recipes-gnome/wv/wv-1.2.0/pkgconfig.patch
 delete mode 100644 meta-demoapps/recipes-gnome/wv/wv_1.2.0.bb
 delete mode 100644 meta-demoapps/recipes-graphics/clutter/tidy.inc
 delete mode 100644 meta-demoapps/recipes-graphics/clutter/tidy/autofoo.patch
 delete mode 100644 meta-demoapps/recipes-graphics/clutter/tidy/tidy-enable-tests.patch
 delete mode 100644 meta-demoapps/recipes-graphics/clutter/tidy_git.bb
 delete mode 100644 meta-demoapps/recipes-graphics/libxklavier/libxklavier/pkgconfigfix.patch
 delete mode 100644 meta-demoapps/recipes-graphics/libxklavier/libxklavier_3.9.bb
 delete mode 100644 meta-demoapps/recipes-graphics/pong-clock/pong-clock/pong-clock-no-flicker.c
 delete mode 100644 meta-demoapps/recipes-graphics/pong-clock/pong-clock_1.0.bb
 delete mode 100644 meta-demoapps/recipes-graphics/xorg-app/xbacklight_1.1.bb
 delete mode 100644 meta-demoapps/recipes-graphics/xorg-app/xeyes_1.0.1.bb
 delete mode 100644 meta-demoapps/recipes-graphics/xorg-app/xrdb/60XDefaults.sh
 delete mode 100644 meta-demoapps/recipes-graphics/xorg-app/xrdb_1.0.5.bb
 delete mode 100644 meta-demoapps/recipes-graphics/xorg-lib/liblbxutil/mkg3states.patch
 delete mode 100644 meta-demoapps/recipes-graphics/xorg-lib/liblbxutil_1.1.0.bb
 delete mode 100644 meta-demoapps/recipes-graphics/xorg-lib/libxaw_1.0.5.bb
 delete mode 100644 meta-demoapps/recipes-graphics/xorg-lib/libxevie_1.0.2.bb
 delete mode 100644 meta-demoapps/recipes-graphics/xorg-lib/libxkbui_1.0.2.bb
 delete mode 100644 meta-demoapps/recipes-graphics/xorg-proto/xproxymanagementprotocol_1.0.3.bb
 delete mode 100644 meta-demoapps/recipes-graphics/xournal/files/ldflags.patch
 delete mode 100644 meta-demoapps/recipes-graphics/xournal/files/no-printing.diff
 delete mode 100644 meta-demoapps/recipes-graphics/xournal/xournal_0.2.bb
 delete mode 100644 meta-demoapps/recipes-sato/claws-mail/claws-mail.inc
 delete mode 100644 meta-demoapps/recipes-sato/claws-mail/claws-mail_2.9.1.bb
 delete mode 100644 meta-demoapps/recipes-sato/claws-mail/claws-plugin-gtkhtml2-viewer_0.15.bb
 delete mode 100644 meta-demoapps/recipes-sato/claws-mail/claws-plugin-maildir_0.24.4.bb
 delete mode 100644 meta-demoapps/recipes-sato/claws-mail/claws-plugin-mailmbox_1.13.bb
 delete mode 100644 meta-demoapps/recipes-sato/claws-mail/claws-plugin-rssyl_0.13.bb
 delete mode 100644 meta-demoapps/recipes-sato/claws-mail/files/desktop.patch
 delete mode 100644 meta-demoapps/recipes-sato/claws-mail/files/fix-build.patch
 delete mode 100644 meta-demoapps/recipes-sato/claws-mail/files/owl-window-menu.patch
 delete mode 100644 meta-demoapps/recipes-sato/claws-mail/files/streamline-ui.patch
 delete mode 100644 meta-demoapps/recipes-sato/clipboard-manager/clipboard-manager_0.6.4.bb
 delete mode 100644 meta-demoapps/recipes-sato/clipboard-manager/files/daemonize.patch
 delete mode 100644 meta-demoapps/recipes-sato/clipboard-manager/files/makefile.patch
 delete mode 100644 meta-demoapps/recipes-sato/clipboard-manager/files/script.patch
 delete mode 100644 meta-demoapps/recipes-sato/epdfview/epdfview/epdfview-ui-print.xml
 delete mode 100644 meta-demoapps/recipes-sato/epdfview/epdfview/epdfview-ui.xml
 delete mode 100644 meta-demoapps/recipes-sato/epdfview/epdfview/epdfview.desktop
 delete mode 100644 meta-demoapps/recipes-sato/epdfview/epdfview/owl-menus.patch
 delete mode 100644 meta-demoapps/recipes-sato/epdfview/epdfview_0.1.6.bb
 delete mode 100644 meta-demoapps/recipes-sato/epdfview/epdfview_0.1.7.bb
 delete mode 100644 meta-demoapps/recipes-sato/kf/files/fix-configure.patch
 delete mode 100644 meta-demoapps/recipes-sato/kf/files/fix-desktop-file.patch
 delete mode 100644 meta-demoapps/recipes-sato/kf/files/gcc4.patch
 delete mode 100644 meta-demoapps/recipes-sato/kf/kf_0.5.4.1.bb
 delete mode 100644 meta-demoapps/recipes-sato/matchbox-themes-extra/matchbox-themes-extra_0.3.bb
 delete mode 100644 meta-demoapps/recipes-sato/matchbox-themes-extra/matchbox-themes-extra_git.bb
 delete mode 100644 meta-demoapps/recipes-sato/matchbox-themes-gtk/files/gtkrc
 delete mode 100644 meta-demoapps/recipes-sato/matchbox-themes-gtk/matchbox-themes-gtk.bb
 delete mode 100644 meta-demoapps/recipes-support/iso-codes/iso-codes_3.3.bb
 delete mode 100644 meta-demoapps/recipes-support/libfribidi/files/libtool-update.patch
 delete mode 100644 meta-demoapps/recipes-support/libfribidi/libfribidi_0.10.4.bb
 delete mode 100644 meta-demoapps/recipes-support/openobex/files/disable-cable-test.patch
 delete mode 100644 meta-demoapps/recipes-support/openobex/files/libusb_crosscompile_check.patch
 delete mode 100644 meta-demoapps/recipes-support/openobex/openobex_1.5.bb
 delete mode 100644 meta-demoapps/recipes-support/poppler/poppler-data_0.1.bb
 delete mode 100644 meta-demoapps/recipes-support/poppler/poppler-fpu.inc
 delete mode 100644 meta-demoapps/recipes-support/poppler/poppler.inc
 delete mode 100644 meta-demoapps/recipes-support/poppler/poppler_0.9.2.bb
 delete mode 100644 meta/recipes-sato/eds/evolution-data-server-2.20.0/iconv-detect.h
 delete mode 100644 meta/recipes-sato/eds/evolution-data-server-2.20.0/no_iconv_test.patch
 delete mode 100644 meta/recipes-sato/eds/evolution-data-server-2.20.0/oh-contact.patch
 delete mode 100644 meta/recipes-sato/eds/evolution-data-server/parallelmake.patch
 delete mode 100644 meta/recipes-sato/eds/evolution-data-server_2.20.0.bb
 delete mode 100644 meta/recipes-support/libgdbus/libgdbus/fix-for-new-glib.patch
 delete mode 100644 meta/recipes-support/libgdbus/libgdbus_git.bb
 delete mode 100644 meta/recipes-support/libsoup/libsoup-2.2.105/dprintf_conflict_with_eglibc.patch
 delete mode 100644 meta/recipes-support/libsoup/libsoup-2.2.105/fix-for-new-glib.patch
 delete mode 100644 meta/recipes-support/libsoup/libsoup_2.2.105.bb

-- 
1.7.8.6



