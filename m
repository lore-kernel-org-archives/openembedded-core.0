Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.zanussi@intel.com>) id 1TvYqK-0003mM-8t
	for openembedded-core@lists.openembedded.org;
	Wed, 16 Jan 2013 20:40:16 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 16 Jan 2013 11:24:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,480,1355126400"; d="scan'208";a="191911229"
Received: from unknown (HELO [10.255.14.217]) ([10.255.14.217])
	by AZSMGA002.ch.intel.com with ESMTP; 16 Jan 2013 11:24:48 -0800
Message-ID: <1358364288.1665.74.camel@empanada>
From: Tom Zanussi <tom.zanussi@intel.com>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 16 Jan 2013 13:24:48 -0600
In-Reply-To: <20130116184759.GG3002@jama>
References: <20130116115800.A69171034D@opal> <20130116140919.GD3002@jama>
	<1358350681.1665.31.camel@empanada>
	<CABcZAN=u7_BGuAQGhYF134PedRq0KkHrgBEtPoN1Tet_T-O6Lw@mail.gmail.com>
	<1358354428.1665.54.camel@empanada>
	<CABcZANmR8vAcEFwOWBf7PdufdZTCXwWFreegpREWj99EzH1caA@mail.gmail.com>
	<20130116184759.GG3002@jama>
X-Mailer: Evolution 3.4.1 (3.4.1-2.fc17) 
Mime-Version: 1.0
Cc: Chris Larson <clarson@kergoth.com>, Patches,
	oe-core layer <openembedded-core@lists.openembedded.org>
Subject: Re: [oe-commits] Tom Zanussi : lttng2-ust: rename to lttng-ust
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
X-List-Received-Date: Wed, 16 Jan 2013 19:40:27 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2013-01-16 at 19:47 +0100, Martin Jansa wrote:
> On Wed, Jan 16, 2013 at 11:02:41AM -0700, Chris Larson wrote:
> > On Wed, Jan 16, 2013 at 9:40 AM, Tom Zanussi <tom.zanussi@intel.com> wrote:
> > 
> > > This is for the userspace tracing part, lttng-ust, which AFAIK doesn't
> > > require any kernel patches.
> > >
> > 
> > Yes, but the point was, as far as I know, the newer ust requires the newer
> > kernel components, and the older requires the older kernel components, so
> > technically the package upgrade on a device is likely to change the
> > behavior.
> > 
> > I didn't say the current version required patches, the point was about the
> > upgrade path for this recipe. I suspect we're one of the only companies
> > that was actually using the old recipes, and we don't particularly care
> > about the binary package upgrade paths at this time, but again, this is
> > *not* a particularly smooth binary package upgrade path. I expect we're
> > fine with that, but I wanted make sure it was an explicit conscious choice
> > of behavior, not something unexpected.
> 
> From what you said it looks like recipe shouldn't be renamed in first
> place.
> 

You may be right and what's confusing things is that the new name of the
lttng project actually includes the version number as part of its name
despite it being a completely new project.

So I could submit a patch to rename lttng-ust back to lttng2-ust, but
that would be inconsistent with the other packages in 'lttng2' - it
would in that case make sense to rename them also to lttng2-prefixed
versions i.e. lttng2-modules, lttng2-tools.   It does get kind of
awkward when lttng2 releases a version 3  though- we'd have an
lttng2_ust_3.0 then.  Or will we just rename everything to lttng3_* at
that point, which if the lttng project doesn't do the same, means we'd
have provide some kind of mapping to say that our lttng3 is actually
lttng 2.0's 3.0 and so on...

Or we could just keep everything as lttng-*, rename the lttng2-ust now
and just keep it that way in future regardless of what lttngX decides to
name itself next time.

I'm happy to do either, depending on what people want..

Tom

> I'm not interested in lttng, first I was commenting only about recipe
> being renamed without RPROVIDES/RREPLEACES/RCONFLICTS combo and then I
> was surprised to see that ERROR about version downgrade from
> buildhistory.
> 
> Cheers,




