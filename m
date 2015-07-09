Return-Path: <tanu.kaskinen@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 004BD75C49
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Jul 2015 10:43:29 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga102.jf.intel.com with ESMTP; 09 Jul 2015 03:43:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,439,1432623600"; d="scan'208";a="521309620"
Received: from tkkaskin-mobl3.ger.corp.intel.com (HELO
	tkkaskin-mobl3.ger.corp.intel.com.ger.corp.intel.com)
	([10.252.21.252])
	by FMSMGA003.fm.intel.com with ESMTP; 09 Jul 2015 03:43:13 -0700
From: Tanu Kaskinen <tanu.kaskinen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  9 Jul 2015 13:43:08 +0300
Message-Id: <cover.1436438063.git.tanu.kaskinen@linux.intel.com>
X-Mailer: git-send-email 1.9.3
Cc: Tanu Kaskinen <tanu.kaskinen@linux.intel.com>
Subject: [PATCH v2 0/3] speex, speexdsp: 1.2rc1 -> 1.2rc2/1.2rc3
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
X-List-Received-Date: Thu, 09 Jul 2015 10:43:32 -0000

Changes in v2:
 - Added a patch to alsa-plugins to deal with a changed header location:
   speex_types.h -> speexdsp_types.h

The following changes since commit 50a37ee563d9003e21bfb9280f184cd81c62e9bf:

  oeqa/bbtests: Fix to ensure DL_DIR is set (2015-07-08 13:03:07 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib tanuk/speex
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=tanuk/speex

Tanu Kaskinen (3):
  speexdsp: initial recipe
  speex: 1.2rc1 -> 1.2rc2
  alsa-plugins, pulseaudio: depend on speexdsp, not speex

 ...nclude-speexdsp_types.h-not-speex_types.h.patch | 71 ++++++++++++++++++++++
 .../recipes-multimedia/alsa/alsa-plugins_1.0.29.bb |  5 +-
 meta/recipes-multimedia/pulseaudio/pulseaudio.inc  |  2 +-
 meta/recipes-multimedia/speex/speex-fpu.inc        |  4 --
 .../speex/{speex_1.2rc1.bb => speex_1.2rc2.bb}     | 18 +++---
 ...ely-on-HAVE_STDINT_H-et-al.-being-defined.patch | 63 +++++++++++++++++++
 meta/recipes-multimedia/speex/speexdsp_1.2rc3.bb   | 39 ++++++++++++
 7 files changed, 184 insertions(+), 18 deletions(-)
 create mode 100644 meta/recipes-multimedia/alsa/alsa-plugins/0001-include-speexdsp_types.h-not-speex_types.h.patch
 delete mode 100644 meta/recipes-multimedia/speex/speex-fpu.inc
 rename meta/recipes-multimedia/speex/{speex_1.2rc1.bb => speex_1.2rc2.bb} (51%)
 create mode 100644 meta/recipes-multimedia/speex/speexdsp/0001-Don-t-rely-on-HAVE_STDINT_H-et-al.-being-defined.patch
 create mode 100644 meta/recipes-multimedia/speex/speexdsp_1.2rc3.bb

-- 
1.9.3


