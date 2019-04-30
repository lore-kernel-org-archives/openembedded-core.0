Return-Path: <paul@betafive.co.uk>
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
	[64.147.123.20])
	by mail.openembedded.org (Postfix) with ESMTP id 9650E7DA0D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Apr 2019 12:24:47 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.west.internal (Postfix) with ESMTP id 8876174F;
	Tue, 30 Apr 2019 08:24:48 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
	by compute1.internal (MEProxy); Tue, 30 Apr 2019 08:24:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=betafive.co.uk;
	h=mime-version:message-id:in-reply-to:references:date:from:to
	:cc:subject:content-type; s=fm1; bh=IdAccPIlsR/Vjj+aT50ezfyACwsd
	tPMIFtS/QFvY9eg=; b=rwRZw1XAsPE4IHm27a1Wh1aqNLYrzIVPULC0uthasa0K
	wVOjMA2RNmLqz2iloEdt4j4zuDWm/Oi3LqjVL8P0db3emVESeMrh/1wF9vveVf3x
	0+ehEPlQBpXl6rwALdVXy0zZzVOwOuDRew7a+Lv6DGBocYysNOSze1jsk8R/hxu0
	/k9WooS1Q6aKDoGXgdU2GaWKlKhVKo5WPti2Gyc/ub1P8RFsVbevXIay9lhnFhkE
	XAglG+p0ZO7NKUG0aRidHw+di3K2Jf9Q3Ubl6lWSZ563OXKhdhGT00Zl2esoMlQ4
	3vuppXcetJUXcMeaD9c7M2e+nfjiGbMEwsCRF2/gSA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=IdAccP
	IlsR/Vjj+aT50ezfyACwsdtPMIFtS/QFvY9eg=; b=dTSXuGOwGtYK/IiC2cdkqr
	7Hcx/vClQJ3j7pK8SsUevGdfQMv3k1DbUPQzFBPf1DM6jz/3YS3bl6QVQEREgpJS
	ozgYjPmBB/bQqCG7y2+8C6B+dsQ39eMikhUZdzw77scsA71TqkHKBJPDinBepJ+u
	uCosUqm807nGP90au6dNM5cYW8PXM1HO7kIUdoyOqzT43hmSJJoHfFwFodScnECj
	bsHwuXOUC3qT1TAlzb3HUn3075lZt9OWsGvCzbklY2o5aQiVa9bVqsGfnV6xOPpr
	KkJWxJM40Imd9mEDI5oPTdRYg5hwCfjC80xrMvy92nQxZ78kgEIdT1pZQf5G/Ovg
	==
X-ME-Sender: <xms:jz7IXGChsjF8BFQ2CHApprMRBqUJpy_cUZZCwz0QkxAn6OFv0NZzew>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrieeggdehfecutefuodetggdotefrodftvf
	curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
	uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
	fjughrpefofgggkfgjfhffhffvufgtsehttdertderreejnecuhfhrohhmpedfrfgruhhl
	uceurghrkhgvrhdfuceophgruhhlsegsvghtrghfihhvvgdrtghordhukheqnecuffhomh
	grihhnpehgihhthhhusgdrtghomhenucfrrghrrghmpehmrghilhhfrhhomhepphgruhhl
	segsvghtrghfihhvvgdrtghordhukhenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:jz7IXHdTbr9J2zLeZ_2Toly40uH-rrNoFwudvj-_EqRG9K9CDKzAsQ>
	<xmx:jz7IXOrFmXbtZ_Ff5IhOH4px7CkJqHixybNtQtIoM_vTLx9hqnmYwg>
	<xmx:jz7IXL64tyueqvpGy2nyxth44BgUgzbAqxNrL-WkAAr4CpEcNNBClg>
	<xmx:kD7IXOO-GP7utlGkV6pqVr85aAer5dV7bJ94GeWoM6ru-efG3M53Yg>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 8AC7B7C58C; Tue, 30 Apr 2019 08:24:47 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.6-448-g5cc1c91-fmstable-20190429v1
Mime-Version: 1.0
Message-Id: <22a9ceb8-073a-4ee9-8ce7-36c2b311b2e9@www.fastmail.com>
In-Reply-To: <CAO5Uq5RTE1J6YVQLZ0zhsBHLi=m2fCxgq49mvdUkJJ3iorCQkA@mail.gmail.com>
References: <20190429144325.63744-1-alex.kiernan@gmail.com>
	<057307c5-9cd5-49d4-b73e-6bf9be16f710@www.fastmail.com>
	<CAO5Uq5RTE1J6YVQLZ0zhsBHLi=m2fCxgq49mvdUkJJ3iorCQkA@mail.gmail.com>
Date: Tue, 30 Apr 2019 08:24:47 -0400
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
X-List-Received-Date: Tue, 30 Apr 2019 12:24:47 -0000
Content-Type: text/plain

On Tue, 30 Apr 2019, at 13:14, Alex Kiernan wrote:
> On Tue, Apr 30, 2019 at 1:08 PM Paul Barker <paul@betafive.co.uk> wrote:
> >
> > On Mon, 29 Apr 2019, at 15:44, Alex Kiernan wrote:
> > > As a result of the systemd 242 upgrade, which includes 01d2041e41f4
> > > ("meson: stop creating enablement symlinks in /etc during
> > > installation"), services such as systemd-networkd are no longer enabled
> > > in images.
> > >
> >
> > As an aside - is this systemd upgrade why on raspberrypi3 with master branches I recently have no console on tty1 and `/etc/systemd/system/getty.target.wants/getty@tty1.service` is missing?
> >
> 
> I suspect so - certainly getty@ is one of the things that's was
> touched in the upstream commit.
> 

Doing some reading now.

The discussion on https://github.com/systemd/systemd/issues/12345 suggests we should be running `systemctl preset-all` or at least `systemctl enable getty@tty1` on first boot. Maybe this should be handled at the BSP level so we can decide whether to enable getty@tty1 or not on a per-machine basis.

However, I can't see an easy way to resolve this at BSP level right now. I know how to add a systemd service file in a package and enable it but in this case we're looking to enable a service which is already installed. Reading through systemd.bbclass and the relevant docs doesn't give any suggestions. Is there any straightforward way to enable an already installed service?

Thanks,

-- 
Paul Barker
Managing Director & Principal Engineer
Beta Five Ltd

