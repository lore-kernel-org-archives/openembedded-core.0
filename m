Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RdlLV-0008N2-Ht
	for openembedded-core@lists.openembedded.org;
	Thu, 22 Dec 2011 17:18:17 +0100
Received: by eeit10 with SMTP id t10so4374014eei.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Dec 2011 08:11:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=7IUf2ICWDg9Ou3syMyhHvwjCWK+9OInJk1jqBD3kLcc=;
	b=Vtahzu8bqqQbza8ySC+zQw0g3pOHGAStz8FDRIugnNG1j5Cr8Y0+KrzGj34Q9h/UJQ
	Tei1JNh0i3vRePiCiBGhZxy1MH8ZVCcRWjtqx2kaCqK+0XnheuDSFVGuhC60U3JnUxWc
	1S0Kv8cQbsrRIsnOpLQytVxoGoVihRJn6ohsQ=
Received: by 10.14.125.132 with SMTP id z4mr4507563eeh.82.1324570267984;
	Thu, 22 Dec 2011 08:11:07 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id a60sm35779444eeb.4.2011.12.22.08.11.06
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 22 Dec 2011 08:11:07 -0800 (PST)
Date: Thu, 22 Dec 2011 17:10:55 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20111222161055.GK12791@jama.jama.net>
References: <alpine.DEB.2.00.1112220939580.26143@entw48>
	<20111222091041.GI12791@jama.jama.net>
	<20111222131753.GJ12791@jama.jama.net>
	<4EF3524B.6040601@windriver.com>
MIME-Version: 1.0
In-Reply-To: <4EF3524B.6040601@windriver.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: Regression bug: dbus messagebus user generation is wrong
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
X-List-Received-Date: Thu, 22 Dec 2011 16:18:17 -0000
X-Groupsio-MsgNum: 14688
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="g4MvFqI7wmANiPDo"
Content-Disposition: inline

--g4MvFqI7wmANiPDo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 22, 2011 at 09:52:43AM -0600, Mark Hatle wrote:
> On 12/22/11 7:17 AM, Martin Jansa wrote:
> ...
>=20
> > /********* logs *************/
> > Checking ERRORs in log.do_rootfs files
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D correct om-gta02:
> > Installing base-passwd (3.5.22-r9) to root...
> > Downloading file:/OE/shr-core/tmp-eglibc/deploy/ipk/armv4t/base-passwd_=
3.5.22-r9_armv4t.ipk.
> > Running groupadd commands...
> > /usr/sbin/nscd: Only root is allowed to use this option!
> > /usr/sbin/nscd: Only root is allowed to use this option!
> > /usr/sbin/nscd: Only root is allowed to use this option!
>=20
> We need to track down that error above and figure out what it means.  It =
could=20
> be that groupadd is attempting to run a system helper that it shouldn't b=
e.=20
> (nscd should never be consulted when we are running through pseudo for=20
> password/group calculations...)
>=20
> ...
>=20
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D wrong nokia900:
> > Installing dbus-1 (1.4.16-r2) to root...
> > Downloading file:/OE/shr-core/tmp-eglibc/deploy/ipk/armv7a-vfp-neon/dbu=
s-1_1.4.16-r2_armv7a-vfp-neon.ipk.
> > Running groupadd commands...
> > grep: /OE/shr-core/tmp-eglibc/work/nokia900-oe-linux-gnueabi/shr-image-=
2.0-r20/rootfs//etc/group: No such file or directory
> > groupadd: cannot open /etc/group
> > Running useradd commands...
> > grep: /OE/shr-core/tmp-eglibc/work/nokia900-oe-linux-gnueabi/shr-image-=
2.0-r20/rootfs//etc/passwd: No such file or directory
> > useradd: group '1000' does not exist
> > useradd: the GROUP=3D configuration in /etc/default/useradd will be ign=
ored
> > useradd: cannot open /etc/passwd
> > ...
>=20
> Ya, that is definitely broken.  W/o the files then the groupadd/useradd w=
on't=20
> function properly and the install is likely a failure.
>=20
> On other systems I work with, we -always- install the passwd/group files =
onto=20
> the system -first-.  Then we perform the regular installation procedure. =
 I=20
> wonder if we may have to do something like that within oe-core to force t=
he=20
> proper ordering.
>=20
> It would be interesting to me to see the install order that was selected =
in this=20
> case.  It could be that opkg either is missing some critical dependency=
=20
> information -- or perhaps what we need simply can't be specified.
>=20
> In other systems I've worked with, the base-passwd packages has been a=20
> requirement of the libc package.  Since libc generally gets installed ear=
ly in=20
> the process it usually enforces it to be first.  I'm not sure if OE-core =
has=20
> that same dep.  (Maybe we simply need any package that has files !=3D roo=
t:root=20
> have a dep on the passwd files?  Just thinking outloud here.. I'm not sur=
e thats=20
> really a good idea.)

dbus-1 .ipk file for all 4 architectures here has
Depends: update-rc.d, libdbus-1-3 (>=3D 1.4.16), libc6 (>=3D 2.14), shadow,=
 libexpat1 (>=3D 2.0.1), base-passwd
so the RDEPENDS added by useradd.bbclass worked fine.

But for some reason opkg fix from
http://git.openembedded.org/openembedded-core/commit/?id=3D2feba313c9911707=
47381c7cf821a45c2cd04632
wasn't enough to ensure that base-passwd was installed before dbus-1

and it probably isn't caused by circular dependency which were allowed by
http://git.openembedded.org/openembedded-core/commit/?id=3D5a2b67b8faad3dd5=
417ba89d8e82ca564753ccc9
because I have this in very similar images (same image just different
MACHINE) and I had this even before this patch (in build with all
circular dependencies broken by RRECOMMENDS).

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--g4MvFqI7wmANiPDo
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk7zVo4ACgkQN1Ujt2V2gBwcqgCfYrBYRXPOJqWNJsiVADS5iI9a
fD4AnRCCncxdYw92hFktG52h2uLpCorI
=smwV
-----END PGP SIGNATURE-----

--g4MvFqI7wmANiPDo--
