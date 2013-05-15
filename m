Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1UcdFr-0003x9-0z for openembedded-core@lists.openembedded.org;
	Wed, 15 May 2013 17:04:42 +0200
Received: from cpc6-cmbg17-2-0-cust487.5-4.cable.virginmedia.com
	([86.30.57.232] helo=[172.30.1.45])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1UccyF-0007XO-JK; Wed, 15 May 2013 16:46:23 +0200
Message-ID: <1368629183.6920.101.camel@phil-desktop.brightsign>
From: Phil Blundell <pb@pbcl.net>
To: Gary Thomas <gary@mlbassoc.com>
Date: Wed, 15 May 2013 15:46:23 +0100
In-Reply-To: <51939E73.8070605@mlbassoc.com>
References: <51939E73.8070605@mlbassoc.com>
X-Mailer: Evolution 3.4.4-1 
Mime-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Image dependency broken
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
X-List-Received-Date: Wed, 15 May 2013 15:04:43 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2013-05-15 at 08:40 -0600, Gary Thomas wrote:
> * Build an image, e.g. core-image-sato
>    $ bitbake core-image-sato
> * Cause some dependency to be rebuilt
>    $ bitbake xserver-xorg -c cleansstate
> * Rebuild the image
>    $ bitbake core-image-sato

That's probably to be expected.  You haven't done anything to actually
change the xserver-xorg package, just regenerated the same bits as you
had before, so there's no reason why the image would need rebuilding.

Does it rebuild the image correctly if you do make a change to the
xserver-xorg package?

p.




