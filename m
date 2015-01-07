Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id CEB8F728C2
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Jan 2015 16:00:48 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga102.fm.intel.com with ESMTP; 07 Jan 2015 08:00:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.07,715,1413270000"; d="scan'208";a="665862010"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by orsmga002.jf.intel.com with ESMTP; 07 Jan 2015 08:00:43 -0800
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  7 Jan 2015 18:00:40 +0200
Message-Id: <1420646442-28948-1-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 1.8.4.5
MIME-Version: 1.0
Cc: paul.eggleton@linux.intel.com
Subject: [PATCH v2 0/2] combo-layer: support updating up to arbitrary commit
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
X-List-Received-Date: Wed, 07 Jan 2015 16:00:52 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

I split my changeset into two separate patches. Also, fixed a bug when doing
calling pull inside the update action.

Markus Lehtonen (2):
  combo-layer: minor refactor
  combo-layer: support updating up to arbitrary commit

 scripts/combo-layer | 45 +++++++++++++++++++++++++++------------------
 1 file changed, 27 insertions(+), 18 deletions(-)

-- 
1.8.4.5


