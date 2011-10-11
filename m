Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1RDkul-0003XV-L6
	for openembedded-core@lists.openembedded.org;
	Wed, 12 Oct 2011 00:35:11 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 11 Oct 2011 15:29:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,525,1312182000"; d="scan'208";a="72530511"
Received: from unknown (HELO scimitar.amr.corp.intel.com) ([10.255.15.64])
	by fmsmga001.fm.intel.com with ESMTP; 11 Oct 2011 15:29:28 -0700
From: Joshua Lock <josh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 11 Oct 2011 15:29:21 -0700
Message-Id: <cover.1318371066.git.josh@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
Subject: [RFC PATCH 0/1] QA check for defined packages
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 11 Oct 2011 22:35:11 -0000

Folks,

I'm looking for some comments on this WIP patch.

The reason I've added this is because the hob GUI requires us to offer much
more reliable metadata - we show the user available packages, as defined by
each recipe, to add to their image. Should a recipe define a package and yet
not actually create it and the user has included that in their image we cause
errors at build time.

However whilst the idea seems sound enough, there are some caveats - running
a world build with this patch I see failures fairly early on at least a few
of which I'd expect we'll need to special-case:
* eglibc-local
* linux-yocto
* linux-libc-headers
* gcc-runtime

Thoughts?

Thanks,

Joshua

Please review the following changes for suitability for inclusion. If you have
any objections or suggestions for improvement, please respond to the patches. If
you agree with the changes, please provide your Acked-by.

The following changes since commit 486b17af3e4cced76e9852e7634f75ea87433db2:

  shared-mime-info: Fix a parallel make race (2011-10-11 18:06:56 +0100)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib rfcqacheck
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rfcqacheck

Joshua Lock (1):
  insane.bbclass: add qa check to ensure declared packages exist

 meta/classes/insane.bbclass |    9 ++++++++-
 1 files changed, 8 insertions(+), 1 deletions(-)

-- 
1.7.6.4



