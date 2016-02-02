Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 2435B772BB
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Feb 2016 21:31:29 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga104.fm.intel.com with ESMTP; 02 Feb 2016 13:31:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,386,1449561600"; d="scan'208";a="739400142"
Received: from kng2-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.178.194])
	by orsmga003.jf.intel.com with ESMTP; 02 Feb 2016 13:31:26 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: =?ISO-8859-1?Q?An=EDbal_Lim=F3n?= <anibal.limon@linux.intel.com>
Date: Wed, 03 Feb 2016 10:31:24 +1300
Message-ID: <28521140.LlNaPZzQQi@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.10 (Linux/4.3.3-303.fc23.x86_64; KDE/4.14.16; x86_64; ;
	)
In-Reply-To: <56B11FED.9000709@linux.intel.com>
References: <cover.1454424743.git.anibal.limon@linux.intel.com>
	<3922884.O19QKotbn0@peggleto-mobl.ger.corp.intel.com>
	<56B11FED.9000709@linux.intel.com>
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
X-List-Received-Date: Tue, 02 Feb 2016 21:31:29 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

On Tue, 02 Feb 2016 15:30:21 An=EDbal Lim=F3n wrote:
> On 02/02/2016 03:25 PM, Paul Eggleton wrote:
> > On Tue, 02 Feb 2016 15:23:54 An=EDbal Lim=F3n wrote:
> >> Paul Eggleton wrote:
> >>> Rather than adding another variable for this why not just redirec=
t the
> >>> output to /dev/null ?
> >>=20
> >> Because this is disabled when SDK tests (compatibility) ran using =
eSDK
> >> so sometimes needs to SILENT it when automatic process is working
> >> another times don't like when user uses it.
> >=20
> > At face value, redirection during automated testing and not when no=
t
> > solves
> > this.
>=20
> We can't only redirect because is a python test that looks for some
> output in the sdtout, if we redirect to the /dev/null then lose the v=
alue.

Well naturally you would need to redirect the output of the SDK environ=
ment=20
setup script only.

> >> In this case the SDK tests fails because it looks to stdout and fo=
und
> >> devtool msg.
> >=20
> > Which test failed and why?
>=20
> Is this test [1], as i said is an SDK test running on eSDK env.
>=20
> [1]
> http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/tree/meta/lib/=
oeqa/sd
> k/python.py?h=3Dalimon/esdk_testsuite_export#n22

OK, but where is the bit that actually runs the environment setup scrip=
t?

Cheers,
Paul

--=20

Paul Eggleton
Intel Open Source Technology Centre

