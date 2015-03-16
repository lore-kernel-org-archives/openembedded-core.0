Return-Path: <tanu.kaskinen@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id BFE4073998
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Mar 2015 18:55:28 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 16 Mar 2015 11:53:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,410,1422950400"; d="scan'208";a="666024008"
Received: from pduzinki-mobl.ger.corp.intel.com (HELO
	tkkaskin-mobl3.ger.corp.intel.com.ger.corp.intel.com)
	([10.252.10.191])
	by orsmga001.jf.intel.com with ESMTP; 16 Mar 2015 11:55:28 -0700
From: Tanu Kaskinen <tanu.kaskinen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 16 Mar 2015 20:55:23 +0200
Message-Id: <1426532125-1219-1-git-send-email-tanu.kaskinen@linux.intel.com>
X-Mailer: git-send-email 1.9.3
Subject: [PATCH 0/2] A couple of small pulseaudio fixes
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
X-List-Received-Date: Mon, 16 Mar 2015 18:55:30 -0000

Tanu Kaskinen (2):
  pulseaudio: move client.conf to libpulse
  pulseaudio: add system.pa to CONFFILES

 meta/recipes-multimedia/pulseaudio/pulseaudio.inc | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

-- 
1.9.3


