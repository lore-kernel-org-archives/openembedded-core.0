Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1QN4oj-0001Pt-FD for openembedded-core@lists.openembedded.org;
	Thu, 19 May 2011 17:07:24 +0200
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.3])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <pb@pbcl.net>)
	id 1QN4lp-0007Wi-32; Thu, 19 May 2011 17:04:13 +0200
From: Phil Blundell <pb@pbcl.net>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
In-Reply-To: <1305807396.3424.510.camel@rex>
References: <1305640549.2429.226.camel@phil-desktop>
	<1305642273.3424.244.camel@rex>
	<1305643833.2429.264.camel@phil-desktop>
	<1305649331.3424.259.camel@rex>
	<1305733061.18415.98.camel@lenovo.internal.reciva.com>
	<1305800103.3424.464.camel@rex>
	<1305801068.18415.179.camel@lenovo.internal.reciva.com>
	<1305804109.3424.475.camel@rex>
	<1305805268.18415.185.camel@lenovo.internal.reciva.com>
	<1305807396.3424.510.camel@rex>
Date: Thu, 19 May 2011 16:04:06 +0100
Message-ID: <1305817446.18415.193.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] rootfs_ipk: respect ONLINE_PACKAGE_MANAGEMENT
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
X-List-Received-Date: Thu, 19 May 2011 15:07:43 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-05-19 at 13:16 +0100, Richard Purdie wrote:
> So if we:
> 
> a) Only add ROOTFS_PKGMANAGE_BOOTSTRAP if postinstalls were present
> b) Add the read-only-rootfs option we discussed which errors if 
>    postinstalls are present
> 
> we end up a lot closer to where you want to be.

Yes, sounds reasonable.  And I think we could then eliminate
remove_packaging_data_files() altogether, in favour of having the right
thing happen automatically during rootfs construction, which would
probably be a good thing too.

p.




