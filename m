Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SrrMY-0006Th-1Z for openembedded-core@lists.openembedded.org;
	Thu, 19 Jul 2012 16:05:54 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q6JDsWGn002769
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jul 2012 14:54:32 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 02518-03 for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jul 2012 14:54:28 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q6JDsOHe002763
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jul 2012 14:54:25 +0100
Message-ID: <1342706068.7940.13.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 19 Jul 2012 14:54:28 +0100
In-Reply-To: <FA061505-81A3-4B54-9439-51A7C1711415@dominion.thruhere.net>
References: <1342704262.7940.11.camel@ted>
	<FA061505-81A3-4B54-9439-51A7C1711415@dominion.thruhere.net>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH] avahi-ui: Remove the locale files and rely on the main avahi package for these
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
X-List-Received-Date: Thu, 19 Jul 2012 14:05:54 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2012-07-19 at 15:41 +0200, Koen Kooi wrote:
> Op 19 jul. 2012, om 15:24 heeft Richard Purdie het volgende geschreven:
> 
> > Both avahi and avahi-ui were installing locale files. This is pointless duplication
> > and they are identical between the two packages. This changes things so they're only
> > handled by the main package.
> > 
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > ---
> > diff --git a/meta/recipes-connectivity/avahi/avahi-ui_0.6.31.bb b/meta/recipes-connectivity/avahi/avahi-ui_0.6.31.bb
> > index 2c12053..7d56dad 100644
> > --- a/meta/recipes-connectivity/avahi/avahi-ui_0.6.31.bb
> > +++ b/meta/recipes-connectivity/avahi/avahi-ui_0.6.31.bb
> > @@ -54,6 +54,7 @@ do_install_append () {
> > 	rm ${D}${sbindir} -rf
> > 	rm ${D}${datadir}/avahi/a*
> > 	rm ${D}${datadir}/avahi/s*
> > +	rm ${D}${datadir}/locale/ -rf
> > 	rm ${D}${datadir}/dbus* -rf
> > 	rm ${D}${mandir}/man1/a*
> > 	rm ${D}${mandir}/man5 -rf
> 
> MIssing PR bump

No output changes, just removal of duplicate files in the sysroot which
are ignored anyway.

Cheers,

Richard



