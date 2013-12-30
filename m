Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id B0F3460E33
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Dec 2013 03:35:05 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id rBU3Z6ON025947
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Dec 2013 19:35:06 -0800 (PST)
Received: from pek-hostel-vm02.wrs.com (128.224.153.172) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Sun, 29 Dec 2013 19:35:05 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 29 Dec 2013 22:34:49 -0500
Message-ID: <cover.1388369850.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Subject: [PATCH 00/14] fix/remove unrecognised options
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
X-List-Received-Date: Mon, 30 Dec 2013 03:35:06 -0000
Content-Type: text/plain

The following changes since commit 005af45191ded6185c618c708181b31281e43092:

  bitbake: fetch2: avoid printing "no checksum" error message twice (2013-12-22 14:29:13 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib robert/options
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=robert/options

Robert Yang (14):
  flac: remove unrecognised options
  alsa-lib: remove unrecognised options
  tremor: remove unrecognised option
  dpkg: fix/remove unrecognised options
  libid3tag: remove unrecognised option
  gstreamer: fix unrecognised options
  gstreamer1.0: remove unrecognised options
  gstreamer1.0: remove unrecognised options
  bluez-hcidump: remove unrecognised options
  enchant: fix unrecognised option
  cups: remove unrecognised option
  wget: remove unrecognised option
  ghostscript: remove unrecognised option
  mesa-demos: fix unrecognised options

 meta/recipes-connectivity/bluez/bluez-hcidump_2.5.bb         |    2 --
 meta/recipes-devtools/dpkg/dpkg.inc                          |   10 +++++-----
 meta/recipes-extended/cups/cups.inc                          |    2 --
 meta/recipes-extended/ghostscript/ghostscript_9.07.bb        |    8 +++++---
 meta/recipes-extended/wget/wget.inc                          |    2 +-
 meta/recipes-graphics/mesa/mesa-demos_8.1.0.bb               |    4 ++--
 meta/recipes-multimedia/alsa/alsa-lib_1.0.27.2.bb            |    2 +-
 meta/recipes-multimedia/flac/flac_1.2.1.bb                   |    4 ++--
 .../gstreamer/gstreamer1.0-plugins-base.inc                  |    2 --
 meta/recipes-multimedia/gstreamer/gstreamer1.0.inc           |    6 +++++-
 meta/recipes-multimedia/gstreamer/gstreamer_0.10.36.bb       |    6 +++++-
 meta/recipes-multimedia/libid3tag/libid3tag_0.15.1b.bb       |    2 --
 meta/recipes-multimedia/tremor/tremor_20120314.bb            |    2 +-
 meta/recipes-support/enchant/enchant_1.6.0.bb                |    4 +++-
 14 files changed, 30 insertions(+), 26 deletions(-)

-- 
1.7.10.4


