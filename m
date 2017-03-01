Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 6C6AB6FF76
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Mar 2017 16:01:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v21G0Mgw011799; Wed, 1 Mar 2017 16:01:51 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id HMUtRvXkIZ1Q; Wed,  1 Mar 2017 16:01:50 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v21G1kSt011841
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 1 Mar 2017 16:01:47 GMT
Message-ID: <1488384106.24526.36.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patrick Ohly <patrick.ohly@intel.com>
Date: Wed, 01 Mar 2017 16:01:46 +0000
In-Reply-To: <1488383463.7785.165.camel@intel.com>
References: <1487625169-22282-1-git-send-email-anibal.limon@linux.intel.com>
	<1488312568.7785.73.camel@intel.com>
	<1488340816.24526.26.camel@linuxfoundation.org>
	<1488352225.7785.83.camel@intel.com>
	<1488381139.24526.30.camel@linuxfoundation.org>
	<1488383463.7785.165.camel@intel.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.1 
Mime-Version: 1.0
Cc: yocto@yoctoproject.org, openembedded-core@lists.openembedded.org
Subject: Re: [PATCHv2] yocto-compat-layer.py: Add script to YP Compatible Layer validation
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
X-List-Received-Date: Wed, 01 Mar 2017 16:01:58 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2017-03-01 at 16:51 +0100, Patrick Ohly wrote:
> On Wed, 2017-03-01 at 15:12 +0000, Richard Purdie wrote:
> > 
> > On Wed, 2017-03-01 at 08:10 +0100, Patrick Ohly wrote:
> > > 
> > > Is the "build single distro for different machines" scenario that
> > > I
> > > described part of the Yocto Compliance 2.0? Should there be tests
> > > for
> > > it?
> > Right now its not
> Okay, so the goal is a bit less ambitious than I had thought. I
> wonder
> whether that's useful, because at least the problems Ostro and AGL
> (at
> least as far as I understood it from lurking on their mailing list)
> had
> only happened when trying to combine multiple BSP layers *and*
> actually
> using the different machines in the same distro.
> 
> > 
> > but I'd consider it.
> At least I'd find that useful - not sure about others ;-}

I do like the idea, I'm also mindful of walking before running...

> > 
> >  The question is can we write an
> > easy generic test for it,
> It's a bit more complicated than the existing tests, but I think it
> is
> doable.
> 
> > 
> > and also clearly phrase the criteria in the
> > list of compliance questions with a binary yes/no answer?
> Does the BSP layer only modify machine-specific packages and only
> when
> the MACHINE(s) defined by the BSP layer are selected? [yes/no]
> 
> The "only when" part is covered by the existing tests (because they
> keep
> MACHINE constant). The missing part is comparing different MACHINE
> sstamps.

That seems reasonable, unless the layer in question applying for
compatibility is not a BSP layer but thats a minor detail.

I'm open to more details on what the test would look like.

Cheers,

Richard

