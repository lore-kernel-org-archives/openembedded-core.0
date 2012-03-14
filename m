Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1S7qB3-0006rO-Kb
	for openembedded-core@lists.openembedded.org;
	Wed, 14 Mar 2012 16:31:49 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 14 Mar 2012 08:23:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="120959173"
Received: from unknown (HELO helios.localnet) ([10.252.123.190])
	by orsmga002.jf.intel.com with ESMTP; 14 Mar 2012 08:22:02 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 14 Mar 2012 15:22:01 +0000
Message-ID: <5226796.UE7FcEyag2@helios>
Organization: Intel Corporation
User-Agent: KMail/4.8.0 (Linux/3.0.0-16-generic-pae; KDE/4.8.1; i686; ; )
In-Reply-To: <4F60B557.5060304@intel.com>
References: <cover.1331684953.git.scott.a.garman@intel.com>
	<20120314150033.GJ3919@jama.jama.net> <4F60B557.5060304@intel.com>
MIME-Version: 1.0
Cc: Darren Hart <darren.hart@intel.com>,
	Scott Rifenbark <scott.m.rifenbark@linux.intel.com>
Subject: Re: [PATCH 1/1] ncurses: fix packaging of moved libraries
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
X-List-Received-Date: Wed, 14 Mar 2012 15:31:49 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday 14 March 2012 08:12:23 Darren Hart wrote:
> Perhaps. ALLOW_EMPTY is not defined in poky/documentation/* nor in
> poky/conf/documentation.conf.
> 
> (I realize this oe-core and not poky, but this is the best reference I
> know of)
> 
> Could you provide a terse description of how ALLOW_EMPTY* is meant to be
> used, its effects, and any needful cautionary text? Scott can then add
> it to the above documentation.

ALLOW_EMPTY (which like all package-controlling variables should always be 
used in conjunction a package name override, e.g. ALLOW_EMPTY_${PN}) just 
specifies that empty packages are actually produced instead of the default 
behaviour where they are skipped. This is mostly useful where there is an 
RDEPENDS or other runtime hard-requirement on the package existing.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


