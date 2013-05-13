Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1Ubtds-0002NY-Rg for openembedded-core@lists.openembedded.org;
	Mon, 13 May 2013 16:22:28 +0200
Received: from cpc6-cmbg17-2-0-cust487.5-4.cable.virginmedia.com
	([86.30.57.232] helo=[172.30.1.45])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1UbtMK-0004KX-82; Mon, 13 May 2013 16:04:12 +0200
Message-ID: <1368453851.6920.11.camel@phil-desktop.brightsign>
From: Phil Blundell <pb@pbcl.net>
To: Jukka Rissanen <jukka.rissanen@linux.intel.com>
Date: Mon, 13 May 2013 15:04:11 +0100
In-Reply-To: <5190F0EA.1090807@linux.intel.com>
References: <1368449357-3191-1-git-send-email-jukka.rissanen@linux.intel.com>
	<20130513133924.GB3187@jama> <5190F0EA.1090807@linux.intel.com>
X-Mailer: Evolution 3.4.4-1 
Mime-Version: 1.0
Cc: Martin Jansa <martin.jansa@gmail.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2 0/5] Enable VPN support in ConnMan
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
X-List-Received-Date: Mon, 13 May 2013 14:22:47 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2013-05-13 at 16:55 +0300, Jukka Rissanen wrote:
> On 13.05.2013 16:39, Martin Jansa wrote:
> >> Jukka Rissanen (5):
> >>    connman: Add VPN support
> >>    connman: Add OpenVPN support
> >>    connman: Add vpnc support
> >>    connman: Add L2TP support
> >>    connman: Add PPTP support
> >
> > I think that 2-5 are missing
> >
> > PACKAGES =+ "${PN}-vpn-foo"
> >
> 
> The individual vpn plugin packages were created and added to distro 
> without a problem even if they were not in PACKAGES.
> But I can certainly send another version that adds these.

If it's using do_split_packages() then you don't need to (and shouldn't)
add those things to PACKAGES directly.

You might consider patching connman.inc to add the INSANE_SKIP stuff
automatically since all the plugins will presumably need that treatment.

p.




