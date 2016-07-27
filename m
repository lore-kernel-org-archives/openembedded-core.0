Return-Path: <anibal.limon@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 29FAE65CBF
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jul 2016 22:40:02 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga102.jf.intel.com with ESMTP; 27 Jul 2016 15:40:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,431,1464678000"; d="scan'208";a="146562650"
Received: from alimonb-mobl1.zpn.intel.com ([10.219.5.54])
	by fmsmga004.fm.intel.com with ESMTP; 27 Jul 2016 15:40:03 -0700
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Jul 2016 17:40:37 -0500
Message-Id: <1469659242-12350-1-git-send-email-anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
Subject: [PATCH 0/5] Fixes for busybox-syslog with systemd
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
X-List-Received-Date: Wed, 27 Jul 2016 22:40:05 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Changes can be reviewed at,

http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/log/?h=alimon/simple_patches

Aníbal Limón (5):
  oeqa/runtime/syslog.py: Improve test_syslog_logger
  busybox-syslog.default: When systemd is enabled don't use circular
    buffer
  classes/testimage: When image is systemd, enable debug log level
  oeqa/runtime/syslog: test_syslog_logger Don't try to use logread when
    systemd is enabled
  oeqa/utils/commands.py: Command class improve validations/decoding in
    output

 meta/classes/testimage.bbclass                         | 5 ++++-
 meta/lib/oeqa/runtime/syslog.py                        | 9 +++++++--
 meta/lib/oeqa/utils/commands.py                        | 5 ++++-
 meta/recipes-core/busybox/files/busybox-syslog.default | 2 +-
 4 files changed, 16 insertions(+), 5 deletions(-)

-- 
2.1.4


