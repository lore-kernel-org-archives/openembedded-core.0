Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 6162C6F242
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Apr 2014 14:54:36 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s31EsTnQ027482; Tue, 1 Apr 2014 15:54:30 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 1a3jnQ1vn_pA; Tue,  1 Apr 2014 15:54:29 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s31EsNHE027479
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Tue, 1 Apr 2014 15:54:25 +0100
Message-ID: <1396364058.2910.24.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Bruce Ashfield <bruce.ashfield@windriver.com>
Date: Tue, 01 Apr 2014 15:54:18 +0100
In-Reply-To: <533AD2C2.7000104@windriver.com>
References: <cover.1396288310.git.bruce.ashfield@windriver.com>
	<e6015802086cbf8199d112a3e75a7391a417ede6.1396288310.git.bruce.ashfield@windriver.com>
	<CAMKF1srOv27-6SwSfYxFLL0-BvHk7hxWBmn6twtY+hpQ9rTYww@mail.gmail.com>
	<5339C30B.1060005@windriver.com>
	<CAMKF1srfDpeGkQMnHkK_AFPy6N7pujtLwMRsgbsDeHem82_5nA@mail.gmail.com>
	<5339C6FD.1070506@windriver.com>
	<A5D0F3B0-A739-4D0D-A9C5-926BBEB9CD35@gmail.com>
	<533AB712.2000809@windriver.com> <20140401145014.GQ2425@jama>
	<533AD2C2.7000104@windriver.com>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/5] libc-headers: set TC default to 3.14
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
X-List-Received-Date: Tue, 01 Apr 2014 14:54:39 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2014-04-01 at 10:52 -0400, Bruce Ashfield wrote:
> On 14-04-01 10:50 AM, Martin Jansa wrote:
> > On Tue, Apr 01, 2014 at 08:54:42AM -0400, Bruce Ashfield wrote:
> >> On 14-04-01 02:42 AM, Khem Raj wrote:
> >>>
> >>> On Mar 31, 2014, at 12:50 PM, Bruce Ashfield <bruce.ashfield@windriver.com> wrote:
> >>>
> >>>>> i dont believe you tested all layer combinations
> >>>>
> >>>> I've tested everything I can, as has the autobuilder. I can't offer
> >>>> any more than this.
> >>>>
> >>>>>>
> >>>>>>
> >>>>>>> at this point. 3.10 being LTS
> >>>>>>> I would assume its a better option to keep at 3.10
> >>>>>>
> >>>>>>
> >>>>>> I disagree, this is consistent with other releases and the documented
> >>>>>> plan of action. I'd rather not have a massive version jump in the fall.
> >>>>>
> >>>>> its probably not a bad option to stick to LTS version for kernel headers
> >>>>> after all
> >>>>
> >>>> Again, I disagree.
> >>>>
> >>>> We can maybe keep the 3.10 recipe around,
> >>>
> >>> Thats ugly too. We decided to stick to one version of headers last time.
> >>>
> >>>> but the default should
> >>>> be 3.14, we need a matched kernel and libc-headers to get the best integration
> >>>> and leveraging of the latest features.
> >>>>
> >>>> If we pull the headers, pull the kernel.
> >>>
> >>> this all is understood, however we have to get better with timings especially
> >>> changing something like kernel headers whose impact is far reaching then
> >>>    just updating kernel proper.
> >>
> >> We do the best we can and I can only play the timing that is dealt
> >> by the upstream projects ... but we all know that!
> >>
> >> We arranged for as much soak testing and building as we could behind
> >> the scenes.
> >>
> >> That being said, we are going to introduce the versioned kernel and
> >> libc-headers recipes in the -rc1 timeframe next time around and we
> >> captured that intention on the kernel planning wiki for 1.7 .. so that
> >> should help in the next cycle.
> >
> > This failure also seems new:
> >
> > |
> > /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/qemuarm-oe-linux-gnueabi/lttng-modules/2.3.3-r0/git/probes/../instrumentation/events/lttng-module/../../../probes/../instrumentation/events/lttng-module/block.h:344:24:
> > error: 'struct bio' has no member named 'bi_sector'
> > |    tp_assign(sector, bio->bi_sector)
> 
> For qemuarm. Hmm. I did build lttng modules for it here, as I presume
> the autobuilder did as well.
> 
> But I'll launch another build to see what happens here.

I can confirm we didn't see that on the autobuilder...

Cheers,

Richard


