Return-Path: <peter.kjellerstedt@axis.com>
Received: from bes.se.axis.com (bes.se.axis.com [195.60.68.10])
	by mail.openembedded.org (Postfix) with ESMTP id E6B4D77879
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Mar 2017 09:43:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bes.se.axis.com (Postfix) with ESMTP id 7BB452E268;
	Wed,  8 Mar 2017 10:44:00 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bes.se.axis.com
Received: from bes.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bes.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id Nc9BRpo7l4IC; Wed,  8 Mar 2017 10:43:58 +0100 (CET)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bes.se.axis.com (Postfix) with ESMTPS id 93B2D2E275;
	Wed,  8 Mar 2017 10:43:58 +0100 (CET)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 837941E083;
	Wed,  8 Mar 2017 10:43:58 +0100 (CET)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 785731E060;
	Wed,  8 Mar 2017 10:43:58 +0100 (CET)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder03.se.axis.com (Postfix) with ESMTP;
	Wed,  8 Mar 2017 10:43:58 +0100 (CET)
Received: from XBOX02.axis.com (xbox02.axis.com [10.0.5.16])
	by seth.se.axis.com (Postfix) with ESMTP id 6C4F6261;
	Wed,  8 Mar 2017 10:43:58 +0100 (CET)
Received: from xbox11.axis.com (10.0.5.25) by XBOX02.axis.com (10.0.5.16) with
	Microsoft SMTP Server (TLS) id 15.0.1210.3;
	Wed, 8 Mar 2017 10:43:58 +0100
Received: from XBOX02.axis.com (10.0.5.16) by xbox11.axis.com (10.0.5.25) with
	Microsoft SMTP Server (TLS) id 15.0.1210.3;
	Wed, 8 Mar 2017 10:43:58 +0100
Received: from XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776]) by
	XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776%21]) with mapi id
	15.00.1210.000; Wed, 8 Mar 2017 10:43:58 +0100
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: "Richard Purdie (richard.purdie@linuxfoundation.org)"
	<richard.purdie@linuxfoundation.org>
Thread-Topic: [OE-core] [PATCHv3 0/5] Add dummy tools to help identify needed
	dependencies
Thread-Index: AQHSlDqPV6dQtLQzV0mTn7k3g609c6GDfTXAgAc53fA=
Date: Wed, 8 Mar 2017 09:43:58 +0000
Message-ID: <af3c0da4bce549a5b303d828c9728524@XBOX02.axis.com>
References: <cover.1488539819.git.pkj@axis.com>
	<CAEHkU3XyKbGzTCX9XaG7jYXjde+ZRtA9z_MSecxpgOcu6wLMiQ@mail.gmail.com>
	<aca83849e80a444595764b812d5e3394@XBOX02.axis.com>
In-Reply-To: <aca83849e80a444595764b812d5e3394@XBOX02.axis.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv3 0/5] Add dummy tools to help identify needed dependencies
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
X-List-Received-Date: Wed, 08 Mar 2017 09:44:00 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
> Peter Kjellerstedt
> Sent: den 3 mars 2017 20:53
> To: Max Krummenacher
> Cc: OE-core
> Subject: Re: [OE-core] [PATCHv3 0/5] Add dummy tools to help identify
> needed dependencies
>=20
> > -----Original Message-----
> > From: Max Krummenacher [mailto:max.oss.09@gmail.com]
> > Sent: den 3 mars 2017 17:24
> > To: Peter Kjellerstedt
> > Cc: OE-core
> > Subject: Re: [OE-core] [PATCHv3 0/5] Add dummy tools to help identify
> > needed dependencies
> >
> > Hi
> >
> > 2017-03-03 12:17 GMT+01:00 Peter Kjellerstedt
> > <peter.kjellerstedt@axis.com>:
> >
> > > To circumvent this, I created dummy versions of the tools that
> always
> > > fail and placed them in the scripts directory. Thus, if the real
> tool
> > > has not been installed in the RSS, the dummy version is used and
> the
> > > build fails. For good measures I even output a message that says
> what
> > > needs to be corrected in the recipe.
> > >
> > > Included is also an update to linux-libc-headers as it apparently
> > > needs to inherit pkgconfig, which the introduction of the dummy
> > > version of pkg-config showed.
> > >
> >
> > I tried the whole series, i.e. applied on top of openembedded-core,
> > 20c6e87 and bitbake 6fe07ed.
> >
> > The resulting build failed in linux-libc-headers because it picked up
> > the dummy script instead of the real pkg-config binary which actually
> > is installed in the RSS.
> >
> > run.do_configure has a PATH setting with first ...meta/scripts and
> > only then the paths to the different RSS directories.
> >
> > Changing that order in meta/conf/bitbake.conf line 450 fixed this for
> > me, however I'm unsure of posible sideeffects of that reordering.
> >
> > Max
>=20
> Bah, you are correct. That is what I get for not testing exactly
> what I sent for integration. Shame on me.
>=20
> Anyway, I see a couple of possible solutions:
>=20
> * Put the scripts in bitbake/bin instead. This should work as it
>   is only added to $PATH by oe-buildenv-internal (contrary to
>   ${COREBASE}/scripts which is added to $PATH both by
>   oe-buildenv-internal and bitbake.conf). However, I do not like
>   this idea as it feels wrong to put them there.
> * Put the scripts in a subdirectory of ${COREBASE}/scripts, e.g.,
>   ${COREBASE}/scripts/blacklisted, and add that path to $PATH in
>   bitbake.conf, but at the other end of it so that the RSS paths
>   appear before it. This sounds a lot more appealing to me.
> * Implement the whitelist solution Patrick Ohly mentioned instead.
>   Although this is probably the best solution, prioritizing it
>   for 2.3 does not sound likely to happen.
>=20
> I have implemented solution two above (properly tested this time),
> and will send that along in a little while.
>=20
> //Peter

Richard,

since I see that you have integrated/staged the two patches that add=20
inherits of pkgconfig, but not the patches that add the dummy commands,=20
I assume you have some reservations to these patches. What are your=20
take on the subject of blacklisting vs whitelisting the commands from=20
the build host? I know that having these dummy commands in place helped=20
me a great deal when updating our recipes to build correctly with RSS.

//Peter


