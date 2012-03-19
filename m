Received: from giant.haxx.se ([80.67.6.50])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bjst@giant.haxx.se>) id 1S9f6k-0001tH-I0
	for openembedded-core@lists.openembedded.org;
	Mon, 19 Mar 2012 17:06:54 +0100
Received: from giant.haxx.se (localhost.localdomain [127.0.0.1])
	by giant.haxx.se (8.14.4/8.14.4/Debian-2) with ESMTP id q2JFw3bd006179
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Mar 2012 16:58:03 +0100
Received: (from bjst@localhost)
	by giant.haxx.se (8.14.4/8.14.4/Submit) id q2JFw3Gc006178
	for openembedded-core@lists.openembedded.org;
	Mon, 19 Mar 2012 16:58:03 +0100
Date: Mon, 19 Mar 2012 16:58:03 +0100
From: =?iso-8859-1?Q?Bj=F6rn?= Stenberg <bjst@enea.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120319155803.GF9911@giant>
References: <22576197.WV0krj9sgO@helios>
	<1331799945-14172-1-git-send-email-bjst@enea.com>
	<20671C9C-1AC1-482A-9B4A-C40EE9087BD7@dominion.thruhere.net>
MIME-Version: 1.0
In-Reply-To: <20671C9C-1AC1-482A-9B4A-C40EE9087BD7@dominion.thruhere.net>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-MIME-Autoconverted: from 8bit to quoted-printable by giant.haxx.se id
	q2JFw3bd006179
Subject: Re: [PATCH] Add pigz as gzip-native alternative.
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
X-List-Received-Date: Mon, 19 Mar 2012 16:06:54 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Koen Kooi wrote:
> Op 15 mrt. 2012, om 09:25 heeft Bj=F6rn Stenberg het volgende geschreve=
n:
> > +PROVIDES_virtclass-native +=3D "gzip-native"
>=20
> This is either missing update-alternatives entries or it is missing
> RREPLACES/RCONFLICTS with gzip/busybox/etc. Or both.

My intention with the patch was to provide a native-only recipe for pigz,=
 to improve distro build speed.

I'm not sure there is much interest in using pigz on target.

--=20
Bj=F6rn


