Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B412CC43334
	for <webhook@archiver.kernel.org>; Tue, 21 Jun 2022 20:21:46 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 by mx.groups.io with SMTP id smtpd.web09.48704.1655842896887071601
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jun 2022 13:21:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=BImF/nWZ;
 spf=pass (domain: gmail.com, ip: 209.85.167.41,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f41.google.com with SMTP id a2so24252556lfg.5
        for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jun 2022 13:21:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=6FUzEOlmonkW95scGqjBmOh0a+lssiR/v2oPuYuCTMw=;
        b=BImF/nWZhQidApayGtKPD06QxgvrPEN0MFMiTQWCZto0fe5DF/+qGEo560b8rme/AZ
         gHkOd2s+WRRehtNA+03g+3OR1/yu3xswRhYPqUENcsWj355qk3pfOt8cObBU4za1m9zy
         k+uDN+nqZZ8i7aXhOSqYUyClf+E3pqftUU4skiBrzGzyZ+6hcsp6xsC6xQ4hxoQFf1Bb
         N5XfXR4CY2I8hWIviZRh5uypitMhV7X0dKwBQjJ7IhrrwbxPDtiRanR9ssDkCtu27KQg
         +ZMlMt7Ts6ZRA0rXi02fmJIJcerkdQHZCOdmXSeVABAUO+MY6LDokwHxkePfPg+MAPx9
         s3yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=6FUzEOlmonkW95scGqjBmOh0a+lssiR/v2oPuYuCTMw=;
        b=wuEwVbMfp5G55WBl+DHXOkKG6oT4o0xf8pAXT3rIKzJHi/XWCX0eci0rFqKLJBiCSw
         hBvRoUV3iVSJB0i1j/1NSlCLM6kNNNE9zfd49IFn9RlQfcIcv11XUV3FhY3e7HfP6Bff
         mg7TznEkxhc1s3T5wnqvKdyN/aymuglW4LuZuzZDreGBEHO8bjKwLQkm9iF0VrD2foMO
         dxRoQEnwaxKk/MYnr0NUPLKTBA5iXSoH8Mj8O7ZflJsPJVqLov0rexC/GKrL65akdv0N
         KDzjUg6kJBLeVx+4obWqdkLAHUjbDWDBBi+4S352AARzXjxA7X2UztUtHKzKM1Aos9WZ
         Qczw==
X-Gm-Message-State: AJIora+RQkGvIg/qdra2xQmsN/a3ouLv0kyzXEPjfXFnciKxLDQnbueK
	TttgO4E9YntY+Tw23MiTO5wlblHAJbxpc9ELFAu/4iVUYNg=
X-Google-Smtp-Source: 
 AGRyM1v40bNQcMgFzwqIhplVzUxeFhi445tS/emSOyl4qmn8BHws0270BNyGqGIkC2MSLF1Zjm7hnbjA4SmhhjtH+Ys=
X-Received: by 2002:ac2:5597:0:b0:47f:8d1d:c63d with SMTP id
 v23-20020ac25597000000b0047f8d1dc63dmr1803242lfg.521.1655842895007; Tue, 21
 Jun 2022 13:21:35 -0700 (PDT)
MIME-Version: 1.0
References: <16FABC13C4B68DCC.617@lists.openembedded.org>
In-Reply-To: <16FABC13C4B68DCC.617@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 21 Jun 2022 22:21:23 +0200
Message-ID: 
 <CANNYZj9vtWjFiOK47e09-RfqU0Qjm9y5+LW1fgppR_N-VksTcw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 01/18] sato: work around missing icons in
 adwaita 42.0
To: OE-core <openembedded-core@lists.openembedded.org>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Jun 2022 20:21:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167187

I know there are concerns about the visual regression this causes,
please take this as a reminder to finish up an alternative solution -
or let's just merge this as sato has more or less reached the end of
its active life.

Alex

