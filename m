Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id 1E1256A463
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Jan 2014 15:17:04 +0000 (UTC)
Received: from cpc6-cmbg17-2-0-cust487.5-4.cable.virginm.net ([86.30.57.232]
	helo=[172.30.1.45])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:256)
	(Exim 4.80) (envelope-from <pb@pbcl.net>)
	id 1W1HLy-0006am-Jc; Thu, 09 Jan 2014 16:17:02 +0100
Message-ID: <1389280620.9182.134.camel@phil-desktop.brightsign>
From: Phil Blundell <pb@pbcl.net>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 09 Jan 2014 15:17:00 +0000
In-Reply-To: <20140109003251.GD3709@jama>
References: <52CC470A.9030302@linaro.org> <1759035.6JVm74GdRW@helios>
	<52CD9CAB.5020501@linaro.org> <3583228.liS9SqzWlO@helios>
	<20140109003251.GD3709@jama>
X-Mailer: Evolution 3.8.5-2+b1 
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
	Content preview:  On Thu, 2014-01-09 at 01:32 +0100,
	Martin Jansa wrote: > I'm
	not saying that oe-core should be tested with 30 layers like my > world
	build, 
	but why cannot AB have special build which builds > > oe-core +
	meta-xorg
	+ meta-gnome > > and runs some runtime QA tests on that and then some
	other
	build with > > oe-core + meta-python > > for piglit tests? [...] 
	Content analysis details:   (-1.0 points, 5.0 required)
	pts rule name              description
	---- ----------------------
	--------------------------------------------------
	-1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: Qt in OE-core
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
X-List-Received-Date: Thu, 09 Jan 2014 15:17:04 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2014-01-09 at 01:32 +0100, Martin Jansa wrote:
> I'm not saying that oe-core should be tested with 30 layers like my
> world build, but why cannot AB have special build which builds
> 
> oe-core + meta-xorg + meta-gnome
> 
> and runs some runtime QA tests on that and then some other build with
> 
> oe-core + meta-python
> 
> for piglit tests?

There's probably no reason that it can't be done.  There are possibly a
few reasons why it might not be a good idea though:

- someone would need to keep track of what version of each layer the AB
needs to be using and update its configuration accordingly;

- there is a risk that you might end up spending all your time chasing
spurious oe-core QA failures caused by problems with those external
layers rather than finding genuine bugs in oe-core itself;

- if either of those layers start depending on something else then you
would need to add those dependencies as well, and so on potentially ad
infinitum;

- if something goes wrong in (say) meta-gnome that starts causing
oe-core testsuite failures then you will be reliant on the meta-gnome
maintainers to fix the problem in a reasonable time.

If you're going to make testing be a first-class part of the oe-core
development cycle then I think you can mount a fairly convincing
argument that the core ought to be testable using only things that are
either inside oe-core or at least under the control of the same
maintainers.

p.



