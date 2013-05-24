Return-Path: <cazfi74@gmail.com>
Received: from mail-la0-f41.google.com (mail-la0-f41.google.com
	[209.85.215.41])
	by mail.openembedded.org (Postfix) with ESMTP id D3676621E1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 May 2013 07:58:40 +0000 (UTC)
Received: by mail-la0-f41.google.com with SMTP id ee20so4163682lab.14
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 May 2013 00:58:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=4FkJlFlh8zocKA4jsFMA/JnYAwaHlViILsqbsgM1paA=;
	b=U6Axm+saRzlENQvHl2Kb4sdSwHa0tUQ9XBY/H8W1DatvdVVVSelzU8PMm624A2Tw+c
	WKwWZchjSocBE7FY4iO8tfl8WjnsHz/MLsdxxUCM0rNAuHg/DQyzOtWsd72gr+XNHkqK
	QwB3CllCPJMMNEmHhuWG4my52w7v1lBqmQJYMLOXUGptU9x3dcIyIFhLFihYl7I26kpe
	MtYjdcV3hytD+7aXjo26DEN8WbNhkHGQXBvjTaU6V60QflUBcf+KXuj0gPW+51Dtz8jW
	jPn+83aX8l+GivS9PPGxbwvzaZYmHQN2WRV66ZneLMkuevokiHJ2+CnI9qzwvnDVa5Nj
	f1nw==
X-Received: by 10.112.169.37 with SMTP id ab5mr8255806lbc.25.1369382320037;
	Fri, 24 May 2013 00:58:40 -0700 (PDT)
Received: from prime (a91-153-5-47.elisa-laajakaista.fi. [91.153.5.47])
	by mx.google.com with ESMTPSA id z10sm6072732lbv.14.2013.05.24.00.58.38
	for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 24 May 2013 00:58:39 -0700 (PDT)
Received: from cazfi by prime with local (Exim 4.80)
	(envelope-from <cazfi74@gmail.com>)
	id 1UfmtZ-0005AN-8S; Fri, 24 May 2013 10:58:37 +0300
From: Marko Lindqvist <cazfi74@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 24 May 2013 10:58:35 +0300
Message-Id: <cover.1369381416.git.cazfi74@gmail.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH 0/5] Low-hanging updates
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
X-List-Received-Date: Fri, 24 May 2013 07:58:41 -0000

This is set of simple package updates.

HarfBuzz update drops avoid_double_version_h.patch rather
than tries to update it. The code in question has changed
so that I think original problem addressed by the patch is
no longer present, and patch instead would remove the only
remaining installation of required header (pango build was
failing when I tested with the patch still present). I
cannot be absolutely sure though, as I've never been able
to reproduce the original problem - race condition in
installing hb-version.h twice, probably in highly parallel
build - myself.


 - ML

