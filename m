Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1RsbWK-00063c-VW
	for openembedded-core@lists.openembedded.org;
	Wed, 01 Feb 2012 15:50:50 +0100
Received: from yow-bashfiel-l1.corp.ad.wrs.com
	(yow-bashfiel-d3.ottawa.windriver.com [128.224.147.67])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q11EgnoI002109;
	Wed, 1 Feb 2012 06:42:50 -0800 (PST)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Wed,  1 Feb 2012 09:42:45 -0500
Message-Id: <1328107366-22541-1-git-send-email-bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.4.1
Cc: chris_larson@mentor.com, openembedded-core@lists.openembedded.org
Subject: [RFC PATCH 0/1] classes/patch: return "other" elements found on the SRC_URI
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
X-List-Received-Date: Wed, 01 Feb 2012 14:50:50 -0000

Richard,

When working with Tom on some BSP usability cases, he noted that it was nice
that we can specify more complex features in the SRC_URI now that patch
ordering and location is maintained by using the src_patches abstraction that
Chris added to patch.bbclass. But .. there's always a but, you had to
specify some sort of patch to trigger the processing.

Rather than hack something in that is specific to linux-yocto, it seemed
like a good idea to add the ability to get 'anything that isn't a patch'
from the same routines that Chris added to patch.bbclass.

I'm now using this support to pickup all sorts of things from the SRC_URI,
without knowing anything about the format of the SRC_URI itself. Extra
filtering on 'other' is the responsibility of the caller.

I'm not the worlds top python coder yet, so I'm sure there are better ways
to do this, hence why I'm calling this an RFC patch. I can re-work it 
as appropriate to get it into the tree, and I'll follow up with my user
of the new functionality.

Cheers,

Bruce

cc: Chris Larson <chris_larson@mentor.com>


