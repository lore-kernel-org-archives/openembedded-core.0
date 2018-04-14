Return-Path: <paul@betafive.co.uk>
X-Greylist: delayed 575 seconds by postgrey-1.34 at layers.openembedded.org;
	Sat, 14 Apr 2018 09:19:53 UTC
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
	[66.111.4.221])
	by mail.openembedded.org (Postfix) with ESMTP id EDD3860603
	for <openembedded-core@lists.openembedded.org>;
	Sat, 14 Apr 2018 09:19:53 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailnew.nyi.internal (Postfix) with ESMTP id 1E06D106F;
	Sat, 14 Apr 2018 05:10:19 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
	by compute1.internal (MEProxy); Sat, 14 Apr 2018 05:10:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=betafive.co.uk;
	h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=a/jCI7yNryNFkvKpT
	tFceytomEgz95/tG0cX5uulSsw=; b=k73JrfnsWZzjcRt11uaKG3Y42qVpUZkie
	iv0OTdatcEiD5elLHpKMpwexRWne4PzNjp37uzgqdYMUnur18VxQWYOTl4mZnqA8
	TZxLRyU+3VSb/j+YWj7rDTVHPJBf0dpWvj2SSGqpJ3LkP9StXohy/gzIQl/IjDk+
	WEell/8IOyKXSsU2yDRwNiI4LN6SM4Jq3O6toYbjViwU/jF4aVjdKw4zS0p2ubXk
	3rGnYbkrpDc4gYPw+rpMXAH27etOtBE5lB6ImJ+P033HiyFPLHTOs78UOdfCt+3N
	GGHJQAYhfHbWaHLMH6SfaQbfYrfZo9vYWPNBGN71ZDrRDbVmjP8Qg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:date:from:in-reply-to:message-id:mime-version:references
	:subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=a/jCI7
	yNryNFkvKpTtFceytomEgz95/tG0cX5uulSsw=; b=YCW1V8SFJpLt1+ummBTlmM
	90pPFfOX4gSbHVgTLBmYWx7oJmyhmMKor3cCbHkUx+u6eUBt6OVm0ETk5N8PA2V7
	esoBO1/7hVCKREFEh6bPuaNlkBg5XemtfGXdfrhKW+b4NVA6EAcYH8yyBVOQwMd1
	lTUwTJ/cQ5/bnNbG+pRJPz4i0nOYu2OSq+P2WRELCzqV59z0KVT3QbN3WZY5pkhA
	CsCWzkntNpHFkiS+iFRJHN+GFziwlF+VHi3r6yKOEdT04CV8RYlyjyGDfKasogYf
	XhfgUpXJiJ5M1w1/rnlSN9mEjPzUAaDUnKaveHY98A4lmgbltyKVGY9353Zq11OQ
	==
X-ME-Sender: <xms:esXRWiV6Ke3MRccLRZ8Kh-7lx6B6qXJFdRYn8nWkreg2F0xSqdU1EQ>
Received: from host0.betafive.co.uk (138.32.187.81.in-addr.arpa
	[81.187.32.138])
	by mail.messagingengine.com (Postfix) with ESMTPA id A7A4610253;
	Sat, 14 Apr 2018 05:10:17 -0400 (EDT)
Date: Sat, 14 Apr 2018 10:10:14 +0100
From: Paul Barker <paul@betafive.co.uk>
To: Andreas =?UTF-8?B?TcO8bGxlcg==?= <schnitzeltony@gmail.com>
Message-ID: <20180414101014.4bcbbc31@host0.betafive.co.uk>
In-Reply-To: <CALbNGRQT94ptEPAygj+Rm9vBm27yo=inbz+O6nR2gL_etkGd7g@mail.gmail.com>
References: <CALbNGRTAbsa9CzzXqtq7mpiknFzUB_=9eHcFHnD5W--HEM8bPw@mail.gmail.com>
	<20180402215705.GA25121@linux-uys3>
	<CALbNGRThT8S5bfJH=zXMkQzCMMasQ=yUoEXTjsfPXtncig3yFA@mail.gmail.com>
	<ada194d6-5653-fde7-a70a-64646b08b281@intel.com>
	<CALbNGRTthOp+_T-6c_Vc3qmgMHTt-2ztyDiGbNEHY4+6UuW2ig@mail.gmail.com>
	<CALbNGRQT94ptEPAygj+Rm9vBm27yo=inbz+O6nR2gL_etkGd7g@mail.gmail.com>
Organization: Beta Five Ltd
X-Mailer: Claws Mail 3.14.1 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: bruce.ashfield@windriver.com,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: kernel menuconfig broken?
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
X-List-Received-Date: Sat, 14 Apr 2018 09:19:54 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, 13 Apr 2018 00:12:16 +0200
Andreas M=C3=BCller <schnitzeltony@gmail.com> wrote:

> On Thu, Apr 12, 2018 at 11:46 PM, Andreas M=C3=BCller
> <schnitzeltony@gmail.com> wrote:
> > On Thu, Apr 12, 2018 at 11:38 PM, Cal Sullivan
> > <california.l.sullivan@intel.com> wrote: =20
> >> If you're using a non-linux-yocto kernel you likely need to apply this=
 patch
> >> to your kernel as well:
> >>
> >> https://git.yoctoproject.org/cgit/cgit.cgi/meta-intel/tree/recipes-ker=
nel/linux/linux-intel/0001-menuconfig-check-lxdiaglog.sh-Allow-specificatio=
n-of.patch =20
> > Correct: RaspberryPi kernel =20
> >>
> >> (This is in all linux-yocto kernels, I'm only linking to meta-intel be=
cause
> >> I knew where it was off the top of my head)
> >>
> >> This was sent upstream but last I looked it didn't gain any traction. I
> >> think Bruce resent it recently but I can't be sure.
> >>
> >> Thanks,
> >> Cal
> >> =20
> > That looks very promising - will try and let you know - thanks in advan=
ce :)
> > =20
> Perfect! - Thanks Cal for quick help!

Sounds like we should apply this to the kernel recipe in
meta-raspberrypi.

Andreas, want to send a PR for this? Or shall I add to my todo list?

Cheers,

--=20
Paul Barker
Beta Five Ltd

