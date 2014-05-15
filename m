Return-Path: <martin.jansa@gmail.com>
Received: from mail-lb0-f173.google.com (unknown [209.85.217.173])
	by mail.openembedded.org (Postfix) with ESMTP id 664CC65EE2;
	Thu, 15 May 2014 14:06:53 +0000 (UTC)
Received: by mail-lb0-f173.google.com with SMTP id 10so838098lbg.18
	for <multiple recipients>; Thu, 15 May 2014 07:06:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=fNvSHmWAFXXsuhYMaROaxfbOWBU5dt0SfwCAeKk//XM=;
	b=aGotX5/bN64ZU/Oq86mGaRApOvuYRWo4kZh85E8jwX1dCrDVbGF9JmpdWM+M2SI7fZ
	A9pdfXAksDwdcptkh9GuZDmLQ0DaYoLiMUnMEdYpLyZI+R/Bd/gkTtxcy6TPpMMSLMlV
	CJ4vY/KX38pqa3MebnZTnug/6NRhCfyFVXsMVRg4Q/xWfNfpFC4BZqRcy4ppqZX5xMLq
	dKngHv4JyQgaohBjrxrkZ7MXxCqlX+UzzVlKw8A6qPTJQTIh2IDBjCBn5B9QjoBttlpq
	ekSmBKeq0PwVMesN/T9bWICepx0Q9TFT4LSQoY7tCTqVcZxH84JkTyuuv2TX4mGUQiNp
	vg4A==
X-Received: by 10.152.28.166 with SMTP id c6mr2039243lah.51.1400162814224;
	Thu, 15 May 2014 07:06:54 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id u4sm6215060lal.8.2014.05.15.07.06.52
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 15 May 2014 07:06:52 -0700 (PDT)
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 15 May 2014 16:07:23 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Valentin Popa <valentin.popa@intel.com>
Message-ID: <20140515140723.GF2433@jama>
References: <20140506170105.9D101503BF@opal.openembedded.org>
	<20140515111302.GC2433@jama> <5374C05E.9060305@intel.com>
MIME-Version: 1.0
In-Reply-To: <5374C05E.9060305@intel.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-commits@lists.openembedded.org,
	openembedded-core@lists.openembedded.org
Subject: Re: [oe-commits] Valentin Popa : nettle: add nettle to oe-core
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 15 May 2014 14:06:55 -0000
X-Groupsio-MsgNum: 53248
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="jt0yj30bxbg11sci"
Content-Disposition: inline

--jt0yj30bxbg11sci
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 15, 2014 at 04:25:50PM +0300, Valentin Popa wrote:
> On 05/15/2014 02:13 PM, Martin Jansa wrote:
> > On Tue, May 06, 2014 at 05:01:05PM +0000, git@git.openembedded.org wrot=
e:
> >> Module: openembedded-core.git
> >> Branch: master
> >> Commit: e0e5eaee72e49c01e76d56cd03fbfb3e20febbb0
> >> URL:    http://git.openembedded.org/?p=3Dopenembedded-core.git&a=3Dcom=
mit;h=3De0e5eaee72e49c01e76d56cd03fbfb3e20febbb0
> >>
> >> Author: Valentin Popa <valentin.popa@intel.com>
> >> Date:   Mon Apr 28 17:28:19 2014 +0300
> >>
> >> nettle: add nettle to oe-core
> >>
> >> Newer versions of gnutls depends on nettle.
> > Any idea why it fails in some builds like this:
> >
> > | checking whether ln -s works... yes
> > | checking build system compiler gcc ... no
> > | configure: error: Specified CC_FOR_BUILD doesn't seem to work
> > | Configure failed. The contents of all config.log files follows to aid=
 debugging
> > | ERROR: oe_runconf failed
> > | WARNING: exit code 1 from a shell command.
> >
> > config.log:
> > configure:4412: checking build system compiler gcc
> > configure:4425: gcc  conftest.c
> > conftest.c: In function 'main':
> > conftest.c:4:3: warning: incompatible implicit declaration of built-in =
function 'exit' [enabled by default]
> >     exit(0);
> >     ^
> > configure:4428: $? =3D 0
> > /OE//nettle/2.7.1-r0/nettle-2.7.1/configure: line 4430: ./a.out: cannot=
 execute binary file
