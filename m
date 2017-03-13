Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 403EE77684
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Mar 2017 16:11:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 2EC9F18095;
	Mon, 13 Mar 2017 17:11:17 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id CbKyXJP-i-7c; Mon, 13 Mar 2017 17:11:14 +0100 (CET)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bastet.se.axis.com (Postfix) with ESMTPS id 7020A18446;
	Mon, 13 Mar 2017 17:11:14 +0100 (CET)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 51C121E09F;
	Mon, 13 Mar 2017 17:11:14 +0100 (CET)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4657E1E09E;
	Mon, 13 Mar 2017 17:11:14 +0100 (CET)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder03.se.axis.com (Postfix) with ESMTP;
	Mon, 13 Mar 2017 17:11:14 +0100 (CET)
Received: from XBOX02.axis.com (xbox02.axis.com [10.0.5.16])
	by seth.se.axis.com (Postfix) with ESMTP id 39E3D2E9;
	Mon, 13 Mar 2017 17:11:14 +0100 (CET)
Received: from xbox12.axis.com (10.0.5.26) by XBOX02.axis.com (10.0.5.16) with
	Microsoft SMTP Server (TLS) id 15.0.1210.3;
	Mon, 13 Mar 2017 17:11:14 +0100
Received: from XBOX02.axis.com (10.0.5.16) by xbox12.axis.com (10.0.5.26) with
	Microsoft SMTP Server (TLS) id 15.0.1210.3;
	Mon, 13 Mar 2017 17:11:13 +0100
Received: from XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776]) by
	XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776%21]) with mapi id
	15.00.1210.000; Mon, 13 Mar 2017 17:11:14 +0100
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Mark Hatle <mark.hatle@windriver.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH] useradd-staticids.bbclass: Support recipes
	specifying static IDs
Thread-Index: AQHSnAGQ/HRTp0k4tkW6zJtNpU7CKqGS57AQ
Date: Mon, 13 Mar 2017 16:11:14 +0000
Message-ID: <3589dcdb5a884da8a4aafc12a7122959@XBOX02.axis.com>
References: <20170311052758.19671-1-pkj@axis.com>
	<6a4f5fdd-18ea-4851-b2ec-4e889d7c012f@windriver.com>
In-Reply-To: <6a4f5fdd-18ea-4851-b2ec-4e889d7c012f@windriver.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Subject: Re: [PATCH] useradd-staticids.bbclass: Support recipes specifying static IDs
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
X-List-Received-Date: Mon, 13 Mar 2017 16:11:19 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: Mark Hatle [mailto:mark.hatle@windriver.com]
> Sent: den 13 mars 2017 14:56
> To: Peter Kjellerstedt; openembedded-core@lists.openembedded.org
> Subject: Re: [OE-core] [PATCH] useradd-staticids.bbclass: Support
> recipes specifying static IDs
>=20
> On 3/10/17 11:27 PM, Peter Kjellerstedt wrote:
> > If this bblcass is used and a recipe specifies a static ID for a
> > user/group as part of the USERADD_PARAM_${PN} or GROUPADD_PARAM_${PN},
> > the build would fail with and error like this if there was no
> > corresponding ID in the passwd/group files specified via
> > USERADD_UID_TABLES/USERADD_GID_TABLES:
>=20
> If the system is set in warning mode, it should warn if this is done
> (but allow it).
>=20
> If the system is set to error mode, it should error.
>=20
> The useradd-staticids class is expecting the files (tables) to contain
> all of the entries.  This is specifically to avoid the situation where=20
> a new recipe is introduced that adds a new user or group (dynamic or=20
> static -- static because it could conflict with one of your existing=20
> static entries.)

AFAICT, even before my rewrite of much of this code in 3149319a and=20
subsequent correction in adc0f830, if a static ID was specified as part=20
of USERADD_PARAM_${PN} then no error would be issued. However, we can=20
certainly change the code to always fail/warn if no ID is specified=20
in any of the passwd/groups files. It should just be a matter of=20
removing the if statements preceding the calls to handle_missing_id()=20
below. (I will do some verification and send an updated patch tomorrow=20
if this is the way the class should work.)

> I agree the error message below looks wrong, do the existing warning/
> error messages about it not being defined int he useradd tables still=20
> occur with this patch?

The error message below occurred because before my fix it forgot all=20
the parameters that were specified in USERADD_PARAM_${PN} when it took=20
the continue.

> --Mark
>=20
> >   ERROR: meta-oe/recipes-support/postgresql/postgresql_9.4.11.bb:
> >   meta-oe/recipes-support/postgresql/postgresql_9.4.11.bb inherits
> >   useradd but doesn't set USERADD_PARAM, GROUPADD_PARAM or
> >   GROUPMEMS_PARAM for package postgresql
> >
> > Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> > ---
> >  meta/classes/useradd-staticids.bbclass | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/meta/classes/useradd-staticids.bbclass
> b/meta/classes/useradd-staticids.bbclass
> > index a65c3f69cb..9b194df490 100644
> > --- a/meta/classes/useradd-staticids.bbclass
> > +++ b/meta/classes/useradd-staticids.bbclass
> > @@ -125,6 +125,7 @@ def update_useradd_static_config(d):
> >              if uaargs.LOGIN not in users:
> >                  if not uaargs.uid or not uaargs.uid.isdigit() or not u=
aargs.gid:
> >                      handle_missing_id(uaargs.LOGIN, 'user', pkg)
> > +                newparams.append(param)
> >                  continue
> >
> >              field =3D users[uaargs.LOGIN]
> > @@ -260,6 +261,7 @@ def update_useradd_static_config(d):
> >              if gaargs.GROUP not in groups:
> >                  if not gaargs.gid or not gaargs.gid.isdigit():
> >                      handle_missing_id(gaargs.GROUP, 'group', pkg)
> > +                newparams.append(param)
> >                  continue
> >
> >              field =3D groups[gaargs.GROUP]
> >


