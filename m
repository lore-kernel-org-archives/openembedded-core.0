Received: from outpost1.zedat.fu-berlin.de ([130.133.4.66])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <heinold@mi.fu-berlin.de>) id 1T1HqP-0005wA-3A
	for openembedded-core@lists.openembedded.org;
	Tue, 14 Aug 2012 16:11:41 +0200
Received: from relay1.zedat.fu-berlin.de ([130.133.4.67])
	by outpost1.zedat.fu-berlin.de (Exim 4.69)
	for openembedded-core@lists.openembedded.org with esmtp
	(envelope-from <heinold@mi.fu-berlin.de>)
	id <1T1Heu-0001H2-BL>; Tue, 14 Aug 2012 15:59:48 +0200
Received: from andorra.imp.fu-berlin.de ([160.45.42.84])
	by relay1.zedat.fu-berlin.de (Exim 4.69)
	for openembedded-core@lists.openembedded.org with esmtp
	(envelope-from <heinold@mi.fu-berlin.de>)
	id <1T1Heu-0007M0-8A>; Tue, 14 Aug 2012 15:59:48 +0200
Received: from heinold by internal andorra.imp.fu-berlin.de with local (Exim
	4.72) id 1T1Het-0001mg-5R
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Aug 2012 15:59:47 +0200
Date: Tue, 14 Aug 2012 15:59:47 +0200
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120814135946.GA5597@mi.fu-berlin.de>
References: <502A3A26.5090008@mlbassoc.com>
	<1344944787.23275.384.camel@phil-desktop>
	<502A3C00.6010609@mlbassoc.com>
MIME-Version: 1.0
In-Reply-To: <502A3C00.6010609@mlbassoc.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Sender: Henning Heinold <heinold@mi.fu-berlin.de>
X-Originating-IP: 160.45.42.84
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
X-List-Received-Date: Tue, 14 Aug 2012 14:11:41 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Aug 14, 2012 at 05:52:32AM -0600, Gary Thomas wrote:
> On 2012-08-14 05:46, Phil Blundell wrote:
> >On Tue, 2012-08-14 at 05:44 -0600, Gary Thomas wrote:
> >>Does anyone know why the recipe for wpa_supplicant is using gnutls
> >>and not the default OpenSSH for TLS services?  It seems that gnutls
> >>is somehow broken and EAP-TLS does not work with this configuration.
> >>Changing wpa_supplicant to use the OpenSSH libraries makes EAP-TLS
> >>work fine.
> >>
> >>Would a patch to make this change be entertained?  or should I just
> >>keep it in my own layer?
> >
> >I don't think a patch to just flip the default would be a good idea.  A
> >patch to make it be a DISTRO_FEATURE, on the other hand, would be
> >excellent.
> 
> Thanks, I'll see about working one up.

Btw. You mean openssl not openssh, which uses openssl too.

And a problem with using openssl for wpa_supplicant was license incompatibilities.

Mabyee it is fixed meanwhile.

Bye Henning


