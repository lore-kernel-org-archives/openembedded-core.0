Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1QPi4A-0008S3-95
	for openembedded-core@lists.openembedded.org;
	Thu, 26 May 2011 23:26:02 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 26 May 2011 14:22:57 -0700
X-ExtLoop1: 1
Received: from orsmsx603.amr.corp.intel.com ([10.22.226.49])
	by orsmga002.jf.intel.com with ESMTP; 26 May 2011 14:22:57 -0700
Received: from orsmsx606.amr.corp.intel.com (10.22.226.128) by
	orsmsx603.amr.corp.intel.com (10.22.226.49) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Thu, 26 May 2011 14:22:26 -0700
Received: from orsmsx504.amr.corp.intel.com ([10.22.226.207]) by
	orsmsx606.amr.corp.intel.com ([10.22.226.128]) with mapi;
	Thu, 26 May 2011 14:22:22 -0700
From: "Kamble, Nitin A" <nitin.a.kamble@intel.com>
To: "Hart, Darren" <darren.hart@intel.com>, Patches and discussions about the
	oe-core layer <openembedded-core@lists.openembedded.org>
Date: Thu, 26 May 2011 14:22:19 -0700
Thread-Topic: [OE-core] [bugfix 1/1] mesa-xlib: workaround gcc 4.6.0 ICE
Thread-Index: Acwb6joNh7SVycYMRKmAXIChOOovUAAACt/Q
Message-ID: <9DA5872FEF993D41B7173F58FCF6BE94D94610AA@orsmsx504.amr.corp.intel.com>
References: <cover.1306442263.git.nitin.a.kamble@intel.com>
	<03152273cac84eef23738c5f26c45b082194284f.1306442263.git.nitin.a.kamble@intel.com>
	<4DDEC349.3000409@intel.com>
In-Reply-To: <4DDEC349.3000409@intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-cr-hashedpuzzle: AhBa A+HZ BQRQ DI94 DVbG DxGL D7wD Evz/ Foqs GSXt Gbje
	GubJ GvKg HwWT IWt/ JdcY; 1;
	bwBwAGUAbgBlAG0AYgBlAGQAZABlAGQALQBjAG8AcgBlAEAAbABpAHMAdABzAC4AbwBwAGUAbgBlAG0AYgBlAGQAZABlAGQALgBvAHIAZwA=;
	Sosha1_v1; 7; {F9127437-7BCF-473F-A031-E410A1CE7FB8};
	bgBpAHQAaQBuAC4AYQAuAGsAYQBtAGIAbABlAEAAaQBuAHQAZQBsAC4AYwBvAG0A;
	Thu, 26 May 2011 21:22:19 GMT;
	UgBFADoAIABbAE8ARQAtAGMAbwByAGUAXQAgAFsAYgB1AGcAZgBpAHgAIAAxAC8AMQBdACAAbQBlAHMAYQAtAHgAbABpAGIAOgAgAHcAbwByAGsAYQByAG8AdQBuAGQAIABnAGMAYwAgADQALgA2AC4AMAAgAEkAQwBFAA==
x-cr-puzzleid: {F9127437-7BCF-473F-A031-E410A1CE7FB8}
acceptlanguage: en-US
MIME-Version: 1.0
Subject: Re: [bugfix 1/1] mesa-xlib: workaround gcc 4.6.0 ICE
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 26 May 2011 21:26:02 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> > +# nullify -O2
>=20
> Can we specify why this is being done here in the recipe? We do this in
> other areas, something like:
>=20
> # GCC 4.6.0 hits an internal compiler error using -O2
> # use -O to workaround.
Darren,=20
  Good Point, I will update the comment in the tree.

>=20
> This make it obvious when looking just at the source why this is an
> issue, and will trigger a retest and removal when we move past 4.6.0.
> Also, if there is a bug number, linking that here would make it easy to
> determine if a fix is ready.


The bug id is in the commit message. Maybe the create_pull_request can crea=
te the clickable URLs in the email based on that information.

Thanks,
Nitin


>=20
> > +CFLAGS_append +=3D " -O"
>=20
> Thanks,
>=20
> --
> Darren Hart
> Intel Open Source Technology Center
> Yocto Project - Linux Kernel


