Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1SPOjm-0004L0-2x
	for openembedded-core@lists.openembedded.org;
	Wed, 02 May 2012 03:52:14 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 01 May 2012 18:42:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="160706917"
Received: from orsmsx604.amr.corp.intel.com ([10.22.226.87])
	by fmsmga002.fm.intel.com with ESMTP; 01 May 2012 18:42:28 -0700
Received: from orsmsx105.amr.corp.intel.com (10.22.225.132) by
	orsmsx604.amr.corp.intel.com (10.22.226.87) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Tue, 1 May 2012 18:42:28 -0700
Received: from orsmsx106.amr.corp.intel.com ([169.254.5.126]) by
	ORSMSX105.amr.corp.intel.com ([169.254.4.173]) with mapi id
	14.01.0355.002; Tue, 1 May 2012 18:42:28 -0700
From: "Kamble, Nitin A" <nitin.a.kamble@intel.com>
To: Saul Wold <sgw@linux.intel.com>, Patches and discussions about the oe-core
	layer <openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 4/6] gdb: upgrade from 7.4 to 7.4.1
Thread-Index: AQHNJ+Xm4Yb8cHSVwEKAuzq+Ejm7CZa2Jr6A//+SsPA=
Date: Wed, 2 May 2012 01:42:27 +0000
Message-ID: <ADD6A3980E8C39419A432FF422031B4C030A5341@ORSMSX106.amr.corp.intel.com>
References: <b0d5193248111699e406cf352793898293bc2f89.1335909595.git.nitin.a.kamble@intel.com>
	<5d131cb45b8cb298fda838defe6d5eaed0c15919.1335909595.git.nitin.a.kamble@intel.com>
	<4FA089E9.10509@linux.intel.com>
In-Reply-To: <4FA089E9.10509@linux.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.22.254.138]
MIME-Version: 1.0
Subject: Re: [PATCH 4/6] gdb: upgrade from 7.4 to 7.4.1
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
X-List-Received-Date: Wed, 02 May 2012 01:52:14 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> > -SRC_URI[md5sum] =3D "7877875c8af7c7ef7d06d329ac961d3f"
> > -SRC_URI[sha256sum] =3D
> "e2c18e2f4a5feab897595455a3d623cebbba9e9dd2dbe9a5510ed7ad43ae01d2"
> > +SRC_URI[md5sum] =3D "5fb7fca9ef7a9e3cfee0e2f2c0e52051"
> > +SRC_URI[sha256sum] =3D
> "f99d2be831ead324712ae4f11868e07e545272f10aac4186060f1386f2629b3"
> >
> Got a WARNING here and the checksum is wrong.
>=20
> Sau!

It was a cut/paste error, the sha256sum is one digit short. Somehow it did =
not raise error on my build.

I will fix the issue and send it along with other commits.

Nitin



