Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SwAWG-0001NV-Fe
	for openembedded-core@lists.openembedded.org;
	Tue, 31 Jul 2012 13:21:44 +0200
Received: by wgbdr1 with SMTP id dr1so5085600wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Jul 2012 04:10:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=9dtqfdscA2RgjfLDwNpK6hXoK7d6g2uHx6huQ3soCRk=;
	b=eOVkHNSDZaRBtBrV1Xtiu/fCqMRhBxqkolzClLWcUXW8bpv3i5/NcBltSO7txcJrdl
	4gVEjGc8yVPHmyIwE6X5HzAKiQWBXVWdyfAfcHFt8NXr1UURCTVzRnpcLMM8OHXeocON
	fYymt5oMfwcZFadoqB+pMxjWVvyD2dZGJxjh2MFB6ObmuhgSauM9OdZ09SPCzPCylxpL
	i30fsIlv8Nue0AX33sh0BE24ZBuccLTUxp90d7/nBHt3wztESWsDrAw4x5NeYSWMvYvR
	eY6QBKQdrxHBAgluukTo5sztCVQ3A+kfaqGHMjsmyOjazlPWtEzfQjPiAa0KI3hvFmzr
	lL2w==
Received: by 10.180.84.1 with SMTP id u1mr5920332wiy.15.1343733007557;
	Tue, 31 Jul 2012 04:10:07 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id bc2sm31940148wib.0.2012.07.31.04.10.05
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 31 Jul 2012 04:10:06 -0700 (PDT)
Date: Tue, 31 Jul 2012 13:10:02 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120731111002.GR3261@jama.jama.net>
References: <1343697966-29777-1-git-send-email-Martin.Jansa@gmail.com>
	<1343732826.9526.1.camel@ted>
MIME-Version: 1.0
In-Reply-To: <1343732826.9526.1.camel@ted>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [RFC] gdb-cross: add pythonnative
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
X-List-Received-Date: Tue, 31 Jul 2012 11:21:44 -0000
X-Groupsio-MsgNum: 26556
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="SWsnvgFfkTS2ATo5"
Content-Disposition: inline

--SWsnvgFfkTS2ATo5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 31, 2012 at 12:07:06PM +0100, Richard Purdie wrote:
> On Tue, 2012-07-31 at 03:26 +0200, Martin Jansa wrote:
> > * fails like this without:
> > | gcc -isystem/OE/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/include=
 -O2 -pipe   -L/OE/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/lib -L/OE/=
shr-core/tmp-eglibc/sysroo
> > ts/x86_64-linux/lib -Wl,-rpath-link,/OE/shr-core/tmp-eglibc/sysroots/x8=
6_64-linux/usr/lib -Wl,-rpath-link,/OE/shr-core/tmp-eglibc/sysroots/x86_64-=
linux/lib -Wl,-rpath,/OE/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/lib =
-Wl,-rpath,/OE/shr-core/tmp-eglibc/sysroots/x86_64-linux/lib -Wl,-O1   \
> > |       -o gdb gdb.o libgdb.a \
> > |          -lreadline ../opcodes/libopcodes.a ../bfd/libbfd.a  ../libib=
erty/libiberty.a ../libdecnumber/libdecnumber.a    -ldl -lncurses -lz -lm  =
  -lpthread -ldl -lutil -lm -lpython2.7 -Xlinker -export-dynamic /OE/shr-co=
re/tmp-eglibc/sysroots/x86_64-linux/usr/lib/libexpat.so -Wl,-rpath -Wl,/OE/=
shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/lib ../libiberty/libiberty.a =
 gnulib/libgnu.a
> > | libgdb.a(python.o): In function `gdbpy_target_wide_charset':
> > | python.c:(.text+0x1e7): undefined reference to `PyUnicodeUCS4_Decode'
> > | libgdb.a(python.o): In function `gdbpy_target_charset':
> > | python.c:(.text+0x237): undefined reference to `PyUnicodeUCS4_Decode'
> > | libgdb.a(py-cmd.o): In function `cmdpy_completer':
> > | py-cmd.c:(.text+0x97): undefined reference to `PyUnicodeUCS4_Decode'
> > | py-cmd.c:(.text+0xc3): undefined reference to `PyUnicodeUCS4_Decode'
> > | libgdb.a(py-cmd.o): In function `cmdpy_function':
> > | py-cmd.c:(.text+0x39d): undefined reference to `PyUnicodeUCS4_Decode'
> > | libgdb.a(py-frame.o):py-frame.c:(.text+0xa21): more undefined referen=
ces to `PyUnicodeUCS4_Decode' follow
> > | libgdb.a(py-utils.o): In function `unicode_to_encoded_string':
> > | py-utils.c:(.text+0x8): undefined reference to `PyUnicodeUCS4_AsEncod=
edString'
> > | libgdb.a(py-utils.o): In function `python_string_to_unicode':
> > | py-utils.c:(.text+0xc6): undefined reference to `PyUnicodeUCS4_FromEn=
codedObject'
> > | libgdb.a(py-utils.o): In function `unicode_to_target_python_string':
> > | py-utils.c:(.text+0x13a): undefined reference to `PyUnicodeUCS4_AsEnc=
odedString'
> > | libgdb.a(py-utils.o): In function `target_string_to_unicode':
> > | py-utils.c:(.text+0x2a5): undefined reference to `PyUnicodeUCS4_Decod=
e'
> > | libgdb.a(py-value.o): In function `valpy_string':
> > | py-value.c:(.text+0x4ac): undefined reference to `PyUnicodeUCS4_Decod=
e'
> > | libgdb.a(py-value.o): In function `valpy_str':
> > | py-value.c:(.text+0xab4): undefined reference to `PyUnicodeUCS4_Decod=
e'
> > | collect2: error: ld returned 1 exit status
> > | make[2]: *** [gdb] Error 1
> > | make[2]: Leaving directory `/OE/shr-core/tmp-eglibc/work/armv4t-oe-li=
nux-gnueabi/gdb-cross-7.4.1-r1.0/build-arm-oe-linux-gnueabi/gdb'
> > | make[1]: *** [all-gdb] Error 2
> >=20
> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > ---
> >  meta/recipes-devtools/gdb/gdb-cross_7.4.1.bb |    2 ++
> >  1 files changed, 2 insertions(+), 0 deletions(-)
>=20
> Is python enabled for gdb-cross in OE-Core?

Explicitly only in gdb-cross-canadian, so I guess gdb-cross autodetected
it (sorry I don't have config.log anymore).

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--SWsnvgFfkTS2ATo5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlAXvQoACgkQN1Ujt2V2gBydGACfaJiibC3oLQV1gltr4DfOAKtj
Vw0AoKONA78RFgo/KKcP/b/4dAs5Tcu/
=u0Fh
-----END PGP SIGNATURE-----

--SWsnvgFfkTS2ATo5--
