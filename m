Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id A92BF719B8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 May 2017 14:00:07 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by fmsmga105.fm.intel.com with ESMTP; 29 May 2017 07:00:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,414,1491289200"; d="scan'208";a="107882644"
Received: from lsandov1-mobl2.zpn.intel.com ([10.219.128.119])
	by fmsmga005.fm.intel.com with ESMTP; 29 May 2017 07:00:07 -0700
Message-ID: <1496066920.26945.29.camel@linux.intel.com>
From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Date: Mon, 29 May 2017 09:08:40 -0500
In-Reply-To: <1496063945.25229.136.camel@linuxfoundation.org>
References: <cover.1495830706.git.anibal.limon@linux.intel.com>
	<1495841567.25229.122.camel@linuxfoundation.org>
	<1496063755.26945.25.camel@linux.intel.com>
	<1496063945.25229.136.camel@linuxfoundation.org>
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: paul.eggleton@linux.intel.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 00/36] OEQA threading support and selftest migration
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
X-List-Received-Date: Mon, 29 May 2017 14:00:08 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mon, 2017-05-29 at 14:19 +0100, Richard Purdie wrote:
> On Mon, 2017-05-29 at 08:15 -0500, Leonardo Sandoval wrote:
> > On Sat, 2017-05-27 at 00:32 +0100, Richard Purdie wrote:
> > > 
> > > On Fri, 2017-05-26 at 15:37 -0500, Aníbal Limón wrote:
> > > > 
> > > > This series is the integration of tree main changes into the OEQA
> > > > module,
> > > > 
> > > > * Implement threading support into OEQA core module
> > > > * Enables OEQA threaded mode into {,e}SDK test component
> > > > * Migrate current oe-selftest to use the same framework
> > > I tried this on the autobuilder:
> > > 
> > > https://autobuilder.yoctoproject.org/main/builders/nightly-oe-selft
> > > est/
> > > builds/901/steps/Running%20oe-selftest/logs/stdio
> > > 
> > > It was fast, the oe-selftest run which usually takes several hours
> > > took
> > > 30 mins. The above logs suggest we might have a coverage issue
> > > though.
> > BTW, the new OE/QA threading support does not support (yet, Anibal is
> > planning to work on it) the selftest test cases (because only one
> > bitbake instance can be running at a time) so we should see similar
> > times as before with this migration. So, those 30 minutes just comes
> > from executing a subset, so something may be wrong in the series.
> 
> The above was British understatement ;-).
> 
> If you look at the log it went from 200+ tests to executing just one.
> There is something *very* wrong with the series.

I rebased Anibal's series on top of current master and executed
oe-selftest -a at my host, and tests are added correctly and start
executing as expected, so there may be something going on on the AB.
Also several local AB builds were launched prior sending the series into
the mailing list and no errors were seen. Will work on this to figure
out the root cause.

Leo


> 
> I have Anibal's piece of the series queued in -next and may merge that
> ahead of the selftest pieces whilst you figure out the issue there.
> 
> Cheers,
> 
> Richard



