Received: from mailout-de.gmx.net ([213.165.64.23])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1RJv0s-0007C6-7U
	for openembedded-core@lists.openembedded.org;
	Sat, 29 Oct 2011 00:34:58 +0200
Received: (qmail invoked by alias); 28 Oct 2011 22:28:56 -0000
Received: from p4FDF0201.dip.t-dialin.net (EHLO localhost.localdomain)
	[79.223.2.1]
	by mail.gmx.net (mp011) with SMTP; 29 Oct 2011 00:28:56 +0200
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX1/e+NwGpxreyCBDPIiEGJGdiMuzJx78KOKw9mA2jT
	DkeRQlpEKpcJ5l
From: Andreas =?utf-8?q?M=C3=BCller?= <schnitzeltony@gmx.de>
To: "Patches and discussions about the oe-core layer"
	<openembedded-core@lists.openembedded.org>
Date: Sat, 29 Oct 2011 00:33:46 +0200
User-Agent: KMail/1.13.7 (Linux/2.6.35.14-97.fc14.x86_64; KDE/4.6.5; x86_64; ;
	)
References: <201110272230.29012.schnitzeltony@gmx.de>
	<1319797331.22423.13.camel@ted>
In-Reply-To: <1319797331.22423.13.camel@ted>
MIME-Version: 1.0
Message-Id: <201110290033.46761.schnitzeltony@gmx.de>
X-Y-GMX-Trusted: 0
Subject: Re: Trouble by last dbus patch (46e6c3fa8034b12d178d605f3f5d7efe69671a13)?
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
X-List-Received-Date: Fri, 28 Oct 2011 22:34:58 -0000
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Friday, October 28, 2011 12:22:11 PM Richard Purdie wrote:
> On Thu, 2011-10-27 at 22:30 +0200, Andreas M=C3=BCller wrote:
> > Since the last updates of all layers (angstrom based) I have issues with
> >=20
> > * networkmanager/nm-applet (meta-oe): I am not allowed to change the
> > settings
> >=20
> >   any more
> >=20
> > * xfce-session (meta-oe): Logging out takes very long and
> > Restart/Shutdown is
> >=20
> >   disabled
> >=20
> > I remember that I had similar issues a while ago. That could be worked
> > around by starting some dbus stuff ( do not exactly remember what it was
> > ).
> >=20
> > With this vague idea I checked and found in oe-core:
> > | dbus: use useradd class to allow use in read-only filesystems
> > | author	Otavio Salvador <otavio@ossystems.com.br>
> > | commit	46e6c3fa8034b12d178d605f3f5d7efe69671a13
> >=20
> > Not understanding totally what is all about I see in /etc/passw
> >=20
> > | messagebus:x:999:998::/var/lib/dbus:/bin/sh
> >=20
> > but I don't have /var/lib/dbus on my sytem!!
> >=20
> > I did not check yet, but maybe this is an incompatibilty with angstrom
> > custom
> >=20
> > | FILESYSTEM_PERMS_TABLES =3D "fs-perms-angstrom.txt"
> >=20
> > somebody around to enlight the darkness?
>=20
> There are some issues due to the orcering of when we now start some of
> the services. After the above change the dbus service starts much
> earlier on first boot, before some of the other postinstalls have run.
> This can mean you see errors due to users which have not yet been
> created by postinstalls (e.g. avahi or xuser) yet the dbus files
> reference these and its trying to start those services.
>=20
> We're looking at fixing the remaining adduser type postinstalls to
> address this. I'm not sure if this is related to the problem you were
> seeing above or not.
>=20
=46YI: reverting the patch fixes mentioned issues here.

Andreas


