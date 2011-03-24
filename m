Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Q2ajr-0005dO-Ui
	for openembedded-core@lists.openembedded.org;
	Thu, 24 Mar 2011 03:57:32 +0100
Received: by pvc30 with SMTP id 30so1091110pvc.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Mar 2011 19:55:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=c2bfJjzrS0fGOpV38GudG0xyGT5W0y3X3q/Ts4yIKtA=;
	b=o1RpNhnQllzq51lc10MXgR1Aq0KwtvBULgJk+PAUAv5Vdp9as6h6qrFswO4f0sjgJu
	32zhq6ZOCiclipGy9ioDcj7vfsZ3CbzLyvX2sFp9VO/4yQRqWR3JjvF+0uSc09CaJPFh
	n3Ruz+JFeuoQD6aqqpJiThFFtpc/cbHk/B67Y=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=UoSSuaazOpGPHq8+PmJOWAfNenO3FYEU4NtrLmWMbyk3PdZv3c/LU5WdZfk5krsipU
	yU9L3DaOgLwvzAUL4TFu9HCQ54vwjOhHF7T7m95gX5LXMcKzeTKE/73fBGZDD/e4Rf1V
	T/XTi7VWfMuhJOvC8gSKG/dd8ij8vrl6bsi08=
Received: by 10.142.208.1 with SMTP id f1mr5337760wfg.102.1300935339290;
	Wed, 23 Mar 2011 19:55:39 -0700 (PDT)
Received: from sakrah.homelinux.org
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id x11sm10861372wfd.13.2011.03.23.19.55.36
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 23 Mar 2011 19:55:37 -0700 (PDT)
Date: Wed, 23 Mar 2011 19:56:02 -0700
From: Khem Raj <raj.khem@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20110324025602.GB20796@sakrah.homelinux.org>
References: <6CA3B184-AD05-4A9B-90CE-25AE38DECA39@dominion.thruhere.net>
	<AANLkTimcd8-9jd31uJe0EGLCit0YitBRmH9tuF8G50qn@mail.gmail.com>
	<20110323154018.GI2224@xora-desktop.xora.org.uk>
	<1300896184.3488.17.camel@scimitar>
	<20110323175229.GN2224@xora-desktop.xora.org.uk>
	<1300921337.3018.45.camel@rex>
	<20110323235316.GQ2224@xora-desktop.xora.org.uk>
MIME-Version: 1.0
In-Reply-To: <20110323235316.GQ2224@xora-desktop.xora.org.uk>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: [RFC] recipes-efl inside meta-oe or meta-efl next to meta-oe?
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
X-List-Received-Date: Thu, 24 Mar 2011 02:57:32 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (23/03/11 23:53), Graeme Gregory wrote:
> On Wed, Mar 23, 2011 at 11:02:17PM +0000, Richard Purdie wrote:
> > On Wed, 2011-03-23 at 17:52 +0000, Graeme Gregory wrote:
> > > On Wed, Mar 23, 2011 at 04:03:04PM +0000, Joshua Lock wrote:
> > > > On Wed, 2011-03-23 at 15:40 +0000, Graeme Gregory wrote:
> > > > > On Wed, Mar 23, 2011 at 08:19:31AM -0700, Khem Raj wrote:
> > > > > > On Wed, Mar 23, 2011 at 4:49 AM, Koen Kooi <koen@dominion.thruhere.net> wrote:
> > > > > > > Hi,
> > > > > > >
> > > > > > > I'd like to import the EFL recipes Martin did from meta-shr into the meta-openembedded repo. Before I go bothering Martin about it, what would be the best place to put them?
> > > > > > >
> > > > > > > Inside meta-oe:
> > > > > > >
> > > > > > > meta-openembedded/
> > > > > > >        meta-oe/
> > > > > > >                recipes-efl
> > > > > > 
> > > > > > Can efl we layered directly on top of oe-core  ? i.e. without needing meta-oe
> > > > > > in that case its better to be an independent layer. otherwise I would say put
> > > > > > them under recipes-efl
> > > > > > 
> > > > > That is certainly not how I see layers being built up. I am expecting
> > > > > in future us to have things like.
> > > > > 
> > > > > meta-gnome
> > > > > meta-kde
> > > > > meta-efl
> > > > > meta-lxde
> > > > > meta-xorg
> > > > 
> > > > Me too, in fact I think this image from the Yocto Project website
> > > > succinctly portrays the goal:
> > > > http://www.yoctoproject.org/sites/default/files/yocto-layers_1.png
> > > > 
> > > > Possibly less the meta-yocto but you get the point.
> > > > 
> > > I hope not as thats a truly horrible diagram.
> > > 
> > > I dont think there is anyway in modern linux to produce a nice neat stack
> > > like that. Once you move beyond trivial images.
> > 
> > The diagram is idealised but I think the concepts there are valid, for
> > example, bring in the meta-linaro layer to use the linaro toolchain,
> > bring in a BSP layer for a particular piece of hardware support and so
> > forth. Certainly, a developer is likely to have local tweaks in a layer
> > of their own on top.
> > 
> > Why wouldn't that work?
> > 
> The diagram demonstrates a nice stack, but what about if you want two
> gui layers. Real life example, gnome and kde have cross dependencies on
> each other.
> 
> In a real system you just cant pile up a nice little stack of components. It
> works more like lego where you have multiple components that fit together
> depending on multiple components to hold them up.

from 36000ft then we could have three layers
kde, gnome, and kde-gnome-common and it would still comply to the
diagram in general

> 
> The diagram is overly idealised to the point of zero information, fit for
> marketing but not engineering.
> 
> Graeme
> 
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

-- 
-Khem


