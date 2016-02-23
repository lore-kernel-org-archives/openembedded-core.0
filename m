Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 6383477331
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Feb 2016 11:36:33 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga102.fm.intel.com with ESMTP; 23 Feb 2016 03:36:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,489,1449561600"; d="scan'208";a="892595214"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by orsmga001.jf.intel.com with ESMTP; 23 Feb 2016 03:36:24 -0800
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 23 Feb 2016 13:36:22 +0200
Message-Id: <1456227383-9212-1-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.6.2
Subject: [PATCH] Wipe ${S} before unpacking sources
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
X-List-Received-Date: Tue, 23 Feb 2016 11:36:34 -0000

It would seem reasonable that do_unpack() always results in a pristine source
tree. This patch causes ${S} to be removed before unpacking sources.

I didn't quite understand what kind of "investigation" the following code
comment in do_unpack() was referring to:
  # TODO: Investigate if we can remove
  # the entire ${S} in this case.
What kind of special cases might we have? At least qemux86 core-image-sato
builds fine for me.

[YOCTO #9064]

Markus Lehtonen (1):
  base.bbclass wipe ${S} before unpacking source

 meta/classes/base.bbclass | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

-- 
2.6.2


