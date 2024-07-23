Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 258B2C49EA1
	for <webhook@archiver.kernel.org>; Tue, 23 Jul 2024 13:13:42 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web10.43671.1721740414735454141
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jul 2024 06:13:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=Y7o444Qm;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.54, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-2cb566d528aso3444139a91.1
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Jul 2024 06:13:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1721740414; x=1722345214; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Tfd20jk+9uidFpJHNYH7g7yRGLzfJndS6fU2D+/+vrY=;
        b=Y7o444QmcWXEALY9w4/aAPzS3g5WVNh2dvtMUpzXXPB/gimmCdXctcorbkUo4q7+FG
         jkyTfqSEhiTxZ9P+zBEjVknJfVuAYVXhQDphS1QQkw9O6N7uoh9TyxfNTgOdlf/ThF9m
         OGXfXNFpLLA69oRVmJlvI6GyrqsIkaMkbFD00iUiefPiIOzFA3gwCHA7059HR6fraJIp
         i/ehCCSby1icdZnCW8wwD95XDeeOoOZuCGzZLOjH+cdo32+T46F5lV/KOTCyE2vPsfF2
         Mz8EYvZyvOHb25ZVbtr1JzNOZfUOFtvpBjM4l/5XBs7S1e39AtlYyM+JW1ROv3LCpR76
         3REw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721740414; x=1722345214;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Tfd20jk+9uidFpJHNYH7g7yRGLzfJndS6fU2D+/+vrY=;
        b=IRUUF7SCZaIEldSjgIFi6PBGi7Z8yXgzU69FcqRF+ICR6KMsQFh/kuFqNu/J5LIaYj
         ch545oMGHTsJifXj+vnJpyC1/PVkTCXPSFdnqvK6k0V5uIkSCi8FZ+nlcl2C1MEon8k9
         ZUD1F0zh9d+evAPxiEIB/dxwSpLo76+29UIy0LIxTC0qXU81E7JrSofvVZZTuxu5g/s9
         VGxLtxcd5hOsB6EQE+nwnuiwQF7HPYvVMN9qnULYtzDlD1tOWBMK0L7LnU1crM0nPEE1
         /cZ8s9iBbUFdcwacY2n6f6Hqp9U8eTT4Ap/WSmgc4T+/sihLiRtmYSTC++8DQ3xfazzE
         MNYw==
X-Gm-Message-State: AOJu0YzuJ+mlX4yXVLy++2I7Go23zTTDYeNWWcc6YjDrKScQBktGAWto
	gpvLQW1QWGJPGQrUTwY49+07rUlUKNMPfxZKJ7XAr6cGfRoUjwp/0EAS4ZjnW3OmdQkilh4bItA
	3X04=
X-Google-Smtp-Source: AGHT+IFBYZFemjecSyXJpVwww04p3b9sBxWqRVlLLqMYqgn4BNMKeI/LSzo5DPc0Wqg1Iaarn+XfXg==
X-Received: by 2002:a17:90b:3908:b0:2c8:f3b7:ec45 with SMTP id 98e67ed59e1d1-2cd274aa68bmr8464363a91.36.1721740413941;
        Tue, 23 Jul 2024 06:13:33 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2cb7754a888sm10091540a91.57.2024.07.23.06.13.33
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jul 2024 06:13:33 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 06/17] libadwaita: update 1.5.0 -> 1.5.1
Date: Tue, 23 Jul 2024 06:13:05 -0700
Message-Id: <497383a38b76deff6d800a1f3d3e9355ee6335ce.1721740245.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1721740245.git.steve@sakoman.com>
References: <cover.1721740245.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Jul 2024 13:13:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202351

From: Markus Volk <f_l_k@t-online.de>

=============
Version 1.5.1
=============

- AdwAboutDialog/Window
  - Fix an outdated appstream reference in docs
- AdwActionRow
  - Mention .property in docs
- AdwAlertDialog
  - Fix the accessible role
  - Fix initial focus
- AdwAvatar
  - Fix portrait avatars on hidpi
- AdwBin
  - Fix a potential focus issue
- AdwBreakpoint
  - Fix add_setter() annotations
- AdwCarousel
  - Fix a build warning
- AdwComboRow
  - Fix initial checkmark
  - Handle model changes properly
- AdwDialog
  - Fix accessibility warnings
  - Make shortcuts work when there are no focusable widgets
  - Correctly restore focus when opening a dialog from a menu
  - Fix GtkWindow:deletable=false hiding close buttons in dialogs
- AdwExpanderRow
  - Fix get_title_lines() and get_subtitle_lines() return types
  - Fix remove() docs
- AdwOverlaySplitView
  - Unmap sidebar when it's hidden
- AdwPreferencesGroup
  - Fix a potential focus issue
  - Fix :header-group annotations and notifications
- AdwPreferencesPage
  - Fix a potential focus issue
- AdwTabView
  - Document :close-page return value
  - Fix a leak when closing the last page
- AdwViewStack
  - Fix a typo in docs
- Docs
  - Update screenshots
- Stylesheet
  - Fix entry progress bars
- Add missing return annotations
- Translation updates
  - Brazilian Portuguese
  - Hindi
  - Kabyle
  - Portuguese
  - Slovak

Signed-off-by: Markus Volk <f_l_k@t-online.de>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 301470de9a1a6a44de9a3d7c815e86dba162da68)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libadwaita/{libadwaita_1.5.0.bb => libadwaita_1.5.1.bb}    | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-gnome/libadwaita/{libadwaita_1.5.0.bb => libadwaita_1.5.1.bb} (88%)

diff --git a/meta/recipes-gnome/libadwaita/libadwaita_1.5.0.bb b/meta/recipes-gnome/libadwaita/libadwaita_1.5.1.bb
similarity index 88%
rename from meta/recipes-gnome/libadwaita/libadwaita_1.5.0.bb
rename to meta/recipes-gnome/libadwaita/libadwaita_1.5.1.bb
index b0b1e4502a..6cb67c0db0 100644
--- a/meta/recipes-gnome/libadwaita/libadwaita_1.5.0.bb
+++ b/meta/recipes-gnome/libadwaita/libadwaita_1.5.1.bb
@@ -3,7 +3,6 @@ HOMEPAGE = "https://gitlab.gnome.org/GNOME/libadwaita"
 LICENSE="LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
-
 DEPENDS = " \
     gtk4 \
     appstream \
@@ -11,7 +10,7 @@ DEPENDS = " \
 
 inherit gnomebase gobject-introspection gi-docgen vala features_check
 
-SRC_URI[archive.sha256sum] = "fd92287df9bb95c963654fb6e70d3e082e2bcb37b147e0e3c905567167993783"
+SRC_URI[archive.sha256sum] = "7f144c5887d6dd2d99517c00fd42395ee20abc13ce55958a4fda64e6d7e473f8"
 
 ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 REQUIRED_DISTRO_FEATURES = "opengl"
-- 
2.34.1


