Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A52BF5A8A4
	for <webhook@archiver.kernel.org>; Tue, 21 Apr 2026 09:56:33 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20393.1776765389186102840
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Apr 2026 02:56:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=NDvkYScU;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1776765388; x=1808301388;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=buPhyYTAdhonSVo7h8+Wz0FP/AoqJXCpPbtrAs/70FY=;
  b=NDvkYScU757B2QzoWHxa1pkUENWI7Oma7cQH9Uz0EBudCQVITjEXMKnl
   b/l4UI6qMNHMcfvlGmiofOt6Sl3DaZ3qKKs6X69GQAqzWP4f4zWM1YAam
   kYw/vglb4reA+Ip5YQFNoJhW7CfPY9MDbUCCy5y06iUTUZKF+AAbNQ3yp
   EGoFQ5tuscp9DrTT+M4ITwM4cmlBAmJEVsl1PJCS0gUEjQI04u1mK38UK
   MxDHPunJ2iw6Wf2M0rPyvcSOwW3vSPLPf9arvJaUK47lAqD/ua23E7qIc
   /+lMGAC76dTIlAAxX0L4TZcLJT4grQ4mUUl1S2zuNY+hzmdJMnMA1ZrzD
   w==;
X-CSE-ConnectionGUID: zWI3UUSyTX+J/iitckyQ8Q==
X-CSE-MsgGUID: PyaqrmeXQzyRQHR8GFz8TQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="237618303"
X-IronPort-AV: E=Sophos;i="6.23,191,1770562800"; 
   d="scan'208";a="237618303"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2026 18:56:26 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 94E3D1C1C72F
	for <openembedded-core@lists.openembedded.org>; Tue, 21 Apr 2026 09:56:27 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 48555180009F
	for <openembedded-core@lists.openembedded.org>; Tue, 21 Apr 2026 09:56:27 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id E236314002C3;
	Tue, 21 Apr 2026 09:56:24 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 12/49] gtk+3: upgrade 3.24.51 -> 3.24.52
Date: Tue, 21 Apr 2026 17:55:22 +0800
Message-ID: <20260421095559.1856-12-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260421095559.1856-1-wangmy@fujitsu.com>
References: <20260421095559.1856-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Apr 2026 09:56:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235620

From: Wang Mingyu <wangmy@fujitsu.com>

* Bugs fixed:
  - #6306 [GTK3] Zlib required when broadway is enabled.
  - #7796 [GTK 3] Invalid a11y events when calling `gtk_tree_view_set_cursor` on
    an unfocused GtkTreeView
  - #7976 Firefox crashes at gdk_wayland_drag_context_manage_dnd() when missing
    toplevel wl_surface
  - #8103 gtk3 refresh_rate calculation overflows on 32-bit targets
  - #8114 Images for recolored icons are constantly being reloaded
  - GNOME/gimp#14901 Wild strobing in multi window mode
  - GNOME/gimp#15480 GIMP does not focus on dialogue boxes on Mac
  - !7332 quartz: add automagic uti<->mime conversion for clipboard
  - !8216 Fix position of child tooltips in GTK3 custom windows
  - !9005 a11y: Don't send focus-related events for unfocused treeview
  - !9012 quartz: gtkwindow - fix windows fighting focus
  - !9022 gtkmenu: Await more motion events before deactivating on release
  - !9044 wayland: Handle XKB initialization failures gracefully
  - !9067 gdk/win32: Add missing EGL conditional compilation guard
  - !9098 gdk: do not run gdk_wayland_window_export_handle() callback when
    window is already destroyed.
  - !9119 Declare an explicit dependency on zlib when broadway is enabled
  - !9141 [GTK 3] wayland: Try to open the display even if XDG_RUNTIME_DIR is
    unset
  - !9155 [gtk3] emoji: Update data to CLDR 48
  - !9214 display/wayland: Gracefully handle dispose being called twice
  - !9284 gdk/wayland: Map stylus buttons for BTN_BACK and BTN_FORWARD (Peter
    Hutterer)
  - !9322 [Quartz] Fix dialog keyboard focus while preventing focus fighting
  - !9344 Fix a couple of leaks
  - !9394 gdk/wayland: Map stylus buttons for BTN_BACK and BTN_FORWARD
  - !9397 wayland: Avoid a crash
  - !9600 Replace outdated freedesktop.org Window Manager spec links
  - !9676 x11: fix overflow in refresh_rate calculation on 32-bit systems
  - !9706 cssimage: Store and reuse icon info for recolored images
  - !9707 wayland: Fix uninitialized value when no cursor
  - !9708 fontchooser: Fix signedness of axes count
  - !9709 fontchooser: Remove const on float return values
  - !9710 print: Remove unused variable

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-gnome/gtk+/{gtk+3_3.24.51.bb => gtk+3_3.24.52.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/gtk+/{gtk+3_3.24.51.bb => gtk+3_3.24.52.bb} (98%)

diff --git a/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb b/meta/recipes-gnome/gtk+/gtk+3_3.24.52.bb
similarity index 98%
rename from meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb
rename to meta/recipes-gnome/gtk+/gtk+3_3.24.52.bb
index 51a293c1d8..1fcc08443d 100644
--- a/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb
+++ b/meta/recipes-gnome/gtk+/gtk+3_3.24.52.bb
@@ -22,7 +22,7 @@ inherit gettext gnomebase gtk-doc update-alternatives gtk-immodules-cache gsetti
 SRC_URI += "\
            file://opengl.patch \
            "
-SRC_URI[archive.sha256sum] = "0013877c6bd23c2dbe42ad7c70a053d0e449be66736574e37867c49c5f905a4f"
+SRC_URI[archive.sha256sum] = "80931fa472a77b9a164f6740e3c0b444fac6770054632d35a7ff9d679e5e7b9f"
 
 BBCLASSEXTEND = "native nativesdk"
 
-- 
2.43.0


