Return-Path: <peter.kjellerstedt@axis.com>
Received: from bes.se.axis.com (bes.se.axis.com [195.60.68.10])
	by mail.openembedded.org (Postfix) with ESMTP id 4C83470030
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jun 2016 14:49:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bes.se.axis.com (Postfix) with ESMTP id 09FD12E2D9;
	Fri, 17 Jun 2016 16:49:26 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bes.se.axis.com
Received: from bes.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bes.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id XfwyypfxBbtK; Fri, 17 Jun 2016 16:49:24 +0200 (CEST)
Received: from boulder.se.axis.com (boulder.se.axis.com [10.0.2.104])
	by bes.se.axis.com (Postfix) with ESMTP id 63C8D2E2D8;
	Fri, 17 Jun 2016 16:49:24 +0200 (CEST)
Received: from boulder.se.axis.com (localhost [127.0.0.1])
	by postfix.imss71 (Postfix) with ESMTP id 469A81BB0;
	Fri, 17 Jun 2016 16:49:24 +0200 (CEST)
Received: from thoth.se.axis.com (thoth.se.axis.com [10.0.2.173])
	by boulder.se.axis.com (Postfix) with ESMTP id 3BD3E19F8;
	Fri, 17 Jun 2016 16:49:24 +0200 (CEST)
Received: from XBOX02.axis.com (xbox02.axis.com [10.0.5.16])
	by thoth.se.axis.com (Postfix) with ESMTP id 381061065;
	Fri, 17 Jun 2016 16:49:24 +0200 (CEST)
Received: from xbox12.axis.com (10.0.5.26) by XBOX02.axis.com (10.0.5.16) with
	Microsoft SMTP Server (TLS) id 15.0.1156.6;
	Fri, 17 Jun 2016 16:49:24 +0200
Received: from XBOX02.axis.com (10.0.5.16) by xbox12.axis.com (10.0.5.26) with
	Microsoft SMTP Server (TLS) id 15.0.1156.6;
	Fri, 17 Jun 2016 16:49:23 +0200
Received: from XBOX02.axis.com ([fe80::d00f:cb52:1b56:20d]) by XBOX02.axis.com
	([fe80::d00f:cb52:1b56:20d%21]) with mapi id 15.00.1156.000;
	Fri, 17 Jun 2016 16:49:24 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Mark Hatle <mark.hatle@windriver.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 1/4] documentation.conf: Add information about
	USERADD varaibles
Thread-Index: AQHRyJ/gDsIa4sayfE23Qi2wAQotj5/tvX0g
Date: Fri, 17 Jun 2016 14:49:23 +0000
Message-ID: <7796231204bf406aaeaac2b0e6ea5c17@XBOX02.axis.com>
References: <cover.1466170741.git.pkj@axis.com>
	<37d008cb22d350306d7d41e66f97e9106fb0c2a0.1466170741.git.pkj@axis.com>
	<81df273b-5287-b262-fcf2-d8d39b9d343d@windriver.com>
In-Reply-To: <81df273b-5287-b262-fcf2-d8d39b9d343d@windriver.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.107]
MIME-Version: 1.0
Subject: Re: [PATCH 1/4] documentation.conf: Add information about USERADD varaibles
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
X-List-Received-Date: Fri, 17 Jun 2016 14:49:26 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
> Mark Hatle
> Sent: den 17 juni 2016 15:55
> To: openembedded-core@lists.openembedded.org
> Subject: Re: [OE-core] [PATCH 1/4] documentation.conf: Add information
> about USERADD varaibles
>=20
> On 6/17/16 8:41 AM, Peter Kjellerstedt wrote:
> > Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> > ---
> >  meta/conf/documentation.conf | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/meta/conf/documentation.conf
> b/meta/conf/documentation.conf
> > index c0025f5..38639d5 100644
> > --- a/meta/conf/documentation.conf
> > +++ b/meta/conf/documentation.conf
> > @@ -452,8 +452,12 @@ UBOOT_SUFFIX[doc] =3D "Points to the generated U-
> Boot extension."
> >  UBOOT_TARGET[doc] =3D "Specifies the target used for building U-Boot."
> >  USE_DEVFS[doc] =3D "When building images, specifies to populate or not
> /dev. This variable defaults to '1' (leave directory empty, surely
> because devtmpfs do the job). Set it to '0' to use makedevs (or
> consider using a custom file with IMAGE_DEVICE_TABLES)."
> >  USER_CLASSES[doc] =3D "List of additional classes to use when building
> images that enable extra features."
> > +USERADD_ERROR_DYNAMIC[doc] =3D "Forces the OpenEmbedded build system
> to produce an error if the user identification (uid) and group
> identification (gid) values are not defined in files/passwd and
> files/group files."
>=20
> I think the description is incorrect.  Specifically:
>=20
> ...values are not defined in files/passwd and files/group files.
>=20
> should be
>=20
> ...values are not defined in the USERADD_UID_TABLES and
> USERADD_GID_TABLES.
>=20
> > +USERADD_GID_TABLES[doc] =3D "Specifies a password file to use for
> obtaining static group identification (gid) values when the
> OpenEmbedded build system adds a group to the system during package
> installation."
> >  USERADD_PACKAGES[doc] =3D "When a recipe inherits the useradd class,
> this variable specifies the individual packages within the recipe that
> require users and/or groups to be added."
> >  USERADD_PARAM[doc] =3D "When a recipe inherits the useradd class, this
> variable specifies for a package what parameters should be passed to
> the useradd command if you wish to add a user to the system when the
> package is installed."
> > +USERADD_UID_TABLES[doc] =3D "Specifies a password file to use for
> obtaining static user identification (uid) values when the OpenEmbedded
> build system adds a user to the system during package installation."
> > +USERADDEXTENSION[doc] =3D "When set to 'useradd-staticids', causes the
> OpenEmbedded build system to base all user and group additions on a
> static passwd and group files found in BBPATH."
>=20
> again, here I think we need to clarify "static passwd and group" to
> refer to the
> USERADD_UID_TABLES and USERADD_GID_TABLES or someone might not
> understand that
> is what is needed.
>=20
> >
> >  #W
> >
> >


Ok, I will send an updated set of changes.

//Peter