> > /OE//nettle/2.7.1-r0/nettle-2.7.1/configure: line 4430: ./b.out: No suc=
h file or directory
> > /OE//nettle/2.7.1-r0/nettle-2.7.1/configure: line 4430: ./a.exe: No suc=
h file or directory
> > /OE//nettle/2.7.1-r0/nettle-2.7.1/configure: line 4430: ./a_out.exe: No=
 such file or directory
> > /OE//nettle/2.7.1-r0/nettle-2.7.1/configure: line 4430: ./conftest: No =
such file or directory
> > configure:4435: result: no
> > configure:4440: error: Specified CC_FOR_BUILD doesn't seem to work
> >
> > export CC_FOR_BUILD=3D"gcc "
> >
>=20
> I suspect the crosscompiler; for what arch&machine does this fail?

cortexa8 and it's the only recipe failing like this (even after
cleansstate) so I don't expect it to be something as simple as
nonworking cross compiler.

> >> Signed-off-by: Valentin Popa <valentin.popa@intel.com>
> >> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> >>
> >> ---
> >>
> >>   meta/recipes-support/nettle/nettle_2.7.1.bb | 24 +++++++++++++++++++=
+++++
> >>   1 file changed, 24 insertions(+)
> >>
> >> diff --git a/meta/recipes-support/nettle/nettle_2.7.1.bb b/meta/recipe=
s-support/nettle/nettle_2.7.1.bb
> >> new file mode 100644
> >> index 0000000..87f1639
> >> --- /dev/null
> >> +++ b/meta/recipes-support/nettle/nettle_2.7.1.bb
> >> @@ -0,0 +1,24 @@
> >> +SUMMARY =3D "A low level cryptographic library"
> >> +HOMEPAGE =3D "http://www.lysator.liu.se/~nisse/nettle/"
> >> +SECTION =3D "libs"
> >> +LICENSE =3D "LGPLv2.1 & GPLv2"
> >> +LIC_FILES_CHKSUM =3D "file://COPYING.LIB;md5=3D2d5025d4aa3495befef8f1=
7206a5b0a1 \
> >> +                    file://serpent-decrypt.c;beginline=3D53;endline=
=3D67;md5=3Dbcfd4745d53ca57f82907089898e390d \
> >> +                    file://serpent-set-key.c;beginline=3D56;endline=
=3D70;md5=3Dbcfd4745d53ca57f82907089898e390d"
> >> +
> >> +DEPENDS +=3D "gmp"
> >> +
> >> +SRC_URI =3D "http://www.lysator.liu.se/~nisse/archive/${BP}.tar.gz"
> >> +
> >> +SRC_URI[md5sum] =3D "003d5147911317931dd453520eb234a5"
> >> +SRC_URI[sha256sum] =3D "bc71ebd43435537d767799e414fce88e521b7278d48c8=
60651216e1fc6555b40"
> >> +
> >> +do_configure_prepend() {
> >> +       if [ ! -e ${S}/acinclude.m4 -a -e ${S}/aclocal.m4 ]; then
> >> +               cp ${S}/aclocal.m4 ${S}/acinclude.m4
> >> +       fi
> >> +}
> >> +
> >> +inherit autotools
> >> +
> >> +BBCLASSEXTEND =3D "native"
> >>
> >> --=20
> >> _______________________________________________
> >> Openembedded-commits mailing list
> >> Openembedded-commits@lists.openembedded.org
> >> http://lists.openembedded.org/mailman/listinfo/openembedded-commits
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--jt0yj30bxbg11sci
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlN0yhsACgkQN1Ujt2V2gBwCYwCePgovKu1WCquoDY3wr37NGvNg
Ug8An3hZ7BLcv5eS8m30KrHSEsUUABmQ
=tk2F
-----END PGP SIGNATURE-----

--jt0yj30bxbg11sci--
