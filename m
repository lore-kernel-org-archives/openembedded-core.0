Return-Path: <juro.bystricky@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 350E371D4E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Jan 2017 20:59:18 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 25 Jan 2017 12:59:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,285,1477983600"; d="scan'208";a="1087288452"
Received: from juro-precision-t5610.jf.intel.com ([10.7.198.149])
	by orsmga001.jf.intel.com with ESMTP; 25 Jan 2017 12:59:18 -0800
From: Juro Bystricky <juro.bystricky@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 25 Jan 2017 12:54:56 -0800
Message-Id: <1485377697-19218-1-git-send-email-juro.bystricky@intel.com>
X-Mailer: git-send-email 2.7.4
Cc: jurobystricky@hotmail.com
Subject: [PATCH 0/1] runqemu: disable network
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
X-List-Received-Date: Wed, 25 Jan 2017 20:59:19 -0000

Not all QEMU machines support network hardware emulation.
Those machines cannot be run by "runqemu", as network hardware is implicitly
always assumed. Trying to run them using "runqemu" would end up in
raise Exception('Failed to run %s' % cmd)

There is no way to disable network setup using qemuboot.conf nor command line
argument.

The patch for runqemu contains a simple fix that can disable the network using
qemuboot.conf. The patch was written to be as non-invasive as possible,
it should not break anything that is known to work.
(A slightly more complex patch could contain support for command line argument
"nonetwork", similar to "nographic")


Juro Bystricky (1):
  runqemu: allow bypassing of network setup

 scripts/runqemu | 2 ++
 1 file changed, 2 insertions(+)

-- 
2.7.4


