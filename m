Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1UcdMw-0004cL-A6 for openembedded-core@lists.openembedded.org;
	Wed, 15 May 2013 17:11:56 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r4FEuena005545; Wed, 15 May 2013 15:56:40 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id JdeWz2QW8ZB4; Wed, 15 May 2013 15:56:40 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r4FEuU3G005519
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Wed, 15 May 2013 15:56:34 +0100
Message-ID: <1368629601.18324.1.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Phil Blundell <pb@pbcl.net>
Date: Wed, 15 May 2013 17:53:21 +0300
In-Reply-To: <1368629183.6920.101.camel@phil-desktop.brightsign>
References: <51939E73.8070605@mlbassoc.com>
	<1368629183.6920.101.camel@phil-desktop.brightsign>
X-Mailer: Evolution 3.6.2-0ubuntu0.1 
Mime-Version: 1.0
Cc: oe-core layer <openembedded-core@lists.openembedded.org>, Patches
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
X-List-Received-Date: Wed, 15 May 2013 15:12:00 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2013-05-15 at 15:46 +0100, Phil Blundell wrote:
> On Wed, 2013-05-15 at 08:40 -0600, Gary Thomas wrote:
> > * Build an image, e.g. core-image-sato
> >    $ bitbake core-image-sato
> > * Cause some dependency to be rebuilt
> >    $ bitbake xserver-xorg -c cleansstate
> > * Rebuild the image
> >    $ bitbake core-image-sato
> 
> That's probably to be expected.  You haven't done anything to actually
> change the xserver-xorg package, just regenerated the same bits as you
> had before, so there's no reason why the image would need rebuilding.
> 
> Does it rebuild the image correctly if you do make a change to the
> xserver-xorg package?

Agreed, this is expected since the xserver-xorg output is unchanged and
therefore the system is deciding it doesn't need to rebuild the image.
If you change xserver-xorg somehow the checksum will change and the
image will rebuild.

Cheers,

Richard



