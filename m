Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1T1FlM-00080o-Jg
	for openembedded-core@lists.openembedded.org;
	Tue, 14 Aug 2012 13:58:20 +0200
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1T1FZr-0002zd-LY
	for openembedded-core@lists.openembedded.org;
	Tue, 14 Aug 2012 13:46:28 +0200
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 14 Aug 2012 12:46:26 +0100
In-Reply-To: <502A3A26.5090008@mlbassoc.com>
References: <502A3A26.5090008@mlbassoc.com>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1344944787.23275.384.camel@phil-desktop>
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
X-List-Received-Date: Tue, 14 Aug 2012 11:58:20 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2012-08-14 at 05:44 -0600, Gary Thomas wrote:
> Does anyone know why the recipe for wpa_supplicant is using gnutls
> and not the default OpenSSH for TLS services?  It seems that gnutls
> is somehow broken and EAP-TLS does not work with this configuration.
> Changing wpa_supplicant to use the OpenSSH libraries makes EAP-TLS
> work fine.
> 
> Would a patch to make this change be entertained?  or should I just
> keep it in my own layer?

I don't think a patch to just flip the default would be a good idea.  A
patch to make it be a DISTRO_FEATURE, on the other hand, would be
excellent.

p.




