Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1UV3qF-0002kn-Rb
	for openembedded-core@lists.openembedded.org;
	Wed, 24 Apr 2013 19:50:54 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 24 Apr 2013 10:31:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,542,1363158000"; d="scan'208";a="324005260"
Received: from envy2.jf.intel.com (HELO envy2.home) ([10.7.199.68])
	by orsmga002.jf.intel.com with ESMTP; 24 Apr 2013 10:32:54 -0700
Message-ID: <51781746.2000509@linux.intel.com>
Date: Wed, 24 Apr 2013 10:32:54 -0700
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130110 Thunderbird/17.0.2
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Enigmail-Version: 1.5.1
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>, "Garman,
	Scott A" <scott.a.garman@intel.com>
Subject: Stable Release Process
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 24 Apr 2013 17:50:59 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

As the stable releases become first class citizens, we should probably
look at streamlining the process of getting patches to them.

The maintainer for the stable release currently changes by release,
which undoubtedly creates some confusion of where to send patches and
who to CC. These maintainers currently attempt to track these
patches via email filters searching for release branch names and such,
which is proving tedious and prone to missing patches.

Other projects have seen good results using a stable list for this
purpose. This would both make it obvious when a patch is intended for a
stable release as well as remove any confusion about who to Cc as it
would be the same list for all releases. Perhaps something like
openembedded-core-stable@lists.openembedded.org?

In addition to the list, some policy would need to be documented on how
to use the list. For example, it should always be Cc'd, and never
emailed with patches directly that don't go first to the master branch.
Backports being the exception. A policy could also be put in place to
aid in automatic processing, such as that employed by the Linux kernel
stable project. The following would request that the patch be applied to
the denzil and danny stable releases:

Cc: <openembedded-core-stable@lists.openembedded.org> # denzil
Cc: <openembedded-core-stable@lists.openembedded.org> # danny
Signed-off-by: Darren Hart <dvhart@linux.intel.com>

The advantage here over something like a subject tag, "[danny]" is that
it scales a bit better to sending a patch for multiple releases.

There are certainly other approaches, I mention this one as it has a
proven track record and I don't have a reason to deviate from it.

Thoughts?

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Technical Lead - Linux Kernel


