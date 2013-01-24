Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <emilia.maria.silvia.ciobanu@intel.com>)
	id 1TyNlN-000313-0I for openembedded-core@lists.openembedded.org;
	Thu, 24 Jan 2013 15:26:45 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 24 Jan 2013 06:11:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,529,1355126400"; d="scan'208";a="194707074"
Received: from irsmsx102.ger.corp.intel.com ([163.33.3.155])
	by AZSMGA002.ch.intel.com with ESMTP; 24 Jan 2013 06:11:10 -0800
Received: from irsmsx151.ger.corp.intel.com (163.33.192.59) by
	IRSMSX102.ger.corp.intel.com (163.33.3.155) with Microsoft SMTP Server
	(TLS) id 14.1.355.2; Thu, 24 Jan 2013 14:11:03 +0000
Received: from irsmsx102.ger.corp.intel.com ([169.254.2.82]) by
	IRSMSX151.ger.corp.intel.com ([169.254.4.144]) with mapi id
	14.01.0355.002; Thu, 24 Jan 2013 14:11:03 +0000
From: "Ciobanu, Emilia Maria Silvia" <emilia.maria.silvia.ciobanu@intel.com>
To: Martin Jansa <martin.jansa@gmail.com>
Thread-Topic: [OE-core] Meta-web-kiosk Layer
Thread-Index: Ac36KwkedgWuxsgKTRCww92yjPskEQABVniAAAIntosAAFJ8gAAAkw8B
Date: Thu, 24 Jan 2013 14:11:02 +0000
Message-ID: <985E5BBDA0968D48ABDF343456A521B3F130C1@IRSMSX102.ger.corp.intel.com>
References: <985E5BBDA0968D48ABDF343456A521B3F1301C@IRSMSX102.ger.corp.intel.com>
	<20130124124319.GC3012@jama>
	<985E5BBDA0968D48ABDF343456A521B3F13082@IRSMSX102.ger.corp.intel.com>,
	<20130124135415.GE3012@jama>
In-Reply-To: <20130124135415.GE3012@jama>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.3.86.135]
MIME-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: Meta-web-kiosk Layer
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
X-List-Received-Date: Thu, 24 Jan 2013 14:26:45 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Updated the repository.=0A=
________________________________________=0A=
From: Martin Jansa [martin.jansa@gmail.com]=0A=
Sent: Thursday, January 24, 2013 3:54 PM=0A=
To: Ciobanu, Emilia Maria Silvia=0A=
Cc: openembedded-core@lists.openembedded.org=0A=
Subject: Re: [OE-core] Meta-web-kiosk Layer=0A=
=0A=
On Thu, Jan 24, 2013 at 01:46:04PM +0000, Ciobanu, Emilia Maria Silvia wrot=
e:=0A=
> Hi,=0A=
>=0A=
> I've updated the repository with the dependencies changes.=0A=
=0A=
Great, thank you.=0A=
=0A=
I'm not sure if this settings will work for everybody, maybe some other=0A=
default config or generate that from some variables in recipe (easier to=0A=
override from distro).=0A=
=0A=
http://git.yoctoproject.org/cgit/cgit.cgi/meta-web-kiosk/tree/recipes-brows=
er/midori-session/files/config=0A=
default-encoding=3DISO-8859-1=0A=
http-proxy=3Dhttps://proxy-ir.intel.com=0A=
http-proxy-port=3D911=0A=
=0A=
Cheers,=0A=
=0A=
>=0A=
> Thanks,=0A=
> Ema=0A=
> ________________________________________=0A=
> From: Martin Jansa [martin.jansa@gmail.com]=0A=
> Sent: Thursday, January 24, 2013 2:43 PM=0A=
> To: Ciobanu, Emilia Maria Silvia=0A=
> Cc: openembedded-core@lists.openembedded.org=0A=
> Subject: Re: [OE-core] Meta-web-kiosk Layer=0A=
>=0A=
> On Thu, Jan 24, 2013 at 12:05:00PM +0000, Ciobanu, Emilia Maria Silvia wr=
ote:=0A=
> > Hi,=0A=
> >=0A=
> > I've created a new layer that can be used for kiosk devices.=0A=
> > You can check it out at:=0A=
> >     http://git.yoctoproject.org/cgit/cgit.cgi/meta-web-kiosk/=0A=
> >=0A=
> > It contains a new bitbake target that automatically=0A=
> > starts a web browser right after boot and enables the=0A=
> > use of a virtual keyboard if there is support for it.=0A=
> >=0A=
> > The layer currently includes recipes for the web browser,=0A=
> > and bsp configurations.=0A=
> >=0A=
> > I'm open to receiving feedback, patches and any suggestions.=0A=
>=0A=
> Why not add dependency on meta-openembedded/meta-oe and meta-gnome?=0A=
>=0A=
> At least 4 duplicated recipes could be removed and newer midori from=0A=
> meta-gnome would be used:=0A=
>=0A=
> OE @ ~/meta-openembedded $ find . -name ca-certificates_\*=0A=
> ./meta-oe/recipes-support/ca-certificates/ca-certificates_20120623.bb=0A=
> OE @ ~/meta-openembedded $ find . -name vala_\*=0A=
> ./meta-oe/recipes-devtools/vala/vala_0.16.0.bb=0A=
> OE @ ~/meta-openembedded $ find . -name midori_\*=0A=
> ./meta-gnome/recipes-connectivity/midori/midori_0.4.7.bb=0A=
> OE @ ~/meta-openembedded $ find . -name python-docutils_\*=0A=
> ./meta-oe/recipes-devtools/python/python-docutils_0.5.bb=0A=
>=0A=
> Cheers,=0A=
>=0A=
> --=0A=
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com=0A=
=0A=
--=0A=
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com=0A=


