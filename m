Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id B6FD278CB1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jul 2018 20:49:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 38256185B8;
	Fri, 27 Jul 2018 22:49:53 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id 9ZGBTWQwyBDV; Fri, 27 Jul 2018 22:49:52 +0200 (CEST)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bastet.se.axis.com (Postfix) with ESMTPS id 1BDDE185AE;
	Fri, 27 Jul 2018 22:49:52 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 065521A072;
	Fri, 27 Jul 2018 22:49:52 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id ECA0D1A06B;
	Fri, 27 Jul 2018 22:49:51 +0200 (CEST)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder02.se.axis.com (Postfix) with ESMTP;
	Fri, 27 Jul 2018 22:49:51 +0200 (CEST)
Received: from XBOX01.axis.com (xbox01.axis.com [10.0.5.15])
	by seth.se.axis.com (Postfix) with ESMTP id E33501EB8;
	Fri, 27 Jul 2018 22:49:51 +0200 (CEST)
Received: from XBOX02.axis.com (10.0.5.16) by XBOX01.axis.com (10.0.5.15) with
	Microsoft SMTP Server (TLS) id 15.0.1365.1;
	Fri, 27 Jul 2018 22:49:51 +0200
Received: from XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776]) by
	XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776%21]) with mapi id
	15.00.1365.000; Fri, 27 Jul 2018 22:49:51 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Khem Raj <raj.khem@gmail.com>, ChenQi <Qi.Chen@windriver.com>
Thread-Topic: [OE-core] [PATCH] defaultsetup.conf: Enable security flags+pie
	by default
Thread-Index: AQHUI1hsKuyJPfB9bUql4YGblKqTPqSjh16Q
Date: Fri, 27 Jul 2018 20:49:51 +0000
Message-ID: <084d0ef1bd4047859ed68d8e90d3321d@XBOX02.axis.com>
References: <20180723190928.27368-1-raj.khem@gmail.com>
	<f8b662f7-28e8-9692-5cd7-36faadc6e45a@windriver.com>
	<CAMKF1spfo0rTE31BiCuYPZuR2GQ=U4i9LBGkQ_r3HQdZf4udsQ@mail.gmail.com>
In-Reply-To: <CAMKF1spfo0rTE31BiCuYPZuR2GQ=U4i9LBGkQ_r3HQdZf4udsQ@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] defaultsetup.conf: Enable security flags+pie	by default
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
X-List-Received-Date: Fri, 27 Jul 2018 20:49:53 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org <openembedded-
> core-bounces@lists.openembedded.org> On Behalf Of Khem Raj
> Sent: den 24 juli 2018 16:12
> To: ChenQi <Qi.Chen@windriver.com>
> Cc: Patches and discussions about the oe-core layer <openembedded-
> core@lists.openembedded.org>
> Subject: Re: [OE-core] [PATCH] defaultsetup.conf: Enable security
> flags+pie by default
>=20
> On Tue, Jul 24, 2018 at 12:30 AM ChenQi <Qi.Chen@windriver.com> wrote:
> >
> > Hi Khem,
> >
> > The comments in security-flags.inc also needs to be modified to
> remove
> > 'poky-lsb' info.
> >
> > I'd suggest we still put it into distro conf file (poky.conf) instead
> of
> > defaultsetup.conf, because defaultsetup.conf is included by
> > bitbake.conf. I think things in defaultsetup.conf should be necessary
> > default values to build things out. I don't think security flags is
> > necessary to build things out.
>=20
> this is the default setup, even non-poky users will get consistent
> experience.

I have to agree with Chen here. I think requiring security_flags.inc from=20
defaultsetup.conf is the wrong thing to do. We use security_flags.inc in=20
our setup, and I know how much trouble it has brought. To me, using it=20
should be a distro decision, not something that is enforced by the use=20
of bitbake.

> > Also, I got a question when I just looked at this file.
> > Do you think we should adjust CFLAGS and LDFALGS in security_flags.inc
> > instead of the current TARGET_CC_ARCH and TARGET_LDFLAGS?
>=20
> in many cases packages do not honor CFLAGS/LDFLAGS say during configure
>=20
> > We are naming
> > variables to SECURITY_CFLAGS and SECURITY_LDFLAGS, it seems that they
> > belong to CFLAGS and LDFLAGS naturally. But I'm not sure about it.
> >
> yes they do, but this makes it easy to override the setting for
> packages where these options are needed to be overridden or modified.

Actually, with the changes introduced in Pyro, SECURITY_CFLAGS became a=20
mess. Before Pyro, you either set SECURITY_CFLAGS to=20
"${SECURITY_NO_PIE_CFLAGS}" (to disable the use of -fpie), or you set it=20
to the empty string (to disable all security options). With Pyro and later,=
=20
you instead have to set SECURITY_CFLAGS to "${SECURITY_NO_PIE_CFLAGS}=20
${SECURITY_NOPIE_CFLAGS}" to make sure -fpie is disabled, or set it to=20
"${SECURITY_NOPIE_CFLAGS}" to disable everything. Alternatively you can=20
set SECURITY_PIE_CFLAGS to "${SECURITY_NOPIE_CFLAGS}" to only disable=20
-fpie.

I have considered to suggest changing the definition of=20
SECURITY_NOPIE_CFLAGS to:

SECURITY_NOPIE_CFLAGS ?=3D "${@'-no-pie -fno-PIE' if '${GCCPIE}' else ''}"

and then change SECURITY_NO_PIE_CFLAGS to:

SECURITY_NO_PIE_CFLAGS ?=3D "-fstack-protector-strong ${SECURITY_NOPIE_CFLA=
GS} ${lcl_maybe_fortify} ${SECURITY_STRINGFORMAT}"

That would better have matched the situation before Pyro, in that one yet=20
again would set SECURITY_CFLAGS to "${SECURITY_NO_PIE_CFLAGS}" to disable=20
-fpie. Unfortunately one would still have to set SECURITY_CFLAGS to=20
"${SECURITY_NOPIE_CFLAGS}" to disable everything.

> > Best Regards,
> > Chen Qi
> >
> >
> > On 07/24/2018 03:09 AM, Khem Raj wrote:
> > > This has been an opt-in for so long, some distributions e.g.
> > > poky-lsb uses it by default however, since most of linux
> > > distros have started to default to these settings for security
> > > enhancements, time has come for OE to make it default too
> > >
> > > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > > ---
> > >   meta/conf/distro/defaultsetup.conf | 1 +
> > >   1 file changed, 1 insertion(+)
> > >
> > > diff --git a/meta/conf/distro/defaultsetup.conf
> b/meta/conf/distro/defaultsetup.conf
> > > index ca2f9178d2..352e279596 100644
> > > --- a/meta/conf/distro/defaultsetup.conf
> > > +++ b/meta/conf/distro/defaultsetup.conf
> > > @@ -1,6 +1,7 @@
> > >   include conf/distro/include/default-providers.inc
> > >   include conf/distro/include/default-versions.inc
> > >   include conf/distro/include/default-distrovars.inc
> > > +require conf/distro/include/security_flags.inc
> > >   include conf/distro/include/world-broken.inc
> > >
> > >   TCMODE ?=3D "default"

//Peter


