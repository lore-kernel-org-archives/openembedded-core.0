Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id DE6076AF69
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jul 2013 12:26:56 +0000 (UTC)
Received: from cpc6-cmbg17-2-0-cust487.5-4.cable.virginmedia.com
	([86.30.57.232] helo=[172.30.1.45])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1UznIO-0000YN-Qe; Thu, 18 Jul 2013 14:26:56 +0200
Message-ID: <1374150416.6324.10.camel@phil-desktop.brightsign>
From: Phil Blundell <pb@pbcl.net>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Date: Thu, 18 Jul 2013 13:26:56 +0100
In-Reply-To: <2691932.dGi55gTP8y@helios>
References: <cover.1374128654.git.sgw@linux.intel.com>
	<1374146123.6324.5.camel@phil-desktop.brightsign>
	<CAJTo0La1=YTa2rXasY2LhRkA0O4-uV0UDUUGUc-0kNrLasX83A@mail.gmail.com>
	<2691932.dGi55gTP8y@helios>
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
X-List-Received-Date: Thu, 18 Jul 2013 12:26:57 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2013-07-18 at 13:16 +0100, Paul Eggleton wrote:
> On Thursday 18 July 2013 12:35:04 Burton, Ross wrote:
> > On 18 July 2013 12:15, Phil Blundell <pb@pbcl.net> wrote:
> > > Seeing this discussion makes me wonder: if the target perl hasn't
> > > actually been built at this point, how does rpmdeps know what package to
> > > add a dependency on in the first place?  Does it just have some random
> > > hard-coded list somewhere?
> > 
> > It adds a dependency on /usr/bin/perl as a file, not perl itself, as
> > the error is "no package provides /usr/bin/perl".
> 
> Right, and at the moment this only works for RPM; I'm not sure if any of the 
> others natively support file-based dependencies like this.

I'm pretty sure neither opkg nor dpkg has any concept of depending on a
file.  

I guess if rpmdeps outputs that data then it would be possible for logic
in package.bbclass to then figure out which package contains the
depended-on file and either add a dependency or generate an error if
nothing that contains that file has been built.

p.



