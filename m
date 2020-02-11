Return-Path: <mark.hatle@kernel.crashing.org>
Received: from kernel.crashing.org (kernel.crashing.org [76.164.61.194])
	by mail.openembedded.org (Postfix) with ESMTP id B5B3660EE7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Feb 2020 15:58:23 +0000 (UTC)
Received: from Marks-MacBook-Pro-16.local ([76.164.61.198])
	(authenticated bits=0)
	by kernel.crashing.org (8.14.7/8.14.7) with ESMTP id 01BFwLIH017737
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NO); Tue, 11 Feb 2020 09:58:22 -0600
To: Alexander Kanavin <alex.kanavin@gmail.com>, Adrian Bunk <bunk@stusta.de>
References: <CANNYZj-KS+mHQ20sQUv-SzpeaXjvAzQDPND00iuep6ek7utd5g@mail.gmail.com>
	<20200211135323.GA3234@localhost>
	<CANNYZj_ExXVJJMS3g6Ga2xNc9AgspEhcMBQgmQGaQXmkcUYvPQ@mail.gmail.com>
	<CANNYZj_v9=Ys-NXqHWXY42dZqT95+LxcRUqSRKcyy6pMz-Y01g@mail.gmail.com>
	<20200211141347.GB3234@localhost>
	<CANNYZj_2WVWrWDbL1tsUeqVQ_OPHnzebA=6fobRD9e==UybAhA@mail.gmail.com>
From: Mark Hatle <mark.hatle@kernel.crashing.org>
Message-ID: <8b9de58b-7d65-dc89-69ec-4b5d40667184@kernel.crashing.org>
Date: Tue, 11 Feb 2020 09:58:21 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
	Gecko/20100101 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <CANNYZj_2WVWrWDbL1tsUeqVQ_OPHnzebA=6fobRD9e==UybAhA@mail.gmail.com>
Cc: openembedded-architecture
	<openembedded-architecture@lists.openembedded.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [Openembedded-architecture] Future of sato and X in oe-core
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
X-List-Received-Date: Tue, 11 Feb 2020 15:58:24 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit



On 2/11/20 8:35 AM, Alexander Kanavin wrote:
> X might and likely will start to bitrot sooner for those not using RHEL 8 and
> its very conservative and never changing software stack. I can imagine Red Hat
> has no interest in supporting it on Fedora going forward for instance, they'll
> just make Xwayland work, and rip the standalone server and its drivers and
> libraries out. 

X is incredibly stable code base.  I think as long as there are no major
changes, the bitrot will be 'minor'.  I'm more worried about security response,
especially as it goes longer and longer with only a small set of maintainers of
last resort.

> Oe-core will have X for as long as the burden of fixing build errors and runtime
> issues with custom patches is not too painful. The point I am trying to make is
> that I am not convinced oe-core needs a 'real' ui at all, and opinion to the
> contrary should justify the need.

It's already OE's responsibility to fix build errors and integration run-time
issues.  When the burden goes beyond our resources, then we need to stop or find
a champion who will taker that burden.

I think we need to plan for that for all of the components of the system, not
just X, but X is a good starting point.

I also don't think oe-core itself needs a 'real' UI, and as my previous response
said -- we do need something though to test that the graphical framework is
working properly.

In the past this often comes back to needing a LOT of a UI in order to
adequately test all of the components of the system.   If wayland/weston has a
proper test suite that exercises all of the various parts of and pieces of the
systems -- then the need for a UI drops considerably.

(but we still have the need for some sort of example/demostration...)

--Mark

> Alex
> 
> On Tue, 11 Feb 2020 at 15:13, Adrian Bunk <bunk@stusta.de
> <mailto:bunk@stusta.de>> wrote:
> 
>     On Tue, Feb 11, 2020 at 03:01:20PM +0100, Alexander Kanavin wrote:
>     > Specifically (sorry for the rapid-followup), I think the main value
>     > proposition of core is integration and testing of various language
>     > toolchains and core libraries. UIs in embedded space can mean pretty much
>     > anything, and so I'd leave that to specialised layers.
> 
>     That's actually quite different from your original email.
> 
>     Your original email raised the problem that X might start to bitrot
>     after the end of support for RHEL 8 in the year 2029 (sic).
> 
>     What functionality should be in core for users/demo/QA/...
>     is not strictly related to X versus Wayland.
> 
>     > Alex
> 
>     cu
>     Adrian
> 
> 
> _______________________________________________
> Openembedded-architecture mailing list
> Openembedded-architecture@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-architecture
> 

