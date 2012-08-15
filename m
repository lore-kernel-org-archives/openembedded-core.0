Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1T1bOU-0007kW-IL
	for openembedded-core@lists.openembedded.org;
	Wed, 15 Aug 2012 13:04:10 +0200
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1T1bCy-0003hw-Ew
	for openembedded-core@lists.openembedded.org;
	Wed, 15 Aug 2012 12:52:16 +0200
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 15 Aug 2012 11:52:15 +0100
In-Reply-To: <502B7E58.5010002@mlbassoc.com>
References: <502A3A26.5090008@mlbassoc.com>
	<1344944787.23275.384.camel@phil-desktop>
	<502A3C00.6010609@mlbassoc.com>
	<20120814135946.GA5597@mi.fu-berlin.de>
	<3873D957-9816-4F94-B331-C3B7CB68FF37@dominion.thruhere.net>
	<502A6515.2050007@mlbassoc.com>
	<1344976258.7750.33.camel@x121e.pbcl.net>
	<502B7E58.5010002@mlbassoc.com>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1345027936.23275.438.camel@phil-desktop>
Mime-Version: 1.0
Subject: Re: wpa-supplicant & EAP-TLS
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
X-List-Received-Date: Wed, 15 Aug 2012 11:04:10 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-08-15 at 04:47 -0600, Gary Thomas wrote:
> I looked a bit into this and found that OE-core is already rather
> schizo on this topic, so I'm not quite sure what needs to be done
> here (i.e. should there be a DISTRO_FEATURES switch that chooses only
> one?)  It would seem that all systems (at least those with wpa-supplicant
> included) will already have both SSL libraries installed.

"All systems" is probably a bit strong.  I certainly have multiple
configurations which don't install anything from the openssl list below.

Anyway, it looks like the best way forward in the short term is to make
the choice of SSL library be a PACKAGECONFIG option for wpa-supplicant
and any other recipes that you feel like changing.  I think it would
also make sense to have some sort of DISTRO_FEATURE to set a global
preference for this although perhaps the exact form of that setting
needs a bit of further thought.

> opsnssl is used in these packages:
>    midori
>    socat
>    curl-native
>    openvpn
>    bind
>    telepathy-idle
>    dhcp
>    xserver-kdrive
>    tcf-agent
>    python
>    rpm
>    git
>    task-core-basic
>    mailx
>    libzypp (=> sat-solver, zypper)
>    wget
> 
> gnutls is used by these packages:
>    cups
>    wpa-supplicant
>    neon
>    curl

p.





