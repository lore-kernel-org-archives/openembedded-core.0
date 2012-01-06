Received: from mailout-de.gmx.net ([213.165.64.23])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1RjA1Y-0002lZ-Ro
	for openembedded-core@lists.openembedded.org;
	Fri, 06 Jan 2012 14:40:00 +0100
Received: (qmail invoked by alias); 06 Jan 2012 13:32:36 -0000
Received: from p5B0A0FDC.dip.t-dialin.net (EHLO localhost.localdomain)
	[91.10.15.220]
	by mail.gmx.net (mp065) with SMTP; 06 Jan 2012 14:32:36 +0100
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX18sI80DY6cst5U8QzRE4kYid7hkgOIvfDqFi41Ccg
	yNF7LkIrhywHFy
From: Andreas =?iso-8859-1?q?M=FCller?= <schnitzeltony@gmx.de>
To: "Patches and discussions about the oe-core layer"
	<openembedded-core@lists.openembedded.org>
Date: Fri, 6 Jan 2012 14:33:36 +0100
User-Agent: KMail/1.13.7 (Linux/2.6.35.14-106.fc14.x86_64; KDE/4.6.5; x86_64; ;
	)
References: <201201060029.45032.schnitzeltony@gmx.de>
	<4F066BEF.5080908@intel.com>
In-Reply-To: <4F066BEF.5080908@intel.com>
MIME-Version: 1.0
Message-Id: <201201061433.36640.schnitzeltony@gmx.de>
X-Y-GMX-Trusted: 0
Subject: Re: libs transition /usr/lib -> /lib questions
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
X-List-Received-Date: Fri, 06 Jan 2012 13:40:00 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On Friday, January 06, 2012 04:35:11 AM Scott Garman wrote:
> On 01/05/2012 03:29 PM, Andreas M=FCller wrote:
> > Hi
> >=20
> > currently some libs are moving from $libdir (/usr/lib) ->  $base_libdir
> > (/lib). I have the following questions:
> >=20
> > * can sombody explain a bit more what is it for and how the decision is
> > made to transit libs? I read the commit messages but still have no idea
> > what this enhances / fixes. What is 'not safe' or - I guess the
> > insane.bbclass modification deals same issue - 'system recovery'. Is
> > that something I (should) have? :)
> >=20
> > * can somebody please take care what I see with meta-oe / obexd:
> >=20
> > | arm-angstrom-linux-gnueabi-libtool: link: cannot find the library
> >=20
> > `/home/Superandy/tmp/oe-core-eglibc/sysroots/overo/lib/libusb-1.0.la' or
> > unhandled argument `=3D/lib/libusb-1.0.la'
> >=20
> > | make[1]: *** [src/obexd] Error 1
> >=20
> > libusb-1.0.la still resides in .../sysroots/overo/usr/lib. Maybe it nee=
ds
> > transition too? If yes: Are there also others which need libtool-lib
> > transition?
> >=20
> > Thanks
> >=20
> > Andreas
>=20
> Hi Andreas,
>=20
> I think you mentioned in another thread that the "why" part of your
> question has been addressed.=20
Yes.
> As for the location of libusb-1.0.la - it
> looks like Richard previously missed one of my commits moving
> libusb-compat, and just merged it to oe-core master:
>=20
> http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?id=3D198f2ac06e602=
4575
> 0a2c6561b8c8e2eaa93f6be
>=20
> Does this fix the issue?
>=20
> I may be hard to reach tomorrow, so I hope RP or Mark Hatle can field
> any further questions for me.
>=20
I think the problem I reported was that *.la is in /usr/lib while all other=
s are=20
now in /lib. I tried moving libusb-1.0.la to /lib manually and rebuild udev=
 and=20
obexd without issues.=20

So why are your patches moving *.la back to /usr/lib?

Andreas


