Return-Path: <paul@betafive.co.uk>
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
	[64.147.123.20])
	by mail.openembedded.org (Postfix) with ESMTP id 0DB3D7DA0D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Apr 2019 12:37:44 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.west.internal (Postfix) with ESMTP id 0449F754;
	Tue, 30 Apr 2019 08:37:45 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
	by compute1.internal (MEProxy); Tue, 30 Apr 2019 08:37:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=betafive.co.uk;
	h=mime-version:message-id:in-reply-to:references:date:from:to
	:cc:subject:content-type; s=fm1; bh=918xO+iq1GfKsShBrsfKZK5gRpS0
	/IDl/pC56M5Swo8=; b=hNmmk6ZzzjOK/teHXcsLt/8dfV87wNILAZPV9o2sd9e/
	3h0waAwIT9xukZKkImS0bMtRCK04Ubd2yhmvW5T6hurwAVxfJjcV+yD1UHYp0AC1
	/5DNL//nuJ4T9DILNM9k27IKiuauXxG9qYAPYkfDs5iOTKz2lVy7KSDaH7bal6MW
	JT+qWpkM0rfN1aKkpQuybG9mAMwnEqRpRZvsq910k9xWi0OUICQi2C1WJqQyPg8g
	k3wA/P97twE1ybP7Mvgt29I+K4do8VvSoFFnZCAgk+kQwom7Zi5pIuqSGl1DTp4C
	4GrmqsYPBPlYDtZ8iylt8Ju+qVz7uuLPQfMMb3HITw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=918xO+
	iq1GfKsShBrsfKZK5gRpS0/IDl/pC56M5Swo8=; b=Q5ihZSi9SMSiEHopzLSlvl
	TugPIv2bS8/4WJ5ANta1JAsM7NYY5uwlf2NwTFkDv/7SbhqzI4aDjw87siZhwyU3
	RFd1JPKpv3BZ/5yk1AdfQ+6nkKJGbnCwUtj5vOslLwG0T8+iOoCOwPUkcLKR1R6a
	WvBfYHjwOkIleFk2VgmvGeoRcEqHL8q1YSwfRwBCVlAmdEA7cQlyrLsW+dTsMCHg
	8P6AtDUCjz+NvR1sdUl3dLEVoRqdaQlUyvxVROQ6Q8oyzzMLpKchpUuRa8M59qdY
	TMxdoIr4BzJSrNRMr+GFWd7DEjWdvl1b9/zr6bqm8D1+DkS41VeqnBmq8zxOPF1Q
	==
X-ME-Sender: <xms:mUHIXGPsRnEy2n24mDKp447CEOUvQCwOOHEIx9Mk27DbEDXFlpmZMg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrieeggdehhecutefuodetggdotefrodftvf
	curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
	uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
	fjughrpefofgggkfgjfhffhffvufgtsehttdertderreejnecuhfhrohhmpedfrfgruhhl
	uceurghrkhgvrhdfuceophgruhhlsegsvghtrghfihhvvgdrtghordhukheqnecuffhomh
	grihhnpehgihhthhhusgdrtghomhenucfrrghrrghmpehmrghilhhfrhhomhepphgruhhl
	segsvghtrghfihhvvgdrtghordhukhenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:mUHIXNUgNb7F689NQcBEheoCl4F-O-o0RlR8rt_W5UPv9qvyxFXc9w>
	<xmx:mUHIXHiesVMkj2ALIdyF7l8t6IOC8_7bjcN3poyjyHzdE_5qnVtrvg>
	<xmx:mUHIXLRSf3VWMWRcMlXDoJsJ1V5-2mUbwwlj7cY-5-HkTSlusQqW6w>
	<xmx:mUHIXENgFDXsKPIUQrBO_S61Hm3HGNtCEFvVm4lEKCn0EgbUBy2wbg>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 350117C199; Tue, 30 Apr 2019 08:37:45 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.6-448-g5cc1c91-fmstable-20190429v1
