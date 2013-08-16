Return-Path: <cazfi74@gmail.com>
Received: from mail-lb0-f174.google.com (mail-lb0-f174.google.com
	[209.85.217.174])
	by mail.openembedded.org (Postfix) with ESMTP id 874876065F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Aug 2013 08:14:44 +0000 (UTC)
Received: by mail-lb0-f174.google.com with SMTP id w20so1281563lbh.33
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Aug 2013 01:14:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=KJ/tOZeXNESHSs9MdCiJT0daiBhiUDniGdQ6KGZXwtA=;
	b=mkNeGrbjWim/k9mqXFmTlzIYGQgmFu2mE0QVvd8tBjq4bwv0BkQjXtMirT4EhP4clG
	FPMQ07ECUQ33gQFe8T2lg/Yt/kqF8Etn3uEITJRy8TqxTqfaqo96zHJSiXg6D5/1+5le
	rpAsf8h+4m+xUZkXlTCsbc/8hSlTRkROvG17N30MQTCZaUPr3XQKinqToRo+pB/OeMxH
	/KarBOJDtQ+IUwxc57tcqXs5zic9sR+SgjQm84wk854f3wOpf6Ww0KRViv10+gXQweRT
	xJlNXC6724EHQgNvua2E5XkX4Pf92+B53Mz6NCNM/jsMeCIVe9YtjVgvhXLKcl6LhO7C
	0cNg==
X-Received: by 10.152.44.164 with SMTP id f4mr219832lam.38.1376640884478;
	Fri, 16 Aug 2013 01:14:44 -0700 (PDT)
Received: from prime (a91-153-14-158.elisa-laajakaista.fi. [91.153.14.158])
	by mx.google.com with ESMTPSA id pw4sm470473lbb.9.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 16 Aug 2013 01:14:43 -0700 (PDT)
Received: from cazfi by prime with local (Exim 4.80)
	(envelope-from <cazfi74@gmail.com>)
	id 1VAFBB-0003wi-Lx; Fri, 16 Aug 2013 11:14:41 +0300
From: Marko Lindqvist <cazfi74@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 16 Aug 2013 11:14:37 +0300
Message-Id: <cover.1376640731.git.cazfi74@gmail.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH 0/6] Misc updates
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
X-List-Received-Date: Fri, 16 Aug 2013 08:14:45 -0000

Mainly straightforward minor package upgrades, gettext being the most
significant one.

