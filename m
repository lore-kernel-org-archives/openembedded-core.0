Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 478C074673
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Apr 2018 11:03:15 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	04 Apr 2018 04:03:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.48,405,1517904000"; d="scan'208";a="47864791"
Received: from danayien-mobl2.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.249.66.143])
	by orsmga002.jf.intel.com with ESMTP; 04 Apr 2018 04:03:13 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  4 Apr 2018 23:02:34 +1200
Message-Id: <cover.1522839599.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.14.3
Cc: Enrico Jorns <ejo@pengutronix.de>
Subject: [PATCH 0/2] classes/externalsrc: improve robustness of cleandirs handling
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
X-List-Received-Date: Wed, 04 Apr 2018 11:03:16 -0000

A couple of fixes prompted by (and in the case of 1/2, required for)
Enrico Jorns's recent cleandirs patch.


The following changes since commit c168f6fe35ada66f7d6d6b5151fa248230c38676:

  systemd: fix typo in sulogin-path setting (2018-04-04 08:50:49 +0100)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/externalsrc-cleandirs-fixes
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=paule/externalsrc-cleandirs-fixes

Paul Eggleton (2):
  classes/externalsrc: handle if cleandirs contains python expressions
  classes/externalsrc: ensure cleandirs code handles non-absolute paths

 meta/classes/externalsrc.bbclass | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

-- 
2.14.3