On Tue, 21 Jun 2022 at 22:16, Alexander Kanavin via
lists.openembedded.org <alex.kanavin=gmail.com@lists.openembedded.org>
wrote:
>
> adwaita icon theme upstream has done significant trimming around app category icons
> (fullcolour versions gone completely, 'symbolic' b&w versions still around but marked
> as legacy). Going forward, apps would need to provide their own icons. Given that
> sato is likely to be deprecated in favour of wayland/weston rather soon, let's use
> the symbolic icons for now.
>
> [YOCTO #14782]
>
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---
>  .../gstreamer/gst-examples/gst-player.desktop |  2 +-
>  ...sktop-update-icon-to-one-available-i.patch | 25 ++++++++++++++++++
>  .../matchbox-config-gtk_0.2.bb                |  4 ++-
>  ...ile.c-use-view-refresh-symbolic-icon.patch | 26 +++++++++++++++++++
>  .../matchbox-desktop/matchbox-desktop_2.2.bb  |  1 +
>  ...l.desktop-use-an-icon-available-in-a.patch | 25 ++++++++++++++++++
>  .../matchbox-terminal_0.2.bb                  |  4 ++-
>  meta/recipes-sato/puzzles/puzzles_git.bb      |  2 +-
>  .../rxvt-unicode/rxvt-unicode/rxvt.desktop    |  2 +-
>  .../shutdown-desktop/shutdown.desktop         |  2 +-
>  10 files changed, 87 insertions(+), 6 deletions(-)
>  create mode 100644 meta/recipes-sato/matchbox-config-gtk/files/0001-mb-appearance.desktop-update-icon-to-one-available-i.patch
>  create mode 100644 meta/recipes-sato/matchbox-desktop/files/0001-taku-launcher-tile.c-use-view-refresh-symbolic-icon.patch
>  create mode 100644 meta/recipes-sato/matchbox-terminal/matchbox-terminal/0001-matchbox-terminal.desktop-use-an-icon-available-in-a.patch
>
> diff --git a/meta/recipes-multimedia/gstreamer/gst-examples/gst-player.desktop b/meta/recipes-multimedia/gstreamer/gst-examples/gst-player.desktop
> index 7ddd456a1e..a5df5c9c84 100644
> --- a/meta/recipes-multimedia/gstreamer/gst-examples/gst-player.desktop
> +++ b/meta/recipes-multimedia/gstreamer/gst-examples/gst-player.desktop
> @@ -1,7 +1,7 @@
>  [Desktop Entry]
>  Name=Media Player
>  Comment=Basic media player
> -Icon=multimedia-player
> +Icon=multimedia-player-symbolic
>  TryExec=gtk-play
>  Exec=gtk-play
>  StartupNotify=true
> diff --git a/meta/recipes-sato/matchbox-config-gtk/files/0001-mb-appearance.desktop-update-icon-to-one-available-i.patch b/meta/recipes-sato/matchbox-config-gtk/files/0001-mb-appearance.desktop-update-icon-to-one-available-i.patch
> new file mode 100644
> index 0000000000..7e75fdab9a
> --- /dev/null
> +++ b/meta/recipes-sato/matchbox-config-gtk/files/0001-mb-appearance.desktop-update-icon-to-one-available-i.patch
> @@ -0,0 +1,25 @@
> +From ab2c716bb0679a67dc6b0878ef750d3fdd29edb7 Mon Sep 17 00:00:00 2001
> +From: Alexander Kanavin <alex@linutronix.de>
> +Date: Wed, 13 Apr 2022 22:19:11 +0200
> +Subject: [PATCH] mb-appearance.desktop: update icon to one available in
> + adwaita 42.0
> +
> +Upstream-Status: Inappropriate [apps need their own icons as of 42.0]
> +Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> +---
> + appearance/mb-appearance.desktop | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/appearance/mb-appearance.desktop b/appearance/mb-appearance.desktop
> +index 4db2bbc..cfa5142 100644
> +--- a/appearance/mb-appearance.desktop
> ++++ b/appearance/mb-appearance.desktop
> +@@ -2,7 +2,7 @@
> + Name=Appearance
> + Comment=Change the appearance
> + Exec=matchbox-appearance
> +-Icon=preferences-desktop-theme
> ++Icon=preferences-desktop-appearance-symbolic
> + Terminal=false
> + Type=Application
> + Categories=GTK;Settings;DesktopSettings;
> diff --git a/meta/recipes-sato/matchbox-config-gtk/matchbox-config-gtk_0.2.bb b/meta/recipes-sato/matchbox-config-gtk/matchbox-config-gtk_0.2.bb
> index d951baf361..c91f9a7cc2 100644
> --- a/meta/recipes-sato/matchbox-config-gtk/matchbox-config-gtk_0.2.bb
> +++ b/meta/recipes-sato/matchbox-config-gtk/matchbox-config-gtk_0.2.bb
> @@ -12,7 +12,9 @@ RDEPENDS:${PN} = "settings-daemon"
>  # SRCREV tagged 0.2
>  SRCREV = "ef2192ce98d9374ffdad5f78544c3f8f353c16aa"
>  SRC_URI = "git://git.yoctoproject.org/${BPN};branch=master \
> -           file://no-handed.patch"
> +           file://no-handed.patch \
> +           file://0001-mb-appearance.desktop-update-icon-to-one-available-i.patch \
> +           "
>  UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>(\d+(\.\d+)+))"
>
>  S = "${WORKDIR}/git"
> diff --git a/meta/recipes-sato/matchbox-desktop/files/0001-taku-launcher-tile.c-use-view-refresh-symbolic-icon.patch b/meta/recipes-sato/matchbox-desktop/files/0001-taku-launcher-tile.c-use-view-refresh-symbolic-icon.patch
> new file mode 100644
> index 0000000000..7a4db83da2
> --- /dev/null
> +++ b/meta/recipes-sato/matchbox-desktop/files/0001-taku-launcher-tile.c-use-view-refresh-symbolic-icon.patch
> @@ -0,0 +1,26 @@
> +From 764201dff04a7ca1c3862357ea485a6fc624dd00 Mon Sep 17 00:00:00 2001
> +From: Alexander Kanavin <alex@linutronix.de>
> +Date: Wed, 13 Apr 2022 22:01:30 +0200
> +Subject: [PATCH] taku-launcher-tile.c: use view-refresh-symbolic icon
> +
> +Plain view-refresh is no longer provided in latest adwaita icon theme.
> +
> +Upstream-Status: Inappropriate [apps need their own icons as of 42.0]
> +Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> +---
> + libtaku/taku-launcher-tile.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/libtaku/taku-launcher-tile.c b/libtaku/taku-launcher-tile.c
> +index e7f58f3..8bbf2f7 100644
> +--- a/libtaku/taku-launcher-tile.c
> ++++ b/libtaku/taku-launcher-tile.c
> +@@ -185,7 +185,7 @@ taku_launcher_tile_new_from_item (TakuMenuItem *item)
> +   taku_icon_tile_set_secondary (TAKU_ICON_TILE (tile),
> +                                 taku_menu_item_get_description (item));
> +   taku_icon_tile_set_pixbuf (TAKU_ICON_TILE (tile),
> +-                             get_icon ("view-refresh", size));
> ++                             get_icon ("view-refresh-symbolic", size));
> +
> +   /* Don't need to update the icon here, because we'll get a style-set signal
> +      when the widget is realised which will update the icon. */
> diff --git a/meta/recipes-sato/matchbox-desktop/matchbox-desktop_2.2.bb b/meta/recipes-sato/matchbox-desktop/matchbox-desktop_2.2.bb
> index b05a9c48ad..c306aba6ec 100644
> --- a/meta/recipes-sato/matchbox-desktop/matchbox-desktop_2.2.bb
> +++ b/meta/recipes-sato/matchbox-desktop/matchbox-desktop_2.2.bb
> @@ -15,6 +15,7 @@ SECTION = "x11/wm"
>  SRCREV = "6bc67d09da4147e5552fe30011a05a2c59d2f777"
>  SRC_URI = "git://git.yoctoproject.org/${BPN}-2;branch=master \
>             file://vfolders/ \
> +           file://0001-taku-launcher-tile.c-use-view-refresh-symbolic-icon.patch \
>             "
>
>  EXTRA_OECONF = "--enable-startup-notification --with-dbus"
> diff --git a/meta/recipes-sato/matchbox-terminal/matchbox-terminal/0001-matchbox-terminal.desktop-use-an-icon-available-in-a.patch b/meta/recipes-sato/matchbox-terminal/matchbox-terminal/0001-matchbox-terminal.desktop-use-an-icon-available-in-a.patch
> new file mode 100644
> index 0000000000..48987f9d31
> --- /dev/null
> +++ b/meta/recipes-sato/matchbox-terminal/matchbox-terminal/0001-matchbox-terminal.desktop-use-an-icon-available-in-a.patch
> @@ -0,0 +1,25 @@
> +From ec16ba4a1cb0e4217910a1b36783f00828bb5dfc Mon Sep 17 00:00:00 2001
> +From: Alexander Kanavin <alex@linutronix.de>
> +Date: Wed, 13 Apr 2022 22:24:50 +0200
> +Subject: [PATCH] matchbox-terminal.desktop: use an icon available in adwaita
> + 42.0
> +
> +Upstream-Status: Inappropriate [apps need their own icons as of 42.0]
> +Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> +---
> + matchbox-terminal.desktop | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/matchbox-terminal.desktop b/matchbox-terminal.desktop
> +index c84a24c..fedaf10 100644
> +--- a/matchbox-terminal.desktop
> ++++ b/matchbox-terminal.desktop
> +@@ -3,7 +3,7 @@ Type=Application
> + Name=Terminal
> + Comment=When all else fails.
> + Exec=matchbox-terminal
> +-Icon=utilities-terminal
> ++Icon=utilities-terminal-symbolic
> + Terminal=false
> + Categories=GTK;Utility;
> + StartupNotify=true
> diff --git a/meta/recipes-sato/matchbox-terminal/matchbox-terminal_0.2.bb b/meta/recipes-sato/matchbox-terminal/matchbox-terminal_0.2.bb
> index 802ffa971b..048e247b89 100644
> --- a/meta/recipes-sato/matchbox-terminal/matchbox-terminal_0.2.bb
> +++ b/meta/recipes-sato/matchbox-terminal/matchbox-terminal_0.2.bb
> @@ -11,7 +11,9 @@ SECTION = "x11/utils"
>
>  #SRCREV tagged 0.2
>  SRCREV = "161276d0f5d1be8187010fd0d9581a6feca70ea5"
> -SRC_URI = "git://git.yoctoproject.org/${BPN};branch=master"
> +SRC_URI = "git://git.yoctoproject.org/${BPN};branch=master \
> +           file://0001-matchbox-terminal.desktop-use-an-icon-available-in-a.patch \
> +           "
>  UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>(\d+(\.\d+)+))"
>
>  S = "${WORKDIR}/git"
> diff --git a/meta/recipes-sato/puzzles/puzzles_git.bb b/meta/recipes-sato/puzzles/puzzles_git.bb
> index 0104f2672a..6f038cc475 100644
> --- a/meta/recipes-sato/puzzles/puzzles_git.bb
> +++ b/meta/recipes-sato/puzzles/puzzles_git.bb
> @@ -37,7 +37,7 @@ do_install:append () {
>  [Desktop Entry]
>  Name=$title
>  Exec=${bindir}/$prog
> -Icon=applications-games
> +Icon=applications-games-symbolic
>  Terminal=false
>  Type=Application
>  Categories=Game;
> diff --git a/meta/recipes-sato/rxvt-unicode/rxvt-unicode/rxvt.desktop b/meta/recipes-sato/rxvt-unicode/rxvt-unicode/rxvt.desktop
> index 6b7978afc9..84a8ba7dc5 100644
> --- a/meta/recipes-sato/rxvt-unicode/rxvt-unicode/rxvt.desktop
> +++ b/meta/recipes-sato/rxvt-unicode/rxvt-unicode/rxvt.desktop
> @@ -3,7 +3,7 @@ Version=1.0
>  Name=Terminal
>  Comment=A unicode capable rxvt clone
>  Exec=rxvt
> -Icon=utilities-terminal
> +Icon=utilities-terminal-symbolic
>  Terminal=false
>  Type=Application
>  Categories=Utility;TerminalEmulator;
> diff --git a/meta/recipes-sato/shutdown-desktop/shutdown-desktop/shutdown.desktop b/meta/recipes-sato/shutdown-desktop/shutdown-desktop/shutdown.desktop
> index 662659afc2..bc437ca2de 100644
> --- a/meta/recipes-sato/shutdown-desktop/shutdown-desktop/shutdown.desktop
> +++ b/meta/recipes-sato/shutdown-desktop/shutdown-desktop/shutdown.desktop
> @@ -4,7 +4,7 @@ Type=Application
>  Name=Shutdown
>  Comment=Close down the machine safely
>  Exec=poweroff
> -Icon=system-shutdown
> +Icon=system-shutdown-symbolic
>  Terminal=false
>  Categories=Utility;
>  StartupNotify=true
> --
> 2.30.2
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#167169): https://lists.openembedded.org/g/openembedded-core/message/167169
> Mute This Topic: https://lists.openembedded.org/mt/91908378/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

