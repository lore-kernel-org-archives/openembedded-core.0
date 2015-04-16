Return-Path: <bevenson@melinkcorp.com>
Received: from na01-bn1-obe.outbound.protection.outlook.com
	(mail-bn1on0119.outbound.protection.outlook.com [157.56.110.119])
	by mail.openembedded.org (Postfix) with ESMTP id 045D1736BA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Apr 2015 18:42:59 +0000 (UTC)
Received: from BN3PR0501MB1090.namprd05.prod.outlook.com (25.160.113.12) by
	BN3PR0501MB1090.namprd05.prod.outlook.com (25.160.113.12) with
	Microsoft SMTP
	Server (TLS) id 15.1.136.25; Thu, 16 Apr 2015 18:42:58 +0000
Received: from BN3PR0501MB1090.namprd05.prod.outlook.com ([25.160.113.12]) by
	BN3PR0501MB1090.namprd05.prod.outlook.com ([25.160.113.12]) with
	mapi id 15.01.0136.026; Thu, 16 Apr 2015 18:42:58 +0000
From: Bryan Evenson <bevenson@melinkcorp.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Thread-Topic: [OE-core] sysvinit upgrade woes
Thread-Index: AdB2xX/0SWNQQOrTTmqRDk7i+oHZ/QBheQogAAjRzoAAAPqRAA==
Date: Thu, 16 Apr 2015 18:42:58 +0000
Message-ID: <BN3PR0501MB109029A875F2A8868C2A9CF0BBE40@BN3PR0501MB1090.namprd05.prod.outlook.com>
References: <BN3PR0501MB10906F787AE8EB17CD7558C6BBE60@BN3PR0501MB1090.namprd05.prod.outlook.com>
	<BN3PR0501MB1090F9B31066CC3E7AB72B5EBBE40@BN3PR0501MB1090.namprd05.prod.outlook.com>
	<3282189.xUS47EJLep@peggleto-mobl.ger.corp.intel.com>
In-Reply-To: <3282189.xUS47EJLep@peggleto-mobl.ger.corp.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-vipre-scanned: 017CB2A30099EC017CB3F0
authentication-results: linux.intel.com; dkim=none (message not signed)
	header.d=none;
x-originating-ip: [98.100.91.242]
x-microsoft-antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:BN3PR0501MB1090;
x-microsoft-antispam-prvs: <BN3PR0501MB1090EBF06FF4861501A890EFBBE40@BN3PR0501MB1090.namprd05.prod.outlook.com>
x-forefront-antispam-report: BMV:1; SFV:NSPM;
	SFS:(10019020)(6009001)(13464003)(377454003)(51704005)(164054003)(24454002)(19580405001)(66066001)(2900100001)(50986999)(2950100001)(54356999)(86362001)(76176999)(19580395003)(102836002)(40100003)(99286002)(77156002)(62966003)(33656002)(46102003)(87936001)(74316001)(2656002)(92566002)(76576001)(110136001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BN3PR0501MB1090;
	H:BN3PR0501MB1090.namprd05.prod.outlook.com; FPR:; SPF:None;
	MLV:sfv; LANG:en; 
x-exchange-antispam-report-test: UriScan:;
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(601004)(5005006)(5002010); SRVR:BN3PR0501MB1090; BCL:0;
	PCL:0; RULEID:; SRVR:BN3PR0501MB1090; 
x-forefront-prvs: 0548586081
MIME-Version: 1.0
X-OriginatorOrg: melinkcorp.com
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Apr 2015 18:42:58.6496 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d06db0f9-efcc-42b5-9f8c-c934a01c9bfd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN3PR0501MB1090
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: sysvinit upgrade woes
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
X-List-Received-Date: Thu, 16 Apr 2015 18:43:00 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Paul,

> -----Original Message-----
> From: Paul Eggleton [mailto:paul.eggleton@linux.intel.com]
> Sent: Thursday, April 16, 2015 1:57 PM
> To: Bryan Evenson
> Cc: openembedded-core@lists.openembedded.org
> Subject: Re: [OE-core] sysvinit upgrade woes
>=20
> Hi Bryan,
>=20
> On Thursday 16 April 2015 13:53:14 Bryan Evenson wrote:
> > > -----Original Message-----
> > > From: openembedded-core-bounces@lists.openembedded.org
> > > [mailto:openembedded-core-bounces@lists.openembedded.org] On
> Behalf
> > > Of Bryan Evenson
> > > Sent: Tuesday, April 14, 2015 11:26 AM
> > > To: openembedded-core@lists.openembedded.org
> > > Subject: [OE-core] sysvinit upgrade woes
> > >
> > > I am using opkg for package management and sysvinit for init.  I am
> > > testing a large jump on an upgrade and I have been having a few issue=
s.
> > > One issue I have traced to sysvinit's upgrade, but I'm unsure how to
> > > remedy the solution.
> > >
> > > At some point during the upgrade process, opkg records what the new
> > > version is of all the packages getting installed.  However, when I
> > > upgrade sysvinit causes sysvinit to restart before opkg has recorded
> > > which packages were just installed.  So opkg thinks that it didn't
> > > upgrade anything even though all packages were upgraded.  I verified
> > > that if I call "opkg upgrade" for all packages that require upgrade
> > > except for sysvinit that opkg correctly records which packages were
> > > upgraded.  However, the end user doesn't have that kind of control,
> > > so upgrading in this manner is not an option.
> > >
> > > Has anyone else seen a similar issue?  Any ideas on how to hold off
> > > sysvinit from restarting until after opkg has finished recording its
> > > information?
> >
> > I've found the problem but don't yet have a good solution.  At the end
> > of the sysvinit-inittab pkg_postinst script is the line:
> >
> > 	kill -HUP 1
> >
> > This kills init before opkg has finished doing its job.  On my system,
> > I've added a .bbappend with a pk_postinst script as follows for items
> > that require a reboot after installation:
> >
> >     touch /var/run/reboot-required
> >     echo "${PN}" >>/var/run/reboot-required.pkgs
> >
> > After my system performs firmware upgrade, it checks if
> > /var/run/reboot-required exists and then reboots the system.  So on my
> > system, I changed the pkg_postinst script for sysvinit-inittab to
> > replace the "kill -HUP 1" with the reboot required notations.
> >
> > Is there some suitable solution that would be reasonable to change in
> > the sysvinit-inittab recipe that would work for other people?
>=20
> SIGHUP is supposed to make sysvinit re-read inittab, not kill it. Can you=
 tell
> what is actually happening?

Ah, I don't know for sure what is happening but now I have a different gues=
s.  I have tried running the upgrade with "opkg -V4 upgrade" (insanely verb=
ose debug output) and I can tell that is doing the postinst scripts when th=
e upgrade stops and I get logged out.  I am doing my testing through the de=
bug serial port on my system.  My best guess without further proof is that =
the SIGHUP restarts my terminal which in turn kills "opkg upgrade" which wa=
s commanded through my terminal.

If that is what is happening, then the upgrade should continue normally if =
I send it to the background ("opkg upgrade &"), correct?  Or it would run j=
ust fine if a cron job started the upgrade?

Thanks,
Bryan

>=20
> Cheers,
> Paul
>=20
> --
>=20
> Paul Eggleton
> Intel Open Source Technology Centre

