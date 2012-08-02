Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1Swt9C-0005AW-C9
	for openembedded-core@lists.openembedded.org;
	Thu, 02 Aug 2012 13:00:54 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 02 Aug 2012 03:49:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="174600669"
Received: from unknown (HELO helios.localnet) ([10.252.121.75])
	by orsmga001.jf.intel.com with ESMTP; 02 Aug 2012 03:49:11 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 02 Aug 2012 11:49:10 +0100
Message-ID: <40727268.akUMmXJU4Z@helios>
Organization: Intel Corporation
User-Agent: KMail/4.8.4 (Linux/3.2.0-27-generic-pae; KDE/4.8.4; i686; ; )
In-Reply-To: <CAJTo0LZ7QJtfzmsg2a++ay8YoNOptRFohWwQrKNT0JrHYkYRbw@mail.gmail.com>
References: <cover.1343899228.git.paul.eggleton@linux.intel.com>
	<db2dd38ac0b16d55f729f63010e38dda4dcfced5.1343899228.git.paul.eggleton@linux.intel.com>
	<CAJTo0LZ7QJtfzmsg2a++ay8YoNOptRFohWwQrKNT0JrHYkYRbw@mail.gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 6/9] scripts: add buildhistory-tag script
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
X-List-Received-Date: Thu, 02 Aug 2012 11:00:54 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday 02 August 2012 11:18:20 Burton, Ross wrote:
> On 2 August 2012 10:23, Paul Eggleton <paul.eggleton@linux.intel.com> wrote:
> > This trivial script determines BUILDHISTORY_DIR using bitbake and then
> > passes the command line options to "git tag" on the buildhistory
> > repository. This is useful for setting a tag before making some changes;
> > even if the build takes a number of executions of bitbake (resulting in
> > multiple commits to the buildhistory repository) you can still do the
> > overall comparison easily.
> > 
> > Suggested by Ross Burton <ross.burton@intel.com>.
> 
> I've since changed my local script to be "buildhistory" that just runs
> git "$@", so "buildhistory log" etc work nicely.

Interesting - sounds like it would be useful, but I wonder how it would then 
fit in with buildhistory-diff as a separate script (particularly with diff as a 
valid option to "buildhistory")...

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


