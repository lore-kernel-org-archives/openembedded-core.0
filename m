Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 920A171A3A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Mar 2017 00:47:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 4F8161837B;
	Tue, 14 Mar 2017 01:47:27 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id 8BYQIilyPFES; Tue, 14 Mar 2017 01:47:26 +0100 (CET)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bastet.se.axis.com (Postfix) with ESMTPS id 2E9241836A;
	Tue, 14 Mar 2017 01:47:26 +0100 (CET)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 19E131A0B5;
	Tue, 14 Mar 2017 01:47:26 +0100 (CET)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0E6F41A0B4;
	Tue, 14 Mar 2017 01:47:26 +0100 (CET)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder02.se.axis.com (Postfix) with ESMTP;
	Tue, 14 Mar 2017 01:47:26 +0100 (CET)
Received: from XBOX03.axis.com (xbox03.axis.com [10.0.5.17])
	by seth.se.axis.com (Postfix) with ESMTP id 0275B2E9;
	Tue, 14 Mar 2017 01:47:26 +0100 (CET)
Received: from XBOX02.axis.com (10.0.5.16) by XBOX03.axis.com (10.0.5.17) with
	Microsoft SMTP Server (TLS) id 15.0.1210.3;
	Tue, 14 Mar 2017 01:47:25 +0100
Received: from XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776]) by
	XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776%21]) with mapi id
	15.00.1210.000; Tue, 14 Mar 2017 01:47:26 +0100
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Mark Hatle <mark.hatle@windriver.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH] useradd-staticids.bbclass: Support recipes
	specifying static IDs
Thread-Index: AQHSnAGQ/HRTp0k4tkW6zJtNpU7CKqGS57AQgAADWACAAJH8sA==
Date: Tue, 14 Mar 2017 00:47:25 +0000
Message-ID: <8d9fad7fa9f747dbaef82e25b51b3501@XBOX02.axis.com>
References: <20170311052758.19671-1-pkj@axis.com>
	<6a4f5fdd-18ea-4851-b2ec-4e889d7c012f@windriver.com>
	<3589dcdb5a884da8a4aafc12a7122959@XBOX02.axis.com>
	<45145706-6456-2045-feec-b2d68e355908@windriver.com>
In-Reply-To: <45145706-6456-2045-feec-b2d68e355908@windriver.com>
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
X-List-Received-Date: Tue, 14 Mar 2017 00:47:30 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: Mark Hatle [mailto:mark.hatle@windriver.com]
> Sent: den 13 mars 2017 17:50
> To: Peter Kjellerstedt; openembedded-core@lists.openembedded.org
> Subject: Re: [OE-core] [PATCH] useradd-staticids.bbclass: Support
> recipes specifying static IDs
>=20
> On 3/13/17 11:11 AM, Peter Kjellerstedt wrote:
> >> -----Original Message-----
> >> From: Mark Hatle [mailto:mark.hatle@windriver.com]
> >> Sent: den 13 mars 2017 14:56
> >> To: Peter Kjellerstedt; openembedded-core@lists.openembedded.org
> >> Subject: Re: [OE-core] [PATCH] useradd-staticids.bbclass: Support
> >> recipes specifying static IDs
> >>
> >> On 3/10/17 11:27 PM, Peter Kjellerstedt wrote:
> >>> If this bblcass is used and a recipe specifies a static ID for a
> >>> user/group as part of the USERADD_PARAM_${PN} or
> GROUPADD_PARAM_${PN},
> >>> the build would fail with and error like this if there was no
> >>> corresponding ID in the passwd/group files specified via
> >>> USERADD_UID_TABLES/USERADD_GID_TABLES:
> >>
> >> If the system is set in warning mode, it should warn if this is done
> >> (but allow it).
> >>
> >> If the system is set to error mode, it should error.
> >>
> >> The useradd-staticids class is expecting the files (tables) to
> contain
> >> all of the entries.  This is specifically to avoid the situation
> where
> >> a new recipe is introduced that adds a new user or group (dynamic or
> >> static -- static because it could conflict with one of your existing
> >> static entries.)
> >
> > AFAICT, even before my rewrite of much of this code in 3149319a and
> > subsequent correction in adc0f830, if a static ID was specified as
> part
> > of USERADD_PARAM_${PN} then no error would be issued. However, we can
> > certainly change the code to always fail/warn if no ID is specified
> > in any of the passwd/groups files. It should just be a matter of
> > removing the if statements preceding the calls to handle_missing_id()
> > below. (I will do some verification and send an updated patch
> > tomorrow if this is the way the class should work.)
>=20
> The intention was always that the uname/gname had to be specified in
> the useradd tables in some way, or a warning/error would occur.
>=20
> If the fields were blank in the tables, the system would use the
> versions located in the recipe -- otherwise it would use the version in=20
> the table.  (At one point, but I don't think this was ever pushed in --=20
> if a static ID was set in the recipe, there was a verification that the=20
> static version in both the recipe and the table files was the same --=20
> otherwise it could indicate the package may not be built properly.)
>=20
> >> I agree the error message below looks wrong, do the existing
> >> warning/error messages about it not being defined int he useradd=20
> >> tables still occur with this patch?
> >
> > The error message below occurred because before my fix it forgot all
> > the parameters that were specified in USERADD_PARAM_${PN} when it
> > took the continue.
>=20
> Ok, we need to fix that bug first then.
>=20
> We should then verify the second issue and fix it in a subsequent
> commit.  The key being that of the user/group was not in the table=20
> we warn them (or error) -- preventing unexpected users from showing up.

I have verified now that removing the if statements will get us the wanted=
=20
behavior that all users/group must have static IDs in the passwd/groups=20
files even if they have static IDs defined in the recipe. I had intended=20
to just squash that change with the first one, but I can do it as two=20
separate commits.

> The check both static IDs are the same could very well be a TODO item
> (that is never done) -- but something that should be considered.

There is a warning if a static ID is specified in the recipe and it is=20
changed due to having a different value in the passwd file. I think that=20
is good enough.

> Thanks!
> --Mark

//Peter