The following changes since commit 835b64d4e9ed7b627b56a75d529f1a403c5db1a8:

  buildhistory: Sync with bitbake changes (2013-05-23 11:49:43 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib cazfi/up
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=cazfi/up

Marko Lindqvist (5):
  freetype: update to upstream version 2.4.12
  harfbuzz: update to upstream version 0.9.17
  gtk+: update to upstream version 2.24.18
  curl: update to upstream version 7.30.0
  zlib: update to upstream version 1.2.8

 .../remove.ldconfig.call.patch                     |    0
 .../zlib/{zlib_1.2.7.bb => zlib_1.2.8.bb}          |   11 +-
 ...utton-do-not-prelight-in-touchscreen-mode.patch |    0
 ...Duplicate-the-exec-string-returned-by-gtk.patch |    0
 .../cellrenderer-cairo.patch                       |    0
 .../configure-nm.patch                             |    0
 .../configurefix.patch                             |    0
 .../{gtk+-2.24.15 => gtk+-2.24.18}/doc-fixes.patch |    0
 .../entry-cairo.patch                              |    0
 .../hardcoded_libtool.patch                        |    0
 .../{gtk+-2.24.15 => gtk+-2.24.18}/no-demos.patch  |    0
 .../run-iconcache.patch                            |    0
 .../toggle-font.diff                               |    0
 .../{gtk+-2.24.15 => gtk+-2.24.18}/xsettings.patch |    0
 .../gtk+/{gtk+_2.24.15.bb => gtk+_2.24.18.bb}      |    6 +-
 .../freetype/freetype-2.4.11/no-hardcode.patch     |   13 --
 .../{freetype_2.4.11.bb => freetype_2.4.12.bb}     |    8 +-
 .../harfbuzz-0.9.12/avoid_double_version_h.patch   |   14 --
 .../disable_graphite.patch                         |    0
 .../{harfbuzz_0.9.12.bb => harfbuzz_0.9.17.bb}     |    5 +-
 ...inter-reference-when-closing-an-unused-mu.patch |  170 --------------------
 .../curl/{curl_7.29.0.bb => curl_7.30.0.bb}        |    7 +-
 22 files changed, 18 insertions(+), 216 deletions(-)
 rename meta/recipes-core/zlib/{zlib-1.2.7 => zlib-1.2.8}/remove.ldconfig.call.patch (100%)
 rename meta/recipes-core/zlib/{zlib_1.2.7.bb => zlib_1.2.8.bb} (73%)
 rename meta/recipes-gnome/gtk+/{gtk+-2.24.15 => gtk+-2.24.18}/0001-GtkButton-do-not-prelight-in-touchscreen-mode.patch (100%)
 rename meta/recipes-gnome/gtk+/{gtk+-2.24.15 => gtk+-2.24.18}/0001-bgo-584832-Duplicate-the-exec-string-returned-by-gtk.patch (100%)
 rename meta/recipes-gnome/gtk+/{gtk+-2.24.15 => gtk+-2.24.18}/cellrenderer-cairo.patch (100%)
 rename meta/recipes-gnome/gtk+/{gtk+-2.24.15 => gtk+-2.24.18}/configure-nm.patch (100%)
 rename meta/recipes-gnome/gtk+/{gtk+-2.24.15 => gtk+-2.24.18}/configurefix.patch (100%)
 rename meta/recipes-gnome/gtk+/{gtk+-2.24.15 => gtk+-2.24.18}/doc-fixes.patch (100%)
 rename meta/recipes-gnome/gtk+/{gtk+-2.24.15 => gtk+-2.24.18}/entry-cairo.patch (100%)
 rename meta/recipes-gnome/gtk+/{gtk+-2.24.15 => gtk+-2.24.18}/hardcoded_libtool.patch (100%)
 rename meta/recipes-gnome/gtk+/{gtk+-2.24.15 => gtk+-2.24.18}/no-demos.patch (100%)
 rename meta/recipes-gnome/gtk+/{gtk+-2.24.15 => gtk+-2.24.18}/run-iconcache.patch (100%)
 rename meta/recipes-gnome/gtk+/{gtk+-2.24.15 => gtk+-2.24.18}/toggle-font.diff (100%)
 rename meta/recipes-gnome/gtk+/{gtk+-2.24.15 => gtk+-2.24.18}/xsettings.patch (100%)
 rename meta/recipes-gnome/gtk+/{gtk+_2.24.15.bb => gtk+_2.24.18.bb} (93%)
 delete mode 100644 meta/recipes-graphics/freetype/freetype-2.4.11/no-hardcode.patch
 rename meta/recipes-graphics/freetype/{freetype_2.4.11.bb => freetype_2.4.12.bb} (84%)
 delete mode 100644 meta/recipes-graphics/harfbuzz/harfbuzz-0.9.12/avoid_double_version_h.patch
 rename meta/recipes-graphics/harfbuzz/{harfbuzz-0.9.12 => harfbuzz-0.9.17}/disable_graphite.patch (100%)
 rename meta/recipes-graphics/harfbuzz/{harfbuzz_0.9.12.bb => harfbuzz_0.9.17.bb} (83%)
 delete mode 100644 meta/recipes-support/curl/curl/0001-Fix-NULL-pointer-reference-when-closing-an-unused-mu.patch
 rename meta/recipes-support/curl/{curl_7.29.0.bb => curl_7.30.0.bb} (89%)

-- 
1.7.10.4


