Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>)
	id 1RtFlR-00030I-HJ; Fri, 03 Feb 2012 10:49:05 +0100
Received: by eekd41 with SMTP id d41so904336eek.6
	for <multiple recipients>; Fri, 03 Feb 2012 01:41:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=6K/L/+Bl/k+tE0vbyZSYhCwo2+qDu4eimHB8nxF1lPI=;
	b=wtLZolzAAIi9BrB23g0oh1O76S8C4UE7rBmnEFDCgMxmeXbTmK2wJiMvVGaAOPyZpD
	7KtovUEC9arZQd61rpDewBUWTbuNDOdAeFO1DBDigHjuSncHTOYUQZdeIRQ1JfD6Fxan
	vSsBlATw8v3TI60ORJmrPrhal6dKVGYkHWS5M=
Received: by 10.14.136.139 with SMTP id w11mr1494202eei.1.1328262068146;
	Fri, 03 Feb 2012 01:41:08 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id n56sm19919251eeh.6.2012.02.03.01.41.06
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 03 Feb 2012 01:41:07 -0800 (PST)
Date: Fri, 3 Feb 2012 10:41:05 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120203094104.GE3893@jama.jama.net>
References: <1324624336-18713-1-git-send-email-eric@eukrea.com>
	<20120104051849.GG31275@sakrah.homelinux.org>
	<20120104090523.066ae2d7@eb-e6520>
	<CA+chaQe-XFR6XVAoept8+d8kqoZ1y2qBoVXgetEPpD2n50nYBA@mail.gmail.com>
	<20120202084000.GD3697@jama.jama.net>
	<20120202091726.GG3697@jama.jama.net>
	<20120202111127.0b9d886a@eb-e6520>
	<20120203072808.GB3893@jama.jama.net>
MIME-Version: 1.0
In-Reply-To: <20120203072808.GB3893@jama.jama.net>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: SDK confusion Was: [oe] [meta-oe] gdb-cross-canadian: build gdb with python support
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
X-List-Received-Date: Fri, 03 Feb 2012 09:49:05 -0000
X-Groupsio-MsgNum: 16978
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="jKBxcB1XkHIR0Eqt"
Content-Disposition: inline

--jKBxcB1XkHIR0Eqt
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 03, 2012 at 08:28:08AM +0100, Martin Jansa wrote:
> On Thu, Feb 02, 2012 at 11:11:27AM +0100, Eric B=E9nard wrote:
> > Hi Martin,
> >=20
> > Le Thu, 2 Feb 2012 10:17:26 +0100,
> > Martin Jansa <martin.jansa@gmail.com> a =E9crit :
> > > OE @ ~ $ ls /OE/shr-core/tmp/sysroots/x86_64-oesdk-linux-nativesdk/us=
r/local/
> > > oecore-x86_64-arm
> > > OE @ ~ $ ls /OE/shr-core/tmp/sysroots/x86_64-nativesdk-oesdk-linux/us=
r/local/
> > > oecore-x86_64-x86_64
> > >=20
> > using Angstrom I don't have the same directories here :
> > [ebenard@eb-e6520 setup-scripts]$ ls
> > build/tmp-angstrom_2010_x-eglibc/sysroots/x86_64-nativesdk-angstromsdk-=
linux/usr/local/
> > angstrom-eglibc-x86_64-armv5te
>=20
> I usually don't build SDKs, so I'm not really not familiar with
> oesdk-linux-nativesdk and nativesdk-oesdk-linux differences :/
>=20
> But I'll try your patch for oe-core
> http://patchwork.openembedded.org/patch/17129/
> with oe-core only (and distroless) and if it behaves the same I'll
> report on oe-core ML.

It fails the same when building from scratch for qemuarm in distroless
oe-core:

