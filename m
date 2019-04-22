Return-Path: <tanuk@iki.fi>
X-Greylist: delayed 445 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 22 Apr 2019 12:40:57 UTC
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
	[64.147.123.19])
	by mail.openembedded.org (Postfix) with ESMTP id A6A576B519
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Apr 2019 12:40:57 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.west.internal (Postfix) with ESMTP id ED677315;
	Mon, 22 Apr 2019 08:33:32 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
	by compute5.internal (MEProxy); Mon, 22 Apr 2019 08:33:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:date:from:in-reply-to:message-id:mime-version:references
	:subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; bh=62bt7k41gTbI4b2AOhktxJpbD08k6LwjXpvoTcwQO
	lY=; b=TBH885573uz6ArvU/UqH/3SNfnL0mxs2qYhlgXUQEEnP9PZl72Xg/+zwA
	OZZCtIx3wOxLdOdB7Yso4NLKUZjz14NCSqJH+Ffw8ZchEhmV6FOFj0NEbtIiNOri
	Tn6lCVLHSfDO2sxqpIFjB+TWTfOz6lQhp/XYjsXlmrRuH6CEvC34DXlE+q+ebuTP
	kD9qa99ExV5JKn+XyQm+uwUcbkp1Lcm2I2SSBNiDOeYKj4ge8dumEWjP52zWdj1M
	I26RLHd0GslTAQuLdOKai4fNv/w/sPvlg0BDeeVGzNZbtdLlVIkYsp+6OY8sM/al
	mOczz9p6VrSSauq3IQ7wdonNzKxTg==
X-ME-Sender: <xms:nLS9XH7bymYnkYiOCDS4WJHF5_cRlor4vIecrn0drkG8sWDGmwc0QQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrgeeigdehtdcutefuodetggdotefrodftvf
	curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
	uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
	fjughrpefkuffhvfffjghftggfggfgsehtjeertddtreejnecuhfhrohhmpefvrghnuhcu
	mfgrshhkihhnvghnuceothgrnhhukhesihhkihdrfhhiqeenucffohhmrghinheplhhisg
	gvrhgrphgrhidrtghomhdpphgrthhrvghonhdrtghomhenucfkphepudelvddrgedtrdel
	hedrfedunecurfgrrhgrmhepmhgrihhlfhhrohhmpehtrghnuhhksehikhhirdhfihenuc
	evlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:nLS9XE1fsaWzt0YTNqY_okTbVKT0h_nAWOdz-FP2sFiAWeAyJjrb9Q>
	<xmx:nLS9XFrLxp5RjPkDtvlrDmFo-4wz2c9t1fCrpzOJ6soPOvu-41BBwQ>
	<xmx:nLS9XOnOMs2QzEajl7qZrxAL960pCqKm3JDnjNJpsWfLTPic7jJ8Iw>
	<xmx:nLS9XOg9oze27-O8-OfohgxUVh_-Qwr9BZ8aEuRXlcU0gyCH8-dVZA>
Received: from laptop (unknown [192.40.95.31])
	by mail.messagingengine.com (Postfix) with ESMTPA id 8C773E44B4;
	Mon, 22 Apr 2019 08:33:31 -0400 (EDT)
Message-ID: <49993ca438e2a8b32473ad524404d8927c12d23e.camel@iki.fi>
From: Tanu Kaskinen <tanuk@iki.fi>
To: Khem Raj <raj.khem@gmail.com>
Date: Mon, 22 Apr 2019 15:33:11 +0300
In-Reply-To: <CAMKF1soH0BshzDQorBw7mmXGCgCg_OF=uc5pX1q=J_-ZPqtGMg@mail.gmail.com>
References: <cover.1496979431.git.raj.khem@gmail.com>
	<c0e598696af9be3f567751a8641effb08431a7d2.1496979431.git.raj.khem@gmail.com>
	<CAJTo0La6u=Tzzsow5ZYwqmWHY8RzyvgVqT=J4J9UpKy8uKbb9A@mail.gmail.com>
	<CAMKF1srdVU0p-e4gPJx5rNEhk4aQdsiELuz+-1AsD_tgG6b_Gw@mail.gmail.com>
	<1497026309.2435.5.camel@iki.fi>
	<CAMKF1soH0BshzDQorBw7mmXGCgCg_OF=uc5pX1q=J_-ZPqtGMg@mail.gmail.com>
User-Agent: Evolution 3.30.5-1 
MIME-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/3] pulseaudio: disable PIE flags when hardened flags are enabled
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
X-List-Received-Date: Mon, 22 Apr 2019 12:40:57 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2017-06-09 at 10:10 -0700, Khem Raj wrote:
> On Fri, Jun 9, 2017 at 9:38 AM, Tanu Kaskinen <tanuk@iki.fi> wrote:
> > On Fri, 2017-06-09 at 13:07 +0000, Khem Raj wrote:
> > > On Fri, Jun 9, 2017 at 5:56 AM Burton, Ross <ross.burton@intel.com> wrote:
> > > 
> > > > On 9 June 2017 at 04:41, Khem Raj <raj.khem@gmail.com> wrote:
> > > > 
> > > > > +SECURITY_CFLAGS = "${SECURITY_NO_PIE_CFLAGS}"
> > > > > 
> > > > 
> > > > These tend to go into security-flags.inc, not the recipe.
> > > > 
> > > 
> > > I know that's been the case but I think having a global file is error prone
> > > its better to have it in recipe context since it can get attention at
> > > upgrade time to test if this has been fixed in new release etc
> > 
> > Do you mean that there's some bug in pulseaudio, and this is a
> > workaround for it? Is the bug that there are textrels? Ross saw
> > textrels in pulseaudio before (see the discussion starting at [1]), but
> > I was unable to reproduce that. If you give instructions for
> > reproducing the problem, I'll see if I can fix pulseaudio (until then
> > I'm fine with having a workaround).
> > 
> 
> yes there is a bug lurking when compiling with hardening flags are turned on
> so you can do something like
> 
> in local.conf
> 
> require conf/distro/include/security_flags.inc
> 
> then
> 
> MACHINE=qemux86 bitbake pulseaudio
> 
> it also happens on arm so qemuarm will reproduce it too.
> 
> some assembly code is probably missing using GOT relative accesses

Resurrecting this ancient thread... I finally tried to reproduce this
problem with the given instructions. No success. Have you still been
running into this issue?

-- 
Tanu

https://www.patreon.com/tanuk
https://liberapay.com/tanuk


