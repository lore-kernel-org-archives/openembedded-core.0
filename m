Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RTe3L-0007jG-Kd
	for openembedded-core@lists.openembedded.org;
	Thu, 24 Nov 2011 19:29:43 +0100
Received: by iahk25 with SMTP id k25so3336541iah.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Nov 2011 10:23:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=pynPvhdvpPFTkWNnXiKMxIYqsrMuhFsec1KUiOwU/6o=;
	b=PHiM2AsEPfEsETPNdTO2569V2ZqTLKllGy/grg/3kqiHFmoqWu1oihRfeuAsLEDtTQ
	XKbJs46SFNseM/flzJHtuxRGIgGlCJeBWxYEaWGUvmUZ9KEdmGvggANduvrprFSwAUoE
	iMTUr8ihYLBuG7pau80iR1li5daVM3OO8LlTg=
Received: by 10.42.189.5 with SMTP id dc5mr8396706icb.51.1322158985319;
	Thu, 24 Nov 2011 10:23:05 -0800 (PST)
Received: from sakrah.homelinux.org
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net. [99.57.141.118])
	by mx.google.com with ESMTPS id dd36sm90084437ibb.7.2011.11.24.10.23.02
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 24 Nov 2011 10:23:03 -0800 (PST)
Date: Thu, 24 Nov 2011 10:29:50 -0800
From: Khem Raj <raj.khem@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20111124182950.GI28767@sakrah.homelinux.org>
References: <CAMKF1sqdUPP1=3wiAMTD+Jmf8mbJyDXq4GT7Ho06=mBee92pPw@mail.gmail.com>
	<CAEsOVNd+AuWWwHQAWmeyJ0jnNaVm2522pO_ykVdqzc1X9m96Tg@mail.gmail.com>
	<CAMKF1sov7U1oRZYDyBdWT3uYr1_P0+pAJxU7kLVsDfngJhG16Q@mail.gmail.com>
	<CAEsOVNe22kPLsNn0pmkuSycHwNfO6AFgJGxqMb=ex+VamAK9hw@mail.gmail.com>
	<CAEsOVNe-AvQ-DXUH-TMZFtmmAJ0oqSRveh+ovC-qvttrpguARg@mail.gmail.com>
	<CAMKF1sr8RdXbS3po2fz+e_Q9oKt133QmdJzs=+idSdeQ7MEWnQ@mail.gmail.com>
	<CAEsOVNezsZu5dDEKZCiPd6ya8bmgyejMCmFvrgJ1br2JQQqs9w@mail.gmail.com>
	<1322132099.26081.43.camel@phil-desktop>
	<20111124180305.GD28767@sakrah.homelinux.org>
	<1322158121.26081.60.camel@phil-desktop>
MIME-Version: 1.0
In-Reply-To: <1322158121.26081.60.camel@phil-desktop>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: [RFC] gcc-cross.inc: Add depedency on BUILD_ARCH
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
X-List-Received-Date: Thu, 24 Nov 2011 18:29:44 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (24/11/11 18:08), Phil Blundell wrote:
> On Thu, 2011-11-24 at 10:03 -0800, Khem Raj wrote:
> > On (24/11/11 10:54), Phil Blundell wrote:
> > > On Thu, 2011-11-24 at 07:29 +0000, McClintock Matthew-B29882 wrote:
> > > > On Thu, Nov 24, 2011 at 1:21 AM, Khem Raj <raj.khem@gmail.com> wrote:
> > > > > hmmm I guess cross recipes are special they should not have been built
> > > > > under target recipes. Adding build arch to package name would be ok
> > > > > too but may be if they were built under directory of their own which
> > > > > was something like <build>-<host>-<target> then it would also solve
> > > > > the problem i think
> > > > 
> > > > I agree - this is the discussion I'm trying to start. ;)
> > > 
> > > It's certainly true that the way the cross recipes are done at the
> > > moment does suck.  Really, they should be built as primarily native and
> > > the target arch ought to just be encoded into ${PN} somehow, rather than
> > > the current arrangement of pretending that they are target recipes.
> > > (All the runtime bits are, or should be, packaged separately by either
> > > libgcc or gcc-runtime so they will already get the right PACKAGE_ARCH.)
> > 
> > yes building them under native build dir and suffixing with
> > build.host.arch would be way to go
> 
> I don't think it's necessary to put all three components in the name,
> and doing so would make it harder to construct the right string to go in
> DEPENDS later.

yeah host in cross case would be useless since host = build we only need build and target
I thought of canadian builds

> 
> PACKAGE_ARCH for native is already the host system, so you get that one
> for free, and the build arch is (or ought to be) irrelevant as far as
> the artifacts are concerned.  So I think it's just the target system
> name that needs to be encoded into PN for gcc-cross and binutils-cross.
> 
> p.
> 
> 
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

-- 
-Khem


