Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1T8t4f-0001Fd-HI
	for openembedded-core@lists.openembedded.org;
	Tue, 04 Sep 2012 15:21:49 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 04 Sep 2012 06:09:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,367,1344236400"; d="scan'208";a="196502640"
Received: from unknown (HELO helios.localnet) ([10.252.121.161])
	by orsmga002.jf.intel.com with ESMTP; 04 Sep 2012 06:09:26 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 04 Sep 2012 14:09:25 +0100
Message-ID: <74822987.JhaWBib2Ju@helios>
Organization: Intel Corporation
User-Agent: KMail/4.9 (Linux/3.2.0-29-generic-pae; KDE/4.9.0; i686; ; )
In-Reply-To: <20120904125810.GE3372@jama.jama.net>
References: <cover.1346668109.git.paul.eggleton@linux.intel.com>
	<20120904125810.GE3372@jama.jama.net>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 00/28] Package group fixes
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
X-List-Received-Date: Tue, 04 Sep 2012 13:21:49 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday 04 September 2012 14:58:10 Martin Jansa wrote:
> On Mon, Sep 03, 2012 at 11:30:20AM +0100, Paul Eggleton wrote:
> > This rather large set of changes renames "task" to "packagegroup" and
> > attempts to clean up a number of package group related issues [1]. It
> > doesn't go quite as far as I had hoped - I wanted to tidy up the base,
> > core-lsb and core-basic recipes even further, but unfortunately I ran
> > out of time for this cycle.
> > 
> > [1] http://www.openembedded.org/wiki/OE-Core_Task_Rework
> 
> It looks like this does not have any upgrade path from old task-*
> recipes.

You mean, the *packages* on an existing target; there is an upgrade path for 
the recipes at build time via RPROVIDES.

I can send a patch to add the RREPLACES, but then the question is when can 
they be removed in future? I don't particularly like the answer "never". If we 
do have to enable supporting them in perpetuity I'd much rather they get added 
to an inc file that can optionally be included at the distro level by those who 
want to support upgrades from much older versions to a newer one.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


