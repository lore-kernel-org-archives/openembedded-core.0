Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (unknown [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 9D16665FDC
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 May 2014 11:42:33 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 19 May 2014 04:37:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.98,866,1392192000"; d="scan'208";a="513973065"
Received: from akagikob-mobl1.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.123.55])
	by orsmga001.jf.intel.com with ESMTP; 19 May 2014 04:42:33 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 19 May 2014 12:42:25 +0100
Message-Id: <cover.1400499708.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.0
Subject: [PATCH 0/2] libav upgrades
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
X-List-Received-Date: Mon, 19 May 2014 11:42:34 -0000

The following changes since commit e273301efa0037a13c3a60b4414140364d9c9873:

  gstreamer/lame: Better gcc 4.9 fix (2014-05-15 23:27:41 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/libav-upgrades
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/libav-upgrades

Paul Eggleton (2):
  libav: upgrade 0.8.x version to 0.8.11
  libav: upgrade 9.x version to 9.13

 meta/recipes-multimedia/libav/{libav_0.8.9.bb => libav_0.8.11.bb} | 4 ++--
 meta/recipes-multimedia/libav/{libav_9.10.bb => libav_9.13.bb}    | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-multimedia/libav/{libav_0.8.9.bb => libav_0.8.11.bb} (79%)
 rename meta/recipes-multimedia/libav/{libav_9.10.bb => libav_9.13.bb} (74%)

-- 
1.9.0


