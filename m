Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1QChe6-00063P-L6
	for openembedded-core@lists.openembedded.org;
	Thu, 21 Apr 2011 02:21:22 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 20 Apr 2011 17:18:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,248,1301900400"; d="scan'208";a="422961282"
Received: from orsmsx602.amr.corp.intel.com ([10.22.226.211])
	by azsmga001.ch.intel.com with ESMTP; 20 Apr 2011 17:18:57 -0700
Received: from orsmsx605.amr.corp.intel.com (10.22.226.10) by
	orsmsx602.amr.corp.intel.com (10.22.226.211) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Wed, 20 Apr 2011 17:18:43 -0700
Received: from orsmsx504.amr.corp.intel.com ([10.22.226.207]) by
	orsmsx605.amr.corp.intel.com ([10.22.226.10]) with mapi;
	Wed, 20 Apr 2011 17:18:42 -0700
From: "Kamble, Nitin A" <nitin.a.kamble@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 20 Apr 2011 17:18:40 -0700
Thread-Topic: [OE-core] [PATCH] gcc: Add recipes for 4.6.0
Thread-Index: Acv/fR+kDxp6M+d7S02EqVsZhJ+kZAAKIqvgAATvTJA=
Message-ID: <9DA5872FEF993D41B7173F58FCF6BE9451635064@orsmsx504.amr.corp.intel.com>
References: <1303273629-1631-1-git-send-email-raj.khem@gmail.com>
	<9DA5872FEF993D41B7173F58FCF6BE94515DC58B@orsmsx504.amr.corp.intel.com>
	<4DAF0E5C.10106@linux.intel.com>
	<430B907C-AA81-410E-A9C7-EC5B15E58FAA@dominion.thruhere.net>
	<BANLkTint2tspjGTh7H1VdRxJEhUF47_7Ew@mail.gmail.com>
	<9DA5872FEF993D41B7173F58FCF6BE9451634E1F@orsmsx504.amr.corp.intel.com>
In-Reply-To: <9DA5872FEF993D41B7173F58FCF6BE9451634E1F@orsmsx504.amr.corp.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
Cc: "Hart, Darren" <darren.hart@intel.com>
Subject: Re: [PATCH] gcc: Add recipes for 4.6.0
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
X-List-Received-Date: Thu, 21 Apr 2011 00:21:22 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Met 1st build failure with gcc4.6.6. I think it is not a gcc issue, but the=
 recipe code issue; And Tom/Darren can take care of it.

Thanks,
Nitin


| PERF_VERSION =3D 2.6.37.5.308.g69cfbd^M
| make: Leaving directory `/build_disk/poky_build/build_gcc_4.6.0/tmp/work/=
qemux86_64-poky-linux/linux-yocto-2.6.37+git1+727fc4769aa920fc5bb3eb9a81bf9=
2d0e6340903_1+69cfbdf9f1ff461a75e5b77d6d7ba35e97db4cc3-r16/linux/tools/perf=
'^M
| make: Entering directory `/build_disk/poky_build/build_gcc_4.6.0/tmp/work=
/qemux86_64-poky-linux/linux-yocto-2.6.37+git1+727fc4769aa920fc5bb3eb9a81bf=
92d0e6340903_1+69cfbdf9f1ff461a75e5b77d6d7ba35e97db4cc3-r16/linux/tools/per=
f'^M
| Makefile:512: No libdw.h found or old libdw.h found or elfutils is older =
than 0.138, disables dwarf support. Please install new elfutils-devel/libdw=
-dev^M
| Makefile:568: newt not found, disables TUI support. Please install newt-d=
evel or libnewt-dev^M
|     GEN common-cmds.h^M
|     * new build flags or prefix^M
|     CC perf.o^M
|     CC builtin-annotate.o^M
|     CC builtin-bench.o^M
|     CC bench/sched-messaging.o^M
|     CC bench/sched-pipe.o^M
| bench/sched-pipe.c: In function 'bench_sched_pipe':^M
| bench/sched-pipe.c:58:6: error: variable 'ret' set but not used [-Werror=
=3Dunused-but-set-variable]^M
| cc1: all warnings being treated as errors^M
| ^M
| make: *** [bench/sched-pipe.o] Error 1^M
| ERROR: Function 'do_compile_perf' failed (see /build_disk/poky_build/buil=
d_gcc_4.6.0/tmp/work/qemux86_64-poky-linux/linux-yocto-2.6.37+git1+727fc476=
9aa920fc5bb3eb9a81bf92d0e6340903_1+69cfbdf9f1ff461a75e5b77d6d7ba35e97db4cc3=
-r16/temp/log.do_compile_perf.24035 for further information)^M
| make:^M
NOTE: package linux-yocto-2.6.37+git1+727fc4769aa920fc5bb3eb9a81bf92d0e6340=
903_1+69cfbdf9f1ff461a75e5b77d6d7ba35e97db4cc3-r16: task do_compile_perf: F=
ailed


> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
> Kamble, Nitin A
> Sent: Wednesday, April 20, 2011 2:58 PM
> To: Patches and discussions about the oe-core layer
> Subject: Re: [OE-core] [PATCH] gcc: Add recipes for 4.6.0
>=20
> Khem,
>   Good news. All the gcc recipes built without any errors for arm, ppc,
> mips, x86, x86-64. Now I am trying to build the poky-image-sato-sdk
> image for each architecture. Will keep you posted.
>=20
> Thanks & Regards,
> Nitin
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


