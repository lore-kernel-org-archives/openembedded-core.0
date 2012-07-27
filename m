Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SunS6-00039N-2m for openembedded-core@lists.openembedded.org;
	Fri, 27 Jul 2012 18:31:46 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q6RGKDt2007533;
	Fri, 27 Jul 2012 17:20:13 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 06353-07; Fri, 27 Jul 2012 17:20:10 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q6RGK2Zt007518
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Fri, 27 Jul 2012 17:20:05 +0100
Message-ID: <1343406002.16998.1.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 27 Jul 2012 17:20:02 +0100
In-Reply-To: <CABcZANk5df9=C=fznO+N2Xs5+XrUgvtO0E6DqrpwxPArysFokA@mail.gmail.com>
References: <365E1805BC95084CBE82381A0B8699945BD9B9B0@EU-MBX-03.mgc.mentorg.com>
	<CABcZANk5df9=C=fznO+N2Xs5+XrUgvtO0E6DqrpwxPArysFokA@mail.gmail.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: "Ahsan, Noor" <Noor_Ahsan@mentor.com>
Subject: Re: [PATCH] dbus-glib: Conditionaly adds dbus-x11 to RDEPENDS_${PN}-tests
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
X-List-Received-Date: Fri, 27 Jul 2012 16:31:46 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2012-07-27 at 07:44 -0700, Chris Larson wrote:
> On Fri, Jul 27, 2012 at 6:10 AM, Ahsan, Noor <Noor_Ahsan@mentor.com> wrote:
> > From: Noor Ahsan <noor_ahsan@mentor.com>
> >
> > *  Build was hitting an error "Nothing RPROVIDES 'dbus-x11'". dbus-glib
> > RDEPENDS on it and
> >
> > dbus was providing dbus-x11 when x11 was present in DISTRO FEATURES. So
> > conditionally
> >
> > added dbus-x11 to RDEPENDS_${PN}-tests in dbus-glib recipe.
> >
> > * Verified on qemuppc.
> >
> > Signed-off-by: Noor Ahsan <noor_ahsan@mentor.com>
> 
> I think this is a better fix:
> 
> -PACKAGES += "${PN}-bash-completion ${PN}-tests-dbg ${PN}-tests"
> +PACKAGES += "${PN}-bash-completion ${@base_contains('PACKAGECONFIG',
> 'tests', '${PN}-tests-dbg ${PN}-tests', '', d}"
> 
> Due to this:
> 
> PACKAGECONFIG ??= ""
> PACKAGECONFIG[tests] = "--enable-tests,,,"

Its also worth noting that the dbus-x11 package is soon to be no more
given other patches on the mailing list.

Cheers,

Richard



