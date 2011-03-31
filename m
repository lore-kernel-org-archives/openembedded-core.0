Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1Q5LgD-0004bG-0c
	for openembedded-core@lists.openembedded.org;
	Thu, 31 Mar 2011 19:29:09 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 31 Mar 2011 10:27:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.63,276,1299484800"; d="scan'208";a="673817090"
Received: from orsmsx604.amr.corp.intel.com ([10.22.226.87])
	by fmsmga002.fm.intel.com with ESMTP; 31 Mar 2011 10:27:05 -0700
Received: from orsmsx605.amr.corp.intel.com (10.22.226.10) by
	orsmsx604.amr.corp.intel.com (10.22.226.87) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Thu, 31 Mar 2011 10:27:03 -0700
Received: from orsmsx504.amr.corp.intel.com ([10.22.226.207]) by
	orsmsx605.amr.corp.intel.com ([10.22.226.10]) with mapi;
	Thu, 31 Mar 2011 10:27:03 -0700
From: "Kamble, Nitin A" <nitin.a.kamble@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 31 Mar 2011 10:27:02 -0700
Thread-Topic: [OE-core] ldconfig-native is not endian safe
Thread-Index: AcvvkBxxRge+fJ/ySuyp0Lf2dXc6BgAOIHSg
Message-ID: <9DA5872FEF993D41B7173F58FCF6BE945111C624@orsmsx504.amr.corp.intel.com>
References: <1301496447.24596.100.camel@rex> <4D934FBC.40802@windriver.com>
	<9DA5872FEF993D41B7173F58FCF6BE94510B849E@orsmsx504.amr.corp.intel.com>
	<9DA5872FEF993D41B7173F58FCF6BE94510B84A7@orsmsx504.amr.corp.intel.com>	,
	<9DA5872FEF993D41B7173F58FCF6BE94510B84B1@orsmsx504.amr.corp.intel.com>
	<A1E6FA6F-3108-4E38-8E8F-2F231E6E1685@windriver.com>
	<1301568031.24596.104.camel@rex>
In-Reply-To: <1301568031.24596.104.camel@rex>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
Subject: Re: ldconfig-native is not endian safe
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
X-List-Received-Date: Thu, 31 Mar 2011 17:29:09 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
> Richard Purdie
> Sent: Thursday, March 31, 2011 3:41 AM
> To: Patches and discussions about the oe-core layer
> Subject: Re: [OE-core] lconfig-native is not endian safe
>=20
> On Thu, 2011-03-31 at 09:02 +0000, Hatle, Mark wrote:
> > My opinion is to avoid it vs run in a qemu shell.  I really don't
> like
> > being forced to have qemu to run a build of any type.
>=20
> Agreed, I think we can avoid this.
>=20
> For reference, I have half he endian problem resolved with:
>=20
> http://git.yoctoproject.org/cgit.cgi/poky-
> contrib/commit/?h=3Drpurdie/gcc-
> sharedwork&id=3D0711c7c065c6e1caa04f452069d08a056c3caabe
>=20
> which handles reading in the data from the elf files in an endian safe
> way. Someone needs to go through and change the dl cache file handling
> code to be endian safe though, then compare the result with a file
> generated on a target device.
>=20
> Cheers,
>=20
> Richard
>=20

Richard,
  I upgraded ldconfig-native to 2.12.1 ( our eglibc version), I rebased you=
r patch to it, and will implement rest of the endianness handling code.
Thanks,
Nitin

>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


