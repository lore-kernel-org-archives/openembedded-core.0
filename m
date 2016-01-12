Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id B9EC46011F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jan 2016 18:48:18 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga101.jf.intel.com with ESMTP; 12 Jan 2016 10:48:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,558,1449561600"; d="scan'208";a="879952862"
Received: from rusilaw-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.149.174])
	by fmsmga001.fm.intel.com with ESMTP; 12 Jan 2016 10:48:17 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 13 Jan 2016 07:47:43 +1300
Message-Id: <cover.1452624350.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.0
Subject: [PATCH 0/4] Extensible SDK fixes
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
X-List-Received-Date: Tue, 12 Jan 2016 18:48:22 -0000

The following changes since commit 541315d6c56df6448f64c262f99d43d5c1e9400b:

  update_font_cache: only scan system font directories (2016-01-11 23:23:18 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/extsdkfixes4-oe
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/extsdkfixes4-oe

Paul Eggleton (4):
  classes/populate_sdk_ext.bbclass: handle if local.conf doesn't end with a newline
  classes/populate_sdk_ext: support auto.conf
  classes/buildhistory: save auto.conf and bblayers.conf for extensible SDK
  classes/populate_sdk_ext: check that extensible SDK prepared correctly

 meta/classes/buildhistory.bbclass     |  2 +-
 meta/classes/populate_sdk_ext.bbclass | 20 ++++++--
 meta/files/ext-sdk-prepare.py         | 92 +++++++++++++++++++++++++++++++++++
 meta/files/ext-sdk-prepare.sh         |  8 ---
 4 files changed, 110 insertions(+), 12 deletions(-)
 create mode 100644 meta/files/ext-sdk-prepare.py
 delete mode 100644 meta/files/ext-sdk-prepare.sh

-- 
2.5.0


