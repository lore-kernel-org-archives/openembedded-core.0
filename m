Return-Path: <joshua.g.lock@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 9BE2877352
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Feb 2016 21:42:32 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 25 Feb 2016 13:42:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,498,1449561600"; d="scan'208";a="911388159"
Received: from jlock-mobl1.gar.corp.intel.com ([10.252.4.104])
	by fmsmga001.fm.intel.com with ESMTP; 25 Feb 2016 13:42:32 -0800
Message-ID: <1456436543.13135.7.camel@linux.intel.com>
From: Joshua G Lock <joshua.g.lock@linux.intel.com>
To: Philip Balister <philip@balister.org>, Paul Eggleton
	<paul.eggleton@linux.intel.com>, openembedded-core@lists.openembedded.org
Date: Thu, 25 Feb 2016 21:42:23 +0000
In-Reply-To: <56CE1543.7050703@balister.org>
References: <cover.1456325292.git.joshua.g.lock@intel.com>
	<56CDD519.9050109@gmail.com> <56CDDBCD.6090303@balister.org>
	<2791977.VXU03QmIbh@peggleto-mobl.ger.corp.intel.com>
	<56CE1543.7050703@balister.org>
X-Mailer: Evolution 3.18.5.1 (3.18.5.1-1.fc23) 
Mime-Version: 1.0
Subject: Re: [PATCH 00/10] Integrate swupd software updater
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
X-List-Received-Date: Thu, 25 Feb 2016 21:42:33 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2016-02-24 at 15:40 -0500, Philip Balister wrote:
> On 02/24/2016 02:51 PM, Paul Eggleton wrote:
> > 
> > On Wed, 24 Feb 2016 11:35:25 Philip Balister wrote:
> > > 
> > > On 02/24/2016 11:06 AM, Trevor Woerner wrote:
> > > > 
> > > > Ideally the work done here and the work done on meta-
> > > > swupdate[1] would
> > > > be somehow merged so people creating images/distros would only
> > > > have to
> > > > learn and integrate one software update solution, instead of
> > > > having to
> > > > evaluate and choose between the two (or more?).
> > > > 
> > > > [1] https://github.com/sbabic/meta-swupdate
> > > Amen. I had the same thoughts reading the patch set intro.
> > I think it would be hard to integrate these two, since they operate
> > quite 
> > differently to eachother.
> >  
> > > 
> > > Maybe the swupd should go in a seperate layer so we can see which
> > > project works best for oe users before moving something directly
> > > into
> > > oe-core?
> > This makes sense to me too though FWIW. The os-release patch should
> > probably 
> > go straight in, but everything else looks like it could comfortably
> > live in a 
> > separate layer without making things too difficult.
> It also makes it easier to update as problems in swupd are resolved
> since you do not need to go through the entire oe-core testing cycle.

I've pushed the series, including a couple of metadata fixes suggested
in reply, as a layer here: http://git.yoctoproject.org/cgit/cgit.cgi/me
ta-swupd/

Regards,

Joshua

