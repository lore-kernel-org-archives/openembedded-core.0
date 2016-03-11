Return-Path: <joshua.g.lock@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 6FAA36212F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Mar 2016 10:43:55 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga103.jf.intel.com with ESMTP; 11 Mar 2016 02:43:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,320,1455004800"; d="scan'208";a="907905269"
Received: from jlock-mobl1.gar.corp.intel.com (HELO
	jlock-mobl.gar.corp.intel.com) ([10.252.4.28])
	by orsmga001.jf.intel.com with ESMTP; 11 Mar 2016 02:43:54 -0800
From: Joshua Lock <joshua.g.lock@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 11 Mar 2016 10:43:46 +0000
Message-Id: <cover.1457692914.git.joshua.g.lock@intel.com>
X-Mailer: git-send-email 2.5.0
Subject: [Fido][PATCH 0/1] Fido pull request
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
X-List-Received-Date: Fri, 11 Mar 2016 10:43:56 -0000

The single patch fixes nettle which was broken by a recent security fix.
Please merge it as soon as is convenient.

Regards,

Joshua

The following changes since commit 6c06c42594539bec4c360c8cc28ebee8a338e6b4:

  openssl: Security fix CVE-2016-0800 (2016-03-03 10:42:51 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib joshuagl/fido-next
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=joshuagl/fido-next

ngutzmann (1):
  nettle: The variable named p in the patch file was incorrectly named.

 meta/recipes-support/nettle/nettle-2.7.1/CVE-2015-8803_8805.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
2.5.0