bitbake -k gdb-cross-canadian-arm
=2E..
| checking whether to use python... /OE/oe-core/tmp-eglibc/work/x86_64-nati=
vesdk-oesdk-linux/gdb-cross-canadian-arm-7.3.1-r5.1/python
| checking for python2.7... no
| configure: error: no usable python found at /OE/oe-core/tmp-eglibc/work/x=
86_64-nativesdk-oesdk-linux/gdb-cross-canadian-arm-7.3.1-r5.1/python
=2E..

=66rom config.log
configure:10465: checking whether to use python
configure:10467: result: /OE/oe-core/tmp-eglibc/work/x86_64-nativesdk-oesdk=
-linux/gdb-cross-canadian-arm-7.3.1-r5.1/python
configure:10685: checking for python2.7
configure:10703: x86_64-oesdk-linux-gcc  --sysroot=3D/OE/oe-core/tmp-eglibc=
/sysroots/x86_64-nativesdk-oesdk-linux -o conftest -isystem/OE/oe-core/tmp-=
eglibc/sysroots/x86_64-oesdk-linux-nativesdk/usr/local/oecore-x86_64-arm/sy=
sroots/x86_64-oesdk-linux/usr/include -O2 -pipe -isystem/OE/oe-core/tmp-egl=
ibc/sysroots/x86_64-oesdk-linux-nativesdk/usr/local/oecore-x86_64-arm/sysro=
ots/x86_64-oesdk-linux/usr/include  -I/OE/oe-core/tmp-eglibc/sysroots/x86_6=
4-nativesdk-oesdk-linux/usr/local/oecore-x86_64-arm/sysroots/x86_64-oesdk-l=
inux/usr/include/python2.7/  -L/OE/oe-core/tmp-eglibc/sysroots/x86_64-oesdk=
-linux-nativesdk/usr/local/oecore-x86_64-arm/sysroots/x86_64-oesdk-linux/us=
r/lib/armv5te-oe-linux-gnueabi -Wl,-rpath-link,/OE/oe-core/tmp-eglibc/sysro=
ots/x86_64-oesdk-linux-nativesdk/usr/local/oecore-x86_64-arm/sysroots/x86_6=
4-oesdk-linux/usr/lib/armv5te-oe-linux-gnueabi -Wl,-rpath,/usr/local/oecore=
-x86_64-arm/sysroots/x86_64-oesdk-linux/usr/lib/armv5te-oe-linux-gnueabi -W=
l,-O1 -L/OE/oe-core/tmp-eglibc/sysroots/x86_64-oesdk-linux-nativesdk/usr/lo=
cal/oecore-x86_64-arm/sysroots/x86_64-oesdk-linux/lib -Wl,-rpath-link,/OE/o=
e-core/tmp-eglibc/sysroots/x86_64-oesdk-linux-nativesdk/usr/local/oecore-x8=
6_64-arm/sysroots/x86_64-oesdk-linux/lib -Wl,-rpath,/usr/local/oecore-x86_6=
4-arm/sysroots/x86_64-oesdk-linux/lib -Wl,-O1 conftest.c -lncurses -lz -lm =
   -L/OE/oe-core/tmp-eglibc/sysroots/x86_64-nativesdk-oesdk-linux/usr/local=
/oecore-x86_64-arm/sysroots/x86_64-oesdk-linux/usr/lib/armv5te-oe-linux-gnu=
eabi/python2.7/config/config -lpthread -ldl -lutil -lm -lpython2.7 >&5
conftest.c:91:20: fatal error: Python.h: No such file or directory

OE @ ~/oe-core/tmp-eglibc $ find sysroots/ -name python2.7
sysroots/x86_64-linux/usr/bin/python2.7
sysroots/x86_64-linux/usr/lib/python2.7
sysroots/x86_64-linux/usr/include/python2.7
sysroots/qemuarm/usr/lib/python2.7
sysroots/x86_64-nativesdk-oesdk-linux/usr/local/oecore-x86_64-x86_64/sysroo=
ts/x86_64-oesdk-linux/usr/lib/python2.7
sysroots/x86_64-nativesdk-oesdk-linux/usr/local/oecore-x86_64-x86_64/sysroo=
ts/x86_64-oesdk-linux/usr/include/python2.7

