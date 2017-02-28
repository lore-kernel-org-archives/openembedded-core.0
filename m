Return-Path: <bevenson@melinkcorp.com>
X-Greylist: delayed 924 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 28 Feb 2017 17:08:14 UTC
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
	(mail-sn1nam01on0092.outbound.protection.outlook.com [104.47.32.92])
	by mail.openembedded.org (Postfix) with ESMTP id 2721972FDB
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Feb 2017 17:08:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=Melink.onmicrosoft.com; s=selector1-melinkcorp-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=lScOdrAKQX+YfXCTEg08AfCEXFQwgmPDk+aHSNfgWXc=;
	b=hANDKSA2xs1AJ6bje3Sgt7EQwy0uj45jcldrfIO2rrzVUDlGhphxGTULUM7m/QtmjqE2WuYnyMOtFRRk6X9WRTr4Ux4zJZ/BK89iFCzBugYdTqMD9fYrhheZ35rVCzZDAAqyH6sUUX6zuA30H54hrdQGSGD+LBlICFtiwyT7S1Y=
Received: from DM5PR05MB2954.namprd05.prod.outlook.com (10.168.176.142) by
	DM5PR05MB2953.namprd05.prod.outlook.com (10.168.176.141) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
	15.1.947.2; Tue, 28 Feb 2017 16:52:50 +0000
Received: from DM5PR05MB2954.namprd05.prod.outlook.com ([10.168.176.142]) by
	DM5PR05MB2954.namprd05.prod.outlook.com ([10.168.176.142]) with mapi id
	15.01.0947.011; Tue, 28 Feb 2017 16:52:51 +0000
From: Bryan Evenson <bevenson@melinkcorp.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>, Patrick Ohly
	<patrick.ohly@intel.com>
Thread-Topic: [OE-core] how to *securely* do a remote install of an OE image?
Thread-Index: AQHSka1tCxh8Jjmr6kO1mUdAPsxvo6F+WNGAgAAwFwCAABPi0A==
Date: Tue, 28 Feb 2017 16:52:50 +0000
Message-ID: <DM5PR05MB295486F29DFC2932E5054801BB560@DM5PR05MB2954.namprd05.prod.outlook.com>
References: <alpine.LFD.2.20.1702280518430.30803@localhost.localdomain>
	<1488284875.7785.41.camel@intel.com>
	<alpine.LFD.2.20.1702281017230.5848@uk63952.mitel.com>
In-Reply-To: <alpine.LFD.2.20.1702281017230.5848@uk63952.mitel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=bevenson@melinkcorp.com; 
x-originating-ip: [98.100.91.242]
x-ms-office365-filtering-correlation-id: 0a337c84-8abb-46cd-4b59-08d45ffa3b75
x-microsoft-antispam: UriScan:;BCL:0;PCL:0;RULEID:(22001);SRVR:DM5PR05MB2953;
x-microsoft-exchange-diagnostics: 1; DM5PR05MB2953;
	7:MocfXMJ+E+G36yEWcXMIs5ycutAZxrsj3N2BdBc22sjRgTunq2WUj6u2cvvwkrEs5BsFRnsIlzNX+vHz8baUCVkP/05ylIW2KSqiTp3t9HVf+bbA/dDtuTq0SCEXYRjB3xxQBJwXp01VVXOP2qRxf23oluxH5q03oniqsbpZKVfxm43wXPh6ULG0f6VaC9AJIfOGUD8mcj706+6kLqBTef0rbInS+pYANe9ZDoGQtOBEf3xCTAjHzDLExDrWSIl3NRAI782OjMXAoKpOYqUdvUsJJi/w0ilQ5VhHSloXjdUrijepRj7HPHzHzNtd/Q4ajGJXRI+WgphTMvDszf2kjw==
