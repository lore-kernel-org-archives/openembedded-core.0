Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id 5F2816D01E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Nov 2013 13:15:49 +0000 (UTC)
Received: from cpc6-cmbg17-2-0-cust487.5-4.cable.virginm.net ([86.30.57.232]
	helo=[172.30.1.45]) by hetzner.pbcl.net with esmtpsa
	(TLS1.0:DHE_RSA_CAMELLIA_256_CBC_SHA1:256) (Exim 4.80)
	(envelope-from <pb@pbcl.net>)
	id 1ViOgA-00054u-PM; Mon, 18 Nov 2013 14:15:51 +0100
Message-ID: <1384780550.23724.29.camel@phil-desktop.brightsign>
From: Phil Blundell <pb@pbcl.net>
To: Mats =?ISO-8859-1?Q?K=E4rrman?= <Mats.Karrman@tritech.se>
Date: Mon, 18 Nov 2013 13:15:50 +0000
In-Reply-To: <ED3E0BCACD909541BA94A34C4A164D4C4FD505BB@post.tritech.se>
References: <ED3E0BCACD909541BA94A34C4A164D4C4FD50595@post.tritech.se>
	,<1384780059.23724.26.camel@phil-desktop.brightsign>
	<ED3E0BCACD909541BA94A34C4A164D4C4FD505BB@post.tritech.se>
X-Mailer: Evolution 3.4.4-4+b1 
Mime-Version: 1.0
X-Spam_score: -1.0
X-Spam_score_int: -9
X-Spam_bar: -
X-Spam_report: Spam detection software, running on the system "hetzner.pbcl.net", has
 identified this incoming email as possible spam.  The original message
 has been attached to this so you can view it (if it isn't spam) or label
 similar future email.  If you have any questions, see
 @@CONTACT_ADDRESS@@ for details.
 
 Content preview:  Oh, right, I see. Does it help if you use "PACKAGES =+ .."
    rather than "PACKAGES_prepend = "? p. On Mon, 2013-11-18 at 13:11 +0000,
   Mats Kärrman wrote: > It's not mine, it comes from native.bbclass. > > b.t.w.
    I should have said I'm running OE-core DORA distro-less. > > // Mats > >
   From: Phil Blundell [pb@pbcl.net] > Sent: Monday, November 18, 2013 2:07 PM
    > To: Mats Kärrman > Cc: openembedded-core > Subject: Re: [OE-core] RPROVIDES
    not package specific with native and added package > > On Mon, 2013-11-18
    at 12:55 +0000, Mats Kärrman wrote: > > to the recipe but it makes no difference.
    > > Running bitbake with "-e" I find the line (independent of the above changes):
    > > > > RPROVIDES = "${PN}" > > What are you trying to accomplish with that
    line? Is there any reason > you can't just remove it? > > p. > > [...] 
 
 Content analysis details:   (-1.0 points, 5.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -1.0 ALL_TRUSTED            Passed through trusted hosts only via SMTP
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: RPROVIDES not package specific with native and added package
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
X-List-Received-Date: Mon, 18 Nov 2013 13:15:50 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Oh, right, I see.  Does it help if you use "PACKAGES =+ .." rather than
"PACKAGES_prepend = "?

p.

On Mon, 2013-11-18 at 13:11 +0000, Mats Kärrman wrote:
> It's not mine, it comes from native.bbclass.
> 
> b.t.w. I should have said I'm running OE-core DORA distro-less.
> 
> // Mats
> ________________________________________
> From: Phil Blundell [pb@pbcl.net]
> Sent: Monday, November 18, 2013 2:07 PM
> To: Mats Kärrman
> Cc: openembedded-core
> Subject: Re: [OE-core] RPROVIDES not package specific with native and added package
> 
> On Mon, 2013-11-18 at 12:55 +0000, Mats Kärrman wrote:
> > to the recipe but it makes no difference.
> > Running bitbake with "-e" I find the line (independent of the above changes):
> >
> > RPROVIDES = "${PN}"
> 
> What are you trying to accomplish with that line?  Is there any reason
> you can't just remove it?
> 
> p.
> 
> 



