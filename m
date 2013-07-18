Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id 466A26B118
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jul 2013 11:15:25 +0000 (UTC)
Received: from cpc6-cmbg17-2-0-cust487.5-4.cable.virginmedia.com
	([86.30.57.232] helo=[172.30.1.45])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1UzmBA-0000Uv-Cn; Thu, 18 Jul 2013 13:15:24 +0200
Message-ID: <1374146123.6324.5.camel@phil-desktop.brightsign>
From: Phil Blundell <pb@pbcl.net>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Date: Thu, 18 Jul 2013 12:15:23 +0100
In-Reply-To: <1400703.GdJurTDMZr@helios>
References: <cover.1374128654.git.sgw@linux.intel.com>
	<CAJTo0LbSnT2ejbJCjCBUoxVEhjoCPtKMrzt8NMHFEVYb9LGHYw@mail.gmail.com>
	<1400703.GdJurTDMZr@helios>
X-Mailer: Evolution 3.4.4-1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [CONSOLIDATED PULL 00/40] Review and ACK
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
X-List-Received-Date: Thu, 18 Jul 2013 11:15:25 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2013-07-18 at 12:01 +0100, Paul Eggleton wrote:
> On Thursday 18 July 2013 11:52:22 Burton, Ross wrote:
> > On 18 July 2013 07:34, Saul Wold <sgw@linux.intel.com> wrote:
> > >   valgrind: added perl dependency
> > 
> > I presume the situation here is that a target perl wasn't actually
> > built, so adding an explicit runtime dependency causes it to be built
> > and therefore available in the feed for rpm to find.
> > 
> > To me this says that the #!-to-dependency magic from rpmdeps isn't
> > really useful, as we then have to go and put explicit dependencies
> > back in to ensure the requirements are actually built.
> 
> I have to say I too have wondered this. Perhaps these would be better 
> implemented as QA warnings (that could be defaulted to errors) rather than 
> just silently adding the dependencies.

Seeing this discussion makes me wonder: if the target perl hasn't
actually been built at this point, how does rpmdeps know what package to
add a dependency on in the first place?  Does it just have some random
hard-coded list somewhere?

p.



