Return-Path: <emilia.maria.silvia.ciobanu@intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 912886AB93
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Jul 2013 09:55:51 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 11 Jul 2013 02:55:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,1043,1363158000"; d="scan'208";a="329784731"
Received: from irsmsx102.ger.corp.intel.com ([163.33.3.155])
	by azsmga001.ch.intel.com with ESMTP; 11 Jul 2013 02:55:40 -0700
Received: from irsmsx105.ger.corp.intel.com ([169.254.7.52]) by
	IRSMSX102.ger.corp.intel.com ([169.254.2.194]) with mapi id
	14.03.0123.003; Thu, 11 Jul 2013 10:55:32 +0100
From: "Ciobanu, Emilia Maria Silvia" <emilia.maria.silvia.ciobanu@intel.com>
To: Trevor Woerner <trevor.woerner@linaro.org>
Thread-Topic: [OE-core] [PATCH 3/3] docbook-sgml-dtd-3.1-native.bb: Add real
	PV inside the recipe
Thread-Index: AQHOfX4uVNjnDye5/0Gmmhq9KneQWJlfHZyAgAAefsA=
Date: Thu, 11 Jul 2013 09:55:31 +0000
Message-ID: <985E5BBDA0968D48ABDF343456A521B3022C98DE@IRSMSX105.ger.corp.intel.com>
References: <cover.1373468672.git.emilia.maria.silvia.ciobanu@intel.com>
	<a9d90af766913d932c03bc57e395bab720cfbe3c.1373468672.git.emilia.maria.silvia.ciobanu@intel.com>
	<bf65f77f194b7e5a9047a2196e87a2d59f8e0e6b.1373468672.git.emilia.maria.silvia.ciobanu@intel.com>
	<CALmOhgnPu5RGZ4iC+C3XjdbD6rT1OKwfy0Q_ATPLqH2o0uVZhg@mail.gmail.com>
In-Reply-To: <CALmOhgnPu5RGZ4iC+C3XjdbD6rT1OKwfy0Q_ATPLqH2o0uVZhg@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [163.33.239.182]
MIME-Version: 1.0
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/3] docbook-sgml-dtd-3.1-native.bb: Add real PV inside the recipe
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
X-List-Received-Date: Thu, 11 Jul 2013 09:55:52 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Trevor,

I think this is a misunderstanding. We are currently using the autoincremen=
tation
mechanism for the PR of the packages and not for the PV.  In this case the =
PV variable
was missing from the recipe.

Thanks,
Ema

> -----Original Message-----
> From: Trevor Woerner [mailto:trevor.woerner@linaro.org]
> Sent: Thursday, July 11, 2013 11:58 AM
> To: Ciobanu, Emilia Maria Silvia
> Cc: openembedded-core
> Subject: Re: [OE-core] [PATCH 3/3] docbook-sgml-dtd-3.1-native.bb: Add
> real PV inside the recipe
>=20
> On 10 July 2013 16:07, Emilia Ciobanu
> <emilia.maria.silvia.ciobanu@intel.com> wrote:
> >  PR =3D "${INC_PR}.0"
> > +PV =3D "31"
>=20
>=20
> I thought the general trend was to move away from real PVs to the
> autoincrementer? I'm just curious to know what issue prompted the move
> back to real PVs?

