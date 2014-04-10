Return-Path: <sgh@sgh.dk>
Received: from mx-aarh-3.stofanet.dk (mx-aarh-3.stofanet.dk [212.10.10.13])
	by mail.openembedded.org (Postfix) with ESMTP id 364F160809
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Apr 2014 09:11:17 +0000 (UTC)
Received: from 5634f347.rev.stofanet.dk ([86.52.243.71] helo=asrock)
	by mx-aarh-3.stofanet.dk (envelope-from <sgh@sgh.dk>)
	with esmtp id 1WYB0u-0008S3-30; Thu, 10 Apr 2014 11:11:16 +0200
Received: from koontz.localnet (localhost [127.0.0.1])
	by asrock (Postfix) with ESMTPS id C70597EC32;
	Thu, 10 Apr 2014 11:11:16 +0200 (CEST)
From: =?ISO-8859-1?Q?S=F8ren?= Holm <sgh@sgh.dk>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 10 Apr 2014 11:11:16 +0200
Message-ID: <1996513.YLYJzsKo1C@koontz>
User-Agent: KMail/4.13 rc (Linux/3.13.0-23-lowlatency; KDE/4.12.97; i686; ; )
In-Reply-To: <20140410090722.GQ2132@jama>
References: <1396946890-16295-1-git-send-email-sgh@sgh.dk>
	<20140410090722.GQ2132@jama>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] wvstreams: Set optimization to -O0 to avoid breaking stack protection.
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
X-List-Received-Date: Thu, 10 Apr 2014 09:11:18 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

Ok

I will post it there then.

Torsdag den 10. april 2014 11:07:22 skrev Martin Jansa:
> On Tue, Apr 08, 2014 at 10:48:10AM +0200, S=F8ren Holm wrote:
> > A description of the bug is here :
> > See https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D674006
>=20
> Wrong ML, this belongs to openembedded-devel@lists.openembedded.org
>=20
> > ---
> >=20
> >  meta-oe/recipes-connectivity/wvdial/wvstreams_4.6.1.bb | 2 ++
> >  1 file changed, 2 insertions(+)
> >=20
> > diff --git a/meta-oe/recipes-connectivity/wvdial/wvstreams_4.6.1.bb=

> > b/meta-oe/recipes-connectivity/wvdial/wvstreams_4.6.1.bb index
> > ce2b337..869402b 100644
> > --- a/meta-oe/recipes-connectivity/wvdial/wvstreams_4.6.1.bb
> > +++ b/meta-oe/recipes-connectivity/wvdial/wvstreams_4.6.1.bb
> > @@ -19,6 +19,8 @@ SRC_URI[sha256sum] =3D
> > "8403f5fbf83aa9ac0c6ce15d97fd85607488152aa84e007b7d0621b8eb>=20
> >  inherit autotools pkgconfig
> > =20
> >  PARALLEL_MAKE =3D ""
> >=20
> > +TARGET_CFLAGS_append =3D " -O0"
> > +TARGET_CXXFLAGS_append =3D " -O0"
> >=20
> >  LDFLAGS_append =3D " -Wl,-rpath-link,${CROSS_DIR}/${TARGET_SYS}/li=
b"

--=20
S=F8ren Holm

