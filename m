Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id D325472A3A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Jan 2015 08:47:39 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id t0E8lc2b022096
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Jan 2015 00:47:39 -0800 (PST)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Wed, 14 Jan 2015 00:47:38 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 14 Jan 2015 00:47:11 -0800
Message-ID: <cover.1421225218.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 00/27] meta: fix B != S
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
X-List-Received-Date: Wed, 14 Jan 2015 08:47:48 -0000
Content-Type: text/plain

The following changes since commit b61a2acc321489c3427f0afa3059486dc144a13b:

  bind: Update libxml2 check to make it deterministic. (2015-01-08 09:21:18 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/b_src
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/b_src

Robert Yang (27):
  libnl: separate B and S
  nspr: fix B != S
  ghostscript: fix B != S
  bc: separate B and S
  cmake: fix B != S
  cracklib: separate B and S
  flac: separate B and S
  libgcrypt: separate B and S
  gnutls: separate B and S
  bash: separate B and S
  pinentry: separate B and S
  oprofile: separate B and S
  expect: separate B and S
  apr-util: fix B != S
  qemu: fix B != S
  gnome-desktop-testing: separate B and S
  libcroco: separate B and S
  alsa-utils: fix B != S
  neard: fix B != S
  python: fix B != S
  connman: fix B != S
  libfm-extra: separate B and S
  libfm: separate B and S
  icon-naming-utils: separate B and S
  rpm: separate B and S
  presentproto: separate B and S
  kexec-tools: separate B and S

 meta/recipes-connectivity/connman/connman.inc      |   14 +++++++-------
 meta/recipes-connectivity/connman/connman_1.26.bb  |    2 ++
 meta/recipes-connectivity/neard/neard.inc          |    4 ++--
 meta/recipes-connectivity/neard/neard_0.14.bb      |    1 +
 meta/recipes-devtools/cmake/cmake.inc              |    6 ++++--
 meta/recipes-devtools/expect/expect_5.45.bb        |    4 +++-
 .../icon-naming-utils/icon-naming-utils_0.8.90.bb  |    4 ++--
 meta/recipes-devtools/python/python.inc            |    4 ++--
 meta/recipes-devtools/python/python3_3.3.3.bb      |    6 +++---
 meta/recipes-devtools/python/python_2.7.3.bb       |    6 +++---
 meta/recipes-devtools/qemu/qemu.inc                |    8 +++++---
 meta/recipes-devtools/rpm/rpm_4.11.2.bb            |    4 +++-
 meta/recipes-extended/bash/bash.inc                |    2 +-
 meta/recipes-extended/bash/bash_4.3.bb             |    2 ++
 meta/recipes-extended/bc/bc_1.06.bb                |    4 ++--
 meta/recipes-extended/cracklib/cracklib_2.9.2.bb   |    4 +++-
 .../ghostscript/ghostscript_9.15.bb                |    8 +++++---
 .../xorg-proto/presentproto_git.bb                 |    4 +++-
 meta/recipes-kernel/kexec/kexec-tools.inc          |    4 +++-
 meta/recipes-kernel/oprofile/oprofile.inc          |    5 ++---
 meta/recipes-kernel/oprofile/oprofile_1.0.0.bb     |    1 +
 .../alsa/alsa-utils-alsaconf_1.0.28.bb             |    2 +-
 meta/recipes-multimedia/alsa/alsa-utils_1.0.28.bb  |    4 +++-
 meta/recipes-multimedia/flac/flac_1.3.0.bb         |    4 ++--
 meta/recipes-support/apr/apr-util_1.5.4.bb         |   17 ++++++++++-------
 .../gnome-desktop-testing_2014.1.bb                |    4 +++-
 meta/recipes-support/gnutls/gnutls.inc             |    2 +-
 meta/recipes-support/gnutls/gnutls_3.3.11.bb       |    2 ++
 meta/recipes-support/libcroco/libcroco_0.6.8.bb    |    4 ++--
 meta/recipes-support/libfm/libfm-extra_1.2.3.bb    |    4 +++-
 meta/recipes-support/libfm/libfm_1.2.3.bb          |    4 +++-
 meta/recipes-support/libgcrypt/libgcrypt.inc       |    4 +++-
 meta/recipes-support/libnl/libnl_3.2.25.bb         |    3 ++-
 meta/recipes-support/nspr/nspr_4.10.7.bb           |   12 ++++++++----
 meta/recipes-support/pinentry/pinentry_0.9.0.bb    |    4 +++-
 35 files changed, 105 insertions(+), 62 deletions(-)

-- 
1.7.9.5


