Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1QZ8h3-0007pW-1A for openembedded-core@lists.openembedded.org;
	Tue, 21 Jun 2011 23:41:09 +0200
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.3])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <pb@pbcl.net>)
	id 1QZ8dc-0002r4-KZ; Tue, 21 Jun 2011 23:37:36 +0200
From: Phil Blundell <pb@pbcl.net>
To: Mark Hatle <mark.hatle@windriver.com>
In-Reply-To: <4E010CC4.5010906@windriver.com>
References: <4E00CA30.7020302@windriver.com>
	<1308682643.3083.18.camel@lenovo.internal.reciva.com>
	<4E00ED2C.1040708@windriver.com>
	<1308690566.3083.75.camel@lenovo.internal.reciva.com>
	<4E010CC4.5010906@windriver.com>
Date: Tue, 21 Jun 2011 22:37:30 +0100
Message-ID: <1308692250.3083.79.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Directory permissions and ownership -- RFC
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
X-List-Received-Date: Tue, 21 Jun 2011 21:41:09 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-06-21 at 16:27 -0500, Mark Hatle wrote:
> I don't know how to do this within bitbake (easily).  The table is currently a
> static set of paths that exist within the distribution as a whole.  They are not
> recipe specific, but you can have more then one file... the assumption is
> different layers may bring in additional files, only if necessary.
> 
> If there is existing code I can use to identify and resolve in-line variables,
> I'll be happy to add that into the code.  I'd certainly like to add that
> capability, but so far we don't have it.  (Would be nice in the device_table
> file.. but I doubt that's practical as the code is not run within python.)

I think bb.data.expand() should do what you need there.

p.




