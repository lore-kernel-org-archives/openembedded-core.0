Return-Path: <Lauren.Post@freescale.com>
Received: from na01-bl2-obe.outbound.protection.outlook.com
	(mail-bl2lp0208.outbound.protection.outlook.com [207.46.163.208])
	by mail.openembedded.org (Postfix) with ESMTP id C599460C02
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Mar 2014 14:55:46 +0000 (UTC)
Received: from BLUPR03MB133.namprd03.prod.outlook.com (10.255.212.11) by
	BLUPR03MB136.namprd03.prod.outlook.com (10.255.212.27) with Microsoft
	SMTP Server (TLS) id 15.0.898.11; Wed, 26 Mar 2014 14:55:40 +0000
Received: from BLUPR03MB133.namprd03.prod.outlook.com ([169.254.2.26]) by
	BLUPR03MB133.namprd03.prod.outlook.com ([169.254.2.26]) with mapi id
	15.00.0898.005; Wed, 26 Mar 2014 14:55:40 +0000
From: Lauren Post <Lauren.Post@freescale.com>
To: Martin Jansa <martin.jansa@gmail.com>
Thread-Topic: [OE-core] [PATCH 00/11] Change all bluez4 references to
	virtual/bluez
Thread-Index: AQHPSQFPrpk+pZeBmUiroZ0FDSypiZrzc5oAgAAAN7A=
Date: Wed, 26 Mar 2014 14:55:39 +0000
Message-ID: <095008fe2ed740a08d0920492be3eb8d@BLUPR03MB133.namprd03.prod.outlook.com>
References: <lauren.post@freescale.com>
	<1395844085-9929-1-git-send-email-lauren.post@freescale.com>
	<20140326145102.GB3709@jama>
In-Reply-To: <20140326145102.GB3709@jama>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [192.88.168.50]
x-forefront-prvs: 0162ACCC24
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009001)(6009001)(428001)(189002)(199002)(24454002)(51704005)(85852003)(4396001)(77096001)(85306002)(95666003)(54316002)(98676001)(80976001)(76786001)(76796001)(74662001)(76576001)(94946001)(31966008)(79102001)(77982001)(56776001)(93516002)(59766001)(92566001)(47736001)(83072002)(2656002)(46102001)(90146001)(74366001)(74502001)(50986001)(56816005)(81542001)(74316001)(87266001)(33646001)(97186001)(53806001)(51856001)(74706001)(97336001)(87936001)(81816001)(81686001)(69226001)(47446002)(94316002)(47976001)(20776003)(49866001)(86362001)(95416001)(63696002)(65816001)(74876001)(93136001)(83322001)(81342001)(54356001)(76482001)(66066001)(80022001)(24736002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BLUPR03MB136;
	H:BLUPR03MB133.namprd03.prod.outlook.com;
	FPR:6DD5F135.A0CEFD83.B9F855C6.46E80AE1.201CD; MLV:sfv;
	PTR:InfoNoRecords; MX:1; A:1; LANG:en; 
received-spf: None (: freescale.com does not designate permitted sender hosts)
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 00/11] Change all bluez4 references to virtual/bluez
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 26 Mar 2014 14:55:48 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 26, 2014 at 09:27:54AM -0500, Lauren Post wrote:
> This group of patches support the change of hardcoded bluez4 to=20
> virtual/bluez so that the upgrade to bluez5 is easier.
>=20
> This group of patches must be applied together.  Bluez4 is still=20
> default provider but it will be easier to override and provide bluez5=20
> support in future.
>=20

> virtual/* still doesn't work correctly in runtime variables, use VIRTUAL-=
RUNTIME_bluez variable.

> Last time I've asked for bluez4->bluez5 upgrade path fix on target I was =
told that it's not supported and
> uez5 isn't drop-in replacement for
> bluez4 (yet), did that change already?

We are using bluez5.8 and have bbappends for all these components I patched=
.  I just thought it would be easier to upstream rather than maintain all t=
hese bbappends. =20

I missed the bluez5 change to virtual/bluez so will submit that once I rebu=
ild with bluez5 as preferred provider on master.=20

Lauren

