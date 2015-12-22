Return-Path: <maxin.john@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 29E017319A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Dec 2015 12:21:42 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga103.jf.intel.com with ESMTP; 22 Dec 2015 04:21:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,464,1444719600"; d="scan'208";a="876731013"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga002.jf.intel.com with ESMTP; 22 Dec 2015 04:21:39 -0800
Received: from mbabyjoh-mobl.fi.intel.com (mbabyjoh-mobl.fi.intel.com
	[10.237.72.71])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id E36386A4007
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Dec 2015 05:09:38 -0800 (PST)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 22 Dec 2015 14:22:51 +0200
Message-Id: <1450786978-19993-1-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
Subject: [PATCH 0/7] gstreamer1.0: upgrade to 1.6.2
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
X-List-Received-Date: Tue, 22 Dec 2015 12:21:43 -0000

The 1.6.2 release only contains bugfixes and it is safe to update from 1.6.1

Maxin B. John (7):
  gstreamer1.0: upgrade to version 1.6.2
  gstreamer1.0-plugins-base: upgrade to version 1.6.2
  gstreamer1.0-plugins-good: upgrade to version 1.6.2
  gstreamer1.0-plugins-bad: upgrade to version 1.6.2
  gstreamer1.0-plugins-ugly: upgrade to version 1.6.2
  gstreamer1.0-rtsp-server: upgrade to version 1.6.2
  gstreamer1.0-libav: upgrade to version 1.6.2

 ...-libav_1.6.1.bb => gstreamer1.0-libav_1.6.2.bb} |  4 +-
 ..._1.6.1.bb => gstreamer1.0-plugins-bad_1.6.2.bb} |  4 +-
 ...1.6.1.bb => gstreamer1.0-plugins-base_1.6.2.bb} |  4 +-
 ...1.6.1.bb => gstreamer1.0-plugins-good_1.6.2.bb} |  4 +-
 ...1.6.1.bb => gstreamer1.0-plugins-ugly_1.6.2.bb} |  4 +-
 .../gstreamer/gstreamer1.0-rtsp-server_1.6.1.bb    |  6 ---
 .../gstreamer/gstreamer1.0-rtsp-server_1.6.2.bb    |  6 +++
 .../gstreamer/gstreamer1.0/fix-install-hook.patch  | 48 ----------------------
 ...gstreamer1.0_1.6.1.bb => gstreamer1.0_1.6.2.bb} |  5 +--
 9 files changed, 18 insertions(+), 67 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-libav_1.6.1.bb => gstreamer1.0-libav_1.6.2.bb} (90%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-bad_1.6.1.bb => gstreamer1.0-plugins-bad_1.6.2.bb} (78%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-base_1.6.1.bb => gstreamer1.0-plugins-base_1.6.2.bb} (82%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-good_1.6.1.bb => gstreamer1.0-plugins-good_1.6.2.bb} (77%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-ugly_1.6.1.bb => gstreamer1.0-plugins-ugly_1.6.2.bb} (66%)
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.6.1.bb
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.6.2.bb
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0/fix-install-hook.patch
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0_1.6.1.bb => gstreamer1.0_1.6.2.bb} (68%)

-- 
2.4.0


