Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1QqSD5-000094-Ac
	for openembedded-core@lists.openembedded.org;
	Mon, 08 Aug 2011 17:57:47 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 08 Aug 2011 08:53:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,337,1309762800"; d="scan'208";a="39190468"
Received: from orsmsx603.amr.corp.intel.com ([10.22.226.49])
	by fmsmga001.fm.intel.com with ESMTP; 08 Aug 2011 08:53:18 -0700
Received: from orsmsx606.amr.corp.intel.com (10.22.226.128) by
	orsmsx603.amr.corp.intel.com (10.22.226.49) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Mon, 8 Aug 2011 08:53:17 -0700
Received: from orsmsx504.amr.corp.intel.com ([10.22.226.207]) by
	orsmsx606.amr.corp.intel.com ([10.22.226.128]) with mapi;
	Mon, 8 Aug 2011 08:53:17 -0700
From: "Kamble, Nitin A" <nitin.a.kamble@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Mon, 8 Aug 2011 08:53:16 -0700
Thread-Topic: [OE-core] how to pass or set specific gcc flags?
Thread-Index: AcxVJLAeNY1JRkMkTkShSSQkfQ+ltwAvnK/g
Message-ID: <9DA5872FEF993D41B7173F58FCF6BE94DE904276@orsmsx504.amr.corp.intel.com>
References: <F410F4D8-44AB-45D2-9DB5-1122C8F47077@kernel.crashing.org>
In-Reply-To: <F410F4D8-44AB-45D2-9DB5-1122C8F47077@kernel.crashing.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
Subject: Re: how to pass or set specific gcc flags?
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
X-List-Received-Date: Mon, 08 Aug 2011 15:57:47 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Kumar,
Look at the meta/conf/machine/include/ia32/arch-ia32.inc where we have done=
 special flags passing to gcc & other tools.

Nitin


> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
> Kumar Gala
> Sent: Sunday, August 07, 2011 10:09 AM
> To: Patches and discussions about the oe-core layer
> Subject: [OE-core] how to pass or set specific gcc flags?
>=20
> We'd like to pass:
>=20
> --enable-targets=3Dall
>=20
> on ppc when we target a 64-bit platform but happen to build a 32-bit
> toolchain & rootfs, its useful to still have 64-bit support in the
> compiler to build a 64-bit kernel if desired in this scenario.  Also,
> this seems useful for the multilib situation.
>=20
> Wondering what the best way of doing this.  Adding something into the
> tune-ppcFOOBAR file but not sure how to do that so it gets picked up by
> the right toolchain pass.  And what do we even override?  I suggested
> adding a GCC_EXTRA_OECONF.
>=20
> - k
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


