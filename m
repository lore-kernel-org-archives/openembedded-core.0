Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 2CBCC719C8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Aug 2017 13:57:17 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	10 Aug 2017 06:57:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,353,1498546800"; d="scan'208";a="1002153284"
Received: from lsandov1-mobl2.zpn.intel.com ([10.219.128.134])
	by orsmga003.jf.intel.com with ESMTP; 10 Aug 2017 06:57:18 -0700
Message-ID: <1502373956.29285.12.camel@linux.intel.com>
From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Date: Thu, 10 Aug 2017 09:05:56 -0500
In-Reply-To: <dbc83877-5b7e-fadb-0e0a-e8edb82386a2@linux.intel.com>
References: <1502107769-16160-1-git-send-email-jussi.kukkonen@intel.com>
	<41176f6a-807d-f488-7f55-38ee82cc48bf@linux.intel.com>
	<1502110800.18633.220.camel@linuxfoundation.org>
	<d6c76558-21f5-c41d-9f47-2677644e4087@linux.intel.com>
	<b8ccbfdc-cb51-69e2-7516-5f95e949e170@windriver.com>
	<dbc83877-5b7e-fadb-0e0a-e8edb82386a2@linux.intel.com>
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Meson support in oe-core
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
X-List-Received-Date: Thu, 10 Aug 2017 13:57:18 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2017-08-10 at 13:11 +0300, Alexander Kanavin wrote:
> On 08/10/2017 12:10 AM, Randy MacLeod wrote:
> > Yep, total time for 'without gtk-doc' is *more* than cut in half!
> > 
> > The drop in configure time is certainly expected but the compilation
> > stage should be dominated by the compiler rather than make or ninja.
> > The 'without gtk-doc' compile difference mostly confirms that
> > but the 9% drop is odd. A couple of sources I've found assert that
> > for large projects and parallel builds a full build time is essentially
> > the same with ninja:
> >     http://david.rothlis.net/ninja-benchmark/
> > That work was done on a MacBook (!!) so it would be interesting to
> > see what the results are on a 24+ core Linux system. I might
> > give that a try tonight if there's nothing good on NetFlix.
> 
> To be honest, achieving faster build times is secondary in importance to 
> me. The important part is that autotools is one of the most awful pieces 
> of software ever written, and the less we have to deal with it in Yocto, 
> the happier we all will be. Upstreans generally share that POV.
> 
> Read this:
> http://blog.nirbheek.in/2016/05/gstreamer-and-meson-new-hope.html
> and this:
> http://voices.canonical.com/jussi.pakkanen/2011/09/13/autotools/
> 
> > By the way, systemd-234 has meson support and you (Alex) have sent
> > a patch update to 242 to the oe-core list but without switching to meson
> > as is reasonable. Anyway, 232 takes 51 seconds on my 16+16 core machine
> > so it would be a useful benchmark as well. Want to take a stab at that?
> 
> Oe-core master does not yet have any support for meson. We've done some 
> private work to bring it in, but it's not ready for submission yet. I 
> also want to build a few different recipes with it to make sure it 
> 'basically works' for several different things.
> 
> After meson support is in master, we can start converting recipes from 
> autotools to meson. That requires careful manual work, but the good news 
> is that it can be done piece-meal; there's no need to switch everything 
> at once.
> 

Alex, is there a autotools-to-meson guide? I like to participate on this
migration.

Leo

> My plan is to try gstreamer next, and after that, implement meson 
> support for gettext. It's a notorious bottleneck in many builds, due to 
> inexplicably slow autoconf (that even RP couldn't get down to the root 
> cause of).


> 
> Alex



