Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1RsjeW-0002tV-Ie
	for openembedded-core@lists.openembedded.org;
	Thu, 02 Feb 2012 00:31:48 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 01 Feb 2012 15:23:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="105178038"
Received: from orsmsx604.amr.corp.intel.com ([10.22.226.87])
	by orsmga002.jf.intel.com with ESMTP; 01 Feb 2012 15:23:51 -0800
Received: from orsmsx102.amr.corp.intel.com (10.22.225.129) by
	orsmsx604.amr.corp.intel.com (10.22.226.87) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Wed, 1 Feb 2012 15:23:50 -0800
Received: from orsmsx106.amr.corp.intel.com ([169.254.5.31]) by
	ORSMSX102.amr.corp.intel.com ([169.254.1.146]) with mapi id
	14.01.0355.002; Wed, 1 Feb 2012 15:23:43 -0800
From: "Kamble, Nitin A" <nitin.a.kamble@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 7/8] linux-libc-headers: new recipes for
	latest upstream 3.2.2
Thread-Index: AQHM4S7/BEqw0r7iwk2Y3IzqG5k7j5YorfEw
Date: Wed, 1 Feb 2012 23:23:49 +0000
Message-ID: <ADD6A3980E8C39419A432FF422031B4C012FB24E@ORSMSX106.amr.corp.intel.com>
References: <cover.1328133261.git.nitin.a.kamble@intel.com>
	<6e7973add09749de3b14543fde53791076063657.1328133261.git.nitin.a.kamble@intel.com>
	<5c0971fd58af250c14b7eeaa3206e1b8c5bff840.1328133261.git.nitin.a.kamble@intel.com>
	<CAMKF1spB8Sji8p5ZY-czfLn44axDKNYUxgkb7PA2D-rNmVTfZw@mail.gmail.com>
In-Reply-To: <CAMKF1spB8Sji8p5ZY-czfLn44axDKNYUxgkb7PA2D-rNmVTfZw@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.22.254.140]
MIME-Version: 1.0
Subject: Re: [PATCH 7/8] linux-libc-headers: new recipes for latest upstream 3.2.2
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
X-List-Received-Date: Wed, 01 Feb 2012 23:31:48 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
> Khem Raj
> Sent: Wednesday, February 01, 2012 2:14 PM
> To: Patches and discussions about the oe-core layer
> Subject: Re: [OE-core] [PATCH 7/8] linux-libc-headers: new recipes for
> latest upstream 3.2.2
>=20
> On Wed, Feb 1, 2012 at 1:55 PM,  <nitin.a.kamble@intel.com> wrote:
> > +SRC_URI +=3D " file://connector-msg-size-fix.patch"
>=20
> I happen to peek into this patch. It seems this patch should not be
> applied
> since its specific to a wrs kernel and linux-yocto does not apply this
> patch
> as well.
>=20

This commit can also be kept out for now.

Nitin


> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