x-microsoft-antispam-prvs: <DM5PR05MB2953D266692589EAE1868803BB560@DM5PR05MB2953.namprd05.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(158342451672863)(148322886591682)(31418570063057)(116415991822766)(264703809997249)(81160342030619)(126878219848629)(228905959029699);
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(6040375)(601004)(2401047)(8121501046)(5005006)(3002001)(10201501046)(6041248)(20161123558025)(20161123564025)(20161123562025)(20161123555025)(20161123560025)(6072148);
	SRVR:DM5PR05MB2953; BCL:0; PCL:0; RULEID:; SRVR:DM5PR05MB2953; 
x-forefront-prvs: 0232B30BBC
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(6009001)(7916002)(39450400003)(199003)(40224003)(189002)(24454002)(377454003)(13464003)(66066001)(50986999)(305945005)(7736002)(74316002)(54356999)(76176999)(229853002)(5660300001)(106116001)(105586002)(106356001)(7696004)(81166006)(53546006)(8936002)(4326008)(2950100002)(122556002)(92566002)(8676002)(2906002)(101416001)(81156014)(966004)(3280700002)(2900100001)(25786008)(102836003)(6116002)(3846002)(6436002)(1720100001)(6506006)(33656002)(53936002)(189998001)(6306002)(38730400002)(55016002)(53376002)(53386004)(77096006)(3660700001)(6246003)(9686003)(68736007)(99286003)(97736004)(86362001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DM5PR05MB2953;
	H:DM5PR05MB2954.namprd05.prod.outlook.com; FPR:; SPF:None;
	PTR:InfoNoRecords; A:1; MX:1; LANG:en; 
received-spf: None (protection.outlook.com: melinkcorp.com does not designate
	permitted sender hosts)
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-OriginatorOrg: melinkcorp.com
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Feb 2017 16:52:50.7085 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d06db0f9-efcc-42b5-9f8c-c934a01c9bfd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR05MB2953
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: how to *securely* do a remote install of an OE image?
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
X-List-Received-Date: Tue, 28 Feb 2017 17:08:15 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Robert,

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf
> Of Robert P. J. Day
> Sent: Tuesday, February 28, 2017 10:20 AM
> To: Patrick Ohly <patrick.ohly@intel.com>
> Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
> Subject: Re: [OE-core] how to *securely* do a remote install of an OE ima=
ge?
>=20
> On Tue, 28 Feb 2017, Patrick Ohly wrote:
>=20
> > For ssh keys, there's rootfsdebugfiles.bbclass. In local.conf:
> >
> > INHERIT +=3D "rootfsdebugfiles"
> > ROOTFS_DEBUG_FILES +=3D "/home/pohly/.ssh/id_rsa.pub
> ${IMAGE_ROOTFS}/home/root/.ssh/authorized_keys ;"
> >
> > This copies my id_rsa.pub into authorized_keys and thus let's me log
> > into images that I create via ssh.
>=20
>   this has definite potential, but i'm about to check whether the
> person/entity that builds the image vs. the person/entity that does the
> install vs. the person that eventually logs into the new system to finish
> setting up could potentially be different.
>=20
>   there's a *possibility* that remote installation might be done by a
> distributor, after which someone else might need to do the first login to
> finish the setup, which would complicate things immensely.

Are you talking about burning the initial image or firmware upgrade?  If yo=
u're talking about firmware upgrade, another possibility is that you could =
flip the direction of access.  Instead of remotely logging into each target=
 system, have the target systems remotely login to a centralized server.  T=
hat's the approach we took.  We burn the systems with the latest image, and=
 then when we assign them a serial number the system is given a set of SSH =
keys specific to that serial number.  That set of SSH keys is then used to =
access the centralized server and obtain the latest firmware.  With this me=
thod there's no need to login to the target system, so you can lock it down=
 as much as you want.

Regards,
Bryan

>=20
>   i don't know that this is what will happen, but i'm about to run off an=
d ask
> about possibilities.
>=20
> rday
>=20
> --
>=20
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> Robert P. J. Day                                 Ottawa, Ontario, CANADA
>                         http://crashcourse.ca
>=20
> Twitter:                                       http://twitter.com/rpjday
> LinkedIn:                               http://ca.linkedin.com/in/rpjday
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

