Received: from mail-wg0-f41.google.com ([74.125.82.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SAdos-0005iS-6r
	for openembedded-core@lists.openembedded.org;
	Thu, 22 Mar 2012 09:56:30 +0100
Received: by wgbds1 with SMTP id ds1so207900wgb.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Mar 2012 01:47:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=dvXVTXyoXkVtfDhwg8BQhhwCRw7TDoYG6SZVdsh+HMc=;
	b=ew7RufZbKlKJZfw11NGrnbc9bDb8PNKawIUlzKqfu0j1YlcmFgAHZ67iJMTj6UuGFg
	2i76yV5YkUn4GHl6M8c4rUvSah+6HZV48h8kAyX0Z8eu7KnlS/8qCzIXHpmwtc/L/OPA
	6Zct+4Wie/qyLeTgyWWnFw6NyX325T8MyIBiXqJgn0kge67ugnnplTBFEzeX8HyyToas
	hI3/pfMI6Gly2HQQWrwXsEHkvjauW9yclL4lqk3g4X+NBpFh3GDKP0mEu86wVksOm9DI
	l23LywxiUuXtoZGHYunXIgEue/zDrum61bCBl6bF/6VfqUwkvsxm4nGssTDMUP1bn1Dn
	ZVKw==
Received: by 10.180.89.9 with SMTP id bk9mr3104639wib.11.1332406055433;
	Thu, 22 Mar 2012 01:47:35 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id gp8sm3597783wib.5.2012.03.22.01.47.32
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 22 Mar 2012 01:47:33 -0700 (PDT)
Date: Thu, 22 Mar 2012 09:47:33 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Eric =?iso-8859-1?Q?B=E9nard?= <eric@eukrea.com>
Message-ID: <20120322084732.GD4010@jama.jama.net>
References: <20120321190208.25dc0387@eb-e6520>
	<ADD6A3980E8C39419A432FF422031B4C0137B406@ORSMSX106.amr.corp.intel.com>
	<20120321203249.54411613@eb-e6520>
	<20120321194906.GC3659@jama.jama.net>
	<ADD6A3980E8C39419A432FF422031B4C0137B557@ORSMSX106.amr.corp.intel.com>
	<20120321220253.00c4f254@eb-e6520>
	<ADD6A3980E8C39419A432FF422031B4C0137B5A8@ORSMSX106.amr.corp.intel.com>
	<20120321223521.36e49bba@eb-e6520>
	<ADD6A3980E8C39419A432FF422031B4C0137B66D@ORSMSX106.amr.corp.intel.com>
	<20120321230514.1c170480@eb-e6520>
MIME-Version: 1.0
In-Reply-To: <20120321230514.1c170480@eb-e6520>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] Revert "gdb-cross-canadian: build gdb with python support"
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
X-List-Received-Date: Thu, 22 Mar 2012 08:56:30 -0000
X-Groupsio-MsgNum: 19392
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="GyRA7555PLgSTuth"
Content-Disposition: inline

--GyRA7555PLgSTuth
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 21, 2012 at 11:05:14PM +0100, Eric B=E9nard wrote:
> Le Wed, 21 Mar 2012 21:53:10 +0000,
> "Kamble, Nitin A" <nitin.a.kamble@intel.com> a =E9crit :
> >  If it is working for you, I don't understand why is it not working her=
e.=20
> >=20
> it's not working _only_ for me, Martin also had success.

Tested again this time with SDKMACHINE ?=3D "x86-64"

and notice that for me it uses libz libpython2.7 from sdk.

OE @ /usr/local/oecore-x86_64 $ x86_64-oe-linux-gdb
GNU gdb (GDB) 7.4
Copyright (C) 2012 Free Software Foundation, Inc.
License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.htm=
l>
This is free software: you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.  Type "show copying"
and "show warranty" for details.
This GDB was configured as "--host=3Dx86_64-oesdk-linux --target=3Dx86_64-o=
e-linux".
For bug reporting instructions, please see:
<http://www.gnu.org/software/gdb/bugs/>.
(gdb) python print 42
42
(gdb) quit
OE @ /usr/local/oecore-x86_64 $ which x86_64-oe-linux-gdb
/usr/local/oecore-x86_64/sysroots/x86_64-oesdk-linux/usr/bin/x86_64-oe-linu=
x/x86_64-oe-linux-gdb
OE @ /usr/local/oecore-x86_64 $ ldd /usr/local/oecore-x86_64/sysroots/x86_6=
4-oesdk-linux/usr/bin/x86_64-oe-linux/x86_64-oe-linux-gdb
        linux-vdso.so.1 (0x00007ffffdfff000)
        libreadline.so.6 =3D> /usr/local/oecore-x86_64/sysroots/x86_64-oesd=
k-linux/usr/lib/libreadline.so.6 (0x00007fd92e32e000)
        libdl.so.2 =3D> /usr/local/oecore-x86_64/sysroots/x86_64-oesdk-linu=
x/lib/libdl.so.2 (0x00007fd92e12a000)
        libncurses.so.5 =3D> /usr/local/oecore-x86_64/sysroots/x86_64-oesdk=
-linux/lib/libncurses.so.5 (0x00007fd92df07000)
        libtinfo.so.5 =3D> /usr/local/oecore-x86_64/sysroots/x86_64-oesdk-l=
inux/lib/libtinfo.so.5 (0x00007fd92dce0000)
        libz.so.1 =3D> /usr/local/oecore-x86_64/sysroots/x86_64-oesdk-linux=
/usr/lib/libz.so.1 (0x00007fd92dacb000)
        libm.so.6 =3D> /usr/local/oecore-x86_64/sysroots/x86_64-oesdk-linux=
/lib/libm.so.6 (0x00007fd92d7d7000)
        libpthread.so.0 =3D> /usr/local/oecore-x86_64/sysroots/x86_64-oesdk=
-linux/lib/libpthread.so.0 (0x00007fd92d5ba000)
        libutil.so.1 =3D> /usr/local/oecore-x86_64/sysroots/x86_64-oesdk-li=
nux/lib/libutil.so.1 (0x00007fd92d3b7000)
        libpython2.7.so.1.0 =3D> /usr/local/oecore-x86_64/sysroots/x86_64-o=
esdk-linux/usr/lib/libpython2.7.so.1.0 (0x00007fd92cfe8000)
        libexpat.so.1 =3D> /usr/local/oecore-x86_64/sysroots/x86_64-oesdk-l=
inux/usr/lib/libexpat.so.1 (0x00007fd92cdbf000)
        libc.so.6 =3D> /usr/local/oecore-x86_64/sysroots/x86_64-oesdk-linux=
/lib/libc.so.6 (0x00007fd92ca1a000)
        /usr/local/oecore-x86_64/sysroots/x86_64-oesdk-linux/lib/ld-linux-x=
86-64.so.2 (0x00007fd92e56e000)


>=20
> > [nitin@nbuild0 oecore-x86_64]$ cd /usr/local/oecore-x86_64/
> > [nitin@nbuild0 oecore-x86_64]$ ls
> > environment-setup-x86_64-oe-linux  site-config-x86_64-oe-linux  sysroot=
s  version-x86_64-oe-linux
> > [nitin@nbuild0 oecore-x86_64]$ . environment-setup-x86_64-oe-linux
> > [nitin@nbuild0 oecore-x86_64]$ ./sysroots/x86_64-oesdk-linux/usr/bin/x8=
6_64-oe-linux/x86_64-oe-linux-gdb
> > *** glibc detected *** ./sysroots/x86_64-oesdk-linux/usr/bin/x86_64-oe-=
linux/x86_64-oe-linux-gdb: double free or corruption (out): 0x00007f3226818=
030 ***
> > Aborted (core dumped)
> > [nitin@nbuild0 oecore-x86_64]$ ldd ./sysroots/x86_64-oesdk-linux/usr/bi=
n/x86_64-oe-linux/x86_64-oe-linux-gdb
> >         linux-vdso.so.1 =3D>  (0x00007fffd05d8000)
> >         libreadline.so.6 =3D> /lib64/libreadline.so.6 (0x0000003f074000=
00)
> >         libdl.so.2 =3D> /usr/local/oecore-x86_64/sysroots/x86_64-oesdk-=
linux/lib/libdl.so.2 (0x00007fa207a72000)
> >         libncurses.so.5 =3D> /usr/local/oecore-x86_64/sysroots/x86_64-o=
esdk-linux/lib/libncurses.so.5 (0x00007fa20784f000)
> >         libtinfo.so.5 =3D> /usr/local/oecore-x86_64/sysroots/x86_64-oes=
dk-linux/lib/libtinfo.so.5 (0x00007fa207628000)
> >         libz.so.1 =3D> /lib64/libz.so.1 (0x0000003f06c00000)
> >         libm.so.6 =3D> /usr/local/oecore-x86_64/sysroots/x86_64-oesdk-l=
inux/lib/libm.so.6 (0x00007fa2073a5000)
> >         libpthread.so.0 =3D> /usr/local/oecore-x86_64/sysroots/x86_64-o=
esdk-linux/lib/libpthread.so.0 (0x00007fa207188000)
> >         libutil.so.1 =3D> /usr/local/oecore-x86_64/sysroots/x86_64-oesd=
k-linux/lib/libutil.so.1 (0x00007fa206f84000)
> >         libexpat.so.1 =3D> /lib64/libexpat.so.1 (0x0000003f09800000)
> >         libc.so.6 =3D> /usr/local/oecore-x86_64/sysroots/x86_64-oesdk-l=
inux/lib/libc.so.6 (0x00007fa206bfd000)
> >         /usr/local/oecore-x86_64/sysroots/x86_64-oesdk-linux/lib/ld-lin=
ux-x86-64.so.2 =3D> /lib64/ld-linux-x86-64.so.2 (0x0000003f05000000)
> >=20
> >=20
> > I am seeing that the sdk gdb is dynamically linking with some of the ho=
st libraries as seen above.
> >=20
> ebenard@eb-e6520 x86_64-oe-linux]$ ldd x86_64-oe-linux-gdb
> ./x86_64-oe-linux-gdb: /usr/local/oecore-x86_64/sysroots/x86_64-oesdk-lin=
ux/lib/libc.so.6: version `GLIBC_2.14' not found (required by /lib64/libz.s=
o.1)
> ./x86_64-oe-linux-gdb: /usr/local/oecore-x86_64/sysroots/x86_64-oesdk-lin=
ux/lib/libc.so.6: version `GLIBC_2.14' not found (required by /usr/lib64/li=
bpython2.7.so.1.0)
> 	linux-vdso.so.1 =3D>  (0x00007fff12dff000)
> 	libreadline.so.6 =3D> /lib64/libreadline.so.6 (0x0000003ba3a00000)
> 	libdl.so.2 =3D> /usr/local/oecore-x86_64/sysroots/x86_64-oesdk-linux/lib=
/libdl.so.2 (0x00007fbfa6c67000)
> 	libncurses.so.5 =3D> /usr/local/oecore-x86_64/sysroots/x86_64-oesdk-linu=
x/lib/libncurses.so.5 (0x00007fbfa6a44000)
> 	libtinfo.so.5 =3D> /usr/local/oecore-x86_64/sysroots/x86_64-oesdk-linux/=
lib/libtinfo.so.5 (0x00007fbfa681d000)
> 	libz.so.1 =3D> /lib64/libz.so.1 (0x0000003ba3200000)
> 	libm.so.6 =3D> /usr/local/oecore-x86_64/sysroots/x86_64-oesdk-linux/lib/=
libm.so.6 (0x00007fbfa659a000)
> 	libpthread.so.0 =3D> /usr/local/oecore-x86_64/sysroots/x86_64-oesdk-linu=
x/lib/libpthread.so.0 (0x00007fbfa637d000)
> 	libutil.so.1 =3D> /usr/local/oecore-x86_64/sysroots/x86_64-oesdk-linux/l=
ib/libutil.so.1 (0x00007fbfa6179000)
> 	libpython2.7.so.1.0 =3D> /usr/lib64/libpython2.7.so.1.0 (0x0000003bb3000=
000)
> 	libexpat.so.1 =3D> /lib64/libexpat.so.1 (0x0000003ba7200000)
> 	libc.so.6 =3D> /usr/local/oecore-x86_64/sysroots/x86_64-oesdk-linux/lib/=
libc.so.6 (0x00007fbfa5df1000)
> 	/usr/local/oecore-x86_64/sysroots/x86_64-oesdk-linux/lib/ld-linux-x86-64=
=2Eso.2 =3D> /lib64/ld-linux-x86-64.so.2 (0x0000003ba1600000)
> [ebenard@eb-e6520 x86_64-oe-linux]$ ./x86_64-oe-linux-gdb=20
> GNU gdb (GDB) 7.4
> Copyright (C) 2012 Free Software Foundation, Inc.
> License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.h=
tml>
> This is free software: you are free to change and redistribute it.
> There is NO WARRANTY, to the extent permitted by law.  Type "show
> copying" and "show warranty" for details.
> This GDB was configured as "--host=3Dx86_64-oesdk-linux
> --target=3Dx86_64-oe-linux". For bug reporting instructions, please see:
> <http://www.gnu.org/software/gdb/bugs/>.
> (gdb) quit
> [ebenard@eb-e6520 x86_64-oe-linux]$ cd ../i586-oe-linux/
>=20
> [ebenard@eb-e6520 i586-oe-linux]$ ldd i586-oe-linux-gdb
> ./i586-oe-linux-gdb: /usr/local/oecore-x86_64/sysroots/x86_64-oesdk-linux=
/lib/libc.so.6: version `GLIBC_2.14' not found (required by /lib64/libz.so.=
1)
> ./i586-oe-linux-gdb: /usr/local/oecore-x86_64/sysroots/x86_64-oesdk-linux=
/lib/libc.so.6: version `GLIBC_2.14' not found (required by /usr/lib64/libp=
ython2.7.so.1.0)
> 	linux-vdso.so.1 =3D>  (0x00007fff7c949000)
> 	libreadline.so.6 =3D> /lib64/libreadline.so.6 (0x0000003ba3a00000)
> 	libdl.so.2 =3D> /usr/local/oecore-x86_64/sysroots/x86_64-oesdk-linux/lib=
/libdl.so.2 (0x00007fe6f9c74000)
> 	libncurses.so.5 =3D> /usr/local/oecore-x86_64/sysroots/x86_64-oesdk-linu=
x/lib/libncurses.so.5 (0x00007fe6f9a51000)
> 	libtinfo.so.5 =3D> /usr/local/oecore-x86_64/sysroots/x86_64-oesdk-linux/=
lib/libtinfo.so.5 (0x00007fe6f982a000)
> 	libz.so.1 =3D> /lib64/libz.so.1 (0x0000003ba3200000)
> 	libm.so.6 =3D> /usr/local/oecore-x86_64/sysroots/x86_64-oesdk-linux/lib/=
libm.so.6 (0x00007fe6f95a7000)
> 	libpthread.so.0 =3D> /usr/local/oecore-x86_64/sysroots/x86_64-oesdk-linu=
x/lib/libpthread.so.0 (0x00007fe6f938a000)
> 	libutil.so.1 =3D> /usr/local/oecore-x86_64/sysroots/x86_64-oesdk-linux/l=
ib/libutil.so.1 (0x00007fe6f9186000)
> 	libpython2.7.so.1.0 =3D> /usr/lib64/libpython2.7.so.1.0 (0x0000003bb3000=
000)
> 	libexpat.so.1 =3D> /lib64/libexpat.so.1 (0x0000003ba7200000)
> 	libc.so.6 =3D> /usr/local/oecore-x86_64/sysroots/x86_64-oesdk-linux/lib/=
libc.so.6 (0x00007fe6f8dfe000)
> 	/usr/local/oecore-x86_64/sysroots/x86_64-oesdk-linux/lib/ld-linux-x86-64=
=2Eso.2 =3D> /lib64/ld-linux-x86-64.so.2 (0x0000003ba1600000)
> [ebenard@eb-e6520 i586-oe-linux]$ ./i586-oe-linux-gdb=20
> GNU gdb (GDB) 7.4
> Copyright (C) 2012 Free Software Foundation, Inc.
> License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.h=
tml>
> This is free software: you are free to change and redistribute it.
> There is NO WARRANTY, to the extent permitted by law.  Type "show copying"
> and "show warranty" for details.
> This GDB was configured as "--host=3Dx86_64-oesdk-linux --target=3Di586-o=
e-linux".
> For bug reporting instructions, please see:
> <http://www.gnu.org/software/gdb/bugs/>.
> (gdb) quit
>=20
> --=20
> http://eukrea.com/en/news/104-2012

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--GyRA7555PLgSTuth
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk9q5yQACgkQN1Ujt2V2gBz+fgCggFBh22u1sowgz/oQ6YtVOZt3
La4An3N+64B733FeewAgSjzYGVveVyFI
=79F5
-----END PGP SIGNATURE-----

--GyRA7555PLgSTuth--
