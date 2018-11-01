Return-Path: <robert.joslyn@redrectangle.org>
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
	[217.70.183.197])
	by mail.openembedded.org (Postfix) with ESMTP id 80B817458D
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Nov 2018 05:39:26 +0000 (UTC)
X-Originating-IP: 50.37.87.235
Received: from xps13.localdomain (50-37-87-235.mscw.id.frontiernet.net
	[50.37.87.235])
	(Authenticated sender: robert.joslyn@redrectangle.org)
	by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 63ABB1C0003;
	Thu,  1 Nov 2018 05:39:25 +0000 (UTC)
Message-ID: <1541050762.8937.20.camel@redrectangle.org>
From: Robert Joslyn <robert.joslyn@redrectangle.org>
To: Andre McCurdy <armccurdy@gmail.com>
Date: Wed, 31 Oct 2018 22:39:22 -0700
In-Reply-To: <CAJ86T=W08p366z458VjejjFkVTTFu23o9U2o6utp027a0p7r9w@mail.gmail.com>
References: <20181101025320.21456-1-robert.joslyn@redrectangle.org>
	<CAJ86T=W08p366z458VjejjFkVTTFu23o9U2o6utp027a0p7r9w@mail.gmail.com>
X-Mailer: Evolution 3.24.6 
Mime-Version: 1.0
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [pyro][PATCH] openssl: Update from 1.0.2n to 1.0.2p
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
X-List-Received-Date: Thu, 01 Nov 2018 05:39:27 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2018-10-31 at 20:31 -0700, Andre McCurdy wrote:
> On Wed, Oct 31, 2018 at 7:54 PM Robert Joslyn
> <robert.joslyn@redrectangle.org> wrote:
> > 
> > Refresh parallel.patch.
> > 
> > Remove duplicate LIC_FILES_CHKSUM assignment.
> > 
> > License-Update: Updated copyright years
> 
> Normally a backport to pyro would be merged to sumo and rocko first,
> so this would be done in steps:
> 
> 1) Backport the existing patches to update 1.0.2n -> 1.0.2o from
> rocko to pyro
> 
> 2) Update rocko from 1.0.2o -> 1.0.2p, ideally by backporting patches
> already in sumo. Note however that the update to 1.0.2p in sumo comes
> with a lot of non-critical cleanups and it's questionable how far
> back
> we want to port those, so a new patch which just updates the version
> might be preferred?
> 
> 3) Backport whatever 1.0.2o -> 1.0.2p patches are merged to rocko
> into pyro.

I debated how much to backport from sumo, and thought I would try to
minimize the changes to the rocko and pyro branches. The two patches I
sent are pretty much the minimum required to get 1.0.2p working with
rocko and pyro.

It's probably easiest to take what's on sumo directly back to rocko and
then pyro. I'll test that tomorrow and resend the patches if there's no
objection to taking the other small fixes. I have a feeling trying to
pull out small cleanups is more trouble than it's worth (for my
purposes at least), but I'll do so if that's preferred.

Thanks,
Robert

