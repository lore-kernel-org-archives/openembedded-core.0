Return-Path: <nitin.a.kamble@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 0D34960B9B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Apr 2014 16:12:27 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 18 Apr 2014 09:12:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,884,1389772800"; d="scan'208";a="522934709"
Received: from orsmsx103.amr.corp.intel.com ([10.22.225.130])
	by fmsmga002.fm.intel.com with ESMTP; 18 Apr 2014 09:12:28 -0700
Received: from orsmsx112.amr.corp.intel.com (10.22.240.13) by
	ORSMSX103.amr.corp.intel.com (10.22.225.130) with Microsoft SMTP Server
	(TLS) id 14.3.123.3; Fri, 18 Apr 2014 09:12:27 -0700
Received: from orsmsx103.amr.corp.intel.com ([169.254.2.198]) by
	ORSMSX112.amr.corp.intel.com ([169.254.12.151]) with mapi id
	14.03.0123.003; Fri, 18 Apr 2014 09:12:26 -0700
From: "Kamble, Nitin A" <nitin.a.kamble@intel.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>, "Hart, Darren"
	<darren.hart@intel.com>
Thread-Topic: [OE-core] [PATCH 1/1] meta-skeleton: linux-yocto-custom.bb:
	use machine overrides
Thread-Index: AQHPVad1f6jTSfOW5EydI4i7ZrK+j5sNJmwA//+MGoCABq4/gIAAE1qAgABeX4CAA8OdgA==
Date: Fri, 18 Apr 2014 16:12:26 +0000
Message-ID: <ADD6A3980E8C39419A432FF422031B4C7CE03B88@ORSMSX103.amr.corp.intel.com>
References: <cover.1397235602.git.nitin.a.kamble@intel.com>
	<2000508.o5Wd2u71cb@peggleto-mobl5.ger.corp.intel.com>
	<CF72C2F0.8411E%darren.hart@intel.com>
	<34091410.ZhZR5aYx9V@peggleto-mobl5.ger.corp.intel.com>
In-Reply-To: <34091410.ZhZR5aYx9V@peggleto-mobl5.ger.corp.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.22.254.138]
MIME-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] meta-skeleton: linux-yocto-custom.bb: use machine overrides
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
X-List-Received-Date: Fri, 18 Apr 2014 16:12:28 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> > >
> > >Variable references can be used in overrides, provided the expansion
> > >happens at the right time. However, it would not be appropriate to
> > >use ${MACHINE} here because if it were used verbatim in the recipe,
> > >it would not have the desired effect - the value of ${MACHINE} would
> > >change with whatever MACHINE was set to, and since ${MACHINE} is
> > >always in OVERRIDES it would always be applied.
> >
> > I think we should just drop the overrides. The overrides are needed
> > with linux-yocto bbappends so we don't pollute the namespace, but here
> > there is nothing to polute. This is the only recipe, you don't use
> > bbappends with it. It needs some documentation, but we should just
> > drop all the overrides in this recipe.
>=20
> I think you're probably right with the way this recipe is intended to be =
used,
> yes.
>=20

So shall we leave this recipe unchanged? As the commit was made to avoid th=
e
unwanted recipe variable pollution across layers, which is not the case.

Nitin

> Cheers,
> Paul
>=20
> --
>=20
> Paul Eggleton
> Intel Open Source Technology Centre

