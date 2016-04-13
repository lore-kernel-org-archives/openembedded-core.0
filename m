Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id A8F1B605FF
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Apr 2016 21:33:11 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga103.jf.intel.com with ESMTP; 13 Apr 2016 14:33:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,481,1455004800"; d="scan'208";a="944599564"
Received: from unknown (HELO peggleto-mobl.ger.corp.intel.com) ([10.255.145.9])
	by fmsmga001.fm.intel.com with ESMTP; 13 Apr 2016 14:33:09 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Mike Crowe <mac@mcrowe.com>
Date: Thu, 14 Apr 2016 09:33:07 +1200
Message-ID: <2659265.dUGdYN6AGr@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.10 (Linux/4.4.6-301.fc23.x86_64; KDE/4.14.18; x86_64; ;
	)
In-Reply-To: <CAP9ODKpPEmPQuz7rJWfzCz5Rw4rpBHvBoRAg-FXktNd2nu6vRg@mail.gmail.com>
References: <20160329125626.GA11712@mcrowe.com>
	<20160413140103.GA14803@mcrowe.com>
	<CAP9ODKpPEmPQuz7rJWfzCz5Rw4rpBHvBoRAg-FXktNd2nu6vRg@mail.gmail.com>
MIME-Version: 1.0
Cc: Otavio Salvador <otavio.salvador@ossystems.com.br>,
	openembedded-core@lists.openembedded.org
Subject: Re: Over-pruning the sstate cache
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
X-List-Received-Date: Wed, 13 Apr 2016 21:33:12 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wed, 13 Apr 2016 11:11:11 Otavio Salvador wrote:
> On Wed, Apr 13, 2016 at 11:01 AM, Mike Crowe <mac@mcrowe.com> wrote:
> > On Wednesday 13 April 2016 at 10:47:13 -0300, Otavio Salvador wrote:
> >> Couldn't this to be done, similar to the fetchall task?
> > 
> > That's the sort of thing I was thinking of with my "all_populate_sysroot"
> > task in my original question.
> > 
> > But, I've a working script using Richard's method now. I'll share it once
> > I've tested it a bit more.
> 
> Having it as a task allows it to avoid races and like, when running
> inside of the BitBake. It also can reuse the metadata database
> information and ought to be faster. Once you share the script I will
> see if I can rework it to a task and see how it looks.

FWIW there's a bug open to implement this as an option to bitbake:

  https://bugzilla.yoctoproject.org/show_bug.cgi?id=7733

It's currently assigned to me and was targeted for 2.0; at this stage it'll be 
2.1. If there's interest in having this implemented we can certainly increase 
the priority, since up to this point it was just an idea I had.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

