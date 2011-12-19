Received: from mailout-de.gmx.net ([213.165.64.22])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1RclRB-0001AP-5f
	for openembedded-core@lists.openembedded.org;
	Mon, 19 Dec 2011 23:12:01 +0100
Received: (qmail invoked by alias); 19 Dec 2011 22:04:55 -0000
Received: from p5B0A29E0.dip.t-dialin.net (EHLO localhost.localdomain)
	[91.10.41.224]
	by mail.gmx.net (mp032) with SMTP; 19 Dec 2011 23:04:55 +0100
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX1/bBy560knbYxFIa7Z069I12uwA+AkQRZc2euY+hO
	8taBQooDCfI7kr
From: Andreas =?iso-8859-1?q?M=FCller?= <schnitzeltony@gmx.de>
To: "Patches and discussions about the oe-core layer"
	<openembedded-core@lists.openembedded.org>
Date: Mon, 19 Dec 2011 23:05:35 +0100
User-Agent: KMail/1.13.7 (Linux/2.6.35.14-106.fc14.x86_64; KDE/4.6.5; x86_64; ;
	)
References: <201112170258.10212.schnitzeltony@gmx.de>
	<4EEF8199.9090007@linux.intel.com>
In-Reply-To: <4EEF8199.9090007@linux.intel.com>
MIME-Version: 1.0
Message-Id: <201112192305.35700.schnitzeltony@gmx.de>
X-Y-GMX-Trusted: 0
Subject: Re: require *.bbappend
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
X-List-Received-Date: Mon, 19 Dec 2011 22:12:01 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On Monday, December 19, 2011 07:25:29 PM Joshua Lock wrote:
> On 16/12/11 17:58, Andreas M=FCller wrote:
> > Hi
> >=20
> > I have the following use case:
> >=20
> > In my working layer I would like to have a recipe adding functionality =
to
> > a recipe from another layer (e.g systemd-image.bb from angstrom) with a
> > different name ( -> no bbappend ). How about
> >=20
> > * create systemd-image.bbapend with just 'FILESEXTRAPATHS :=3D
> > "${THISDIR}"' to get it into the scope of my layer
> > * create a recipe  which contains 'require systemd-image.bbappend'
> >=20
> > Currently parser complains that systemd-image.bbappend is not a BitBake
> > file.
>=20
> I think this should work and the issue you're seeing is that require
> wants a relative PATH from BBPATH.
>=20
> i.e. require recipes-images/angstrom/systemd-image.bb
>=20
AArgh - thanks for helping me out of quirks by such simple solution :)

Andreas


