Return-Path: <dvhart@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 099016BF57
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Sep 2013 16:19:56 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga101.jf.intel.com with ESMTP; 11 Sep 2013 09:19:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.90,885,1371106800"; d="scan'208";a="394226074"
Received: from unknown (HELO [10.255.14.117]) ([10.255.14.117])
	by fmsmga001.fm.intel.com with ESMTP; 11 Sep 2013 09:19:49 -0700
Message-ID: <1378916389.5240.3.camel@dvhart-mobl4.amr.corp.intel.com>
From: Darren Hart <dvhart@linux.intel.com>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Date: Wed, 11 Sep 2013 09:19:49 -0700
In-Reply-To: <A612847CFE53224C91B23E3A5B48BAC798CD24DE06@xmail3.se.axis.com>
References: <cover.1378815538.git.pkj@axis.com>
	<38fc73dd9c6027282c5528cf9d18ad68ae7a3e43.1378815538.git.pkj@axis.com>
	<1378827464.19978.109.camel@dvhart-mobl4.amr.corp.intel.com>
	<A612847CFE53224C91B23E3A5B48BAC798CD24DE06@xmail3.se.axis.com>
Organization: Intel
X-Mailer: Evolution 3.8.5 (3.8.5-2.fc19) 
Mime-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] bb-matrix-plot: Use interpolation for sparse data
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
X-List-Received-Date: Wed, 11 Sep 2013 16:19:57 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2013-09-11 at 14:30 +0200, Peter Kjellerstedt wrote:
> > -----Original Message-----
> > From: Darren Hart [mailto:dvhart@linux.intel.com]
> > Sent: den 10 september 2013 17:38
> > To: Peter Kjellerstedt
> > Cc: openembedded-core@lists.openembedded.org
> > Subject: Re: [OE-core] [PATCH 1/1] bb-matrix-plot: Use interpolation
> > for sparse data
> > 
> > On Tue, 2013-09-10 at 14:20 +0200, Peter Kjellerstedt wrote:
> > > If not every combination of BB_NUMBER_THREADS and PARALLEL_MAKE have
> > > been tested by bb-matrix.sh, e.g., by using BB_RANGE="04 08 10 12 16"
> > > and PM_RANGE="04 08 10 12 16", then the graph that gnuplot generates by
> > > default looks very jagged due to the missing data points. By using
> > > splines to interpolate the missing data the graph looks a lot better.
> > >
> > > This should not change graphs where all data points are available in any
> > > way, only improve sparse graphs.
> > >
> > > Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> > > ---
> > >  scripts/contrib/bb-perf/bb-matrix-plot.sh | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/scripts/contrib/bb-perf/bb-matrix-plot.sh b/scripts/contrib/bb-perf/bb-matrix-plot.sh
> > > index 87e8cb1..136a255 100755
> > > --- a/scripts/contrib/bb-perf/bb-matrix-plot.sh
> > > +++ b/scripts/contrib/bb-perf/bb-matrix-plot.sh
> > > @@ -115,7 +115,7 @@ set xlabel "$XLABEL"
> > >  set ylabel "$YLABEL"
> > >  set style line 100 lt 5 lw 1.5
> > >  $PM3D_FRAGMENT
> > > -set dgrid3d $PM_CNT,$BB_CNT
> > > +set dgrid3d $PM_CNT,$BB_CNT splines
> > 
> > 
> > Saweet! I just couldn't figure that one out for some reason. Thank you,
> > thank you, thank you!
> > 
> > Please note the gnuplot 4.4 dependency in the patch commit message
> > though. Also, what happens if an older gnuplot is used? Does it fail or
> > revert to the old behavior? If it fails, can we check for 4.4 and use
> > splines if available?
> 
> I actually tried it now using gnuplot 4.2.2, and the script 
> already uses a couple of features that require gnuplot 4.4.
> The script can be fixed to support gnuplot 4.2 (by adding a 
> test for the gnuplot version and then modifying the input to 
> gnuplot accordingly), but since nobody has complained so far, 
> I would suggest just leaving it as is...

Agreed. Thank you Peter.

Acked-by: Darren Hart <dvhart@linux.intel.com>


-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel



