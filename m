Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1ROF1a-0001Ht-IX
	for openembedded-core@lists.openembedded.org;
	Wed, 09 Nov 2011 21:45:34 +0100
Received: by faat2 with SMTP id t2so2184698faa.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 Nov 2011 12:39:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=RsGQYc0cOzuu2EXWkUEVVf4mOw9i3wucGSYpEdmKVvo=;
	b=PhXH7KpkPAfppqURJvU6YJefSb70IBjCSXwOmlF8rp2QdalBUnn9zSOKnIs/N5DufG
	d0duOqPs2mHiE8X6yiX8LcXvqGhFFievjAFtDC3DH5ixJ+5SlKTglWoNToLN7oHYi+Ql
	WBVvAKmXAPT8wlk//b/a8OuAmWo2wEHzGxyYQ=
Received: by 10.223.81.196 with SMTP id y4mr7170401fak.6.1320871158988;
	Wed, 09 Nov 2011 12:39:18 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id a21sm8065764fao.18.2011.11.09.12.39.17
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 09 Nov 2011 12:39:17 -0800 (PST)
Date: Wed, 9 Nov 2011 21:39:16 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20111109203916.GG21022@jama.jama.net>
References: <201110272230.29012.schnitzeltony@gmx.de>
	<1319797331.22423.13.camel@ted>
	<201110290033.46761.schnitzeltony@gmx.de>
	<201111092138.57868.schnitzeltony@gmx.de>
MIME-Version: 1.0
In-Reply-To: <201111092138.57868.schnitzeltony@gmx.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
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
X-List-Received-Date: Wed, 09 Nov 2011 20:45:34 -0000
X-Groupsio-MsgNum: 12245
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="V32M1hWVjliPHW+c"
Content-Disposition: inline

--V32M1hWVjliPHW+c
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 09, 2011 at 09:38:57PM +0100, Andreas M=FCller wrote:
> On Saturday, October 29, 2011 12:33:46 AM Andreas M=FCller wrote:
> > On Friday, October 28, 2011 12:22:11 PM Richard Purdie wrote:
> > > On Thu, 2011-10-27 at 22:30 +0200, Andreas M=FCller wrote:
> > > > Since the last updates of all layers (angstrom based) I have issues
> > > > with
> > > >=20
> > > > * networkmanager/nm-applet (meta-oe): I am not allowed to change the
> > > > settings
> > > >=20
> > > >   any more
> > > >=20
> > > > * xfce-session (meta-oe): Logging out takes very long and
> > > > Restart/Shutdown is
> > > >=20
> > > >   disabled
> > > >=20
> > > > I remember that I had similar issues a while ago. That could be wor=
ked
> > > > around by starting some dbus stuff ( do not exactly remember what it
> > > > was ).
> > > >=20
> > > > With this vague idea I checked and found in oe-core:
> > > > | dbus: use useradd class to allow use in read-only filesystems
> > > > | author	Otavio Salvador <otavio@ossystems.com.br>
> > > > | commit	46e6c3fa8034b12d178d605f3f5d7efe69671a13
> > > >=20
> > > > Not understanding totally what is all about I see in /etc/passw
> > > >=20
> > > > | messagebus:x:999:998::/var/lib/dbus:/bin/sh
> > > >=20
> > > > but I don't have /var/lib/dbus on my sytem!!
> > > >=20
> > > > I did not check yet, but maybe this is an incompatibilty with angst=
rom
> > > > custom
> > > >=20
> > > > | FILESYSTEM_PERMS_TABLES =3D "fs-perms-angstrom.txt"
> > > >=20
> > > > somebody around to enlight the darkness?
> > >=20
> > > There are some issues due to the orcering of when we now start some of
> > > the services. After the above change the dbus service starts much
> > > earlier on first boot, before some of the other postinstalls have run.
> > > This can mean you see errors due to users which have not yet been
> > > created by postinstalls (e.g. avahi or xuser) yet the dbus files
> > > reference these and its trying to start those services.
> > >=20
> > > We're looking at fixing the remaining adduser type postinstalls to
> > > address this. I'm not sure if this is related to the problem you were
> > > seeing above or not.
> >=20
> > FYI: reverting the patch fixes mentioned issues here.
> >=20
> Maybe I missed something but after starting a new image - to get the erro=
rs=20
> mentioned above worked around - I still have to do manually on the machin=
e :
>=20
> chown messagebus:messagebus /var/run/dbus ${D}${localstatedir}/lib/dbus
> chown root:messagebus /usr/libexec/dbus-daemon-launch-helper
> chmod 4754 /usr/libexec/dbus-daemon-launch-helper
>=20
> As long as this is not fixed, can we have this additionally in pkg_postin=
st_dbus=20
> temporary?

You have wrong ${D} there, but you can apply
http://git.openembedded.org/openembedded-core-contrib/commit/?h=3Dshr&id=3D=
283b046e6e38afb63125776afdb5ee5fea0d0b7e
which still works, but it's not proper fix.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--V32M1hWVjliPHW+c
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk665PQACgkQN1Ujt2V2gByi8QCfZJ1JKcdkQc+meo0UtmBA4Ek1
5hMAn2IknRk+7SmIOiuX10KU8SCrwvnb
=Krmo
-----END PGP SIGNATURE-----

--V32M1hWVjliPHW+c--
