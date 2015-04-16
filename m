Return-Path: <bevenson@melinkcorp.com>
Received: from na01-by2-obe.outbound.protection.outlook.com
	(mail-by2on0142.outbound.protection.outlook.com [207.46.100.142])
	by mail.openembedded.org (Postfix) with ESMTP id 7491365CAC
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Apr 2015 21:05:30 +0000 (UTC)
Received: from BN3PR0501MB1091.namprd05.prod.outlook.com (25.160.113.13) by
	BN3PR0501MB1363.namprd05.prod.outlook.com (25.160.183.28) with
	Microsoft SMTP
	Server (TLS) id 15.1.136.25; Thu, 16 Apr 2015 21:05:31 +0000
Received: from BN3PR0501MB1090.namprd05.prod.outlook.com (25.160.113.12) by
	BN3PR0501MB1091.namprd05.prod.outlook.com (25.160.113.13) with
	Microsoft SMTP
	Server (TLS) id 15.1.136.25; Thu, 16 Apr 2015 21:05:29 +0000
Received: from BN3PR0501MB1090.namprd05.prod.outlook.com ([25.160.113.12]) by
	BN3PR0501MB1090.namprd05.prod.outlook.com ([25.160.113.12]) with
	mapi id 15.01.0136.026; Thu, 16 Apr 2015 21:05:29 +0000
From: Bryan Evenson <bevenson@melinkcorp.com>
To: Martin Jansa <martin.jansa@gmail.com>
Thread-Topic: [OE-core] sysvinit upgrade woes
Thread-Index: AdB2xX/0SWNQQOrTTmqRDk7i+oHZ/QBheQogAAjRzoAAAPqRAAABnZQAAAPUddA=
Date: Thu, 16 Apr 2015 21:05:29 +0000
Message-ID: <BN3PR0501MB1090A14145E6D5DA5A8DADCFBBE40@BN3PR0501MB1090.namprd05.prod.outlook.com>
References: <BN3PR0501MB10906F787AE8EB17CD7558C6BBE60@BN3PR0501MB1090.namprd05.prod.outlook.com>
	<BN3PR0501MB1090F9B31066CC3E7AB72B5EBBE40@BN3PR0501MB1090.namprd05.prod.outlook.com>
	<3282189.xUS47EJLep@peggleto-mobl.ger.corp.intel.com>
	<BN3PR0501MB109029A875F2A8868C2A9CF0BBE40@BN3PR0501MB1090.namprd05.prod.outlook.com>
	<20150416191048.GB2341@jama>
In-Reply-To: <20150416191048.GB2341@jama>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-vipre-scanned: 01FF30E90099F201FF3236
authentication-results: gmail.com; dkim=none (message not signed)
	header.d=none;
x-originating-ip: [98.100.91.242]
x-microsoft-antispam: UriScan:; BCL:0; PCL:0; RULEID:; SRVR:BN3PR0501MB1091;
	UriScan:; BCL:0; PCL:0; RULEID:; SRVR:BN3PR0501MB1363; 
