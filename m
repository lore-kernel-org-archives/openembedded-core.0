Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cristian.iorga@intel.com>) id 1TtNPD-0007E1-KI
	for openembedded-core@lists.openembedded.org;
	Thu, 10 Jan 2013 20:03:19 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 10 Jan 2013 10:46:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,446,1355126400"; d="scan'208";a="244766345"
Received: from irsmsx101.ger.corp.intel.com ([163.33.3.153])
	by orsmga001.jf.intel.com with ESMTP; 10 Jan 2013 10:47:29 -0800
Received: from irsmsx102.ger.corp.intel.com ([169.254.2.95]) by
	IRSMSX101.ger.corp.intel.com ([169.254.1.13]) with mapi id
	14.01.0355.002; Thu, 10 Jan 2013 18:47:27 +0000
From: "Iorga, Cristian" <cristian.iorga@intel.com>
To: Martin Jansa <martin.jansa@gmail.com>, "Burton, Ross"
	<ross.burton@intel.com>
Thread-Topic: [OE-core] [PATCH] connman: upgrade to 1.10
Thread-Index: AQHN7oxxxi0xp9BDFE6xsoeD6eNchZhBRF8AgADh8MCAAAyXAIAAERUAgACkWtA=
Date: Thu, 10 Jan 2013 18:47:26 +0000
Message-ID: <969F26A8BAB325438E7EB80D3C3134FB161DCAA5@IRSMSX102.ger.corp.intel.com>
References: <1357751495-28236-1-git-send-email-cristian.iorga@intel.com>
	<CAJTo0LZwxy0E-ODr61YK4T9Qn+jkqqsPeW06vm8O7pmE-cMAfg@mail.gmail.com>
	<969F26A8BAB325438E7EB80D3C3134FB161DC46C@IRSMSX102.ger.corp.intel.com>
	<7782F5CBD39246A3A6204E6FE729FD71@intel.com>
	<20130110085738.GT3722@jama.palm1.palmone.com>
In-Reply-To: <20130110085738.GT3722@jama.palm1.palmone.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [163.33.239.180]
MIME-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] connman: upgrade to 1.10
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 10 Jan 2013 19:03:20 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello all,
In SIGGEN_EXCLUDERECIPES_ABISAFE only connman-conf needs to be added, or co=
nnman + connman-conf? (see my V2 patch for connman 1.10 upgrade)

Regards,
Cristian

-----Original Message-----
From: Martin Jansa [mailto:martin.jansa@gmail.com]=20
Sent: Thursday, January 10, 2013 10:58 AM
To: Burton, Ross
Cc: Iorga, Cristian; openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] connman: upgrade to 1.10

On Thu, Jan 10, 2013 at 07:56:30AM +0000, Ross Burton wrote:
> On Thursday, 10 January 2013 at 07:15, Iorga, Cristian wrote:
> > Well, I have the prior art stand by me.
> > The same technique is applied for netbase.
> >=20
> > And, in this specific case, connman should be machine specific.
> > Can you please give me more detail?
> >=20
> > The configuration file will have only the interface blacklist enabled i=
n case of a qemu* machine.
> netbase is a lot smaller than connman. =20

and also listed in SIGGEN_EXCLUDERECIPES_ABISAFE

>With this change you're rebuilding connman per-machine instead of sharing =
the package between compatible machines, with the only difference being a c=
onfiguration file.

And rebuilding also all stuff depending on connman.

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com


