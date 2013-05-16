Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1UcwPm-0004w3-Tp for openembedded-core@lists.openembedded.org;
	Thu, 16 May 2013 13:32:09 +0200
Received: from cpc6-cmbg17-2-0-cust487.5-4.cable.virginmedia.com
	([86.30.57.232] helo=[172.30.1.45])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1Ucw8A-0000jr-E0; Thu, 16 May 2013 13:13:54 +0200
Message-ID: <1368702833.6920.125.camel@phil-desktop.brightsign>
From: Phil Blundell <pb@pbcl.net>
To: Jesse Zhang <sen.zhang@windriver.com>
Date: Thu, 16 May 2013 12:13:53 +0100
In-Reply-To: <51948307.5070608@windriver.com>
References: <51948307.5070608@windriver.com>
X-Mailer: Evolution 3.4.4-1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: should perl modules go in oe-core? (possibly python and ruby ones too)
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 16 May 2013 11:32:11 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2013-05-16 at 14:56 +0800, Jesse Zhang wrote:
> We've accumulated quite a few perl modules and would like to contribute
> some/all of them to oe-core. But I think we'd better ask how everyone
> thinks before doing so, since the number of the modules are pretty
> large, and the policy may as well apply to python/ruby packages.
> 
> Most of the modules are simple cpan recipes. They are easy to maintain,
> but do consume *some* manpower.
> 
> I think there are a few alternatives.
> 
> 1. decide on each module on a case-by-case basis.
> 
> 2. keep all of them in some special layer other than oe-core.
> 
> 3. everyone maintain what they need in-house.
> 
> None of them seems perfect. Is there already some policy?

As you say, all the options seem to have at least some drawbacks.  I've
been faced with this problem recently when trying to make an updated
recipe for xmltv (which has a vast number of perl dependencies) and
wasn't able to come up with any ideal answer either. 

I think my preference would be to have a dedicated meta-cpan layer which
does nothing other than provide recipes for CPAN modules (or, possibly,
Perl modules in general) and which strives to be a comprehensive
resource for them.  This seems like the only way to avoid ending up with
overlapping sets of modules in different layers, with the consequent
duplication of work and confusion that would result. 

I don't think these modules belong in oe-core: it would be a lot of
recipes (with all the parse time and testing overhead that this entails)
and most oe-core users aren't going to want them.

p.




