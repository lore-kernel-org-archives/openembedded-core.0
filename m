Return-Path: <cazfi74@gmail.com>
Received: from mail-lb0-f178.google.com (mail-lb0-f178.google.com
	[209.85.217.178])
	by mail.openembedded.org (Postfix) with ESMTP id AB18E6D3A4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Oct 2013 18:29:38 +0000 (UTC)
Received: by mail-lb0-f178.google.com with SMTP id o14so2220791lbi.23
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Oct 2013 11:29:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=Wqym45oUosh58F/4s5h2RMjLxJKmTIV7OgTbhnRN0go=;
	b=Wy519v0BR4EzM0uY5Bj1lTJzSTqAXzFp9jz7YlR7brJ28jUqtF70YkETye3Y3NzKFK
	xVsrfbqjCy09jPUTNubJ3GhlVwXdYj9EueKfJM15wkw3AC8vxVGNoxYb5JJwbT0303H0
	aMExWoAQ87EXTHcRiVJLmqzuaeNk+OnKggHdKR+vTMKCrryhvErHkl5UhTHIJjeEIoBG
	eCEl8+mP/x0+HKKD4ccmvc8/MzCfxitVtvUGEqeKmoWKLWfPnbMX7BiUgyk8Vm7sx94L
	RwhHNPfB8HrGJ3sgUYNw3DZNTQI02fgRjvgYRsfXlS6KXIATCR+xkRUCnwVp+EFCE5/T
	nLAg==
X-Received: by 10.152.10.34 with SMTP id f2mr3726lab.64.1382639379465;
	Thu, 24 Oct 2013 11:29:39 -0700 (PDT)
Received: from prime (a91-153-14-158.elisa-laajakaista.fi. [91.153.14.158])
	by mx.google.com with ESMTPSA id l10sm3134285lbh.13.2013.10.24.11.29.37
	for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Thu, 24 Oct 2013 11:29:37 -0700 (PDT)
Received: from cazfi by prime with local (Exim 4.80)
	(envelope-from <cazfi74@gmail.com>)
	id 1VZPf6-0000m8-3O; Thu, 24 Oct 2013 21:29:36 +0300
From: Marko Lindqvist <cazfi74@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 24 Oct 2013 21:29:30 +0300
Message-Id: <cover.1382639156.git.cazfi74@gmail.com>
X-Mailer: git-send-email 1.8.4.rc3
Subject: [PATCH 0/3] Package upgrades
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
X-List-Received-Date: Thu, 24 Oct 2013 18:29:39 -0000

The following changes since commit 843a5dd8f8f0461e286d9fdb3ba55205b4275f88:

  base.bbclass: fix nondeterministic PACKAGECONFIG processing order (2013-10-24 08:38:24 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib cazfi/up
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=cazfi/up

Marko Lindqvist (3):
  gtk+: upgrade gtk+ to upstream version 2.24.22
  cairo: upgrade to upstream version 1.12.16
  harfbuzz: upgrade to upstream version 0.9.22

 ...utton-do-not-prelight-in-touchscreen-mode.patch |  0
 ...Duplicate-the-exec-string-returned-by-gtk.patch |  0
 .../cellrenderer-cairo.patch                       |  0
 .../configure-nm.patch                             |  0
 .../configurefix.patch                             |  0
 .../{gtk+-2.24.20 => gtk+-2.24.22}/doc-fixes.patch |  0
 .../entry-cairo.patch                              |  0
 .../hardcoded_libtool.patch                        |  0
 .../{gtk+-2.24.20 => gtk+-2.24.22}/no-demos.patch  |  0
 .../run-iconcache.patch                            |  0
 .../toggle-font.diff                               |  0
 .../{gtk+-2.24.20 => gtk+-2.24.22}/xsettings.patch |  0
 .../gtk+/{gtk+_2.24.20.bb => gtk+_2.24.22.bb}      |  4 +-
 meta/recipes-graphics/cairo/cairo/png.patch        | 52 ----------------------
 .../cairo/{cairo_1.12.14.bb => cairo_1.12.16.bb}   |  9 ++--
 .../{harfbuzz_0.9.19.bb => harfbuzz_0.9.22.bb}     |  9 ++--
 16 files changed, 8 insertions(+), 66 deletions(-)
 rename meta/recipes-gnome/gtk+/{gtk+-2.24.20 => gtk+-2.24.22}/0001-GtkButton-do-not-prelight-in-touchscreen-mode.patch (100%)
 rename meta/recipes-gnome/gtk+/{gtk+-2.24.20 => gtk+-2.24.22}/0001-bgo-584832-Duplicate-the-exec-string-returned-by-gtk.patch (100%)
 rename meta/recipes-gnome/gtk+/{gtk+-2.24.20 => gtk+-2.24.22}/cellrenderer-cairo.patch (100%)
 rename meta/recipes-gnome/gtk+/{gtk+-2.24.20 => gtk+-2.24.22}/configure-nm.patch (100%)
 rename meta/recipes-gnome/gtk+/{gtk+-2.24.20 => gtk+-2.24.22}/configurefix.patch (100%)
 rename meta/recipes-gnome/gtk+/{gtk+-2.24.20 => gtk+-2.24.22}/doc-fixes.patch (100%)
 rename meta/recipes-gnome/gtk+/{gtk+-2.24.20 => gtk+-2.24.22}/entry-cairo.patch (100%)
 rename meta/recipes-gnome/gtk+/{gtk+-2.24.20 => gtk+-2.24.22}/hardcoded_libtool.patch (100%)
 rename meta/recipes-gnome/gtk+/{gtk+-2.24.20 => gtk+-2.24.22}/no-demos.patch (100%)
 rename meta/recipes-gnome/gtk+/{gtk+-2.24.20 => gtk+-2.24.22}/run-iconcache.patch (100%)
 rename meta/recipes-gnome/gtk+/{gtk+-2.24.20 => gtk+-2.24.22}/toggle-font.diff (100%)
 rename meta/recipes-gnome/gtk+/{gtk+-2.24.20 => gtk+-2.24.22}/xsettings.patch (100%)
 rename meta/recipes-gnome/gtk+/{gtk+_2.24.20.bb => gtk+_2.24.22.bb} (93%)
 delete mode 100644 meta/recipes-graphics/cairo/cairo/png.patch
 rename meta/recipes-graphics/cairo/{cairo_1.12.14.bb => cairo_1.12.16.bb} (87%)
 rename meta/recipes-graphics/harfbuzz/{harfbuzz_0.9.19.bb => harfbuzz_0.9.22.bb} (70%)

-- 
1.8.4.rc3


