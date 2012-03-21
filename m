Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SARfV-0008FL-TW
	for openembedded-core@lists.openembedded.org;
	Wed, 21 Mar 2012 20:58:02 +0100
Received: by wgbdr12 with SMTP id dr12so779281wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Mar 2012 12:49:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=Tqm8mza+rrdiDlrOgMF6wmnSOggbaeYk9tTeZOEpwFo=;
	b=SKoo4BxfB8rGPZlfMEGlph02xIlsJAM0QEp2fLeX3Nz8GA8DRXtQRB281GdokbY74l
	0vgNFGpcYaHdTl3hzcwLsh+kde4mrkh94q0+LXXjteDMak0wvxFyG4NPRZM85chIyS6Y
	5FSaVp1wVDm2BmJKo1MWnB/1zlVASCOvOs++O49Rj70+aTGpHGkYF5ZFDUvtsgpFCaxO
	M1MD74JHT8rxQfJFWHLrIjGgewyqWSfWrFRw3ahfZ86ZnCuNah/InnTL9NzuJwWFmSwi
	V5ABsR77nW6dHkjlBh6+yv+RJZeB9ku71I/ybcHXOS+7Hc9OvRRsH4IQDIrX+RG7teLW
	nnXw==
Received: by 10.180.95.74 with SMTP id di10mr54255701wib.1.1332359347784;
	Wed, 21 Mar 2012 12:49:07 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id j3sm11329265wiw.1.2012.03.21.12.49.06
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 21 Mar 2012 12:49:07 -0700 (PDT)
Date: Wed, 21 Mar 2012 20:49:06 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Eric =?iso-8859-1?Q?B=E9nard?= <eric@eukrea.com>
Message-ID: <20120321194906.GC3659@jama.jama.net>
References: <cover.1332347414.git.nitin.a.kamble@intel.com>
	<bfe0a5400cad2436b7be7d35a173c62349e47c0a.1332347414.git.nitin.a.kamble@intel.com>
	<20120321180748.7cc58e67@eb-e6520>
	<ADD6A3980E8C39419A432FF422031B4C0137B3C3@ORSMSX106.amr.corp.intel.com>
	<20120321185216.440a6353@eb-e6520>
	<ADD6A3980E8C39419A432FF422031B4C0137B3E3@ORSMSX106.amr.corp.intel.com>
	<20120321190208.25dc0387@eb-e6520>
	<ADD6A3980E8C39419A432FF422031B4C0137B406@ORSMSX106.amr.corp.intel.com>
	<20120321203249.54411613@eb-e6520>
MIME-Version: 1.0
In-Reply-To: <20120321203249.54411613@eb-e6520>
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
X-List-Received-Date: Wed, 21 Mar 2012 19:58:02 -0000
X-Groupsio-MsgNum: 19321
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="vni90+aGYgRvsTuO"
Content-Disposition: inline

--vni90+aGYgRvsTuO
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 21, 2012 at 08:32:49PM +0100, Eric B=E9nard wrote:
> Hi Nitin,
>=20
> Le Wed, 21 Mar 2012 18:07:50 +0000,
> "Kamble, Nitin A" <nitin.a.kamble@intel.com> a =E9crit :
> > > From: Eric B=E9nard [mailto:eric@eukrea.com]
> > > I'm launching a build and will keep you informed of the result. If th=
at
> > > only fails for x86 or x86_64 targets, we can use overrides to disable
> > > python support only for these targets.
> > >=20
> > > Eric
> >=20
> > I also starting test for sdk gdb for qemuarm target. Will keep you post=
ed. Any solution that gives a working sdk gdb for all arches will be good.
> >=20
> that works fine here at least for target qemux86 :
> [ebenard@eb-e6520 ~]$ cat /etc/fedora-release=20
> Fedora release 16 (Verne)
>=20
> [ebenard@eb-e6520 ~]$ uname -a
> Linux eb-e6520 3.2.9-2.fc16.x86_64 #1 SMP Mon Mar 5 20:55:39 UTC 2012
> x86_64 x86_64 x86_64 GNU/Linux
>=20
> [ebenard@eb-e6520 ~]$
> source /usr/local/oecore-x86_64/environment-setup-i586-oe-linux=20
>=20
> [ebenard@eb-e6520 ~]$ which i586-oe-linux-gdb
> /usr/local/oecore-x86_64/sysroots/x86_64-oesdk-linux/usr/bin/i586-oe-linu=
x/i586-oe-linux-gdb
>=20
> [ebenard@eb-e6520 ~]$ i586-oe-linux-gdb
> GNU gdb (GDB) 7.4
> Copyright (C) 2012 Free Software Foundation, Inc.
> License GPLv3+: GNU GPL version 3 or later
> <http://gnu.org/licenses/gpl.html> This is free software: you are free
> to change and redistribute it. There is NO WARRANTY, to the extent
> permitted by law.  Type "show copying" and "show warranty" for details.
> This GDB was configured as "--host=3Dx86_64-oesdk-linux
> --target=3Di586-oe-linux". For bug reporting instructions, please see:
> <http://www.gnu.org/software/gdb/bugs/>.
> (gdb) python import sys
> (gdb) python sys.stdout.write("hello, world\n")
> hello, world
> (gdb)=20

Just retested with qemux86-64 and distroless oe-core and also works

OE @ /usr/local/oecore-i686 $ x86_64-oe-linux-gdb=20
GNU gdb (GDB) 7.4
Copyright (C) 2012 Free Software Foundation, Inc.
License GPLv3+: GNU GPL version 3 or later
<http://gnu.org/licenses/gpl.html>
This is free software: you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.  Type "show
copying"
and "show warranty" for details.
This GDB was configured as "--host=3Di686-oesdk-linux
--target=3Dx86_64-oe-linux".
For bug reporting instructions, please see:
<http://www.gnu.org/software/gdb/bugs/>.
(gdb) python print 42
42

the same with armv7a (and my normal SHR layers on top of oe-core)

OE @ /usr/local/oecore-i686 $
sysroots/i686-oesdk-linux/usr/bin/armv7a-vfp-neon-oe-linux-gnueabi/arm-oe-l=
inux-gnueabi-gdb
GNU gdb (GDB) 7.4
Copyright (C) 2012 Free Software Foundation, Inc.
License GPLv3+: GNU GPL version 3 or later
<http://gnu.org/licenses/gpl.html>
This is free software: you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.  Type "show
copying"
and "show warranty" for details.
This GDB was configured as "--host=3Di686-oesdk-linux
--target=3Darm-oe-linux-gnueabi".
For bug reporting instructions, please see:
<http://www.gnu.org/software/gdb/bugs/>.
(gdb) python print 42
42

And host system is gentoo..

Nitin: please try with distroless oe-core to see if it's host or poky
issue (poky still has own SDK_* paths..).

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--vni90+aGYgRvsTuO
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk9qMLEACgkQN1Ujt2V2gBwdRwCfQMOvf0g317Kz6Kcm6KZXQxql
4k0AniFr3uD1Lwq0S8Sxq4f8StU/sixn
=Fbta
-----END PGP SIGNATURE-----

--vni90+aGYgRvsTuO--
