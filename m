Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 9E2A7771AA
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Feb 2016 21:49:43 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 02 Feb 2016 13:49:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,386,1449561600"; d="scan'208";a="904205751"
Received: from kng2-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.178.194])
	by orsmga002.jf.intel.com with ESMTP; 02 Feb 2016 13:49:36 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: =?ISO-8859-1?Q?An=EDbal_Lim=F3n?= <anibal.limon@linux.intel.com>
Date: Wed, 03 Feb 2016 10:49:34 +1300
Message-ID: <6381704.KGREOWooUi@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.10 (Linux/4.3.3-303.fc23.x86_64; KDE/4.14.16; x86_64; ;
	)
In-Reply-To: <56B123EC.10104@linux.intel.com>
References: <cover.1454424743.git.anibal.limon@linux.intel.com>
	<2000408.dJe5DU85LA@peggleto-mobl.ger.corp.intel.com>
	<56B123EC.10104@linux.intel.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org, benjamin.esquivel@intel.com,
	=?ISO-8859-1?Q?An=EDbal_Lim=F3n?= <limon.anibal@gmail.com>
Subject: Re: [PATCH 15/20] classes/populate_sdk_ext: Add OE_SDK_EXT_SILENT env variable
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
X-List-Received-Date: Tue, 02 Feb 2016 21:49:44 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

I just dislike adding variables when we have another fairly simple alte=
rnative=20
mechanism. If we had a concrete reason to want to be able to conditiona=
lly see=20
other output from the script (even in future) then I could support it b=
ut as I=20
understand it we don't.

Cheers,
Paul

On Tue, 02 Feb 2016 15:47:24 An=EDbal Lim=F3n wrote:
> I think is better to have the variable because this kind of message i=
s
> an information one but what happens if you want to show a warning for=

> make the test fails the variable gives you this possibility of choice=

> what hide and what no but if you want to made the redirection is ok f=
or me.
>=20
> =09alimon
>=20
> On 02/02/2016 03:40 PM, Paul Eggleton wrote:
> > On Tue, 02 Feb 2016 15:38:33 An=EDbal Lim=F3n wrote:
> >> On 02/02/2016 03:31 PM, Paul Eggleton wrote:
> >>> On Tue, 02 Feb 2016 15:30:21 An=EDbal Lim=F3n wrote:
> >>>> On 02/02/2016 03:25 PM, Paul Eggleton wrote:
> >>>>> On Tue, 02 Feb 2016 15:23:54 An=EDbal Lim=F3n wrote:
> >>>>>> Paul Eggleton wrote:
> >>>>>>> Rather than adding another variable for this why not just red=
irect
> >>>>>>> the
> >>>>>>> output to /dev/null ?
> >>>>>>=20
> >>>>>> Because this is disabled when SDK tests (compatibility) ran us=
ing
> >>>>>> eSDK
> >>>>>> so sometimes needs to SILENT it when automatic process is work=
ing
> >>>>>> another times don't like when user uses it.
> >>>>>=20
> >>>>> At face value, redirection during automated testing and not whe=
n not
> >>>>> solves
> >>>>> this.
> >>>>=20
> >>>> We can't only redirect because is a python test that looks for s=
ome
> >>>> output in the sdtout, if we redirect to the /dev/null then lose =
the
> >>>> value.
> >>>=20
> >>> Well naturally you would need to redirect the output of the SDK
> >>> environment
> >>> setup script only.
> >>>=20
> >>>>>> In this case the SDK tests fails because it looks to stdout an=
d found
> >>>>>> devtool msg.
> >>>>>=20
> >>>>> Which test failed and why?
> >>>>=20
> >>>> Is this test [1], as i said is an SDK test running on eSDK env.
> >>>>=20
> >>>> [1]
> >>>> http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/tree/meta=
/lib/oe
> >>>> qa
> >>>> /sd k/python.py?h=3Dalimon/esdk_testsuite_export#n22
> >>>=20
> >>> OK, but where is the bit that actually runs the environment setup=

> >>> script?
> >>=20
> >> Here [1] and i set the variable in the testsdkext task [2].
> >>=20
> >> [1]
> >> http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/tree/meta/l=
ib/oeqa
> >> /oe test.py?h=3Dalimon/esdk_testsuite#n127 [2]
> >> http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/tree/meta/c=
lasses/
> >> tes tsdk.bbclass?h=3Dalimon/esdk_testsuite#n107
> >=20
> > Right, so you can trivially redirect the output of the env setup co=
mmand
> > (before the ';') to /dev/null. It also won't affect the standard SD=
K
> > testing so we should be safe there as well.
> >=20
> > Cheers,
> > Paul

--=20

Paul Eggleton
Intel Open Source Technology Centre

