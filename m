Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SMaKo-0004NB-9P for openembedded-core@lists.openembedded.org;
	Tue, 24 Apr 2012 09:38:50 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q3O7THhY004794
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Apr 2012 08:29:17 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 04590-03 for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Apr 2012 08:29:12 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q3O7T6VJ004777
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Apr 2012 08:29:08 +0100
Message-ID: <1335252545.12692.103.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 24 Apr 2012 08:29:05 +0100
In-Reply-To: <71A92016-D7C8-4834-8E80-849F267B3B8C@dominion.thruhere.net>
References: <cover.1335245655.git.xiaofeng.yan@windriver.com>
	<fde21e1126e23439ccd9dc7ba8e7cc9e96df3799.1335245655.git.xiaofeng.yan@windriver.com>
	<7334A38D-4148-4397-94A0-D721CD0BD924@dominion.thruhere.net>
	<4F964456.6050106@windriver.com>
	<71A92016-D7C8-4834-8E80-849F267B3B8C@dominion.thruhere.net>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
X-MIME-Autoconverted: from 8bit to quoted-printable by tim.rpsys.net id
	q3O7THhY004794
Subject: Re: [PATCH 1/1] gdk-pixbuf: Add --with-x11 when building lsb image
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
X-List-Received-Date: Tue, 24 Apr 2012 07:38:50 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2012-04-24 at 08:29 +0200, Koen Kooi wrote:
> Op 24 apr. 2012, om 08:12 heeft Xiaofeng Yan het volgende geschreven:
>=20
> > On 2012=E5=B9=B404=E6=9C=8824=E6=97=A5 13:53, Koen Kooi wrote:
> >> Op 24 apr. 2012, om 07:50 heeft Xiaofeng Yan het volgende geschreven=
:
> >>=20
> >>=20
> >>> From: Xiaofeng Yan <xiaofeng.yan@windriver.com>
> >>>=20
> >>>=20
> >>> LSB Test Suite complain "no library libgdk_pixbuf_xlib-2.0.so.0" \
> >>> because of having "--without-x11" for gdk-pixbuf_2.24.1.bb.
> >>> For passing lsb test I add PACKAGECONFIG support to the recipe and =
\
> >>> have poky-lsb turn on the poky-lsb distro for this recipe.
> >>>=20
> >>> [YOCTO #2284]
> >>>=20
> >> Shouldn't this be an 'x11' DISTRO_FEATURE instead?
> >>=20
> > because "--without-x11" is disabled when x11 exists in core-image-sat=
o. Using 'x11' DISTRO_FEATURE instead will change the default set, which =
will cause enable "--with-x11" when x11 is in DISTRO_FEATURE. LSB Test Su=
ite need this configuration but other image may not need it even if havin=
g x11.
>=20
> What use-case is there for having 'x11' in DISTRO_FEATURES but not want=
ing x11 support in pixbuf?
>=20
> Regardless of that, poky-lsb distro overrides have no place in oe-core,=
 they should go into their own layer as bbappends.

We should be using the linuxstdbase override and also make it
conditional on x11 being in DISTRO_FEATURES.

As far as I can tell nothing uses/cares about this library apart from
lsb right now. If that changes I'm happy to build more of the time but
until we need it, its pointless. We should also split it into a separate
package.

Cheers,

Richard




