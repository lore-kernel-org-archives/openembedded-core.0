Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1T1eER-0008Sj-Cz for openembedded-core@lists.openembedded.org;
	Wed, 15 Aug 2012 16:05:59 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q7FDrwZK001747;
	Wed, 15 Aug 2012 14:53:58 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 00424-07; Wed, 15 Aug 2012 14:53:52 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q7FDron4001741
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Wed, 15 Aug 2012 14:53:51 +0100
Message-ID: <1345038829.538.21.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: McClintock Matthew-B29882 <B29882@freescale.com>, Patches and
	discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 15 Aug 2012 14:53:49 +0100
In-Reply-To: <CAEsOVNcvHaLz1oG_rGPjuQjb80RqEjBpKQzGNJG0d2rM7NeYJA@mail.gmail.com>
References: <1345000125-3865-1-git-send-email-b19537@freescale.com>
	<CAMKF1so5imbcuFU1Ad2FXD8zQmAyLSTbfSS0kNtvQSE_Wj9JbQ@mail.gmail.com>
	<CAEsOVNdyF6DSM0aU6NgEJ6s11g5TTD+GJdXPyTXZv4HrY-VZ9A@mail.gmail.com>
	<CABcZANmHkcwmgSPAXD6NwrOfjtgD+7Hvo8X4O81WWZbhPBiMbw@mail.gmail.com>
	<CAEsOVNcvHaLz1oG_rGPjuQjb80RqEjBpKQzGNJG0d2rM7NeYJA@mail.gmail.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: udev: update rcS to auto-detect hostname
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
X-List-Received-Date: Wed, 15 Aug 2012 14:05:59 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-08-15 at 04:21 +0000, McClintock Matthew-B29882 wrote:
> On Tue, Aug 14, 2012 at 11:12 PM, Chris Larson <clarson@kergoth.com> wrote:
> > On Tue, Aug 14, 2012 at 9:06 PM, McClintock Matthew-B29882
> > <B29882@freescale.com> wrote:
> >> On Tue, Aug 14, 2012 at 10:01 PM, Khem Raj <raj.khem@gmail.com> wrote:
> >>> On Tue, Aug 14, 2012 at 8:08 PM,  <b19537@freescale.com> wrote:
> >>>> echo `cat /proc/cpuinfo | grep model | cut -d "," -f 2 | tr "[A-Z]" "[a-z]"`
> >>>
> >>> $ echo `cat /proc/cpuinfo | grep model | cut -d "," -f 2 | tr "[A-Z]" "[a-z]"`
> >>> model : 23 model name : intel(r) core(tm)2 quad cpu q9300 @ 2.50ghz
> >>> model : 23 model name : intel(r) core(tm)2 quad cpu q9300 @ 2.50ghz
> >>> model : 23 model name : intel(r) core(tm)2 quad cpu q9300 @ 2.50ghz
> >>> model : 23 model name : intel(r) core(tm)2 quad cpu q9300 @ 2.50ghz
> >>>
> >>> is that what we want ?
> >>
> >> I think we need an option to turn it on or off and or make it
> >> configurable from a BSP layer. We are looking for a way to make a rfs
> >> for all e500v2 or e500mc, etc and say the right machine type on the
> >> prompt.
> >
> > This sounds like something that really does belong in your own
> > supplementary layer, rather than oe-core.
> 
> Seemed like a valuable option for making rfs for multiple machines /
> targets, but if we don't want it (or some of the bits) in oe-core
> that's fine by me too.

At the very least its powerpc only since it gives crazy results on other
arches. Does it work for all powerpc machines? Its also adding 4 execs
to every boot and those calls mount up and impact boot time.

Cheers,

Richard