Mime-Version: 1.0
Message-Id: <59e7467e-70a5-4174-8c5b-65790bccda63@www.fastmail.com>
In-Reply-To: <CAO5Uq5TbThvLxoeONBEdRfGEjSuZir+Wphxn5sNgivaB2a9UOg@mail.gmail.com>
References: <20190429144325.63744-1-alex.kiernan@gmail.com>
	<057307c5-9cd5-49d4-b73e-6bf9be16f710@www.fastmail.com>
	<CAO5Uq5RTE1J6YVQLZ0zhsBHLi=m2fCxgq49mvdUkJJ3iorCQkA@mail.gmail.com>
	<22a9ceb8-073a-4ee9-8ce7-36c2b311b2e9@www.fastmail.com>
	<CAO5Uq5TbThvLxoeONBEdRfGEjSuZir+Wphxn5sNgivaB2a9UOg@mail.gmail.com>
Date: Tue, 30 Apr 2019 08:37:44 -0400
From: "Paul Barker" <paul@betafive.co.uk>
To: "Alex Kiernan" <alex.kiernan@gmail.com>
Cc: OE Core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v5 0/6] Fix systemd service enables/move towards "stateless" configuration
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
X-List-Received-Date: Tue, 30 Apr 2019 12:37:45 -0000
Content-Type: text/plain

On Tue, 30 Apr 2019, at 13:33, Alex Kiernan wrote:
> On Tue, Apr 30, 2019 at 1:24 PM Paul Barker <paul@betafive.co.uk> wrote:
> >
> > On Tue, 30 Apr 2019, at 13:14, Alex Kiernan wrote:
> > > On Tue, Apr 30, 2019 at 1:08 PM Paul Barker <paul@betafive.co.uk> wrote:
> > > >
> > > > On Mon, 29 Apr 2019, at 15:44, Alex Kiernan wrote:
> > > > > As a result of the systemd 242 upgrade, which includes 01d2041e41f4
> > > > > ("meson: stop creating enablement symlinks in /etc during
> > > > > installation"), services such as systemd-networkd are no longer enabled
> > > > > in images.
> > > > >
> > > >
> > > > As an aside - is this systemd upgrade why on raspberrypi3 with master branches I recently have no console on tty1 and `/etc/systemd/system/getty.target.wants/getty@tty1.service` is missing?
> > > >
> > >
> > > I suspect so - certainly getty@ is one of the things that's was
> > > touched in the upstream commit.
> > >
> >
> > Doing some reading now.
> >
> > The discussion on https://github.com/systemd/systemd/issues/12345 suggests we should be running `systemctl preset-all` or at least `systemctl enable getty@tty1` on first boot.
> 
> That's what this patchset does (`systemctl preset-all`), or rather it
> builds images without /etc/machine-id which triggers systemd to do it.
> 
> > Maybe this should be handled at the BSP level so we can decide whether to enable getty@tty1 or not on a per-machine basis.
> >
> 
> Once I'm done you should be able to install preset files which then
> determine what gets enabled/disabled, the only real question I've got
> is if we should always do this at image build time, or leave it for
> first boot and let systemd do it (on read-write images at least).
> 
> > However, I can't see an easy way to resolve this at BSP level right now. I know how to add a systemd service file in a package and enable it but in this case we're looking to enable a service which is already installed. Reading through systemd.bbclass and the relevant docs doesn't give any suggestions. Is there any straightforward way to enable an already installed service?
> >
> 
> Personally, if I needed it fixing right now, I'd probably add a hack
> during rootfs build to put the symlinks in the right place.
> 

Thanks for the advice, I understand much better now. I think for now I'll pin oe-core to the last commit before the systemd upgrade (ac64c3b96b...) so we can carry on our development. I'll watch out for this patch series going into master and then test it out again.

Thanks,

-- 
Paul Barker
Managing Director & Principal Engineer
Beta Five Ltd

