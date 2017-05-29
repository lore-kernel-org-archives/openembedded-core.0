Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id CDCC660123
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 May 2017 13:21:12 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v4TDJ5YA019151
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Mon, 29 May 2017 14:19:06 +0100
Message-ID: <1496063945.25229.136.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
Date: Mon, 29 May 2017 14:19:05 +0100
In-Reply-To: <1496063755.26945.25.camel@linux.intel.com>
References: <cover.1495830706.git.anibal.limon@linux.intel.com>
	<1495841567.25229.122.camel@linuxfoundation.org>
	<1496063755.26945.25.camel@linux.intel.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.1 
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.11
	(dan.rpsys.net [192.168.3.1]);
	Mon, 29 May 2017 14:19:06 +0100 (BST)
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
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
X-List-Received-Date: Mon, 29 May 2017 13:21:14 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mon, 2017-05-29 at 08:15 -0500, Leonardo Sandoval wrote:
> On Sat, 2017-05-27 at 00:32 +0100, Richard Purdie wrote:
> > 
> > On Fri, 2017-05-26 at 15:37 -0500, Aníbal Limón wrote:
> > > 
> > > This series is the integration of tree main changes into the OEQA
> > > module,
> > > 
> > > * Implement threading support into OEQA core module
> > > * Enables OEQA threaded mode into {,e}SDK test component
> > > * Migrate current oe-selftest to use the same framework
> > I tried this on the autobuilder:
> > 
> > https://autobuilder.yoctoproject.org/main/builders/nightly-oe-selft
> > est/
> > builds/901/steps/Running%20oe-selftest/logs/stdio
> > 
> > It was fast, the oe-selftest run which usually takes several hours
> > took
> > 30 mins. The above logs suggest we might have a coverage issue
> > though.
> BTW, the new OE/QA threading support does not support (yet, Anibal is
> planning to work on it) the selftest test cases (because only one
> bitbake instance can be running at a time) so we should see similar
> times as before with this migration. So, those 30 minutes just comes
> from executing a subset, so something may be wrong in the series.

The above was British understatement ;-).

If you look at the log it went from 200+ tests to executing just one.
There is something *very* wrong with the series.

I have Anibal's piece of the series queued in -next and may merge that
ahead of the selftest pieces whilst you figure out the issue there.

Cheers,

Richard

