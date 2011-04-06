Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Q7dBo-0005G8-6Z for openembedded-core@lists.openembedded.org;
	Thu, 07 Apr 2011 02:35:12 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p370X198031043;
	Thu, 7 Apr 2011 01:33:01 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 30611-07; Thu,  7 Apr 2011 01:32:54 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p370Wa4S030995
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Thu, 7 Apr 2011 01:32:43 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <4D9CA452.1020205@mentor.com>
References: <cover.1302050252.git.tom_rini@mentor.com>
	<95d636004deffc0d6473c67ee9b5ce62937dc085.1302050252.git.tom_rini@mentor.com>
	<BANLkTi=RTLB21JAz4N2B2kPWu6H3uTHn1w@mail.gmail.com>
	<4D9C78F5.1090808@mentor.com>
	<BANLkTi=UeQ22hquxLPihJAnLzpW8ODpAkg@mail.gmail.com>
	<4D9C9E75.1060203@mentor.com>
	<BANLkTimuM8GCHd11cuH5ULA6jL=3kZDk6w@mail.gmail.com>
	<4D9CA452.1020205@mentor.com>
Date: Wed, 06 Apr 2011 14:16:41 -0700
Message-ID: <1302124601.22904.88.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 1/1] ncurses: Update to 5.9
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
X-List-Received-Date: Thu, 07 Apr 2011 00:35:12 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-04-06 at 10:35 -0700, Tom Rini wrote:
> On 04/06/2011 10:26 AM, Khem Raj wrote:
> > On Wed, Apr 6, 2011 at 10:10 AM, Tom Rini <tom_rini@mentor.com> wrote:
> >> On 04/06/2011 10:05 AM, Khem Raj wrote:
> >>> On Wed, Apr 6, 2011 at 7:30 AM, Tom Rini <tom_rini@mentor.com> wrote:
> >>>> On 04/05/2011 11:18 PM, Khem Raj wrote:
> >>>>> On Tue, Apr 5, 2011 at 5:38 PM, Tom Rini <tom_rini@mentor.com> wrote:
> >>>>>> The previous 5.7 release was relatively close to 5.8 due to it bringing
> >>>>>> in a patch to sync with upstream work-in-progress.  We skip over the
> >>>>>> 5.8 release and move to 5.9.
> >>>>>
> >>>>>
> >>>>> there already are patches for 5.9 available too
> >>>>> ftp://invisible-island.net/ncurses/5.9/ncurses-5.9.patch.gz
> >>>>
> >>>> Wrong link?  That reverse applies to ncurses 5.9 release. But
> >>>> regardless, is ncurses something we need to be tracking top of tree for?
> >>>>  It seems like we needed to for 5.7 since there had been a lot going on
> >>>> without a release but that seems to have changed now.
> >>>>
> >>>
> >>> those patches usually contain critical bug fixes including security updates
> >>> so it will be of interest to keep track of it
> >>
> >> Well, it doesn't currently.  And while I agree we need to do a good job,
> >> everywhere, of keeping track of security updates, I don't think we
> >> should move back to depending on a site that frequently removes patches.
> >>
> > 
> > yes. cache the patches like yocto did for 5.7 recipes
> 
> That still leaves the problem of there not being a valid patch there at
> the moment.  And I still don't see why ncurses needs to be in the bucket
> of recipes we track the scm for rather than relying on the latest stable
> release.

It sounds like these patches are more like tracking an SCM rather than a
source of specific security patches or critical updates.

I think it might be wise to note this location in the recipe as a
comment (can someone please send an updated patch) but I don't think we
should be including these patches by default, particular if upstream are
making regular releases again.

Cheers,

Richard



