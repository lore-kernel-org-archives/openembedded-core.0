Received: from mail-lb0-f176.google.com ([209.85.217.176])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cazfi74@gmail.com>) id 1U5ani-0006gd-TR
	for openembedded-core@lists.openembedded.org;
	Wed, 13 Feb 2013 12:47:25 +0100
Received: by mail-lb0-f176.google.com with SMTP id s4so851871lbc.21
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Feb 2013 03:30:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=9CC4fk+siXn51qeTJYUkqUi22x4Gyo/1xW1I+1rMbh0=;
	b=CM0c5dSiOwhLMa78iIX5zbDE/wIQ/8YQFPcvjZLQTyN4R7Ru5bZ0JZeon/CJn6keuD
	XyY2L2fCKe9MdnGBXs8e/qcbTc1K7Fn32lM7XQyaAOjpxQHdE6VUfLC9U5AIZolEfh/X
	RMPB4mIuL0woGZu7pXlQOkIMpl1XNZTQE9xtFNeMxyAOoYwefw878zVz9WrbEscEtxT1
	fMXxinqLCT9cLjclDxBzv0cPudwbbWODE1V9BCQW5aFkAAgaZ4H8ebMVl0O1rCOohDGQ
	EFgJHoowBsUjTTHZFtF6aHE8Fpmur1tNDWAqyKhXdxEiHBbIl+guJ/bxieOx7Nv0qNng
	Lsgg==
X-Received: by 10.152.123.194 with SMTP id mc2mr19890833lab.7.1360755057739;
	Wed, 13 Feb 2013 03:30:57 -0800 (PST)
Received: from prime (a91-153-5-47.elisa-laajakaista.fi. [91.153.5.47])
	by mx.google.com with ESMTPS id fz16sm6387798lab.5.2013.02.13.03.30.54
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Wed, 13 Feb 2013 03:30:56 -0800 (PST)
Received: from cazfi by prime with local (Exim 4.80)
	(envelope-from <cazfi74@gmail.com>)
	id 1U5aY9-0001ul-Qy; Wed, 13 Feb 2013 13:30:53 +0200
From: Marko Lindqvist <cazfi74@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 13 Feb 2013 13:30:52 +0200
Message-Id: <cover.1360754857.git.cazfi74@gmail.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH 0/4] Updates to new upstream versions
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
X-List-Received-Date: Wed, 13 Feb 2013 11:47:34 -0000

Some updates to newer upstream versions. No major version
bumps, just newer bugfix versions.


 - ML

