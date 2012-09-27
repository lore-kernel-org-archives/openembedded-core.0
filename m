Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1THBXw-00085O-Ia
	for openembedded-core@lists.openembedded.org;
	Thu, 27 Sep 2012 12:42:20 +0200
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>)
	id 1THBLW-0007rx-UB; Thu, 27 Sep 2012 12:29:31 +0200
From: Phil Blundell <philb@gnu.org>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 27 Sep 2012 11:29:29 +0100
References: <1348661505.31293.106.camel@phil-desktop>
	<20120926122357.GJ3313@jama.jama.net>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1348741770.32611.14.camel@phil-desktop>
Mime-Version: 1.0
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gdk-pixbuf: Use qemu to run postinsts in offline root mode
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
X-List-Received-Date: Thu, 27 Sep 2012 10:42:20 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-09-26 at 13:28 +0100, Phil Blundell wrote:
> On Wed, 2012-09-26 at 14:23 +0200, Martin Jansa wrote:
> > On Wed, Sep 26, 2012 at 01:11:44PM +0100, Phil Blundell wrote:
> > > This makes it possible to use gdk-pixbuf on a read-only rootfs.
> > 
> > Isn't this issue resolved in "[RFC 0/7] Postinstall improvements" too?
> 
> Ah, possibly.  I haven't really been following that thread.  I'll take a
> look.

I found the patch that I guess you were referring to:

http://lists.linuxtogo.org/pipermail/openembedded-core/2012-September/029913.html

Personally I don't like that solution so much; the reliance on
NATIVE_ROOT containing the appropriate bits seems a bit fragile.  But I
suppose it's a matter of opinion.

p.




