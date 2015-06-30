Return-Path: <joshua.lock@collabora.co.uk>
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [93.93.135.160])
	by mail.openembedded.org (Postfix) with ESMTP id BB42B6AC15
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jun 2015 15:07:03 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: joshuagl) with ESMTPSA id 9432511A8489
Message-ID: <1435676821.3178.4.camel@collabora.co.uk>
From: Joshua Lock <joshua.lock@collabora.co.uk>
To: Andre McCurdy <armccurdy@gmail.com>
Date: Tue, 30 Jun 2015 16:07:01 +0100
In-Reply-To: <CAJ86T=WvDKfhK_DTcZmBEZkuTJ-bQWTKqmR8bCak6tr9vkKwuw@mail.gmail.com>
References: <1435486480.10583.85.camel@linuxfoundation.org>
	<1435573194.3287.13.camel@collabora.co.uk>
	<CAJ86T=WvDKfhK_DTcZmBEZkuTJ-bQWTKqmR8bCak6tr9vkKwuw@mail.gmail.com>
X-Mailer: Evolution 3.16.3 (3.16.3-2.fc22) 
Mime-Version: 1.0
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: fido status
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
X-List-Received-Date: Tue, 30 Jun 2015 15:07:09 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2015-06-29 at 13:25 -0700, Andre McCurdy wrote:
> On Mon, Jun 29, 2015 at 3:19 AM, Joshua Lock
> <joshua.lock@collabora.co.uk> wrote:
> > On Sun, 2015-06-28 at 11:14 +0100, Richard Purdie wrote:
> > > I just wanted to let people know what is going on with Fido.
> > > 
> > > Joshua has had a branch in testing for a while. The autobuilder 
> > > gave
> > > mixed feedback for it. Partly, there was a problem since we'd
> > > introduced
> > > a new autobuilder (Fedora 22) and this introduced some problems 
> > > with
> > > subversion-native and gcc5. Partly there were also networking 
> > > issues
> > > on
> > > the autobuilders related to runqemu.
> > > 
> > > Thanks to some help from Michael, we've tracked down and sorted 
> > > the
> > > networking issue (we hope!). I therefore took the decision to 
> > > merge
> > > Joshua's fido-next branch myself, now, with the addition of the
> > > subversion fixes to the fido branch.
> > 
> > Thanks for merging Richard, the number of patches was starting to 
> > get
> > unwieldy so I'm pleased to see this happen.
> > 
> > > 
> > > I've triggered another build which is underway at the moment and 
> > > I'm
> > > confident the result should be reasonable. What I am expecting is
> > > failures for oe-selftest and for nightly-aarm64 and nightly
> > > -mips64.
> > > There are fixes just merged into master which resolve issues in 
> > > all
> > > three areas, I'm hoping we can queue up a fido-next with those in 
> > > and
> > > get fido building green quickly. Those issues are less of an 
> > > issue
> > > given
> > > we know what the issues are and they are testing issues, not 
> > > 'real'
> > > bugs.
> > 
> > Your prediction was very accurate. I've merged a bunch of fixes for 
> > the
> > issues you highlighted (and a couple of others) into my fido-next
> > branch[1]. I shall endeavour to get this tested on the autobuilder 
> > and
> > submitted for merge over the next couple of days.
> 
> One minor comment on the patches already merged. This change:
> 
>   http://git.openembedded.org/openembedded
> -core/commit/?h=fido&id=f46c2ac0fd05f0e10258d8f03bfb2ebd0c2bcbe3
> 
> was reported to cause problems for multilib [1]. It needs this follow
> -on fix:
> 
>   http://git.openembedded.org/openembedded-core/commit/?h=master
> -next&id=78a0e916882a747c267808c08ab8bc615198b5a8
> 
> [1] http://lists.openembedded.org/pipermail/openembedded-core/2015
> -May/105351.html

Thanks for raising this Andre - I've included the above change in my
fido-next branch[1].

Regards,

Joshua

1. http://cgit.openembedded.org/openembedded-core
-contrib/log/?h=joshuagl/fido-next

