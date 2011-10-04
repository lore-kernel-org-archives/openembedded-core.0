Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1RBC0t-0005OI-E3
	for openembedded-core@lists.openembedded.org;
	Tue, 04 Oct 2011 22:54:55 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 04 Oct 2011 13:49:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,487,1312182000"; d="scan'208";a="74571378"
Received: from orsmsx604.amr.corp.intel.com ([10.22.226.87])
	by fmsmga002.fm.intel.com with ESMTP; 04 Oct 2011 13:49:05 -0700
Received: from orsmsx504.amr.corp.intel.com ([10.22.226.207]) by
	orsmsx604.amr.corp.intel.com ([10.250.113.17]) with mapi;
	Tue, 4 Oct 2011 13:48:54 -0700
From: "Kamble, Nitin A" <nitin.a.kamble@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>, Patches and discussions about
	the oe-core layer <openembedded-core@lists.openembedded.org>
Date: Tue, 4 Oct 2011 13:48:53 -0700
Thread-Topic: gdb-cross-canadian fails to build
Thread-Index: AcyC1uLn+dPS0xL+SymFRd0XwG/ZzgAAA+GQ
Message-ID: <9DA5872FEF993D41B7173F58FCF6BE94E098FD75@orsmsx504.amr.corp.intel.com>
References: <CAP9ODKqPytjP_RCU_DQMewMp2TV9p86qVk8YT=eBC_jwNPaWYw@mail.gmail.com>
	<CAP9ODKqJh54j2akHEaPUfKn2LSojK6p3D0gv-A=aS3pOOqgG0A@mail.gmail.com>
In-Reply-To: <CAP9ODKqJh54j2akHEaPUfKn2LSojK6p3D0gv-A=aS3pOOqgG0A@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
Subject: Re: gdb-cross-canadian fails to build
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
X-List-Received-Date: Tue, 04 Oct 2011 20:54:55 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: otavio.salvador@gmail.com [mailto:otavio.salvador@gmail.com] On
> Behalf Of Otavio Salvador
> Sent: Tuesday, October 04, 2011 1:48 PM
> To: Patches and discussions about the oe-core layer; Kamble, Nitin A
> Subject: Re: gdb-cross-canadian fails to build
>=20
> On Tue, Oct 4, 2011 at 17:40, Otavio Salvador <otavio@ossystems.com.br>
> wrote:
> ...
> > Log data follows:
> > | NOTE: Applying patch 'no-werror.patch'
> > (openembedded-core/meta/recipes-devtools/gdb/gdb/no-werror.patch)
> ...
> > /home/otavio/hacking/ossystems/embedded-linux/openembedded-
> core/meta/recipes-devtools/gdb/gdb-cross-canadian_7.3.1.bb:
> ...
>=20
> It seems to have been broken by:
> 9002f664383d71682767546524e1299137b6fe4f
>=20
> Nitin, can you take a look?
Sure, I will look into it.

Thanks,
Nitin


>=20
> --
> Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0O.S. Systems
> E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
> Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.oss=
ystems.com.br


