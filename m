Return-Path: <yin.thong.choong@intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id E883F7017D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Apr 2017 07:38:06 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga104.jf.intel.com with ESMTP; 14 Apr 2017 00:38:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.37,197,1488873600"; d="scan'208";a="87394937"
Received: from platypus.jf.intel.com ([10.54.77.139])
	by orsmga005.jf.intel.com with ESMTP; 14 Apr 2017 00:38:07 -0700
From: yin.thong.choong@intel.com
To: openembedded-core@lists.openembedded.org
Date: Thu, 13 Apr 2017 17:26:38 -0700
Message-Id: <1492129599-191738-1-git-send-email-yin.thong.choong@intel.com>
X-Mailer: git-send-email 2.7.4
Cc: otc.embedded.malaysia@intel.com
Subject: [PATCH] start_getty: Over added SERIAL_CONSOLE cause error
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
X-List-Received-Date: Fri, 14 Apr 2017 07:38:07 -0000

From: Choong YinThong <yin.thong.choong@intel.com>

Error log will be logged into /var/log/message.
Added in more condition checking on the script.
Check /proc/tty/drivers and /proc/tty/driver/* file system 
to retrieve active targeted serial.
Only establish getty with active serial in runtime.

Choong YinThong (1):
  start_getty: Over added SERIAL_CONSOLE cause error in userspace log

 .../sysvinit/sysvinit-inittab/start_getty          | 38 +++++++++++++++++++---
 1 file changed, 34 insertions(+), 4 deletions(-)

-- 
2.7.4


