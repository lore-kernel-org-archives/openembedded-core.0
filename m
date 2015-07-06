Return-Path: <tanu.kaskinen@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 7EF3C75D85
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Jul 2015 15:15:15 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga103.jf.intel.com with ESMTP; 06 Jul 2015 08:15:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,415,1432623600"; d="scan'208";a="759226526"
Received: from tkkaskin-mobl3.ger.corp.intel.com (HELO
	tkkaskin-mobl3.ger.corp.intel.com.ger.corp.intel.com)
	([10.252.2.187])
	by orsmga002.jf.intel.com with ESMTP; 06 Jul 2015 08:15:16 -0700
From: Tanu Kaskinen <tanu.kaskinen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  6 Jul 2015 18:14:50 +0300
Message-Id: <cover.1436195315.git.tanu.kaskinen@linux.intel.com>
X-Mailer: git-send-email 1.9.3
Subject: [PATCH 0/3] speex, speexdsp: 1.2rc1 -> 1.2rc2/1.2rc3
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
X-List-Received-Date: Mon, 06 Jul 2015 15:15:18 -0000

These patches update speex to 1.2rc2 and speexdsp to 1.2rc3. speexdsp
was previously included in speex, but now it's in a separate source
tree, so a new recipe is needed.

The following changes since commit dd09fab685de2eaf04aa5ab60f8220b89c1deae9:

  tune-core2.inc: set X86ARCH32 to i686 (instead of i586) (2015-07-02 23:08:27 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib tanuk/speex
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=tanuk/speex

Tanu Kaskinen (3):
  speexdsp: initial recipe
  speex: 1.2rc1 -> 1.2rc2
  alsa-plugins, pulseaudio: depend on speexdsp, not speex

 .../recipes-multimedia/alsa/alsa-plugins_1.0.29.bb |  4 +-
 meta/recipes-multimedia/pulseaudio/pulseaudio.inc  |  2 +-
 meta/recipes-multimedia/speex/speex-fpu.inc        |  4 --
 .../speex/{speex_1.2rc1.bb => speex_1.2rc2.bb}     | 18 +++----
 ...ely-on-HAVE_STDINT_H-et-al.-being-defined.patch | 63 ++++++++++++++++++++++
 meta/recipes-multimedia/speex/speexdsp_1.2rc3.bb   | 39 ++++++++++++++
 6 files changed, 112 insertions(+), 18 deletions(-)
 delete mode 100644 meta/recipes-multimedia/speex/speex-fpu.inc
 rename meta/recipes-multimedia/speex/{speex_1.2rc1.bb => speex_1.2rc2.bb} (51%)
 create mode 100644 meta/recipes-multimedia/speex/speexdsp/0001-Don-t-rely-on-HAVE_STDINT_H-et-al.-being-defined.patch
 create mode 100644 meta/recipes-multimedia/speex/speexdsp_1.2rc3.bb

-- 
1.9.3


