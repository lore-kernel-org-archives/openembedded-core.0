Received: from mail-bk0-f42.google.com ([209.85.214.42])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cazfi74@gmail.com>) id 1Tv5Nf-00022h-55
	for openembedded-core@lists.openembedded.org;
	Tue, 15 Jan 2013 13:12:39 +0100
Received: by mail-bk0-f42.google.com with SMTP id ji2so221bkc.29
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jan 2013 03:57:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=vgRF2BVXS+TE0fOFVc38+ewyxyIKuTKmvNkZrxGlX2g=;
	b=ouIDOBVzow+7dzfLYAuXDGwN7ZsuEwNmE0Z3ii8HuNd0SgTl5p99LLTzd1T95ZS87l
	nfrAXdBrDw3eLYatnSZZHU1TnbelL083uu23odOotgKu21Ey7CK/adUKHLdrAw37Xq6A
	oGs4BhfSzhUzCT22y0xBGO+/RL1OU4PPcx/v6PIzuldkIID46TAsLvxVh2zDHXpMgFlO
	aRZwoswSS1SV8Ucoc+GyZm3VvS+qT4XoZIlyKXVc3BqmslsJMuaHh9bKrhjPNkDRqd/V
	913rvGEhzdmoZ9nQ6EYc97gsG5egafwUWeRm1r5+rciKcvxYx2vY9LpUdEGTwPvP6PEO
	u27w==
X-Received: by 10.204.148.130 with SMTP id p2mr39928847bkv.10.1358251038839;
	Tue, 15 Jan 2013 03:57:18 -0800 (PST)
Received: from prime (a91-153-5-47.elisa-laajakaista.fi. [91.153.5.47])
	by mx.google.com with ESMTPS id c10sm12422757bkw.1.2013.01.15.03.57.16
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Tue, 15 Jan 2013 03:57:17 -0800 (PST)
Received: from cazfi by prime with local (Exim 4.80)
	(envelope-from <cazfi74@gmail.com>)
	id 1Tv58l-0004lF-0r; Tue, 15 Jan 2013 13:57:15 +0200
From: Marko Lindqvist <cazfi74@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 15 Jan 2013 13:57:11 +0200
Message-Id: <cover.1358250908.git.cazfi74@gmail.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH 00/12] Prepare recipes for automake-1.13 (batch #3)
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
X-List-Received-Date: Tue, 15 Jan 2013 12:12:39 -0000

As more and more packages seem to have automake-1.13 related problems,
it's becoming clear that I cannot fix world alone. I'm about to fix
packages in openembedded-core the way I've been doing, but for supporting
unfixed packages in other layers it would make sense to patch our
version of automake-1.13 to still support AM_CONFIG_HEADER (the most
common problem by far). We can drop that patch once most of the world
has been updated to versions that work without.

This batch includes fix to pango. Meanwhile new upstream version of pango
with fix included has been released, but it depends on other packages
for which there is not yet suitable stable releases available.


 - ML

The following changes since commit 6080d1dc719c38fd97c2abd38e0ad938fbf6f452:

  connman: fixed init script so connman can runs over nfs (2013-01-15 08:09:30 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib cazfi/am13
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=cazfi/am13

Marko Lindqvist (12):
  polkit: replace obsolete automake macros with working ones
  pango: replace obsolete automake macros with working ones
  libxsettings-client: replace obsolete automake macros with working
    ones
  rgb: replace obsolete automake macros with working ones
  sysfsutils: replace obsolete automake macros with working ones
  vte: replace obsolete automake macros with working ones
  libtirpc: replace obsolete automake macros with working ones
  curl: fix build with automake-1.13
  bluez-hcidump: replace obsolete automake macros with working ones
  alsa-utils: replace obsolete automake macros with working ones
  tremor: replace obsolete automake macros with working ones
  ofono: replace obsolete automake macros with working ones

 .../obsolete_automake_macros.patch                 |   14 +++++++++
 .../bluez/bluez-hcidump_2.5.bb                     |    6 ++--
 .../ofono-1.12/obsolete_automake_macros.patch      |   14 +++++++++
 meta/recipes-connectivity/ofono/ofono_1.12.bb      |    4 ++-
 .../obsolete_automake_macros.patch                 |   15 ++++++++++
 meta/recipes-core/sysfsutils/sysfsutils_2.1.0.bb   |    3 +-
 .../libtirpc-0.2.2/obsolete_automake_macros.patch  |   15 ++++++++++
 meta/recipes-extended/libtirpc/libtirpc_0.2.2.bb   |    4 ++-
 .../polkit-0.104/obsolete_automake_macros.patch    |   23 +++++++++++++++
 meta/recipes-extended/polkit/polkit_0.104.bb       |    3 +-
 .../obsolete_automake_macros.patch                 |   14 +++++++++
 .../libxsettings-client_0.10.bb                    |    6 ++--
 .../pango-1.32.5/obsolete_automake_macros.patch    |   15 ++++++++++
 meta/recipes-graphics/pango/pango_1.32.5.bb        |    6 ++--
 .../rgb-1.0.4/obsolete_automake_macros.patch       |   15 ++++++++++
 meta/recipes-graphics/xorg-app/rgb_1.0.4.bb        |    4 ++-
 .../obsolete_automake_macros.patch                 |   15 ++++++++++
 meta/recipes-multimedia/alsa/alsa-utils_1.0.25.bb  |    3 +-
 .../tremor-20120314/obsolete_automake_macros.patch |   15 ++++++++++
 meta/recipes-multimedia/tremor/tremor_20120314.bb  |    6 ++--
 .../dont_override_ac_config_macro_dir.patch        |   30 ++++++++++++++++++++
 .../curl-7.28.1/obsolete_automake_macros.patch     |   14 +++++++++
 meta/recipes-support/curl/curl_7.28.1.bb           |    7 +++--
 .../vte/vte-0.28.2/obsolete_automake_macros.patch  |   14 +++++++++
 meta/recipes-support/vte/vte_0.28.2.bb             |    4 ++-
 25 files changed, 252 insertions(+), 17 deletions(-)
 create mode 100644 meta/recipes-connectivity/bluez/bluez-hcidump-2.5/obsolete_automake_macros.patch
 create mode 100644 meta/recipes-connectivity/ofono/ofono-1.12/obsolete_automake_macros.patch
 create mode 100644 meta/recipes-core/sysfsutils/sysfsutils-2.1.0/obsolete_automake_macros.patch
 create mode 100644 meta/recipes-extended/libtirpc/libtirpc-0.2.2/obsolete_automake_macros.patch
 create mode 100644 meta/recipes-extended/polkit/polkit-0.104/obsolete_automake_macros.patch
 create mode 100644 meta/recipes-graphics/libxsettings-client/libxsettings-client/obsolete_automake_macros.patch
 create mode 100644 meta/recipes-graphics/pango/pango-1.32.5/obsolete_automake_macros.patch
 create mode 100644 meta/recipes-graphics/xorg-app/rgb-1.0.4/obsolete_automake_macros.patch
 create mode 100644 meta/recipes-multimedia/alsa/alsa-utils-1.0.25/obsolete_automake_macros.patch
 create mode 100644 meta/recipes-multimedia/tremor/tremor-20120314/obsolete_automake_macros.patch
 create mode 100644 meta/recipes-support/curl/curl-7.28.1/dont_override_ac_config_macro_dir.patch
 create mode 100644 meta/recipes-support/curl/curl-7.28.1/obsolete_automake_macros.patch
 create mode 100644 meta/recipes-support/vte/vte-0.28.2/obsolete_automake_macros.patch

-- 
1.7.10.4



