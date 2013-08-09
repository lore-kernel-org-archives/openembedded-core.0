Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id 0FE606066D
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Aug 2013 09:58:32 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 09 Aug 2013 02:58:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,844,1367996400"; d="scan'208";a="343974943"
Received: from unknown (HELO helios.localnet) ([10.252.122.201])
	by azsmga001.ch.intel.com with ESMTP; 09 Aug 2013 02:58:31 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 09 Aug 2013 10:58:30 +0100
Message-ID: <21844536.louSSSY83b@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.5 (Linux/3.8.0-27-generic; KDE/4.10.5; i686; ; )
In-Reply-To: <20130809092044.GE17945@jama>
References: <cover.1376038140.git.paul.eggleton@linux.intel.com>
	<2db87529704491705f7288abb2ec787f90bcb3c1.1376038140.git.paul.eggleton@linux.intel.com>
	<20130809092044.GE17945@jama>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/6] x264: add from meta-oe, update and tweak
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
X-List-Received-Date: Fri, 09 Aug 2013 09:58:32 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Martin,

On Friday 09 August 2013 11:20:44 Martin Jansa wrote:
> On Fri, Aug 09, 2013 at 09:59:31AM +0100, Paul Eggleton wrote:
> > This is required by the default configuration of libav being brought over
> > from meta-oe. Changes from the meta-oe recipe:
> > 
> > * Update to the latest revision from the stable branch (upstream does
> > 
> >   not seem to provide stable releases.)
> > 
> > * Add LICENSE_FLAGS = "commercial"
> > * Enable PIC to fix text relocation warnings and disable warning for
> > 
> >   i586 (since PIC can't be used there)
> > 
> > * Make SUMMARY value slightly shorter
> > * Indent SRC_URI properly
> 
> I think it was indented correctly and styleguide doesn't define how many
> spaces should be used for multiline variables.

It doesn't, but the convention that is observed in OE-Core is to indent 
multiple-line statements to the level of the start of the value in the first 
line (as indeed the value of EXTRA_OECONF is indented in this recipe). FWIW, I 
have altered the commit message to refer to consistency with other recipes 
rather than correctness.

> > +EXTRA_OECONF = '--prefix=${prefix} \
> > +                --host=${HOST_SYS} \
> > +                --cross-prefix=${TARGET_PREFIX} \
> > +                --sysroot=${STAGING_DIR_TARGET} \
> > +                --enable-shared \
> > +                --enable-static \
> > +                --disable-lavf \
> > +                --disable-swscale \
> > +		--enable-pic \
> 
> Don't mix tabs and spaces.

Oops, that's what I get for using vi without configuring it. Fixed on the 
branch.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