x-microsoft-antispam-prvs: <BN3PR0501MB1091578E1018283BA6D5528DBBE40@BN3PR0501MB1091.namprd05.prod.outlook.com>
x-forefront-antispam-report: BMV:1; SFV:NSPM;
	SFS:(10019020)(6009001)(51704005)(164054003)(13464003)(377454003)(24454002)(93886004)(102836002)(15975445007)(99286002)(2950100001)(2900100001)(2656002)(74316001)(110136001)(33656002)(92566002)(87936001)(46102003)(66066001)(1720100001)(76576001)(62966003)(54356999)(76176999)(40100003)(50986999)(77156002)(19580405001)(19580395003)(86362001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BN3PR0501MB1091;
	H:BN3PR0501MB1090.namprd05.prod.outlook.com; FPR:; SPF:None;
	MLV:sfv; LANG:en; 
x-exchange-antispam-report-test: UriScan:;
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(601004)(5005006)(5002010); SRVR:BN3PR0501MB1091; BCL:0;
	PCL:0; RULEID:; SRVR:BN3PR0501MB1091; 
x-forefront-prvs: 0548586081
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Apr 2015 21:05:29.1159 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d06db0f9-efcc-42b5-9f8c-c934a01c9bfd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN3PR0501MB1091
X-OriginatorOrg: melinkcorp.com
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	"openembedded-core@lists.openembedded.org"
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
X-List-Received-Date: Thu, 16 Apr 2015 21:05:31 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Martin and Paul,

> -----Original Message-----
> From: Martin Jansa [mailto:martin.jansa@gmail.com]
> Sent: Thursday, April 16, 2015 3:11 PM
> To: Bryan Evenson
> Cc: Paul Eggleton; openembedded-core@lists.openembedded.org
> Subject: Re: [OE-core] sysvinit upgrade woes
>=20
> On Thu, Apr 16, 2015 at 06:42:58PM +0000, Bryan Evenson wrote:
> > Paul,
> >
> > > -----Original Message-----
> > > From: Paul Eggleton [mailto:paul.eggleton@linux.intel.com]
> > > Sent: Thursday, April 16, 2015 1:57 PM
> > > To: Bryan Evenson
> > > Cc: openembedded-core@lists.openembedded.org
> > > Subject: Re: [OE-core] sysvinit upgrade woes
> > >
> > > Hi Bryan,
> > >
> > > On Thursday 16 April 2015 13:53:14 Bryan Evenson wrote:
> > > > > -----Original Message-----
> > > > > From: openembedded-core-bounces@lists.openembedded.org
> > > > > [mailto:openembedded-core-bounces@lists.openembedded.org] On
> > > Behalf
> > > > > Of Bryan Evenson
> > > > > Sent: Tuesday, April 14, 2015 11:26 AM
> > > > > To: openembedded-core@lists.openembedded.org
> > > > > Subject: [OE-core] sysvinit upgrade woes
> > > > >
> > > > > I am using opkg for package management and sysvinit for init.  I =
am
> > > > > testing a large jump on an upgrade and I have been having a few
> issues.
> > > > > One issue I have traced to sysvinit's upgrade, but I'm unsure how=
 to
> > > > > remedy the solution.
> > > > >
> > > > > At some point during the upgrade process, opkg records what the
> new
> > > > > version is of all the packages getting installed.  However, when =
I
> > > > > upgrade sysvinit causes sysvinit to restart before opkg has recor=
ded
> > > > > which packages were just installed.  So opkg thinks that it didn'=
t
> > > > > upgrade anything even though all packages were upgraded.  I verif=
ied
> > > > > that if I call "opkg upgrade" for all packages that require upgra=
de
> > > > > except for sysvinit that opkg correctly records which packages we=
re
> > > > > upgraded.  However, the end user doesn't have that kind of contro=
l,
> > > > > so upgrading in this manner is not an option.
> > > > >
> > > > > Has anyone else seen a similar issue?  Any ideas on how to hold o=
ff
> > > > > sysvinit from restarting until after opkg has finished recording =
its
> > > > > information?
> > > >
> > > > I've found the problem but don't yet have a good solution.  At the =
end
> > > > of the sysvinit-inittab pkg_postinst script is the line:
> > > >
> > > > 	kill -HUP 1
> > > >
> > > > This kills init before opkg has finished doing its job.  On my syst=
em,
> > > > I've added a .bbappend with a pk_postinst script as follows for ite=
ms
> > > > that require a reboot after installation:
> > > >
> > > >     touch /var/run/reboot-required
> > > >     echo "${PN}" >>/var/run/reboot-required.pkgs
> > > >
> > > > After my system performs firmware upgrade, it checks if
> > > > /var/run/reboot-required exists and then reboots the system.  So on
> my
> > > > system, I changed the pkg_postinst script for sysvinit-inittab to
> > > > replace the "kill -HUP 1" with the reboot required notations.
> > > >
> > > > Is there some suitable solution that would be reasonable to change =
in
> > > > the sysvinit-inittab recipe that would work for other people?
> > >
> > > SIGHUP is supposed to make sysvinit re-read inittab, not kill it. Can=
 you
> tell
> > > what is actually happening?
> >
> > Ah, I don't know for sure what is happening but now I have a different
> guess.  I have tried running the upgrade with "opkg -V4 upgrade" (insanel=
y
> verbose debug output) and I can tell that is doing the postinst scripts w=
hen
> the upgrade stops and I get logged out.  I am doing my testing through th=
e
> debug serial port on my system.  My best guess without further proof is t=
hat
> the SIGHUP restarts my terminal which in turn kills "opkg upgrade" which =
was
> commanded through my terminal.
> >
> > If that is what is happening, then the upgrade should continue normally=
 if I
> send it to the background ("opkg upgrade &"), correct?  Or it would run j=
ust
> fine if a cron job started the upgrade?
>=20
> You can also run it in GNU screen session to verify this. I remember
> seeing this behavior couple years ago and I prefer screen since then
> (also for using the same screen after you set the network over serial
> cable and then want to continue in the same shell but over network).
>=20

I first tried sending the upgrade to the background ("opkg upgrade &"), sti=
ll logged in through my debug terminal, and it failed in the same manner.  =
I then tried using a cron job to do the firmware upgrade and that worked; o=
pkg finished and correctly recorded which packages were installed.  Since i=
ts only an issue if you are issuing the upgrade from a serial terminal, I d=
on't know if it is worth changing anything.

Thanks,
Bryan

> > > Cheers,
> > > Paul
> > >
> > > --
> > >
> > > Paul Eggleton
> > > Intel Open Source Technology Centre
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
>=20
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

