Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5FE5F781CD
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Jun 2017 17:08:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id EEE67180FF;
	Wed,  7 Jun 2017 19:08:21 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id jpVdY0xb8bNu; Wed,  7 Jun 2017 19:08:21 +0200 (CEST)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bastet.se.axis.com (Postfix) with ESMTPS id C4D07184E3;
	Wed,  7 Jun 2017 19:08:20 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B4C021A0C9;
	Wed,  7 Jun 2017 19:08:20 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A91521A0C8;
	Wed,  7 Jun 2017 19:08:20 +0200 (CEST)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder02.se.axis.com (Postfix) with ESMTP;
	Wed,  7 Jun 2017 19:08:20 +0200 (CEST)
Received: from XBOX01.axis.com (xbox01.axis.com [10.0.5.15])
	by thoth.se.axis.com (Postfix) with ESMTP id 9CA6C2A60;
	Wed,  7 Jun 2017 19:08:20 +0200 (CEST)
Received: from XBOX02.axis.com (10.0.5.16) by XBOX01.axis.com (10.0.5.15) with
	Microsoft SMTP Server (TLS) id 15.0.1210.3;
	Wed, 7 Jun 2017 19:08:20 +0200
Received: from XBOX02.axis.com ([fe80::d00f:cb52:1b56:20d]) by XBOX02.axis.com
	([fe80::d00f:cb52:1b56:20d%21]) with mapi id 15.00.1210.000;
	Wed, 7 Jun 2017 19:08:20 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>, "Richard
	Purdie" <richard.purdie@linuxfoundation.org>
Thread-Topic: [OE-core] [PATCH] meta*: Add LAYERSERIES_COMPAT and
	LAYERSERIES_CORENAMES markup to layer.conf
Thread-Index: AQHS360cV9JgZajxuUu8cdlR+XuJT6IZoTlQ
Date: Wed, 7 Jun 2017 17:08:20 +0000
Message-ID: <85aeec20467b46b48d954e07ce32a10a@XBOX02.axis.com>
References: <1496839163-2957-1-git-send-email-richard.purdie@linuxfoundation.org>
	<1496854280.26945.140.camel@linux.intel.com>
In-Reply-To: <1496854280.26945.140.camel@linux.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] meta*: Add LAYERSERIES_COMPAT and LAYERSERIES_CORENAMES markup to layer.conf
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
X-List-Received-Date: Wed, 07 Jun 2017 17:08:22 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
> Leonardo Sandoval
> Sent: den 7 juni 2017 18:51
> To: Richard Purdie <richard.purdie@linuxfoundation.org>
> Cc: openembedded-core@lists.openembedded.org
> Subject: Re: [OE-core] [PATCH] meta*: Add LAYERSERIES_COMPAT and
> LAYERSERIES_CORENAMES markup to layer.conf
>=20
> On Wed, 2017-06-07 at 13:39 +0100, Richard Purdie wrote:
> > This means mismatched layers are more clearly identified to the user
> in
> > cases where compatibility has not been tested. This is perhaps not as
> > needed for the core repository (other than CORENAMES) but lets lead
> by
> > example.
> >
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > ---
> >  meta-selftest/conf/layer.conf | 2 ++
> >  meta-skeleton/conf/layer.conf | 2 ++
> >  meta/conf/layer.conf          | 2 ++
> >  3 files changed, 6 insertions(+)
> >
> > diff --git a/meta-selftest/conf/layer.conf b/meta-
> selftest/conf/layer.conf
> > index a847b78..2a71895 100644
> > --- a/meta-selftest/conf/layer.conf
> > +++ b/meta-selftest/conf/layer.conf
> > @@ -8,3 +8,5 @@ BBFILES +=3D "${LAYERDIR}/recipes-*/*/*.bb \
> >  BBFILE_COLLECTIONS +=3D "selftest"
> >  BBFILE_PATTERN_selftest =3D "^${LAYERDIR}/"
> >  BBFILE_PRIORITY_selftest =3D "5"
> > +
> > +LAYERSERIES_COMPAT_selftest =3D "rocko"
> > diff --git a/meta-skeleton/conf/layer.conf b/meta-
> skeleton/conf/layer.conf
> > index aca1633..a15516a 100644
> > --- a/meta-skeleton/conf/layer.conf
> > +++ b/meta-skeleton/conf/layer.conf
> > @@ -13,3 +13,5 @@ BBFILE_PRIORITY_skeleton =3D "1"
> >  LAYERVERSION_skeleton =3D "1"
> >
> >  LAYERDEPENDS_skeleton =3D "core"
> > +
> > +LAYERSERIES_COMPAT_skeleton =3D "rocko"
> > diff --git a/meta/conf/layer.conf b/meta/conf/layer.conf
> > index fc16502..6d36aa1 100644
> > --- a/meta/conf/layer.conf
> > +++ b/meta/conf/layer.conf
> > @@ -11,6 +11,8 @@ BBFILE_PRIORITY_core =3D "5"
> >  # cause compatibility issues with other layers
> >  LAYERVERSION_core =3D "10"
> >
> > +LAYERSERIES_CORENAMES =3D "rocko"
> > +
> >  BBLAYERS_LAYERINDEX_NAME_core =3D "openembedded-core"
>=20
> at oe-core, Is there a reason not to set all LAYERSERIES_COMPAT_* =3D
> "${LAYERSERIES_CORENAMES}"? this would make it easier to bump the
> COMPAT set of variables.

That is probably a bad idea, especially if the aim here is to lead=20
by example, since otherwise you risk other layers to just blindly=20
copying that and then we have gained nothing...

> >  # Set a variable to get to the top of the metadata location
> > --
> > 2.7.4

//Peter


