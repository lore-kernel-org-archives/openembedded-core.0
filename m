Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.zanussi@intel.com>) id 1UPENL-0003Mf-TT
	for openembedded-core@lists.openembedded.org;
	Mon, 08 Apr 2013 17:53:00 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 08 Apr 2013 08:35:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,432,1363158000"; d="scan'208";a="224591096"
Received: from unknown (HELO localhost) ([10.255.14.40])
	by AZSMGA002.ch.intel.com with ESMTP; 08 Apr 2013 08:35:30 -0700
From: tom.zanussi@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Mon,  8 Apr 2013 10:35:28 -0500
Message-Id: <cover.1365432708.git.tom.zanussi@linux.intel.com>
X-Mailer: git-send-email 1.7.11.4
Cc: Tom Zanussi <tom.zanussi@linux.intel.com>
Subject: [PATCH 0/1] gst-ffmpeg yasm check fix
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
X-List-Received-Date: Mon, 08 Apr 2013 15:53:05 -0000

From: Tom Zanussi <tom.zanussi@linux.intel.com>

Builds started failing here, tracked it down to commit:

4d309730 ['gst-ffmpeg: configure-fix patch used wrong test']

which essentially just has the effect of never disabling yasm instead
of always disabling it as before.  With this patch it can be conditionally
enabled or disabled as perhaps intended.

The following changes since commit 6d4d42d63db4c3fcffd831ce359599f3ee1d710e:

  qemuimage-tests/sanity/boot: Increase timeout (2013-04-06 17:22:21 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib.git tzanussi/gst-ffmpeg-yasm-check-fix
  http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/log/?h=tzanussi/gst-ffmpeg-yasm-check-fix

Tom Zanussi (1):
  gst-ffmpeg: fix --disable-yasm

 .../gstreamer/gst-ffmpeg-0.10.13/configure-fix.patch                | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

-- 
1.7.11.4



