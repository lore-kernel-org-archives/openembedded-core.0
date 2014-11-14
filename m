Return-Path: <brendan.le.foll@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 0E7EC712A7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Nov 2014 16:21:41 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 14 Nov 2014 08:21:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.07,386,1413270000"; d="scan'208";a="607914639"
Received: from unknown (HELO jupiter.iwi.intel.com) ([172.28.33.52])
	by orsmga001.jf.intel.com with ESMTP; 14 Nov 2014 08:21:35 -0800
Date: Fri, 14 Nov 2014 16:21:32 +0000
From: Brendan Le Foll <brendan.le.foll@intel.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20141114162131.GG15651@jupiter.iwi.intel.com>
MIME-Version: 1.0
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
	Swindon SN3 1RJ
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: uclibc recipes in oe-core versioning & using upstream
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
X-List-Received-Date: Fri, 14 Nov 2014 16:21:44 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

I'm trying to understand the logic behind the uclibc recipes, it seems
it is using fairly random points in history of git master and not the
0.9.33 point releases that have been made.

What is the logic behind that and why not use the upstream release
builds as a starting point?

Thanks,
Brendan

