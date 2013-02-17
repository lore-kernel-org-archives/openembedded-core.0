Received: from mail-lb0-f171.google.com ([209.85.217.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cazfi74@gmail.com>) id 1U70MF-00085q-Iw
	for openembedded-core@lists.openembedded.org;
	Sun, 17 Feb 2013 10:16:28 +0100
Received: by mail-lb0-f171.google.com with SMTP id gg13so3555012lbb.2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Feb 2013 01:00:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=cuKu2Of/3GYTmzwLATaqBp6+mjMa3BU8+fke4uqteoI=;
	b=IoMkgEZuA3fEqWzbJ7D5AksRSDQJ32uYnYMK/ehmKEUKIQLr8onJdjdrlzVl+Adf0Y
	a1WvDkVl60v3r5VXuiJxPPhRwciK70HAQoxDXcgseMufzfOI83U3L5r8LClfv+VhhHDO
	xz8WucZ1UU66HJ3FIViYEi24C2E5y6o1xvgRiW5j/7dMgup6Ip1fA33JKP4BCsz09kZy
	uk51Pl6wYl1S4H8lfBGAyLN6XfL+gQe3pf05YPkIGNZSXLGG7seQgEusgddjpVFv8ieb
	YkeUyBuWavi3dCBDijj+Z87pMwVgkMVU0yny72rgAk0hX9mQYTAZ+GPKeT2BO89ucDo7
	iZ4w==
X-Received: by 10.112.26.106 with SMTP id k10mr4116360lbg.5.1361091621248;
	Sun, 17 Feb 2013 01:00:21 -0800 (PST)
Received: from prime (a91-153-5-47.elisa-laajakaista.fi. [91.153.5.47])
	by mx.google.com with ESMTPS id w5sm13036108lbj.15.2013.02.17.01.00.19
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Sun, 17 Feb 2013 01:00:20 -0800 (PST)
Received: from cazfi by prime with local (Exim 4.80)
	(envelope-from <cazfi74@gmail.com>)
	id 1U706b-00086r-Mm; Sun, 17 Feb 2013 11:00:17 +0200
From: Marko Lindqvist <cazfi74@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 17 Feb 2013 11:00:16 +0200
Message-Id: <cover.1361091390.git.cazfi74@gmail.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH 0/5] automake-1.13 and upstream version updates
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
X-List-Received-Date: Sun, 17 Feb 2013 09:16:55 -0000

A couple of automake-1.13 related fixes and updates to newer upstream
versions. Notably curl now has its official automake-1.13 support, so
we get rid of our own hack.

The following changes since commit 97aa5ac2df7593e343d82f5e64a422bb951eacf9:

  dropbear: use pidfile for daemon start/stop/restart (2013-02-15 12:58:44 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib cazfi/misc
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=cazfi/misc

Marko Lindqvist (5):
  webkit-gtk: replace obsolete automake macros with working ones
  gtk-sato-engine: update to git repository head
  oprofileui-server: replace obsolete automake macros with working ones
  libffi: update to upstream version 3.0.12
  curl: update to upstream version 7.29.0

 .../libffi/0001-libffi-update-for-3.0.11.patch     |  171 --
 .../libffi/aarch64-adding-build-support.patch      |   63 -
 .../libffi/libffi/add-aarch64-support.patch        | 2672 --------------------
 .../libffi/{libffi_3.0.11.bb => libffi_3.0.12.bb}  |    9 +-
 .../obsolete_automake_macros.patch                 |   20 +
 .../oprofile/oprofileui-server_git.bb              |    6 +-
 .../gtk-engines/gtk-sato-engine_git.bb             |    4 +-
 .../obsolete_automake_macros.patch                 |   14 +
 meta/recipes-sato/webkit/webkit-gtk_1.8.3.bb       |    3 +-
 .../dont_override_ac_config_macro_dir.patch        |   30 -
 .../curl-7.28.1/obsolete_automake_macros.patch     |   14 -
 meta/recipes-support/curl/curl/pkgconfig_fix.patch |   25 +-
 .../curl/{curl_7.28.1.bb => curl_7.29.0.bb}        |    8 +-
 13 files changed, 59 insertions(+), 2980 deletions(-)
 delete mode 100644 meta/recipes-gnome/libffi/libffi/0001-libffi-update-for-3.0.11.patch
 delete mode 100644 meta/recipes-gnome/libffi/libffi/aarch64-adding-build-support.patch
 delete mode 100644 meta/recipes-gnome/libffi/libffi/add-aarch64-support.patch
 rename meta/recipes-gnome/libffi/{libffi_3.0.11.bb => libffi_3.0.12.bb} (76%)
 create mode 100644 meta/recipes-kernel/oprofile/oprofileui-server/obsolete_automake_macros.patch
 create mode 100644 meta/recipes-sato/webkit/webkit-gtk-1.8.3/obsolete_automake_macros.patch
 delete mode 100644 meta/recipes-support/curl/curl-7.28.1/dont_override_ac_config_macro_dir.patch
 delete mode 100644 meta/recipes-support/curl/curl-7.28.1/obsolete_automake_macros.patch
 rename meta/recipes-support/curl/{curl_7.28.1.bb => curl_7.29.0.bb} (88%)

-- 
1.7.10.4



