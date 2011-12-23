Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1ReAmu-0001yk-BU
	for openembedded-core@lists.openembedded.org;
	Fri, 23 Dec 2011 20:28:16 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 23 Dec 2011 11:21:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="50168142"
Received: from orsmsx603.amr.corp.intel.com ([10.22.226.49])
	by AZSMGA002.ch.intel.com with ESMTP; 23 Dec 2011 11:21:07 -0800
Received: from orsmsx606.amr.corp.intel.com (10.22.226.128) by
	orsmsx603.amr.corp.intel.com (10.22.226.49) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Fri, 23 Dec 2011 11:21:06 -0800
Received: from orsmsx504.amr.corp.intel.com ([10.22.226.207]) by
	orsmsx606.amr.corp.intel.com ([10.22.226.128]) with mapi;
	Fri, 23 Dec 2011 11:21:06 -0800
From: "Kamble, Nitin A" <nitin.a.kamble@intel.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Date: Fri, 23 Dec 2011 11:21:06 -0800
Thread-Topic: Internal compiler error
Thread-Index: AczA2CdU1zZeArllQR6xCFvPUSwDhAAz8Vxw
Message-ID: <9DA5872FEF993D41B7173F58FCF6BE94E7922CF6@orsmsx504.amr.corp.intel.com>
References: <2359656.ub2hYRIHg6@helios>
In-Reply-To: <2359656.ub2hYRIHg6@helios>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
Subject: Re: Internal compiler error
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
X-List-Received-Date: Fri, 23 Dec 2011 19:28:16 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Khem had fixed this in the oecore, I just sent a pull request for that comm=
it for edison branch.

Thanks
Nitin


> -----Original Message-----
> From: Paul Eggleton [mailto:paul.eggleton@linux.intel.com]
> Sent: Thursday, December 22, 2011 10:33 AM
> To: openembedded-core@lists.openembedded.org
> Cc: Kamble, Nitin A; Khem Raj
> Subject: Internal compiler error
>=20
> Hi Nitin/Khem/all,
>=20
> We saw a failure on the Yocto Project autobuilder recently which
> appears to be
> the result of an internal compiler error [1] (note this is with the
> edison
> branch of Yocto, so it's somewhat older than what we have in master).
> Some
> searching brought up a Linaro gcc bug that looks remarkably similar
> [2].
>=20
> Do you guys know anything about this? Do we need to bring in the fix
> from the
> bug report above?
>=20
> Cheers,
> Paul
>=20
> [1] http://autobuilder.yoctoproject.org:8010/builders/nightly-
> arm/builds/232/steps/shell_81/logs/stdio
> [2] https://bugs.launchpad.net/gcc-linaro/+bug/723185
>=20
> --
>=20
> Paul Eggleton
> Intel Open Source Technology Centre


