Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id B704D6AF9F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Nov 2013 20:23:04 +0000 (UTC)
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.7]) by hetzner.pbcl.net with esmtpsa
	(TLS1.0:DHE_RSA_CAMELLIA_256_CBC_SHA1:256) (Exim 4.80)
	(envelope-from <pb@pbcl.net>)
	id 1VjamF-0002HN-Co; Thu, 21 Nov 2013 21:23:03 +0100
Message-ID: <1385068924.4213.19.camel@x121e.pbcl.net>
From: Phil Blundell <pb@pbcl.net>
To: Mark Hatle <mark.hatle@windriver.com>
Date: Thu, 21 Nov 2013 21:22:04 +0000
In-Reply-To: <1385049423.23724.173.camel@phil-desktop.brightsign>
References: <1385019198-24458-1-git-send-email-mark.hatle@windriver.com>
	<1385019198-24458-2-git-send-email-mark.hatle@windriver.com>
	<1385043945.23724.158.camel@phil-desktop.brightsign>
	<528E1CEF.8070502@windriver.com>
	<1385049423.23724.173.camel@phil-desktop.brightsign>
Organization: Phil Blundell Consulting Ltd
X-Mailer: Evolution 3.4.4-3 
Mime-Version: 1.0
X-Spam_score: -1.0
X-Spam_score_int: -9
X-Spam_bar: -
X-Spam_report: Spam detection software,
	running on the system "hetzner.pbcl.net", has
	identified this incoming email as possible spam. The original message
	has been attached to this so you can view it (if it isn't spam) or
	label similar future email.  If you have any questions, see
	@@CONTACT_ADDRESS@@ for details.
	Content preview:  On Thu, 2013-11-21 at 15:57 +0000,
	Phil Blundell wrote: > On Thu, 2013-11-21 at 08:47 -0600,
	Mark Hatle wrote: > > We have users who
	desire to build their system at different levels of > > optimizations
	for debug, size, profiling,
	etc. So they do change the default > > optimization
	levels from -O2 to -O0,
	etc. The python fragement is used to only > > adjust
	-O0, as -O1 (or -Os) work correctly. > > Sure,
	I understand what the python
	is doing. The things I'm not quite > so clear about are: > > a) If the
	user asks to build with -O0,
	is it appropriate for the > metadata to second-guess
	this and quietly switch to using -O2 instead > when it thinks it knows
	best? [...] 
	Content analysis details:   (-1.0 points, 5.0 required)
	pts rule name              description
	---- ----------------------
	--------------------------------------------------
	-1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [master][dora][PATCH 1/2] perf: disallow debug optimization.
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
X-List-Received-Date: Thu, 21 Nov 2013 20:23:05 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2013-11-21 at 15:57 +0000, Phil Blundell wrote:
> On Thu, 2013-11-21 at 08:47 -0600, Mark Hatle wrote:
> > We have users who desire to build their system at different levels of 
> > optimizations for debug, size, profiling, etc.  So they do change the default 
> > optimization levels from -O2 to -O0, etc.  The python fragement is used to only 
> > adjust -O0, as -O1 (or -Os) work correctly.
> 
> Sure, I understand what the python is doing.  The things I'm not quite
> so clear about are:
> 
> a) If the user asks to build with -O0, is it appropriate for the
> metadata to second-guess this and quietly switch to using -O2 instead
> when it thinks it knows best?  

I suppose the other question is: why exactly does perf fail to build at
-O0, and can we just patch it so that it works rather than forcing
optimisation on?  Even if it can't be fixed, it would be good for the
commit message associated with any workaround to explain what the
problem is.

p.



