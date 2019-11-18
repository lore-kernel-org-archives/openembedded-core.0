Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id C7FB17F69E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Nov 2019 22:06:16 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 47H31z5ywwz9n;
	Mon, 18 Nov 2019 23:06:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1574114776;
	bh=5jOpSDuWGEDtwEdylzHkACzijUtLEgKqD4fKoBZth1M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fXOmtP/1lf/yg1CIX5Zv/o+Po/jtBgLyRQuSVZcxa20BVGJ7anjKvwudvRrT4HLOO
	deusCFhDu+PZGzYdwzY9kEmSO0sLpSBy+E/gv1QDrty6NRI0vCMv5BiMEkSw/fpyYX
	4ZYtCFOo/J5M+PtX9nx62GK+8A9+2Vl3uKWjUSCFvXG5d7mfoAT/XmSqqM/+cAcw/2
	AWavQnkkceVfRpDm2JOsMfyd4MYERtr52gUiSZH6J1yNUKztPXXEY52EUTQovWgJTA
	vl3OS/mDW3JL/Fz0/PSIxJ0Fkpl6UsnMlW7noj56Kpb1tZ4+GCIrc9i3De/pVg0YQJ
	jaPxcKDp+eobLHpDavvOPnp9huFQz8tS2F0yx8Ei8IUszjNZ0kVS3TCSdJKqzrWyHh
	NUlfOESDrv1FoSIADZLnC51U9Aj25Zqn+BQ663hKQn0oZI5LgXdpJGUrLJ7h61w2eL
	vsvy6tVxOuzpnxxF+BvifZLP3uGfedBvXp5cyAGPz0jh+IXrz73Crr8XseB9lmf3q+
	katdze+U1j65Gv/T2VzvIk351+DDQ10ou3In4GUdMDbdJw1dtLro4NLBir06xYfrrw
	TlGQ/TDXr27qpM1Yb23pLGqGOGxDL1kL26/tf4Z5okAuPfD/fySBItHNMsHunYK08/
	JeDKTxYr+q7bE4tdvw0hOcfQ=
Date: Tue, 19 Nov 2019 00:06:13 +0200
From: Adrian Bunk <bunk@stusta.de>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20191118220613.GA7568@localhost>
References: <20191118130801.21860-1-alex.kanavin@gmail.com>
	<CAMKF1sp5SWYgoOj7Ujy5GMEEcuuATkuD45q7k7+LSc2SSkTVNg@mail.gmail.com>
	<20191118210500.GA4741@localhost>
	<CAMKF1spsipv7AbxJfmwHMU5dPtPDm-8VBxeQGWhEGUxJFG4WUw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1spsipv7AbxJfmwHMU5dPtPDm-8VBxeQGWhEGUxJFG4WUw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 01/13] python: update to 2.7.17
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
X-List-Received-Date: Mon, 18 Nov 2019 22:06:18 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Mon, Nov 18, 2019 at 01:39:48PM -0800, Khem Raj wrote:
> On Mon, Nov 18, 2019 at 1:05 PM Adrian Bunk <bunk@stusta.de> wrote:
> > On Mon, Nov 18, 2019 at 10:13:05AM -0800, Khem Raj wrote:
> > > On Mon, Nov 18, 2019 at 5:08 AM Alexander Kanavin
> > > <alex.kanavin@gmail.com> wrote:
> > > >
> > > > Drop backports, rebase a couple of patches.
> > > >
> > > > This is the second last release of py 2.x; upstream support ends on
> > > > 1 January 2020, there will be one final 2.x afterwards.
> > > >
> > > > Note that the only thing that still needs python 2.x in oe-core is
> > > > u-boot; when the next u-boot update arrives, we should find out
> > > > where the py3 migration is for that component before merging the
> > > > update.
> > >
> > > I guess u-boot need it during build, in that case defer it to user to
> > > have python2 on build host
> > > could be possible.
> > >...
> >
> > That's a non-option since it could mean
> > "Yocto 3.1 cannot be built on Ubuntu 20.04".
> >
> > Ubuntu 20.04 might end up still shipping Python2,[1]
> > but you cannot rely on future distributions shipping it.
> 
> And why should OE ship something that’s dropped by its own upstream and
> other distributions

All I am saying is that relying on the host Python2 is a non-option.

If any layer needs a native Python2, this has to be shipped either in 
this layer or in a layer it depends on.

cu
Adrian

