Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SRUMK-0004jL-7Y
	for openembedded-core@lists.openembedded.org;
	Mon, 07 May 2012 22:16:40 +0200
Received: by mail-wi0-f177.google.com with SMTP id hj13so3389853wib.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 May 2012 13:06:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references:mime-version:content-type
	:content-transfer-encoding;
	bh=KuxgphN2NAOWPd5ro/Gj2MGvOFQDmWS736WUqO2AhAs=;
	b=UJmidt7S9MFzBnuhvo45GxEnFLJrltowkV9vI1uNbk/uniuctY3Wh4kcvbiCXv9eRB
	PgZb0MUG1BP1upt3DTDNuOewBp6/RAabqhX4LOAnVaLEofV/r/pZUre59HEKLouMvwS3
	CBWgqZT1Mb9/Dd17C4PGLhdMb14h5q6i0j5t3RP7+EYw1ytIvZ1iYKkZ41H3neIGEWE0
	yunyohgrVZvp5xlwmgswS+L8QdgGhTPMDZZ4Wc9HO1iBhIO2IofBv8+qAMy46Vrc5Y3n
	zltPkwhHcuD919k8Likd5PQq/k0c3zhB+SvZ8L8BK6ymZZsyNDoBMQ6EjvsfwHyjounH
	dHcw==
Received: by 10.180.86.197 with SMTP id r5mr15893809wiz.21.1336421211691;
	Mon, 07 May 2012 13:06:51 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id fm1sm23519378wib.10.2012.05.07.13.06.41
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 07 May 2012 13:06:50 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  7 May 2012 22:06:03 +0200
Message-Id: <66280eb1d82340406be279fa034dc35d014f6c78.1336417061.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
In-Reply-To: <cover.1336417061.git.Martin.Jansa@gmail.com>
References: <cover.1336417061.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1336417061.git.Martin.Jansa@gmail.com>
References: <cover.1336417061.git.Martin.Jansa@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 4/6] meta-demoapps: delete from oe-core
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
X-List-Received-Date: Mon, 07 May 2012 20:16:40 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* as suggested:
  http://lists.linuxtogo.org/pipermail/openembedded-core/2012-May/022059.html

* if you're looking for recipe examples you can find it in git history, but
  better look first in layers like meta-oe and others from
  http://www.openembedded.org/wiki/LayerIndex and oe-classic

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../farsight/farsight2_0.0.9.bb                    |   23 -
 .../recipes-connectivity/farsight/libnice_0.0.6.bb |   23 -
 .../libetpan/files/cxx-is-here.patch               |   20 -
 .../recipes-connectivity/libetpan/libetpan_0.54.bb |   20 -
 .../loudmouth/loudmouth_1.4.0.bb                   |   10 -
 .../openswan/openswan-2.4.7/installflags.patch     |   15 -
 .../openswan-2.4.7/ld-library-path-breakage.patch  |   28 -
 .../openswan-2.4.7/openswan-2.4.7-gentoo.patch     |  379 --------
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
 .../gnome/gnome-settings-daemon/mount-plugin.patch |  620 ------------
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
 .../pong-clock/pong-clock/pong-clock-no-flicker.c  |  410 --------
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
 .../xournal/files/no-printing.diff                 |  180 ----
 .../recipes-graphics/xournal/xournal_0.2.bb        |   12 -
 .../recipes-sato/claws-mail/claws-mail.inc         |   58 --
 .../recipes-sato/claws-mail/claws-mail_2.9.1.bb    |    1 -
 .../claws-plugin-gtkhtml2-viewer_0.15.bb           |   14 -
 .../claws-mail/claws-plugin-maildir_0.24.4.bb      |   14 -
 .../claws-mail/claws-plugin-mailmbox_1.13.bb       |   14 -
 .../claws-mail/claws-plugin-rssyl_0.13.bb          |   14 -
 .../recipes-sato/claws-mail/files/desktop.patch    |   21 -
 .../recipes-sato/claws-mail/files/fix-build.patch  |   26 -
 .../claws-mail/files/owl-window-menu.patch         | 1011 --------------------
 .../claws-mail/files/streamline-ui.patch           | 1010 -------------------
 .../clipboard-manager/clipboard-manager_0.6.4.bb   |   33 -
 .../clipboard-manager/files/daemonize.patch        |   46 -
 .../clipboard-manager/files/makefile.patch         |   20 -
 .../clipboard-manager/files/script.patch           |   41 -
 .../epdfview/epdfview/epdfview-ui-print.xml        |   12 -
 .../recipes-sato/epdfview/epdfview/epdfview-ui.xml |   57 --
 .../epdfview/epdfview/epdfview.desktop             |   10 -
 .../recipes-sato/epdfview/epdfview/owl-menus.patch |  327 -------
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
 116 files changed, 0 insertions(+), 6106 deletions(-)
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

diff --git a/meta-demoapps/recipes-connectivity/farsight/farsight2_0.0.9.bb b/meta-demoapps/recipes-connectivity/farsight/farsight2_0.0.9.bb
deleted file mode 100644
index ee0ce8a..0000000
--- a/meta-demoapps/recipes-connectivity/farsight/farsight2_0.0.9.bb
+++ /dev/null
@@ -1,23 +0,0 @@
-DESCRIPTION = "FarSight is an audio/video conferencing framework specifically designed for Instant Messengers."
-HOMEPAGE = "http://farsight.sf.net"
-SRC_URI = "http://farsight.freedesktop.org/releases/farsight2/${BPN}-${PV}.tar.gz"
-LICENSE = "LGPLv2.1"
-DEPENDS = "libnice glib-2.0 libxml2 zlib dbus gstreamer gst-plugins-base"
-
-inherit autotools
-
-PR = "r2"
-
-EXTRA_OECONF = " \
-  --disable-debug \
-  --disable-gtk-doc \
-  --disable-python \
-"
-
-FILES_${PN} += "${libdir}/*/*.so"
-FILES_${PN}-dev += "${libdir}/f*/*a ${libdir}/g*/*a"
-FILES_${PN}-dbg += "${libdir}/*/.debug"
-
-
-
-
diff --git a/meta-demoapps/recipes-connectivity/farsight/libnice_0.0.6.bb b/meta-demoapps/recipes-connectivity/farsight/libnice_0.0.6.bb
deleted file mode 100644
index 30cc7a1..0000000
--- a/meta-demoapps/recipes-connectivity/farsight/libnice_0.0.6.bb
+++ /dev/null
@@ -1,23 +0,0 @@
-SUMMARY = "IETF draft Interactice Connectivity Establishment standard"
-DESCRIPTION = "Libnice is an implementation of the IETF's draft Interactice Connectivity Establishment standard (ICE)."
-HOMEPAGE = "http://nice.freedesktop.org/wiki/"
-SRC_URI = "http://nice.freedesktop.org/releases/libnice-${PV}.tar.gz"
-
-LICENSE = "LGPL/MPL"
-DEPENDS = "glib-2.0 gstreamer"
-
-inherit autotools
-
-FILES_${PN} += "${libdir}/gstreamer-0.10/*.so"
-FILES_${PN}-dev += "${libdir}/gstreamer-0.10/*a"
-FILES_${PN}-dbg += "${libdir}/gstreamer-0.10/.debug"
-
-do_compile_append() {
-        for i in $(find ${S} -name "*.pc") ; do
-            sed -i -e s:${STAGING_DIR_TARGET}::g \
-                   -e s:/${TARGET_SYS}::g \
-                      $i
-        done
-}
-
-
diff --git a/meta-demoapps/recipes-connectivity/libetpan/files/cxx-is-here.patch b/meta-demoapps/recipes-connectivity/libetpan/files/cxx-is-here.patch
deleted file mode 100644
index 03d8da6..0000000
--- a/meta-demoapps/recipes-connectivity/libetpan/files/cxx-is-here.patch
+++ /dev/null
@@ -1,20 +0,0 @@
-Upstream-Status: Inappropriate [configuration]
-
----
- configure.ac |    1 +
- 1 file changed, 1 insertion(+)
-
---- libetpan-0.54.orig/configure.ac
-+++ libetpan-0.54/configure.ac
-@@ -104,10 +104,11 @@ if test "$have_w32_system" = yes; then
- fi
- AM_CONDITIONAL(HAVE_MINGW32_SYSTEM, test "$have_w32_system" = yes)
- 
- # Check the C compiler.
- AC_PROG_CC
-+AC_PROG_CXX
- 
- # Compiler flags.
- AC_ARG_ENABLE(debug,   [  --enable-debug          setup flags (gcc) for debugging (default=no)],
- if test "x$GCC" = xyes; then
-   CFLAGS="$CFLAGS -O2 -g"
diff --git a/meta-demoapps/recipes-connectivity/libetpan/libetpan_0.54.bb b/meta-demoapps/recipes-connectivity/libetpan/libetpan_0.54.bb
deleted file mode 100644
index 9b69471..0000000
--- a/meta-demoapps/recipes-connectivity/libetpan/libetpan_0.54.bb
+++ /dev/null
@@ -1,20 +0,0 @@
-SUMMARY = "Library for communicating with mail and news services"
-DESCRIPTION = "libetpan is a library for communicating with mail and news servers. \
-It supports the protocols SMTP, POP3, IMAP and NNTP."
-HOMEPAGE = "http://www.etpan.org"
-SECTION = "libs"
-DEPENDS = "curl expat gnutls"
-LICENSE = "BSD"
-PR = "r1"
-
-SRC_URI = "${SOURCEFORGE_MIRROR}/libetpan/libetpan-${PV}.tar.gz \
-           file://cxx-is-here.patch;patch=1"
-
-inherit autotools pkgconfig gettext binconfig
-
-EXTRA_OECONF = "--without-openssl --with-gnutls --disable-db"
-
-PARALLEL_MAKE = ""
-
-FILES_${PN} = "${libdir}/lib*.so.*"
-FILES_${PN}-dev = "${bindir} ${includedir} ${libdir}/lib*.so ${libdir}/*.la ${libdir}/*.a ${libdir}/pkgconfig"
diff --git a/meta-demoapps/recipes-connectivity/loudmouth/loudmouth_1.4.0.bb b/meta-demoapps/recipes-connectivity/loudmouth/loudmouth_1.4.0.bb
deleted file mode 100644
index b6af11d..0000000
--- a/meta-demoapps/recipes-connectivity/loudmouth/loudmouth_1.4.0.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-SUMMARY = "XMPP/Jabber library"
-DESCRIPTION = "Loudmouth is a lightweight and easy-to-use C library for programming with the XMPP/Jabber protocol."
-HOMEPAGE = "http://www.loudmouth-project.org/"
-LICENSE = "LGPL"
-DEPENDS = "glib-2.0 gnutls libcheck"
-PR = "r2"
-
-SRC_URI = "http://ftp.imendio.com/pub/imendio/${BPN}/src/${BPN}-${PV}.tar.bz2"
-
-inherit autotools pkgconfig
diff --git a/meta-demoapps/recipes-connectivity/openswan/openswan-2.4.7/installflags.patch b/meta-demoapps/recipes-connectivity/openswan/openswan-2.4.7/installflags.patch
deleted file mode 100644
index ffebf2b..0000000
--- a/meta-demoapps/recipes-connectivity/openswan/openswan-2.4.7/installflags.patch
+++ /dev/null
@@ -1,15 +0,0 @@
-Upstream-Status: Inappropriate [configuration]
-
-Index: openswan-2.4.7/Makefile.inc
-===================================================================
---- openswan-2.4.7.orig/Makefile.inc	2006-12-25 18:05:40.608503250 +0100
-+++ openswan-2.4.7/Makefile.inc	2006-12-25 18:06:39.028154250 +0100
-@@ -158,7 +158,7 @@
- # how backup names are composed.
- # Note that the install procedures will never overwrite an existing config
- # file, which is why -b is not specified for them.
--INSTBINFLAGS=-b --suffix=.old
-+INSTBINFLAGS=
- INSTSUIDFLAGS=--mode=u+rxs,g+rx,o+rx --group=root -b --suffix=.old
- INSTMANFLAGS=
- INSTCONFFLAGS=
diff --git a/meta-demoapps/recipes-connectivity/openswan/openswan-2.4.7/ld-library-path-breakage.patch b/meta-demoapps/recipes-connectivity/openswan/openswan-2.4.7/ld-library-path-breakage.patch
deleted file mode 100644
index 92f3547..0000000
--- a/meta-demoapps/recipes-connectivity/openswan/openswan-2.4.7/ld-library-path-breakage.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-Upstream-Status: Inappropriate [configuration]
-
---- openswan-2.2.0.orig/programs/Makefile.program	2004-06-03 03:06:27.000000000 +0200
-+++ openswan-2.2.0/programs/Makefile.program	2005-03-05 13:50:19.000000000 +0100
-@@ -30,10 +30,6 @@
- 
- CFLAGS+= ${WERROR}
- 
--ifneq ($(LD_LIBRARY_PATH),)
--LDFLAGS=-L$(LD_LIBRARY_PATH)
--endif
--
- MANDIR8=$(MANTREE)/man8
- MANDIR5=$(MANTREE)/man5
- 
---- openswan-2.2.0.orig/programs/pluto/Makefile	2005-01-03 20:40:45.000000000 +0100
-+++ openswan-2.2.0/programs/pluto/Makefile	2005-03-05 13:51:21.000000000 +0100
-@@ -234,10 +234,6 @@
- LIBSPLUTO+=${CURL_LIBS} 
- LIBSPLUTO+= -lgmp -lresolv # -lefence
- 
--ifneq ($(LD_LIBRARY_PATH),)
--LDFLAGS=-L$(LD_LIBRARY_PATH)
--endif
--
- LIBSADNS = $(OPENSWANLIB)
- LIBSADNS += -lresolv # -lefence
- 
diff --git a/meta-demoapps/recipes-connectivity/openswan/openswan-2.4.7/openswan-2.4.7-gentoo.patch b/meta-demoapps/recipes-connectivity/openswan/openswan-2.4.7/openswan-2.4.7-gentoo.patch
deleted file mode 100644
index c24227c..0000000
--- a/meta-demoapps/recipes-connectivity/openswan/openswan-2.4.7/openswan-2.4.7-gentoo.patch
+++ /dev/null
@@ -1,379 +0,0 @@
-Upstream-Status: Inappropriate [configuration]
-
-diff -Nru openswan-2.4.7.orig/doc/Makefile openswan-2.4.7/doc/Makefile
---- openswan-2.4.7.orig/doc/Makefile	2005-11-08 23:32:45.000000000 +0200
-+++ openswan-2.4.7/doc/Makefile	2006-12-06 22:46:54.732830840 +0200
-@@ -1,6 +1,6 @@
- # Makefile to generate various formats from HTML source
- #
--# Assumes the htmldoc utility is available.
-+# No longer cares if the htmldoc utility is available.
- # This can be downloaded from www.easysw.com
- #
- # Also needs lynx(1) for HTML-to-text conversion
-diff -Nru openswan-2.4.7.orig/lib/libcrypto/libdes/asm/crypt586.pl openswan-2.4.7/lib/libcrypto/libdes/asm/crypt586.pl
---- openswan-2.4.7.orig/lib/libcrypto/libdes/asm/crypt586.pl	2004-07-16 03:24:45.000000000 +0300
-+++ openswan-2.4.7/lib/libcrypto/libdes/asm/crypt586.pl	2006-12-06 22:46:54.732830840 +0200
-@@ -1,4 +1,4 @@
--#!/usr/local/bin/perl
-+#!/usr/bin/perl
- #
- # The inner loop instruction sequence and the IP/FP modifications are from
- # Svend Olaf Mikkelsen <svolaf@inet.uni-c.dk>
-diff -Nru openswan-2.4.7.orig/lib/libcrypto/libdes/asm/perlasm/cbc.pl openswan-2.4.7/lib/libcrypto/libdes/asm/perlasm/cbc.pl
---- openswan-2.4.7.orig/lib/libcrypto/libdes/asm/perlasm/cbc.pl	2004-07-10 11:07:06.000000000 +0300
-+++ openswan-2.4.7/lib/libcrypto/libdes/asm/perlasm/cbc.pl	2006-12-06 22:46:54.736831090 +0200
-@@ -1,4 +1,4 @@
--#!/usr/local/bin/perl
-+#!/usr/bin/perl
- 
- # void des_ncbc_encrypt(input, output, length, schedule, ivec, enc)
- # des_cblock (*input);
-diff -Nru openswan-2.4.7.orig/lib/libcrypto/libdes/asm/perlasm/x86asm.pl openswan-2.4.7/lib/libcrypto/libdes/asm/perlasm/x86asm.pl
---- openswan-2.4.7.orig/lib/libcrypto/libdes/asm/perlasm/x86asm.pl	2004-07-10 11:07:06.000000000 +0300
-+++ openswan-2.4.7/lib/libcrypto/libdes/asm/perlasm/x86asm.pl	2006-12-06 22:46:54.736831090 +0200
-@@ -1,4 +1,4 @@
--#!/usr/local/bin/perl
-+#!/usr/bin/perl
- 
- # require 'x86asm.pl';
- # &asm_init("cpp","des-586.pl");
-diff -Nru openswan-2.4.7.orig/lib/libcrypto/libdes/asm/perlasm/x86ms.pl openswan-2.4.7/lib/libcrypto/libdes/asm/perlasm/x86ms.pl
---- openswan-2.4.7.orig/lib/libcrypto/libdes/asm/perlasm/x86ms.pl	2004-07-10 11:07:07.000000000 +0300
-+++ openswan-2.4.7/lib/libcrypto/libdes/asm/perlasm/x86ms.pl	2006-12-06 22:46:54.736831090 +0200
-@@ -1,4 +1,4 @@
--#!/usr/local/bin/perl
-+#!/usr/bin/perl
- 
- package x86ms;
- 
-diff -Nru openswan-2.4.7.orig/lib/libcrypto/libdes/asm/perlasm/x86unix.pl openswan-2.4.7/lib/libcrypto/libdes/asm/perlasm/x86unix.pl
---- openswan-2.4.7.orig/lib/libcrypto/libdes/asm/perlasm/x86unix.pl	2004-07-10 11:07:07.000000000 +0300
-+++ openswan-2.4.7/lib/libcrypto/libdes/asm/perlasm/x86unix.pl	2006-12-06 22:46:54.736831090 +0200
-@@ -1,4 +1,4 @@
--#!/usr/local/bin/perl
-+#!/usr/bin/perl
- 
- package x86unix;
- 
-diff -Nru openswan-2.4.7.orig/lib/liblwres/Makefile openswan-2.4.7/lib/liblwres/Makefile
---- openswan-2.4.7.orig/lib/liblwres/Makefile	2004-12-18 20:13:34.000000000 +0200
-+++ openswan-2.4.7/lib/liblwres/Makefile	2006-12-06 22:46:54.736831090 +0200
-@@ -20,7 +20,7 @@
- CDEFINES = -g
- CWARNINGS = -Werror
- 
--CFLAGS=${CINCLUDES} ${CDEFINES} ${CWARNINGS}
-+CFLAGS=${CINCLUDES} ${CDEFINES} ${CWARNINGS} $(USERCOMPILE)
- 
- VERSION="@(\#) openswan-hacking-9.3-for-osw2"
- LIBINTERFACE=2
-diff -Nru openswan-2.4.7.orig/linux/net/ipsec/des/asm/des-586.pl openswan-2.4.7/linux/net/ipsec/des/asm/des-586.pl
---- openswan-2.4.7.orig/linux/net/ipsec/des/asm/des-586.pl	2004-07-10 11:06:50.000000000 +0300
-+++ openswan-2.4.7/linux/net/ipsec/des/asm/des-586.pl	2006-12-06 22:46:54.736831090 +0200
-@@ -1,4 +1,4 @@
--#!/usr/local/bin/perl
-+#!/usr/bin/perl
- #
- # The inner loop instruction sequence and the IP/FP modifications are from
- # Svend Olaf Mikkelsen <svolaf@inet.uni-c.dk>
-diff -Nru openswan-2.4.7.orig/linux/net/ipsec/des/asm/des686.pl openswan-2.4.7/linux/net/ipsec/des/asm/des686.pl
---- openswan-2.4.7.orig/linux/net/ipsec/des/asm/des686.pl	2004-07-10 11:06:50.000000000 +0300
-+++ openswan-2.4.7/linux/net/ipsec/des/asm/des686.pl	2006-12-06 22:46:54.740831340 +0200
-@@ -1,4 +1,4 @@
--#!/usr/local/bin/perl
-+#!/usr/bin/perl
- 
- $prog="des686.pl";
- 
-diff -Nru openswan-2.4.7.orig/linux/net/ipsec/des/asm/desboth.pl openswan-2.4.7/linux/net/ipsec/des/asm/desboth.pl
---- openswan-2.4.7.orig/linux/net/ipsec/des/asm/desboth.pl	2004-07-10 11:06:50.000000000 +0300
-+++ openswan-2.4.7/linux/net/ipsec/des/asm/desboth.pl	2006-12-06 22:46:54.740831340 +0200
-@@ -1,4 +1,4 @@
--#!/usr/local/bin/perl
-+#!/usr/bin/perl
- 
- $L="edi";
- $R="esi";
-diff -Nru openswan-2.4.7.orig/Makefile.inc openswan-2.4.7/Makefile.inc
---- openswan-2.4.7.orig/Makefile.inc	2006-11-14 19:56:09.000000000 +0200
-+++ openswan-2.4.7/Makefile.inc	2006-12-06 22:48:32.534943089 +0200
-@@ -46,7 +46,7 @@
- DESTDIR?=
- 
- # "local" part of tree, used in building other pathnames
--INC_USRLOCAL=/usr/local
-+INC_USRLOCAL?=/usr
- 
- # PUBDIR is where the "ipsec" command goes; beware, many things define PATH
- # settings which are assumed to include it (or at least, to include *some*
-@@ -80,7 +80,7 @@
- MANPLACES=man3 man5 man8
- 
- # where configuration files go
--FINALCONFFILE?=/etc/ipsec.conf
-+FINALCONFFILE?=/etc/ipsec/ipsec.conf
- CONFFILE=$(DESTDIR)$(FINALCONFFILE)
- 
- FINALCONFDIR?=/etc
-@@ -91,7 +91,7 @@
- 
- # sample configuration files go into
- INC_DOCDIR?=share/doc
--FINALEXAMPLECONFDIR=${INC_USRLOCAL}/${INC_DOCDIR}/openswan
-+FINALEXAMPLECONFDIR?=${INC_USRLOCAL}/${INC_DOCDIR}/openswan
- EXAMPLECONFDIR=${DESTDIR}${FINALEXAMPLECONFDIR}
- 
- FINALDOCDIR?=${INC_USRLOCAL}/${INC_DOCDIR}/openswan
-@@ -239,7 +239,7 @@
- # installed one in RH 7.2, won't work - you wind up depending upon
- # openssl.
- 
--BIND9STATICLIBDIR?=/usr/local/lib
-+BIND9STATICLIBDIR?=/usr/lib
- 
- # if you install elsewere, you may need to point the include files to it.
- #BIND9STATICLIBDIR?=/sandel/lib
-diff -Nru openswan-2.4.7.orig/programs/barf/barf.in openswan-2.4.7/programs/barf/barf.in
---- openswan-2.4.7.orig/programs/barf/barf.in	2006-11-07 05:49:18.000000000 +0200
-+++ openswan-2.4.7/programs/barf/barf.in	2006-12-06 22:46:54.740831340 +0200
-@@ -16,7 +16,7 @@
- 
- LOGS=${LOGS-/var/log}
- CONFS=${IPSEC_CONFS-/etc}
--CONFDDIR=${IPSEC_CONFDDIR-/etc/ipsec.d}
-+CONFDDIR=${IPSEC_CONFDDIR-/etc/ipsec/ipsec.d}
- me="ipsec barf"
- # Max lines to use for things like 'route -n'
- maxlines=100
-@@ -238,13 +238,13 @@
- 	done
- fi
- _________________________ ipsec/ls-libdir
--ls -l ${IPSEC_LIBDIR-/usr/local/lib/ipsec}
-+ls -l ${IPSEC_LIBDIR-/usr/lib/ipsec}
- _________________________ ipsec/ls-execdir
--ls -l ${IPSEC_EXECDIR-/usr/local/libexec/ipsec}
-+ls -l ${IPSEC_EXECDIR-/usr/libexec/ipsec}
- _________________________ ipsec/updowns
--for f in `ls ${IPSEC_EXECDIR-/usr/local/libexec/ipsec} | egrep updown`
-+for f in `ls ${IPSEC_EXECDIR-/usr/libexec/ipsec} | egrep updown`
- do
--	cat ${IPSEC_EXECDIR-/usr/local/libexec/ipsec}/$f
-+	cat ${IPSEC_EXECDIR-/usr/libexec/ipsec}/$f
- done
- _________________________ /proc/net/dev
- cat /proc/net/dev
-diff -Nru openswan-2.4.7.orig/programs/eroute/eroute.5 openswan-2.4.7/programs/eroute/eroute.5
---- openswan-2.4.7.orig/programs/eroute/eroute.5	2006-10-26 23:40:43.000000000 +0300
-+++ openswan-2.4.7/programs/eroute/eroute.5	2006-12-06 22:57:19.307864340 +0200
-@@ -168,7 +168,7 @@
- .SH "FILES"
- 
- .PP
--/proc/net/ipsec_eroute, /usr/local/bin/ipsec
-+/proc/net/ipsec_eroute, /usr/bin/ipsec
- 
- .SH "SEE ALSO"
- 
-diff -Nru openswan-2.4.7.orig/programs/eroute/eroute.8 openswan-2.4.7/programs/eroute/eroute.8
---- openswan-2.4.7.orig/programs/eroute/eroute.8	2003-10-31 04:32:27.000000000 +0200
-+++ openswan-2.4.7/programs/eroute/eroute.8	2006-12-06 22:46:54.740831340 +0200
-@@ -308,7 +308,7 @@
- .br
- .LP
- .SH FILES
--/proc/net/ipsec_eroute, /usr/local/bin/ipsec
-+/proc/net/ipsec_eroute, /usr/bin/ipsec
- .SH "SEE ALSO"
- ipsec(8), ipsec_manual(8), ipsec_tncfg(8), ipsec_spi(8),
- ipsec_spigrp(8), ipsec_klipsdebug(8), ipsec_eroute(5)
-diff -Nru openswan-2.4.7.orig/programs/_include/_include.in openswan-2.4.7/programs/_include/_include.in
---- openswan-2.4.7.orig/programs/_include/_include.in	2003-01-06 23:44:04.000000000 +0200
-+++ openswan-2.4.7/programs/_include/_include.in	2006-12-06 22:46:54.740831340 +0200
-@@ -47,10 +47,10 @@
- do
- 	if test ! -r "$f"
- 	then
--		if test ! "$f" = "/etc/ipsec.conf"
-+		if test ! "$f" = "/etc/ipsec/ipsec.conf"
- 		then
- 			echo "#:cannot open configuration file \'$f\'"
--			if test "$f" = "/etc/ipsec.secrets"
-+			if test "$f" = "/etc/ipsec/ipsec.secrets"
- 			then
- 				echo "#:Your secrets file will be created when you start FreeS/WAN for the first time."
- 			fi
-diff -Nru openswan-2.4.7.orig/programs/ipsec/ipsec.8 openswan-2.4.7/programs/ipsec/ipsec.8
---- openswan-2.4.7.orig/programs/ipsec/ipsec.8	2003-02-27 18:51:54.000000000 +0200
-+++ openswan-2.4.7/programs/ipsec/ipsec.8	2006-12-06 22:46:54.744831590 +0200
-@@ -81,7 +81,7 @@
- .I ipsec
- thinks the IPsec configuration files are stored.
- .SH FILES
--/usr/local/lib/ipsec	usual utilities directory
-+/usr/lib/ipsec	usual utilities directory
- .SH ENVIRONMENT
- .PP
- The following environment variables control where FreeS/WAN finds its
-diff -Nru openswan-2.4.7.orig/programs/klipsdebug/klipsdebug.5 openswan-2.4.7/programs/klipsdebug/klipsdebug.5
---- openswan-2.4.7.orig/programs/klipsdebug/klipsdebug.5	2006-10-27 01:21:25.000000000 +0300
-+++ openswan-2.4.7/programs/klipsdebug/klipsdebug.5	2006-12-06 22:58:04.150666840 +0200
-@@ -114,7 +114,7 @@
- .SH "FILES"
- 
- .PP
--/proc/net/ipsec_klipsdebug, /usr/local/bin/ipsec
-+/proc/net/ipsec_klipsdebug, /usr/bin/ipsec
- 
- .SH "SEE ALSO"
- 
-diff -Nru openswan-2.4.7.orig/programs/klipsdebug/klipsdebug.8 openswan-2.4.7/programs/klipsdebug/klipsdebug.8
---- openswan-2.4.7.orig/programs/klipsdebug/klipsdebug.8	2006-10-27 01:21:25.000000000 +0300
-+++ openswan-2.4.7/programs/klipsdebug/klipsdebug.8	2006-12-06 22:58:22.295800840 +0200
-@@ -111,7 +111,7 @@
- .SH "FILES"
- 
- .PP
--/proc/net/ipsec_klipsdebug, /usr/local/bin/ipsec
-+/proc/net/ipsec_klipsdebug, /usr/bin/ipsec
- 
- .SH "SEE ALSO"
- 
-diff -Nru openswan-2.4.7.orig/programs/mailkey/mailkey.in openswan-2.4.7/programs/mailkey/mailkey.in
---- openswan-2.4.7.orig/programs/mailkey/mailkey.in	2006-10-29 02:49:23.000000000 +0300
-+++ openswan-2.4.7/programs/mailkey/mailkey.in	2006-12-06 22:46:54.828836839 +0200
-@@ -60,7 +60,7 @@
- 
- "$test1st"
- 
--Common concerns: This account must be able to read /etc/ipsec.secrets. 
-+Common concerns: This account must be able to read /etc/ipsec/ipsec.secrets. 
- If you haven't generated your key yet, please run 'ipsec newhostkey'." 
- exit 0
- }
-diff -Nru openswan-2.4.7.orig/programs/pluto/Makefile openswan-2.4.7/programs/pluto/Makefile
---- openswan-2.4.7.orig/programs/pluto/Makefile	2006-11-07 17:55:52.000000000 +0200
-+++ openswan-2.4.7/programs/pluto/Makefile	2006-12-06 22:46:54.832837088 +0200
-@@ -256,7 +256,7 @@
- 	-DPOLICYGROUPSDIR=\"${FINALCONFDDIR}/policies\" \
- 	-DPERPEERLOGDIR=\"${FINALLOGDIR}/pluto/peer\"
- 
--ALLFLAGS = $(CPPFLAGS) $(CFLAGS)
-+ALLFLAGS = $(CPPFLAGS) $(CFLAGS) $(USERCOMPILE)
- 
- # libefence is a free memory allocation debugger
- # Solaris 2 needs -lsocket -lnsl
-diff -Nru openswan-2.4.7.orig/programs/setup/Makefile openswan-2.4.7/programs/setup/Makefile
---- openswan-2.4.7.orig/programs/setup/Makefile	2004-12-18 20:13:43.000000000 +0200
-+++ openswan-2.4.7/programs/setup/Makefile	2006-12-06 22:46:54.832837088 +0200
-@@ -33,25 +33,10 @@
- 	@rm -f $(BINDIR)/setup
- 	@$(INSTALL) $(INSTBINFLAGS) setup $(RCDIR)/ipsec
- 	@ln -s $(FINALRCDIR)/ipsec $(BINDIR)/setup
--	-@for i in 0 1 2 3 4 5 6; do mkdir -p $(RCDIR)/../rc$$i.d; done
--	-@cd $(RCDIR)/../rc0.d && ln -f -s ../init.d/ipsec K76ipsec
--	-@cd $(RCDIR)/../rc1.d && ln -f -s ../init.d/ipsec K76ipsec
--	-@cd $(RCDIR)/../rc2.d && ln -f -s ../init.d/ipsec S47ipsec
--	-@cd $(RCDIR)/../rc3.d && ln -f -s ../init.d/ipsec S47ipsec
--	-@cd $(RCDIR)/../rc4.d && ln -f -s ../init.d/ipsec S47ipsec
--	-@cd $(RCDIR)/../rc5.d && ln -f -s ../init.d/ipsec S47ipsec
--	-@cd $(RCDIR)/../rc6.d && ln -f -s ../init.d/ipsec K76ipsec
- 
- install_file_list::
- 	@echo $(RCDIR)/ipsec
- 	@echo $(BINDIR)/setup
--	@echo $(RCDIR)/../rc0.d/K76ipsec
--	@echo $(RCDIR)/../rc1.d/K76ipsec
--	@echo $(RCDIR)/../rc2.d/S47ipsec
--	@echo $(RCDIR)/../rc3.d/S47ipsec
--	@echo $(RCDIR)/../rc4.d/S47ipsec
--	@echo $(RCDIR)/../rc5.d/S47ipsec
--	@echo $(RCDIR)/../rc6.d/K76ipsec
- 
- clean::
- 	@rm -f setup
-diff -Nru openswan-2.4.7.orig/programs/showhostkey/showhostkey.in openswan-2.4.7/programs/showhostkey/showhostkey.in
---- openswan-2.4.7.orig/programs/showhostkey/showhostkey.in	2004-11-14 15:40:41.000000000 +0200
-+++ openswan-2.4.7/programs/showhostkey/showhostkey.in	2006-12-06 22:46:54.844837840 +0200
-@@ -18,7 +18,7 @@
- usage="Usage: $me [--file secrets] [--left] [--right] [--txt gateway] [--id id]
-                   [--dhclient] [--ipseckey]"
- 
--file=/etc/ipsec.secrets
-+file=/etc/ipsec/ipsec.secrets
- fmt=""
- gw=
- id=
-diff -Nru openswan-2.4.7.orig/programs/spi/spi.5 openswan-2.4.7/programs/spi/spi.5
---- openswan-2.4.7.orig/programs/spi/spi.5	2006-10-26 23:53:59.000000000 +0300
-+++ openswan-2.4.7/programs/spi/spi.5	2006-12-06 23:00:11.910340779 +0200
-@@ -157,7 +157,7 @@
- .SH "FILES"
- 
- .PP
--/proc/net/ipsec_spi, /usr/local/bin/ipsec
-+/proc/net/ipsec_spi, /usr/bin/ipsec
- 
- .SH "SEE ALSO"
- 
-diff -Nru openswan-2.4.7.orig/programs/spi/spi.8 openswan-2.4.7/programs/spi/spi.8
---- openswan-2.4.7.orig/programs/spi/spi.8	2006-10-30 22:00:04.000000000 +0200
-+++ openswan-2.4.7/programs/spi/spi.8	2006-12-06 23:00:27.043286530 +0200
-@@ -215,7 +215,7 @@
- .SH "FILES"
- 
- .PP
--/proc/net/ipsec_spi, /usr/local/bin/ipsec
-+/proc/net/ipsec_spi, /usr/bin/ipsec
- 
- .SH "SEE ALSO"
- 
-diff -Nru openswan-2.4.7.orig/programs/spigrp/spigrp.5 openswan-2.4.7/programs/spigrp/spigrp.5
---- openswan-2.4.7.orig/programs/spigrp/spigrp.5	2006-10-26 23:50:29.000000000 +0300
-+++ openswan-2.4.7/programs/spigrp/spigrp.5	2006-12-06 23:01:25.650949280 +0200
-@@ -67,7 +67,7 @@
- .SH "FILES"
- 
- .PP
--/proc/net/ipsec_spigrp, /usr/local/bin/ipsec
-+/proc/net/ipsec_spigrp, /usr/bin/ipsec
- 
- .SH "SEE ALSO"
- 
-diff -Nru openswan-2.4.7.orig/programs/spigrp/spigrp.8 openswan-2.4.7/programs/spigrp/spigrp.8
---- openswan-2.4.7.orig/programs/spigrp/spigrp.8	2006-10-26 23:50:29.000000000 +0300
-+++ openswan-2.4.7/programs/spigrp/spigrp.8	2006-12-06 23:01:39.079788532 +0200
-@@ -87,7 +87,7 @@
- .SH "FILES"
- 
- .PP
--/proc/net/ipsec_spigrp, /usr/local/bin/ipsec
-+/proc/net/ipsec_spigrp, /usr/bin/ipsec
- 
- .SH "SEE ALSO"
- 
-diff -Nru openswan-2.4.7.orig/programs/tncfg/tncfg.5 openswan-2.4.7/programs/tncfg/tncfg.5
---- openswan-2.4.7.orig/programs/tncfg/tncfg.5	2006-10-26 23:58:11.000000000 +0300
-+++ openswan-2.4.7/programs/tncfg/tncfg.5	2006-12-06 23:01:59.385057530 +0200
-@@ -101,7 +101,7 @@
- .SH "FILES"
- 
- .PP
--/proc/net/ipsec_tncfg, /usr/local/bin/ipsec
-+/proc/net/ipsec_tncfg, /usr/bin/ipsec
- 
- .SH "SEE ALSO"
- 
-diff -Nru openswan-2.4.7.orig/programs/tncfg/tncfg.8 openswan-2.4.7/programs/tncfg/tncfg.8
---- openswan-2.4.7.orig/programs/tncfg/tncfg.8	2006-10-26 23:58:11.000000000 +0300
-+++ openswan-2.4.7/programs/tncfg/tncfg.8	2006-12-06 23:02:09.245673780 +0200
-@@ -63,7 +63,7 @@
- .SH "FILES"
- 
- .PP
--/proc/net/ipsec_tncfg, /usr/local/bin/ipsec
-+/proc/net/ipsec_tncfg, /usr/bin/ipsec
- 
- .SH "SEE ALSO"
- 
diff --git a/meta-demoapps/recipes-connectivity/openswan/openswan_2.4.7.bb b/meta-demoapps/recipes-connectivity/openswan/openswan_2.4.7.bb
deleted file mode 100644
index f783a85..0000000
--- a/meta-demoapps/recipes-connectivity/openswan/openswan_2.4.7.bb
+++ /dev/null
@@ -1,36 +0,0 @@
-SECTION = "console/network"
-SUMMARY = "IPsec implementation"
-DESCRIPTION = "Openswan is an Open Source implementation of IPsec for the \
-Linux operating system."
-HOMEPAGE = "http://www.openswan.org"
-LICENSE = "GPLv2"
-DEPENDS = "gmp flex-native"
-RRECOMMENDS_${PN} = "kernel-module-ipsec"
-PR = "r2"
-
-SRC_URI = "http://www.openswan.org/download/old/openswan-${PV}.tar.gz \
-	   file://openswan-2.4.7-gentoo.patch;patch=1 \
-           file://installflags.patch;patch=1 \
-	   file://ld-library-path-breakage.patch;patch=1"
-S = "${WORKDIR}/openswan-${PV}"
-
-PARALLEL_MAKE = ""
-EXTRA_OEMAKE = "DESTDIR=${D} \
-                USERCOMPILE="${CFLAGS}" \
-                FINALCONFDIR=${sysconfdir}/ipsec \
-                INC_RCDEFAULT=${sysconfdir}/init.d \
-                INC_USRLOCAL=${prefix} \
-                INC_MANDIR=share/man WERROR=''"
-
-do_compile () {
-	oe_runmake programs
-}
-
-do_install () {
-	oe_runmake install
-}
-
-FILES_${PN} = "${sysconfdir} ${libdir}/ipsec/* ${sbindir}/* ${libexecdir}/ipsec/*"
-FILES_${PN}-dbg += "${libdir}/ipsec/.debug ${libexecdir}/ipsec/.debug"
-
-CONFFILES_${PN} = "${sysconfdir}/ipsec/ipsec.conf"
diff --git a/meta-demoapps/recipes-connectivity/opensync/libopensync-0.37/build-in-src.patch b/meta-demoapps/recipes-connectivity/opensync/libopensync-0.37/build-in-src.patch
deleted file mode 100644
index fa61e15..0000000
--- a/meta-demoapps/recipes-connectivity/opensync/libopensync-0.37/build-in-src.patch
+++ /dev/null
@@ -1,20 +0,0 @@
-Upstream-Status: Inappropriate [configuration]
-
----
- cmake/OpenSyncInternal.cmake.in |    1 -
- 1 file changed, 1 deletion(-)
-
---- libopensync-0.36.orig/cmake/OpenSyncInternal.cmake.in
-+++ libopensync-0.36/cmake/OpenSyncInternal.cmake.in
-@@ -5,11 +5,10 @@ INCLUDE( OpenSyncTesting )
- INCLUDE( OpenSyncPackaging )
- INCLUDE( OpenSyncPlugin )
- INCLUDE( OpenSyncPlatforms )
- INCLUDE( MacroEnsureOutOfSourceBuild )
- 
--MACRO_ENSURE_OUT_OF_SOURCE_BUILD("${CMAKE_PROJECT_NAME} doesn't allow to build within the source directory. Please, create a seperate build directory and run 'cmake ${PROJECT_SOURCE_DIR} [options]'!")
- 
- 
- SET( OPENSYNC_PLUGINDIR "@OPENSYNC_PLUGINDIR@" )
- SET( OPENSYNC_FORMATSDIR "@OPENSYNC_FORMATSDIR@" )
- SET( OPENSYNC_PYTHON_PLUGINDIR "@OPENSYNC_PYTHON_PLUGINDIR@" )
diff --git a/meta-demoapps/recipes-connectivity/opensync/libopensync-0.37/cmake.patch b/meta-demoapps/recipes-connectivity/opensync/libopensync-0.37/cmake.patch
deleted file mode 100644
index 20d09cf..0000000
--- a/meta-demoapps/recipes-connectivity/opensync/libopensync-0.37/cmake.patch
+++ /dev/null
@@ -1,19 +0,0 @@
-Upstream-Status: Inappropriate [configuration]
-
----
- opensync/CMakeLists.txt |    1 -
- 1 file changed, 1 deletion(-)
-
-Index: libopensync-0.37/opensync/CMakeLists.txt
-===================================================================
---- libopensync-0.37.orig/opensync/CMakeLists.txt	2008-10-15 13:56:45.000000000 +0100
-+++ libopensync-0.37/opensync/CMakeLists.txt	2008-10-15 13:59:03.000000000 +0100
-@@ -67,8 +67,6 @@
- SET_TARGET_PROPERTIES( opensync PROPERTIES VERSION ${OPENSYNC_LIBVERSION_VERSION} )
- SET_TARGET_PROPERTIES( opensync PROPERTIES SOVERSION ${OPENSYNC_LIBVERSION_SOVERSION} )
- 
--SET_TARGET_PROPERTIES( opensync PROPERTIES COMPILE_FLAGS ${SYMBOLS_VISIBILITY} )
--
- IF ( OPENSYNC_UNITTESTS )
- 	ADD_LIBRARY( opensync-testing SHARED ${libopensync_LIB_SRCS} )
- 	TARGET_LINK_LIBRARIES( opensync-testing ${GLIB2_LIBRARIES} ${GTHREAD2_LIBRARIES} ${GMODULE2_LIBRARIES} ${LIBXML2_LIBRARIES}  ${LIBXSLT_LIBRARIES} ${LIBEXSLT_LIBRARIES} ${SQLITE3_LIBRARIES} )
diff --git a/meta-demoapps/recipes-connectivity/opensync/libopensync-0.37/no-python-check.patch b/meta-demoapps/recipes-connectivity/opensync/libopensync-0.37/no-python-check.patch
deleted file mode 100644
index d59fddb..0000000
--- a/meta-demoapps/recipes-connectivity/opensync/libopensync-0.37/no-python-check.patch
+++ /dev/null
@@ -1,18 +0,0 @@
-Upstream-Status: Inappropriate [configuration]
-
----
- CMakeLists.txt |    1 -
- 1 file changed, 1 deletion(-)
-
-Index: libopensync-0.37/CMakeLists.txt
-===================================================================
---- libopensync-0.37.orig/CMakeLists.txt	2008-08-18 16:14:24.000000000 +0100
-+++ libopensync-0.37/CMakeLists.txt	2008-10-15 14:00:12.000000000 +0100
-@@ -65,7 +65,6 @@
- FIND_PACKAGE( LibXslt REQUIRED )
- FIND_PACKAGE( LibExslt REQUIRED )
- FIND_PACKAGE( SWIG )	
--FIND_PACKAGE( PythonLibs )
- FIND_PACKAGE( Check )
- 
- ADD_SUBDIRECTORY( opensync )
diff --git a/meta-demoapps/recipes-connectivity/opensync/libopensync-plugin-evolution2/0.37-fixes.patch b/meta-demoapps/recipes-connectivity/opensync/libopensync-plugin-evolution2/0.37-fixes.patch
deleted file mode 100644
index 9ef0353..0000000
--- a/meta-demoapps/recipes-connectivity/opensync/libopensync-plugin-evolution2/0.37-fixes.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-Upstream-Status: Inappropriate [configuration]
-
-Index: libopensync-plugin-evolution2-0.36/cmake/modules/FindOpenSync.cmake
-===================================================================
---- libopensync-plugin-evolution2-0.36.orig/cmake/modules/FindOpenSync.cmake	2008-10-20 13:07:14.000000000 +0100
-+++ libopensync-plugin-evolution2-0.36/cmake/modules/FindOpenSync.cmake	2008-10-20 13:08:09.000000000 +0100
-@@ -23,15 +23,15 @@
- ENDIF ( OpenSync_FIND_REQUIRED )
- 
- IF ( OPENSYNC_MIN_VERSION )
--	PKG_SEARCH_MODULE( OPENSYNC ${_pkgconfig_REQUIRED} opensync-1.0>=${OPENSYNC_MIN_VERSION} )
-+	PKG_SEARCH_MODULE( OPENSYNC ${_pkgconfig_REQUIRED} libopensync>=${OPENSYNC_MIN_VERSION} )
- ELSE ( OPENSYNC_MIN_VERSION )
--	PKG_SEARCH_MODULE( OPENSYNC ${_pkgconfig_REQUIRED} opensync-1.0 )
-+	PKG_SEARCH_MODULE( OPENSYNC ${_pkgconfig_REQUIRED} libopensync )
- ENDIF ( OPENSYNC_MIN_VERSION )
- 
- FIND_PROGRAM( PKGCONFIG_EXECUTABLE NAMES pkg-config )
- 
- IF ( PKGCONFIG_EXECUTABLE )
--	EXEC_PROGRAM( ${PKGCONFIG_EXECUTABLE} ARGS opensync-1.0 --variable=datadir OUTPUT_VARIABLE _opensync_data_DIR )
-+	EXEC_PROGRAM( ${PKGCONFIG_EXECUTABLE} ARGS libopensync --variable=datadir OUTPUT_VARIABLE _opensync_data_DIR )
- 	STRING( REGEX REPLACE "[\r\n]" " " _opensync_data_DIR "${_opensync_data_DIR}"  )
- ENDIF ( PKGCONFIG_EXECUTABLE )
- 
diff --git a/meta-demoapps/recipes-connectivity/opensync/libopensync-plugin-evolution2_0.36.bb b/meta-demoapps/recipes-connectivity/opensync/libopensync-plugin-evolution2_0.36.bb
deleted file mode 100644
index 42dc4dd..0000000
--- a/meta-demoapps/recipes-connectivity/opensync/libopensync-plugin-evolution2_0.36.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require libopensync-plugin_0.36.inc
-LICENSE = "LGPL"
-
-DEPENDS += " evolution-data-server"
-
-SRC_URI += "file://0.37-fixes.patch;patch=1"
-
-PR = "r2"
diff --git a/meta-demoapps/recipes-connectivity/opensync/libopensync-plugin-file_0.37.bb b/meta-demoapps/recipes-connectivity/opensync/libopensync-plugin-file_0.37.bb
deleted file mode 100644
index 404c172..0000000
--- a/meta-demoapps/recipes-connectivity/opensync/libopensync-plugin-file_0.37.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-require libopensync-plugin_0.36.inc
-LICENSE = "LGPL"
diff --git a/meta-demoapps/recipes-connectivity/opensync/libopensync-plugin-google-calendar_0.36.bb b/meta-demoapps/recipes-connectivity/opensync/libopensync-plugin-google-calendar_0.36.bb
deleted file mode 100644
index dbcb2aa..0000000
--- a/meta-demoapps/recipes-connectivity/opensync/libopensync-plugin-google-calendar_0.36.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-require libopensync-plugin_0.36.inc
-LICENSE = "GPLv2"
diff --git a/meta-demoapps/recipes-connectivity/opensync/libopensync-plugin-irmc_0.36.bb b/meta-demoapps/recipes-connectivity/opensync/libopensync-plugin-irmc_0.36.bb
deleted file mode 100644
index cb601f2..0000000
--- a/meta-demoapps/recipes-connectivity/opensync/libopensync-plugin-irmc_0.36.bb
+++ /dev/null
@@ -1,4 +0,0 @@
-require libopensync-plugin_0.36.inc
-LICENSE = "GPLv2"
-
-DEPENDS += "openobex bluez4"
diff --git a/meta-demoapps/recipes-connectivity/opensync/libopensync-plugin-syncml/fixerror.patch b/meta-demoapps/recipes-connectivity/opensync/libopensync-plugin-syncml/fixerror.patch
deleted file mode 100644
index 9e7a260..0000000
--- a/meta-demoapps/recipes-connectivity/opensync/libopensync-plugin-syncml/fixerror.patch
+++ /dev/null
@@ -1,15 +0,0 @@
-Upstream-Status: Inappropriate [others]
-
-Index: libopensync-plugin-syncml-0.38/src/syncml_callbacks.c
-===================================================================
---- libopensync-plugin-syncml-0.38.orig/src/syncml_callbacks.c	2009-07-31 10:30:33.000000000 +0100
-+++ libopensync-plugin-syncml-0.38/src/syncml_callbacks.c	2009-07-31 10:30:39.000000000 +0100
-@@ -405,7 +405,7 @@
- 	} else {
- 		/* This problem should be fixed with the next SLOW-SYNC. */
- 		osync_trace(TRACE_EXIT_ERROR, "%s - unexpected Add or Replace command", __func__);
--		smlErrorSet(error, SML_ERROR_TEMPORARY, "Unwanted Add or Replace command on second OMA DS session.");
-+		smlErrorSet(error, SML_ERROR_GENERIC, "Unwanted Add or Replace command on second OMA DS session.");
- 		return FALSE;
- 	}
- }
diff --git a/meta-demoapps/recipes-connectivity/opensync/libopensync-plugin-syncml_0.38.bb b/meta-demoapps/recipes-connectivity/opensync/libopensync-plugin-syncml_0.38.bb
deleted file mode 100644
index e33336f..0000000
--- a/meta-demoapps/recipes-connectivity/opensync/libopensync-plugin-syncml_0.38.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require libopensync-plugin_0.36.inc
-LICENSE = "LGPL"
-
-DEPENDS += " libsyncml (>= 0.4.7)"
-
-SRC_URI += "file://fixerror.patch;patch=1"
-
-PR = "r1"
diff --git a/meta-demoapps/recipes-connectivity/opensync/libopensync-plugin-vformat_0.37.bb b/meta-demoapps/recipes-connectivity/opensync/libopensync-plugin-vformat_0.37.bb
deleted file mode 100644
index a7d50dc..0000000
--- a/meta-demoapps/recipes-connectivity/opensync/libopensync-plugin-vformat_0.37.bb
+++ /dev/null
@@ -1,4 +0,0 @@
-require libopensync-plugin_0.36.inc
-LICENSE = "LGPL"
-
-DEPENDS += "libcheck"
diff --git a/meta-demoapps/recipes-connectivity/opensync/libopensync-plugin_0.36.inc b/meta-demoapps/recipes-connectivity/opensync/libopensync-plugin_0.36.inc
deleted file mode 100644
index cde4779..0000000
--- a/meta-demoapps/recipes-connectivity/opensync/libopensync-plugin_0.36.inc
+++ /dev/null
@@ -1,11 +0,0 @@
-DEPENDS = "libopensync (>= 0.36)"
-
-DESCRIPTION ?= "OpenSync plugin"
-
-SRC_URI = "http://opensync.org/download/releases/${PV}/${BPN}-${PV}.tar.bz2"
-
-inherit cmake
-
-FILES_${PN} += "${libdir}/opensync*/plugins/*.so \
-                ${libdir}/opensync*/formats/*.so \
-                ${datadir}/opensync*/defaults/"
diff --git a/meta-demoapps/recipes-connectivity/opensync/libopensync_0.37.bb b/meta-demoapps/recipes-connectivity/opensync/libopensync_0.37.bb
deleted file mode 100644
index 437bdd2..0000000
--- a/meta-demoapps/recipes-connectivity/opensync/libopensync_0.37.bb
+++ /dev/null
@@ -1,26 +0,0 @@
-LICENSE = "LGPL"
-HOMEPAGE = "http://www.opensync.org/"
-SUMMARY = "Synchronization framwork"
-DESCRIPTION = "The OpenSync project is an ongoing effort to create a synchronization framework that will be a platform independent, general purpose synchronization engine utilizing modular plugins for content formats and different kind of connection types. OpenSync's modularity should allow it to be extended easily to new devices and purposes without radically changing the architecture itself, allowing it to support wide variety of devices used today and in the future."
-DEPENDS = "sqlite3 libxml2 glib-2.0 libcheck zlib libxslt"
-
-PR = "r1"
-
-SRC_URI = "http://opensync.org/download/releases/${PV}/libopensync-${PV}.tar.bz2\
-           file://cmake.patch;patch=1 \
-	   file://build-in-src.patch;patch=1 \
-	   file://no-python-check.patch;patch=1"
-
-inherit cmake pkgconfig
-
-LEAD_SONAME = "libopensync.so"
-
-FILES_${PN} += " ${libdir}/opensync*/formats/*.so \
-                 ${libdir}/opensync*/osplugin \
-                 ${datadir}/opensync*/schemas \
-                 ${datadir}/opensync*/capabilities \
-                 ${datadir}/opensync*/descriptions \
-		 "
-FILES_${PN}-dbg += " ${libdir}/opensync*/formats/.debug/*.so \
-	             ${libdir}/opensync*/.debug/osplugin "
-
diff --git a/meta-demoapps/recipes-connectivity/opensync/libsync_git.bb b/meta-demoapps/recipes-connectivity/opensync/libsync_git.bb
deleted file mode 100644
index 4986206..0000000
--- a/meta-demoapps/recipes-connectivity/opensync/libsync_git.bb
+++ /dev/null
@@ -1,22 +0,0 @@
-SUMMARY = "GObject-based sync library"
-DESCRIPTION = "LibSync is a GObject-based framework for more convenient use of \
-OpenSync in GLib applications."
-LICENSE = "LGPLv2"
-SECTION = "x11"
-DEPENDS = "glib-2.0 gtk+ libglade libopensync avahi"
-RRECOMMENDS_${PN} = "\
-	libopensync-plugin-file \
-	"
-SRCREV = "3f375969d56028505db97cd25ef1679a167cfc59"
-PV = "0.0+gitr${SRCPV}"
-PR = "r2"
-
-SRC_URI = "git://git.yoctoproject.org/sync;protocol=git"
-
-inherit autotools pkgconfig
-
-S = "${WORKDIR}/sync"
-
-PACKAGES += "synctool"
-FILES_${PN} = "${libdir}/lib*.so.*"
-FILES_synctool = "${bindir} ${datadir}"
diff --git a/meta-demoapps/recipes-connectivity/opensync/libsyncml/build-in-src.patch b/meta-demoapps/recipes-connectivity/opensync/libsyncml/build-in-src.patch
deleted file mode 100644
index 9947af0..0000000
--- a/meta-demoapps/recipes-connectivity/opensync/libsyncml/build-in-src.patch
+++ /dev/null
@@ -1,21 +0,0 @@
-Upstream-Status: Inappropriate [configuration]
-
----
- CMakeLists.txt |    4 ----
- 1 file changed, 4 deletions(-)
-
-Index: libsyncml-0.5.4/CMakeLists.txt
-===================================================================
---- libsyncml-0.5.4.orig/CMakeLists.txt	2009-07-31 09:56:16.000000000 +0100
-+++ libsyncml-0.5.4/CMakeLists.txt	2009-07-31 09:57:33.000000000 +0100
-@@ -72,10 +72,6 @@
- CHECK_TYPE_SIZE( uint32_t UINT32_T )
- CHECK_TYPE_SIZE( uint8_t UINT8_T )
- 
--# ensure out od source build
--INCLUDE( MacroEnsureOutOfSourceBuild )
--MACRO_ENSURE_OUT_OF_SOURCE_BUILD("${CMAKE_PROJECT_NAME} doesn't allow to build within the source directory. Please, create a seperate build directory and run 'cmake ${PROJECT_SOURCE_DIR} [options]'!")
--
- # find requirements
- SET ( GLIB2_MIN_VERSION "2.12" )
- SET ( OPENOBEX_MIN_VERSION "1.1" )
diff --git a/meta-demoapps/recipes-connectivity/opensync/libsyncml_0.5.4.bb b/meta-demoapps/recipes-connectivity/opensync/libsyncml_0.5.4.bb
deleted file mode 100644
index e96463b..0000000
--- a/meta-demoapps/recipes-connectivity/opensync/libsyncml_0.5.4.bb
+++ /dev/null
@@ -1,17 +0,0 @@
-DESCRIPTION = "Libsyncml is a implementation of the SyncML protocol."
-HOMEPAGE = "http://libsyncml.opensync.org/"
-LICENSE = "LGPL"
-DEPENDS = "sed-native wbxml2 libsoup libxml2 bluez4 openobex libcheck"
-PR = "r1"
-
-SRC_URI = "${SOURCEFORGE_MIRROR}/libsyncml/0.5.4/libsyncml-0.5.4.tar.bz2 \
-           file://build-in-src.patch;patch=1"
-
-inherit cmake pkgconfig
-
-PACKAGES += "${PN}-tools"
-
-FILES_${PN}-tools = "${bindir}"
-FILES_${PN} = "${libdir}/*.so.*"
-
-export VERBOSE="1"
diff --git a/meta-demoapps/recipes-connectivity/opensync/msynctool_0.38.bb b/meta-demoapps/recipes-connectivity/opensync/msynctool_0.38.bb
deleted file mode 100644
index ff86a0b..0000000
--- a/meta-demoapps/recipes-connectivity/opensync/msynctool_0.38.bb
+++ /dev/null
@@ -1,20 +0,0 @@
-SUMMARY = "Calendar (and other PIM data) synchronization program"
-DESCRIPTION = "msynctool is a program to synchronize calendars, \
-addressbooks and other PIM data between programs on your computer and \
-other computers, mobile devices, PDAs or cell phones.  It uses the \
-OpenSync plugins when synchronizing data."
-HOMEPAGE = "http://www.opensync.org/"
-LICENSE = "GPLv2+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
-                    file://tools/msynctool.c;beginline=1;endline=20;md5=0b71ef245b75c74bff7d7ec58b9b4527"
-
-DEPENDS = "libopensync glib-2.0"
-
-SRC_URI = "http://www.opensync.org/download/releases/${PV}/msynctool-${PV}.tar.bz2"
-
-inherit cmake pkgconfig
-
-PR = "r0"
-
-SRC_URI[md5sum] = "495c45d6f12d3523a736864b0ced6ce5"
-SRC_URI[sha256sum] = "4a903d4db05bf2f677a675ec47e9791da9b1752c9feda0026157e82aa97e372b"
diff --git a/meta-demoapps/recipes-connectivity/telepathy/empathy/no-gnome-doc.patch b/meta-demoapps/recipes-connectivity/telepathy/empathy/no-gnome-doc.patch
deleted file mode 100644
index ee15f4d..0000000
--- a/meta-demoapps/recipes-connectivity/telepathy/empathy/no-gnome-doc.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-Upstream-Status: Inappropriate [disable feature]
-
----
- Makefile.am      |    2 +-
- configure.ac     |    1 -
- help/Makefile.am |    1 -
- 3 files changed, 1 insertion(+), 3 deletions(-)
-
---- empathy-0.23.4.orig/Makefile.am
-+++ empathy-0.23.4/Makefile.am
-@@ -1,6 +1,6 @@
--SUBDIRS = tools extensions po data libempathy libempathy-gtk src docs help
-+SUBDIRS = tools extensions po data libempathy libempathy-gtk src
- 
- if HAVE_MEGAPHONE
- SUBDIRS += megaphone
- endif
- 
---- empathy-0.23.4.orig/configure.ac
-+++ empathy-0.23.4/configure.ac
-@@ -55,11 +55,10 @@ AM_PROG_LIBTOOL
- AM_PROG_MKDIR_P
- AM_PATH_GLIB_2_0
- AC_PATH_XTRA
- IT_PROG_INTLTOOL([0.35.0])
- GTK_DOC_CHECK([1.3])
--GNOME_DOC_INIT
- IDT_COMPILE_WARNINGS
- AC_PATH_PROG(DBUS_BINDING_TOOL, dbus-binding-tool)
- AC_PATH_PROG(GCONFTOOL, gconftool-2)
- AM_GCONF_SOURCE_2
- GLIB_GENMARSHAL=`$PKG_CONFIG glib-2.0 --variable=glib_genmarshal`
---- empathy-0.23.4.orig/help/Makefile.am
-+++ empathy-0.23.4/help/Makefile.am
-@@ -1,6 +1,5 @@
--include $(top_srcdir)/gnome-doc-utils.make
- 
- DOC_MODULE = empathy
- DOC_ENTITIES = legal.xml
- DOC_FIGURES = \
- 	figures/empathy-main-window.png \
diff --git a/meta-demoapps/recipes-connectivity/telepathy/empathy_2.26.1.bb b/meta-demoapps/recipes-connectivity/telepathy/empathy_2.26.1.bb
deleted file mode 100644
index f4f8fae..0000000
--- a/meta-demoapps/recipes-connectivity/telepathy/empathy_2.26.1.bb
+++ /dev/null
@@ -1,29 +0,0 @@
-SUMMARY = "a Telepathy based IM client"
-DESCRIPTION = "Instant messaging program supporting text, voice, video, file \
-transfers and interapplication communication over many different protocols, \
-include: AIM, MSN, Google Talk (Jabber/XMPP), Facebook, Yahoo!, Salut, \
-Gadu-Gadu, Groupwise, ICQ and QQ."
-HOMEPAGE = "http://blogs.gnome.org/view/xclaesse/2007/04/26/0"
-LICENSE = "GPL"
-DEPENDS = "libcanberra telepathy-farsight gnome-doc-utils python-native telepathy-python telepathy-mission-control libtelepathy telepathy-glib gtk+ gconf libglade evolution-data-server"
-RDEPENDS_${PN} = "telepathy-mission-control"
-RRECOMMENDS_${PN} = "telepathy-gabble"
-PR = "r4"
-
-inherit gnome
-
-PARALLEL_MAKE = ""
-
-EXTRA_OECONF += "--disable-scrollkeeper"
-
-PACKAGES =+ "empathy-scrollkeeper-junk"
-FILES_empathy-scrollkeeper-junk = "/var/lib/scrollkeeper"
-
-FILES_${PN} += "${datadir}/mission-control/profiles/*.profile \
-        ${datadir}/dbus-1/services/*.service \
-        ${datadir}/telepathy/managers/*.chandler \
-	${datadir}/icons \
-	${libdir}/python*"
-
-FILES_${PN}-dbg += "${libdir}/python*/*/.debug"
-
diff --git a/meta-demoapps/recipes-connectivity/telepathy/telepathy-farsight_0.0.7.bb b/meta-demoapps/recipes-connectivity/telepathy/telepathy-farsight_0.0.7.bb
deleted file mode 100644
index 3ddee8f..0000000
--- a/meta-demoapps/recipes-connectivity/telepathy/telepathy-farsight_0.0.7.bb
+++ /dev/null
@@ -1,16 +0,0 @@
-SUMMARY = "Telepathy fasrsight"
-DESCRIPTION = "Glue library for telepathy media signalling and the media \
-streaming capabilities of Farsight2."
-HOMEPAGE = "http://telepathy.freedesktop.org/wiki/"
-DEPENDS = "glib-2.0 dbus telepathy-glib farsight2"
-LICENSE = "LGPLv2"
-
-SRC_URI = "http://telepathy.freedesktop.org/releases/telepathy-farsight/${BPN}-${PV}.tar.gz \
-"
-
-inherit autotools
-
-EXTRA_OECONF = "--disable-python"
-
-FILES_${PN} += "${datadir}/telepathy \
-		${datadir}/dbus-1"
diff --git a/meta-demoapps/recipes-connectivity/telepathy/telepathy-gabble/gabble.manager b/meta-demoapps/recipes-connectivity/telepathy/telepathy-gabble/gabble.manager
deleted file mode 100644
index 9000cd4..0000000
--- a/meta-demoapps/recipes-connectivity/telepathy/telepathy-gabble/gabble.manager
+++ /dev/null
@@ -1,33 +0,0 @@
-
-[ConnectionManager]
-BusName=org.freedesktop.Telepathy.ConnectionManager.gabble
-ObjectPath=/org/freedesktop/Telepathy/ConnectionManager/gabble
-
-[Protocol jabber]
-param-account=s required register
-param-password=s required register
-param-server=s
-param-resource=s
-param-priority=n
-param-port=q
-param-old-ssl=b
-param-register=b
-param-low-bandwidth=b
-param-https-proxy-server=s
-param-https-proxy-port=q
-param-fallback-conference-server=s
-param-stun-server=s
-param-stun-port=q
-param-ignore-ssl-errors=b
-param-alias=s
-param-mac=s
-param-btid=s
-default-resource=Telepathy
-default-priority=0
-default-port=5222
-default-old-ssl=false
-default-register=false
-default-low-bandwidth=false
-default-https-proxy-port=443
-default-stun-port=3478
-default-ignore-ssl-errors=false
diff --git a/meta-demoapps/recipes-connectivity/telepathy/telepathy-gabble_0.7.8.bb b/meta-demoapps/recipes-connectivity/telepathy/telepathy-gabble_0.7.8.bb
deleted file mode 100644
index 36e9d65..0000000
--- a/meta-demoapps/recipes-connectivity/telepathy/telepathy-gabble_0.7.8.bb
+++ /dev/null
@@ -1,18 +0,0 @@
-SUMMARY = "Telepathy Jabber/XMPP connection manager"
-DESCRIPTION = "Telepathy implementation of the Jabber/XMPP protocols."
-HOMEPAGE = "http://telepathy.freedesktop.org/wiki/"
-DEPENDS = "glib-2.0 dbus loudmouth telepathy-glib dbus-glib"
-LICENSE = "LGPL"
-
-# gabble.manager needs to get regenerated every release, so please don't copy it over blindly
-SRC_URI = "http://telepathy.freedesktop.org/releases/telepathy-gabble/${BPN}-${PV}.tar.gz \
-           file://gabble.manager"
-
-inherit autotools pkgconfig
-
-do_compile_prepend() {
-      cp ${WORKDIR}/gabble.manager ${S}/data/
-}
-
-FILES_${PN} += "${datadir}/telepathy \
-		${datadir}/dbus-1"
diff --git a/meta-demoapps/recipes-connectivity/wbxml/files/no-doc-install.patch b/meta-demoapps/recipes-connectivity/wbxml/files/no-doc-install.patch
deleted file mode 100644
index 1d9ea43..0000000
--- a/meta-demoapps/recipes-connectivity/wbxml/files/no-doc-install.patch
+++ /dev/null
@@ -1,17 +0,0 @@
-
-Upstream-Status: Inappropriate [configuration]
---- wbxml2-0.9.2/Makefile.am.old	2007-01-03 19:50:24.000000000 +0000
-+++ wbxml2-0.9.2/Makefile.am	2007-01-03 19:50:39.000000000 +0000
-@@ -24,9 +24,9 @@
- 	TODO\
- 	doxygen.h
- 
--install-data-local:
--	$(mkinstalldirs) $(DESTDIR)$(wbxmldocdir)/manual
--	cp -Rp doc/* $(DESTDIR)$(wbxmldocdir)/manual
-+#install-data-local:
-+#	$(mkinstalldirs) $(DESTDIR)$(wbxmldocdir)/manual
-+#	cp -Rp doc/* $(DESTDIR)$(wbxmldocdir)/manual
- 
- dist-bz2: distdir
- 	sed -e "s/tar.gz/tar.bz2/g" $(distdir)/wbxml2.spec > $(distdir)/wbxml2.spec.aux
diff --git a/meta-demoapps/recipes-connectivity/wbxml/wbxml2_0.9.2.bb b/meta-demoapps/recipes-connectivity/wbxml/wbxml2_0.9.2.bb
deleted file mode 100644
index 42655a1..0000000
--- a/meta-demoapps/recipes-connectivity/wbxml/wbxml2_0.9.2.bb
+++ /dev/null
@@ -1,24 +0,0 @@
-SUMMARY = "Parsing and Encoding of WBXML documents"
-DESCRIPTION = "The WBXML Library (aka libwbxml) contains a library and \
-its associated tools to Parse, Encode and Handle WBXML documents. The \
-WBXML format is a binary representation of XML, defined by the Wap \
-Forum, and used to reduce bandwidth in mobile communications."
-LICENSE = "GPLv2"
-
-DEPENDS = "libxml2 sed-native expat"
-
-SRC_URI = "${SOURCEFORGE_MIRROR}/wbxmllib/${BPN}-${PV}.tar.gz \
-	   file://no-doc-install.patch;patch=1"
-
-inherit autotools pkgconfig
-
-do_configure_append() {
-	sed -i s:-I/usr/include::g Makefile
-	sed -i s:-I/usr/include::g */Makefile
-}
-
-PACKAGES += "${PN}-tools"
-
-FILES_${PN}-tools = "${bindir}"
-FILES_${PN} = "${libdir}/*.so.*"
-
diff --git a/meta-demoapps/recipes-gnome/abiword/abiword-2.5.inc b/meta-demoapps/recipes-gnome/abiword/abiword-2.5.inc
deleted file mode 100644
index 511ae97..0000000
--- a/meta-demoapps/recipes-gnome/abiword/abiword-2.5.inc
+++ /dev/null
@@ -1,64 +0,0 @@
-DESCRIPTION = "AbiWord is free word processing program similar to Microsoft(r) Word"
-HOMEPAGE = "http://www.abiword.org"
-SECTION = "x11/office"
-LICENSE = "GPLv2"
-DEPENDS     = "perl-native wv libgsf libglade libfribidi jpeg libpng libxml2"
-RDEPENDS_${PN}    = "glibc-gconv-ibm850 glibc-gconv-cp1252 \
-               glibc-gconv-iso8859-15 glibc-gconv-iso8859-1"
-
-SRC_URI = "http://www.abiword.org/downloads/abiword/${PV}/source/abiword-${PV}.tar.gz"
-
-#want 2.x from 2.x.y for the installation directory
-SHRT_VER = "${@d.getVar('PV',1).split('.')[0]}.${@d.getVar('PV',1).split('.')[1]}"
-
-FILES_${PN} += " \
-		${datadir}/icons/* \
-		${datadir}/abiword-${SHRT_VER}/glade \
-		${datadir}/abiword-${SHRT_VER}/scripts \
-		${datadir}/abiword-${SHRT_VER}/system.profile-en \
-		${datadir}/abiword-${SHRT_VER}/system.profile-en_GB \
-		${datadir}/abiword-${SHRT_VER}/templates/normal.awt \
-		${datadir}/abiword-${SHRT_VER}/templates/normal.awt-en_GB \
-		${datadir}/abiword-${SHRT_VER}/templates/Employee-Directory.awt \
-		${datadir}/abiword-${SHRT_VER}/templates/Business-Report.awt \
-		${datadir}/abiword-${SHRT_VER}/templates/Fax-Coversheet.awt \
-		${datadir}/abiword-${SHRT_VER}/templates/Resume.awt \
-		${datadir}/abiword-${SHRT_VER}/templates/Two-Columns.awt \
-		${datadir}/abiword-${SHRT_VER}/templates/Memo.awt \
-		${datadir}/abiword-${SHRT_VER}/templates/Press-Release.awt "
-
-#		${datadir}/abiword-${SHRT_VER}/templates/A4.awt \
-#		${datadir}/abiword-${SHRT_VER}/templates/US-Letter.awt \
-
-inherit autotools pkgconfig
-
-PARALLEL_MAKE = ""
-
-EXTRA_OECONF = " --disable-pspell \
-                 --disable-spellcheck \
-		 --disable-printing \
-		 --disable-exports \
-		 --with-sys-wv"
-
-# AbiWord configure.ac does not play nicely with autoreconf
-# so use the autogen.sh script that comes with AbiWord
-#
-do_configure() {
-        cd ${S}
-        export NOCONFIGURE="no"; ./autogen.sh
-        oe_runconf
-}
-
-
-do_install_append() {
-        install -d ${D}${datadir}/pixmaps/
-        mv ${D}${datadir}/icons/* ${D}${datadir}/pixmaps/
-}
-
-PACKAGES += " abiword-clipart abiword-icons abiword-strings abiword-systemprofiles abiword-templates "
-
-FILES_abiword-clipart 		+= "${datadir}/abiword-${SHRT_VER}/clipart"
-FILES_abiword-icons 		+= "${datadir}/abiword-${SHRT_VER}/icons"
-FILES_abiword-strings 		+= "${datadir}/abiword-${SHRT_VER}/AbiWord/strings"
-FILES_abiword-systemprofiles 	+= "${datadir}/abiword-${SHRT_VER}/AbiWord/system.profile*"
-FILES_abiword-templates 	+= "${datadir}/abiword-${SHRT_VER}/templates"
diff --git a/meta-demoapps/recipes-gnome/abiword/abiword-embedded_2.5.2.bb b/meta-demoapps/recipes-gnome/abiword/abiword-embedded_2.5.2.bb
deleted file mode 100644
index 7ee0f86..0000000
--- a/meta-demoapps/recipes-gnome/abiword/abiword-embedded_2.5.2.bb
+++ /dev/null
@@ -1,12 +0,0 @@
-require abiword-2.5.inc
-
-PR = "r1"
-
-EXTRA_OECONF += "--enable-embedded"
-
-S = "${WORKDIR}/abiword-${PV}"
-
-RCONFLICTS = "abiword"
-RPROVIDES += "abiword"
-
-
diff --git a/meta-demoapps/recipes-gnome/abiword/abiword.inc b/meta-demoapps/recipes-gnome/abiword/abiword.inc
deleted file mode 100644
index 036f98f..0000000
--- a/meta-demoapps/recipes-gnome/abiword/abiword.inc
+++ /dev/null
@@ -1,64 +0,0 @@
-DESCRIPTION = "AbiWord is free word processing program similar to Microsoft(r) Word"
-SECTION = "gnome/office"
-HOMEPAGE = "http://www.abiword.org""
-LICENSE = "GPLv2"
-
-DEPENDS     = "libgsf libglade libfribidi libxml2 wv"
-RRECOMMENDS_${PN}    = "glibc-gconv-ibm850 glibc-gconv-cp1252 \
-               glibc-gconv-iso8859-15 glibc-gconv-iso8859-1"
-
-# Share this file between recipes that use cvs and that pull tarballs
-# (one day change this to differentiate automatically based on PV and set the
-# SRC_URI and S var directly)
-RELURI = "http://www.abiword.org/downloads/abiword/${PV}/source/abiword-${PV}.tar.gz"
-RELSRC = "${WORKDIR}/abiword-${PV}/abi"
-
-SVNURI = "svn://svn.abisource.com/abiword/trunk;module=abiword;proto=http"
-SVNSRC = "${WORKDIR}/abi"
-
-#want 2.x from 2.x.y for the installation directory
-SHRT_VER = "${@d.getVar('PV',1).split('.')[0]}.${@d.getVar('PV',1).split('.')[1]}"
-
-FILES_${PN} += " \
-		${datadir}/icons/* \
-		${datadir}/mime-info \
-		${datadir}/abiword-${SHRT_VER}/glade \
-		${datadir}/abiword-${SHRT_VER}/system.profile-en \
-		${datadir}/abiword-${SHRT_VER}/system.profile-en-GB \
-  "
-
-#		${datadir}/abiword-${SHRT_VER}/templates/normal.awt \
-#		${datadir}/abiword-${SHRT_VER}/templates/normal.awt-en_GB \
-
-inherit autotools pkgconfig
-
-PARALLEL_MAKE = ""
-
-# This is a minimalistic AbiWord build
-#
-# if you are planning to build plugins, make sure to comment out the
-# --disable-exports options
-
-EXTRA_OECONF = " --enable-embedded=poky    \
-		 --disable-printing   \
-		 --with-sys-wv 	     \
-		 --disable-exports    \
-		 --disable-spellcheck"
-
-# TODO -- refactor this, so that instead of two strings and profiles
-# packages we have lots of locale packages, each with a set of strings and
-# a profile
-#
-PACKAGES += " abiword-strings abiword-systemprofiles"
-
-FILES_abiword-strings 		+= "${datadir}/abiword-${SHRT_VER}/strings"
-FILES_abiword-systemprofiles 	+= "${datadir}/abiword-${SHRT_VER}/system.profile*"
-
-# AbiWord configure.ac does not play nicely with autoreconf
-# so use the autogen.sh script that comes with AbiWord
-#
-do_configure() {
-	cd ${S}
-	export NOCONFIGURE="no"; ./autogen.sh
-	oe_runconf
-}
diff --git a/meta-demoapps/recipes-gnome/abiword/abiword_2.5.2.bb b/meta-demoapps/recipes-gnome/abiword/abiword_2.5.2.bb
deleted file mode 100644
index c10d761..0000000
--- a/meta-demoapps/recipes-gnome/abiword/abiword_2.5.2.bb
+++ /dev/null
@@ -1,5 +0,0 @@
-require abiword-2.5.inc
-
-PR = "r2"
-
-RCONFLICTS_${PN} = "abiword-embedded"
diff --git a/meta-demoapps/recipes-gnome/abiword/abiword_svn.bb b/meta-demoapps/recipes-gnome/abiword/abiword_svn.bb
deleted file mode 100644
index a8946a8..0000000
--- a/meta-demoapps/recipes-gnome/abiword/abiword_svn.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-require abiword.inc
-
-SRCREV = "21818"
-PV="2.5.2+svnr${SRCPV}"
-PR = "r0"
-
-SRC_URI = "${SVNURI}"
-
-S = "${SVNSRC}"
-
diff --git a/meta-demoapps/recipes-gnome/gcalctool/gcalctool/fix-includedir.patch b/meta-demoapps/recipes-gnome/gcalctool/gcalctool/fix-includedir.patch
deleted file mode 100644
index 64a9aff..0000000
--- a/meta-demoapps/recipes-gnome/gcalctool/gcalctool/fix-includedir.patch
+++ /dev/null
@@ -1,33 +0,0 @@
----
- Makefile.am           |    2 +-
- gcalctool/Makefile.am |    2 --
- 2 files changed, 1 insertion(+), 3 deletions(-)
-
-Upstream-Status: Inappropriate [configuration]
-
-Index: gcalctool-5.8.17/gcalctool/Makefile.am
-===================================================================
---- gcalctool-5.8.17.orig/gcalctool/Makefile.am	2005-12-19 15:46:57.000000000 +0000
-+++ gcalctool-5.8.17/gcalctool/Makefile.am	2007-05-16 16:03:26.000000000 +0100
-@@ -1,8 +1,6 @@
- ## Process this file with automake to produce Makefile.in
- 
- INCLUDES = \
--	-I$(includedir) \
--	-DG_DISABLE_DEPRECATED \
- 	-DGDK_PIXBUF_DISABLE_DEPRECATED \
- 	-DGDK_DISABLE_DEPRECATED \
- 	-DGNOME_DISABLE_DEPRECATED \
-Index: gcalctool-5.8.17/Makefile.am
-===================================================================
---- gcalctool-5.8.17.orig/Makefile.am	2007-05-16 15:35:44.000000000 +0100
-+++ gcalctool-5.8.17/Makefile.am	2007-05-16 16:06:46.000000000 +0100
-@@ -29,7 +29,7 @@ DISTCLEANFILES =                \
- 	gnome-doc-utils.make	\
- 	gcalctool.desktop
- 
--SUBDIRS = po gcalctool help
-+SUBDIRS = po gcalctool
- 
- SCHEMAS_FILE = gcalctool.schemas
- 
diff --git a/meta-demoapps/recipes-gnome/gcalctool/gcalctool_5.7.32.bb b/meta-demoapps/recipes-gnome/gcalctool/gcalctool_5.7.32.bb
deleted file mode 100644
index 4b74cf1..0000000
--- a/meta-demoapps/recipes-gnome/gcalctool/gcalctool_5.7.32.bb
+++ /dev/null
@@ -1,13 +0,0 @@
-LICENSE = "GPL"
-SECTION = "x11"
-DEPENDS = "gtk+"
-DESCRIPTION = "gcalctool is a powerful calculator"
-PR = "r2"
-
-SRC_URI = "http://download.gnome.org/sources/${BPN}/5.7/${BPN}-${PV}.tar.gz \
-        file://makefile-fix.diff;patch=1\
-	file://fix-includedir.patch;patch=1"
-
-inherit autotools pkgconfig
-
-EXTRA_OECONF = "--disable-gnome"
diff --git a/meta-demoapps/recipes-gnome/gcalctool/gcalctool_5.8.17.bb b/meta-demoapps/recipes-gnome/gcalctool/gcalctool_5.8.17.bb
deleted file mode 100644
index 8854ecf..0000000
--- a/meta-demoapps/recipes-gnome/gcalctool/gcalctool_5.8.17.bb
+++ /dev/null
@@ -1,12 +0,0 @@
-LICENSE = "GPL"
-SECTION = "x11"
-DEPENDS = "gtk+ gnome-doc-utils"
-DESCRIPTION = "gcalctool is a powerful calculator"
-PR = "r0"
-
-SRC_URI = "http://download.gnome.org/sources/${BPN}/5.8/${BPN}-${PV}.tar.gz \
-	file://fix-includedir.patch;patch=1"
-
-inherit autotools pkgconfig
-
-EXTRA_OECONF = "--disable-gnome"
diff --git a/meta-demoapps/recipes-gnome/gnome/gnome-settings-daemon/configurefix.patch b/meta-demoapps/recipes-gnome/gnome/gnome-settings-daemon/configurefix.patch
deleted file mode 100644
index 892946f..0000000
--- a/meta-demoapps/recipes-gnome/gnome/gnome-settings-daemon/configurefix.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-Upstream-Status: Inappropriate [configuration]
-
-Index: gnome-settings-daemon-2.26.1/configure.ac
-===================================================================
---- gnome-settings-daemon-2.26.1.orig/configure.ac	2009-09-16 22:57:31.000000000 +0100
-+++ gnome-settings-daemon-2.26.1/configure.ac	2009-09-16 22:58:45.000000000 +0100
-@@ -133,9 +133,6 @@
- #
- AC_DEFUN([AC_CHECK_X_HEADERS], [
-   ac_save_CPPFLAGS="$CPPFLAGS"
--  if test \! -z "$includedir" ; then
--    CPPFLAGS="$CPPFLAGS -I$includedir"
--  fi
-   CPPFLAGS="$CPPFLAGS $X_CFLAGS"
-   AC_CHECK_HEADERS([$1],[$2],[$3],[$4])
-   CPPFLAGS="$ac_save_CPPFLAGS"])
-@@ -148,15 +145,9 @@
-   ac_save_LDFLAGS="$LDFLAGS"
- #  ac_save_LIBS="$LIBS"
- 
--  if test \! -z "$includedir" ; then
--    CPPFLAGS="$CPPFLAGS -I$includedir"
--  fi
-   # note: $X_CFLAGS includes $x_includes
-   CPPFLAGS="$CPPFLAGS $X_CFLAGS"
- 
--  if test \! -z "$libdir" ; then
--    LDFLAGS="$LDFLAGS -L$libdir"
--  fi
-   # note: $X_LIBS includes $x_libraries
-   LDFLAGS="$LDFLAGS $ALL_X_LIBS"
- 
diff --git a/meta-demoapps/recipes-gnome/gnome/gnome-settings-daemon/desktop-moblin.patch b/meta-demoapps/recipes-gnome/gnome/gnome-settings-daemon/desktop-moblin.patch
deleted file mode 100644
index b8f1661..0000000
--- a/meta-demoapps/recipes-gnome/gnome/gnome-settings-daemon/desktop-moblin.patch
+++ /dev/null
@@ -1,13 +0,0 @@
-Upstream-Status: Inappropriate [configuration]
-
---- gnome-settings-daemon-2.26.1/data/gnome-settings-daemon.desktop.in.in~	2009-04-24 20:59:51.000000000 -0700
-+++ gnome-settings-daemon-2.26.1/data/gnome-settings-daemon.desktop.in.in	2009-04-24 20:59:51.000000000 -0700
-@@ -2,7 +2,7 @@
- Type=Application
- _Name=GNOME Settings Daemon
- Exec=@LIBEXECDIR@/gnome-settings-daemon
--OnlyShowIn=GNOME;
-+OnlyShowIn=GNOME;MOBLIN;
- X-GNOME-Autostart-Phase=Initialization
- X-GNOME-Autostart-Notify=true
- X-GNOME-AutoRestart=true
diff --git a/meta-demoapps/recipes-gnome/gnome/gnome-settings-daemon/gnome-settings-daemon-2.24.0-catch-deviceadded.patch b/meta-demoapps/recipes-gnome/gnome/gnome-settings-daemon/gnome-settings-daemon-2.24.0-catch-deviceadded.patch
deleted file mode 100644
index b9cf6e1..0000000
--- a/meta-demoapps/recipes-gnome/gnome/gnome-settings-daemon/gnome-settings-daemon-2.24.0-catch-deviceadded.patch
+++ /dev/null
@@ -1,21 +0,0 @@
-Upstream-Status: Pending
-
-============================================================
- Listen for DeviceAdded in addition to DeviceEnabled
-
-  This should help address problems like left-handed
-mouse, and acceleration settings getting lost after
-resume, or when new devices gets plugged in.
-
-diff --git a/plugins/mouse/gsd-mouse-manager.c b/plugins/mouse/gsd-mouse-manager.c
---- a/plugins/mouse/gsd-mouse-manager.c
-+++ b/plugins/mouse/gsd-mouse-manager.c
-@@ -320,7 +320,7 @@ devicepresence_filter (GdkXEvent *xevent,
-         if (xev->type == xi_presence)
-         {
-             XDevicePresenceNotifyEvent *dpn = (XDevicePresenceNotifyEvent *) xev;
--            if (dpn->devchange == DeviceEnabled)
-+            if (dpn->devchange == DeviceEnabled || dpn->devchange == DeviceAdded)
-                 set_mouse_settings ((GsdMouseManager *) data);
-         }
-         return GDK_FILTER_CONTINUE;
diff --git a/meta-demoapps/recipes-gnome/gnome/gnome-settings-daemon/gnome-settings-daemon-fix-gthread.patch b/meta-demoapps/recipes-gnome/gnome/gnome-settings-daemon/gnome-settings-daemon-fix-gthread.patch
deleted file mode 100644
index 965da09..0000000
--- a/meta-demoapps/recipes-gnome/gnome/gnome-settings-daemon/gnome-settings-daemon-fix-gthread.patch
+++ /dev/null
@@ -1,15 +0,0 @@
-Upstream-Status: Inappropriate [configuration]
-
-Index: gnome-settings-daemon-2.25.90/configure.ac
-===================================================================
---- gnome-settings-daemon-2.25.90.orig/configure.ac
-+++ gnome-settings-daemon-2.25.90/configure.ac
-@@ -85,6 +85,8 @@ AC_PATH_PROG(GCONFTOOL, gconftool-2)
- 
- AM_GCONF_SOURCE_2
- 
-+AC_CHECK_LIB(gthread-2.0, g_thread_init)
-+
- dnl ---------------------------------------------------------------------------
- dnl - Check for libnotify
- dnl ---------------------------------------------------------------------------
diff --git a/meta-demoapps/recipes-gnome/gnome/gnome-settings-daemon/mojito-cleanup.patch b/meta-demoapps/recipes-gnome/gnome/gnome-settings-daemon/mojito-cleanup.patch
deleted file mode 100644
index 79f2871..0000000
--- a/meta-demoapps/recipes-gnome/gnome/gnome-settings-daemon/mojito-cleanup.patch
+++ /dev/null
@@ -1,76 +0,0 @@
-Upstream-Status: Pending
-
-diff --git a/plugins/housekeeping/gsd-housekeeping-manager.c b/plugins/housekeeping/gsd-housekeeping-manager.c
-index f84cfad..e8f474a 100644
---- a/plugins/housekeeping/gsd-housekeeping-manager.c
-+++ b/plugins/housekeeping/gsd-housekeeping-manager.c
-@@ -85,9 +85,13 @@ thumb_data_free (gpointer data)
-         }
- }
- 
-+typedef enum {
-+  HASH,
-+  HASH_PNG
-+} FileType;
- 
- static GList *
--read_dir_for_purge (const char *path, GList *files)
-+read_dir_for_purge (const char *path, GList *files, FileType type)
- {
-         GFile           *read_path;
-         GFileEnumerator *enum_dir;
-@@ -105,9 +109,20 @@ read_dir_for_purge (const char *path, GList *files)
-                 GFileInfo *info;
-                 while ((info = g_file_enumerator_next_file (enum_dir, NULL, NULL)) != NULL) {
-                         const char *name;
-+                        gboolean prune = FALSE;
-+
-                         name = g_file_info_get_name (info);
- 
--                        if (strlen (name) == 36 && strcmp (name + 32, ".png") == 0) {
-+                        switch (type) {
-+                        case HASH:
-+                          prune = (strlen (name) == 36);
-+                          break;
-+                        case HASH_PNG:
-+                          prune = (strlen (name) == 36 && strcmp (name + 32, ".png") == 0);
-+                          break;
-+                        }
-+
-+                        if (prune) {
-                                 ThumbData *td;
-                                 GFile     *entry;
-                                 char      *entry_path;
-@@ -197,14 +212,14 @@ purge_thumbnail_cache (void)
-                                  ".thumbnails",
-                                  "normal",
-                                  NULL);
--        files = read_dir_for_purge (path, NULL);
-+        files = read_dir_for_purge (path, NULL, HASH_PNG);
-         g_free (path);
- 
-         path = g_build_filename (g_get_home_dir (),
-                                  ".thumbnails",
-                                  "large",
-                                  NULL);
--        files = read_dir_for_purge (path, files);
-+        files = read_dir_for_purge (path, files, HASH_PNG);
-         g_free (path);
- 
-         path = g_build_filename (g_get_home_dir (),
-@@ -212,7 +227,14 @@ purge_thumbnail_cache (void)
-                                  "fail",
-                                  "gnome-thumbnail-factory",
-                                  NULL);
--        files = read_dir_for_purge (path, files);
-+        files = read_dir_for_purge (path, files, HASH_PNG);
-+        g_free (path);
-+
-+        path = g_build_filename (g_get_user_cache_dir (),
-+                                 "mojito",
-+                                 "thumbnails",
-+                                 NULL);
-+        files = read_dir_for_purge (path, files, HASH);
-         g_free (path);
- 
-         g_get_current_time (&current_time);
diff --git a/meta-demoapps/recipes-gnome/gnome/gnome-settings-daemon/mount-plugin.patch b/meta-demoapps/recipes-gnome/gnome/gnome-settings-daemon/mount-plugin.patch
deleted file mode 100644
index 25dc36e..0000000
--- a/meta-demoapps/recipes-gnome/gnome/gnome-settings-daemon/mount-plugin.patch
+++ /dev/null
@@ -1,620 +0,0 @@
-Upstream-Status: Pending
-
-diff --git a/configure.ac b/configure.ac
-index 135f2ce..ba737a5 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -356,6 +356,7 @@ plugins/keybindings/Makefile
- plugins/keyboard/Makefile
- plugins/media-keys/Makefile
- plugins/media-keys/cut-n-paste/Makefile
-+plugins/mount/Makefile
- plugins/mouse/Makefile
- plugins/screensaver/Makefile
- plugins/sound/Makefile
-diff --git a/data/gnome-settings-daemon.schemas.in b/data/gnome-settings-daemon.schemas.in
-index 4920ae3..502e9e6 100644
---- a/data/gnome-settings-daemon.schemas.in
-+++ b/data/gnome-settings-daemon.schemas.in
-@@ -557,5 +557,29 @@
-       </locale>
-     </schema>
- 
-+    <schema>
-+      <key>/schemas/apps/gnome_settings_daemon/plugins/mount/active</key>
-+      <applyto>/apps/gnome_settings_daemon/plugins/mount/active</applyto>
-+      <owner>gnome-settings-daemon</owner>
-+      <type>bool</type>
-+      <default>TRUE</default>
-+      <locale name="C">
-+        <short>Enable mount plugin</short>
-+        <long>Set to True to enable the plugin to automount media.</long>
-+      </locale>
-+    </schema>
-+    <schema>
-+      <key>/schemas/apps/gnome_settings_daemon/plugins/mount/priority</key>
-+      <applyto>/apps/gnome_settings_daemon/plugins/mount/priority</applyto>
-+      <owner>gnome-settings-daemon</owner>
-+      <type>int</type>
-+      <default>99</default>
-+      <locale name="C">
-+        <short></short>
-+        <long></long>
-+      </locale>
-+    </schema>
-+
-+
-   </schemalist>
- </gconfschemafile>
-diff --git a/plugins/Makefile.am b/plugins/Makefile.am
-index 2d33061..46615c1 100644
---- a/plugins/Makefile.am
-+++ b/plugins/Makefile.am
-@@ -11,6 +11,7 @@ SUBDIRS =		\
- 	keybindings	\
- 	keyboard	\
- 	media-keys	\
-+	mount		\
- 	mouse		\
- 	screensaver	\
- 	sound		\
-diff --git a/plugins/mount/Makefile.am b/plugins/mount/Makefile.am
-new file mode 100644
-index 0000000..188c83d
---- /dev/null
-+++ b/plugins/mount/Makefile.am
-@@ -0,0 +1,39 @@
-+plugin_LTLIBRARIES = \
-+	libmount.la
-+
-+libmount_la_SOURCES = 		\
-+	gsd-mount-manager.c	\
-+	gsd-mount-manager.h	\
-+	gsd-mount-plugin.c	\
-+	gsd-mount-plugin.h
-+
-+libmount_la_CPPFLAGS = \
-+	-I$(top_srcdir)/gnome-settings-daemon		\
-+	-DGNOME_SETTINGS_LOCALEDIR=\""$(datadir)/locale"\" \
-+	$(AM_CPPFLAGS)
-+
-+libmount_la_CFLAGS = \
-+	$(SETTINGS_PLUGIN_CFLAGS)	\
-+	$(AM_CFLAGS)
-+
-+libmount_la_LDFLAGS = 		\
-+	$(GSD_PLUGIN_LDFLAGS)
-+
-+libmount_la_LIBADD  = 		\
-+	$(SETTINGS_PLUGIN_LIBS)
-+
-+plugin_in_files = 		\
-+	mount.gnome-settings-plugin.in
-+
-+plugin_DATA = $(plugin_in_files:.gnome-settings-plugin.in=.gnome-settings-plugin)
-+
-+EXTRA_DIST = 			\
-+	$(plugin_in_files)
-+
-+CLEANFILES = 			\
-+	$(plugin_DATA)
-+
-+DISTCLEANFILES =		\
-+	$(plugin_DATA)
-+
-+@GSD_INTLTOOL_PLUGIN_RULE@
-diff --git a/plugins/mount/gsd-mount-manager.c b/plugins/mount/gsd-mount-manager.c
-new file mode 100644
-index 0000000..a768f03
---- /dev/null
-+++ b/plugins/mount/gsd-mount-manager.c
-@@ -0,0 +1,261 @@
-+/* -*- Mode: C; tab-width: 8; indent-tabs-mode: nil; c-basic-offset: 8 -*-
-+ *
-+ * Copyright (C) 2009 Intel Corporation
-+ *
-+ * This program is free software; you can redistribute it and/or modify it under
-+ * the terms of the GNU General Public License as published by the Free Software
-+ * Foundation; either version 2 of the License, or (at your option) any later
-+ * version.
-+ *
-+ * This program is distributed in the hope that it will be useful, but WITHOUT
-+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
-+ * FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more
-+ * details.
-+ *
-+ * You should have received a copy of the GNU General Public License along with
-+ * this program; if not, write to the Free Software Foundation, Inc., 59 Temple
-+ * Place - Suite 330, Boston, MA 02111-1307, USA.
-+ *
-+ */
-+
-+#include <config.h>
-+
-+#include <glib.h>
-+#include <glib/gi18n.h>
-+#include <gio/gio.h>
-+#include <gtk/gtk.h>
-+
-+#include "gsd-mount-manager.h"
-+
-+#define GSD_MOUNT_MANAGER_GET_PRIVATE(o) (G_TYPE_INSTANCE_GET_PRIVATE ((o), GSD_TYPE_MOUNT_MANAGER, GsdMountManagerPrivate))
-+
-+struct GsdMountManagerPrivate
-+{
-+        GVolumeMonitor *monitor;
-+};
-+
-+G_DEFINE_TYPE (GsdMountManager, gsd_mount_manager, G_TYPE_OBJECT)
-+
-+static gpointer manager_object = NULL;
-+
-+#if 0
-+static void
-+drive_connected_cb (GVolumeMonitor *monitor,
-+                    GDrive *drive,
-+                    GsdMountManager *manager)
-+{
-+        /* TODO: listen for the eject button */
-+}
-+#endif
-+
-+static void
-+volume_mounted_cb (GObject *source_object, GAsyncResult *result, gpointer user_data)
-+{
-+        GError *error = NULL;
-+        char *name;
-+
-+        name = g_volume_get_name (G_VOLUME (source_object));
-+
-+	if (!g_volume_mount_finish (G_VOLUME (source_object), result, &error)) {
-+                g_debug ("Failed to mount '%s': %s", name, error->message);
-+
-+		if (error->code != G_IO_ERROR_FAILED_HANDLED) {
-+                        char *primary;
-+                        GtkWidget *dialog;
-+
-+			primary = g_strdup_printf (_("Unable to mount %s"), name);
-+
-+                        dialog = gtk_message_dialog_new (NULL, 0,
-+                                                         GTK_MESSAGE_ERROR,
-+                                                         GTK_BUTTONS_CLOSE,
-+                                                         primary);
-+
-+			g_free (primary);
-+                        gtk_message_dialog_format_secondary_text (GTK_MESSAGE_DIALOG (dialog), error->message);
-+
-+                        gtk_dialog_run (GTK_DIALOG (dialog));
-+                        gtk_widget_destroy (dialog);
-+		}
-+		g_error_free (error);
-+	} else {
-+                g_debug ("Mounted '%s'", name);
-+        }
-+
-+        g_free (name);
-+}
-+
-+static void
-+volume_added_cb (GVolumeMonitor *monitor,
-+                 GVolume *volume,
-+                 GsdMountManager *manager)
-+{
-+        char *name;
-+
-+        name = g_volume_get_name (volume);
-+        g_debug ("Volme '%s' added", name);
-+
-+        if (g_volume_can_mount (volume)) {
-+                GMountOperation *mount_op;
-+
-+                g_debug ("Mounting '%s'", name);
-+
-+                mount_op = gtk_mount_operation_new (NULL);
-+                g_volume_mount (volume, G_MOUNT_MOUNT_NONE,
-+                                mount_op, NULL,
-+                                volume_mounted_cb, manager);
-+        }
-+
-+        g_free (name);
-+}
-+
-+static void
-+mount_added_cb (GVolumeMonitor *monitor,
-+                GMount *mount,
-+                GsdMountManager *manager)
-+{
-+        GFile *file;
-+        char *uri;
-+
-+        file = g_mount_get_root (mount);
-+        uri = g_file_get_uri (file);
-+
-+        g_debug ("%s mounted, starting file manager", uri);
-+
-+        /* TODO: error */
-+        gtk_show_uri (NULL, uri, GDK_CURRENT_TIME, NULL);
-+
-+        g_free (uri);
-+        g_object_unref (file);
-+}
-+
-+static void
-+mount_existing_volumes (GsdMountManager *manager)
-+{
-+        /* TODO: iterate over drives to hook up eject */
-+        GList *l;
-+
-+        g_debug ("Mounting existing volumes");
-+
-+        l = g_volume_monitor_get_volumes (manager->priv->monitor);
-+        while (l) {
-+                GVolume *volume = l->data;
-+                GMount *mount;
-+
-+                mount = g_volume_get_mount (volume);
-+                if (mount == NULL &&
-+                    g_volume_can_mount (volume) &&
-+                    g_volume_should_automount (volume)) {
-+                        GMountOperation *mount_op;
-+                        char *name;
-+
-+                        name = g_volume_get_name (volume);
-+                        g_debug ("Mounting '%s'", name);
-+                        g_free (name);
-+
-+                        mount_op = gtk_mount_operation_new (NULL);
-+                        g_volume_mount (volume, G_MOUNT_MOUNT_NONE,
-+                                        mount_op, NULL,
-+                                        volume_mounted_cb, manager);
-+                }
-+
-+                if (mount)
-+                        g_object_unref (mount);
-+                g_object_unref (volume);
-+                l = g_list_delete_link (l, l);
-+        }
-+}
-+
-+gboolean
-+gsd_mount_manager_start (GsdMountManager *manager,
-+                               GError               **error)
-+{
-+        g_debug ("Starting mount manager");
-+
-+        manager->priv->monitor = g_volume_monitor_get ();
-+
-+#if 0
-+	g_signal_connect_object (manager->priv->monitor, "drive-connected",
-+				 G_CALLBACK (drive_connected_cb), manager, 0);
-+#endif
-+	g_signal_connect_object (manager->priv->monitor, "volume-added",
-+				 G_CALLBACK (volume_added_cb), manager, 0);
-+	g_signal_connect_object (manager->priv->monitor, "mount-added",
-+				 G_CALLBACK (mount_added_cb), manager, 0);
-+
-+        /* TODO: handle eject buttons */
-+
-+#if 0
-+        mount_existing_volumes (manager);
-+#endif
-+
-+        return TRUE;
-+}
-+
-+void
-+gsd_mount_manager_stop (GsdMountManager *manager)
-+{
-+        g_debug ("Stopping mount manager");
-+}
-+
-+static void
-+gsd_mount_manager_dispose (GObject *object)
-+{
-+        GsdMountManager *manager = GSD_MOUNT_MANAGER (object);
-+
-+        if (manager->priv->monitor) {
-+                g_signal_handlers_disconnect_by_func
-+                        (manager->priv->monitor, volume_added_cb, manager);
-+                g_signal_handlers_disconnect_by_func
-+                        (manager->priv->monitor, mount_added_cb, manager);
-+                g_object_unref (manager->priv->monitor);
-+                manager->priv->monitor = NULL;
-+        }
-+
-+        G_OBJECT_CLASS (gsd_mount_manager_parent_class)->dispose (object);
-+}
-+
-+static void
-+gsd_mount_manager_init (GsdMountManager *manager)
-+{
-+        manager->priv = GSD_MOUNT_MANAGER_GET_PRIVATE (manager);
-+}
-+
-+static void
-+gsd_mount_manager_finalize (GObject *object)
-+{
-+        GsdMountManager *mount_manager;
-+
-+        g_return_if_fail (object != NULL);
-+        g_return_if_fail (GSD_IS_MOUNT_MANAGER (object));
-+
-+        mount_manager = GSD_MOUNT_MANAGER (object);
-+
-+        g_return_if_fail (mount_manager->priv != NULL);
-+
-+        G_OBJECT_CLASS (gsd_mount_manager_parent_class)->finalize (object);
-+}
-+
-+static void
-+gsd_mount_manager_class_init (GsdMountManagerClass *klass)
-+{
-+        GObjectClass   *object_class = G_OBJECT_CLASS (klass);
-+
-+        object_class->dispose = gsd_mount_manager_dispose;
-+        object_class->finalize = gsd_mount_manager_finalize;
-+
-+        g_type_class_add_private (klass, sizeof (GsdMountManagerPrivate));
-+}
-+
-+GsdMountManager *
-+gsd_mount_manager_new (void)
-+{
-+        if (manager_object != NULL) {
-+                g_object_ref (manager_object);
-+        } else {
-+                manager_object = g_object_new (GSD_TYPE_MOUNT_MANAGER, NULL);
-+                g_object_add_weak_pointer (manager_object,
-+                                           (gpointer *) &manager_object);
-+        }
-+
-+        return GSD_MOUNT_MANAGER (manager_object);
-+}
-diff --git a/plugins/mount/gsd-mount-manager.h b/plugins/mount/gsd-mount-manager.h
-new file mode 100644
-index 0000000..9093fff
---- /dev/null
-+++ b/plugins/mount/gsd-mount-manager.h
-@@ -0,0 +1,58 @@
-+/* -*- Mode: C; tab-width: 8; indent-tabs-mode: nil; c-basic-offset: 8 -*-
-+ *
-+ * Copyright (C) 2009 Intel Corporation
-+ *
-+ * This program is free software; you can redistribute it and/or modify it under
-+ * the terms of the GNU General Public License as published by the Free Software
-+ * Foundation; either version 2 of the License, or (at your option) any later
-+ * version.
-+ *
-+ * This program is distributed in the hope that it will be useful, but WITHOUT
-+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
-+ * FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more
-+ * details.
-+ *
-+ * You should have received a copy of the GNU General Public License along with
-+ * this program; if not, write to the Free Software Foundation, Inc., 59 Temple
-+ * Place - Suite 330, Boston, MA 02111-1307, USA.
-+ *
-+ */
-+
-+#ifndef __GSD_MOUNT_MANAGER_H
-+#define __GSD_MOUNT_MANAGER_H
-+
-+#include <glib-object.h>
-+
-+G_BEGIN_DECLS
-+
-+#define GSD_TYPE_MOUNT_MANAGER         (gsd_mount_manager_get_type ())
-+#define GSD_MOUNT_MANAGER(o)           (G_TYPE_CHECK_INSTANCE_CAST ((o), GSD_TYPE_MOUNT_MANAGER, GsdMountManager))
-+#define GSD_MOUNT_MANAGER_CLASS(k)     (G_TYPE_CHECK_CLASS_CAST((k), GSD_TYPE_MOUNT_MANAGER, GsdMountManagerClass))
-+#define GSD_IS_MOUNT_MANAGER(o)        (G_TYPE_CHECK_INSTANCE_TYPE ((o), GSD_TYPE_MOUNT_MANAGER))
-+#define GSD_IS_MOUNT_MANAGER_CLASS(k)  (G_TYPE_CHECK_CLASS_TYPE ((k), GSD_TYPE_MOUNT_MANAGER))
-+#define GSD_MOUNT_MANAGER_GET_CLASS(o) (G_TYPE_INSTANCE_GET_CLASS ((o), GSD_TYPE_MOUNT_MANAGER, GsdMountManagerClass))
-+
-+typedef struct GsdMountManagerPrivate GsdMountManagerPrivate;
-+
-+typedef struct
-+{
-+        GObject parent;
-+        GsdMountManagerPrivate *priv;
-+} GsdMountManager;
-+
-+typedef struct
-+{
-+        GObjectClass parent_class;
-+} GsdMountManagerClass;
-+
-+GType                   gsd_mount_manager_get_type            (void);
-+
-+GsdMountManager *       gsd_mount_manager_new                 (void);
-+
-+gboolean                gsd_mount_manager_start               (GsdMountManager *manager,
-+                                                               GError         **error);
-+void                    gsd_mount_manager_stop                (GsdMountManager *manager);
-+
-+G_END_DECLS
-+
-+#endif /* __GSD_MOUNT_MANAGER_H */
-diff --git a/plugins/mount/gsd-mount-plugin.c b/plugins/mount/gsd-mount-plugin.c
-new file mode 100644
-index 0000000..af295a5
---- /dev/null
-+++ b/plugins/mount/gsd-mount-plugin.c
-@@ -0,0 +1,103 @@
-+/* -*- Mode: C; tab-width: 8; indent-tabs-mode: nil; c-basic-offset: 8 -*-
-+ *
-+ * Copyright (C) 2009 Intel Corporation
-+ *
-+ * This program is free software; you can redistribute it and/or modify it under
-+ * the terms of the GNU General Public License as published by the Free Software
-+ * Foundation; either version 2, or (at your option) any later version.
-+ *
-+ * This program is distributed in the hope that it will be useful, but WITHOUT
-+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
-+ * FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more
-+ * details.
-+ *
-+ * You should have received a copy of the GNU General Public License along with
-+ * this program; if not, write to the Free Software Foundation, Inc., 59 Temple
-+ * Place - Suite 330, Boston, MA 02111-1307, USA.
-+ *
-+ */
-+
-+#include <config.h>
-+
-+#include <glib/gi18n.h>
-+#include <gmodule.h>
-+#include <gnome-settings-daemon/gnome-settings-plugin.h>
-+
-+#include "gsd-mount-plugin.h"
-+#include "gsd-mount-manager.h"
-+
-+struct GsdMountPluginPrivate {
-+        GsdMountManager *manager;
-+};
-+
-+#define GSD_MOUNT_PLUGIN_GET_PRIVATE(object) (G_TYPE_INSTANCE_GET_PRIVATE ((object), GSD_TYPE_MOUNT_PLUGIN, GsdMountPluginPrivate))
-+
-+GNOME_SETTINGS_PLUGIN_REGISTER (GsdMountPlugin, gsd_mount_plugin)
-+
-+static void
-+gsd_mount_plugin_init (GsdMountPlugin *plugin)
-+{
-+        plugin->priv = GSD_MOUNT_PLUGIN_GET_PRIVATE (plugin);
-+
-+        g_debug ("GsdMountPlugin initializing");
-+
-+        plugin->priv->manager = gsd_mount_manager_new ();
-+}
-+
-+static void
-+gsd_mount_plugin_finalize (GObject *object)
-+{
-+        GsdMountPlugin *plugin;
-+
-+        g_return_if_fail (object != NULL);
-+        g_return_if_fail (GSD_IS_MOUNT_PLUGIN (object));
-+
-+        g_debug ("GsdMountPlugin finalizing");
-+
-+        plugin = GSD_MOUNT_PLUGIN (object);
-+
-+        g_return_if_fail (plugin->priv != NULL);
-+
-+        if (plugin->priv->manager != NULL) {
-+                g_object_unref (plugin->priv->manager);
-+        }
-+
-+        G_OBJECT_CLASS (gsd_mount_plugin_parent_class)->finalize (object);
-+}
-+
-+static void
-+impl_activate (GnomeSettingsPlugin *plugin)
-+{
-+        gboolean res;
-+        GError  *error;
-+
-+        g_debug ("Activating mount plugin");
-+
-+        error = NULL;
-+        res = gsd_mount_manager_start (GSD_MOUNT_PLUGIN (plugin)->priv->manager, &error);
-+        if (! res) {
-+                g_warning ("Unable to start mount manager: %s", error->message);
-+                g_error_free (error);
-+        }
-+}
-+
-+static void
-+impl_deactivate (GnomeSettingsPlugin *plugin)
-+{
-+        g_debug ("Deactivating mount plugin");
-+        gsd_mount_manager_stop (GSD_MOUNT_PLUGIN (plugin)->priv->manager);
-+}
-+
-+static void
-+gsd_mount_plugin_class_init (GsdMountPluginClass *klass)
-+{
-+        GObjectClass           *object_class = G_OBJECT_CLASS (klass);
-+        GnomeSettingsPluginClass *plugin_class = GNOME_SETTINGS_PLUGIN_CLASS (klass);
-+
-+        object_class->finalize = gsd_mount_plugin_finalize;
-+
-+        plugin_class->activate = impl_activate;
-+        plugin_class->deactivate = impl_deactivate;
-+
-+        g_type_class_add_private (klass, sizeof (GsdMountPluginPrivate));
-+}
-diff --git a/plugins/mount/gsd-mount-plugin.h b/plugins/mount/gsd-mount-plugin.h
-new file mode 100644
-index 0000000..526a41f
---- /dev/null
-+++ b/plugins/mount/gsd-mount-plugin.h
-@@ -0,0 +1,55 @@
-+/* -*- Mode: C; tab-width: 8; indent-tabs-mode: nil; c-basic-offset: 8 -*-
-+ *
-+ * Copyright (C) 2009 Intel Corporation
-+ *
-+ * This program is free software; you can redistribute it and/or modify it under
-+ * the terms of the GNU General Public License as published by the Free Software
-+ * Foundation; either version 2, or (at your option) any later version.
-+ *
-+ * This program is distributed in the hope that it will be useful, but WITHOUT
-+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
-+ * FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more
-+ * details.
-+ *
-+ * You should have received a copy of the GNU General Public License along with
-+ * this program; if not, write to the Free Software Foundation, Inc., 59 Temple
-+ * Place - Suite 330, Boston, MA 02111-1307, USA.
-+ *
-+ */
-+
-+#ifndef __GSD_MOUNT_PLUGIN_H__
-+#define __GSD_MOUNT_PLUGIN_H__
-+
-+#include <glib-object.h>
-+#include <gmodule.h>
-+#include <gnome-settings-daemon/gnome-settings-plugin.h>
-+
-+G_BEGIN_DECLS
-+
-+#define GSD_TYPE_MOUNT_PLUGIN                (gsd_mount_plugin_get_type ())
-+#define GSD_MOUNT_PLUGIN(o)                  (G_TYPE_CHECK_INSTANCE_CAST ((o), GSD_TYPE_MOUNT_PLUGIN, GsdMountPlugin))
-+#define GSD_MOUNT_PLUGIN_CLASS(k)            (G_TYPE_CHECK_CLASS_CAST((k), GSD_TYPE_MOUNT_PLUGIN, GsdMountPluginClass))
-+#define GSD_IS_MOUNT_PLUGIN(o)               (G_TYPE_CHECK_INSTANCE_TYPE ((o), GSD_TYPE_MOUNT_PLUGIN))
-+#define GSD_IS_MOUNT_PLUGIN_CLASS(k)         (G_TYPE_CHECK_CLASS_TYPE ((k), GSD_TYPE_MOUNT_PLUGIN))
-+#define GSD_MOUNT_PLUGIN_GET_CLASS(o)        (G_TYPE_INSTANCE_GET_CLASS ((o), GSD_TYPE_MOUNT_PLUGIN, GsdMountPluginClass))
-+
-+typedef struct GsdMountPluginPrivate GsdMountPluginPrivate;
-+
-+typedef struct
-+{
-+        GnomeSettingsPlugin    parent;
-+        GsdMountPluginPrivate *priv;
-+} GsdMountPlugin;
-+
-+typedef struct
-+{
-+        GnomeSettingsPluginClass parent_class;
-+} GsdMountPluginClass;
-+
-+GType   gsd_mount_plugin_get_type            (void) G_GNUC_CONST;
-+
-+G_MODULE_EXPORT GType register_gnome_settings_plugin (GTypeModule *module);
-+
-+G_END_DECLS
-+
-+#endif /* __GSD_MOUNT_PLUGIN_H__ */
-diff --git a/plugins/mount/mount.gnome-settings-plugin.in b/plugins/mount/mount.gnome-settings-plugin.in
-new file mode 100644
-index 0000000..ca29ad1
---- /dev/null
-+++ b/plugins/mount/mount.gnome-settings-plugin.in
-@@ -0,0 +1,8 @@
-+[GNOME Settings Plugin]
-+Module=mount
-+IAge=0
-+_Name=Mount
-+_Description=Mount removable media
-+Authors=Ross Burton
-+Copyright=Copyright © 2009 Intel Corporation
-+Website=
diff --git a/meta-demoapps/recipes-gnome/gnome/gnome-settings-daemon_2.26.1.bb b/meta-demoapps/recipes-gnome/gnome/gnome-settings-daemon_2.26.1.bb
deleted file mode 100644
index cb216b2..0000000
--- a/meta-demoapps/recipes-gnome/gnome/gnome-settings-daemon_2.26.1.bb
+++ /dev/null
@@ -1,25 +0,0 @@
-DESCRIPTION = "GNOME settings daemon"
-LICENSE = "GPL"
-DEPENDS = "libxklavier gnome-doc-utils gtk+ libglade libgnomekbd gnome-desktop librsvg libxml2 libart-lgpl"
-
-PR = "r3"
-
-inherit gnome
-
-SRC_URI += "file://desktop-moblin.patch;patch=1 \
-            file://gnome-settings-daemon-fix-gthread.patch;patch=1 \
-            file://mount-plugin.patch;patch=1 \
-            file://gnome-settings-daemon-2.24.0-catch-deviceadded.patch;patch=1 \
-            file://configurefix.patch;patch=1 \
-            file://mojito-cleanup.patch;patch=1"
-
-EXTRA_OECONF = "--disable-esd --x-includes=${STAGING_INCDIR} --x-libraries=${STAGING_LIBDIR}"
-ASNEEDED = ""
-
-FILES_${PN} += "${libdir}/gnome-settings-daemon-2.0/*.so ${libdir}/gnome-settings-daemon-2.0/*plugin \
-                ${datadir}/dbus-1/ \
-                ${datadir}/icon* \
-                ${datadir}/xsession*"
-
-FILES_${PN}-dbg += "${libdir}/gnome-settings-daemon-2.0/.debug"
-FILES_${PN}-dev += "${libdir}/gnome-settings-daemon-2.0/*.a ${libdir}/gnome-settings-daemon-2.0/*.la"
diff --git a/meta-demoapps/recipes-gnome/gnome/gnome-terminal/30f29e7d8e1b67c40cd18a7155ba30c4382692d5.patch b/meta-demoapps/recipes-gnome/gnome/gnome-terminal/30f29e7d8e1b67c40cd18a7155ba30c4382692d5.patch
deleted file mode 100644
index 435cb6a..0000000
--- a/meta-demoapps/recipes-gnome/gnome/gnome-terminal/30f29e7d8e1b67c40cd18a7155ba30c4382692d5.patch
+++ /dev/null
@@ -1,22 +0,0 @@
-From 30f29e7d8e1b67c40cd18a7155ba30c4382692d5 Mon Sep 17 00:00:00 2001
-From: Seán de Búrca <leftmostcat@gmail.com>
-Date: Fri, 07 Aug 2009 00:38:52 +0000
-Subject: Remove useless Plural-Forms line which breaks build with gnome-doc-utils master
-
-Upstream-Status: Inappropriate [configuration]
-
----
-diff --git a/help/el/el.po b/help/el/el.po
-index ab77264..635b68f 100644
---- a/help/el/el.po
-+++ b/help/el/el.po
-@@ -10,7 +10,6 @@ msgstr ""
- "MIME-Version: 1.0\n"
- "Content-Type: text/plain; charset=UTF-8\n"
- "Content-Transfer-Encoding: 8bit\n"
--"Plural-Forms: 2\n"
- "X-Poedit-Language: Greek\n"
- "X-Poedit-Country: GREECE\n"
- "X-Generator: Lokalize 0.2\n"
---
-cgit v0.8.3.1
diff --git a/meta-demoapps/recipes-gnome/gnome/gnome-terminal_2.26.3.bb b/meta-demoapps/recipes-gnome/gnome/gnome-terminal_2.26.3.bb
deleted file mode 100644
index 73f0b99..0000000
--- a/meta-demoapps/recipes-gnome/gnome/gnome-terminal_2.26.3.bb
+++ /dev/null
@@ -1,16 +0,0 @@
-DESCRIPTION = "GNOME Terminal"
-LICENSE = "GPL"
-DEPENDS = "gtk+ glib-2.0 startup-notification dbus-glib vte"
-PR = "r2"
-
-inherit gnome
-
-SRC_URI += "file://30f29e7d8e1b67c40cd18a7155ba30c4382692d5.patch;patch=1"
-
-EXTRA_OECONF += "--disable-scrollkeeper"
-
-# Remove an autogenerated file that needs to be rebuilt
-do_configure_prepend () {
-	rm -f ${S}/src/terminal-type-builtins.c
-}
-
diff --git a/meta-demoapps/recipes-gnome/gnome/libgnomecanvas_2.20.0.bb b/meta-demoapps/recipes-gnome/gnome/libgnomecanvas_2.20.0.bb
deleted file mode 100644
index 266d44b..0000000
--- a/meta-demoapps/recipes-gnome/gnome/libgnomecanvas_2.20.0.bb
+++ /dev/null
@@ -1,14 +0,0 @@
-LICENSE = "GPL"
-SECTION = "x11/gnome/libs"
-DESCRIPTION = "A powerful object-oriented display"
-PR = "r2"
-
-inherit gnome
-
-DEPENDS = "libglade libart-lgpl virtual/gail"
-
-EXTRA_OECONF = "--disable-gtk-doc"
-
-FILES_${PN} += "${libdir}/libglade/*/libcanvas.so"
-FILES_${PN}-dbg += "${libdir}/libglade/*/.debug/"
-FILES_${PN}-dev += "${libdir}/libglade/*/libcanvas.*a"
diff --git a/meta-demoapps/recipes-gnome/gnome/libgnomekbd_2.26.0.bb b/meta-demoapps/recipes-gnome/gnome/libgnomekbd_2.26.0.bb
deleted file mode 100644
index 68e4eee..0000000
--- a/meta-demoapps/recipes-gnome/gnome/libgnomekbd_2.26.0.bb
+++ /dev/null
@@ -1,14 +0,0 @@
-DESCRIPTION = "GNOME keyboard library"
-LICENSE = "LGPL"
-
-DEPENDS = "gconf dbus libxklavier gtk+"
-
-inherit gnome
-
-do_configure_append() {
-        find ${S} -name Makefile | xargs sed -i s:'-I$(includedir)':'-I.':g
-        find ${S} -name Makefile | xargs sed -i s:'-I/usr/include':'-I${STAGING_INCDIR}':g
-}
-
-
-
diff --git a/meta-demoapps/recipes-gnome/libgsf/libgsf_1.14.5.bb b/meta-demoapps/recipes-gnome/libgsf/libgsf_1.14.5.bb
deleted file mode 100644
index 01139c7..0000000
--- a/meta-demoapps/recipes-gnome/libgsf/libgsf_1.14.5.bb
+++ /dev/null
@@ -1,25 +0,0 @@
-DESCRIPTION = "GNOME Structured File Library"
-LICENSE = "GPL"
-SECTION = "libs"
-PR = "r3"
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=dc7371b50816c96e145fa0f8ade8e24d \
-                    file://COPYING.LIB;md5=61464cfe342798eeced82efe9ae55f63 \
-                    file://gsf/gsf.h;endline=25;md5=15cf6d31ad023167779ab5f0bbb76f49"
-
-DEPENDS= "libxml2 bzip2 glib-2.0 zlib"
-RDEPENDS_${PN} = "gconf"
-
-
-PACKAGES =+ "${PN}-gnome ${PN}-gnome-dev "
-
-FILES_${PN}-gnome = "${libdir}/libgsf-gnome-1.so.*"
-FILES_${PN}-gnome-dev = "${libdir}/libgsf-gnome-1.* ${includedir}/libgsf-1/gsf-gnome"
-
-inherit autotools pkgconfig gnome gconf
-
-EXTRA_OECONF = "\
-		--without-python \
-		--without-gnome \
-		--disable-gtk-doc \
-		--with-bz2"
diff --git a/meta-demoapps/recipes-gnome/libgtkstylus/files/gtkstylus.sh b/meta-demoapps/recipes-gnome/libgtkstylus/files/gtkstylus.sh
deleted file mode 100644
index b1302ed..0000000
--- a/meta-demoapps/recipes-gnome/libgtkstylus/files/gtkstylus.sh
+++ /dev/null
@@ -1,5 +0,0 @@
-#!/bin/sh
-
-GTK_MODULES=libgtkstylus.so
-
-export GTK_MODULES
diff --git a/meta-demoapps/recipes-gnome/libgtkstylus/libgtkstylus_0.5.bb b/meta-demoapps/recipes-gnome/libgtkstylus/libgtkstylus_0.5.bb
deleted file mode 100644
index b359938..0000000
--- a/meta-demoapps/recipes-gnome/libgtkstylus/libgtkstylus_0.5.bb
+++ /dev/null
@@ -1,24 +0,0 @@
-DESCRIPTION = "GTK plugin for stylus based systems"
-SECTION = "libs"
-DEPENDS = "gtk+"
-LICENSE = "LGPL"
-PR = "r2"
-
-inherit autotools
-
-SRC_URI = "http://burtonini.com/temp/${BPN}-${PV}.tar.gz \
-	file://gtkstylus.sh"
-
-do_install_append() {
-	install -d ${D}/${sysconfdir}/X11/Xsession.d
-	install -m 755 ${WORKDIR}/gtkstylus.sh ${D}/${sysconfdir}/X11/Xsession.d/45gtkstylus
-}
-
-# Horrible but rpm falls over if you use '*'
-GTKVER = "2.10.0"
-
-FILES_${PN} = "${sysconfdir} \
-               ${libdir}/gtk-2.0/${GTKVER}/modules/libgtkstylus.so.*"
-FILES_${PN}-dbg += "${libdir}/gtk-2.0/${GTKVER}/modules/.debug"
-FILES_${PN}-dev += "${libdir}/gtk-2.0/${GTKVER}/modules/libgtkstylus.so \
-                    ${libdir}/gtk-2.0/${GTKVER}/modules/libgtkstylus.*a"
diff --git a/meta-demoapps/recipes-gnome/wv/wv-1.2.0/pkgconfig.patch b/meta-demoapps/recipes-gnome/wv/wv-1.2.0/pkgconfig.patch
deleted file mode 100644
index 0c0eddf..0000000
--- a/meta-demoapps/recipes-gnome/wv/wv-1.2.0/pkgconfig.patch
+++ /dev/null
@@ -1,15 +0,0 @@
-Upstream-Status: Inappropriate [configuration]
-
-Index: wv-1.2.0/wv-1.0.pc.in
-===================================================================
---- wv-1.2.0.orig/wv-1.0.pc.in	2008-03-19 22:25:18.000000000 +0000
-+++ wv-1.2.0/wv-1.0.pc.in	2008-03-19 22:26:32.000000000 +0000
-@@ -6,5 +6,6 @@
- Name: wvWare
- Description: Word Document Filter library and utilities
- Version: @VERSION@
--Libs: -L${libdir} -lwv @WMF_LIBS@ @XML_LIBS@ @GLIB_LIBS@ @GSF_LIBS@ @PNG_LIBS@ @ZLIB_LIBS@ @LIBS@ -lm
--Cflags: -I${includedir}/wv @GSF_CFLAGS@
-+Requires: libgsf-1
-+Libs: -L${libdir} -lwv @WMF_LIBS@ @XML_LIBS@ @PNG_LIBS@ @ZLIB_LIBS@ @LIBS@ -lm
-+Cflags: -I${includedir}/wv
diff --git a/meta-demoapps/recipes-gnome/wv/wv_1.2.0.bb b/meta-demoapps/recipes-gnome/wv/wv_1.2.0.bb
deleted file mode 100644
index 54878a9..0000000
--- a/meta-demoapps/recipes-gnome/wv/wv_1.2.0.bb
+++ /dev/null
@@ -1,14 +0,0 @@
-DESCRIPTION = "Programs for accessing Microsoft Word documents"
-HOMEPAGE = "http://wvware.sourceforge.net/"
-LICENSE = "GPLv2"
-DEPENDS = "libgsf glib-2.0"
-PR = "r3"
-
-SRC_URI = "${SOURCEFORGE_MIRROR}/wvware/wv-${PV}.tar.gz \
-           file://pkgconfig.patch;patch=1"
-
-inherit autotools pkgconfig
-
-S = "${WORKDIR}/${BPN}-${PV}"
-
-EXTRA_OECONF = ""
diff --git a/meta-demoapps/recipes-graphics/clutter/tidy.inc b/meta-demoapps/recipes-graphics/clutter/tidy.inc
deleted file mode 100644
index 13d6fc7..0000000
--- a/meta-demoapps/recipes-graphics/clutter/tidy.inc
+++ /dev/null
@@ -1,20 +0,0 @@
-DESCRIPTION = "Tidy library"
-HOMEPAGE = "http://www.clutter-project.org/"
-LICENSE = "LGPLv2.1+"
-
-STDDEPENDS = "clutter-1.4"
-BASE_CONF = "--disable-gtk-doc"
-
-DEPENDS = "${STDDEPENDS}"
-EXTRA_OECONF = "${BASE_CONF}"
-
-inherit autotools pkgconfig
-
-PACKAGES =+ "tidy-examples"
-FILES_tidy-examples = "${bindir}/test-*"
-
-do_configure_prepend() {
-        touch ${S}/gtk-doc.make
-        sed -i s:docs/reference/Makefile::g ${S}/configure.ac
-        sed -i s:docs::g ${S}/Makefile.am
-}
diff --git a/meta-demoapps/recipes-graphics/clutter/tidy/autofoo.patch b/meta-demoapps/recipes-graphics/clutter/tidy/autofoo.patch
deleted file mode 100644
index 51b4eea..0000000
--- a/meta-demoapps/recipes-graphics/clutter/tidy/autofoo.patch
+++ /dev/null
@@ -1,13 +0,0 @@
-Upstream-Status: Inappropriate [configuration]
-
-Index: tidy/doc/reference/Makefile.am
-===================================================================
---- tidy.orig/doc/reference/Makefile.am  2007-11-06 19:36:56.000000000 +0000
-+++ tidy/doc/reference/Makefile.am       2007-11-06 19:37:02.000000000 +0000
-@@ -77,4 +77,4 @@ include $(top_srcdir)/gtk-doc.make
- 
- # Other files to distribute
- # e.g. EXTRA_DIST += version.xml.in
--EXTRA_DIST += version.xml.in
-+EXTRA_DIST = version.xml.in
-
diff --git a/meta-demoapps/recipes-graphics/clutter/tidy/tidy-enable-tests.patch b/meta-demoapps/recipes-graphics/clutter/tidy/tidy-enable-tests.patch
deleted file mode 100644
index 6942577..0000000
--- a/meta-demoapps/recipes-graphics/clutter/tidy/tidy-enable-tests.patch
+++ /dev/null
@@ -1,22 +0,0 @@
-Upstream-Status: Inappropriate [configuration]
-
-Index: trunk/tests/Makefile.am
-===================================================================
---- trunk.orig/tests/Makefile.am	2008-03-04 12:22:10.000000000 +0000
-+++ trunk/tests/Makefile.am	2008-03-04 12:23:46.000000000 +0000
-@@ -1,4 +1,4 @@
--noinst_PROGRAMS = \
-+bin_PROGRAMS = \
- 	test-button \
- 	test-finger-scroll \
- 	test-list-view \
-@@ -14,6 +14,9 @@
- 	test-grow \
- 	test-viewport
- 
-+test_texture_framedir = $(pkgdatadir)
-+test_texture_frame_DATA = frame.png
-+
- INCLUDES = -I$(top_srcdir)
- LDADD = $(top_builddir)/tidy/libtidy-1.0.la
- 
diff --git a/meta-demoapps/recipes-graphics/clutter/tidy_git.bb b/meta-demoapps/recipes-graphics/clutter/tidy_git.bb
deleted file mode 100644
index 623de18..0000000
--- a/meta-demoapps/recipes-graphics/clutter/tidy_git.bb
+++ /dev/null
@@ -1,14 +0,0 @@
-require tidy.inc
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=7fbc338309ac38fefcd64b04bb903e34 \
-                    file://tidy/tidy.h;endline=21;md5=ac342e7aac55849bf0755d79967fa3e8"
-
-SRCREV = "e25416e1293e1074bfa6727c80527dcff5b1f3cb"
-PV = "0.1.0+git${SRCPV}"
-PR = "r7"
-
-SRC_URI = "git://git.clutter-project.org/tidy.git;protocol=git \
-           file://tidy-enable-tests.patch;patch=1"
-
-S = "${WORKDIR}/git"
-
diff --git a/meta-demoapps/recipes-graphics/libxklavier/libxklavier/pkgconfigfix.patch b/meta-demoapps/recipes-graphics/libxklavier/libxklavier/pkgconfigfix.patch
deleted file mode 100644
index f58f30b..0000000
--- a/meta-demoapps/recipes-graphics/libxklavier/libxklavier/pkgconfigfix.patch
+++ /dev/null
@@ -1,17 +0,0 @@
-Upstream-Status: Inappropriate [configuration]
-
-Index: libxklavier-3.7/libxklavier.pc.in
-===================================================================
---- libxklavier-3.7.orig/libxklavier.pc.in	2009-06-10 15:58:46.000000000 +0100
-+++ libxklavier-3.7/libxklavier.pc.in	2009-06-10 16:00:45.000000000 +0100
-@@ -5,7 +5,7 @@
- 
- Name: libxklavier
- Description: libxklavier library
--Requires: libxml-2.0
-+Requires: libxml-2.0 glib-2.0
- Version: @VERSION@
--Libs: -L${libdir} -lxklavier @GLIB_LIBS@ @XML_LIBS@
--Cflags: -I${includedir} @GLIB_CFLAGS@
-+Libs: -L${libdir} -lxklavier
-+Cflags: -I${includedir}
diff --git a/meta-demoapps/recipes-graphics/libxklavier/libxklavier_3.9.bb b/meta-demoapps/recipes-graphics/libxklavier/libxklavier_3.9.bb
deleted file mode 100644
index da077b8..0000000
--- a/meta-demoapps/recipes-graphics/libxklavier/libxklavier_3.9.bb
+++ /dev/null
@@ -1,11 +0,0 @@
-DESCRIPTION = "Utility library to make using XKB easier"
-SECTION = "x11/libs"
-DEPENDS = "iso-codes libxml2 glib-2.0 libxkbfile"
-LICENSE = "LGPL"
-PR = "r2"
-
-SRC_URI = "${SOURCEFORGE_MIRROR}/gswitchit/libxklavier-${PV}.tar.bz2 \
-           file://pkgconfigfix.patch;patch=1"
-
-inherit autotools
-
diff --git a/meta-demoapps/recipes-graphics/pong-clock/pong-clock/pong-clock-no-flicker.c b/meta-demoapps/recipes-graphics/pong-clock/pong-clock/pong-clock-no-flicker.c
deleted file mode 100644
index 41cebc5..0000000
--- a/meta-demoapps/recipes-graphics/pong-clock/pong-clock/pong-clock-no-flicker.c
+++ /dev/null
@@ -1,410 +0,0 @@
-/*
- * Pong Clock - A clock that plays pong. 
- *             See http://mocoloco.com/archives/001766.php for the inspiration.
- *
- * Copyright (C) 2005 Matthew Allum
- *
- * Author: Matthew Allum mallum@openedhand.com
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program; if not, write to the Free Software
- * Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.
- *
- */
-
-#include <stdlib.h>
-#include <time.h>
-#include <sys/time.h>
-#include <sys/types.h>
-#include <string.h>
-#include <stdio.h>
-#include <unistd.h>
-#include <signal.h>
-
-#include <X11/Xlib.h>
-#include <X11/Xutil.h>
-#include <X11/Xatom.h>
-
-/* Tweak values for different hw setups */
-
-#define FPS          50
-#define RESX         40
-#define RESY         40
-#define TO_MISS_SECS 55
-#define BALLDX       16
-#define BALLDY       4
-
-
-typedef struct PongClock
-{
-  Display *xdpy;
-  int      xscreen;
-  Window   xwin, xwin_root;
-  Pixmap   backbuffer;
-  GC       xgc;
-  int      xwin_width, xwin_height;
-  int      pixelw, pixelh;
-
-  int      ball_x, ball_y, ball_dx, ball_dy;
-  int      bata_y, batb_y;
-  Bool     bata_to_miss, batb_to_miss;
-
-} 
-PongClock;
-
-void
-get_time(int *hour, int *min, int *sec)
-{
-  struct timeval   tv;
-  struct tm       *localTime = NULL; 
-  time_t           actualTime;
-
-  gettimeofday(&tv, 0);
-  actualTime = tv.tv_sec;
-  localTime = localtime(&actualTime);
-
-  if (hour)
-    *hour = localTime->tm_hour;
-  
-  if (min)
-    *min  = localTime->tm_min;
-
-  if (sec)
-    *sec  = localTime->tm_sec;
-}
-
-void
-draw_rect (PongClock *pong_clock, 
-	   int        x,
-	   int        y,
-	   int        width,
-	   int        height)
-{
-  XFillRectangle (pong_clock->xdpy,
-		  pong_clock->backbuffer,
-		  pong_clock->xgc,
-		  x * pong_clock->pixelw,
-		  y * pong_clock->pixelh,
-		  width * pong_clock->pixelw,
-		  height * pong_clock->pixelh);
-}
-
-void
-draw_field (PongClock *pong_clock)
-{
-  int i;
-
-  draw_rect (pong_clock, 0, 0, RESX+1, 1);  
-  draw_rect (pong_clock, 0, RESY-1, RESX+1, 1);  
-
-  for (i=0; i < RESY/2; i++)
-    draw_rect (pong_clock, (RESX/2)-1, i*2, 2, 1);  
-}
-
-void
-draw_digit (PongClock *pong_clock, 
-	    int        x,
-	    int        y,
-	    int        digit)
-{
-  int digits[] = { 0x1f8c63f, 0x1f21086, 0x1f0fe1f, 0x1f87e1f, 0x1087e31,
-		   0x1f87c3f, 0x1f8fc3f, 0x84421f,  0x1f8fe3f, 0x1087e3f };
-
-  XRectangle rects[5*5];
-  int i,j,k;
-
-  i = 0;
-
-  for (k=0; k<5; k++) 
-    for (j=0; j<5; j++)	
-      if (digits[digit] & (1 << ((k*5)+j)))
-	{
-	  rects[i].x      = (x + j) * pong_clock->pixelw; 
-	  rects[i].y      = (y + k) * pong_clock->pixelh; 
-	  rects[i].width  = pong_clock->pixelw;
-	  rects[i].height = pong_clock->pixelh;  
-	  i++;
-	}
-
-  XFillRectangles (pong_clock->xdpy,
-		   pong_clock->backbuffer,
-		   pong_clock->xgc,
-		   rects, i);
-} 
-
-void
-draw_time (PongClock *pong_clock)
-{
-  int hour, min;
-
-  get_time(&hour, &min, NULL);
-
-  draw_digit (pong_clock, 
-	      (RESX/2) - 14,
-	      5,
-	      hour / 10 );
-
-  draw_digit (pong_clock, 
-	      (RESX/2) - 8,
-	      5,
-	      hour % 10 );
-
-  draw_digit (pong_clock, 
-	      (RESX/2) + 3,
-	      5,
-	      min / 10 );
-
-  draw_digit (pong_clock, 
-	      (RESX/2) + 9,
-	      5,
-	      min % 10 );
-}
-
-void
-draw_bat_and_ball (PongClock *pong_clock)
-{
-  /* ball */
-
-  XFillRectangle (pong_clock->xdpy,
-		  pong_clock->backbuffer,
-		  pong_clock->xgc,
-		  pong_clock->ball_x,
-		  pong_clock->ball_y,
-		  pong_clock->pixelw,
-		  pong_clock->pixelh);
-
-  /* bat a */
-
-  XFillRectangle (pong_clock->xdpy,
-		  pong_clock->backbuffer,
-		  pong_clock->xgc,
-		  0,
-		  pong_clock->bata_y - (2 * pong_clock->pixelh),
-		  pong_clock->pixelw,
-		  pong_clock->pixelh * 5);
-
-  /* bat b */
-
-  XFillRectangle (pong_clock->xdpy,
-		  pong_clock->backbuffer,
-		  pong_clock->xgc,
-		  (pong_clock->xwin_width - pong_clock->pixelw),
-		  pong_clock->batb_y - (2 * pong_clock->pixelh),
-		  pong_clock->pixelw,
-		  pong_clock->pixelh * 5);
-
-}
-
-void
-update_state (PongClock *pong_clock)
-{
-  int sec, min, hour;
-
-  get_time(&hour, &min, &sec);
-
-  /* Check ball is on field and no ones dues to miss a shot.
-  */
-  if ( (pong_clock->ball_x < 0 && !pong_clock->bata_to_miss) 
-      || (pong_clock->ball_x > (pong_clock->xwin_width - pong_clock->pixelw)
-	  && !pong_clock->batb_to_miss) )
-    pong_clock->ball_dx *= -1;
-
-  if ((pong_clock->ball_y < pong_clock->pixelh)
-      || pong_clock->ball_y > (pong_clock->xwin_height - (2*pong_clock->pixelh)))
-    pong_clock->ball_dy *= -1; 
-
-  pong_clock->ball_x += pong_clock->ball_dx;
-  pong_clock->ball_y += pong_clock->ball_dy;
-
-  /* Set up someone to miss if we getting close to an hour or min. 
-   */
-  if (sec > TO_MISS_SECS)
-    {
-      if (min == 59)
-	pong_clock->batb_to_miss = True;	
-      else
-	pong_clock->bata_to_miss = True;
-    }
-  else
-    {
-      /* Reset the game */
-      if (pong_clock->bata_to_miss)
-	{
-	  pong_clock->bata_to_miss = False;
-	  pong_clock->ball_y = pong_clock->bata_y; 
-	  pong_clock->ball_x = pong_clock->pixelw; 
-	  pong_clock->ball_dx *= -1;
-	}
-
-      if (pong_clock->batb_to_miss)
-	{
-	  pong_clock->batb_to_miss = False;
-	  pong_clock->ball_y = pong_clock->batb_y; 
-	  pong_clock->ball_x = pong_clock->xwin_width - pong_clock->pixelw;
-	  pong_clock->ball_dx *= -1; 
-	}
-    }
-
-  /* Keep bats on field and only move in not setup to miss */
-  if (pong_clock->ball_y >= (3*pong_clock->pixelh)
-      && pong_clock->ball_y <=  (pong_clock->xwin_height - (5*pong_clock->pixelh)))
-  {
-    if (!pong_clock->batb_to_miss) 
-      pong_clock->batb_y = pong_clock->ball_y;
-
-    if (!pong_clock->bata_to_miss)
-      pong_clock->bata_y = pong_clock->ball_y;
-  }
-}
-
-void
-draw_frame (PongClock *pong_clock)
-{
-  update_state (pong_clock);
-
-  /* Clear playfield */
-  XSetForeground (pong_clock->xdpy,
-		  pong_clock->xgc,
-		  BlackPixel(pong_clock->xdpy, 
-			     pong_clock->xscreen));
-
-  XFillRectangle (pong_clock->xdpy,
-		  pong_clock->backbuffer,
-		  pong_clock->xgc,
-		  0, 0,
-		  pong_clock->xwin_width, 
-		  pong_clock->xwin_height);
-
-  XSetForeground (pong_clock->xdpy,
-		  pong_clock->xgc,
-		  WhitePixel(pong_clock->xdpy, 
-			     pong_clock->xscreen));
-
-  draw_field (pong_clock);
-
-  draw_time (pong_clock);
-
-  draw_bat_and_ball (pong_clock);
-
-  /* flip 'backbuffer' */
-  XSetWindowBackgroundPixmap (pong_clock->xdpy, 
-			      pong_clock->xwin,
-			      pong_clock->backbuffer);
-  XClearWindow(pong_clock->xdpy, pong_clock->xwin);
-
-  XSync(pong_clock->xdpy, False);
-}
-
-int
-main (int argc, char **argv)
-{
-  XGCValues  gcv;
-  Atom       atoms_WINDOW_STATE, atoms_WINDOW_STATE_FULLSCREEN;
-  PongClock *pong_clock;
-
-  pong_clock = malloc(sizeof(PongClock));
-  memset(pong_clock, 0, sizeof(PongClock));
-
-  if ((pong_clock->xdpy = XOpenDisplay(getenv("DISPLAY"))) == NULL) {
-    fprintf(stderr, "Cannot connect to X server on display %s.",
-	    getenv("DISPLAY"));
-    exit(-1);
-  }
-
-  pong_clock->xscreen     = DefaultScreen(pong_clock->xdpy);
-  pong_clock->xwin_root   = DefaultRootWindow(pong_clock->xdpy);
-  pong_clock->xwin_width  = DisplayWidth(pong_clock->xdpy, 
-					 pong_clock->xscreen);
-  pong_clock->xwin_height = DisplayHeight(pong_clock->xdpy, 
-					  pong_clock->xscreen);
-
-  pong_clock->pixelw  = pong_clock->xwin_width  / RESX;
-  pong_clock->pixelh  = pong_clock->xwin_height / RESY;
-
-  pong_clock->ball_x = 0; 
-  pong_clock->ball_y = pong_clock->xwin_height / 2; 
-
-  pong_clock->ball_dx = BALLDX; 
-  pong_clock->ball_dy = BALLDY; 
-
-  pong_clock->batb_y = pong_clock->bata_y = pong_clock->ball_y;
-
-  gcv.background = BlackPixel(pong_clock->xdpy, 
-			      pong_clock->xscreen);
-  gcv.foreground = WhitePixel(pong_clock->xdpy, 
-			      pong_clock->xscreen);
-  gcv.graphics_exposures = False;
-
-  pong_clock->xgc = XCreateGC (pong_clock->xdpy, pong_clock->xwin_root, 
-			       GCForeground|GCBackground|GCGraphicsExposures,
-			       &gcv);
-
-  atoms_WINDOW_STATE
-    = XInternAtom(pong_clock->xdpy, "_NET_WM_STATE",False);
-  atoms_WINDOW_STATE_FULLSCREEN
-    = XInternAtom(pong_clock->xdpy, "_NET_WM_STATE_FULLSCREEN",False);
-
-  pong_clock->xwin = XCreateSimpleWindow(pong_clock->xdpy, 
-					 pong_clock->xwin_root, 
-					 0, 0,
-					 pong_clock->xwin_width, 
-					 pong_clock->xwin_height, 
-					 0,
-					 WhitePixel(pong_clock->xdpy, 
-						    pong_clock->xscreen),
-					 BlackPixel(pong_clock->xdpy, 
-						    pong_clock->xscreen));
-
-  pong_clock->backbuffer = XCreatePixmap(pong_clock->xdpy, 
-					 pong_clock->xwin_root,
-					 pong_clock->xwin_width, 
-					 pong_clock->xwin_height, 
-					 DefaultDepth(pong_clock->xdpy, 
-						      pong_clock->xscreen));
-
-  XSelectInput(pong_clock->xdpy, pong_clock->xwin, KeyPressMask);
-  
-
-  /* Set the hints for fullscreen */
-  XChangeProperty(pong_clock->xdpy, 
-		  pong_clock->xwin, 
-		  atoms_WINDOW_STATE, 
-		  XA_ATOM, 
-		  32, 
-		  PropModeReplace, 
-		  (unsigned char *) &atoms_WINDOW_STATE_FULLSCREEN, 1);
-
-  XMapWindow(pong_clock->xdpy, pong_clock->xwin);
-  
-  while (True) 
-    {
-      struct timeval timeout;
-      XEvent         xev;
-
-      timeout.tv_sec  = 0;
-      timeout.tv_usec = 1000000 / FPS; 
-      select (0, NULL, NULL, NULL, &timeout);
-
-      draw_frame (pong_clock);
-
-      XFlush(pong_clock->xdpy);
-
-      if (XPending(pong_clock->xdpy))
-	{
-	  if (XCheckMaskEvent(pong_clock->xdpy, 
-			      KeyPressMask,
-			      &xev))
-	    exit(-1);
-	}
-    }
-}
diff --git a/meta-demoapps/recipes-graphics/pong-clock/pong-clock_1.0.bb b/meta-demoapps/recipes-graphics/pong-clock/pong-clock_1.0.bb
deleted file mode 100644
index 8d3659f..0000000
--- a/meta-demoapps/recipes-graphics/pong-clock/pong-clock_1.0.bb
+++ /dev/null
@@ -1,16 +0,0 @@
-DESCRIPTION = "A clock combined with a game of pong"
-LICENSE = "GPLv2+"
-DEPENDS = "virtual/libx11 xdmcp xau"
-
-SRC_URI = "file://pong-clock-no-flicker.c"
-
-S = "${WORKDIR}"
-
-do_compile () {
-	${CC} -o pong-clock pong-clock-no-flicker.c `pkg-config --cflags --libs x11 xau xdmcp`
-}
-
-do_install () {
-	install -d ${D}${bindir}
-	install -m 0755 pong-clock ${D}${bindir}
-}
diff --git a/meta-demoapps/recipes-graphics/xorg-app/xbacklight_1.1.bb b/meta-demoapps/recipes-graphics/xorg-app/xbacklight_1.1.bb
deleted file mode 100644
index 78804d7..0000000
--- a/meta-demoapps/recipes-graphics/xorg-app/xbacklight_1.1.bb
+++ /dev/null
@@ -1,4 +0,0 @@
-require xorg-app-common.inc
-
-DESCRIPTION = "X Backlight Utility"
-DEPENDS += "libxrender libxrandr"
diff --git a/meta-demoapps/recipes-graphics/xorg-app/xeyes_1.0.1.bb b/meta-demoapps/recipes-graphics/xorg-app/xeyes_1.0.1.bb
deleted file mode 100644
index 07ce072..0000000
--- a/meta-demoapps/recipes-graphics/xorg-app/xeyes_1.0.1.bb
+++ /dev/null
@@ -1,4 +0,0 @@
-require xorg-app-common.inc
-PE = "1"
-
-DEPENDS += " virtual/libx11 libxau libxt libxext libxmu"
diff --git a/meta-demoapps/recipes-graphics/xorg-app/xrdb/60XDefaults.sh b/meta-demoapps/recipes-graphics/xorg-app/xrdb/60XDefaults.sh
deleted file mode 100644
index 08d8bec..0000000
--- a/meta-demoapps/recipes-graphics/xorg-app/xrdb/60XDefaults.sh
+++ /dev/null
@@ -1,3 +0,0 @@
-if [ -e $HOME/.Xdefaults ]; then
-    xrdb -merge -nocpp < $HOME/.Xdefaults
-fi
diff --git a/meta-demoapps/recipes-graphics/xorg-app/xrdb_1.0.5.bb b/meta-demoapps/recipes-graphics/xorg-app/xrdb_1.0.5.bb
deleted file mode 100644
index 906d7d8..0000000
--- a/meta-demoapps/recipes-graphics/xorg-app/xrdb_1.0.5.bb
+++ /dev/null
@@ -1,14 +0,0 @@
-require xorg-app-common.inc
-
-DESCRIPTION = "X server resource database utility"
-LICENSE = "xrdb"
-DEPENDS += "libxmu"
-PE = "1"
-PR = "r2"
-
-SRC_URI += "file://60XDefaults.sh"
-
-do_install_append() {
-    install -d ${D}${sysconfdir}/X11/Xsession.d/
-    install -m 0755 ${WORKDIR}/60XDefaults.sh ${D}${sysconfdir}/X11/Xsession.d/
-}
diff --git a/meta-demoapps/recipes-graphics/xorg-lib/liblbxutil/mkg3states.patch b/meta-demoapps/recipes-graphics/xorg-lib/liblbxutil/mkg3states.patch
deleted file mode 100644
index 63c1847..0000000
--- a/meta-demoapps/recipes-graphics/xorg-lib/liblbxutil/mkg3states.patch
+++ /dev/null
@@ -1,65 +0,0 @@
-Upstream-Status: Inappropriate [configuration]
-
-During the build process the mkg3states binary needs to be run. This patch
-allows it to be built with the build systems gcc allowing this to work.
-
-RP 31/3/10
-
-Index: liblbxutil-1.1.0/configure.ac
-===================================================================
---- liblbxutil-1.1.0.orig/configure.ac	2009-12-04 22:52:04.000000000 +0000
-+++ liblbxutil-1.1.0/configure.ac	2010-03-31 15:26:33.000000000 +0100
-@@ -50,4 +50,5 @@
- 
- AC_OUTPUT([Makefile
- 	   src/Makefile
-+	   src/image/Makefile
- 	   lbxutil.pc])
-Index: liblbxutil-1.1.0/src/Makefile.am
-===================================================================
---- liblbxutil-1.1.0.orig/src/Makefile.am	2009-12-04 23:03:17.000000000 +0000
-+++ liblbxutil-1.1.0/src/Makefile.am	2010-03-31 15:27:25.000000000 +0100
-@@ -3,10 +3,7 @@
- AM_CFLAGS = $(CWARNFLAGS) $(LBXUTIL_CFLAGS)
- INCLUDES = -I$(top_srcdir)/include
- 
--noinst_PROGRAMS = mkg3states
--
--mkg3states_SOURCES =				\
--	$(srcdir)/image/mkg3states.c
-+SUBDIRS = image
- 
- liblbxutil_la_SOURCES =				\
- 	$(srcdir)/lbx_zlib/reqstats.h		\
-@@ -38,9 +35,8 @@
- 
- $(srcdir)/image/dfaxg42d.c: g3states.h
- 
--g3states.h: mkg3states
--	-rm -f g3states.h
--	$(AM_V_GEN) ./mkg3states -c > g3states.h_ && mv g3states.h_ g3states.h
-+g3states.h: image/mkg3states
-+	./image/mkg3states -c > g3states.h_ && mv g3states.h_ g3states.h
- 
- liblbxutil_la_LDFLAGS = -version-number 1:0:0 -no-undefined
- 
-Index: liblbxutil-1.1.0/src/image/Makefile.am
-===================================================================
---- /dev/null	1970-01-01 00:00:00.000000000 +0000
-+++ liblbxutil-1.1.0/src/image/Makefile.am	2010-03-31 15:26:33.000000000 +0100
-@@ -0,0 +1,15 @@
-+# evil hack
-+CFLAGS=$(CFLAGS_FOR_BUILD)
-+CPPFLAGS=$(CPPFLAGS_FOR_BUILD)
-+LDFLAGS=$(LDFLAGS_FOR_BUILD)
-+
-+CC=$(CC_FOR_BUILD)
-+LIBTOOL = @LIBTOOL@ --tag=CC
-+
-+noinst_PROGRAMS = mkg3states
-+
-+mkg3states_SOURCES =				\
-+	mkg3states.c
-+
-+mkg3states_CFLAGS=$(CFLAGS_FOR_BUILD)
-+mkg3states_LDFLAGS=$(LDFLAGS_FOR_BUILD)
diff --git a/meta-demoapps/recipes-graphics/xorg-lib/liblbxutil_1.1.0.bb b/meta-demoapps/recipes-graphics/xorg-lib/liblbxutil_1.1.0.bb
deleted file mode 100644
index cdf3509..0000000
--- a/meta-demoapps/recipes-graphics/xorg-lib/liblbxutil_1.1.0.bb
+++ /dev/null
@@ -1,11 +0,0 @@
-require xorg-lib-common.inc
-
-DESCRIPTION = "XFIXES Extension"
-DEPENDS += " libxext xextproto xproto zlib"
-PROVIDES = "lbxutil"
-PE = "1"
-PR = "r1"
-
-SRC_URI += "file://mkg3states.patch;patch=1"
-
-export CC_FOR_BUILD = "gcc"
diff --git a/meta-demoapps/recipes-graphics/xorg-lib/libxaw_1.0.5.bb b/meta-demoapps/recipes-graphics/xorg-lib/libxaw_1.0.5.bb
deleted file mode 100644
index 489f456..0000000
--- a/meta-demoapps/recipes-graphics/xorg-lib/libxaw_1.0.5.bb
+++ /dev/null
@@ -1,21 +0,0 @@
-require xorg-lib-common.inc
-
-DESCRIPTION = "X Athena Widget Set"
-DEPENDS += "xproto virtual/libx11 libxext xextproto libxt libxmu libxpm libxp printproto libxau"
-PROVIDES = "xaw"
-PR = "r1"
-PE = "1"
-
-XORG_PN = "libXaw"
-
-do_install_append () {
-	ln -sf libXaw6.so.6 ${D}${libdir}/libXaw.so.6
-	ln -sf libXaw7.so.7 ${D}${libdir}/libXaw.so.7
-	ln -sf libXaw7.so.7 ${D}${libdir}/libXaw.so
-}
-
-PACKAGES =+ "libxaw6 libxaw7 libxaw8"
-
-FILES_libxaw6 = "${libdir}/libXaw6.so.6*"
-FILES_libxaw7 = "${libdir}/libXaw7.so.7*"
-FILES_libxaw8 = "${libdir}/libXaw8.so.8*"
diff --git a/meta-demoapps/recipes-graphics/xorg-lib/libxevie_1.0.2.bb b/meta-demoapps/recipes-graphics/xorg-lib/libxevie_1.0.2.bb
deleted file mode 100644
index 6c6b459..0000000
--- a/meta-demoapps/recipes-graphics/xorg-lib/libxevie_1.0.2.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require xorg-lib-common.inc
-
-DESCRIPTION = "X11 EvIE extension library"
-DEPENDS += "libxext evieext"
-PR = "r1"
-PE = "1"
-
-XORG_PN = "libXevie"
diff --git a/meta-demoapps/recipes-graphics/xorg-lib/libxkbui_1.0.2.bb b/meta-demoapps/recipes-graphics/xorg-lib/libxkbui_1.0.2.bb
deleted file mode 100644
index 9a3f5f1..0000000
--- a/meta-demoapps/recipes-graphics/xorg-lib/libxkbui_1.0.2.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require xorg-lib-common.inc
-
-DESCRIPTION = "X11 keyboard UI presentation library"
-LICENSE= "GPL"
-DEPENDS += "virtual/libx11 libxt libxkbfile"
-PROVIDES = "xkbui"
-PR = "r1"
-PE = "1"
diff --git a/meta-demoapps/recipes-graphics/xorg-proto/xproxymanagementprotocol_1.0.3.bb b/meta-demoapps/recipes-graphics/xorg-proto/xproxymanagementprotocol_1.0.3.bb
deleted file mode 100644
index 9c3d9ef..0000000
--- a/meta-demoapps/recipes-graphics/xorg-proto/xproxymanagementprotocol_1.0.3.bb
+++ /dev/null
@@ -1,5 +0,0 @@
-require xorg-proto-common.inc
-
-PROVIDES="xproxymngproto"
-PR = "r1"
-PE = "1"
diff --git a/meta-demoapps/recipes-graphics/xournal/files/ldflags.patch b/meta-demoapps/recipes-graphics/xournal/files/ldflags.patch
deleted file mode 100644
index ec75e71..0000000
--- a/meta-demoapps/recipes-graphics/xournal/files/ldflags.patch
+++ /dev/null
@@ -1,17 +0,0 @@
-Upstream-Status: Inappropriate [configuration]
-
----
- src/Makefile.am |    2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-Index: xournal-0.2/src/Makefile.am
-===================================================================
---- xournal-0.2.orig/src/Makefile.am	2007-05-09 15:06:26.000000000 +0100
-+++ xournal-0.2/src/Makefile.am	2007-05-09 15:06:35.000000000 +0100
-@@ -21,5 +21,5 @@ xournal_SOURCES = \
- 	xo-interface.c xo-interface.h \
- 	xo-callbacks.c xo-callbacks.h 
- 
--xournal_LDADD = @PACKAGE_LIBS@
-+xournal_LDADD = @PACKAGE_LIBS@ -lz
- 
diff --git a/meta-demoapps/recipes-graphics/xournal/files/no-printing.diff b/meta-demoapps/recipes-graphics/xournal/files/no-printing.diff
deleted file mode 100644
index 9fac498..0000000
--- a/meta-demoapps/recipes-graphics/xournal/files/no-printing.diff
+++ /dev/null
@@ -1,180 +0,0 @@
-Upstream-Status: Inappropriate [configuration]
-
-diff -ru xournal-0.2/configure.in xournal-0.2.noprint/configure.in
---- xournal-0.2/configure.in	2006-01-29 22:25:10.000000000 +0000
-+++ xournal-0.2.noprint/configure.in	2006-03-17 13:08:01.000000000 +0000
-@@ -10,11 +10,16 @@
- AM_PROG_CC_STDC
- AC_HEADER_STDC
- 
--pkg_modules="gtk+-2.0 >= 2.4.0 libgnomecanvas-2.0 >= 2.4.0 libgnomeprintui-2.2 >= 2.0.0"
-+pkg_modules="gtk+-2.0 >= 2.4.0 libgnomecanvas-2.0 >= 2.4.0"
- PKG_CHECK_MODULES(PACKAGE, [$pkg_modules])
- AC_SUBST(PACKAGE_CFLAGS)
- AC_SUBST(PACKAGE_LIBS)
- 
-+#PKG_CHECK_MODULES(GNOMEPRINT, libgnomeprintui-2.2 >= 2.0.0
-+#AC_SUBST(GNOMEPRINT_CFLAGS)
-+#AC_SUBST(GNOMEPRINT_LIBS)
-+AM_CONDITIONAL(ENABLE_PRINTING, false)
-+
- AC_OUTPUT([
- Makefile
- src/Makefile
-diff -ru xournal-0.2/src/main.c xournal-0.2.noprint/src/main.c
---- xournal-0.2/src/main.c	2006-01-29 22:22:52.000000000 +0000
-+++ xournal-0.2.noprint/src/main.c	2006-03-17 13:14:50.000000000 +0000
-@@ -28,7 +28,9 @@
- 
- void hide_unimplemented(void)
- {
-+#if ENABLE_PRINTING
-   gtk_widget_hide(GET_COMPONENT("filePrintOptions"));
-+#endif
-   gtk_widget_hide(GET_COMPONENT("journalFlatten"));
-   gtk_widget_hide(GET_COMPONENT("papercolorOther"));
-   gtk_widget_hide(GET_COMPONENT("journalApplyAllPages"));
-diff -ru xournal-0.2/src/Makefile.am xournal-0.2.noprint/src/Makefile.am
---- xournal-0.2/src/Makefile.am	2005-12-14 20:54:42.000000000 +0000
-+++ xournal-0.2.noprint/src/Makefile.am	2006-03-17 13:07:47.000000000 +0000
-@@ -7,12 +7,16 @@
- 
- bin_PROGRAMS = xournal
- 
-+if ENABLE_PRINTING
-+PRINT_SOURCE = 	xo-print.c xo-print.h
-+endif
-+
- xournal_SOURCES = \
- 	main.c xournal.h \
- 	xo-misc.c xo-misc.h \
- 	xo-file.c xo-file.h \
- 	xo-paint.c xo-paint.h \
--	xo-print.c xo-print.h \
-+	$(PRINT_SOURCE) \
- 	xo-support.c xo-support.h \
- 	xo-interface.c xo-interface.h \
- 	xo-callbacks.c xo-callbacks.h 
-diff -ru xournal-0.2/src/xo-callbacks.c xournal-0.2.noprint/src/xo-callbacks.c
---- xournal-0.2/src/xo-callbacks.c	2006-01-29 19:39:22.000000000 +0000
-+++ xournal-0.2.noprint/src/xo-callbacks.c	2006-03-17 13:12:01.000000000 +0000
-@@ -7,7 +7,9 @@
- #include <gtk/gtk.h>
- #include <libgnomecanvas/libgnomecanvas.h>
- #include <time.h>
-+#if ENABLE_PRINTING
- #include <libgnomeprintui/gnome-print-dialog.h>
-+#endif
- #include <glib/gstdio.h>
- 
- #include "xournal.h"
-@@ -17,7 +19,9 @@
- #include "xo-misc.h"
- #include "xo-file.h"
- #include "xo-paint.h"
-+#if ENABLE_PRINTING
- #include "xo-print.h"
-+#endif
- 
- void
- on_fileNew_activate                    (GtkMenuItem     *menuitem,
-@@ -261,7 +265,7 @@
- 
- }
- 
--
-+#if ENABLE_PRINTING
- void
- on_filePrint_activate                  (GtkMenuItem     *menuitem,
-                                         gpointer         user_data)
-@@ -407,7 +411,7 @@
- 
-   g_free(filename);
- }
--
-+#endif
- 
- void
- on_fileQuit_activate                   (GtkMenuItem     *menuitem,
-diff -ru xournal-0.2/src/xo-callbacks.h xournal-0.2.noprint/src/xo-callbacks.h
---- xournal-0.2/src/xo-callbacks.h	2006-01-26 20:47:00.000000000 +0000
-+++ xournal-0.2.noprint/src/xo-callbacks.h	2006-03-17 13:08:45.000000000 +0000
-@@ -24,6 +24,7 @@
- on_filePrintOptions_activate           (GtkMenuItem     *menuitem,
-                                         gpointer         user_data);
- 
-+#if ENABLE_PRINTING
- void
- on_filePrint_activate                  (GtkMenuItem     *menuitem,
-                                         gpointer         user_data);
-@@ -32,6 +33,8 @@
- on_filePrintPDF_activate               (GtkMenuItem     *menuitem,
-                                         gpointer         user_data);
- 
-+#endif
-+
- void
- on_fileQuit_activate                   (GtkMenuItem     *menuitem,
-                                         gpointer         user_data);
-diff -ru xournal-0.2/src/xo-interface.c xournal-0.2.noprint/src/xo-interface.c
---- xournal-0.2/src/xo-interface.c	2006-01-29 18:58:25.000000000 +0000
-+++ xournal-0.2.noprint/src/xo-interface.c	2006-03-17 13:11:31.000000000 +0000
-@@ -41,10 +41,12 @@
-   GtkWidget *fileSave;
-   GtkWidget *fileSaveAs;
-   GtkWidget *separator1;
-+#if ENABLE_PRINTING
-   GtkWidget *filePrintOptions;
-   GtkWidget *image501;
-   GtkWidget *filePrint;
-   GtkWidget *filePrintPDF;
-+#endif
-   GtkWidget *separator2;
-   GtkWidget *fileQuit;
-   GtkWidget *menuEdit;
-@@ -327,6 +329,7 @@
-   gtk_container_add (GTK_CONTAINER (menuFile_menu), separator1);
-   gtk_widget_set_sensitive (separator1, FALSE);
- 
-+#if ENABLE_PRINTING
-   filePrintOptions = gtk_image_menu_item_new_with_mnemonic ("Print Options");
-   gtk_widget_show (filePrintOptions);
-   gtk_container_add (GTK_CONTAINER (menuFile_menu), filePrintOptions);
-@@ -347,6 +350,7 @@
-   gtk_widget_show (separator2);
-   gtk_container_add (GTK_CONTAINER (menuFile_menu), separator2);
-   gtk_widget_set_sensitive (separator2, FALSE);
-+#endif
- 
-   fileQuit = gtk_image_menu_item_new_from_stock ("gtk-quit", accel_group);
-   gtk_widget_show (fileQuit);
-@@ -1522,6 +1526,7 @@
-   g_signal_connect ((gpointer) fileSaveAs, "activate",
-                     G_CALLBACK (on_fileSaveAs_activate),
-                     NULL);
-+#if ENABLE_PRINTING
-   g_signal_connect ((gpointer) filePrintOptions, "activate",
-                     G_CALLBACK (on_filePrintOptions_activate),
-                     NULL);
-@@ -1531,6 +1536,7 @@
-   g_signal_connect ((gpointer) filePrintPDF, "activate",
-                     G_CALLBACK (on_filePrintPDF_activate),
-                     NULL);
-+#endif
-   g_signal_connect ((gpointer) fileQuit, "activate",
-                     G_CALLBACK (on_fileQuit_activate),
-                     NULL);
-@@ -1941,11 +1947,13 @@
-   GLADE_HOOKUP_OBJECT (winMain, fileSave, "fileSave");
-   GLADE_HOOKUP_OBJECT (winMain, fileSaveAs, "fileSaveAs");
-   GLADE_HOOKUP_OBJECT (winMain, separator1, "separator1");
-+#if ENABLE_PRINTING
-   GLADE_HOOKUP_OBJECT (winMain, filePrintOptions, "filePrintOptions");
-   GLADE_HOOKUP_OBJECT (winMain, image501, "image501");
-   GLADE_HOOKUP_OBJECT (winMain, filePrint, "filePrint");
-   GLADE_HOOKUP_OBJECT (winMain, filePrintPDF, "filePrintPDF");
-   GLADE_HOOKUP_OBJECT (winMain, separator2, "separator2");
-+#endif
-   GLADE_HOOKUP_OBJECT (winMain, fileQuit, "fileQuit");
-   GLADE_HOOKUP_OBJECT (winMain, menuEdit, "menuEdit");
-   GLADE_HOOKUP_OBJECT (winMain, menuEdit_menu, "menuEdit_menu");
diff --git a/meta-demoapps/recipes-graphics/xournal/xournal_0.2.bb b/meta-demoapps/recipes-graphics/xournal/xournal_0.2.bb
deleted file mode 100644
index 1ca6e1e..0000000
--- a/meta-demoapps/recipes-graphics/xournal/xournal_0.2.bb
+++ /dev/null
@@ -1,12 +0,0 @@
-HOMEPAGE = "http://www-math.mit.edu/~auroux/software/xournal/"
-DESCRIPTION = "Xournal is an application for notetaking, sketching, keeping a journal using a stylus."
-DEPENDS = "gtk+ libgnomecanvas zlib"
-SECTION = "x11"
-LICENSE = "GPL"
-PR = "r2"
-
-SRC_URI = "http://math.mit.edu/~auroux/software/xournal/xournal-0.2.tar.gz \
-           file://ldflags.patch;patch=1 \
-           file://no-printing.diff;patch=1"
-
-inherit autotools pkgconfig
diff --git a/meta-demoapps/recipes-sato/claws-mail/claws-mail.inc b/meta-demoapps/recipes-sato/claws-mail/claws-mail.inc
deleted file mode 100644
index 664a0bc..0000000
--- a/meta-demoapps/recipes-sato/claws-mail/claws-mail.inc
+++ /dev/null
@@ -1,58 +0,0 @@
-SECTION = "x11/network"
-DESCRIPTION = "Mail user agent"
-#DEPENDS = "gtk+ gpgme libetpan libgnomeprint aspell openssl"
-DEPENDS = "gtk+ libetpan openssl libowl"
-LICENSE = "GPL"
-PR = "r7"
-
-SRC_URI = "\
-	${SOURCEFORGE_MIRROR}/sylpheed-claws/claws-mail-${PV}.tar.bz2	\
-	file://desktop.patch;patch=1				\
-	file://streamline-ui.patch;patch=1				\
-	file://owl-window-menu.patch;patch=1				\
-  file://fix-build.patch;patch=1    \
-	"
-
-FILES_${PN} = "${bindir} ${datadir}/pixmaps ${datadir}/applications"
-
-#EXTRA_OECONF = "--disable-aspell-test \
-# --disable-dillo-viewer-plugin --with-aspell-prefix=${STAGING_DIR_HOST}${prefix} \
-# --enable-aspell"
-
-EXTRA_OECONF = "--disable-aspell-test 		\
-		--disable-aspell 		\
-		--disable-manual		\
-		--disable-crash-dialog		\
-		--disable-jpilot		\
-		--disable-trayicon-plugin	\
-		--disable-spamassassin-plugin	\
-		--disable-bogofilter-plugin	\
-		--disable-pgpcore-plugin	\
-		--disable-pgpmime-plugin	\
-		--disable-pgpinline-plugin	\
-  		--disable-dillo-viewer-plugin	\
-		--disable-clamav-plugin		\
-		--disable-gnomeprint		\
-		--disable-valgrind		\
-    --disable-static    \
-		"
-
-#  		--disable-openssl 		\
-#		--disable-libetpan		\
-
-CFLAGS += "-D_GNU_SOURCE"
-
-inherit autotools pkgconfig gettext
-
-do_install_append() {
-	install -d ${D}${datadir}/applications
-	install -m 0644 claws-mail.desktop ${D}${datadir}/applications/
-	install -d ${D}${datadir}/pixmaps
-	install -m 0644 claws-mail.png ${D}${datadir}/pixmaps/
-}
-
-#python populate_packages_prepend () {
-#	abiword_libdir = bb.data.expand('${libdir}/claws-mail/plugins', d)
-#
-#	do_split_packages(d, abiword_libdir, '^(.*)\.so$', 'claws-mail-plugin-%s', 'Claws plugin for %s', extra_depends='')
-#}
diff --git a/meta-demoapps/recipes-sato/claws-mail/claws-mail_2.9.1.bb b/meta-demoapps/recipes-sato/claws-mail/claws-mail_2.9.1.bb
deleted file mode 100644
index f8a8396..0000000
--- a/meta-demoapps/recipes-sato/claws-mail/claws-mail_2.9.1.bb
+++ /dev/null
@@ -1 +0,0 @@
-require claws-mail.inc
diff --git a/meta-demoapps/recipes-sato/claws-mail/claws-plugin-gtkhtml2-viewer_0.15.bb b/meta-demoapps/recipes-sato/claws-mail/claws-plugin-gtkhtml2-viewer_0.15.bb
deleted file mode 100644
index 8291817..0000000
--- a/meta-demoapps/recipes-sato/claws-mail/claws-plugin-gtkhtml2-viewer_0.15.bb
+++ /dev/null
@@ -1,14 +0,0 @@
-SECTION = "x11/network"
-DESCRIPTION = "Mail user agent plugins"
-DEPENDS = "claws-mail gtkhtml2 curl"
-LICENSE = "GPL"
-PR = "r1"
-
-SRC_URI = "http://www.claws-mail.org/downloads/plugins/gtkhtml2_viewer-${PV}.tar.gz"
-
-inherit autotools pkgconfig gettext
-
-S = "${WORKDIR}/gtkhtml2_viewer-${PV}"
-
-FILES_${PN} = "${libdir}/claws-mail/plugins/*.so"
-
diff --git a/meta-demoapps/recipes-sato/claws-mail/claws-plugin-maildir_0.24.4.bb b/meta-demoapps/recipes-sato/claws-mail/claws-plugin-maildir_0.24.4.bb
deleted file mode 100644
index 4351d1e..0000000
--- a/meta-demoapps/recipes-sato/claws-mail/claws-plugin-maildir_0.24.4.bb
+++ /dev/null
@@ -1,14 +0,0 @@
-SECTION = "x11/network"
-DESCRIPTION = "Mail user agent plugins"
-DEPENDS = "claws-mail db"
-LICENSE = "GPL"
-PR = "r1"
-
-SRC_URI = "http://www.claws-mail.org/downloads/plugins/maildir-${PV}.tar.gz"
-
-inherit autotools pkgconfig
-
-S = "${WORKDIR}/maildir-${PV}"
-
-FILES_${PN} = "${libdir}/claws-mail/plugins/*.so"
-
diff --git a/meta-demoapps/recipes-sato/claws-mail/claws-plugin-mailmbox_1.13.bb b/meta-demoapps/recipes-sato/claws-mail/claws-plugin-mailmbox_1.13.bb
deleted file mode 100644
index fe70414..0000000
--- a/meta-demoapps/recipes-sato/claws-mail/claws-plugin-mailmbox_1.13.bb
+++ /dev/null
@@ -1,14 +0,0 @@
-SECTION = "x11/network"
-DESCRIPTION = "Mail user agent plugins"
-DEPENDS = "claws-mail"
-LICENSE = "GPL"
-PR = "r2"
-
-SRC_URI = "http://www.claws-mail.org/downloads/plugins/mailmbox-${PV}.tar.gz"
-
-inherit autotools pkgconfig
-
-S = "${WORKDIR}/mailmbox-${PV}"
-
-FILES_${PN} = "${libdir}/claws-mail/plugins/*.so"
-FILES_${PN}-dbg = "${libdir}/claws-mail/plugins/.debug"
diff --git a/meta-demoapps/recipes-sato/claws-mail/claws-plugin-rssyl_0.13.bb b/meta-demoapps/recipes-sato/claws-mail/claws-plugin-rssyl_0.13.bb
deleted file mode 100644
index de0705c..0000000
--- a/meta-demoapps/recipes-sato/claws-mail/claws-plugin-rssyl_0.13.bb
+++ /dev/null
@@ -1,14 +0,0 @@
-SECTION = "x11/network"
-DESCRIPTION = "Mail user agent plugins"
-DEPENDS = "claws-mail libxml2 curl glib-2.0 gtk+"
-LICENSE = "GPL"
-PR = "r1"
-
-SRC_URI = "http://www.claws-mail.org/downloads/plugins/rssyl-${PV}.tar.gz"
-
-inherit autotools pkgconfig gettext
-
-S = "${WORKDIR}/rssyl-${PV}"
-
-FILES_${PN} = "${libdir}/claws-mail/plugins/*.so"
-
diff --git a/meta-demoapps/recipes-sato/claws-mail/files/desktop.patch b/meta-demoapps/recipes-sato/claws-mail/files/desktop.patch
deleted file mode 100644
index d5ca3db..0000000
--- a/meta-demoapps/recipes-sato/claws-mail/files/desktop.patch
+++ /dev/null
@@ -1,21 +0,0 @@
-Upstream-Status: Inappropriate [configuration]
-
-Index: claws-mail-2.9.1/claws-mail.desktop
-===================================================================
---- claws-mail-2.9.1.orig/claws-mail.desktop	2007-04-24 17:40:20.000000000 +0100
-+++ claws-mail-2.9.1/claws-mail.desktop	2007-04-25 07:08:36.000000000 +0100
-@@ -1,11 +1,11 @@
- [Desktop Entry]
- Encoding=UTF-8
--Name=Claws Mail
-+Name=Mail
- Exec=claws-mail
- Icon=claws-mail
--Info="Claws Mail"
-+Info=Email Application
- Categories=GTK;Network;Email;
--Comment="Gtk+ based Mail Client"
-+Comment=Email Application
- Terminal=false
- Type=Application
- StartupNotify=true
diff --git a/meta-demoapps/recipes-sato/claws-mail/files/fix-build.patch b/meta-demoapps/recipes-sato/claws-mail/files/fix-build.patch
deleted file mode 100644
index 41ca1d6..0000000
--- a/meta-demoapps/recipes-sato/claws-mail/files/fix-build.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-Upstream-Status: Pending
-
-Remove duplicate file entries as this breaks install with new Automake
-
-JL 19/03/10
-
-Index: claws-mail-2.9.1/src/gtk/Makefile.am
-===================================================================
---- claws-mail-2.9.1.orig/src/gtk/Makefile.am	2007-03-22 07:52:47.000000000 +0000
-+++ claws-mail-2.9.1/src/gtk/Makefile.am	2010-03-19 14:54:06.565828281 +0000
-@@ -44,7 +44,6 @@
- 	filesel.h \
- 	foldersort.h \
- 	gtkaspell.h \
--	gtksctree.h \
- 	gtkshruler.h \
- 	gtksctree.h \
- 	gtksourceprintjob.h \
-@@ -57,7 +56,6 @@
- 	menu.h \
- 	pluginwindow.h \
- 	prefswindow.h \
--	gtkvscrollbutton.h \
- 	progressdialog.h \
- 	quicksearch.h \
- 	sslcertwindow.h \
diff --git a/meta-demoapps/recipes-sato/claws-mail/files/owl-window-menu.patch b/meta-demoapps/recipes-sato/claws-mail/files/owl-window-menu.patch
deleted file mode 100644
index 97807b2..0000000
--- a/meta-demoapps/recipes-sato/claws-mail/files/owl-window-menu.patch
+++ /dev/null
@@ -1,1011 +0,0 @@
-Upstream-Status: Inappropriate [enable feature]
-
-Index: claws-mail-2.9.1/src/addressbook.c
-===================================================================
---- claws-mail-2.9.1.orig/src/addressbook.c	2007-04-25 10:18:13.000000000 +0100
-+++ claws-mail-2.9.1/src/addressbook.c	2007-04-25 10:30:23.000000000 +0100
-@@ -941,7 +941,6 @@
- 		sizeof(addressbook_entries[0]);
- 	menubar = menubar_create(window, addressbook_entries, n_entries,
- 				 "<AddressBook>", NULL);
--	gtk_box_pack_start(GTK_BOX(vbox), menubar, FALSE, TRUE, 0);
- 	menu_factory = gtk_item_factory_from_widget(menubar);
- 
- 	vbox2 = gtk_vbox_new(FALSE, BORDER_WIDTH);
-Index: claws-mail-2.9.1/src/gtk/menu.c
-===================================================================
---- claws-mail-2.9.1.orig/src/gtk/menu.c	2007-04-25 10:18:13.000000000 +0100
-+++ claws-mail-2.9.1/src/gtk/menu.c	2007-04-25 10:30:23.000000000 +0100
-@@ -35,10 +35,7 @@
- #include "menu.h"
- #include "utils.h"
- 
--#ifdef MAEMO
--#include <hildon-widgets/hildon-program.h>
--#include <gtk/gtkmain.h>
--#endif
-+#include <libowl/owlwindowmenu.h>
- 
- static void connect_accel_change_signals(GtkWidget* widget, GtkWidget *wid2) ;
- 
-@@ -49,20 +46,14 @@
- 	GtkItemFactory *factory;
- 	GtkWidget *menubar;
- 	
--#ifdef MAEMO
- 	factory = gtk_item_factory_new(GTK_TYPE_MENU, path, NULL);
--#else
--	factory = gtk_item_factory_new(GTK_TYPE_MENU_BAR, path, NULL);
--#endif
- 	gtk_item_factory_set_translate_func(factory, menu_translate,
- 					    NULL, NULL);
- 	gtk_item_factory_create_items(factory, n_entries, entries, data);
- 	gtk_window_add_accel_group (GTK_WINDOW (window), factory->accel_group);
- 
- 	menubar  = gtk_item_factory_get_widget(factory, path);
--#ifdef MAEMO
--	hildon_window_set_menu(HILDON_WINDOW(window), GTK_MENU(menubar));
--#endif
-+	owl_set_window_menu(GTK_WINDOW(window), GTK_MENU(menubar));
- 	return menubar;
- }
- 
-Index: claws-mail-2.9.1/src/mainwindow.c
-===================================================================
---- claws-mail-2.9.1.orig/src/mainwindow.c	2007-04-25 10:26:40.000000000 +0100
-+++ claws-mail-2.9.1/src/mainwindow.c	2007-04-25 10:30:23.000000000 +0100
-@@ -1094,8 +1094,6 @@
- 	n_menu_entries = sizeof(mainwin_entries) / sizeof(mainwin_entries[0]);
- 	menubar = menubar_create(window, mainwin_entries, 
- 				 n_menu_entries, "<Main>", mainwin);
--	gtk_widget_show(menubar);
--	gtk_box_pack_start(GTK_BOX(vbox), menubar, FALSE, TRUE, 0);
- 	ifactory = gtk_item_factory_from_widget(menubar);
- 
- /*	gtk_widget_show(gtk_item_factory_get_item(ifactory,"/Message/Mailing-List"));
-Index: claws-mail-2.9.1/src/messageview.c
-===================================================================
---- claws-mail-2.9.1.orig/src/messageview.c	2007-04-25 10:18:13.000000000 +0100
-+++ claws-mail-2.9.1/src/messageview.c	2007-04-25 10:30:23.000000000 +0100
-@@ -414,8 +414,6 @@
- 	n_menu_entries = sizeof(msgview_entries) / sizeof(msgview_entries[0]);
- 	menubar = menubar_create(window, msgview_entries,
- 				 n_menu_entries, "<MessageView>", msgview);
--	gtk_widget_show(menubar);
--	gtk_box_pack_start(GTK_BOX(vbox), menubar, FALSE, TRUE, 0);
- 
- 	if (prefs_common.toolbar_detachable) {
- 		handlebox = gtk_handle_box_new();
-@@ -478,6 +476,7 @@
- 	g_signal_connect(G_OBJECT(window), "key_press_event",
- 			 G_CALLBACK(key_pressed), msgview);
- #endif
-+	gtk_widget_realize(window);
- 	messageview_add_toolbar(msgview, window);
- 
- 	if (show) {
-Index: claws-mail-2.9.1/configure.ac
-===================================================================
---- claws-mail-2.9.1.orig/configure.ac	2007-04-25 10:18:13.000000000 +0100
-+++ claws-mail-2.9.1/configure.ac	2007-04-25 10:30:23.000000000 +0100
-@@ -406,6 +406,11 @@
- AC_SUBST(GTK_CFLAGS)
- AC_SUBST(GTK_LIBS)
- 
-+OWL_CFLAGS=""
-+OWL_LIBS="-lowl"
-+AC_SUBST(OWL_CFLAGS)
-+AC_SUBST(OWL_LIBS)
-+
- dnl GNU/Aspell is used for spell checking
- AC_ARG_ENABLE(aspell,
- 	[  --disable-aspell         Disable GNU/aspell support [default=yes]],
-Index: claws-mail-2.9.1/src/Makefile.am
-===================================================================
---- claws-mail-2.9.1.orig/src/Makefile.am	2007-04-25 10:18:13.000000000 +0100
-+++ claws-mail-2.9.1/src/Makefile.am	2007-04-25 10:30:23.000000000 +0100
-@@ -471,7 +471,8 @@
- 	$(LIBICONV) \
- 	$(STARTUP_NOTIFICATION_LIBS) \
- 	$(LIBETPAN_LIBS) \
--	$(MAEMO_LIBS)
-+	$(MAEMO_LIBS) \
-+	$(OWL_LIBS)
- 
- AM_CPPFLAGS = \
- 	-DG_LOG_DOMAIN=\"Claws-Mail\" \
-@@ -489,6 +490,7 @@
- 	$(LIBETPAN_CPPFLAGS) \
- 	$(STARTUP_NOTIFICATION_CFLAGS) \
- 	$(MAEMO_CFLAGS) \
-+	$(OWL_CFLAGS) \
- 	-Wno-unused-function
- 	 
- #no-unused-function is there because of bison stuff
-Index: claws-mail-2.9.1/configure
-===================================================================
---- claws-mail-2.9.1.orig/configure	2007-04-25 10:18:13.000000000 +0100
-+++ claws-mail-2.9.1/configure	2007-04-25 10:30:23.000000000 +0100
-@@ -769,7 +769,6 @@
- # include <unistd.h>
- #endif"
- 
--gt_needs=
- ac_subst_vars='SHELL
- PATH_SEPARATOR
- PACKAGE_NAME
-@@ -942,6 +941,8 @@
- PASSCRYPT_KEY
- GTK_CFLAGS
- GTK_LIBS
-+OWL_LIBS
-+OWL_CFLAGS
- ASPELL
- ASPELL_CFLAGS
- ASPELL_LIBS
-@@ -2063,7 +2064,6 @@
-   >$cache_file
- fi
- 
--gt_needs="$gt_needs "
- # Check that the precious variables saved in the cache have kept the same
- # value.
- ac_cache_corrupted=false
-@@ -3001,9 +3001,7 @@
- 	# Put the nasty error message in config.log where it belongs
- 	echo "$GNOME2_PKG_ERRORS" >&5
- 
--	{ echo "$as_me:$LINENO: result: no" >&5
--echo "${ECHO_T}no" >&6; }
--                ac_enable_gnome2=no
-+	ac_enable_gnome2=no
- elif test $pkg_failed = untried; then
- 	ac_enable_gnome2=no
- else
-@@ -4147,14 +4145,12 @@
- 
- 
- 
--
--        { echo "$as_me:$LINENO: checking for strerror in -lcposix" >&5
--echo $ECHO_N "checking for strerror in -lcposix... $ECHO_C" >&6; }
--if test "${ac_cv_lib_cposix_strerror+set}" = set; then
-+{ echo "$as_me:$LINENO: checking for library containing strerror" >&5
-+echo $ECHO_N "checking for library containing strerror... $ECHO_C" >&6; }
-+if test "${ac_cv_search_strerror+set}" = set; then
-   echo $ECHO_N "(cached) $ECHO_C" >&6
- else
--  ac_check_lib_save_LIBS=$LIBS
--LIBS="-lcposix  $LIBS"
-+  ac_func_search_save_LIBS=$LIBS
- cat >conftest.$ac_ext <<_ACEOF
- /* confdefs.h.  */
- _ACEOF
-@@ -4177,7 +4173,14 @@
-   return 0;
- }
- _ACEOF
--rm -f conftest.$ac_objext conftest$ac_exeext
-+for ac_lib in '' cposix; do
-+  if test -z "$ac_lib"; then
-+    ac_res="none required"
-+  else
-+    ac_res=-l$ac_lib
-+    LIBS="-l$ac_lib  $ac_func_search_save_LIBS"
-+  fi
-+  rm -f conftest.$ac_objext conftest$ac_exeext
- if { (ac_try="$ac_link"
- case "(($ac_try" in
-   *\"* | *\`* | *\\*) ac_try_echo=\$ac_try;;
-@@ -4195,25 +4198,35 @@
- 	 test ! -s conftest.err
-        } && test -s conftest$ac_exeext &&
-        $as_test_x conftest$ac_exeext; then
--  ac_cv_lib_cposix_strerror=yes
-+  ac_cv_search_strerror=$ac_res
- else
-   echo "$as_me: failed program was:" >&5
- sed 's/^/| /' conftest.$ac_ext >&5
- 
--	ac_cv_lib_cposix_strerror=no
-+
- fi
- 
- rm -f core conftest.err conftest.$ac_objext conftest_ipa8_conftest.oo \
--      conftest$ac_exeext conftest.$ac_ext
--LIBS=$ac_check_lib_save_LIBS
-+      conftest$ac_exeext
-+  if test "${ac_cv_search_strerror+set}" = set; then
-+  break
-+fi
-+done
-+if test "${ac_cv_search_strerror+set}" = set; then
-+  :
-+else
-+  ac_cv_search_strerror=no
- fi
--{ echo "$as_me:$LINENO: result: $ac_cv_lib_cposix_strerror" >&5
--echo "${ECHO_T}$ac_cv_lib_cposix_strerror" >&6; }
--if test $ac_cv_lib_cposix_strerror = yes; then
--  LIBS="$LIBS -lcposix"
-+rm conftest.$ac_ext
-+LIBS=$ac_func_search_save_LIBS
- fi
-+{ echo "$as_me:$LINENO: result: $ac_cv_search_strerror" >&5
-+echo "${ECHO_T}$ac_cv_search_strerror" >&6; }
-+ac_res=$ac_cv_search_strerror
-+if test "$ac_res" != no; then
-+  test "$ac_res" = "none required" || LIBS="$ac_res $LIBS"
- 
--
-+fi
- 
- # Find a good install program.  We prefer a C program (faster),
- # so one script is as good as another.  But avoid the broken or
-@@ -5769,7 +5782,7 @@
-   ;;
- *-*-irix6*)
-   # Find out which ABI we are using.
--  echo '#line 5772 "configure"' > conftest.$ac_ext
-+  echo '#line 5785 "configure"' > conftest.$ac_ext
-   if { (eval echo "$as_me:$LINENO: \"$ac_compile\"") >&5
-   (eval $ac_compile) 2>&5
-   ac_status=$?
-@@ -8555,11 +8568,11 @@
-    -e 's:.*FLAGS}\{0,1\} :&$lt_compiler_flag :; t' \
-    -e 's: [^ ]*conftest\.: $lt_compiler_flag&:; t' \
-    -e 's:$: $lt_compiler_flag:'`
--   (eval echo "\"\$as_me:8558: $lt_compile\"" >&5)
-+   (eval echo "\"\$as_me:8571: $lt_compile\"" >&5)
-    (eval "$lt_compile" 2>conftest.err)
-    ac_status=$?
-    cat conftest.err >&5
--   echo "$as_me:8562: \$? = $ac_status" >&5
-+   echo "$as_me:8575: \$? = $ac_status" >&5
-    if (exit $ac_status) && test -s "$ac_outfile"; then
-      # The compiler can only warn and ignore the option if not recognized
-      # So say no if there are warnings other than the usual output.
-@@ -8823,11 +8836,11 @@
-    -e 's:.*FLAGS}\{0,1\} :&$lt_compiler_flag :; t' \
-    -e 's: [^ ]*conftest\.: $lt_compiler_flag&:; t' \
-    -e 's:$: $lt_compiler_flag:'`
--   (eval echo "\"\$as_me:8826: $lt_compile\"" >&5)
-+   (eval echo "\"\$as_me:8839: $lt_compile\"" >&5)
-    (eval "$lt_compile" 2>conftest.err)
-    ac_status=$?
-    cat conftest.err >&5
--   echo "$as_me:8830: \$? = $ac_status" >&5
-+   echo "$as_me:8843: \$? = $ac_status" >&5
-    if (exit $ac_status) && test -s "$ac_outfile"; then
-      # The compiler can only warn and ignore the option if not recognized
-      # So say no if there are warnings other than the usual output.
-@@ -8927,11 +8940,11 @@
-    -e 's:.*FLAGS}\{0,1\} :&$lt_compiler_flag :; t' \
-    -e 's: [^ ]*conftest\.: $lt_compiler_flag&:; t' \
-    -e 's:$: $lt_compiler_flag:'`
--   (eval echo "\"\$as_me:8930: $lt_compile\"" >&5)
-+   (eval echo "\"\$as_me:8943: $lt_compile\"" >&5)
-    (eval "$lt_compile" 2>out/conftest.err)
-    ac_status=$?
-    cat out/conftest.err >&5
--   echo "$as_me:8934: \$? = $ac_status" >&5
-+   echo "$as_me:8947: \$? = $ac_status" >&5
-    if (exit $ac_status) && test -s out/conftest2.$ac_objext
-    then
-      # The compiler can only warn and ignore the option if not recognized
-@@ -11224,7 +11237,7 @@
-   lt_dlunknown=0; lt_dlno_uscore=1; lt_dlneed_uscore=2
-   lt_status=$lt_dlunknown
-   cat > conftest.$ac_ext <<EOF
--#line 11227 "configure"
-+#line 11240 "configure"
- #include "confdefs.h"
- 
- #if HAVE_DLFCN_H
-@@ -11324,7 +11337,7 @@
-   lt_dlunknown=0; lt_dlno_uscore=1; lt_dlneed_uscore=2
-   lt_status=$lt_dlunknown
-   cat > conftest.$ac_ext <<EOF
--#line 11327 "configure"
-+#line 11340 "configure"
- #include "confdefs.h"
- 
- #if HAVE_DLFCN_H
-@@ -13660,11 +13673,11 @@
-    -e 's:.*FLAGS}\{0,1\} :&$lt_compiler_flag :; t' \
-    -e 's: [^ ]*conftest\.: $lt_compiler_flag&:; t' \
-    -e 's:$: $lt_compiler_flag:'`
--   (eval echo "\"\$as_me:13663: $lt_compile\"" >&5)
-+   (eval echo "\"\$as_me:13676: $lt_compile\"" >&5)
-    (eval "$lt_compile" 2>conftest.err)
-    ac_status=$?
-    cat conftest.err >&5
--   echo "$as_me:13667: \$? = $ac_status" >&5
-+   echo "$as_me:13680: \$? = $ac_status" >&5
-    if (exit $ac_status) && test -s "$ac_outfile"; then
-      # The compiler can only warn and ignore the option if not recognized
-      # So say no if there are warnings other than the usual output.
-@@ -13764,11 +13777,11 @@
-    -e 's:.*FLAGS}\{0,1\} :&$lt_compiler_flag :; t' \
-    -e 's: [^ ]*conftest\.: $lt_compiler_flag&:; t' \
-    -e 's:$: $lt_compiler_flag:'`
--   (eval echo "\"\$as_me:13767: $lt_compile\"" >&5)
-+   (eval echo "\"\$as_me:13780: $lt_compile\"" >&5)
-    (eval "$lt_compile" 2>out/conftest.err)
-    ac_status=$?
-    cat out/conftest.err >&5
--   echo "$as_me:13771: \$? = $ac_status" >&5
-+   echo "$as_me:13784: \$? = $ac_status" >&5
-    if (exit $ac_status) && test -s out/conftest2.$ac_objext
-    then
-      # The compiler can only warn and ignore the option if not recognized
-@@ -15325,11 +15338,11 @@
-    -e 's:.*FLAGS}\{0,1\} :&$lt_compiler_flag :; t' \
-    -e 's: [^ ]*conftest\.: $lt_compiler_flag&:; t' \
-    -e 's:$: $lt_compiler_flag:'`
--   (eval echo "\"\$as_me:15328: $lt_compile\"" >&5)
-+   (eval echo "\"\$as_me:15341: $lt_compile\"" >&5)
-    (eval "$lt_compile" 2>conftest.err)
-    ac_status=$?
-    cat conftest.err >&5
--   echo "$as_me:15332: \$? = $ac_status" >&5
-+   echo "$as_me:15345: \$? = $ac_status" >&5
-    if (exit $ac_status) && test -s "$ac_outfile"; then
-      # The compiler can only warn and ignore the option if not recognized
-      # So say no if there are warnings other than the usual output.
-@@ -15429,11 +15442,11 @@
-    -e 's:.*FLAGS}\{0,1\} :&$lt_compiler_flag :; t' \
-    -e 's: [^ ]*conftest\.: $lt_compiler_flag&:; t' \
-    -e 's:$: $lt_compiler_flag:'`
--   (eval echo "\"\$as_me:15432: $lt_compile\"" >&5)
-+   (eval echo "\"\$as_me:15445: $lt_compile\"" >&5)
-    (eval "$lt_compile" 2>out/conftest.err)
-    ac_status=$?
-    cat out/conftest.err >&5
--   echo "$as_me:15436: \$? = $ac_status" >&5
-+   echo "$as_me:15449: \$? = $ac_status" >&5
-    if (exit $ac_status) && test -s out/conftest2.$ac_objext
-    then
-      # The compiler can only warn and ignore the option if not recognized
-@@ -17616,11 +17629,11 @@
-    -e 's:.*FLAGS}\{0,1\} :&$lt_compiler_flag :; t' \
-    -e 's: [^ ]*conftest\.: $lt_compiler_flag&:; t' \
-    -e 's:$: $lt_compiler_flag:'`
--   (eval echo "\"\$as_me:17619: $lt_compile\"" >&5)
-+   (eval echo "\"\$as_me:17632: $lt_compile\"" >&5)
-    (eval "$lt_compile" 2>conftest.err)
-    ac_status=$?
-    cat conftest.err >&5
--   echo "$as_me:17623: \$? = $ac_status" >&5
-+   echo "$as_me:17636: \$? = $ac_status" >&5
-    if (exit $ac_status) && test -s "$ac_outfile"; then
-      # The compiler can only warn and ignore the option if not recognized
-      # So say no if there are warnings other than the usual output.
-@@ -17884,11 +17897,11 @@
-    -e 's:.*FLAGS}\{0,1\} :&$lt_compiler_flag :; t' \
-    -e 's: [^ ]*conftest\.: $lt_compiler_flag&:; t' \
-    -e 's:$: $lt_compiler_flag:'`
--   (eval echo "\"\$as_me:17887: $lt_compile\"" >&5)
-+   (eval echo "\"\$as_me:17900: $lt_compile\"" >&5)
-    (eval "$lt_compile" 2>conftest.err)
-    ac_status=$?
-    cat conftest.err >&5
--   echo "$as_me:17891: \$? = $ac_status" >&5
-+   echo "$as_me:17904: \$? = $ac_status" >&5
-    if (exit $ac_status) && test -s "$ac_outfile"; then
-      # The compiler can only warn and ignore the option if not recognized
-      # So say no if there are warnings other than the usual output.
-@@ -17988,11 +18001,11 @@
-    -e 's:.*FLAGS}\{0,1\} :&$lt_compiler_flag :; t' \
-    -e 's: [^ ]*conftest\.: $lt_compiler_flag&:; t' \
-    -e 's:$: $lt_compiler_flag:'`
--   (eval echo "\"\$as_me:17991: $lt_compile\"" >&5)
-+   (eval echo "\"\$as_me:18004: $lt_compile\"" >&5)
-    (eval "$lt_compile" 2>out/conftest.err)
-    ac_status=$?
-    cat out/conftest.err >&5
--   echo "$as_me:17995: \$? = $ac_status" >&5
-+   echo "$as_me:18008: \$? = $ac_status" >&5
-    if (exit $ac_status) && test -s out/conftest2.$ac_objext
-    then
-      # The compiler can only warn and ignore the option if not recognized
-@@ -20960,16 +20973,9 @@
-           found_so=
-           found_a=
-           if test $use_additional = yes; then
--            if test -n "$shlibext" \
--               && { test -f "$additional_libdir/lib$name.$shlibext" \
--                    || { test "$shlibext" = dll \
--                         && test -f "$additional_libdir/lib$name.dll.a"; }; }; then
-+            if test -n "$shlibext" && test -f "$additional_libdir/lib$name.$shlibext"; then
-               found_dir="$additional_libdir"
--              if test -f "$additional_libdir/lib$name.$shlibext"; then
--                found_so="$additional_libdir/lib$name.$shlibext"
--              else
--                found_so="$additional_libdir/lib$name.dll.a"
--              fi
-+              found_so="$additional_libdir/lib$name.$shlibext"
-               if test -f "$additional_libdir/lib$name.la"; then
-                 found_la="$additional_libdir/lib$name.la"
-               fi
-@@ -20997,16 +21003,9 @@
-               case "$x" in
-                 -L*)
-                   dir=`echo "X$x" | sed -e 's/^X-L//'`
--                  if test -n "$shlibext" \
--                     && { test -f "$dir/lib$name.$shlibext" \
--                          || { test "$shlibext" = dll \
--                               && test -f "$dir/lib$name.dll.a"; }; }; then
-+                  if test -n "$shlibext" && test -f "$dir/lib$name.$shlibext"; then
-                     found_dir="$dir"
--                    if test -f "$dir/lib$name.$shlibext"; then
--                      found_so="$dir/lib$name.$shlibext"
--                    else
--                      found_so="$dir/lib$name.dll.a"
--                    fi
-+                    found_so="$dir/lib$name.$shlibext"
-                     if test -f "$dir/lib$name.la"; then
-                       found_la="$dir/lib$name.la"
-                     fi
-@@ -21927,13 +21926,6 @@
- 
- 
- 
--
--
--
--
--
--
--
-     { echo "$as_me:$LINENO: checking for CFPreferencesCopyAppValue" >&5
- echo $ECHO_N "checking for CFPreferencesCopyAppValue... $ECHO_C" >&6; }
- if test "${gt_cv_func_CFPreferencesCopyAppValue+set}" = set; then
-@@ -22070,37 +22062,17 @@
-   LTLIBINTL=
-   POSUB=
- 
--    case " $gt_needs " in
--    *" need-formatstring-macros "*) gt_api_version=3 ;;
--    *" need-ngettext "*) gt_api_version=2 ;;
--    *) gt_api_version=1 ;;
--  esac
--  gt_func_gnugettext_libc="gt_cv_func_gnugettext${gt_api_version}_libc"
--  gt_func_gnugettext_libintl="gt_cv_func_gnugettext${gt_api_version}_libintl"
--
-     if test "$USE_NLS" = "yes"; then
-     gt_use_preinstalled_gnugettext=no
- 
- 
--        if test $gt_api_version -ge 3; then
--          gt_revision_test_code='
--#ifndef __GNU_GETTEXT_SUPPORTED_REVISION
--#define __GNU_GETTEXT_SUPPORTED_REVISION(major) ((major) == 0 ? 0 : -1)
--#endif
--typedef int array [2 * (__GNU_GETTEXT_SUPPORTED_REVISION(0) >= 1) - 1];
--'
--        else
--          gt_revision_test_code=
--        fi
--        if test $gt_api_version -ge 2; then
--          gt_expression_test_code=' + * ngettext ("", "", 0)'
--        else
--          gt_expression_test_code=
--        fi
-+
-+
-+
- 
-         { echo "$as_me:$LINENO: checking for GNU gettext in libc" >&5
- echo $ECHO_N "checking for GNU gettext in libc... $ECHO_C" >&6; }
--if { as_var=$gt_func_gnugettext_libc; eval "test \"\${$as_var+set}\" = set"; }; then
-+if test "${gt_cv_func_gnugettext1_libc+set}" = set; then
-   echo $ECHO_N "(cached) $ECHO_C" >&6
- else
-   cat >conftest.$ac_ext <<_ACEOF
-@@ -22110,14 +22082,13 @@
- cat >>conftest.$ac_ext <<_ACEOF
- /* end confdefs.h.  */
- #include <libintl.h>
--$gt_revision_test_code
- extern int _nl_msg_cat_cntr;
- extern int *_nl_domain_bindings;
- int
- main ()
- {
- bindtextdomain ("", "");
--return * gettext ("")$gt_expression_test_code + _nl_msg_cat_cntr + *_nl_domain_bindings
-+return * gettext ("") + _nl_msg_cat_cntr + *_nl_domain_bindings
-   ;
-   return 0;
- }
-@@ -22140,22 +22111,21 @@
- 	 test ! -s conftest.err
-        } && test -s conftest$ac_exeext &&
-        $as_test_x conftest$ac_exeext; then
--  eval "$gt_func_gnugettext_libc=yes"
-+  gt_cv_func_gnugettext1_libc=yes
- else
-   echo "$as_me: failed program was:" >&5
- sed 's/^/| /' conftest.$ac_ext >&5
- 
--	eval "$gt_func_gnugettext_libc=no"
-+	gt_cv_func_gnugettext1_libc=no
- fi
- 
- rm -f core conftest.err conftest.$ac_objext conftest_ipa8_conftest.oo \
-       conftest$ac_exeext conftest.$ac_ext
- fi
--ac_res=`eval echo '${'$gt_func_gnugettext_libc'}'`
--	       { echo "$as_me:$LINENO: result: $ac_res" >&5
--echo "${ECHO_T}$ac_res" >&6; }
-+{ echo "$as_me:$LINENO: result: $gt_cv_func_gnugettext1_libc" >&5
-+echo "${ECHO_T}$gt_cv_func_gnugettext1_libc" >&6; }
- 
--        if { eval "gt_val=\$$gt_func_gnugettext_libc"; test "$gt_val" != "yes"; }; then
-+        if test "$gt_cv_func_gnugettext1_libc" != "yes"; then
- 
- 
- 
-@@ -22398,16 +22368,9 @@
-           found_so=
-           found_a=
-           if test $use_additional = yes; then
--            if test -n "$shlibext" \
--               && { test -f "$additional_libdir/lib$name.$shlibext" \
--                    || { test "$shlibext" = dll \
--                         && test -f "$additional_libdir/lib$name.dll.a"; }; }; then
-+            if test -n "$shlibext" && test -f "$additional_libdir/lib$name.$shlibext"; then
-               found_dir="$additional_libdir"
--              if test -f "$additional_libdir/lib$name.$shlibext"; then
--                found_so="$additional_libdir/lib$name.$shlibext"
--              else
--                found_so="$additional_libdir/lib$name.dll.a"
--              fi
-+              found_so="$additional_libdir/lib$name.$shlibext"
-               if test -f "$additional_libdir/lib$name.la"; then
-                 found_la="$additional_libdir/lib$name.la"
-               fi
-@@ -22435,16 +22398,9 @@
-               case "$x" in
-                 -L*)
-                   dir=`echo "X$x" | sed -e 's/^X-L//'`
--                  if test -n "$shlibext" \
--                     && { test -f "$dir/lib$name.$shlibext" \
--                          || { test "$shlibext" = dll \
--                               && test -f "$dir/lib$name.dll.a"; }; }; then
-+                  if test -n "$shlibext" && test -f "$dir/lib$name.$shlibext"; then
-                     found_dir="$dir"
--                    if test -f "$dir/lib$name.$shlibext"; then
--                      found_so="$dir/lib$name.$shlibext"
--                    else
--                      found_so="$dir/lib$name.dll.a"
--                    fi
-+                    found_so="$dir/lib$name.$shlibext"
-                     if test -f "$dir/lib$name.la"; then
-                       found_la="$dir/lib$name.la"
-                     fi
-@@ -22712,7 +22668,7 @@
- 
-           { echo "$as_me:$LINENO: checking for GNU gettext in libintl" >&5
- echo $ECHO_N "checking for GNU gettext in libintl... $ECHO_C" >&6; }
--if { as_var=$gt_func_gnugettext_libintl; eval "test \"\${$as_var+set}\" = set"; }; then
-+if test "${gt_cv_func_gnugettext1_libintl+set}" = set; then
-   echo $ECHO_N "(cached) $ECHO_C" >&6
- else
-   gt_save_CPPFLAGS="$CPPFLAGS"
-@@ -22726,7 +22682,6 @@
- cat >>conftest.$ac_ext <<_ACEOF
- /* end confdefs.h.  */
- #include <libintl.h>
--$gt_revision_test_code
- extern int _nl_msg_cat_cntr;
- extern
- #ifdef __cplusplus
-@@ -22737,7 +22692,7 @@
- main ()
- {
- bindtextdomain ("", "");
--return * gettext ("")$gt_expression_test_code + _nl_msg_cat_cntr + *_nl_expand_alias ("")
-+return * gettext ("") + _nl_msg_cat_cntr + *_nl_expand_alias ("")
-   ;
-   return 0;
- }
-@@ -22760,17 +22715,17 @@
- 	 test ! -s conftest.err
-        } && test -s conftest$ac_exeext &&
-        $as_test_x conftest$ac_exeext; then
--  eval "$gt_func_gnugettext_libintl=yes"
-+  gt_cv_func_gnugettext1_libintl=yes
- else
-   echo "$as_me: failed program was:" >&5
- sed 's/^/| /' conftest.$ac_ext >&5
- 
--	eval "$gt_func_gnugettext_libintl=no"
-+	gt_cv_func_gnugettext1_libintl=no
- fi
- 
- rm -f core conftest.err conftest.$ac_objext conftest_ipa8_conftest.oo \
-       conftest$ac_exeext conftest.$ac_ext
--                        if { eval "gt_val=\$$gt_func_gnugettext_libintl"; test "$gt_val" != yes; } && test -n "$LIBICONV"; then
-+                        if test "$gt_cv_func_gnugettext1_libintl" != yes && test -n "$LIBICONV"; then
-               LIBS="$LIBS $LIBICONV"
-               cat >conftest.$ac_ext <<_ACEOF
- /* confdefs.h.  */
-@@ -22779,7 +22734,6 @@
- cat >>conftest.$ac_ext <<_ACEOF
- /* end confdefs.h.  */
- #include <libintl.h>
--$gt_revision_test_code
- extern int _nl_msg_cat_cntr;
- extern
- #ifdef __cplusplus
-@@ -22790,7 +22744,7 @@
- main ()
- {
- bindtextdomain ("", "");
--return * gettext ("")$gt_expression_test_code + _nl_msg_cat_cntr + *_nl_expand_alias ("")
-+return * gettext ("") + _nl_msg_cat_cntr + *_nl_expand_alias ("")
-   ;
-   return 0;
- }
-@@ -22815,7 +22769,7 @@
-        $as_test_x conftest$ac_exeext; then
-   LIBINTL="$LIBINTL $LIBICONV"
-                 LTLIBINTL="$LTLIBINTL $LTLIBICONV"
--                eval "$gt_func_gnugettext_libintl=yes"
-+                gt_cv_func_gnugettext1_libintl=yes
- 
- else
-   echo "$as_me: failed program was:" >&5
-@@ -22830,13 +22784,12 @@
-             CPPFLAGS="$gt_save_CPPFLAGS"
-             LIBS="$gt_save_LIBS"
- fi
--ac_res=`eval echo '${'$gt_func_gnugettext_libintl'}'`
--	       { echo "$as_me:$LINENO: result: $ac_res" >&5
--echo "${ECHO_T}$ac_res" >&6; }
-+{ echo "$as_me:$LINENO: result: $gt_cv_func_gnugettext1_libintl" >&5
-+echo "${ECHO_T}$gt_cv_func_gnugettext1_libintl" >&6; }
-         fi
- 
--                                        if { eval "gt_val=\$$gt_func_gnugettext_libc"; test "$gt_val" = "yes"; } \
--           || { { eval "gt_val=\$$gt_func_gnugettext_libintl"; test "$gt_val" = "yes"; } \
-+                                        if test "$gt_cv_func_gnugettext1_libc" = "yes" \
-+           || { test "$gt_cv_func_gnugettext1_libintl" = "yes" \
-                 && test "$PACKAGE" != gettext-runtime \
-                 && test "$PACKAGE" != gettext-tools; }; then
-           gt_use_preinstalled_gnugettext=yes
-@@ -22876,7 +22829,7 @@
-     { echo "$as_me:$LINENO: checking where the gettext function comes from" >&5
- echo $ECHO_N "checking where the gettext function comes from... $ECHO_C" >&6; }
-     if test "$gt_use_preinstalled_gnugettext" = "yes"; then
--      if { eval "gt_val=\$$gt_func_gnugettext_libintl"; test "$gt_val" = "yes"; }; then
-+      if test "$gt_cv_func_gnugettext1_libintl" = "yes"; then
-         gt_source="external libintl"
-       else
-         gt_source="libc"
-@@ -22891,7 +22844,7 @@
-   if test "$USE_NLS" = "yes"; then
- 
-     if test "$gt_use_preinstalled_gnugettext" = "yes"; then
--      if { eval "gt_val=\$$gt_func_gnugettext_libintl"; test "$gt_val" = "yes"; }; then
-+      if test "$gt_cv_func_gnugettext1_libintl" = "yes"; then
-         { echo "$as_me:$LINENO: checking how to link with libintl" >&5
- echo $ECHO_N "checking how to link with libintl... $ECHO_C" >&6; }
-         { echo "$as_me:$LINENO: result: $LIBINTL" >&5
-@@ -26592,12 +26545,8 @@
-       esac
-   done
- 
--
--
--if test "x$ac_cv_env_PKG_CONFIG_set" != "xset"; then
--	if test -n "$ac_tool_prefix"; then
--  # Extract the first word of "${ac_tool_prefix}pkg-config", so it can be a program name with args.
--set dummy ${ac_tool_prefix}pkg-config; ac_word=$2
-+  # Extract the first word of "pkg-config", so it can be a program name with args.
-+set dummy pkg-config; ac_word=$2
- { echo "$as_me:$LINENO: checking for $ac_word" >&5
- echo $ECHO_N "checking for $ac_word... $ECHO_C" >&6; }
- if test "${ac_cv_path_PKG_CONFIG+set}" = set; then
-@@ -26623,6 +26572,7 @@
- done
- IFS=$as_save_IFS
- 
-+  test -z "$ac_cv_path_PKG_CONFIG" && ac_cv_path_PKG_CONFIG="no"
-   ;;
- esac
- fi
-@@ -26636,88 +26586,19 @@
- fi
- 
- 
--fi
--if test -z "$ac_cv_path_PKG_CONFIG"; then
--  ac_pt_PKG_CONFIG=$PKG_CONFIG
--  # Extract the first word of "pkg-config", so it can be a program name with args.
--set dummy pkg-config; ac_word=$2
--{ echo "$as_me:$LINENO: checking for $ac_word" >&5
--echo $ECHO_N "checking for $ac_word... $ECHO_C" >&6; }
--if test "${ac_cv_path_ac_pt_PKG_CONFIG+set}" = set; then
--  echo $ECHO_N "(cached) $ECHO_C" >&6
--else
--  case $ac_pt_PKG_CONFIG in
--  [\\/]* | ?:[\\/]*)
--  ac_cv_path_ac_pt_PKG_CONFIG="$ac_pt_PKG_CONFIG" # Let the user override the test with a path.
--  ;;
--  *)
--  as_save_IFS=$IFS; IFS=$PATH_SEPARATOR
--for as_dir in $PATH
--do
--  IFS=$as_save_IFS
--  test -z "$as_dir" && as_dir=.
--  for ac_exec_ext in '' $ac_executable_extensions; do
--  if { test -f "$as_dir/$ac_word$ac_exec_ext" && $as_test_x "$as_dir/$ac_word$ac_exec_ext"; }; then
--    ac_cv_path_ac_pt_PKG_CONFIG="$as_dir/$ac_word$ac_exec_ext"
--    echo "$as_me:$LINENO: found $as_dir/$ac_word$ac_exec_ext" >&5
--    break 2
--  fi
--done
--done
--IFS=$as_save_IFS
--
--  ;;
--esac
--fi
--ac_pt_PKG_CONFIG=$ac_cv_path_ac_pt_PKG_CONFIG
--if test -n "$ac_pt_PKG_CONFIG"; then
--  { echo "$as_me:$LINENO: result: $ac_pt_PKG_CONFIG" >&5
--echo "${ECHO_T}$ac_pt_PKG_CONFIG" >&6; }
--else
--  { echo "$as_me:$LINENO: result: no" >&5
--echo "${ECHO_T}no" >&6; }
--fi
--
--  if test "x$ac_pt_PKG_CONFIG" = x; then
--    PKG_CONFIG=""
--  else
--    case $cross_compiling:$ac_tool_warned in
--yes:)
--{ echo "$as_me:$LINENO: WARNING: In the future, Autoconf will not detect cross-tools
--whose name does not start with the host triplet.  If you think this
--configuration is useful to you, please write to autoconf@gnu.org." >&5
--echo "$as_me: WARNING: In the future, Autoconf will not detect cross-tools
--whose name does not start with the host triplet.  If you think this
--configuration is useful to you, please write to autoconf@gnu.org." >&2;}
--ac_tool_warned=yes ;;
--esac
--    PKG_CONFIG=$ac_pt_PKG_CONFIG
--  fi
--else
--  PKG_CONFIG="$ac_cv_path_PKG_CONFIG"
--fi
--
--fi
--if test -n "$PKG_CONFIG"; then
--	_pkg_min_version=0.7
--	{ echo "$as_me:$LINENO: checking pkg-config is at least version $_pkg_min_version" >&5
--echo $ECHO_N "checking pkg-config is at least version $_pkg_min_version... $ECHO_C" >&6; }
--	if $PKG_CONFIG --atleast-pkgconfig-version $_pkg_min_version; then
--		{ echo "$as_me:$LINENO: result: yes" >&5
--echo "${ECHO_T}yes" >&6; }
--	else
--		{ echo "$as_me:$LINENO: result: no" >&5
--echo "${ECHO_T}no" >&6; }
--		PKG_CONFIG=""
--	fi
--
--fi
- 
-   no_glib=""
- 
--  if test "x$PKG_CONFIG" = x ; then
-+  if test x$PKG_CONFIG != xno ; then
-+    if $PKG_CONFIG --atleast-pkgconfig-version 0.7 ; then
-+      :
-+    else
-+      echo *** pkg-config too old; version 0.7 or better required.
-+      no_glib=yes
-+      PKG_CONFIG=no
-+    fi
-+  else
-     no_glib=yes
--    PKG_CONFIG=no
-   fi
- 
-   min_glib_version=2.6.0
-@@ -27223,9 +27104,7 @@
- 	# Put the nasty error message in config.log where it belongs
- 	echo "$OPENSSL_PKG_ERRORS" >&5
- 
--	{ echo "$as_me:$LINENO: result: no" >&5
--echo "${ECHO_T}no" >&6; }
--                ac_cv_enable_openssl=no
-+	ac_cv_enable_openssl=no
- elif test $pkg_failed = untried; then
- 	ac_cv_enable_openssl=no
- else
-@@ -27793,6 +27672,11 @@
- 
- 
- 
-+OWL_LIBS="-lowl"
-+OLS_CFLAGS=""
-+
-+
-+
- # Check whether --enable-aspell was given.
- if test "${enable_aspell+set}" = set; then
-   enableval=$enable_aspell; ac_cv_enable_aspell=$enableval
-@@ -28242,9 +28126,7 @@
- 	# Put the nasty error message in config.log where it belongs
- 	echo "$MAEMO_PKG_ERRORS" >&5
- 
--	{ echo "$as_me:$LINENO: result: no" >&5
--echo "${ECHO_T}no" >&6; }
--                ac_cv_enable_maemo=no
-+	ac_cv_enable_maemo=no
- elif test $pkg_failed = untried; then
- 	ac_cv_enable_maemo=no
- else
-@@ -29796,8 +29678,6 @@
- 	# Put the nasty error message in config.log where it belongs
- 	echo "$STARTUP_NOTIFICATION_PKG_ERRORS" >&5
- 
--	{ echo "$as_me:$LINENO: result: no" >&5
--echo "${ECHO_T}no" >&6; }
- 
- 		echo "Building without libstartup-notification"
- 		enable_startup_notification=no
-@@ -31300,9 +31180,7 @@
- 	# Put the nasty error message in config.log where it belongs
- 	echo "$CLAMAV_PKG_ERRORS" >&5
- 
--	{ echo "$as_me:$LINENO: result: no" >&5
--echo "${ECHO_T}no" >&6; }
--                ac_cv_enable_clamav_plugin=no
-+	ac_cv_enable_clamav_plugin=no
- elif test $pkg_failed = untried; then
- 	ac_cv_enable_clamav_plugin=no
- else
-@@ -31684,9 +31562,7 @@
- 	# Put the nasty error message in config.log where it belongs
- 	echo "$GNOMEPRINT_PKG_ERRORS" >&5
- 
--	{ echo "$as_me:$LINENO: result: no" >&5
--echo "${ECHO_T}no" >&6; }
--                ac_cv_enable_gnomeprint=no
-+	ac_cv_enable_gnomeprint=no
- elif test $pkg_failed = untried; then
- 	ac_cv_enable_gnomeprint=no
- else
-@@ -31794,9 +31670,7 @@
- 	# Put the nasty error message in config.log where it belongs
- 	echo "$VALGRIND_PKG_ERRORS" >&5
- 
--	{ echo "$as_me:$LINENO: result: no" >&5
--echo "${ECHO_T}no" >&6; }
--                ac_cv_enable_valgrind=no
-+	ac_cv_enable_valgrind=no
- elif test $pkg_failed = untried; then
- 	ac_cv_enable_valgrind=no
- else
-@@ -32884,6 +32758,8 @@
- PASSCRYPT_KEY!$PASSCRYPT_KEY$ac_delim
- GTK_CFLAGS!$GTK_CFLAGS$ac_delim
- GTK_LIBS!$GTK_LIBS$ac_delim
-+OWL_LIBS!$OWL_LIBS$ac_delim
-+OWL_CFLAGS!$OWL_CFLAGS$ac_delim
- ASPELL!$ASPELL$ac_delim
- ASPELL_CFLAGS!$ASPELL_CFLAGS$ac_delim
- ASPELL_LIBS!$ASPELL_LIBS$ac_delim
-@@ -32904,8 +32780,6 @@
- BUILD_SPAMASSASSIN_PLUGIN_FALSE!$BUILD_SPAMASSASSIN_PLUGIN_FALSE$ac_delim
- BUILD_BOGOFILTER_PLUGIN_TRUE!$BUILD_BOGOFILTER_PLUGIN_TRUE$ac_delim
- BUILD_BOGOFILTER_PLUGIN_FALSE!$BUILD_BOGOFILTER_PLUGIN_FALSE$ac_delim
--GPGME_CONFIG!$GPGME_CONFIG$ac_delim
--GPGME_CFLAGS!$GPGME_CFLAGS$ac_delim
- _ACEOF
- 
-   if test `sed -n "s/.*$ac_delim\$/X/p" conf$$subs.sed | grep -c X` = 97; then
-@@ -32947,6 +32821,8 @@
- ac_delim='%!_!# '
- for ac_last_try in false false false false false :; do
-   cat >conf$$subs.sed <<_ACEOF
-+GPGME_CONFIG!$GPGME_CONFIG$ac_delim
-+GPGME_CFLAGS!$GPGME_CFLAGS$ac_delim
- GPGME_LIBS!$GPGME_LIBS$ac_delim
- BUILD_PGPCORE_PLUGIN_TRUE!$BUILD_PGPCORE_PLUGIN_TRUE$ac_delim
- BUILD_PGPCORE_PLUGIN_FALSE!$BUILD_PGPCORE_PLUGIN_FALSE$ac_delim
-@@ -32979,7 +32855,7 @@
- LTLIBOBJS!$LTLIBOBJS$ac_delim
- _ACEOF
- 
--  if test `sed -n "s/.*$ac_delim\$/X/p" conf$$subs.sed | grep -c X` = 30; then
-+  if test `sed -n "s/.*$ac_delim\$/X/p" conf$$subs.sed | grep -c X` = 32; then
-     break
-   elif $ac_last_try; then
-     { { echo "$as_me:$LINENO: error: could not make $CONFIG_STATUS" >&5
-Index: claws-mail-2.9.1/src/Makefile.in
-===================================================================
---- claws-mail-2.9.1.orig/src/Makefile.in	2007-04-25 10:18:13.000000000 +0100
-+++ claws-mail-2.9.1/src/Makefile.in	2007-04-25 10:30:23.000000000 +0100
-@@ -45,8 +45,7 @@
- 	$(top_srcdir)/m4/aspell.m4 $(top_srcdir)/m4/check-type.m4 \
- 	$(top_srcdir)/m4/gnupg-check-typedef.m4 \
- 	$(top_srcdir)/m4/gnupg.m4 $(top_srcdir)/m4/gpgme.m4 \
--	$(top_srcdir)/m4/isc-posix.m4 $(top_srcdir)/m4/spamassassin.m4 \
--	$(top_srcdir)/configure.ac
-+	$(top_srcdir)/m4/spamassassin.m4 $(top_srcdir)/configure.ac
- am__configure_deps = $(am__aclocal_m4_deps) $(CONFIGURE_DEPENDENCIES) \
- 	$(ACLOCAL_M4)
- mkinstalldirs = $(SHELL) $(top_srcdir)/config/mkinstalldirs
-@@ -122,7 +121,7 @@
- 	$(am__DEPENDENCIES_2) $(am__DEPENDENCIES_2) \
- 	$(am__DEPENDENCIES_2) $(am__DEPENDENCIES_2) \
- 	$(am__DEPENDENCIES_2) $(am__DEPENDENCIES_2) \
--	$(am__DEPENDENCIES_2)
-+	$(am__DEPENDENCIES_2) $(am__DEPENDENCIES_2)
- claws_mail_LINK = $(LIBTOOL) --tag=CC $(AM_LIBTOOLFLAGS) \
- 	$(LIBTOOLFLAGS) --mode=link $(CCLD) $(AM_CFLAGS) $(CFLAGS) \
- 	$(claws_mail_LDFLAGS) $(LDFLAGS) -o $@
-@@ -272,6 +271,8 @@
- OBJEXT = @OBJEXT@
- OPENSSL_CFLAGS = @OPENSSL_CFLAGS@
- OPENSSL_LIBS = @OPENSSL_LIBS@
-+OWL_CFLAGS = @OWL_CFLAGS@
-+OWL_LIBS = @OWL_LIBS@
- PACKAGE = @PACKAGE@
- PACKAGE_BUGREPORT = @PACKAGE_BUGREPORT@
- PACKAGE_NAME = @PACKAGE_NAME@
-@@ -815,7 +816,8 @@
- 	$(LIBICONV) \
- 	$(STARTUP_NOTIFICATION_LIBS) \
- 	$(LIBETPAN_LIBS) \
--	$(MAEMO_LIBS)
-+	$(MAEMO_LIBS) \
-+	$(OWL_LIBS)
- 
- AM_CPPFLAGS = \
- 	-DG_LOG_DOMAIN=\"Claws-Mail\" \
-@@ -833,7 +835,7 @@
- 	$(LIBETPAN_CPPFLAGS) \
- 	$(STARTUP_NOTIFICATION_CFLAGS) \
- 	$(MAEMO_CFLAGS) \
--	-Wno-unused-function
-+	$(OWL_CFLAGS)
- 
- 
- #no-unused-function is there because of bison stuff
-@@ -1406,6 +1408,7 @@
- install-exec-hook:
- 	@rm -f $(DESTDIR)$(bindir)/sylpheed-claws
- 	@ln -s claws-mail $(DESTDIR)$(bindir)/sylpheed-claws
-+	-Wno-unused-function
- 
- @CYGWIN_TRUE@claws-mail$(EXEEXT): $(claws_mail_OBJECTS) $(claws_mail_DEPENDENCIES) 
- @CYGWIN_TRUE@	@rm -f claws-mail$(EXEEXT)
-Index: claws-mail-2.9.1/autogen.sh
-===================================================================
---- claws-mail-2.9.1.orig/autogen.sh	2007-04-25 10:18:13.000000000 +0100
-+++ claws-mail-2.9.1/autogen.sh	2007-04-25 10:30:23.000000000 +0100
-@@ -74,5 +74,4 @@
-   && libtoolize --force --copy \
-   && autoheader \
-   && automake --add-missing --foreign --copy \
--  && autoconf \
--  && ./configure --enable-maintainer-mode $@
-+  && autoconf
-Index: claws-mail-2.9.1/src/compose.c
-===================================================================
---- claws-mail-2.9.1.orig/src/compose.c	2007-04-25 10:18:13.000000000 +0100
-+++ claws-mail-2.9.1/src/compose.c	2007-04-25 10:30:23.000000000 +0100
-@@ -6192,7 +6192,6 @@
- 	n_menu_entries = sizeof(compose_entries) / sizeof(compose_entries[0]);
- 	menubar = menubar_create(window, compose_entries,
- 				 n_menu_entries, "<Compose>", compose);
--	gtk_box_pack_start(GTK_BOX(vbox), menubar, FALSE, TRUE, 0);
- 
- 	handlebox = gtk_hbox_new(FALSE, 0);
- 	gtk_box_pack_start(GTK_BOX(vbox), handlebox, FALSE, FALSE, 0);
diff --git a/meta-demoapps/recipes-sato/claws-mail/files/streamline-ui.patch b/meta-demoapps/recipes-sato/claws-mail/files/streamline-ui.patch
deleted file mode 100644
index 81a2a6b..0000000
--- a/meta-demoapps/recipes-sato/claws-mail/files/streamline-ui.patch
+++ /dev/null
@@ -1,1010 +0,0 @@
-Upstream-Status: Inappropriate [disable feature]
-
-Index: claws-mail-2.9.1/src/mainwindow.c
-===================================================================
---- claws-mail-2.9.1.orig/src/mainwindow.c	2007-04-25 07:40:10.000000000 +0100
-+++ claws-mail-2.9.1/src/mainwindow.c	2007-04-25 10:26:40.000000000 +0100
-@@ -189,9 +189,6 @@
- static void toggle_statusbar_cb	 (MainWindow	*mainwin,
- 				  guint		 action,
- 				  GtkWidget	*widget);
--static void set_layout_cb	 (MainWindow	*mainwin,
--				  guint		 action,
--				  GtkWidget	*widget);
- 
- static void addressbook_open_cb	(MainWindow	*mainwin,
- 				 guint		 action,
-@@ -538,94 +535,24 @@
- 	{N_("/_Edit/_Search folder..."),	"<shift><control>F", search_cb, 1, NULL},
- 	{N_("/_Edit/_Quick search"),		"slash", mainwindow_quicksearch, 0, NULL},
- 	{N_("/_View"),				NULL, NULL, 0, "<Branch>"},
--	{N_("/_View/Show or hi_de"),		NULL, NULL, 0, "<Branch>"},
--	{N_("/_View/Show or hi_de/_Message view"),
--						"V", toggle_message_cb, 0, "<ToggleItem>"},
--	{N_("/_View/Show or hi_de/_Toolbar"),
--						NULL, NULL, 0, "<Branch>"},
--	{N_("/_View/Show or hi_de/_Toolbar/Text _below icons"),
--						NULL, toggle_toolbar_cb, TOOLBAR_BOTH, "<RadioItem>"},
--	{N_("/_View/Show or hi_de/_Toolbar/Text be_side icons"),
--						NULL, toggle_toolbar_cb, TOOLBAR_BOTH_HORIZ, "/View/Show or hide/Toolbar/Text below icons"},
--	{N_("/_View/Show or hi_de/_Toolbar/_Icons only"),
--						NULL, toggle_toolbar_cb, TOOLBAR_ICON, "/View/Show or hide/Toolbar/Text below icons"},
--	{N_("/_View/Show or hi_de/_Toolbar/_Text only"),
--						NULL, toggle_toolbar_cb, TOOLBAR_TEXT, "/View/Show or hide/Toolbar/Text below icons"},
--	{N_("/_View/Show or hi_de/_Toolbar/_Hide"),
--						NULL, toggle_toolbar_cb, TOOLBAR_NONE, "/View/Show or hide/Toolbar/Text below icons"},
--	{N_("/_View/Show or hi_de/Status _bar"),
--						NULL, toggle_statusbar_cb, 0, "<ToggleItem>"},
- 	{N_("/_View/Set displayed _columns"),	NULL, NULL, 0, "<Branch>"},
- 	{N_("/_View/Set displayed _columns/in _Folder list..."),	NULL, set_folder_display_item_cb, 0, NULL},
- 	{N_("/_View/Set displayed _columns/in _Message list..."),NULL, set_summary_display_item_cb, 0, NULL},
- 
- 	{N_("/_View/---"),			NULL, NULL, 0, "<Separator>"},
--	{N_("/_View/La_yout"),			NULL, NULL, 0, "<Branch>"},
--	{N_("/_View/Layout/_Standard"),		NULL, set_layout_cb, NORMAL_LAYOUT, "<RadioItem>"},
--	{N_("/_View/Layout/_Three columns"),	NULL, set_layout_cb, VERTICAL_LAYOUT, "/View/Layout/Standard"},
--	{N_("/_View/Layout/_Wide message"),	NULL, set_layout_cb, WIDE_LAYOUT, "/View/Layout/Standard"},
--	{N_("/_View/Layout/W_ide message list"),NULL, set_layout_cb, WIDE_MSGLIST_LAYOUT, "/View/Layout/Standard"},
--	{N_("/_View/Layout/S_mall screen"),	NULL, set_layout_cb, SMALL_LAYOUT, "/View/Layout/Standard"},
--	{N_("/_View/---"),			NULL, NULL, 0, "<Separator>"},
- 	{N_("/_View/_Sort"),			NULL, NULL, 0, "<Branch>"},
--	{N_("/_View/_Sort/by _number"),		NULL, sort_summary_cb, SORT_BY_NUMBER, "<RadioItem>"},
--	{N_("/_View/_Sort/by S_ize"),		NULL, sort_summary_cb, SORT_BY_SIZE, "/View/Sort/by number"},
--	{N_("/_View/_Sort/by _Date"),		NULL, sort_summary_cb, SORT_BY_DATE, "/View/Sort/by number"},
--	{N_("/_View/_Sort/by _From"),		NULL, sort_summary_cb, SORT_BY_FROM, "/View/Sort/by number"},
--	{N_("/_View/_Sort/by _To"),		NULL, sort_summary_cb, SORT_BY_TO, "/View/Sort/by number"},
--	{N_("/_View/_Sort/by S_ubject"),	NULL, sort_summary_cb, SORT_BY_SUBJECT, "/View/Sort/by number"},
--	{N_("/_View/_Sort/by _color label"),
--						NULL, sort_summary_cb, SORT_BY_LABEL, "/View/Sort/by number"},
--	{N_("/_View/_Sort/by _mark"),		NULL, sort_summary_cb, SORT_BY_MARK, "/View/Sort/by number"},
--	{N_("/_View/_Sort/by _status"),		NULL, sort_summary_cb, SORT_BY_STATUS, "/View/Sort/by number"},
--	{N_("/_View/_Sort/by a_ttachment"),
--						NULL, sort_summary_cb, SORT_BY_MIME, "/View/Sort/by number"},
--	{N_("/_View/_Sort/by score"),		NULL, sort_summary_cb, SORT_BY_SCORE, "/View/Sort/by number"},
--	{N_("/_View/_Sort/by locked"),		NULL, sort_summary_cb, SORT_BY_LOCKED, "/View/Sort/by number"},
--	{N_("/_View/_Sort/D_on't sort"),	NULL, sort_summary_cb, SORT_BY_NONE, "/View/Sort/by number"},
-+	{N_("/_View/_Sort/by _Date"),		NULL, sort_summary_cb, SORT_BY_DATE, "<RadioItem>"},
-+	{N_("/_View/_Sort/by _From"),		NULL, sort_summary_cb, SORT_BY_FROM, "/View/Sort/by Date"},
-+	{N_("/_View/_Sort/by _To"),		NULL, sort_summary_cb, SORT_BY_TO, "/View/Sort/by Date"},
-+	{N_("/_View/_Sort/by S_ubject"),	NULL, sort_summary_cb, SORT_BY_SUBJECT, "/View/Sort/by Date"},
- 	{N_("/_View/_Sort/---"),		NULL, NULL, 0, "<Separator>"},
- 	{N_("/_View/_Sort/Ascending"),		NULL, sort_summary_type_cb, SORT_ASCENDING, "<RadioItem>"},
- 	{N_("/_View/_Sort/Descending"),		NULL, sort_summary_type_cb, SORT_DESCENDING, "/View/Sort/Ascending"},
--	{N_("/_View/_Sort/---"),		NULL, NULL, 0, "<Separator>"},
--	{N_("/_View/_Sort/_Attract by subject"),
--						NULL, attract_by_subject_cb, 0, NULL},
- 	{N_("/_View/Th_read view"),		"<control>T", thread_cb, 0, "<ToggleItem>"},
- 	{N_("/_View/E_xpand all threads"),	NULL, expand_threads_cb, 0, NULL},
- 	{N_("/_View/Co_llapse all threads"),	NULL, collapse_threads_cb, 0, NULL},
- 	{N_("/_View/_Hide read messages"),	NULL, hide_read_messages, 0, "<ToggleItem>"},
- 
--	{N_("/_View/---"),			NULL, NULL, 0, "<Separator>"},
--	{N_("/_View/_Go to"),			NULL, NULL, 0, "<Branch>"},
--	{N_("/_View/_Go to/_Previous message"),	"P", prev_cb, 0, NULL},
--	{N_("/_View/_Go to/_Next message"),	"N", next_cb, 0, NULL},
--	{N_("/_View/_Go to/---"),		NULL, NULL, 0, "<Separator>"},
--	{N_("/_View/_Go to/P_revious unread message"),
--						"<shift>P", prev_unread_cb, 0, NULL},
--	{N_("/_View/_Go to/N_ext unread message"),
--						"<shift>N", next_unread_cb, 0, NULL},
--	{N_("/_View/_Go to/---"),		NULL, NULL, 0, "<Separator>"},
--	{N_("/_View/_Go to/Previous ne_w message"),	NULL, prev_new_cb, 0, NULL},
--	{N_("/_View/_Go to/Ne_xt new message"),	NULL, next_new_cb, 0, NULL},
--	{N_("/_View/_Go to/---"),		NULL, NULL, 0, "<Separator>"},
--	{N_("/_View/_Go to/Previous _marked message"),
--						NULL, prev_marked_cb, 0, NULL},
--	{N_("/_View/_Go to/Next m_arked message"),
--						NULL, next_marked_cb, 0, NULL},
--	{N_("/_View/_Go to/---"),		NULL, NULL, 0, "<Separator>"},
--	{N_("/_View/_Go to/Previous _labeled message"),
--						NULL, prev_labeled_cb, 0, NULL},
--	{N_("/_View/_Go to/Next la_beled message"),
--						NULL, next_labeled_cb, 0, NULL},
--	{N_("/_View/_Go to/---"),		NULL, NULL, 0, "<Separator>"},
--	{N_("/_View/_Go to/Last read message"),
--						NULL, last_read_cb, 0, NULL},
--	{N_("/_View/_Go to/Parent message"),
--						"<control>Up", parent_cb, 0, NULL},
--	{N_("/_View/_Go to/---"),		NULL, NULL, 0, "<Separator>"},
--	{N_("/_View/_Go to/Next unread _folder"),	"<shift>G", goto_unread_folder_cb, 0, NULL},
--	{N_("/_View/_Go to/_Other folder..."),	"G", goto_folder_cb, 0, NULL},
--	{N_("/_View/---"),			NULL, NULL, 0, "<Separator>"},
--
- #define ENC_SEPARATOR \
- 	{N_("/_View/Character _encoding/---"),		NULL, NULL, 0, "<Separator>"}
- #define ENC_ACTION(action) \
-@@ -742,7 +669,6 @@
- #undef DEC_ACTION
- 
- 	{N_("/_View/---"),			NULL, NULL, 0, "<Separator>"},
--	{N_("/_View/Open in new _window"),	"<control><alt>N", open_msg_cb, 0, NULL},
- 	{N_("/_View/Mess_age source"),		"<control>U", view_source_cb, 0, NULL},
- 	{N_("/_View/All headers"),		"<control>H", show_all_header_cb, 0, "<ToggleItem>"},
- 	{N_("/_View/Quotes"),			NULL, NULL, 0, "<Branch>"},
-@@ -1137,23 +1063,14 @@
- 	gint i;
- 	guint n_menu_entries;
- 
--	static GdkGeometry geometry;
--
- 	debug_print("Creating main window...\n");
- 	mainwin = g_new0(MainWindow, 1);
- 
- 	/* main window */
- 	window = gtkut_window_new(GTK_WINDOW_TOPLEVEL, "mainwindow");
--	gtk_window_set_title(GTK_WINDOW(window), PROG_VERSION);
-+	gtk_window_set_title(GTK_WINDOW(window), _("Mail"));
- 	gtk_window_set_resizable(GTK_WINDOW(window), TRUE);
- 
--	if (!geometry.min_height) {
--		geometry.min_width = 320;
--		geometry.min_height = 200;
--	}
--	gtk_window_set_geometry_hints(GTK_WINDOW(window), NULL, &geometry,
--				      GDK_HINT_MIN_SIZE);
--
- 	g_signal_connect(G_OBJECT(window), "delete_event",
- 			 G_CALLBACK(main_window_close_cb), mainwin);
- 	MANAGE_WINDOW_SIGNALS_CONNECT(window);
-@@ -1184,21 +1101,9 @@
- /*	gtk_widget_show(gtk_item_factory_get_item(ifactory,"/Message/Mailing-List"));
- 	main_create_mailing_list_menu (mainwin, NULL); */
- 
--	menu_set_sensitive(ifactory, "/Help/Manual", manual_available(MANUAL_MANUAL_LOCAL));
--
--	if (prefs_common.toolbar_detachable) {
--		handlebox = gtk_handle_box_new();
--		gtk_widget_show(handlebox);
--		gtk_box_pack_start(GTK_BOX(vbox), handlebox, FALSE, FALSE, 0);
--		g_signal_connect(G_OBJECT(handlebox), "child_attached",
--				 G_CALLBACK(toolbar_child_attached), mainwin);
--		g_signal_connect(G_OBJECT(handlebox), "child_detached",
--				 G_CALLBACK(toolbar_child_detached), mainwin);
--	} else {
--		handlebox = gtk_hbox_new(FALSE, 0);
--		gtk_widget_show(handlebox);
--		gtk_box_pack_start(GTK_BOX(vbox), handlebox, FALSE, FALSE, 0);
--	}
-+	handlebox = gtk_hbox_new(FALSE, 0);
-+	gtk_widget_show(handlebox);
-+	gtk_box_pack_start(GTK_BOX(vbox), handlebox, FALSE, FALSE, 0);
- 	/* link window to mainwin->window to avoid gdk warnings */
- 	mainwin->window       = window;
- 	
-@@ -1405,36 +1310,6 @@
- 		(ifactory, "/View/Character encoding/Auto detect");
- 	gtk_check_menu_item_set_active(GTK_CHECK_MENU_ITEM(menuitem), TRUE);
- 
--	switch (prefs_common.toolbar_style) {
--	case TOOLBAR_NONE:
--		menuitem = gtk_item_factory_get_item
--			(ifactory, "/View/Show or hide/Toolbar/Hide");
--		break;
--	case TOOLBAR_ICON:
--		menuitem = gtk_item_factory_get_item
--			(ifactory, "/View/Show or hide/Toolbar/Icons only");
--		break;
--	case TOOLBAR_TEXT:
--		menuitem = gtk_item_factory_get_item
--			(ifactory, "/View/Show or hide/Toolbar/Text only");
--		break;
--	case TOOLBAR_BOTH:
--		menuitem = gtk_item_factory_get_item
--			(ifactory, "/View/Show or hide/Toolbar/Text below icons");
--		break;
--	case TOOLBAR_BOTH_HORIZ:
--		menuitem = gtk_item_factory_get_item
--			(ifactory,
--			 "/View/Show or hide/Toolbar/Text beside icons");
--	}
--	gtk_check_menu_item_set_active(GTK_CHECK_MENU_ITEM(menuitem), TRUE);
--
--	gtk_widget_hide(mainwin->hbox_stat);
--	menuitem = gtk_item_factory_get_item
--		(ifactory, "/View/Show or hide/Status bar");
--	gtk_check_menu_item_set_active(GTK_CHECK_MENU_ITEM(menuitem),
--				       prefs_common.show_statusbar);
--	
- 	/* set account selection menu */
- 	ac_menu = gtk_item_factory_get_widget
- 		(ifactory, "/Configuration/Change current account");
-@@ -2284,16 +2159,6 @@
- 		{"/View/Expand all threads"        , M_MSG_EXIST},
- 		{"/View/Collapse all threads"      , M_MSG_EXIST},
- 		{"/View/Hide read messages"	   , M_HIDE_READ_MSG},
--		{"/View/Go to/Previous message"        , M_MSG_EXIST},
--		{"/View/Go to/Next message"        , M_MSG_EXIST},
--		{"/View/Go to/Previous unread message" , M_MSG_EXIST},
--		{"/View/Go to/Previous new message"    , M_MSG_EXIST},
--		{"/View/Go to/Previous marked message" , M_MSG_EXIST},
--		{"/View/Go to/Previous labeled message", M_MSG_EXIST},
--		{"/View/Go to/Next labeled message", M_MSG_EXIST},
--		{"/View/Go to/Last read message"   , M_SINGLE_TARGET_EXIST},
--		{"/View/Go to/Parent message"      , M_SINGLE_TARGET_EXIST},
--		{"/View/Open in new window"        , M_SINGLE_TARGET_EXIST},
- 		{"/View/Message source"            , M_SINGLE_TARGET_EXIST},
- 		{"/View/All headers"          	   , M_SINGLE_TARGET_EXIST},
- 		{"/View/Quotes"                    , M_SINGLE_TARGET_EXIST},
-@@ -2379,40 +2244,20 @@
- 	gtk_check_menu_item_set_active(GTK_CHECK_MENU_ITEM(menuitem), active); \
- }
- 
--	SET_CHECK_MENU_ACTIVE("/View/Show or hide/Message view",
--			      messageview_is_visible(mainwin->messageview));
--
- 	summaryview = mainwin->summaryview;
--	menu_path = "/View/Sort/Don't sort";
-+	menu_path = "/View/Sort/by Date";
- 
- 	switch (summaryview->sort_key) {
--	case SORT_BY_NUMBER:
--		menu_path = "/View/Sort/by number"; break;
--	case SORT_BY_SIZE:
--		menu_path = "/View/Sort/by Size"; break;
--	case SORT_BY_DATE:
--		menu_path = "/View/Sort/by Date"; break;
- 	case SORT_BY_FROM:
- 		menu_path = "/View/Sort/by From"; break;
- 	case SORT_BY_TO:
- 		menu_path = "/View/Sort/by To"; break;
- 	case SORT_BY_SUBJECT:
- 		menu_path = "/View/Sort/by Subject"; break;
--	case SORT_BY_LABEL:
--		menu_path = "/View/Sort/by color label"; break;
--	case SORT_BY_MARK:
--		menu_path = "/View/Sort/by mark"; break;
--	case SORT_BY_STATUS:
--		menu_path = "/View/Sort/by status"; break;
--	case SORT_BY_MIME:
--		menu_path = "/View/Sort/by attachment"; break;
--	case SORT_BY_SCORE:
--		menu_path = "/View/Sort/by score"; break;
--	case SORT_BY_LOCKED:
--		menu_path = "/View/Sort/by locked"; break;
- 	case SORT_BY_NONE:
-+	case SORT_BY_DATE:
- 	default:
--		menu_path = "/View/Sort/Don't sort"; break;
-+		menu_path = "/View/Sort/by Date"; break;
- 	}
- 	SET_CHECK_MENU_ACTIVE(menu_path, TRUE);
- 
-@@ -2735,8 +2580,6 @@
- 			gtk_widget_destroy(mainwin->hpaned);
- 	}
- 
--	menu_set_sensitive(ifactory, "/View/Show or hide/Message view", 
--		(layout_mode != WIDE_MSGLIST_LAYOUT && layout_mode != SMALL_LAYOUT));
- 	switch (layout_mode) {
- 	case VERTICAL_LAYOUT:
- 	case NORMAL_LAYOUT:
-@@ -2877,37 +2720,6 @@
- 
- 	prefs_common.layout_mode = layout_mode;
- 
--	menuitem = gtk_item_factory_get_item
--		(ifactory, "/View/Show or hide/Message view");
--	gtk_check_menu_item_set_active
--		(GTK_CHECK_MENU_ITEM(menuitem),
--		 messageview_is_visible(mainwin->messageview));
--
--#define SET_CHECK_MENU_ACTIVE(path, active) \
--{ \
--	menuitem = gtk_item_factory_get_widget(ifactory, path); \
--	gtk_check_menu_item_set_active(GTK_CHECK_MENU_ITEM(menuitem), active); \
--}
--
--	switch (prefs_common.layout_mode) {
--	case NORMAL_LAYOUT:
--		SET_CHECK_MENU_ACTIVE("/View/Layout/Standard", TRUE);
--		break;
--	case VERTICAL_LAYOUT:
--		SET_CHECK_MENU_ACTIVE("/View/Layout/Three columns", TRUE);
--		break;
--	case WIDE_LAYOUT:
--		SET_CHECK_MENU_ACTIVE("/View/Layout/Wide message", TRUE);
--		break;
--	case WIDE_MSGLIST_LAYOUT:
--		SET_CHECK_MENU_ACTIVE("/View/Layout/Wide message list", TRUE);
--		break;
--	case SMALL_LAYOUT:
--		SET_CHECK_MENU_ACTIVE("/View/Layout/Small screen", TRUE);
--		break;
--	}
--#undef SET_CHECK_MENU_ACTIVE
--
- 	if (folderwin) {
- 		g_signal_connect
- 			(G_OBJECT(folderwin), "size_allocate",
-@@ -3116,12 +2928,6 @@
- 		summary_toggle_view(mainwin->summaryview);
- }
- 
--static void toggle_toolbar_cb(MainWindow *mainwin, guint action,
--			      GtkWidget *widget)
--{
--	toolbar_toggle(action, mainwin);
--}
--
- static void main_window_reply_cb(MainWindow *mainwin, guint action,
- 			  GtkWidget *widget)
- {
-Index: claws-mail-2.9.1/src/prefs_common.c
-===================================================================
---- claws-mail-2.9.1.orig/src/prefs_common.c	2007-04-25 07:40:10.000000000 +0100
-+++ claws-mail-2.9.1/src/prefs_common.c	2007-04-25 07:42:17.000000000 +0100
-@@ -262,7 +262,7 @@
- 	{"default_reply_list", "TRUE", &prefs_common.default_reply_list, P_BOOL,
- 	 NULL, NULL, NULL},
- 
--#ifndef MAEMO
-+#if 0
- 	{"show_ruler", "TRUE", &prefs_common.show_ruler, P_BOOL,
- 	 NULL, NULL, NULL},
- #else
-@@ -300,7 +300,7 @@
- 	  &prefs_common.normalfont_gtk1,	P_STRING, NULL, NULL, NULL},
- 
- 	/* new fonts */
--#ifndef MAEMO
-+#if 0
- 	{"widget_font_gtk2",	NULL,
- 	  &SPECIFIC_PREFS.widgetfont,		P_STRING, NULL, NULL, NULL},
- 	{"message_font_gtk2",	"Monospace 9",
-@@ -416,7 +416,7 @@
- 
- 	{"enable_thread", "TRUE", &prefs_common.enable_thread, P_BOOL,
- 	 NULL, NULL, NULL},
--#ifndef MAEMO
-+#if 0
- 	{"toolbar_style", "3", &prefs_common.toolbar_style, P_ENUM,
- 	 NULL, NULL, NULL},
- #else
-@@ -544,7 +544,7 @@
- 	{"folder_col_pos_total", "3",
- 	 &prefs_common.folder_col_pos[F_COL_TOTAL], P_INT, NULL, NULL, NULL},
- 
--#ifndef MAEMO
-+#if 0
- 	{"folder_col_size_folder", "120",
- 	 &prefs_common.folder_col_size[F_COL_FOLDER], P_INT, NULL, NULL, NULL},
- 	{"folder_col_size_new", "32",
-@@ -702,7 +702,7 @@
- 	 &SPECIFIC_PREFS.mime_open_cmd,     P_STRING, NULL, NULL, NULL},
- 
- 	/* Interface */
--#ifndef MAEMO
-+#if 0
- 	{"layout_mode", "0", &prefs_common.layout_mode, P_INT,
- 	 NULL, NULL, NULL},
- #else
-Index: claws-mail-2.9.1/src/toolbar.c
-===================================================================
---- claws-mail-2.9.1.orig/src/toolbar.c	2007-04-25 07:40:10.000000000 +0100
-+++ claws-mail-2.9.1/src/toolbar.c	2007-04-25 07:42:17.000000000 +0100
-@@ -841,26 +841,17 @@
- 		gtk_widget_hide(handlebox_wid);
- 		break;
- 	case TOOLBAR_ICON:
--		gtk_toolbar_set_style(GTK_TOOLBAR(toolbar_wid),
--				      GTK_TOOLBAR_ICONS);
--		break;
- 	case TOOLBAR_TEXT:
--		gtk_toolbar_set_style(GTK_TOOLBAR(toolbar_wid),
--				      GTK_TOOLBAR_TEXT);
--		break;
- 	case TOOLBAR_BOTH:
--		gtk_toolbar_set_style(GTK_TOOLBAR(toolbar_wid),
--				      GTK_TOOLBAR_BOTH);
--		break;
- 	case TOOLBAR_BOTH_HORIZ:
- 		gtk_toolbar_set_style(GTK_TOOLBAR(toolbar_wid),
--				      GTK_TOOLBAR_BOTH_HORIZ);
-+				      GTK_TOOLBAR_ICONS);
- 		break;
- 	default:
- 		return;
- 	}
- 
--	prefs_common.toolbar_style = (ToolbarStyle)action;
-+	prefs_common.toolbar_style = (ToolbarStyle)TOOLBAR_ICON;
- 	gtk_widget_set_size_request(handlebox_wid, 1, -1);
- 	
- 	if (prefs_common.toolbar_style != TOOLBAR_NONE) {
-@@ -1594,7 +1585,7 @@
- 	gtk_container_add(GTK_CONTAINER(container), toolbar);
- 	gtk_container_set_border_width(GTK_CONTAINER(container), 2);
- 	gtk_toolbar_set_orientation(GTK_TOOLBAR(toolbar), GTK_ORIENTATION_HORIZONTAL);
--	gtk_toolbar_set_style(GTK_TOOLBAR(toolbar), GTK_TOOLBAR_BOTH);
-+	gtk_toolbar_set_style(GTK_TOOLBAR(toolbar), GTK_TOOLBAR_ICONS);
- 	
- 	for (cur = toolbar_list; cur != NULL; cur = cur->next) {
- 
-Index: claws-mail-2.9.1/src/gtk/prefswindow.c
-===================================================================
---- claws-mail-2.9.1.orig/src/gtk/prefswindow.c	2007-04-25 07:40:10.000000000 +0100
-+++ claws-mail-2.9.1/src/gtk/prefswindow.c	2007-04-25 10:30:15.000000000 +0100
-@@ -343,6 +343,10 @@
- 	gint x = gdk_screen_width();
- 	gint y = gdk_screen_height();
- 	static GdkGeometry geometry;
-+	gint col_count = g_slist_length (prefs_pages);
-+
-+	if (col_count > 1)
-+	    col_count = 2;
- 
- 	prefswindow = g_new0(PrefsWindow, 1);
- 
-@@ -360,39 +364,52 @@
- 	gtk_window_set_resizable (GTK_WINDOW(prefswindow->window), TRUE);
- 	gtk_container_set_border_width(GTK_CONTAINER(prefswindow->window), 4);
- 
--	prefswindow->table1 = gtk_table_new(2, 2, FALSE);
-+	prefswindow->table1 = gtk_table_new(col_count, col_count, FALSE);
- 	gtk_widget_show(prefswindow->table1);
- 	gtk_container_add(GTK_CONTAINER(prefswindow->window), prefswindow->table1);
- 
--	prefswindow->scrolledwindow1 = gtk_scrolled_window_new(NULL, NULL);
--	gtk_widget_show(prefswindow->scrolledwindow1);
--	gtk_scrolled_window_set_policy(GTK_SCROLLED_WINDOW(prefswindow->scrolledwindow1), GTK_POLICY_NEVER, GTK_POLICY_AUTOMATIC);
--	gtk_table_attach(GTK_TABLE(prefswindow->table1), prefswindow->scrolledwindow1, 0, 1, 0, 1, GTK_FILL, GTK_FILL | GTK_EXPAND, 2, 2);
--
--	prefswindow->tree_view = prefswindow_tree_view_create(prefswindow);
--	gtk_widget_show(prefswindow->tree_view);
--	gtk_container_add(GTK_CONTAINER(prefswindow->scrolledwindow1), 
--			  prefswindow->tree_view);
--
--	prefswindow->frame = gtk_frame_new(NULL);
--	gtk_widget_show(prefswindow->frame);
--	gtk_frame_set_shadow_type(GTK_FRAME(prefswindow->frame), GTK_SHADOW_IN);
--	gtk_table_attach(GTK_TABLE(prefswindow->table1), prefswindow->frame, 1, 2, 0, 1, GTK_FILL | GTK_EXPAND, GTK_FILL | GTK_EXPAND, 2, 2);
--
--	prefswindow->table2 = gtk_table_new(1, 2, FALSE);
--	gtk_widget_show(prefswindow->table2);
--	gtk_container_add(GTK_CONTAINER(prefswindow->frame), prefswindow->table2);
--
--	prefswindow->labelframe = gtk_frame_new(NULL);
--	gtk_widget_show(prefswindow->labelframe);
--	gtk_frame_set_shadow_type(GTK_FRAME(prefswindow->labelframe), GTK_SHADOW_OUT);
--	gtk_table_attach(GTK_TABLE(prefswindow->table2), prefswindow->labelframe, 0, 1, 0, 1, GTK_FILL | GTK_EXPAND, GTK_FILL, 1, 1);
--
--	prefswindow->pagelabel = gtk_label_new("");
--	gtk_widget_show(prefswindow->pagelabel);
--	gtk_label_set_justify(GTK_LABEL(prefswindow->pagelabel), GTK_JUSTIFY_LEFT);
--	gtk_misc_set_alignment(GTK_MISC(prefswindow->pagelabel), 0, 0.0);
--	gtk_container_add(GTK_CONTAINER(prefswindow->labelframe), prefswindow->pagelabel);
-+	if (col_count > 1)
-+	{
-+	    prefswindow->scrolledwindow1 = gtk_scrolled_window_new(NULL, NULL);
-+	    gtk_widget_show(prefswindow->scrolledwindow1);
-+	    gtk_scrolled_window_set_policy(GTK_SCROLLED_WINDOW(prefswindow->scrolledwindow1), GTK_POLICY_NEVER, GTK_POLICY_AUTOMATIC);
-+	    gtk_table_attach(GTK_TABLE(prefswindow->table1), prefswindow->scrolledwindow1, 0, 1, 0, 1, GTK_FILL, GTK_FILL | GTK_EXPAND, 2, 2);
-+
-+	    prefswindow->tree_view = prefswindow_tree_view_create(prefswindow);
-+	    gtk_widget_show(prefswindow->tree_view);
-+	    gtk_container_add(GTK_CONTAINER(prefswindow->scrolledwindow1),
-+			      prefswindow->tree_view);
-+
-+	    prefswindow->frame = gtk_frame_new(NULL);
-+	    gtk_widget_show(prefswindow->frame);
-+	    gtk_frame_set_shadow_type(GTK_FRAME(prefswindow->frame), GTK_SHADOW_IN);
-+	    gtk_table_attach(GTK_TABLE(prefswindow->table1), prefswindow->frame, col_count - 1, col_count, 0, 1, GTK_FILL | GTK_EXPAND, GTK_FILL | GTK_EXPAND, 2, 2);
-+
-+	    prefswindow->table2 = gtk_table_new(1, 2, FALSE);
-+	    gtk_widget_show(prefswindow->table2);
-+	    gtk_container_add(GTK_CONTAINER(prefswindow->frame), prefswindow->table2);
-+	}
-+	else
-+	{
-+	    prefswindow->table2 = gtk_table_new(1, 2, FALSE);
-+	    gtk_widget_show(prefswindow->table2);
-+	    gtk_table_attach(GTK_TABLE(prefswindow->table1), prefswindow->table2, 0, 1, 0, 1, GTK_FILL | GTK_EXPAND, GTK_FILL | GTK_EXPAND, 2, 2);
-+	}
-+
-+
-+	if (col_count > 1)
-+	{
-+	    prefswindow->labelframe = gtk_frame_new(NULL);
-+	    gtk_widget_show(prefswindow->labelframe);
-+	    gtk_frame_set_shadow_type(GTK_FRAME(prefswindow->labelframe), GTK_SHADOW_OUT);
-+	    gtk_table_attach(GTK_TABLE(prefswindow->table2), prefswindow->labelframe, 0, 1, 0, 1, GTK_FILL | GTK_EXPAND, GTK_FILL, 1, 1);
-+
-+	    prefswindow->pagelabel = gtk_label_new("");
-+	    gtk_widget_show(prefswindow->pagelabel);
-+	    gtk_label_set_justify(GTK_LABEL(prefswindow->pagelabel), GTK_JUSTIFY_LEFT);
-+	    gtk_misc_set_alignment(GTK_MISC(prefswindow->pagelabel), 0, 0.0);
-+	    gtk_container_add(GTK_CONTAINER(prefswindow->labelframe), prefswindow->pagelabel);
-+	}
- 
- 	prefswindow->scrolledwindow2 = gtk_scrolled_window_new(NULL, NULL);
- 	gtk_widget_show(prefswindow->scrolledwindow2);
-@@ -411,9 +428,38 @@
- 	gtk_widget_show(prefswindow->empty_page);
- 	gtk_container_add(GTK_CONTAINER(prefswindow->notebook), prefswindow->empty_page);
- 
--	prefswindow_build_tree(prefswindow->tree_view, prefs_pages);		
-+	if (col_count > 1)
-+	{
-+	    prefswindow_build_tree(prefswindow->tree_view, prefs_pages);
-+
-+	    gtk_widget_grab_focus(prefswindow->tree_view);
-+	}
-+	else
-+	{
-+	    PrefsPage * page = prefs_pages->data;
-+	    gint pagenum;
-+	    GtkAdjustment *adj;
-+
-+	    if (!page->page_open)
-+	    {
-+		page->create_widget(page,
-+				    GTK_WINDOW(prefswindow->window),
-+				    prefswindow->data);
-+		gtk_container_add(GTK_CONTAINER(prefswindow->notebook),
-+				  page->widget);
-+		page->page_open = TRUE;
-+	    }
-+
-+	    pagenum = gtk_notebook_page_num(GTK_NOTEBOOK(prefswindow->notebook),
-+					page->widget);
-+	    gtk_notebook_set_current_page(GTK_NOTEBOOK(prefswindow->notebook),
-+					  pagenum);
- 
--	gtk_widget_grab_focus(prefswindow->tree_view);
-+	    adj = gtk_scrolled_window_get_vadjustment(
-+			GTK_SCROLLED_WINDOW(prefswindow->scrolledwindow2));
-+	    gtk_adjustment_set_value(adj, 0);
-+
-+	}
- 
- 	gtkut_stock_button_set_create(&prefswindow->confirm_area,
- 				      &prefswindow->apply_btn,	GTK_STOCK_APPLY,
-@@ -440,28 +486,6 @@
- 			   G_CALLBACK(prefswindow_key_pressed), &(prefswindow->window));
- #endif
- 
--	/* connect to callback only if we hhave non-NULL pointers to store size to */
--	if (prefswindow->save_width && prefswindow->save_height) {
--		g_signal_connect(G_OBJECT(prefswindow->window), "size_allocate",
--				 G_CALLBACK(prefs_size_allocate_cb), prefswindow);
--	}
--
--	if (!geometry.min_height) {
--		
--		if (x < 800 && y < 600) {
--			geometry.min_width = 600;
--			geometry.min_height = 440;
--		} else {
--			geometry.min_width = 700;
--			geometry.min_height = 550;
--		}
--	}
--	gtk_window_set_geometry_hints(GTK_WINDOW(prefswindow->window), NULL, &geometry,
--				      GDK_HINT_MIN_SIZE);
--	if (prefswindow->save_width && prefswindow->save_height) {
--		gtk_widget_set_size_request(prefswindow->window, *(prefswindow->save_width),
--					    *(prefswindow->save_height));
--	}
- 
- 	gtk_widget_show(prefswindow->window);
- #ifdef MAEMO
-Index: claws-mail-2.9.1/src/compose.c
-===================================================================
---- claws-mail-2.9.1.orig/src/compose.c	2007-04-25 07:40:10.000000000 +0100
-+++ claws-mail-2.9.1/src/compose.c	2007-04-25 10:18:13.000000000 +0100
-@@ -352,9 +352,6 @@
- 
- /* callback functions */
- 
--static gboolean compose_edit_size_alloc (GtkEditable	*widget,
--					 GtkAllocation	*allocation,
--					 GtkSHRuler	*shruler);
- static void account_activated		(GtkComboBox *optmenu,
- 					 gpointer	 data);
- static void attach_selected		(GtkTreeView	*tree_view, 
-@@ -439,9 +436,6 @@
- 					 guint		 action,
- 					 GtkWidget	*widget);
- 
--static void compose_toggle_ruler_cb	(gpointer	 data,
--					 guint		 action,
--					 GtkWidget	*widget);
- static void compose_toggle_sign_cb	(gpointer	 data,
- 					 guint		 action,
- 					 GtkWidget	*widget);
-@@ -788,7 +782,6 @@
- 	 ENC_ACTION(C_WINDOWS_874)},
- 
- 	{N_("/_Tools"),			NULL, NULL, 0, "<Branch>"},
--	{N_("/_Tools/Show _ruler"),	NULL, compose_toggle_ruler_cb, 0, "<ToggleItem>"},
- 	{N_("/_Tools/_Address book"),	"<shift><control>A", compose_address_cb , 0, NULL},
- 	{N_("/_Tools/_Template"),	NULL, NULL, 0, "<Branch>"},
- 	{N_("/_Tools/Actio_ns"),	NULL, NULL, 0, "<Branch>"},
-@@ -2067,7 +2060,6 @@
- 	menu_set_sensitive(ifactory, "/Message/Insert signature", FALSE);
- 	menu_set_sensitive(ifactory, "/Edit", FALSE);
- 	menu_set_sensitive(ifactory, "/Options", FALSE);
--	menu_set_sensitive(ifactory, "/Tools/Show ruler", FALSE);
- 	menu_set_sensitive(ifactory, "/Tools/Actions", FALSE);
- 	
- 	if (compose->toolbar->draft_btn)
-@@ -5684,7 +5676,7 @@
- 	g_signal_connect(G_OBJECT(GTK_COMBO(combo)->entry), "grab_focus",
- 			 G_CALLBACK(compose_grab_focus_cb), compose);
- 	gtk_widget_show(combo);
--	gtk_table_attach(GTK_TABLE(compose->header_table), combo, 0, 1, compose->header_nextrow, compose->header_nextrow+1, GTK_SHRINK, GTK_FILL, 0, 0);
-+	gtk_table_attach(GTK_TABLE(compose->header_table), combo, 0, 1, compose->header_nextrow, compose->header_nextrow+1, GTK_FILL, GTK_FILL, 0, 0);
- 	if (compose->header_last) {	
- 		const gchar *last_header_entry = gtk_entry_get_text(GTK_ENTRY(GTK_COMBO(compose->header_last->combo)->entry));
- 		string = headers;
-@@ -5778,7 +5770,7 @@
- 
- static GtkWidget *compose_create_header(Compose *compose) 
- {
--	GtkWidget *from_optmenu_hbox;
-+	GtkWidget *from_optmenu;
- 	GtkWidget *header_scrolledwin;
- 	GtkWidget *header_table;
- 
-@@ -5788,18 +5780,20 @@
- 	header_scrolledwin = gtk_scrolled_window_new(NULL, NULL);
- 	gtk_widget_show(header_scrolledwin);
- 	gtk_scrolled_window_set_policy(GTK_SCROLLED_WINDOW(header_scrolledwin), GTK_POLICY_NEVER, GTK_POLICY_AUTOMATIC);
--
- 	header_table = gtk_table_new(2, 2, FALSE);
-+	gtk_table_set_col_spacings (GTK_TABLE (header_table), BORDER_WIDTH);
- 	gtk_widget_show(header_table);
- 	gtk_container_set_border_width(GTK_CONTAINER(header_table), BORDER_WIDTH);
- 	gtk_scrolled_window_add_with_viewport(GTK_SCROLLED_WINDOW(header_scrolledwin), header_table);
--	gtk_viewport_set_shadow_type(GTK_VIEWPORT(GTK_BIN(header_scrolledwin)->child), GTK_SHADOW_ETCHED_IN);
-+	gtk_viewport_set_shadow_type(GTK_VIEWPORT(GTK_BIN(header_scrolledwin)->child), GTK_SHADOW_NONE);
- 	count = 0;
- 
- 	/* option menu for selecting accounts */
--	from_optmenu_hbox = compose_account_option_menu_create(compose);
--	gtk_table_attach(GTK_TABLE(header_table), from_optmenu_hbox,
--				  0, 2, count, count + 1, GTK_EXPAND | GTK_FILL, GTK_SHRINK, 0, 0);
-+	from_optmenu = compose_account_option_menu_create(compose);
-+	gtk_table_attach(GTK_TABLE(header_table), from_optmenu,
-+				  0, 1, count, count + 1, GTK_FILL, GTK_FILL, 0, 0);
-+	gtk_table_attach(GTK_TABLE(header_table), compose->from_name,
-+				  1, 2, count, count + 1, GTK_EXPAND | GTK_FILL, GTK_FILL, 0, 0);
- 	count++;
- 
- 	compose->header_table = header_table;
-@@ -6140,15 +6134,12 @@
- 	GtkWidget *vbox2;
- 
- 	GtkWidget *label;
--	GtkWidget *subject_hbox;
--	GtkWidget *subject_frame;
-+	GtkWidget *edit_frame;
- 	GtkWidget *subject_entry;
- 	GtkWidget *subject;
- 	GtkWidget *paned;
- 
- 	GtkWidget *edit_vbox;
--	GtkWidget *ruler_hbox;
--	GtkWidget *ruler;
- 	GtkWidget *scrolledwin;
- 	GtkWidget *text;
- 	GtkTextBuffer *buffer;
-@@ -6169,8 +6160,6 @@
-         GtkAspell * gtkaspell = NULL;
- #endif
- 
--	static GdkGeometry geometry;
--
- 	g_return_val_if_fail(account != NULL, NULL);
- 
- 	debug_print("Creating compose window...\n");
-@@ -6190,28 +6179,6 @@
- 
- 	window = gtkut_window_new(GTK_WINDOW_TOPLEVEL, "compose");
- 
--	gtk_window_set_resizable(GTK_WINDOW(window), TRUE);
--	gtk_widget_set_size_request(window, -1, prefs_common.compose_height);
--
--	if (!geometry.max_width) {
--		geometry.max_width = gdk_screen_width();
--		geometry.max_height = gdk_screen_height();
--	}
--
--	gtk_window_set_geometry_hints(GTK_WINDOW(window), NULL,
--				      &geometry, GDK_HINT_MAX_SIZE);
--	if (!geometry.min_width) {
--		geometry.min_width = 600;
--		geometry.min_height = 480;
--	}
--	gtk_window_set_geometry_hints(GTK_WINDOW(window), NULL,
--				      &geometry, GDK_HINT_MIN_SIZE);
--
--#ifndef MAEMO	
--	if (compose_force_window_origin)
--		gtk_widget_set_uposition(window, prefs_common.compose_x, 
--				 prefs_common.compose_y);
--#endif
- 	g_signal_connect(G_OBJECT(window), "delete_event",
- 			 G_CALLBACK(compose_delete_cb), compose);
- 	MANAGE_WINDOW_SIGNALS_CONNECT(window);
-@@ -6227,11 +6194,7 @@
- 				 n_menu_entries, "<Compose>", compose);
- 	gtk_box_pack_start(GTK_BOX(vbox), menubar, FALSE, TRUE, 0);
- 
--	if (prefs_common.toolbar_detachable) {
--		handlebox = gtk_handle_box_new();
--	} else {
--		handlebox = gtk_hbox_new(FALSE, 0);
--	}
-+	handlebox = gtk_hbox_new(FALSE, 0);
- 	gtk_box_pack_start(GTK_BOX(vbox), handlebox, FALSE, FALSE, 0);
- 
- 	gtk_widget_realize(handlebox);
-@@ -6244,7 +6207,6 @@
- 	
- 	/* Notebook */
- 	notebook = gtk_notebook_new();
--	gtk_widget_set_size_request(notebook, -1, 130);
- 	gtk_widget_show(notebook);
- 
- 	/* header labels and entries */
-@@ -6258,18 +6220,10 @@
- 	/* Others Tab */
- 	gtk_notebook_append_page(GTK_NOTEBOOK(notebook),
- 			compose_create_others(compose),
--			gtk_label_new_with_mnemonic(_("Othe_rs")));
-+			gtk_label_new_with_mnemonic(_("Othe_r")));
- 
- 	/* Subject */
--	subject_hbox = gtk_hbox_new(FALSE, 0);
--	gtk_widget_show(subject_hbox);
--
--	subject_frame = gtk_frame_new(NULL);
--	gtk_frame_set_shadow_type(GTK_FRAME(subject_frame), GTK_SHADOW_NONE);
--	gtk_box_pack_start(GTK_BOX(subject_hbox), subject_frame, TRUE, TRUE, 0);
--	gtk_widget_show(subject_frame);
--
--	subject = gtk_hbox_new(FALSE, HSPACING_NARROW);
-+	subject = gtk_hbox_new(FALSE, BORDER_WIDTH);
- 	gtk_container_set_border_width(GTK_CONTAINER(subject), 0);
- 	gtk_widget_show(subject);
- 
-@@ -6283,20 +6237,16 @@
- 			 G_CALLBACK(compose_grab_focus_cb), compose);
- 	gtk_widget_show(subject_entry);
- 	compose->subject_entry = subject_entry;
--	gtk_container_add(GTK_CONTAINER(subject_frame), subject);
- 	
--	edit_vbox = gtk_vbox_new(FALSE, 0);
-+	edit_vbox = gtk_vbox_new(FALSE, BORDER_WIDTH);
-+	gtk_container_set_border_width(GTK_CONTAINER(edit_vbox), BORDER_WIDTH);
- 
--	gtk_box_pack_start(GTK_BOX(edit_vbox), subject_hbox, FALSE, FALSE, 0);
-+	gtk_box_pack_start(GTK_BOX(edit_vbox), subject, FALSE, FALSE, 0);
- 
--	/* ruler */
--	ruler_hbox = gtk_hbox_new(FALSE, 0);
--	gtk_box_pack_start(GTK_BOX(edit_vbox), ruler_hbox, FALSE, FALSE, 0);
--
--	ruler = gtk_shruler_new();
--	gtk_ruler_set_range(GTK_RULER(ruler), 0.0, 100.0, 1.0, 100.0);
--	gtk_box_pack_start(GTK_BOX(ruler_hbox), ruler, TRUE, TRUE,
--			   BORDER_WIDTH);
-+	edit_frame = gtk_frame_new(NULL);
-+	gtk_frame_set_shadow_type(GTK_FRAME(edit_frame), GTK_SHADOW_IN);
-+	gtk_widget_show(edit_frame);
-+	gtk_container_add(GTK_CONTAINER(edit_frame), edit_vbox);
- 
- 	/* text widget */
- 	scrolledwin = gtk_scrolled_window_new(NULL, NULL);
-@@ -6317,9 +6267,6 @@
- 	
- 	gtk_container_add(GTK_CONTAINER(scrolledwin), text);
- 
--	g_signal_connect_after(G_OBJECT(text), "size_allocate",
--			       G_CALLBACK(compose_edit_size_alloc),
--			       ruler);
- 	g_signal_connect(G_OBJECT(buffer), "changed",
- 			 G_CALLBACK(compose_changed_cb), compose);
- 	g_signal_connect(G_OBJECT(text), "grab_focus",
-@@ -6363,7 +6310,7 @@
- 		gtk_widget_set_size_request(edit_vbox, -1, mode == COMPOSE_NEW ? 250 : 230);
- #endif
- 	gtk_paned_add1(GTK_PANED(paned), notebook);
--	gtk_paned_add2(GTK_PANED(paned), edit_vbox);
-+	gtk_paned_add2(GTK_PANED(paned), edit_frame);
- 	gtk_widget_show_all(paned);
- 
- 
-@@ -6408,8 +6355,6 @@
- 
- 	compose->notebook      = notebook;
- 	compose->edit_vbox     = edit_vbox;
--	compose->ruler_hbox    = ruler_hbox;
--	compose->ruler         = ruler;
- 	compose->scrolledwin   = scrolledwin;
- 	compose->text	       = text;
- 
-@@ -6531,13 +6476,6 @@
- 
- 	compose_list = g_list_append(compose_list, compose);
- 
--	if (!prefs_common.show_ruler)
--		gtk_widget_hide(ruler_hbox);
--		
--	menuitem = gtk_item_factory_get_item(ifactory, "/Tools/Show ruler");
--	gtk_check_menu_item_set_active(GTK_CHECK_MENU_ITEM(menuitem),
--				       prefs_common.show_ruler);
--
- 	/* Priority */
- 	compose->priority = PRIORITY_NORMAL;
- 	compose_update_priority_menu_item(compose);
-@@ -6568,7 +6506,6 @@
- static GtkWidget *compose_account_option_menu_create(Compose *compose)
- {
- 	GList *accounts;
--	GtkWidget *hbox;
- 	GtkWidget *optmenu;
- 	GtkWidget *optmenubox;
- 	GtkListStore *menu;
-@@ -6584,7 +6521,6 @@
- 	optmenu = gtkut_sc_combobox_create(optmenubox, FALSE);
- 	menu = GTK_LIST_STORE(gtk_combo_box_get_model(GTK_COMBO_BOX(optmenu)));
- 
--	hbox = gtk_hbox_new(FALSE, 6);
- 	from_name = gtk_entry_new();
- 	
- 	g_signal_connect_after(G_OBJECT(from_name), "grab_focus",
-@@ -6623,9 +6559,6 @@
- 			G_CALLBACK(account_activated),
- 			compose);
- 
--	gtk_box_pack_start(GTK_BOX(hbox), optmenubox, FALSE, FALSE, 0);
--	gtk_box_pack_start(GTK_BOX(hbox), from_name, TRUE, TRUE, 0);
--	
- 	gtk_tooltips_set_tip(compose->tooltips, optmenubox,
- 		_("Account to use for this email"), NULL);
- 	gtk_tooltips_set_tip(compose->tooltips, from_name,
-@@ -6633,7 +6566,7 @@
- 
- 	compose->from_name = from_name;
- 	
--	return hbox;
-+	return optmenubox;
- }
- 
- static void compose_set_priority_cb(gpointer data,
-@@ -7851,32 +7784,6 @@
- 
- /* callback functions */
- 
--/* compose_edit_size_alloc() - called when resized. don't know whether Gtk
-- * includes "non-client" (windows-izm) in calculation, so this calculation
-- * may not be accurate.
-- */
--static gboolean compose_edit_size_alloc(GtkEditable *widget,
--					GtkAllocation *allocation,
--					GtkSHRuler *shruler)
--{
--	if (prefs_common.show_ruler) {
--		gint char_width = 0, char_height = 0;
--		gint line_width_in_chars;
--
--		gtkut_get_font_size(GTK_WIDGET(widget),
--				    &char_width, &char_height);
--		line_width_in_chars =
--			(allocation->width - allocation->x) / char_width;
--
--		/* got the maximum */
--		gtk_ruler_set_range(GTK_RULER(shruler),
--				    0.0, line_width_in_chars, 0,
--				    /*line_width_in_chars*/ char_width);
--	}
--
--	return TRUE;
--}
--
- static void account_activated(GtkComboBox *optmenu, gpointer data)
- {
- 	Compose *compose = (Compose *)data;
-@@ -9040,21 +8947,6 @@
- 	compose_update_privacy_system_menu_item(compose, warn);
- }
- 
--static void compose_toggle_ruler_cb(gpointer data, guint action,
--				    GtkWidget *widget)
--{
--	Compose *compose = (Compose *)data;
--
--	if (GTK_CHECK_MENU_ITEM(widget)->active) {
--		gtk_widget_show(compose->ruler_hbox);
--		prefs_common.show_ruler = TRUE;
--	} else {
--		gtk_widget_hide(compose->ruler_hbox);
--		gtk_widget_queue_resize(compose->edit_vbox);
--		prefs_common.show_ruler = FALSE;
--	}
--}
--
- static void compose_attach_drag_received_cb (GtkWidget		*widget,
- 					     GdkDragContext	*context,
- 					     gint		 x,
-Index: claws-mail-2.9.1/src/folderview.c
-===================================================================
---- claws-mail-2.9.1.orig/src/folderview.c	2007-04-03 19:10:25.000000000 +0100
-+++ claws-mail-2.9.1/src/folderview.c	2007-04-25 10:28:00.000000000 +0100
-@@ -73,6 +73,11 @@
- #define COL_FOLDER_WIDTH	150
- #define COL_NUM_WIDTH		32
- 
-+/* added dummy column to stop the last column from
-+ * resizing insanely in small screen view
-+ */
-+#define _N_FOLDER_COLS (N_FOLDER_COLS + 1)
-+
- static GList *folderview_list = NULL;
- 
- static GtkStyle *normal_style;
-@@ -448,7 +453,7 @@
- 	gint *col_pos;
- 	FolderColumnState *col_state;
- 	FolderColumnType type;
--	gchar *titles[N_FOLDER_COLS];
-+	gchar *titles[_N_FOLDER_COLS];
- 	gint i;
- 	GtkWidget *scrolledwin = folderview->scrolledwin;
- 
-@@ -471,8 +476,9 @@
- 	titles[col_pos[F_COL_UNREAD]] = _("Unread");
- 	/* TRANSLATORS: This in Number sign in American style */
- 	titles[col_pos[F_COL_TOTAL]]  = _("#");
-+	titles[F_COL_DUMMY] = "";
- 
--	ctree = gtk_sctree_new_with_titles(N_FOLDER_COLS, col_pos[F_COL_FOLDER],
-+	ctree = gtk_sctree_new_with_titles(_N_FOLDER_COLS, col_pos[F_COL_FOLDER],
- 					   titles);
- 
- 	gtk_clist_set_selection_mode(GTK_CLIST(ctree), GTK_SELECTION_BROWSE);
-@@ -510,6 +516,9 @@
- 			(GTK_CLIST(ctree), i, col_state[i].visible);
- 	}
- 
-+	GTK_WIDGET_UNSET_FLAGS(GTK_CLIST(ctree)->column[i].button,
-+			       GTK_CAN_FOCUS);
-+
- 	g_signal_connect(G_OBJECT(ctree), "key_press_event",
- 			 G_CALLBACK(folderview_key_pressed),
- 			 folderview);
-@@ -605,9 +614,6 @@
- 		(GTK_SCROLLED_WINDOW(scrolledwin),
- 		 GTK_POLICY_AUTOMATIC,
- 		 prefs_common.folderview_vscrollbar_policy);
--	gtk_widget_set_size_request(scrolledwin,
--			     prefs_common.folderview_width,
--			     prefs_common.folderview_height);
- 
- 	folderview->scrolledwin  = scrolledwin;
- 	ctree = folderview_ctree_create(folderview);
-@@ -2268,7 +2274,7 @@
- static void folderview_create_folder_node(FolderView *folderview, FolderItem *item)
- {
- 	GtkCTree *ctree = GTK_CTREE(folderview->ctree);
--	gchar *text[N_FOLDER_COLS] = {NULL, "0", "0", "0"};
-+	gchar *text[_N_FOLDER_COLS] = {NULL, "0", "0", "0", ""};
- 	GtkCTreeNode *node, *parent_node;
- 	gint *col_pos = folderview->col_pos;
- 	FolderItemUpdateData hookdata;
-Index: claws-mail-2.9.1/src/folderview.h
-===================================================================
---- claws-mail-2.9.1.orig/src/folderview.h	2007-03-22 17:22:52.000000000 +0000
-+++ claws-mail-2.9.1/src/folderview.h	2007-04-25 10:16:55.000000000 +0100
-@@ -37,7 +37,8 @@
- 	F_COL_FOLDER,
- 	F_COL_NEW,
- 	F_COL_UNREAD,
--	F_COL_TOTAL
-+	F_COL_TOTAL,
-+	F_COL_DUMMY
- } FolderColumnType;
- 
- #define N_FOLDER_COLS	4
diff --git a/meta-demoapps/recipes-sato/clipboard-manager/clipboard-manager_0.6.4.bb b/meta-demoapps/recipes-sato/clipboard-manager/clipboard-manager_0.6.4.bb
deleted file mode 100644
index 82dd1d0..0000000
--- a/meta-demoapps/recipes-sato/clipboard-manager/clipboard-manager_0.6.4.bb
+++ /dev/null
@@ -1,33 +0,0 @@
-LICENSE = "GPL"
-DESCRIPTION = "clipboard manager"
-DEPENDS = "virtual/libx11"
-
-SRC_URI = "svn://stage.maemo.org/svn/maemo/projects/haf/tags/clipboard-manager/;module=${PV};proto=https \
-	   file://makefile.patch;patch=1  \
-	   file://script.patch;patch=1    \
-	   file://daemonize.patch;patch=1 \
-          "
-
-S = "${WORKDIR}/${PV}"
-
-inherit autotools pkgconfig
-
-do_install_append () {
-	mv ${D}/${sysconfdir}/X11/Xsession.d/clipboard.sh ${D}/${sysconfdir}/X11/Xsession.d/70clipboard
-	chmod u+x ${D}/${sysconfdir}/X11/Xsession.d/70clipboard
-}
-
-pkg_postinst_clipboard-manager () {
-#!/bin/sh -e
-if [ x"$D" = "x" ]; then
-  {
-    if [ x$(pidof clipboard-manager) != x ]; then
-      kill -TERM $(pidof clipboard-manager)
-    fi
-
-    ${sysconfdir}/X11/Xsession.d/70clipboard
-  } > /dev/null
-else
-  exit 1
-fi
-}
diff --git a/meta-demoapps/recipes-sato/clipboard-manager/files/daemonize.patch b/meta-demoapps/recipes-sato/clipboard-manager/files/daemonize.patch
deleted file mode 100644
index 24c11a9..0000000
--- a/meta-demoapps/recipes-sato/clipboard-manager/files/daemonize.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-Upstream-Status: Inappropriate [enable feature]
-
-Index: 0.6.4/manager.c
-===================================================================
---- 0.6.4.orig/manager.c	2007-06-28 12:23:37.000000000 +0100
-+++ 0.6.4/manager.c	2007-06-28 12:36:14.000000000 +0100
-@@ -68,7 +68,8 @@
-   ClipboardManager *manager;
-   int terminated = False;
-   Display *display;
--
-+  pid_t pid;
-+  
-   display = XOpenDisplay (NULL);
- 
-   if (!display)
-@@ -83,6 +84,29 @@
-       exit (1);
-     }
- 
-+  /* deamonize */
-+  pid = fork();
-+  switch (pid) 
-+    {
-+    case -1: fprintf (stderr, "Fork failed.\n");
-+      /* Fall through */
-+    default: exit(0); break;
-+    case 0: break;
-+    }
-+
-+  chdir ("/");
-+  setsid ();
-+  umask (0);
-+
-+  pid = fork();
-+  switch (pid) 
-+    {
-+    case -1: fprintf (stderr, "Fork failed.\n");
-+      /* Fall through */
-+    default: exit(0); break;
-+    case 0: break;
-+    }
-+  
-   XSetErrorHandler (x_error);
-   manager = clipboard_manager_new (display,
- 				   error_trap_push, error_trap_pop,
diff --git a/meta-demoapps/recipes-sato/clipboard-manager/files/makefile.patch b/meta-demoapps/recipes-sato/clipboard-manager/files/makefile.patch
deleted file mode 100644
index 17cd742..0000000
--- a/meta-demoapps/recipes-sato/clipboard-manager/files/makefile.patch
+++ /dev/null
@@ -1,20 +0,0 @@
-Upstream-Status: Inappropriate [configuration]
-
-Index: 0.6.4/Makefile.am
-===================================================================
---- 0.6.4.orig/Makefile.am	2007-06-28 12:23:37.000000000 +0100
-+++ 0.6.4/Makefile.am	2007-06-28 14:21:23.000000000 +0100
-@@ -1,5 +1,3 @@
--SUBDIRS = debian
--
- bin_PROGRAMS = clipboard-manager
- 
- INCLUDES = 			\
-@@ -21,6 +19,6 @@
- 	clipboard.txt \
- 	clipboard.sh
- 
--servicedir = $(sysconfdir)/osso-af-init
-+servicedir = $(sysconfdir)/X11/Xsession.d
- 
- service_DATA = clipboard.sh
diff --git a/meta-demoapps/recipes-sato/clipboard-manager/files/script.patch b/meta-demoapps/recipes-sato/clipboard-manager/files/script.patch
deleted file mode 100644
index bdab05a..0000000
--- a/meta-demoapps/recipes-sato/clipboard-manager/files/script.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-Upstream-Status: Inappropriate [disable feature]
-
-Index: 0.6.4/clipboard.sh
-===================================================================
---- 0.6.4.orig/clipboard.sh	2007-06-28 12:23:37.000000000 +0100
-+++ 0.6.4/clipboard.sh	2007-06-28 14:27:39.000000000 +0100
-@@ -1,33 +1,2 @@
- #!/bin/sh
--# Clipboard persistence manager startup script
--
--if [ "x$AF_PIDDIR" = "x" ]; then
--  echo "$0: Error, AF_PIDDIR is not defined"
--  exit 2
--fi
--if [ "x$LAUNCHWRAPPER_NICE_TRYRESTART" = "x" ]; then
--  echo "$0: Error, LAUNCHWRAPPER_NICE_TRYRESTART is not defined"
--  exit 2
--fi
--if [ ! -w $AF_PIDDIR ]; then
--  echo "$0: Error, directory $AF_PIDDIR is not writable"
--  exit 2
--fi
--PROG=/usr/bin/clipboard-manager
--SVC="clipboard-manager"
--
--case "$1" in
--start)  START=TRUE
--        ;;
--stop)   START=FALSE
--        ;;
--*)      echo "Usage: $0 {start|stop}"
--	exit 1
--        ;;
--esac
--
--if [ $START = TRUE ]; then
--  source $LAUNCHWRAPPER_NICE_TRYRESTART start "$SVC" $PROG
--else
--  source $LAUNCHWRAPPER_NICE_TRYRESTART stop "$SVC" $PROG
--fi
-+/usr/bin/clipboard-manager &
diff --git a/meta-demoapps/recipes-sato/epdfview/epdfview/epdfview-ui-print.xml b/meta-demoapps/recipes-sato/epdfview/epdfview/epdfview-ui-print.xml
deleted file mode 100644
index 3ddf514..0000000
--- a/meta-demoapps/recipes-sato/epdfview/epdfview/epdfview-ui-print.xml
+++ /dev/null
@@ -1,12 +0,0 @@
-<ui>
-  <menubar name="MenuBar">
-    <menu name="TopMenu" action="Top">
-      <menu action="FileMenu">
-        <placeholder name="PrintPlaceHolder">
-          <separator/>
-          <menuitem name="Print" action="Print"/>
-        </placeholder>
-      </menu>
-    </menu>
-  </menubar>
-</ui>
diff --git a/meta-demoapps/recipes-sato/epdfview/epdfview/epdfview-ui.xml b/meta-demoapps/recipes-sato/epdfview/epdfview/epdfview-ui.xml
deleted file mode 100644
index 602d86f..0000000
--- a/meta-demoapps/recipes-sato/epdfview/epdfview/epdfview-ui.xml
+++ /dev/null
@@ -1,57 +0,0 @@
-<ui>
-  <menubar name="MenuBar">
-    <menu name="TopMenu" action="Top">
-      <menu action="FileMenu">
-        <menuitem name="OpenFile" action="OpenFile"/>
-        <menuitem name="ReloadFile" action="ReloadFile"/>
-        <menuitem name="SaveFile" action="SaveFile"/>
-        <placeholder name="PrintPlaceHolder"/>
-        <separator/>
-        <menuitem name="Quit" action="Quit"/>
-      </menu>
-      <menu action="EditMenu">
-        <menuitem name="Find" action="Find"/>
-        <separator />
-        <menuitem name="Preferences" action="Preferences"/>
-      </menu>
-      <menu action="ViewMenu">
-        <menuitem name="ShowToolBar" action="ShowToolBar"/>
-        <menuitem name="ShowStatusBar" action="ShowStatusBar"/>
-        <menuitem name="ShowIndex" action="ShowIndex"/>
-        <separator/>
-        <menuitem name="ZoomIn" action="ZoomIn"/>
-        <menuitem name="ZoomOut" action="ZoomOut"/>
-        <menuitem name="ZoomFit" action="ZoomFit"/>
-        <menuitem name="ZoomWidth" action="ZoomWidth"/>
-        <separator />
-        <menuitem name="FullScreen" action="FullScreen"/>
-        <separator />
-        <menuitem name="RotateRight" action="RotateRight"/>
-        <menuitem name="RotateLeft" action="RotateLeft"/>
-      </menu>
-      <menu action="GoMenu">
-        <menuitem name="GoToFirstPage" action="GoToFirstPage"/>
-        <menuitem name="GoToPreviousPage" action="GoToPreviousPage"/>
-        <menuitem name="GoToNextPage" action="GoToNextPage"/>
-        <menuitem name="GoToLastPage" action="GoToLastPage"/>
-      </menu>
-      <menu action="HelpMenu">
-        <menuitem name="About" action="About"/>
-      </menu>
-    </menu>
-  </menubar>
-    
-  <toolbar name="ToolBar">
-    <toolitem name="OpenFile" action="OpenFile"/>
-    <separator/>
-    <toolitem name="GoToPreviousPage" action="GoToPreviousPage"/>
-    <toolitem name="GoToNextPage" action="GoToNextPage"/>
-    <separator/>
-    <toolitem name="ZoomIn" action="ZoomIn"/>
-    <toolitem name="ZoomOut" action="ZoomOut"/>
-    <toolitem name="ZoomFit" action="ZoomFit"/>
-    <toolitem name="ZoomWidth" action="ZoomWidth"/>
-  </toolbar>
-
-  <accelerator name="SlashAccelerator" action="Slash"/>
-</ui>
diff --git a/meta-demoapps/recipes-sato/epdfview/epdfview/epdfview.desktop b/meta-demoapps/recipes-sato/epdfview/epdfview/epdfview.desktop
deleted file mode 100644
index d3bf06d..0000000
--- a/meta-demoapps/recipes-sato/epdfview/epdfview/epdfview.desktop
+++ /dev/null
@@ -1,10 +0,0 @@
-[Desktop Entry]
-Categories=Viewer;Office;GTK;
-Comment=Lightweight PDF document viewer
-Exec=epdfview %f
-GenericName=PDF Viewer
-Icon=accessories-text-editor
-Name=PDF Viewer
-MimeType=application/pdf;
-Terminal=false
-Type=Application
diff --git a/meta-demoapps/recipes-sato/epdfview/epdfview/owl-menus.patch b/meta-demoapps/recipes-sato/epdfview/epdfview/owl-menus.patch
deleted file mode 100644
index b7ca962..0000000
--- a/meta-demoapps/recipes-sato/epdfview/epdfview/owl-menus.patch
+++ /dev/null
@@ -1,327 +0,0 @@
-Upstream-Status: Inappropriate [enable feature]
-
-Index: epdfview-0.1.7/src/Makefile.am
-===================================================================
---- epdfview-0.1.7.orig/src/Makefile.am	2010-07-13 12:30:44.014172385 +0100
-+++ epdfview-0.1.7/src/Makefile.am	2010-07-13 12:30:48.780063260 +0100
-@@ -58,7 +58,7 @@
- 	main.cxx
- 
- libshell_cxxflags = -I$(top_srcdir)/src/gtk $(GTK2_CFLAGS)
--libshell_ldadd = $(GTK2_LIBS) $(top_builddir)/src/gtk/libshell-gtk.a
-+libshell_ldadd = $(GTK2_LIBS) $(top_builddir)/src/gtk/libshell-gtk.a -lowl
- 
- epdfview_CXXFLAGS =	\
- 	-DLOCALEDIR='"$(datadir)/locale"'	\
-Index: epdfview-0.1.7/src/gtk/MainView.cxx
-===================================================================
---- epdfview-0.1.7.orig/src/gtk/MainView.cxx	2010-07-13 12:30:44.014172385 +0100
-+++ epdfview-0.1.7/src/gtk/MainView.cxx	2010-07-13 12:30:48.782124540 +0100
-@@ -20,6 +20,7 @@
- #include <string.h>
- #include <gettext.h>
- #include <gtk/gtk.h>
-+#include <libowl/owlwindowmenu.h>
- #include <epdfview.h>
- #include "StockIcons.h"
- #include "FindView.h"
-@@ -86,6 +87,7 @@
- // The actions for menus and toolbars.
- static const GtkActionEntry g_NormalEntries[] =
- {
-+    { "Top", NULL, "", NULL, NULL, NULL },
-     { "FileMenu", NULL, N_("_File"), NULL, NULL, NULL },
-     { "EditMenu", NULL, N_("_Edit"), NULL, NULL, NULL },
-     { "ViewMenu", NULL, N_("_View"), NULL, NULL, NULL },
-@@ -100,7 +102,7 @@
-       N_("Reload the current document"),
-       G_CALLBACK (main_window_reload_cb) },
- 
--    { "SaveFile", GTK_STOCK_SAVE, N_("_Save a Copy..."), "<control>S",
-+    { "SaveFile", GTK_STOCK_SAVE, N_("_Save a Copy..."), "<control>W",
-       N_("Save a copy of the current document"),
-       G_CALLBACK (main_window_save_file_cb) },
- 
-@@ -110,11 +112,11 @@
-       G_CALLBACK (main_window_print_cb) },
- #endif // HAVE_CUPS
- 
--    { "Quit", GTK_STOCK_CLOSE, N_("_Close"), "<control>W",
-+    { "Quit", GTK_STOCK_CLOSE, N_("_Close"), "<control>Q",
-       N_("Close this window"),
-       G_CALLBACK (main_window_quit_cb) },
- 
--    { "Find", GTK_STOCK_FIND, N_("_Find"), "<control>F",
-+    { "Find", GTK_STOCK_FIND, N_("_Find"), "<control>S",
-       N_("Find a word in the document"),
-       G_CALLBACK (main_window_find_cb) },
- 
-@@ -138,19 +140,19 @@
-       N_("Rotate the document 90 degrees counter-clockwise"),
-       G_CALLBACK (main_window_rotate_left_cb) },
- 
--    { "GoToFirstPage", GTK_STOCK_GOTO_FIRST, N_("_First Page"), "<control>Home",
-+    { "GoToFirstPage", GTK_STOCK_GOTO_FIRST, N_("_First Page"), "<control>1",
-       N_("Go to the first page"),
-       G_CALLBACK (main_window_go_to_first_page_cb) },
- 
--    { "GoToNextPage", GTK_STOCK_GO_FORWARD, N_("_Next Page"), "<Shift>Page_Down",
-+    { "GoToNextPage", GTK_STOCK_GO_FORWARD, N_("_Next Page"), "<Shift>Down",
-       N_("Go to the next page"),
-       G_CALLBACK (main_window_go_to_next_page_cb) },
- 
--    { "GoToPreviousPage", GTK_STOCK_GO_BACK, N_("_Previous Page"), "<Shift>Page_Up",
-+    { "GoToPreviousPage", GTK_STOCK_GO_BACK, N_("_Previous Page"), "<Shift>Up",
-       N_("Go to the previous page"),
-       G_CALLBACK (main_window_go_to_previous_page_cb) },
- 
--    { "GoToLastPage", GTK_STOCK_GOTO_LAST, N_("_Last Page"), "<control>End",
-+    { "GoToLastPage", GTK_STOCK_GOTO_LAST, N_("_Last Page"), "<control>0",
-       N_("Go to the last page"),
-       G_CALLBACK (main_window_go_to_last_page_cb) },
- 
-@@ -172,7 +174,7 @@
- 
- static GtkToggleActionEntry g_ToggleEntries[] =
- {
--    { "FullScreen", NULL, N_("F_ull screen"), "F11",
-+    { "FullScreen", NULL, N_("F_ull screen"), "<control>F",
-       N_("Toggle full screen window"),
-       G_CALLBACK (main_window_fullscreen_cb), FALSE },
- 
-@@ -184,7 +186,7 @@
-       N_("Show or hide the statusbar"),
-       G_CALLBACK (main_window_show_statusbar_cb), TRUE },
- 
--    { "ShowIndex", NULL, N_("Show I_ndex"), "F9",
-+    { "ShowIndex", NULL, N_("Show I_ndex"), "<control>I",
-       N_("Show or hide the document's outline"),
-       G_CALLBACK (main_window_show_index_cb), FALSE },
- 
-@@ -234,9 +236,8 @@
-     GtkAccelGroup *accelGroup = gtk_ui_manager_get_accel_group (m_UIManager);
-     gtk_window_add_accel_group (GTK_WINDOW (m_MainWindow), accelGroup);
-     // Add the menu bar and tool bar.
--    GtkWidget *menuBar = gtk_ui_manager_get_widget (m_UIManager, "/MenuBar");
--    gtk_box_pack_start (GTK_BOX (m_MainBox), menuBar, FALSE, FALSE, 0);
--    gtk_widget_show (menuBar);
-+    owl_set_window_menu_item (GTK_WINDOW (m_MainWindow), 
-+                              GTK_MENU_ITEM(gtk_ui_manager_get_widget(m_UIManager, "/MenuBar/TopMenu")));
-     GtkWidget *toolBar = gtk_ui_manager_get_widget (m_UIManager, "/ToolBar");
-     gtk_box_pack_start (GTK_BOX (m_MainBox), toolBar, FALSE, FALSE, 0);
-     // Add the current page tool item.
-@@ -285,7 +286,7 @@
- MainView::activeZoomFit (gboolean active)
- {
-     GtkAction *zoomFit =
--        gtk_ui_manager_get_action (m_UIManager, "/MenuBar/ViewMenu/ZoomFit");
-+        gtk_ui_manager_get_action (m_UIManager, "/MenuBar/TopMenu/ViewMenu/ZoomFit");
-     gtk_toggle_action_set_active (GTK_TOGGLE_ACTION (zoomFit), active);
- }
- 
-@@ -293,7 +294,7 @@
- MainView::activeZoomWidth (gboolean active)
- {
-     GtkAction *zoomWidth =
--        gtk_ui_manager_get_action (m_UIManager, "/MenuBar/ViewMenu/ZoomWidth");
-+        gtk_ui_manager_get_action (m_UIManager, "/MenuBar/TopMenu/ViewMenu/ZoomWidth");
-     gtk_toggle_action_set_active (GTK_TOGGLE_ACTION (zoomWidth), active);
- }
- 
-@@ -484,7 +485,7 @@
- MainView::sensitiveFind (gboolean sensitive)
- {
-     GtkAction *find =
--        gtk_ui_manager_get_action (m_UIManager, "/MenuBar/EditMenu/Find");
-+        gtk_ui_manager_get_action (m_UIManager, "/MenuBar/TopMenu/EditMenu/Find");
-     gtk_action_set_sensitive (find, sensitive);
- }
- 
-@@ -492,7 +493,7 @@
- MainView::sensitiveGoToFirstPage (gboolean sensitive)
- {
-     GtkAction *goToFirstPage = gtk_ui_manager_get_action (m_UIManager,
--            "/MenuBar/GoMenu/GoToFirstPage");
-+            "/MenuBar/TopMenu/GoMenu/GoToFirstPage");
-     gtk_action_set_sensitive (goToFirstPage, sensitive);
- }
- 
-@@ -500,7 +501,7 @@
- MainView::sensitiveGoToLastPage (gboolean sensitive)
- {
-     GtkAction *goToLastPage =
--        gtk_ui_manager_get_action (m_UIManager, "/MenuBar/GoMenu/GoToLastPage");
-+        gtk_ui_manager_get_action (m_UIManager, "/MenuBar/TopMenu/GoMenu/GoToLastPage");
-     gtk_action_set_sensitive (goToLastPage, sensitive);
- }
- 
-@@ -508,7 +509,7 @@
- MainView::sensitiveGoToNextPage (gboolean sensitive)
- {
-     GtkAction *goToNextPage =
--        gtk_ui_manager_get_action (m_UIManager, "/MenuBar/GoMenu/GoToNextPage");
-+        gtk_ui_manager_get_action (m_UIManager, "/MenuBar/TopMenu/GoMenu/GoToNextPage");
-     gtk_action_set_sensitive (goToNextPage, sensitive);
- }
- 
-@@ -522,7 +523,7 @@
- MainView::sensitiveGoToPreviousPage (gboolean sensitive)
- {
-     GtkAction *goToPreviousPage = gtk_ui_manager_get_action (m_UIManager, 
--            "/MenuBar/GoMenu/GoToPreviousPage");
-+            "/MenuBar/TopMenu/GoMenu/GoToPreviousPage");
-     gtk_action_set_sensitive (goToPreviousPage, sensitive);
- }
- 
-@@ -530,7 +531,7 @@
- MainView::sensitiveOpen (gboolean sensitive)
- {
-     GtkAction *open =
--        gtk_ui_manager_get_action (m_UIManager, "/MenuBar/FileMenu/OpenFile");
-+        gtk_ui_manager_get_action (m_UIManager, "/MenuBar/TopMenu/FileMenu/OpenFile");
-     gtk_action_set_sensitive (open, sensitive);
- }
- 
-@@ -539,7 +540,7 @@
- MainView::sensitivePrint (gboolean sensitive)
- {
-     GtkAction *print = gtk_ui_manager_get_action (m_UIManager,
--            "/MenuBar/FileMenu/PrintPlaceHolder/Print");
-+            "/MenuBar/TopMenu/FileMenu/PrintPlaceHolder/Print");
-     gtk_action_set_sensitive (print, sensitive);
- }
- #endif // HAVE_CUPS
-@@ -548,7 +549,7 @@
- MainView::sensitiveReload (gboolean sensitive)
- {
-     GtkAction *reload =
--        gtk_ui_manager_get_action (m_UIManager, "/MenuBar/FileMenu/ReloadFile");
-+        gtk_ui_manager_get_action (m_UIManager, "/MenuBar/TopMenu/FileMenu/ReloadFile");
-     gtk_action_set_sensitive (reload, sensitive);
- }
- 
-@@ -556,7 +557,7 @@
- MainView::sensitiveRotateLeft (gboolean sensitive)
- {
-     GtkAction *rotateLeft =
--        gtk_ui_manager_get_action (m_UIManager, "/MenuBar/ViewMenu/RotateLeft");
-+        gtk_ui_manager_get_action (m_UIManager, "/MenuBar/TopMenu/ViewMenu/RotateLeft");
-     gtk_action_set_sensitive (rotateLeft, sensitive);
- }
- 
-@@ -564,7 +565,7 @@
- MainView::sensitiveRotateRight (gboolean sensitive)
- {
-     GtkAction *rotateRight = gtk_ui_manager_get_action (m_UIManager,
--            "/MenuBar/ViewMenu/RotateRight");
-+            "/MenuBar/TopMenu/ViewMenu/RotateRight");
-     gtk_action_set_sensitive (rotateRight, sensitive);
- }
- 
-@@ -572,7 +573,7 @@
- MainView::sensitiveSave (gboolean sensitive)
- {
-     GtkAction *save =
--        gtk_ui_manager_get_action (m_UIManager, "/MenuBar/FileMenu/SaveFile");
-+        gtk_ui_manager_get_action (m_UIManager, "/MenuBar/TopMenu/FileMenu/SaveFile");
-     gtk_action_set_sensitive (save, sensitive);
- }
- 
-@@ -586,7 +587,7 @@
- MainView::sensitiveZoomIn (gboolean sensitive)
- {
-     GtkAction *zoomIn =
--        gtk_ui_manager_get_action (m_UIManager, "/MenuBar/ViewMenu/ZoomIn");
-+        gtk_ui_manager_get_action (m_UIManager, "/MenuBar/TopMenu/ViewMenu/ZoomIn");
-     gtk_action_set_sensitive (zoomIn, sensitive);
- }
- 
-@@ -594,7 +595,7 @@
- MainView::sensitiveZoomOut (gboolean sensitive)
- {
-     GtkAction *zoomOut =
--        gtk_ui_manager_get_action (m_UIManager, "/MenuBar/ViewMenu/ZoomOut");
-+        gtk_ui_manager_get_action (m_UIManager, "/MenuBar/TopMenu/ViewMenu/ZoomOut");
-     gtk_action_set_sensitive (zoomOut, sensitive);
- }
- 
-@@ -602,7 +603,7 @@
- MainView::sensitiveZoomFit (gboolean sensitive)
- {
-     GtkAction *zoomFit =
--        gtk_ui_manager_get_action (m_UIManager, "/MenuBar/ViewMenu/ZoomFit");
-+        gtk_ui_manager_get_action (m_UIManager, "/MenuBar/TopMenu/ViewMenu/ZoomFit");
-     gtk_action_set_sensitive (zoomFit, sensitive);
- }
- 
-@@ -610,7 +611,7 @@
- MainView::sensitiveZoomWidth (gboolean sensitive)
- {
-     GtkAction *zoomWidth =
--        gtk_ui_manager_get_action (m_UIManager, "/MenuBar/ViewMenu/ZoomWidth");
-+        gtk_ui_manager_get_action (m_UIManager, "/MenuBar/TopMenu/ViewMenu/ZoomWidth");
-     gtk_action_set_sensitive (zoomWidth, sensitive);
- }
- 
-@@ -654,7 +655,7 @@
-     }
-     GtkAction *showIndex =
-         gtk_ui_manager_get_action (m_UIManager,
--                                   "/MenuBar/ViewMenu/ShowIndex");
-+                                   "/MenuBar/TopMenu/ViewMenu/ShowIndex");
-     gtk_toggle_action_set_active (GTK_TOGGLE_ACTION (showIndex), show);
- }
- 
-@@ -695,13 +696,13 @@
-         gtk_window_fullscreen (GTK_WINDOW (m_MainWindow));
-         // Hide the menu bar, tool bar, status bar and the index bar. Then
-         // zoom to fit.
--        gtk_widget_hide (menuBar);
-+//        gtk_widget_hide (menuBar);
-         gtk_widget_hide (toolBar);
-         gtk_widget_hide (m_StatusBar);
-         gtk_widget_hide (m_Sidebar);
-         gtk_toggle_action_set_active (
-                 GTK_TOGGLE_ACTION (gtk_ui_manager_get_action (m_UIManager,
--                                   "/MenuBar/ViewMenu/ZoomFit")), TRUE);
-+                                   "/MenuBar/TopMenu/ViewMenu/ZoomFit")), TRUE);
-     }
-     else
-     {
-@@ -711,15 +712,15 @@
-         // enabled.
-         main_window_show_index_cb (
-                 GTK_TOGGLE_ACTION (gtk_ui_manager_get_action (m_UIManager,
--                        "/MenuBar/ViewMenu/ShowIndex")),
-+                        "/MenuBar/TopMenu/ViewMenu/ShowIndex")),
-                 (gpointer)m_Pter);
-         main_window_show_statusbar_cb (
-                 GTK_TOGGLE_ACTION (gtk_ui_manager_get_action (m_UIManager,
--                        "/MenuBar/ViewMenu/ShowStatusBar")),
-+                        "/MenuBar/TopMenu/ViewMenu/ShowStatusBar")),
-                 (gpointer)m_Pter);
-         main_window_show_toolbar_cb (
-                 GTK_TOGGLE_ACTION (gtk_ui_manager_get_action (m_UIManager,
--                        "/MenuBar/ViewMenu/ShowToolBar")),
-+                        "/MenuBar/TopMenu/ViewMenu/ShowToolBar")),
-                 (gpointer)m_Pter);
-     }
- }
-@@ -814,7 +815,7 @@
- MainView::showStatusbar (gboolean show)
- {
-     GtkAction *toggleAction = gtk_ui_manager_get_action (m_UIManager,
--                                            "/MenuBar/ViewMenu/ShowStatusBar");
-+                                            "/MenuBar/TopMenu/ViewMenu/ShowStatusBar");
-     gtk_toggle_action_set_active (GTK_TOGGLE_ACTION (toggleAction), show);
-     if ( show )
-     {
-@@ -830,7 +831,7 @@
- MainView::showToolbar (gboolean show)
- {
-     GtkAction *toggleAction = gtk_ui_manager_get_action (m_UIManager,
--                                            "/MenuBar/ViewMenu/ShowToolBar");
-+                                            "/MenuBar/TopMenu/ViewMenu/ShowToolBar");
-     gtk_toggle_action_set_active (GTK_TOGGLE_ACTION (toggleAction), show);
-     GtkWidget *toolBar = gtk_ui_manager_get_widget (m_UIManager, "/ToolBar");
-     if ( show )
diff --git a/meta-demoapps/recipes-sato/epdfview/epdfview_0.1.6.bb b/meta-demoapps/recipes-sato/epdfview/epdfview_0.1.6.bb
deleted file mode 100644
index a528474..0000000
--- a/meta-demoapps/recipes-sato/epdfview/epdfview_0.1.6.bb
+++ /dev/null
@@ -1,21 +0,0 @@
-DESCRIPTION = "A minimal PDF viewer based on gtk and poppler"
-HOMEPAGE = "http://trac.emma-soft.com/epdfview/"
-LICENSE = "GPLv2"
-SECTION = "x11/applications"
-DEPENDS = "poppler gtk+ libowl"
-PR="r0"
-
-SRC_URI = "http://trac.emma-soft.com/epdfview/chrome/site/releases/epdfview-${PV}.tar.bz2 \
-           file://owl-menus.patch \
-           file://epdfview.desktop \
-           file://epdfview-ui.xml \
-           file://epdfview-ui-print.xml"
-
-inherit autotools gettext
-
-do_install_prepend() {
-	install ${WORKDIR}/epdfview-ui.xml ${S}/data/epdfview-ui.xml
-	install ${WORKDIR}/epdfview-ui-print.xml ${S}/data/epdfview-ui-print.xml
-	install ${WORKDIR}/epdfview.desktop ${S}/data/epdfview.desktop
-}
-
diff --git a/meta-demoapps/recipes-sato/epdfview/epdfview_0.1.7.bb b/meta-demoapps/recipes-sato/epdfview/epdfview_0.1.7.bb
deleted file mode 100644
index 34e08bd..0000000
--- a/meta-demoapps/recipes-sato/epdfview/epdfview_0.1.7.bb
+++ /dev/null
@@ -1,21 +0,0 @@
-DESCRIPTION = "A minimal PDF viewer based on gtk and poppler"
-HOMEPAGE = "http://trac.emma-soft.com/epdfview/"
-LICENSE = "GPLv2"
-SECTION = "x11/applications"
-DEPENDS = "poppler gtk+"
-PR="r0"
-
-SRC_URI = "http://trac.emma-soft.com/epdfview/chrome/site/releases/epdfview-${PV}.tar.bz2 \
-           file://owl-menus.patch;patch=1 \
-           file://epdfview.desktop \
-           file://epdfview-ui.xml \
-           file://epdfview-ui-print.xml"
-
-inherit autotools gettext
-
-do_install_prepend() {
-	install ${WORKDIR}/epdfview-ui.xml ${S}/data/epdfview-ui.xml
-	install ${WORKDIR}/epdfview-ui-print.xml ${S}/data/epdfview-ui-print.xml
-	install ${WORKDIR}/epdfview.desktop ${S}/data/epdfview.desktop
-}
-
diff --git a/meta-demoapps/recipes-sato/kf/files/fix-configure.patch b/meta-demoapps/recipes-sato/kf/files/fix-configure.patch
deleted file mode 100644
index ae6bf71..0000000
--- a/meta-demoapps/recipes-sato/kf/files/fix-configure.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-Upstream-Status: Inappropriate [configuration]
-
-diff -urNd ../kf-0.5.4.1-r0/kf-0.5.4.1/configure.in kf-0.5.4.1/configure.in
---- ../kf-0.5.4.1-r0/kf-0.5.4.1/configure.in	2005-04-27 19:42:49.000000000 +0100
-+++ kf-0.5.4.1/configure.in	2005-09-29 14:12:32.000000000 +0100
-@@ -27,7 +27,7 @@
- dnl AC_ARG_ENABLE(debug,)
- 
- dnl modules needed for package
--MODULES="gtk+-2.0 >= 2.0.0 libglade-2.0 >= 1.110.0 loudmouth-1.0 >= 0.16"
-+MODULES="gtk+-2.0 >= 2.0.0 libglade-2.0 >= 1.110.0 loudmouth-1.0 >= 0.16 libxml-2.0"
- dnl MODULES="gtk+-2.0 >= 2.0.0 libglade-2.0 >= 1.110.0 loudmouth-1.0 >= 0.15.1"
- 
- dnl GtkSpell
-@@ -60,9 +60,9 @@
- 	AC_DEFINE([HAVE_LM_CONNECTION_SET_JID],1,[We have lm_connection_set_jid])
- fi
- 
--dnl XScreenSaver stuff...
--AC_DEFINE([HAVE_XSCREENSAVER], [1], [Whether to support XScreenSaver extension])
--PACKAGE_LIBS="$PACKAGE_LIBS -lXss -L/usr/X11R6/lib"
-+#dnl XScreenSaver stuff...
-+#AC_DEFINE([HAVE_XSCREENSAVER], [1], [Whether to support XScreenSaver extension])
-+#PACKAGE_LIBS="$PACKAGE_LIBS -lXss -L/usr/X11R6/lib"
- 
- AC_SUBST(PACKAGE_CFLAGS)
- AC_SUBST(PACKAGE_LIBS)
diff --git a/meta-demoapps/recipes-sato/kf/files/fix-desktop-file.patch b/meta-demoapps/recipes-sato/kf/files/fix-desktop-file.patch
deleted file mode 100644
index c749616..0000000
--- a/meta-demoapps/recipes-sato/kf/files/fix-desktop-file.patch
+++ /dev/null
@@ -1,22 +0,0 @@
-Upstream-Status: Inappropriate [configuration]
-
-Common subdirectories: kf-0.5.4.1.orig/data and kf-0.5.4.1/data
-diff -u kf-0.5.4.1.orig/kf.desktop kf-0.5.4.1/kf.desktop
---- kf-0.5.4.1.orig/kf.desktop	2005-04-19 22:08:44.000000000 +0100
-+++ kf-0.5.4.1/kf.desktop	2005-10-03 14:36:47.000000000 +0100
-@@ -1,6 +1,6 @@
- [Desktop Entry]
- Encoding=UTF-8
--Name=kf jabber client
-+Name=Instant Messenger
- Name[pl]=kf klient sieci jabber
- Name[lt]=Pokalbių programa kf
- GenericName=Instant Messenger
-@@ -11,5 +11,6 @@
- Icon=kf.png
- Terminal=false
- Type=Application
--Categories=GTK;Application;Network;
-+Categories=GTK;PIM;Application;Network;
- StartupNotify=true
-+X-MB-SingleInstance=true
diff --git a/meta-demoapps/recipes-sato/kf/files/gcc4.patch b/meta-demoapps/recipes-sato/kf/files/gcc4.patch
deleted file mode 100644
index 9e16529..0000000
--- a/meta-demoapps/recipes-sato/kf/files/gcc4.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-Upstream-Status: Pending
-
-Index: kf-0.5.4.1/src/jispman.c
-===================================================================
---- kf-0.5.4.1.orig/src/jispman.c	2006-12-03 15:33:47.000000000 +0100
-+++ kf-0.5.4.1/src/jispman.c	2006-12-03 15:35:01.000000000 +0100
-@@ -25,12 +25,6 @@
- #include "emoticons.h"
- #include "kf.h"
- 
--struct _KfJispManager {
--	GHashTable *jisps;	/** A hash-table of all JISP pachages managed by this object, indexed by their filename */
--	GList *patterns;	/** A list of patterns */
--};
--
--
- /**
-  * \brief create a new instance of KfJispManager
-  * \return a new instance of KfJispManager
-Index: kf-0.5.4.1/src/jispman.h
-===================================================================
---- kf-0.5.4.1.orig/src/jispman.h	2006-12-03 15:33:47.000000000 +0100
-+++ kf-0.5.4.1/src/jispman.h	2006-12-03 15:34:37.000000000 +0100
-@@ -25,6 +25,8 @@
- #include "jisp.h"
- 
- typedef struct _KfJispManager {
-+        GHashTable *jisps;      /** A hash-table of all JISP pachages managed by this object, indexed by their filename */
-+        GList *patterns;        /** A list of patterns */
- } KfJispManager;
- 
- /**
diff --git a/meta-demoapps/recipes-sato/kf/kf_0.5.4.1.bb b/meta-demoapps/recipes-sato/kf/kf_0.5.4.1.bb
deleted file mode 100644
index 67db92c..0000000
--- a/meta-demoapps/recipes-sato/kf/kf_0.5.4.1.bb
+++ /dev/null
@@ -1,16 +0,0 @@
-DESCRIPTION = "Kf is a GTK+ instant messaging client."
-LICENSE = "GPL"
-DEPENDS = "libxml2 glib-2.0 gtk+ loudmouth libglade"
-PR = "r4"
-
-SRC_URI = "http://jabberstudio.2nw.net/${BPN}/${BPN}-${PV}.tar.gz \
-           file://fix-configure.patch;patch=1 \
-           file://fix-desktop-file.patch;patch=0 \
-           file://gcc4.patch;patch=1"
-
-inherit autotools pkgconfig
-
-EXTRA_OECONF = "--disable-binreloc"
-
-export PKG_CONFIG="${STAGING_BINDIR_NATIVE}/pkg-config"
-
diff --git a/meta-demoapps/recipes-sato/matchbox-themes-extra/matchbox-themes-extra_0.3.bb b/meta-demoapps/recipes-sato/matchbox-themes-extra/matchbox-themes-extra_0.3.bb
deleted file mode 100644
index 1ba7b0a..0000000
--- a/meta-demoapps/recipes-sato/matchbox-themes-extra/matchbox-themes-extra_0.3.bb
+++ /dev/null
@@ -1,28 +0,0 @@
-DESCRIPTION = "Matchbox window manager extra themes"
-LICENSE = "GPL"
-DEPENDS = "matchbox-wm"
-SECTION = "x11/wm"
-
-SRC_URI = "http://downloads.yoctoproject.org/releases/matchbox/matchbox-themes-extra/${PV}/matchbox-themes-extra-${PV}.tar.bz2"
-S = "${WORKDIR}/matchbox-themes-extra-${PV}"
-
-SRC_URI[md5sum] = "04312628f4a21f4105bce1251ea08035"
-SRC_URI[sha256sum] = "98a1c8695842b0cd7f32e67b0ef9118fd0f32db5297f3f08706c706dee8fc6be"
-
-inherit autotools  pkgconfig
-
-# split into several packages plus one meta package
-PACKAGES = "${PN} ${PN}-industrial ${PN}-expose ${PN}-mbcrystal"
-
-ALLOW_EMPTY_${PN} = "1"
-FILES_${PN} = ""
-RDEPENDS_${PN} = "${PN}-industrial ${PN}-expose ${PN}-mbcrystal"
-
-FILES_${PN}-industrial = "${datadir}/themes/Industrial \
-			  ${datadir}/icons/Industrial"
-
-FILES_${PN}-expose = "${datadir}/themes/expose \
-		      ${datadir}/icons/expose"
-
-FILES_${PN}-mbcrystal = "${datadir}/themes/mbcrystal \
-			 ${datadir}/icons/mbcrystal"
diff --git a/meta-demoapps/recipes-sato/matchbox-themes-extra/matchbox-themes-extra_git.bb b/meta-demoapps/recipes-sato/matchbox-themes-extra/matchbox-themes-extra_git.bb
deleted file mode 100644
index 214dd3d..0000000
--- a/meta-demoapps/recipes-sato/matchbox-themes-extra/matchbox-themes-extra_git.bb
+++ /dev/null
@@ -1,33 +0,0 @@
-DESCRIPTION = "Matchbox window manager extra themes"
-LICENSE = "GPL"
-DEPENDS = "matchbox-wm"
-SECTION = "x11/wm"
-SRCREV = "f848f9e4e577d5b9719f05b5152df1ce59399f5c"
-PV = "0.3+git${SRCPV}"
-
-LIC_FILES_CHKSUM = "file://configure.ac;endline=7;md5=3c4e087662e37f10e469425f3a0ad225"
-
-SRC_URI = "git://git.yoctoproject.org/${BPN};protocol=git"
-S = "${WORKDIR}/git"
-
-inherit autotools pkgconfig
-
-# split into several packages plus one meta package
-PACKAGES = "${PN} ${PN}-industrial ${PN}-expose ${PN}-mbcrystal ${PN}-clearlooks"
-
-ALLOW_EMPTY_${PN} = 1
-FILES_${PN} = ""
-RDEPENDS_${PN} = "${PN}-industrial ${PN}-expose ${PN}-mbcrystal ${PN}-clearlooks"
-
-FILES_${PN}-industrial = "${datadir}/themes/Industrial \
-			  ${datadir}/icons/Industrial"
-
-FILES_${PN}-expose = "${datadir}/themes/expose \
-		      ${datadir}/icons/expose"
-
-FILES_${PN}-mbcrystal = "${datadir}/themes/mbcrystal \
-			 ${datadir}/icons/mbcrystal"
-
-FILES_${PN}-clearlooks = "${datadir}/themes/Clearlooks \
-			  ${datadir}/icons/Clearlooks"
-
diff --git a/meta-demoapps/recipes-sato/matchbox-themes-gtk/files/gtkrc b/meta-demoapps/recipes-sato/matchbox-themes-gtk/files/gtkrc
deleted file mode 100644
index 6dc40c0..0000000
--- a/meta-demoapps/recipes-sato/matchbox-themes-gtk/files/gtkrc
+++ /dev/null
@@ -1 +0,0 @@
-include "/usr/share/themes/Clearlooks/gtk-2.0/gtkrc"
diff --git a/meta-demoapps/recipes-sato/matchbox-themes-gtk/matchbox-themes-gtk.bb b/meta-demoapps/recipes-sato/matchbox-themes-gtk/matchbox-themes-gtk.bb
deleted file mode 100644
index 21716cf..0000000
--- a/meta-demoapps/recipes-sato/matchbox-themes-gtk/matchbox-themes-gtk.bb
+++ /dev/null
@@ -1,17 +0,0 @@
-DESCRIPTION = "Gtk2 theme files to accompany default Matchbox themes"
-LICENSE = "GPL"
-DEPENDS = "gtk-engines"
-RDEPENDS_${PN} = "matchbox-wm gtk-engine-clearlooks"
-SECTION = "x11/base"
-PR = "r3"
-
-SRC_URI = "file://gtkrc"
-
-FILES_${PN} = "${datadir}/themes"
-
-do_install() {
-	install -d ${D}${datadir}/themes/blondie/gtk-2.0
-	install -d ${D}${datadir}/themes/MBOpus/gtk-2.0
-	install -m 644 ${WORKDIR}/gtkrc ${D}${datadir}/themes/blondie/gtk-2.0/
-	install -m 644 ${WORKDIR}/gtkrc ${D}${datadir}/themes/MBOpus/gtk-2.0/
-}
diff --git a/meta-demoapps/recipes-support/iso-codes/iso-codes_3.3.bb b/meta-demoapps/recipes-support/iso-codes/iso-codes_3.3.bb
deleted file mode 100644
index 21843fd..0000000
--- a/meta-demoapps/recipes-support/iso-codes/iso-codes_3.3.bb
+++ /dev/null
@@ -1,13 +0,0 @@
-SECTION = "libs"
-DESCRIPTION = "ISO language, territory, currency, script codes and their translations"
-LICENSE = "LGPL"
-SECTION = "libs"
-PACKAGE_ARCH = "all"
-
-SRC_URI = "ftp://pkg-isocodes.alioth.debian.org/pub/pkg-isocodes/iso-codes-${PV}.tar.gz"
-
-inherit autotools
-
-FILES_${PN}-dev="${datadir}/pkgconfig/iso-codes.pc"
-FILES_${PN}="${datadir}/xml/iso-codes/ \
-             ${datadir}/iso-codes/"
diff --git a/meta-demoapps/recipes-support/libfribidi/files/libtool-update.patch b/meta-demoapps/recipes-support/libfribidi/files/libtool-update.patch
deleted file mode 100644
index 7fbbe28..0000000
--- a/meta-demoapps/recipes-support/libfribidi/files/libtool-update.patch
+++ /dev/null
@@ -1,13 +0,0 @@
-Upstream-Status: Inappropriate [configuration]
-
---- fribidi-0.10.4/configure.in~	2002-05-19 11:06:48.000000000 +0100
-+++ fribidi-0.10.4/configure.in	2004-08-03 17:42:28.000000000 +0100
-@@ -50,7 +50,7 @@
- AC_PROG_INSTALL
- AC_PROG_LN_S
- AC_PROG_MAKE_SET
--AC_PROG_RANLIB
-+#AC_PROG_RANLIB
- AC_PATH_PROG(SED, sed, $PATH)
- 
- 
diff --git a/meta-demoapps/recipes-support/libfribidi/libfribidi_0.10.4.bb b/meta-demoapps/recipes-support/libfribidi/libfribidi_0.10.4.bb
deleted file mode 100644
index a731421..0000000
--- a/meta-demoapps/recipes-support/libfribidi/libfribidi_0.10.4.bb
+++ /dev/null
@@ -1,23 +0,0 @@
-DESCRIPTION = "Fribidi library for bidirectional text"
-SECTION = "libs"
-LICENSE = "GPL"
-
-inherit autotools pkgconfig
-
-PR = "r0"
-
-S = "${WORKDIR}/fribidi-${PV}"
-
-SRC_URI = "${SOURCEFORGE_MIRROR}/fribidi/fribidi-${PV}.tar.bz2 \
-           file://libtool-update.patch;patch=1"
-
-#PACKAGES += " ${PN}-bin"
-FILES_${PN} = "${libdir}/lib*.so.*"
-#FILES_${PN}-bin = "${libdir}/uu*"
-
-do_configure_prepend () {
-# this version of libtool is old - we have to nobble this file to get it to litoolize
-	rm ltconfig
-	rm aclocal.m4
-	rm acinclude.m4
-}
diff --git a/meta-demoapps/recipes-support/openobex/files/disable-cable-test.patch b/meta-demoapps/recipes-support/openobex/files/disable-cable-test.patch
deleted file mode 100644
index 4251138..0000000
--- a/meta-demoapps/recipes-support/openobex/files/disable-cable-test.patch
+++ /dev/null
@@ -1,17 +0,0 @@
-
-#
-# Patch managed by http://www.holgerschurig.de/patcher.html
-# 
-Upstream-Status: Inappropriate [configuration]
-
---- openobex-1.2/apps/Makefile.am~disable-cable-test
-+++ openobex-1.2/apps/Makefile.am
-@@ -6,7 +6,7 @@
- 	obex_io.c obex_io.h \
- 	obex_put_common.c obex_put_common.h
- 
--bin_PROGRAMS = irxfer obex_tcp irobex_palm3 obex_test
-+bin_PROGRAMS = irxfer obex_tcp irobex_palm3
- 
- obex_test_SOURCES = \
- 	obex_test.c obex_test.h \
diff --git a/meta-demoapps/recipes-support/openobex/files/libusb_crosscompile_check.patch b/meta-demoapps/recipes-support/openobex/files/libusb_crosscompile_check.patch
deleted file mode 100644
index 18841a8..0000000
--- a/meta-demoapps/recipes-support/openobex/files/libusb_crosscompile_check.patch
+++ /dev/null
@@ -1,15 +0,0 @@
-Upstream-Status: Inappropriate [configuration]
-
-Index: openobex-1.5/acinclude.m4
-===================================================================
---- openobex-1.5.orig/acinclude.m4	2009-02-08 18:30:22.000000000 +0000
-+++ openobex-1.5/acinclude.m4	2009-07-31 09:55:46.000000000 +0100
-@@ -158,7 +158,7 @@
- 		;;
- 	*)
- 		PKG_CHECK_MODULES(USB, libusb, usb_lib_found=yes, AC_MSG_RESULT(no))
--		AC_CHECK_FILE(${prefix}/lib/pkgconfig/libusb.pc, REQUIRES="libusb")
-+		REQUIRES="libusb"
- 		;;
- 	esac
- 	AC_SUBST(USB_CFLAGS)
diff --git a/meta-demoapps/recipes-support/openobex/openobex_1.5.bb b/meta-demoapps/recipes-support/openobex/openobex_1.5.bb
deleted file mode 100644
index 397c932..0000000
--- a/meta-demoapps/recipes-support/openobex/openobex_1.5.bb
+++ /dev/null
@@ -1,23 +0,0 @@
-DESCRIPTION = "The Openobex project is an open source implementation of the \
-Object Exchange (OBEX) protocol."
-HOMEPAGE = "http://openobex.triq.net"
-SECTION = "libs"
-PROVIDES = "openobex-apps"
-DEPENDS = "libusb bluez4"
-LICENSE = "GPL"
-PR = "r4"
-
-SRC_URI = "${KERNELORG_MIRROR}/linux/bluetooth/openobex-${PV}.tar.gz \
-           file://disable-cable-test.patch;patch=1 \
-	   file://libusb_crosscompile_check.patch;patch=1"
-
-inherit autotools binconfig pkgconfig
-
-EXTRA_OECONF = "--enable-apps --enable-syslog --enable-dump \
-                --with-usb=${STAGING_LIBDIR}/.. --with-bluez=${STAGING_LIBDIR}/.."
-
-# how to stop shlibrename from renaming -apps?
-PACKAGES += "openobex-apps"
-FILES_${PN} = "${libdir}/lib*.so.*"
-FILES_${PN}-dev += "${bindir}/openobex-config"
-FILES_${PN}-apps = "${bindir}/*"
diff --git a/meta-demoapps/recipes-support/poppler/poppler-data_0.1.bb b/meta-demoapps/recipes-support/poppler/poppler-data_0.1.bb
deleted file mode 100644
index 37a8564..0000000
--- a/meta-demoapps/recipes-support/poppler/poppler-data_0.1.bb
+++ /dev/null
@@ -1,16 +0,0 @@
-DESCRIPTION = "Poppler is a PDF rendering library based on the xpdf-3.0 code base."
-LICENSE = "Adobe"
-PR = "r0"
-
-SRC_URI = "http://poppler.freedesktop.org/${BPN}-${PV}.tar.gz"
-
-do_compile() {
-}
-
-do_install() {
-	oe_runmake install DESTDIR=${D}
-}
-
-FILES_${PN} += "${datadir}"
-PACKAGE_ARCH = "all"
-
diff --git a/meta-demoapps/recipes-support/poppler/poppler-fpu.inc b/meta-demoapps/recipes-support/poppler/poppler-fpu.inc
deleted file mode 100644
index 2fbee13..0000000
--- a/meta-demoapps/recipes-support/poppler/poppler-fpu.inc
+++ /dev/null
@@ -1,6 +0,0 @@
-
-def get_poppler_fpu_setting(bb, d):
-	if d.getVar('TARGET_FPU', 1) in [ 'soft' ]:
-		return "--enable-fixedpoint"
-	return ""
-
diff --git a/meta-demoapps/recipes-support/poppler/poppler.inc b/meta-demoapps/recipes-support/poppler/poppler.inc
deleted file mode 100644
index b534ac2..0000000
--- a/meta-demoapps/recipes-support/poppler/poppler.inc
+++ /dev/null
@@ -1,18 +0,0 @@
-DESCRIPTION = "Poppler is a PDF rendering library based on the xpdf-3.0 code base."
-DEPENDS = "fontconfig jpeg zlib gtk+ cairo"
-LICENSE = "GPL"
-PR = "r1"
-
-SRC_URI = "http://poppler.freedesktop.org/${BPN}-${PV}.tar.gz"
-
-inherit autotools pkgconfig
-
-EXTRA_OECONF = " --enable-xpdf-headers \
-		 --disable-gtk-test \
-		 --disable-poppler-qt --disable-poppler-qt4 \
-		 --enable-zlib \
-	       "
-
-#check for TARGET_FPU=soft and inform configure of the result so it can disable some floating points
-require poppler-fpu.inc
-EXTRA_OECONF += "${@get_poppler_fpu_setting(bb, d)}"
diff --git a/meta-demoapps/recipes-support/poppler/poppler_0.9.2.bb b/meta-demoapps/recipes-support/poppler/poppler_0.9.2.bb
deleted file mode 100644
index 92c25bc..0000000
--- a/meta-demoapps/recipes-support/poppler/poppler_0.9.2.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-require poppler.inc
-PR = "r2"
-- 
1.7.8.6