The following changes since commit 57662d4f813d5795cac1529633db80a09efdb089:

  meta-skeleton: Add busybox config fragment example (2013-08-13 23:03:44 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib cazfi/up
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=cazfi/up

Marko Lindqvist (6):
  glib-2.0: use trim_version() to get the source directory
  pixman: update to upstream version 0.30.2
  curl: update to upstream version 7.32.0
  glib-2.0: update to upstream version 2.36.4
  gtk+: update to upstream version 2.24.20
  gettext: update to upstream version 0.18.3

 .../gettext/{gettext-0.18.2 => gettext-0.18.3}/parallel.patch  |    0
 meta/recipes-core/gettext/gettext-minimal-0.18.2/aclocal.tgz   |  Bin 37504 -> 0 bytes
 .../{gettext-minimal-0.18.2 => gettext-minimal-0.18.3}/COPYING |    0
 .../Makefile.in.in                                             |    3 ++-
 .../Makevars.template                                          |    0
 meta/recipes-core/gettext/gettext-minimal-0.18.3/aclocal.tgz   |  Bin 0 -> 37586 bytes
 .../config.rpath                                               |    2 +-
 .../remove-potcdate.sin                                        |    0
 ...nimal-native_0.18.2.bb => gettext-minimal-native_0.18.3.bb} |    0
 .../gettext/{gettext_0.18.2.bb => gettext_0.18.3.bb}           |    5 ++---
 .../glib-2.0/{glib-2.0_2.36.3.bb => glib-2.0_2.36.4.bb}        |    6 +++---
 .../0001-GtkButton-do-not-prelight-in-touchscreen-mode.patch   |    0
 ...-bgo-584832-Duplicate-the-exec-string-returned-by-gtk.patch |    0
 .../{gtk+-2.24.18 => gtk+-2.24.20}/cellrenderer-cairo.patch    |    0
 .../gtk+/{gtk+-2.24.18 => gtk+-2.24.20}/configure-nm.patch     |    0
 .../gtk+/{gtk+-2.24.18 => gtk+-2.24.20}/configurefix.patch     |    0
 .../gtk+/{gtk+-2.24.18 => gtk+-2.24.20}/doc-fixes.patch        |    0
 .../gtk+/{gtk+-2.24.18 => gtk+-2.24.20}/entry-cairo.patch      |    0
 .../{gtk+-2.24.18 => gtk+-2.24.20}/hardcoded_libtool.patch     |    0
 .../gtk+/{gtk+-2.24.18 => gtk+-2.24.20}/no-demos.patch         |    0
 .../gtk+/{gtk+-2.24.18 => gtk+-2.24.20}/run-iconcache.patch    |    0
 .../gtk+/{gtk+-2.24.18 => gtk+-2.24.20}/toggle-font.diff       |    0
 .../gtk+/{gtk+-2.24.18 => gtk+-2.24.20}/xsettings.patch        |    0
 meta/recipes-gnome/gtk+/{gtk+_2.24.18.bb => gtk+_2.24.20.bb}   |    8 +++-----
 .../xorg-lib/{pixman_0.30.0.bb => pixman_0.30.2.bb}            |    4 ++--
 meta/recipes-support/curl/{curl_7.31.0.bb => curl_7.32.0.bb}   |    4 ++--
 26 files changed, 15 insertions(+), 17 deletions(-)
 rename meta/recipes-core/gettext/{gettext-0.18.2 => gettext-0.18.3}/parallel.patch (100%)
 delete mode 100644 meta/recipes-core/gettext/gettext-minimal-0.18.2/aclocal.tgz
 rename meta/recipes-core/gettext/{gettext-minimal-0.18.2 => gettext-minimal-0.18.3}/COPYING (100%)
 rename meta/recipes-core/gettext/{gettext-minimal-0.18.2 => gettext-minimal-0.18.3}/Makefile.in.in (99%)
 rename meta/recipes-core/gettext/{gettext-minimal-0.18.2 => gettext-minimal-0.18.3}/Makevars.template (100%)
 create mode 100644 meta/recipes-core/gettext/gettext-minimal-0.18.3/aclocal.tgz
 rename meta/recipes-core/gettext/{gettext-minimal-0.18.2 => gettext-minimal-0.18.3}/config.rpath (99%)
 rename meta/recipes-core/gettext/{gettext-minimal-0.18.2 => gettext-minimal-0.18.3}/remove-potcdate.sin (100%)
 rename meta/recipes-core/gettext/{gettext-minimal-native_0.18.2.bb => gettext-minimal-native_0.18.3.bb} (100%)
 rename meta/recipes-core/gettext/{gettext_0.18.2.bb => gettext_0.18.3.bb} (96%)
 rename meta/recipes-core/glib-2.0/{glib-2.0_2.36.3.bb => glib-2.0_2.36.4.bb} (88%)
 rename meta/recipes-gnome/gtk+/{gtk+-2.24.18 => gtk+-2.24.20}/0001-GtkButton-do-not-prelight-in-touchscreen-mode.patch (100%)
 rename meta/recipes-gnome/gtk+/{gtk+-2.24.18 => gtk+-2.24.20}/0001-bgo-584832-Duplicate-the-exec-string-returned-by-gtk.patch (100%)
 rename meta/recipes-gnome/gtk+/{gtk+-2.24.18 => gtk+-2.24.20}/cellrenderer-cairo.patch (100%)
 rename meta/recipes-gnome/gtk+/{gtk+-2.24.18 => gtk+-2.24.20}/configure-nm.patch (100%)
 rename meta/recipes-gnome/gtk+/{gtk+-2.24.18 => gtk+-2.24.20}/configurefix.patch (100%)
 rename meta/recipes-gnome/gtk+/{gtk+-2.24.18 => gtk+-2.24.20}/doc-fixes.patch (100%)
 rename meta/recipes-gnome/gtk+/{gtk+-2.24.18 => gtk+-2.24.20}/entry-cairo.patch (100%)
 rename meta/recipes-gnome/gtk+/{gtk+-2.24.18 => gtk+-2.24.20}/hardcoded_libtool.patch (100%)
 rename meta/recipes-gnome/gtk+/{gtk+-2.24.18 => gtk+-2.24.20}/no-demos.patch (100%)
 rename meta/recipes-gnome/gtk+/{gtk+-2.24.18 => gtk+-2.24.20}/run-iconcache.patch (100%)
 rename meta/recipes-gnome/gtk+/{gtk+-2.24.18 => gtk+-2.24.20}/toggle-font.diff (100%)
 rename meta/recipes-gnome/gtk+/{gtk+-2.24.18 => gtk+-2.24.20}/xsettings.patch (100%)
 rename meta/recipes-gnome/gtk+/{gtk+_2.24.18.bb => gtk+_2.24.20.bb} (90%)
 rename meta/recipes-graphics/xorg-lib/{pixman_0.30.0.bb => pixman_0.30.2.bb} (89%)
 rename meta/recipes-support/curl/{curl_7.31.0.bb => curl_7.32.0.bb} (93%)

-- 
1.7.10.4