in x86_64-oesdk-linux there are only gcc+binutils crosssdk
binutils-crosssdk-2.22-r2  gcc-crosssdk-4.6.2+svnr181430-r22  gcc-crosssdk-=
initial-4.6.2+svnr181430-r22  gcc-crosssdk-intermediate-4.6.2+svnr181430-r22
the rest is in=20
x86_64-nativesdk-oesdk-linux

gdb-cross-canadian-arm is only package were exec_prefix points to oecore-x8=
6_64-arm
=2E/gdb-cross-canadian-arm-7.3.1-r5.1/temp/run.do_configure.1688
export exec_prefix=3D"/usr/local/oecore-x86_64-arm/sysroots/x86_64-oesdk-li=
nux/usr"

while all nativesdk packages are using oecore-x86_64-x86_64
=2E/python-nativesdk-2.7.2-r0.5/temp/run.do_configure.14043
export exec_prefix=3D"/usr/local/oecore-x86_64-x86_64/sysroots/x86_64-oesdk=
-linux/usr"

So I think that using exec_prefix/libdir is wrong to when cross-canadian-ar=
m is looking=20
for nativesdk headers/libs. Don't know what are correct variables to use...

Cheers,

>=20
> Cheers,
>=20
> >=20
> > > OE @ ~ $ find /OE/shr-core/tmp/sysroots/x86_64-oesdk-linux-nativesdk/=
usr/local/ -name python2.7
> > > OE @ ~ $ find /OE/shr-core/tmp/sysroots/x86_64-nativesdk-oesdk-linux/=
usr/local/ -name python2.7
> > > /OE/shr-core/tmp/sysroots/x86_64-nativesdk-oesdk-linux/usr/local/oeco=
re-x86_64-x86_64/sysroots/x86_64-oesdk-linux/usr/lib/python2.7
> > > /OE/shr-core/tmp/sysroots/x86_64-nativesdk-oesdk-linux/usr/local/oeco=
re-x86_64-x86_64/sysroots/x86_64-oesdk-linux/usr/include/python2.7
> > >=20
> > strange :
> > $ find build/tmp-angstrom_2010_x-eglibc/sysroots/ -name python2.7
> > build/tmp-angstrom_2010_x-eglibc/sysroots/at91sam9m10g45ek/usr/include/=
python2.7
> > build/tmp-angstrom_2010_x-eglibc/sysroots/at91sam9m10g45ek/usr/lib/pyth=
on2.7
> > build/tmp-angstrom_2010_x-eglibc/sysroots/x86_64-nativesdk-angstromsdk-=
linux/usr/local/angstrom-eglibc-x86_64-armv5te/sysroots/x86_64-angstromsdk-=
linux/usr/include/python2.7
> > build/tmp-angstrom_2010_x-eglibc/sysroots/x86_64-nativesdk-angstromsdk-=
linux/usr/local/angstrom-eglibc-x86_64-armv5te/sysroots/x86_64-angstromsdk-=
linux/usr/lib/python2.7
> > build/tmp-angstrom_2010_x-eglibc/sysroots/x86_64-linux/usr/bin/python2.7
> > build/tmp-angstrom_2010_x-eglibc/sysroots/x86_64-linux/usr/include/pyth=
on2.7
> > build/tmp-angstrom_2010_x-eglibc/sysroots/x86_64-linux/usr/lib/python2.7
> >=20
> > Eric
> > --=20
> > http://eukrea.com/en/news/104-2012
> >=20
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>=20
> --=20
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com



--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--jKBxcB1XkHIR0Eqt
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEUEARECAAYFAk8rq7AACgkQN1Ujt2V2gBycIgCeIAPAhRSAsSJu7G5G988EYO/1
NzsAmO5+KOiRWO/ejQSXmRLpSqb8B2s=
=Q8pj
-----END PGP SIGNATURE-----

--jKBxcB1XkHIR0Eqt--
