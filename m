Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1TGsnW-00036A-9H
	for openembedded-core@lists.openembedded.org;
	Wed, 26 Sep 2012 16:41:10 +0200
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>)
	id 1TGsb7-0006Tz-KX; Wed, 26 Sep 2012 16:28:21 +0200
From: Phil Blundell <philb@gnu.org>
To: Colin Walters <walters@verbum.org>
Date: Wed, 26 Sep 2012 15:28:20 +0100
In-Reply-To: <1348668853.7240.5.camel@lenny>
References: <1348661842.31293.108.camel@phil-desktop>
	<1348668794.7240.4.camel@lenny> <1348668853.7240.5.camel@lenny>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1348669701.31293.116.camel@phil-desktop>
Mime-Version: 1.0
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] glib-2.0: Update to 2.34.0
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
X-List-Received-Date: Wed, 26 Sep 2012 14:41:10 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-09-26 at 10:14 -0400, Colin Walters wrote:
> On Wed, 2012-09-26 at 10:13 -0400, Colin Walters wrote:
> > On Wed, 2012-09-26 at 13:17 +0100, Phil Blundell wrote:
> > 
> > >  meta/recipes-core/glib-2.0/glib-2.0/nodbus.patch   |   34 ++++++++--------
> > 
> > This should not be necessary anymore; see:
> 
> http://git.gnome.org/browse/glib/commit/?id=f084b603771f78126bc0b07229a1574b76e776bb

That disables all the tests, right?  I wasn't entirely clear whether we
wanted to do that or not.  If we do then yes, I agree, that would be a
way to avoid the nodbus.patch.

p.




