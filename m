Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1Qh1ea-0001KH-PM
	for openembedded-core@lists.openembedded.org;
	Wed, 13 Jul 2011 17:47:12 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 13 Jul 2011 08:43:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,526,1304319600"; d="scan'208";a="26787028"
Received: from orsmsx604.amr.corp.intel.com ([10.22.226.87])
	by azsmga001.ch.intel.com with ESMTP; 13 Jul 2011 08:43:13 -0700
Received: from orsmsx504.amr.corp.intel.com ([10.22.226.207]) by
	orsmsx604.amr.corp.intel.com ([10.250.113.17]) with mapi;
	Wed, 13 Jul 2011 08:43:12 -0700
From: "Kamble, Nitin A" <nitin.a.kamble@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 13 Jul 2011 08:43:11 -0700
Thread-Topic: [OE-core] [PATCH 2/5] udev-172: add a newer version for newer
	kernel
Thread-Index: AcxBKnj/Q9u76KI5RdePWzC5WyKlKgASQG6w
Message-ID: <9DA5872FEF993D41B7173F58FCF6BE94DE310424@orsmsx504.amr.corp.intel.com>
References: <af851424130d145cef560c4bfaf2ba88ea4c3da6.1310497097.git.nitin.a.kamble@intel.com>
	<bd724f86b719044e4e7958999893f8fbf3801f76.1310497097.git.nitin.a.kamble@intel.com>
	<B49A8790-9DF0-4DAA-A95A-EC2E9F854CCB@gmail.com>
	<C30E8605-35B6-48C5-B6DA-D4F7D1C64759@dominion.thruhere.net>
In-Reply-To: <C30E8605-35B6-48C5-B6DA-D4F7D1C64759@dominion.thruhere.net>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
Subject: Re: [PATCH 2/5] udev-172: add a newer version for newer	kernel
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
X-List-Received-Date: Wed, 13 Jul 2011 15:47:13 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
> Koen Kooi
> Sent: Wednesday, July 13, 2011 12:00 AM
> To: Patches and discussions about the oe-core layer
> Subject: Re: [OE-core] [PATCH 2/5] udev-172: add a newer version for
> newer kernel
>=20
>=20
> Op 13 jul 2011, om 08:22 heeft Khem Raj het volgende geschreven:
>=20
> >
> >
> > On Jul 12, 2011, at 12:02 PM, nitin.a.kamble@intel.com wrote:
> >
> >> From: Nitin A Kamble <nitin.a.kamble@intel.com>
> >>
> >> the 2.6.38 kernel has dropped v4lv1 support. and udev-168 fails to
> >> compile because of that. So add a newer 172 version of udev to work
> with
> >> 2.6.38 kernel.
> >>
> >> Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
> >> ---
> >> meta/recipes-core/udev/udev-172/init              |   59 +++++++++
> >> meta/recipes-core/udev/udev-172/local.rules       |   35 ++++++
> >> meta/recipes-core/udev/udev-172/permissions.rules |  131
> +++++++++++++++++++++
> >> meta/recipes-core/udev/udev-172/run.rules         |   14 +++
> >> meta/recipes-core/udev/udev-172/udev.rules        |  116
> ++++++++++++++++++
> >> meta/recipes-core/udev/udev_172.bb                |    6 +
> >> 6 files changed, 361 insertions(+), 0 deletions(-)
> >> create mode 100644 meta/recipes-core/udev/udev-172/init
> >> create mode 100644 meta/recipes-core/udev/udev-172/local.rules
> >> create mode 100644 meta/recipes-core/udev/udev-172/permissions.rules
> >> create mode 100644 meta/recipes-core/udev/udev-172/run.rules
> >> create mode 100644 meta/recipes-core/udev/udev-172/udev.rules
> >> create mode 100644 meta/recipes-core/udev/udev_172.bb
> >
> > Meta-oe ha 171 it would be nice if you could look inti it and
> incorporate any differences into 172
> > Then we can retire 171 from meta-oe
>=20
> Meta-oe has had 172 since yesterday :) The main difference between the
> oe-core and meta-oe version is that the meta-oe version has removed a
> lot of udev rules that weren't needed and made booting slow. Where udev
> trigger used to take >8 seconds I can now boot X in less than a second
> on a cortex A9.
>=20
> regards,
>=20
> Koen

Great, then we can take meta-oe version of 172 into oe-core.

Thanks,
Nitin

> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


