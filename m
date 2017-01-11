Return-Path: <joshua.g.lock@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 6537271AE8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Jan 2017 16:23:58 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga101.fm.intel.com with ESMTP; 11 Jan 2017 08:23:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,346,1477983600"; d="scan'208";a="1081815019"
Received: from jlock-mobl1.ger.corp.intel.com ([10.252.13.231])
	by orsmga001.jf.intel.com with ESMTP; 11 Jan 2017 08:23:40 -0800
From: Joshua Lock <joshua.g.lock@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 Jan 2017 16:23:31 +0000
Message-Id: <cover.1484151534.git.joshua.g.lock@intel.com>
X-Mailer: git-send-email 2.9.3
Cc: Jonathan.rajotte-julien@efficios.com
Subject: [PATCH 0/1] Fido backport pull request
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
X-List-Received-Date: Wed, 11 Jan 2017 16:23:59 -0000

Backport babeltrace fix as requested by Jonathan Rajotte Julien:
http://lists.openembedded.org/pipermail/openembedded-core/2017-January/130849.html

The following changes since commit f9c35dfc6601901664dbef2cba3a9b96bef96e64:

  systemd: re-enable mount propagation for udevd (2016-12-05 17:20:46 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib joshuagl/fido-next
  http://git.openembedded.org/openembedded-core-contrib/log/?h=joshuagl/fido-next

Nathan Lynch (1):
  as-needed.inc: add babeltrace exception

 meta/conf/distro/include/as-needed.inc | 1 +
 1 file changed, 1 insertion(+)

-- 
2.9.3

