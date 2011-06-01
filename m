Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1QRoxh-0003Zp-UA for openembedded-core@lists.openembedded.org;
	Wed, 01 Jun 2011 19:12:05 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <pb@pbcl.net>)
	id 1QRoud-0001jQ-RS; Wed, 01 Jun 2011 19:08:55 +0200
From: Phil Blundell <pb@pbcl.net>
To: Mark Hatle <mark.hatle@windriver.com>
In-Reply-To: <4DE66FC6.4030607@windriver.com>
References: <1306944074.2529.107.camel@phil-desktop>
	<1306944235.2529.109.camel@phil-desktop>
	<5DBF32A5-22D5-4499-AD32-9C48680B7EBA@dominion.thruhere.net>
	<1306945014.2529.113.camel@phil-desktop> <4DE66D53.30505@windriver.com>
	<1306947245.2529.148.camel@phil-desktop>
	<4DE66FC6.4030607@windriver.com>
Organization: Phil Blundell Consulting Ltd
Date: Wed, 01 Jun 2011 18:08:54 +0100
Message-ID: <1306948134.2529.158.camel@phil-desktop>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: dbus-native --with-x
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 01 Jun 2011 17:12:06 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-06-01 at 11:58 -0500, Mark Hatle wrote:
> On 6/1/11 11:54 AM, Phil Blundell wrote:
> > On Wed, 2011-06-01 at 11:48 -0500, Mark Hatle wrote:
> >> So in the above, perl and python are really the only items that could be disabled.
> > 
> > Just to be clear, in the list you mentioned, were you talking about the
> > usage of rpm-native for rpmdeps, or the usage by package_rpm.bbclass
> > itself?
> 
> I was talking about rpm-native recipe in general, and how it's used.
> 
> rpmdeps requires a good chunk of the rpm infrastructure (even if we don't end up
> using rpmbuild or rpm commands during the build..)

Do you happen to have a list of what exactly rpmdeps does require?
Based on the descriptions you gave before, I'm guessing that it probably
doesn't need openssl (since, afaik, it doesn't do any signing) or pcre
(since it isn't building any packages) or acl, attr, bzip and zlib
(since it also isn't installing anything).  

It presumably does still need pcre, and I have no idea whether it needs
db or expat.

> It "should" be as simple and adding --without-perl and --without-python to the
> configuration line...  but I haven't tried it.

Righto.  I'll give that a try later and see what happens.

p.




