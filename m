Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6C1677459B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Sep 2018 09:17:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 86059184DB;
	Tue, 25 Sep 2018 11:17:19 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id pJrKFczOkVuz; Tue, 25 Sep 2018 11:17:13 +0200 (CEST)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bastet.se.axis.com (Postfix) with ESMTPS id 84B8B18343;
	Tue, 25 Sep 2018 11:17:12 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 74F6F1A067;
	Tue, 25 Sep 2018 11:17:12 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 69C331A066;
	Tue, 25 Sep 2018 11:17:12 +0200 (CEST)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder02.se.axis.com (Postfix) with ESMTP;
	Tue, 25 Sep 2018 11:17:12 +0200 (CEST)
Received: from XBOX03.axis.com (xbox03.axis.com [10.0.5.17])
	by thoth.se.axis.com (Postfix) with ESMTP id 5CFA33051;
	Tue, 25 Sep 2018 11:17:12 +0200 (CEST)
Received: from XBOX02.axis.com (10.0.5.16) by XBOX03.axis.com (10.0.5.17) with
	Microsoft SMTP Server (TLS) id 15.0.1365.1;
	Tue, 25 Sep 2018 11:17:12 +0200
Received: from XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776]) by
	XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776%21]) with mapi id
	15.00.1365.000; Tue, 25 Sep 2018 11:17:12 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 1/3] acl: Make it compatible with externalsrc
Thread-Index: AQHUVDlL2fqHNLeM0kiHgltnZAF9BaUAhT8AgAAxiWA=
Date: Tue, 25 Sep 2018 09:17:12 +0000
Message-ID: <a042a2e4c0464b4d81e4ada72f76fe77@XBOX02.axis.com>
References: <20180924190313.32027-1-pkj@axis.com>
	<7083c560991d491f0e8b8b70eee611c1187b58d0.camel@linuxfoundation.org>
In-Reply-To: <7083c560991d491f0e8b8b70eee611c1187b58d0.camel@linuxfoundation.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Subject: Re: [PATCH 1/3] acl: Make it compatible with externalsrc
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
X-List-Received-Date: Tue, 25 Sep 2018 09:17:20 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org <openembedded-
> core-bounces@lists.openembedded.org> On Behalf Of Richard Purdie
> Sent: den 25 september 2018 10:13
> To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>; openembedded-
> core@lists.openembedded.org
> Subject: Re: [OE-core] [PATCH 1/3] acl: Make it compatible with
> externalsrc
>=20
> On Mon, 2018-09-24 at 21:03 +0200, Peter Kjellerstedt wrote:
> > Make the subdir fetch path for configure.ac relative. This avoids the
> > following error after having done `devtool modify acl`:
> >
> > ERROR: acl-2.2.52-r0 do_unpack: Unpack failure for URL:
> > 'file://configure.ac;subdir=3D.../builds/qemux86-
> > 64/workspace/sources/acl'.
> > subdir argument isn't a subdirectory of unpack root
> > .../builds/qemux86-64/tmp/work/core2-64-poky-linux/acl/2.2.52-r0
> >
> > Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> > ---
> >  meta/recipes-support/attr/acl_2.2.52.bb | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta/recipes-support/attr/acl_2.2.52.bb b/meta/recipes-
> > support/attr/acl_2.2.52.bb
> > index 8f3dc45cf7..8b89de9b42 100644
> > --- a/meta/recipes-support/attr/acl_2.2.52.bb
> > +++ b/meta/recipes-support/attr/acl_2.2.52.bb
> > @@ -11,7 +11,7 @@ LIC_FILES_CHKSUM =3D "file://doc/COPYING;md5=3Dc781d7=
0e
> > d2b4d48995b790403217a249 \
> >  DEPENDS =3D "attr"
> >
> >  SRC_URI =3D "${SAVANNAH_GNU_MIRROR}/acl/${BP}.src.tar.gz \
> > -           file://configure.ac;subdir=3D${S} \
> > +           file://configure.ac;subdir=3D${BP} \
> >             file://run-ptest \
> >             file://acl-fix-the-order-of-expected-output-of-getfacl.patc=
h \
> >             file://test-fix-insufficient-quoting-of.patch \
>=20
> This isn't making sense to me. Doesn't externalsrc set ${S} to the
> external source location?

Yes, it does, but it does not change ${WORKDIR}. So when it tries
to unpack to the absolute path ${S}, which is outside ${WORKDIR}=20
when externalsrc is in use, then the above error occurs. Using a=20
relative path avoids the problem.

> Also, doesn't it remove the do_unpack task?

No, it keeps the task but removes everything except file:// URLs=20
and URLs with type=3Dkmeta from the SRC_URI. This is also why I had=20
to check for externalsrc in the do_unpack task of lsof.

> Cheers,
>=20
> Richard

//Peter


