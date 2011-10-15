Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RF40v-0002No-3O
	for openembedded-core@lists.openembedded.org;
	Sat, 15 Oct 2011 15:10:57 +0200
Received: by eyd9 with SMTP id 9so1847036eyd.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 15 Oct 2011 06:05:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=/1CRyJob0WL0cp7ViRbA1fvazjQ6zlGKpfeXUjLCv0I=;
	b=rJ4LBxzbtzAKGnvlwNFtCGpz4NmIB7TG1XIbNpocfqCkvrf8hdSpemwL2Xf+mR3WGX
	sNrTiXkvzj82bWKyEjfhq58nGYHtneeGxEo3g+6ulkwFoMSZs2CTU0xiIxfKXSG7woPK
	w3sttWstfRCxubGI7jgHOzlnPOC9hmi8DVDj4=
Received: by 10.223.77.26 with SMTP id e26mr1606059fak.37.1318683908734;
	Sat, 15 Oct 2011 06:05:08 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id a1sm10269025fab.4.2011.10.15.06.05.06
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 15 Oct 2011 06:05:07 -0700 (PDT)
Date: Sat, 15 Oct 2011 15:05:00 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20111015130500.GC12684@jama.jama.net>
References: <cover.1318547063.git.nitin.a.kamble@intel.com>
	<70807dd62c2c498616cc544869bd710b351b7212.1318547063.git.nitin.a.kamble@intel.com>
	<20111014081939.GC3542@jama.jama.net>
MIME-Version: 1.0
In-Reply-To: <20111014081939.GC3542@jama.jama.net>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [review/test 3/5] python, python-native: upgrade from 2.6.6 to 2.7.2
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
X-List-Received-Date: Sat, 15 Oct 2011 13:10:57 -0000
X-Groupsio-MsgNum: 11071
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="1ccMZA6j1vT5UqiK"
Content-Disposition: inline

--1ccMZA6j1vT5UqiK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 14, 2011 at 10:19:39AM +0200, Martin Jansa wrote:
> On Thu, Oct 13, 2011 at 04:06:13PM -0700, nitin.a.kamble@intel.com wrote:
> > From: Nitin A Kamble <nitin.a.kamble@intel.com>
> >=20
>=20
> This patch does not apply after
> 9f9612d15acc6ee3b71f52bdb3f1ec4cb56b1a17
>=20
> can you rebase on top of oe-core?
>=20
> Also please drop
> DEFAULT_PREFERENCE =3D "-27"
>=20
> we have only one python version so I guess it's not usefull at all
> anymore
>=20
> I'll apply it manually, test it here.. and report if those modules are
> build later..

I've tried also to build it for qemux86-64 (my host is x86-64 too) and
it fails to build a bit sooner before building modules:

| x86_64-oe-linux-ar rc libpython2.7.a Modules/config.o Modules/getpath.o M=
odules/main.o Modules/gcmodule.o
| x86_64-oe-linux-ar rc libpython2.7.a Modules/threadmodule.o  Modules/sign=
almodule.o  Modules/posixmodule.o  Modules/errnomodule.o  Modules/pwdmodule=
=2Eo  Modules/_sre.o  Modules/_codecsmodule.o  Modules/_weakref.o  Modules/=
zipimport.o  Modules/symtablemodule.o  Modules/xxsubtype.o
| x86_64-oe-linux-ranlib libpython2.7.a
| x86_64-oe-linux-gcc    -m64 --sysroot=3D/OE/shr-core/tmp/sysroots/qemux86=
-64 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -Xlinker -export-dynamic=
 -o python \
|                       Modules/python.o \
|                       -L. -lpython2.7 -lpthread -ldl  -lpthread -lutil   =
-lm
| /OE/shr-core/tmp/sysroots/x86_64-linux/usr/bin/python: /lib64/libc.so.6: =
version `GLIBC_2.14' not found (required by /OE/shr-core/tmp/work/x86_64-oe=
-linux/python-2.7.2-r0.0/Python-2.7.2/libpython2.7.so.1.0)
| make: *** [sharedmods] Error 1
| + die 'oe_runmake failed'
| + bbfatal 'oe_runmake failed'
| + echo 'ERROR: oe_runmake failed'
| ERROR: oe_runmake failed
| + exit 1
NOTE: package python-2.7.2-r0.0: task do_compile: Failed
ERROR: Task 230 (/OE/shr-core/openembedded-core/meta/recipes-devtools/pytho=
n/python_2.7.2.bb, do_compile) failed with exit code '1'
ERROR: '/OE/shr-core/openembedded-core/meta/recipes-devtools/python/python_=
2.7.2.bb' failed

and
OE qemux86-64@shr ~/shr-core $ find /OE/shr-core/tmp/sysroots/qemux86-64 -n=
ame libc.so.6
/OE/shr-core/tmp/sysroots/qemux86-64/lib/libc.so.6
/OE/shr-core/tmp/sysroots/qemux86-64/usr/include/eglibc-locale-internal-x86=
_64-oe-linux/lib/libc.so.6

I have not special MULTILIB settings.. just used MACHINE=3Dqemux86-64 as it=
 is and build from scratch

Regards,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--1ccMZA6j1vT5UqiK
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk6ZhPwACgkQN1Ujt2V2gBzhnQCfeYSCVIQyE5X5fId/wP9D9q7v
RY0An3beDqynNXm2PwLuq00z1HyntOfP
=ZVID
-----END PGP SIGNATURE-----

--1ccMZA6j1vT5UqiK--
