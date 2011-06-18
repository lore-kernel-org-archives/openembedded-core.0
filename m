Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1QXlyh-0002p3-Hs
	for openembedded-core@lists.openembedded.org;
	Sat, 18 Jun 2011 05:13:43 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 17 Jun 2011 20:09:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,384,1304319600"; d="scan'208";a="14773117"
Received: from unknown (HELO [10.255.13.73]) ([10.255.13.73])
	by azsmga001.ch.intel.com with ESMTP; 17 Jun 2011 20:09:08 -0700
From: Joshua Lock <josh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 17 Jun 2011 20:09:03 -0700
In-Reply-To: <cover.1308365562.git.josh@linux.intel.com>
References: <cover.1308365562.git.josh@linux.intel.com>
X-Mailer: Evolution 3.0.2 (3.0.2-2.fc15) 
Message-ID: <1308366548.2245.14.camel@scimitar>
Mime-Version: 1.0
Subject: Re: [RFC PATCH 0/2] Sanity testing network connectivity
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
X-List-Received-Date: Sat, 18 Jun 2011 03:13:43 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-06-17 at 20:04 -0700, Joshua Lock wrote:
> In response to a Yocto Bugzilla request[1] I've written a sanity test to check
> whether BitBake is able to fecth from http, https and git sources. The idea
> being that if the user is behing a proxy and this test fails we can more easily
> help them diagnose and fix their problem.
> 
> I've built on the existing infrastructure for less frequent sanity tests so
> whilst this test is reasonably heavy it will only run when TMPDIR changes
> (usually first run?). Further I added a variable to disable just this sanity
> check. People shipping offline installs to customers should just be able to
> set the variable in their shipped configuration and not worry about this
> sanity check irritating people.
> 
> The error message points to a wiki page[2] which is pretty vanilla right now
> but the intention would be to flesh it out with guidance on common proxy/nat/etc
> issues.

I cunningly forgot the url's I referenced. Friday evening, sorry.

1. http://bugzilla.pokylinux.org/show_bug.cgi?id=933
2. https://wiki.yoctoproject.org/wiki/Connectivity_Troubleshooting

Joshua
-- 
Joshua Lock
        Yocto Build System Monkey
        Intel Open Source Technology Centre



