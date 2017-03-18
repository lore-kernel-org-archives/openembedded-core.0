Return-Path: <cshored@cshore.thecshore.com>
Received: from s2.neomailbox.net (s2.neomailbox.net [5.148.176.60])
	by mail.openembedded.org (Postfix) with ESMTP id 64D2977B34
	for <openembedded-core@lists.openembedded.org>;
	Sat, 18 Mar 2017 02:36:52 +0000 (UTC)
Date: Fri, 17 Mar 2017 22:36:48 -0400
From: Daniel Dickinson <cshored@cshore.thecshore.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20170317223035.697b8832@danielf.thecshore.com>
In-Reply-To: <c72438d4-adb6-0c1c-136c-eeae2ef3b8a8@gmail.com>
References: <20170317195515.35729bb7@danielf.thecshore.com>
	<3a6a7bd6-a5e5-b139-bc2a-53d3b6b41da5@mlbassoc.com>
	<20170317213807.377236b9@danielf.thecshore.com>
	<c72438d4-adb6-0c1c-136c-eeae2ef3b8a8@gmail.com>
MIME-Version: 1.0
Subject: Re: Hints on submitting to OE-Core
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
X-List-Received-Date: Sat, 18 Mar 2017 02:36:57 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 17 Mar 2017 19:17:36 -0700
Khem Raj <raj.khem@gmail.com> wrote:

> On 3/17/17 6:38 PM, Daniel Dickinson wrote:
> > On Sat, 18 Mar 2017 02:21:30 +0100
> > Gary Thomas <gary@mlbassoc.com> wrote:
> >   
> >>
> >> Have you read this?
> >>    http://www.openembedded.org/wiki/How_to_submit_a_patch_to_OpenEmbedded  
> > 
> > I hadn't read in detail yet (I've seen similar before and from
> > skimming, it's about mechanics of the process), but I was looking
> > more in terms of coding and/or style guidelines for the meat of the
> > patch, and/or hints/tips on getting things accepted from the point
> > of view of things other than mechanics of patch submission.  
> 
> If you read through that link Gary pointed, there are links to two
> other documents one of style and other one patch message guidelines
> 

Ah, missed that on initial perusal, thank you.

> there is styling scripts for metadata files, you could use that
> https://github.com/openembedded/meta-openembedded/blob/master/contrib/oe-stylize.py


Will use thatt.

> As of meat of patch, if its fixing something and you are articulate to
> explain it in your commit message and in general review cycle, you
> have a better chance of getting it accepted, but you have to start
> submitting

I'm kind of hoping to get some feedback on the meta-runit-init, and
meta-earlyinit layers I've submitted to the layers listing (and to find
things I've missed) (perhaps as well as meta-cshored, but I don't think
there is as much there that's as likely to be generally useful) before
looking at working on getting them integrated into core.  Of course it
helps if the layers listing doesn't show builds failing (in this case
not because of an error on my part).

Regards,

Daniel