The following changes since commit c58e6cf352774e147038e6543ac95ab0060f2327:

  distro_check: Remove creation of empty Meego filelist. (2013-02-12 13:22:14 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib cazfi/up
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=cazfi/up

Marko Lindqvist (4):
  webkit-gtk: update to upstream version 1.8.3
  gtk+: update to upstream version 2.24.15
  harfbuzz: update to upstream version 0.9.12
  libpng: update to upstream version 1.5.14

 .../gtk+/gtk+-2.24.14/hardcoded_libtool.patch      |   33 -
 .../gtk+-2.24.14/obsolete_automake_macros.patch    |   23 -
 ...utton-do-not-prelight-in-touchscreen-mode.patch |    0
 ...Duplicate-the-exec-string-returned-by-gtk.patch |    0
 .../cellrenderer-cairo.patch                       |    0
 .../configure-nm.patch                             |   11 +-
 .../configurefix.patch                             |    0
 .../{gtk+-2.24.14 => gtk+-2.24.15}/doc-fixes.patch |    0
 .../entry-cairo.patch                              |    0
 .../gtk+/gtk+-2.24.15/hardcoded_libtool.patch      | 1814 ++++++++++++++++++++
 .../{gtk+-2.24.14 => gtk+-2.24.15}/no-demos.patch  |    0
 .../run-iconcache.patch                            |    0
 .../toggle-font.diff                               |    0
 .../{gtk+-2.24.14 => gtk+-2.24.15}/xsettings.patch |    0
 .../gtk+/{gtk+_2.24.14.bb => gtk+_2.24.15.bb}      |    7 +-
 .../avoid_double_version_h.patch                   |    0
 .../disable_graphite.patch                         |    0
 .../{harfbuzz_0.9.10.bb => harfbuzz_0.9.12.bb}     |    8 +-
 .../libpng-1.5.13/obsolete_automake_macros.patch   |   15 -
 .../libpng/{libpng_1.5.13.bb => libpng_1.5.14.bb}  |   11 +-
 .../{webkit-gtk_1.8.2.bb => webkit-gtk_1.8.3.bb}   |    6 +-
 21 files changed, 1837 insertions(+), 91 deletions(-)
 delete mode 100644 meta/recipes-gnome/gtk+/gtk+-2.24.14/hardcoded_libtool.patch
 delete mode 100644 meta/recipes-gnome/gtk+/gtk+-2.24.14/obsolete_automake_macros.patch
 rename meta/recipes-gnome/gtk+/{gtk+-2.24.14 => gtk+-2.24.15}/0001-GtkButton-do-not-prelight-in-touchscreen-mode.patch (100%)
 rename meta/recipes-gnome/gtk+/{gtk+-2.24.14 => gtk+-2.24.15}/0001-bgo-584832-Duplicate-the-exec-string-returned-by-gtk.patch (100%)
 rename meta/recipes-gnome/gtk+/{gtk+-2.24.14 => gtk+-2.24.15}/cellrenderer-cairo.patch (100%)
 rename meta/recipes-gnome/gtk+/{gtk+-2.24.14 => gtk+-2.24.15}/configure-nm.patch (50%)
 rename meta/recipes-gnome/gtk+/{gtk+-2.24.14 => gtk+-2.24.15}/configurefix.patch (100%)
 rename meta/recipes-gnome/gtk+/{gtk+-2.24.14 => gtk+-2.24.15}/doc-fixes.patch (100%)
 rename meta/recipes-gnome/gtk+/{gtk+-2.24.14 => gtk+-2.24.15}/entry-cairo.patch (100%)
 create mode 100644 meta/recipes-gnome/gtk+/gtk+-2.24.15/hardcoded_libtool.patch
 rename meta/recipes-gnome/gtk+/{gtk+-2.24.14 => gtk+-2.24.15}/no-demos.patch (100%)
 rename meta/recipes-gnome/gtk+/{gtk+-2.24.14 => gtk+-2.24.15}/run-iconcache.patch (100%)
 rename meta/recipes-gnome/gtk+/{gtk+-2.24.14 => gtk+-2.24.15}/toggle-font.diff (100%)
 rename meta/recipes-gnome/gtk+/{gtk+-2.24.14 => gtk+-2.24.15}/xsettings.patch (100%)
 rename meta/recipes-gnome/gtk+/{gtk+_2.24.14.bb => gtk+_2.24.15.bb} (92%)
 rename meta/recipes-graphics/harfbuzz/{harfbuzz-0.9.10 => harfbuzz-0.9.12}/avoid_double_version_h.patch (100%)
 rename meta/recipes-graphics/harfbuzz/{harfbuzz-0.9.10 => harfbuzz-0.9.12}/disable_graphite.patch (100%)
 rename meta/recipes-graphics/harfbuzz/{harfbuzz_0.9.10.bb => harfbuzz_0.9.12.bb} (82%)
 delete mode 100644 meta/recipes-multimedia/libpng/libpng-1.5.13/obsolete_automake_macros.patch
 rename meta/recipes-multimedia/libpng/{libpng_1.5.13.bb => libpng_1.5.14.bb} (47%)
 rename meta/recipes-sato/webkit/{webkit-gtk_1.8.2.bb => webkit-gtk_1.8.3.bb} (97%)

-- 
1.7.10.4



